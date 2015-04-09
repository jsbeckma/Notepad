#include "notepad.h"
#include "ui_notepad.h"
//#include "3rdparty/NotepadLib/include/notepadlib.h"

#include <QFileDialog>
#include <QFile>
#include <QMessageBox>
#include <QTextStream>

Notepad::Notepad(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::Notepad)
{
    ui->setupUi(this);
    //NotepadLib nl;
    //QMessageBox::critical(this, tr("NotepadLib"), tr("from notepadlib: %1").arg(nl.getMessage()));
}

Notepad::~Notepad()
{
    delete ui;
}

void Notepad::on_quitButton_clicked()
{
    qApp->quit();
}

void Notepad::on_actionOpen_triggered()
{
    QString fileName = QFileDialog::getOpenFileName(this, tr("Open File"), QString(), tr("Text Files (*.txt);;C++ Files (*.cpp *.h)"));

    if (!fileName.isEmpty()) {
        QFile file(fileName);
        if (!file.open(QIODevice::ReadOnly)) {
            QMessageBox::critical(this, tr("Error"), tr("Could not open file %1: %2").arg(fileName).arg(file.errorString()));
            return;
        }
        QTextStream in(&file);
        ui->textEdit->setText(in.readAll());
        file.close();
    }
}

void Notepad::on_actionSave_triggered()
{
    QString fileName = QFileDialog::getSaveFileName(this, tr("Save File"), QString(), tr("Text files (*.txt);;C++ Files (*.cpp *.h)"));

    if (!fileName.isEmpty()) {
        QFile file(fileName);
        if (!file.open(QIODevice::WriteOnly)) {
            QMessageBox::critical(this, tr("Error"), tr("Could not save file %1: %2").arg(fileName).arg(file.errorString()));
        } else {
            QTextStream out(&file);
            out << ui->textEdit->toPlainText();
            out.flush();
            file.close();
        }
    }
}

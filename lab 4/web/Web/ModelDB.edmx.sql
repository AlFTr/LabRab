
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 04/15/2020 13:59:08
-- Generated from EDMX file: W:\Всё сдал\сайт asp.net\Курсач\Web\Web\ModelDB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Dogov];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Контактное_ЛицоНабор'
CREATE TABLE [dbo].[Контактное_ЛицоНабор] (
    [Номер] int IDENTITY(1,1) NOT NULL,
    [ФИО] nvarchar(max)  NOT NULL,
    [Телефон] nvarchar(max)  NOT NULL,
    [Место_работы] nvarchar(max)  NOT NULL,
    [Адрес_проживания] nvarchar(max)  NOT NULL,
    [Персональные_данные] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ДоговорНабор'
CREATE TABLE [dbo].[ДоговорНабор] (
    [Номер] int IDENTITY(1,1) NOT NULL,
    [Название] nvarchar(max)  NOT NULL,
    [Дата_начала_действия] datetime  NOT NULL,
    [Дата_окончания_действия] datetime  NOT NULL,
    [Максимальная_сумма] float  NOT NULL,
    [Номер_организации] nvarchar(max)  NOT NULL,
    [Контактное_ЛицоНомер] uniqueidentifier  NOT NULL,
    [ОрганизацияНомер] uniqueidentifier  NOT NULL,
    [Контактное_ЛицоНомер1] int  NOT NULL,
    [ОрганизацияНомер1] int  NOT NULL
);
GO

-- Creating table 'ПриложениеДоговораНабор'
CREATE TABLE [dbo].[ПриложениеДоговораНабор] (
    [Номер] int IDENTITY(1,1) NOT NULL,
    [ДоговорНомер] uniqueidentifier  NOT NULL,
    [ТипДокумента] nvarchar(max)  NOT NULL,
    [Содержание] nvarchar(max)  NOT NULL,
    [ДатаСоставления] nvarchar(max)  NOT NULL,
    [ДоговорНомер1] int  NOT NULL
);
GO

-- Creating table 'ОрганизацияНабор'
CREATE TABLE [dbo].[ОрганизацияНабор] (
    [Номер] int IDENTITY(1,1) NOT NULL,
    [Название] nvarchar(max)  NOT NULL,
    [Адрес] nvarchar(max)  NOT NULL,
    [ФИО_Начальника] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Номер] in table 'Контактное_ЛицоНабор'
ALTER TABLE [dbo].[Контактное_ЛицоНабор]
ADD CONSTRAINT [PK_Контактное_ЛицоНабор]
    PRIMARY KEY CLUSTERED ([Номер] ASC);
GO

-- Creating primary key on [Номер] in table 'ДоговорНабор'
ALTER TABLE [dbo].[ДоговорНабор]
ADD CONSTRAINT [PK_ДоговорНабор]
    PRIMARY KEY CLUSTERED ([Номер] ASC);
GO

-- Creating primary key on [Номер] in table 'ПриложениеДоговораНабор'
ALTER TABLE [dbo].[ПриложениеДоговораНабор]
ADD CONSTRAINT [PK_ПриложениеДоговораНабор]
    PRIMARY KEY CLUSTERED ([Номер] ASC);
GO

-- Creating primary key on [Номер] in table 'ОрганизацияНабор'
ALTER TABLE [dbo].[ОрганизацияНабор]
ADD CONSTRAINT [PK_ОрганизацияНабор]
    PRIMARY KEY CLUSTERED ([Номер] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Контактное_ЛицоНомер1] in table 'ДоговорНабор'
ALTER TABLE [dbo].[ДоговорНабор]
ADD CONSTRAINT [FK_Контактное_ЛицоДоговор]
    FOREIGN KEY ([Контактное_ЛицоНомер1])
    REFERENCES [dbo].[Контактное_ЛицоНабор]
        ([Номер])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Контактное_ЛицоДоговор'
CREATE INDEX [IX_FK_Контактное_ЛицоДоговор]
ON [dbo].[ДоговорНабор]
    ([Контактное_ЛицоНомер1]);
GO

-- Creating foreign key on [ДоговорНомер1] in table 'ПриложениеДоговораНабор'
ALTER TABLE [dbo].[ПриложениеДоговораНабор]
ADD CONSTRAINT [FK_ДоговорПриложениеДоговора]
    FOREIGN KEY ([ДоговорНомер1])
    REFERENCES [dbo].[ДоговорНабор]
        ([Номер])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ДоговорПриложениеДоговора'
CREATE INDEX [IX_FK_ДоговорПриложениеДоговора]
ON [dbo].[ПриложениеДоговораНабор]
    ([ДоговорНомер1]);
GO

-- Creating foreign key on [ОрганизацияНомер1] in table 'ДоговорНабор'
ALTER TABLE [dbo].[ДоговорНабор]
ADD CONSTRAINT [FK_ОрганизацияДоговор]
    FOREIGN KEY ([ОрганизацияНомер1])
    REFERENCES [dbo].[ОрганизацияНабор]
        ([Номер])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ОрганизацияДоговор'
CREATE INDEX [IX_FK_ОрганизацияДоговор]
ON [dbo].[ДоговорНабор]
    ([ОрганизацияНомер1]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
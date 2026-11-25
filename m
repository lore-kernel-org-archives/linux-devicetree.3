Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795599531;
	b=39ojSxxPljZa4EGvAAvJLcULQvWG/V52QCWaH+dgdiVgGAsaXoPEZuxFoUpb4eZdDAE+
	 bV+O3iydtlaipbmWMMaE2QFn7SsIZxRsOy+2wVlnqGKupoF2QTK8rcbeddtqS81q9eyyr
	 kWA02cM++Wb6+p2NXoo5aF+SI4fZcmuXkmOi5fy1NjrQFPCeJWDkUy+FOH60m5RRWFWnT
	 K5jhix6yux5ulXOjE4WpIv6jIJHPmccY1C1uhgQGVJMsINohdKqa64Oncpmfk5OEdyqVt
	 RDE3RHBv0qGw7JznykMztLLo/OB4+c2bY0eBVw9sHtS6DkiEXLr0QOA4jp4vcEern6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fqT5zEBe4POq8VjpsxwmrndRyPW+0T4pOR/YbSlCbVY=;
	b=2VdHCaiaWUVwxhBEO+u6N3AvZ5bIE5uHaezS0ZfflKTGj9jiuR5vX37CNXh1UOL6sgf2
	 +vEu6lCtNMldPFlFGQl6TPQI4uSDxpeSfMtWWnXII64QHgOfhBA2l8v694o7qe4Vmfxbw
	 kFq/KrPXwigF/zPRggMlvORFL4JEe0tJF24i1uENQjRaFaYMMG6gLwrN2ypNsR8frimH9
	 SrfeIMUdvQYJY/JoVtSW08owSWOt05jcq+BdOBddR4eh++IqtYTA3C42RMqeANSujDwif
	 nDAml5PDRLEM89CdJ1U8iQskB/XXJyNgHVQZY4uShdj7vjg/iyOmXyjSsvjglc2ovrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mUuO/iXX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C83606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 09:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64C83606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mUuO/iXX
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3863db981d4so7731073eec.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 01:38:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795599530; cv=none;
        d=google.com; s=arc-20260327;
        b=ZLLMahUH9qo+IAuPZeJvsuP3r+ovuGg+0r6OmCnpjx256UuwcUhSOy2tPQgJc0o+m9
         0OE7u9vLzvVzVAvYXaZ0ngulKqZYkQtyqg/Ba1cDlZiO+NIxj8wdLBlr6++SMhxUoq73
         Ru03Xwwh8Df0jHOCQ2OeZDn2gTHOrkM7okTz7bX8KOw/B4z7VEPvrFIKCJ2qjG8zH03e
         izS90I6WRE4uewJyDWhEjDGI2FWkzE5gRi/L0/2WL/xVXXbb819FI/to/pGBHH4QTq92
         qIIw8sC8wTd9LCY7yqiUj1wOlW7Bza/oTJ5k2TsnOK4vPuN0JeQYw2gpoo8VKechQ+7E
         5/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fqT5zEBe4POq8VjpsxwmrndRyPW+0T4pOR/YbSlCbVY=;
        fh=6POGcj7FuVpQ2qznLXqPhiQ0fh6t4JeCkeg77tH8/lI=;
        b=hnrzhBqJwEqU7lhJguMl5btG92fDqnaZeQcDvna2CLVyrTlYOcYOgM8MYuaGAYSTU/
         Vr3mzk1mKuUzcha+YXJN/0aYmtZNcSZQ+eAtJy578fn3571wWLfHaTrwOlZN7DQRqcSx
         SMJ9fKLvp2NMyFTz+uhaw3o4UN0Z1+L66Q4Sjt4obtLPAAPr/DQmjeJ31Xgb5gz86RGw
         ilM8PWNJQ0wUmKXR76YZMHq3Lt0HTnCyqPPbA9rva110HcGTHBjowtB3AKOZECIKaHTR
         pPqMDpJZJD45DtYWydKuZPnmTWu0qfpR8bajb2ygXg0jiO2MriqODpdLzJFiBWQ66+Q0
         sLXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795599530; x=1796204330; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fqT5zEBe4POq8VjpsxwmrndRyPW+0T4pOR/YbSlCbVY=;
        b=mUuO/iXXPhhTx1/pUKSSoCwHlvnA5F0oTfqQWVn7soChrtwMxjw4snRdrRRhnK1bxf
         RMTZ6lvkv+YJ+UuJqzTRu3WsIyIr3FzetbQC3F6BJWbQC6Cz9p9V9xmURvrp8KJjYLx+
         flcgxZ/WyayDr6jZHGNtHbFyBaxOHi+g1hjyCBKZD6QcVLU2NMGOwZTd+UeW2uukFZ7K
         bNtGXqTQmeIGaYo17bWI27LkV34f4BN0Zqsv97Cm2aq9bfIj+XGwmUX4pfV5EELj9WNR
         rxjLILH65aDkz53ctiKqwQu72DeMuEBpdFiEA+VdmXbcPdoKdN+Pc/fjPOP1XQuPeFvt
         yQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599530; x=1796204330;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqT5zEBe4POq8VjpsxwmrndRyPW+0T4pOR/YbSlCbVY=;
        b=fynhv/qZ3HhjykjBrE5qLszZVIXTxdiBO6gcMGr0UVdSPPCxCRQwCDrAsbxDaZ6Dc6
         gUvXjmObfyrKQjlhbdr9aTZRJNDoNAAPwpri06Jd7f5SF6tTpF2X2XA7GP5AoA8nQGoQ
         J3JDNs8WOkVHjWqThWJdc2LQpG6J1K6pvH4a0mPfofzSIKfoiFAPlXRhQR7oJwRGAI+C
         lRCJVTj3pwjdp+BXiLoObfUbT2UK4rdne4FvvJouFPGyRzKwqyr2nT669LyVH9I+KmZc
         5l6/yyFDrIzGnRezrtcijH3QCgbj7VLQ92pl5llnanCYIkU8EXziKH0rHK8ktWmGnFTY
         VEMQ==
X-Forwarded-Encrypted: i=1; AL+hErFp9mwh2/8zDvo+9c4dCwg+E/VhWVYxaGG4pSxoird/jjFhs0R1Un4bNo2uvft171TsQUIb5Qn7lBhf@vger.kernel.org
X-Gm-Message-State: APuU4Z/6JCqcx96QF3tmIlGxBpF6KVLMHbnbFpMgo0Uf3fsOe5R2EhV1
	bDYMJTgDLmSbqoeX4yNKxdoEuHzooxj2O8jZCFRLQifiJnNhhLjMG7pBSlQnB40abfCkASk6PnC
	OGLaw3ejMQrOU+PDcuWRKfoC9ohAs5M0=
X-Gm-Gg: AZFdTZcpUDBgfGc5OxZAlpYyU7GNq4g3s6QO08Sf9HD/d1r/AQQRAMXmnl67Cj7Q951
	ovhu/cSeEqtLclMkR0PapBqwUn2lMW575inK25UnN4fN1qUoQVUU9fH1FpWVmZtjtHsEXpFwoLy
	qdrVNdp9ZEKperbJkMA91qZCCr6wvG3fIo+tMcUmfqFcJFq7iKKJQZBsJ4A/5hqtViu71vBbgfB
	O/uVPum2e3rKgbyfUEXch+okNqGnSTU8YdzEZ+1kB7RQwfs/qBDmzuWPqnxcOJsygUmAoF/uDOy
	Ym5o8Om9Cqr42G50S9CfR03meLlOn298qdZz22E1Unpiw1SA4YrMG2m2gZknoM56ZbCjvCxGb9f
	QFJ7zgId02qRBVZ8wsPEHjJk8sEV1o/xgZJU=
X-Received: by 2002:a05:7301:6184:20b0:386:b006:c8 with SMTP id
 5a478bee46e88-386b0060806mr9187564eec.35.1795599530462; Wed, 25 Nov 2026
 01:38:50 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
 <awS2-clBenE1r1a1@aurel32.net> <12933da0-9bc8-4f92-96d4-36c5673d3f5e@gmail.com>
 <awXUSuYOUQMPCl-5@aurel32.net> <CANAwSgRf0XpWnyDaoiGySFv3NPKCBYn6BODf1M+P4w58BF-duw@mail.gmail.com>
In-Reply-To: <CANAwSgRf0XpWnyDaoiGySFv3NPKCBYn6BODf1M+P4w58BF-duw@mail.gmail.com>
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Wed, 25 Nov 2026 17:38:38 +0800
X-Gm-Features: Aa3M54qi331g5vW8-jVNPAgzGNvq1anSty0Xye8n492lYEY0Eqku4rqKabs__f8
Message-ID: <CAKyUbwUyYptzZrMFKD-RjmufU7Wni8-w5vQvPyxUgx9BU++vsw@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
To: Anand Moon <linux.amoon@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Junhui Liu <junhui.liu@pigmoral.tech>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anand,

On Wed, Nov 25, 2026 at 3:52=E2=80=AFPM Anand Moon <linux.amoon@gmail.com> =
wrote:
>
> Hi Aurelien,
>
> On Wed, 25 Nov 2026 at 00:14, Aurelien Jarno <aurelien@aurel32.net> wrote=
:
> >
> > Hi Zixian,
> >
> > On 2026-11-24 11:31, Zixian Zeng wrote:
> > > Hi Aurelien,
> > >
> > > On 2026/11/24 5:58, Aurelien Jarno wrote:
> > > > Hi,
> > > >
> > > > On 2026-11-23 12:41, Zixian Zeng wrote:
> > > > > The bananapi-f3 carries an AT24C02 compatible EEPROM GT24C02B [1]=
:
> > > > > 256 bytes with an 8-byte write page, which can be found in schema=
tic[2].
> > > > > The device tree declares pagesize =3D <16>, which does not match =
the
> > > > > eeprom chip datasheet which declares pagesize 8 bytes.
> > > >
> > > > Oops, I am not sure how I got that wrong. Sorry about that.
> >
> > The question of the page size has been raised in the initial review [1]=
,
> > and it seems that the GT24C02 has a 16-byte page size, while the
> > GT24C02B [2] has a 8-byte page size. The BPI-F3 schematics confirms tha=
t
> > the B version is used. Sorry about the mistake.
> >
> > > > > EEPROM pagesize of k1-bananapi-cm6-io[3] and k1-orangepi-rv2[4] c=
hanged
> > > > > together, based on the chip model shown in the schematic diagram.
> > > >
> > > > The k1-milkv-jupiter board is also affected with the same issue, de=
spite
> > > > using a slightly different EEPROM (24C04).
> > > >
> > >
> > > The GT24C04A EEPROM used on k1-milkv-jupiter board doesn't seem to ha=
ve
> > > the same issue, which you can find "Page Size: 16 bytes" in datasheet=
:
> > > https://www.giantec-semi.com/uploads/20220929/GT24C04A.pdf
> >
> > Indeed you are correct, and I confirm that this is the exact version
> > used on the schematics. Therefore there is no need to extend your patch=
,
> > it can be merged that way.
> >
> > > But I don't have the board, simple test would be appreciated. Perhaps=
 I
> > > should include test steps in the commit message for the next revision=
.
> >
> > Unfortunately the board has the EEPROM write protection pin connected t=
o
> > VCC, which means the write protection is enabled. Therefore testing is
> > not so easy.
> >
> > Regards
> > Aurelien
> >
> > [1] https://lore.kernel.org/linux-riscv/aNLzRJcKCYOngc7z@aurel32.net/
> > [2] https://www.giantec-semi.com/juchen1123/uploads/pdf/GT24C02_DS_Au.p=
df
> >
> Apologies, this is a different issue.
>
> I am currently working on enabling multi-DTB support in U-Boot SPL
> for SpacemiT K1 boards.
>
> While investigating the board detection issue, I noticed that the EEPROM
> on my Banana Pi BPI-F3 does not contain a Product Name TLV entry.
>
> alarm@k1:~$ sudo hexdump -C /sys/bus/i2c/devices/2-0050/eeprom
> 00000000  54 6c 76 49 6e 66 6f 00  01 00 20 24 06 fe fe fe  |TlvInfo... $=
....|
> 00000010  d5 52 bd 2a 02 00 02 23  0c 39 38 61 39 63 33 61  |.R.*...#.98a=
9c3a|
> 00000020  32 62 64 34 37 fe 04 3b  e3 ff bd ff ff ff ff ff  |2bd47..;....=
....|
> 00000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |............=
....|
> *
> 00000100
>
> Although the EEPROM is readable, the missing Product Name TLV entry
> explains why read_product_name() returns `-ENOENT` (-2), assuming the
> EEPROM read and validation succeed.
>
> Consequently, automatic board detection fails, and U-Boot falls back to
> CONFIG_DEFAULT_DEVICE_TREE, which may select an incorrect device
> tree for the target board.

Yes, exactly. I encountered the same problem. Board detect failed and then =
used
default device tree (MusePi Pro).

> Since the SD card-detect GPIO polarity differs between the Banana Pi BPI-=
F3
> and MusePi Pro, selecting the incorrect device tree can result in SD
> card detection
> and boot failures.
>
> The following SPL boot log shows the board detection failure, although
> DDR initialization completes successfully:
>
> ```
> U-Boot SPL 2026.10-01060-gf3080abcfe92-dirty (Oct 24 2026 - 17:30:03 +053=
0)
> Fail to detect board:-2
> vdd_core, value:900000
> vdd_1v8, value:1800000
> vdd_1v8_mmc, value:1800000
> DDR firmware: [0xc0820900]:0xf0227179, size:0x8d98
> DDR is ready
> ```
> Could you please confirm whether the Product Name TLV entry is
> expected to be programmed into the EEPROM during manufacturing?

Yes, No product name TLV entry in my Bananapi-f3 EEPROM. That's the reason
I wanted to write EEPROM and found this EEPROM pagesize issue.

> Also, is there a recommended approach for handling boards with missing
> product information in the EEPROM to ensure reliable automatic device
> tree selection?

I'm not sure. Currently, after I corrected pagesize, I wrote EEPROM manuall=
y:
```
U-Boot SPL 2027.01-rc2-00039-g4cff50f40343
Get board name:k1-x_deb1
vdd_core, value:900000
vdd_1v8, value:1800000
DDR firmware: [0xc081df80]:0xf0227179, size:0x8d98
DDR is ready
No SPI controller (-19)
Trying to boot from MMC2
....
=3D> tlv_eeprom
TLV: 0
TlvInfo Header:
   Id String:    TlvInfo
   Version:      1
   Total Length: 29
TLV Name             Code Len Value
-------------------- ---- --- -----
Base MAC Address     0x24   6 FE:FE:FE:90:1E:F0
Product Name         0x21   9 k1-x_deb1
MAC Addresses        0x2A   2 2
CRC-32               0xFE   4 0xA88C93F0
```
Maybe we can discuss this in u-boot mailling list? This is indeed a
separate issue.

Best regards,
Zixian

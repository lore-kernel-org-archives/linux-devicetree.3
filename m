Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795677772;
	b=U19RVqR4Rrm2L9AZDx28LIH3+6oCgyMNv5MXz+LjBCrnKWFBfRm6pJjmAwi0itzNjNMg
	 X6qPgoTXQvMdP1WBP7KZC4T/GXTeTtAtWh+x9BNFm9kgdjDcLuAD2iiLzEj0DgGa1fuAA
	 pJd8kkfqmNdyN8EhgpJ0NacVcrykMOvSsUQd29vfqUWE4t/70dr93v4J9NLxYxdRkvuwv
	 dkuf/R03JmqctIh7z6PGIuUQ4dw5gDsV3V0DG5xfkeXPOz1LviOUzW4Nnpz3b7Z0IhPVk
	 Qp219kxGyj05Kl3/bIod4oZ51/3fWv5hkdAB5z7kaBlj7ylbgxrzONUzp+pXeati55w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SPUgkbv+5hbrbd2VDmsoa2vVwDhsYIwbnba5cs+Fw+s=;
	b=dcxOYRP/G2j7gzXGRqgNiO1eYNPbcE3W4MdVMRm7RNTm1W6aEyNgOpDZ+WVrc3/FZsNt
	 uSxWUedOsIC/dFTHhl3SuNpt48cDCnqla0myDOdBVw7o8cKFCHGmBWWXseO3J1c57EZge
	 inS8190NzbyHtcXn3N3d5xEnMPC3cp6gr03DIOrDVLRFvFXgsLwEx46GU22j0GkAqYf3g
	 j2eh/FWo3vTf5f7akomWoUG65goKqETSGfa6aljoS0966T+kGJGwOh6cxdLKwRk/aTtSd
	 2zYdveL0QEEGgoMiATy0bZYObjE6fQ2GKhHbUCTpaoLIsCb6QZiYVMbHkRyTo/CRjMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jlDY/7C9";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512B2606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 512B2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jlDY/7C9
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b88b74e54eso8259479a12.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:22:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795677769; cv=none;
        d=google.com; s=arc-20260327;
        b=jnRlnJeKLdZp8ix4seZPCeO+yg1ADJvMmUpGqOeTNCKaD0vvz/6Deos+BlIfOfwC+M
         LHCPgsInYwsNqmp7av/XtRnuLwIAl8LOydAkid4oICQzx7cXCJxCGb+jogKa1RDNR9BJ
         /1/vF/cLwwiZr38Wb8Gfz31t8KCucg28N5TVBUfUzCP6fZFkx5E5/RujJpF0fwZQbkWl
         zFDDXc3kvULuefvRaPs3tHq1iC2uHKY0IhKBsjrrXINzf37h2RGvabJPjpWQPBkXvAlS
         RDbJYE3oHRbMODFfveKPxFOPmVh2XI+M/ygQroWYS22ZJzyBqdxvVsQ//sx7Jg9MRKr9
         wELw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SPUgkbv+5hbrbd2VDmsoa2vVwDhsYIwbnba5cs+Fw+s=;
        fh=xWJCEWMIGPGoYVgR9Th7cnjKqFw0cUenHh6Hms/xslg=;
        b=dmofjinQHBwZ/qcO9qBQG61eAEdTJkVbtSU6SMJTfmigeSk4ZLDLzapqWaGScDCwX3
         p6tWLGUpOL/G1B9svf3zuO4KKaeVjxguDUNr53rP083K346I34UODN48RudoBym19bcF
         QaZ2cLCDtOe0mP77qVJ0lcqsh1/DSCUU8apucte1ysacwRPg3TKxbpaxND6d0AckyMVC
         mAG81UIlMLHbEq4v1YnLLJzk0LVks5zm+bd/ERJIns/BaJRIcChiAwU/+lKrewx/6nVI
         iA9GrnHQ10n/NsujSbgzehVyYvtfFpoASOL/LnHsJGq3OKij6i/OG3j25lDPENJO43Y3
         4uUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795677769; x=1796282569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SPUgkbv+5hbrbd2VDmsoa2vVwDhsYIwbnba5cs+Fw+s=;
        b=jlDY/7C9NnWBCf66WbYTaNJyZs7OHWbWhhqJ+2zSBB8AwwKuSOteysF3oytSKb4zTb
         2eXy+J8IfQIA+0XGwjB6dowFGlTYv67czlnLqJPqStD9HS+9FhuAtrX7AazKX8HL3fVx
         0iadhide+UnaeQdzHCck/y9JIWOB1kqyhTv2S2dJM3s1T0X81tnM7dvFBzvUOZoXTZL/
         v0oI27DvfNus1JFESzdvqChWKBIWy/Pf2LN5c+NKkB5vyXV6yRPYI5B0X7tqYGT8DV1j
         tBQdGriS289/w4tlDYcy5cJXsJFLYo/p01eqGFxfNBFnF9aVxleazrW0T/U3BIg4/XlL
         jGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677769; x=1796282569;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPUgkbv+5hbrbd2VDmsoa2vVwDhsYIwbnba5cs+Fw+s=;
        b=UuwkKbYU8z+EHss4dIo0jzK0DA+AqieIXz3bFH5CVPChbhu+2BYVnjcKvqP5Vyn/UH
         TaZOw8svcTl8ybEfrwIhnzJkmUcAA80W2bOYVHt8vQEz2m3UwhFfgO89LKILW64MNmjF
         1CipWY2fLZ2KjsBDnWI05AoDpnqm/fhPhWUzXPtusRzobyGiQDdmKcsAQsU+qj5zPJfQ
         I8n0vbOBKQ6e7tOLMoNdXqeqayYX8XEfja1J5HWYVq2G2mxb3VJ1GDiA+81t0DnP8r2M
         clnzV+56bbidN1OOz5UHstOc8KqvdCmyGYCEQd4cgRtEqO16vNp6jVcEFivXNLBk0Mwd
         S9nA==
X-Forwarded-Encrypted: i=1; AL+hErH9rGvejsqBTVQaB3m1bPdtZhUzEjnQmElx1LsELlLPNnxbNFYBXP7XdB1R8A4uy0/ctF7GRmt60UfX@vger.kernel.org
X-Gm-Message-State: APuU4Z/yM1m8C+9i6j2T1hjBkLE0EWp1x7Xuz/P1byRfMItDMDqTDNKv
	xTlwSkbe4n20/ns6WJwjJ+AL/gIkdTWMUlxFv7bxVdypbp8WrA0yqlqTg+TpwLt+M5VZ6BuS4aC
	tJR3C0GIp5r+TNBGAj31KQUrgGOMTtT8=
X-Gm-Gg: AZFdTZctZlYEvKDtPkILx1uYQuvfeAb8GPVeFusFrllrPhahgqZuCJ45nCtCdiJSxNg
	tXRWk6zwj6N3VIUoh6jcallsjMYtO5iD+NTe44K6x+f9AzoHAtd1fZq7xdsphJY8m5XmI6zCTmz
	jkbKVJyXcip3qlH/djd0eVMkd3uXqls1MtAbANY8EMtecu7C+uaw9Cflp+uy1fj4qoVMTLsVm8S
	9R0mMB/MPsSEZZ2tp8yIb+EK96E9qvBfyzxqwl1Gm+9e3sJzdumf+wyDhfEBGYIue14cTOcHaxS
	+42NwP8M/mQzWDEdMDmLQFbClAq8HQ2puXc0sH5wr0mjPqoG6WZl+w6Gqkph+COnt4SkBcXVivo
	iOjzNbIXAV+EIaqWtNnIYMg4YfJeVWyN6+nQ=
X-Received: by 2002:a05:6402:4028:b0:6bb:791:ff67 with SMTP id
 4fb4d7f45d1cf-6bb079203damr5476823a12.5.1795677769197; Wed, 25 Nov 2026
 23:22:49 -0800 (PST)
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
 <CAKyUbwUyYptzZrMFKD-RjmufU7Wni8-w5vQvPyxUgx9BU++vsw@mail.gmail.com>
 <CANAwSgSNuEC72PM=1ai3xj31+=veLkDhAfuNJ3pmCggBtx9v-Q@mail.gmail.com> <CAKyUbwVuigJqbXiVYS28QKodMELPEd1yNu1Q9xZvmA_TmRHOmg@mail.gmail.com>
In-Reply-To: <CAKyUbwVuigJqbXiVYS28QKodMELPEd1yNu1Q9xZvmA_TmRHOmg@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 26 Nov 2026 12:52:35 +0530
X-Gm-Features: Aa3M54pMN9b6aWYnLqqIo-KqyU1z4jP6pGRJ-3rxY5I_CHcjHcYErK2-yuz-XjA
Message-ID: <CANAwSgQv_QJyfMkqnwrNe0T8qRz-djjCPNB++yP-_AYqCZqQrg@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
To: Zixian Zeng <sycamoremoon376@gmail.com>
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

Hi Zixian,

On Thu, 26 Nov 2026 at 08:30, Zixian Zeng <sycamoremoon376@gmail.com> wrote=
:
>
> Hi Anand,
>
> On Wed, Nov 25, 2026 at 10:22=E2=80=AFPM Anand Moon <linux.amoon@gmail.co=
m> wrote:
> >
> > Hi Zixian,
> >
> > On Wed, 25 Nov 2026 at 15:08, Zixian Zeng <sycamoremoon376@gmail.com> w=
rote:
> > >
> > > Hi Anand,
> > >
> > > On Wed, Nov 25, 2026 at 3:52=E2=80=AFPM Anand Moon <linux.amoon@gmail=
.com> wrote:
> > > >
> > > > Hi Aurelien,
> > > >
> > > > On Wed, 25 Nov 2026 at 00:14, Aurelien Jarno <aurelien@aurel32.net>=
 wrote:
> > > > >
> > > > > Hi Zixian,
> > > > >
> > > > > On 2026-11-24 11:31, Zixian Zeng wrote:
> > > > > > Hi Aurelien,
> > > > > >
> > > > > > On 2026/11/24 5:58, Aurelien Jarno wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > On 2026-11-23 12:41, Zixian Zeng wrote:
> > > > > > > > The bananapi-f3 carries an AT24C02 compatible EEPROM GT24C0=
2B [1]:
> > > > > > > > 256 bytes with an 8-byte write page, which can be found in =
schematic[2].
> > > > > > > > The device tree declares pagesize =3D <16>, which does not =
match the
> > > > > > > > eeprom chip datasheet which declares pagesize 8 bytes.
> > > > > > >
> > > > > > > Oops, I am not sure how I got that wrong. Sorry about that.
> > > > >
> > > > > The question of the page size has been raised in the initial revi=
ew [1],
> > > > > and it seems that the GT24C02 has a 16-byte page size, while the
> > > > > GT24C02B [2] has a 8-byte page size. The BPI-F3 schematics confir=
ms that
> > > > > the B version is used. Sorry about the mistake.
> > > > >
> > > > > > > > EEPROM pagesize of k1-bananapi-cm6-io[3] and k1-orangepi-rv=
2[4] changed
> > > > > > > > together, based on the chip model shown in the schematic di=
agram.
> > > > > > >
> > > > > > > The k1-milkv-jupiter board is also affected with the same iss=
ue, despite
> > > > > > > using a slightly different EEPROM (24C04).
> > > > > > >
> > > > > >
> > > > > > The GT24C04A EEPROM used on k1-milkv-jupiter board doesn't seem=
 to have
> > > > > > the same issue, which you can find "Page Size: 16 bytes" in dat=
asheet:
> > > > > > https://www.giantec-semi.com/uploads/20220929/GT24C04A.pdf
> > > > >
> > > > > Indeed you are correct, and I confirm that this is the exact vers=
ion
> > > > > used on the schematics. Therefore there is no need to extend your=
 patch,
> > > > > it can be merged that way.
> > > > >
> > > > > > But I don't have the board, simple test would be appreciated. P=
erhaps I
> > > > > > should include test steps in the commit message for the next re=
vision.
> > > > >
> > > > > Unfortunately the board has the EEPROM write protection pin conne=
cted to
> > > > > VCC, which means the write protection is enabled. Therefore testi=
ng is
> > > > > not so easy.
> > > > >
> > > > > Regards
> > > > > Aurelien
> > > > >
> > > > > [1] https://lore.kernel.org/linux-riscv/aNLzRJcKCYOngc7z@aurel32.=
net/
> > > > > [2] https://www.giantec-semi.com/juchen1123/uploads/pdf/GT24C02_D=
S_Au.pdf
> > > > >
> > > > Apologies, this is a different issue.
> > > >
> > > > I am currently working on enabling multi-DTB support in U-Boot SPL
> > > > for SpacemiT K1 boards.
> > > >
> > > > While investigating the board detection issue, I noticed that the E=
EPROM
> > > > on my Banana Pi BPI-F3 does not contain a Product Name TLV entry.
> > > >
> > > > alarm@k1:~$ sudo hexdump -C /sys/bus/i2c/devices/2-0050/eeprom
> > > > 00000000  54 6c 76 49 6e 66 6f 00  01 00 20 24 06 fe fe fe  |TlvInf=
o... $....|
> > > > 00000010  d5 52 bd 2a 02 00 02 23  0c 39 38 61 39 63 33 61  |.R.*..=
.#.98a9c3a|
> > > > 00000020  32 62 64 34 37 fe 04 3b  e3 ff bd ff ff ff ff ff  |2bd47.=
.;........|
> > > > 00000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |......=
..........|
> > > > *
> > > > 00000100
> > > >
> > > > Although the EEPROM is readable, the missing Product Name TLV entry
> > > > explains why read_product_name() returns `-ENOENT` (-2), assuming t=
he
> > > > EEPROM read and validation succeed.
> > > >
> > > > Consequently, automatic board detection fails, and U-Boot falls bac=
k to
> > > > CONFIG_DEFAULT_DEVICE_TREE, which may select an incorrect device
> > > > tree for the target board.
> > >
> > > Yes, exactly. I encountered the same problem. Board detect failed and=
 then used
> > > default device tree (MusePi Pro).
> > >
> > > > Since the SD card-detect GPIO polarity differs between the Banana P=
i BPI-F3
> > > > and MusePi Pro, selecting the incorrect device tree can result in S=
D
> > > > card detection
> > > > and boot failures.
> > > >
> > > > The following SPL boot log shows the board detection failure, altho=
ugh
> > > > DDR initialization completes successfully:
> > > >
> > > > ```
> > > > U-Boot SPL 2026.10-01060-gf3080abcfe92-dirty (Oct 24 2026 - 17:30:0=
3 +0530)
> > > > Fail to detect board:-2
> > > > vdd_core, value:900000
> > > > vdd_1v8, value:1800000
> > > > vdd_1v8_mmc, value:1800000
> > > > DDR firmware: [0xc0820900]:0xf0227179, size:0x8d98
> > > > DDR is ready
> > > > ```
> > > > Could you please confirm whether the Product Name TLV entry is
> > > > expected to be programmed into the EEPROM during manufacturing?
> > >
> > > Yes, No product name TLV entry in my Bananapi-f3 EEPROM. That's the r=
eason
> > > I wanted to write EEPROM and found this EEPROM pagesize issue.
> > >
> > > > Also, is there a recommended approach for handling boards with miss=
ing
> > > > product information in the EEPROM to ensure reliable automatic devi=
ce
> > > > tree selection?
> > >
> > > I'm not sure. Currently, after I corrected pagesize, I wrote EEPROM m=
anually:
> > > ```
> > > U-Boot SPL 2027.01-rc2-00039-g4cff50f40343
> > > Get board name:k1-x_deb1
> > > vdd_core, value:900000
> > > vdd_1v8, value:1800000
> > > DDR firmware: [0xc081df80]:0xf0227179, size:0x8d98
> > > DDR is ready
> > > No SPI controller (-19)
> > > Trying to boot from MMC2
> > > ....
> > > =3D> tlv_eeprom
> > > TLV: 0
> > > TlvInfo Header:
> > >    Id String:    TlvInfo
> > >    Version:      1
> > >    Total Length: 29
> > > TLV Name             Code Len Value
> > > -------------------- ---- --- -----
> > > Base MAC Address     0x24   6 FE:FE:FE:90:1E:F0
> > > Product Name         0x21   9 k1-x_deb1
> > > MAC Addresses        0x2A   2 2
> > > CRC-32               0xFE   4 0xA88C93F0
> > > ```
> > > Maybe we can discuss this in u-boot mailling list? This is indeed a
> > > separate issue.
> > Correct, I will raise this issue over there.
> >
> > Reviewed-by: Anand Moon <linux.amoon@gmail.com>
> > Tested-by: Anand Moon <linux.amoon@gmail.com>
> >
> > Can you follow up with the patch to read the MAC address from the EEPRO=
M.
> >
> > $ git diff .
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > index 1db896536256..3928a47b7702 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > @@ -137,6 +137,8 @@ &eth0 {
> >         pinctrl-0 =3D <&gmac0_cfg>, <&gmac0_clk_ref_cfg>;
> >         rx-internal-delay-ps =3D <0>;
> >         tx-internal-delay-ps =3D <0>;
> > +       nvmem-cells =3D <&mac_address 0>;
> > +       nvmem-cell-names =3D "mac-address";
> >         status =3D "okay";
> >
> >         mdio-bus {
> > @@ -160,6 +162,8 @@ &eth1 {
> >         pinctrl-0 =3D <&gmac1_cfg>, <&gmac1_clk_ref_cfg>;
> >         rx-internal-delay-ps =3D <0>;
> >         tx-internal-delay-ps =3D <250>;
> > +       nvmem-cells =3D <&mac_address 1>;
> > +       nvmem-cell-names =3D "mac-address";
> >         status =3D "okay";
> >
> >         mdio-bus {
> > @@ -202,7 +206,7 @@ eeprom@50 {
> >                 nvmem-layout {
> >                         compatible =3D "onie,tlv-layout";
> >
> > -                       mac-address {
> > +                       mac_address: mac-address {
> >                                 #nvmem-cell-cells =3D <1>;
> >                         };
> >
> >
> Here's the output after apply patch above:
>
> ```
> # ip a
> 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen =
1000
>     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
>     inet 127.0.0.1/8 scope host lo
>        valid_lft forever preferred_lft forever
>     inet6 ::1/128 scope host
>        valid_lft forever preferred_lft forever
> 2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
> state UP qlen 1000
>     link/ether fe:fe:fe:90:1e:f0 brd ff:ff:ff:ff:ff:ff
>     inet 10.5.1.16/24 brd 10.5.1.255 scope global dynamic noprefixroute e=
th0
>        valid_lft 7160sec preferred_lft 6260sec
>     inet6 fe80::cd94:5cdf:4509:a820/64 scope link
>        valid_lft forever preferred_lft forever
> 3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
> state UP qlen 1000
>     link/ether fe:fe:fe:90:1e:f1 brd ff:ff:ff:ff:ff:ff
>     inet 10.5.1.14/24 brd 10.5.1.255 scope global dynamic noprefixroute e=
th1
>        valid_lft 7160sec preferred_lft 6260sec
>     inet6 fe80::452b:e032:5630:39ac/64 scope link
>        valid_lft forever preferred_lft forever
> # hexdump -C /sys/bus/i2c/devices/2-0050/eeprom
> 00000000  54 6c 76 49 6e 66 6f 00  01 00 1d 24 06 fe fe fe  |TlvInfo....$=
....|
> 00000010  90 1e f0 21 09 6b 31 2d  78 5f 64 65 62 31 2a 02  |...!.k1-x_de=
b1*.|
> 00000020  00 02 fe 04 a8 8c 93 f0  ff ff ff ff ff ff ff ff  |............=
....|
> 00000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |............=
....|
> *
> 00000100
> ```
>
> I think 'fe:fe:fe:90:1e:f0' is read from EEPROM. btw, I wrote product nam=
e
> manually (k1-x_deb).
>
Yes, it looks correct. I have the same result on my end.
> Best regards,
> Zixian

Thanks
-Anand

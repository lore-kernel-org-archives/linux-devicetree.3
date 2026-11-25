Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795616530;
	b=UC2BOM78KaGlPEyoiA+9jj8GTZD6gZwcj24ZB2fBJkeJEBwxOTUZ8ta4/hfoqXfMFmxR
	 vmdEBWvs5HwUvCJYHmfGFlbWD5Mar6bXxcaM4aCtDZiUjWsAT1qztfCGqvFE50Kig3H32
	 uxpgYYpJfOYRDL3NH2WnrP4xXp/5eqymWe065kzEIUZPzZf8m3Q8zYX/CPodDKi5Cf+x8
	 91NQBZyTZDZPhhVgAe88I3Evpd3wQ1zi/eqFrAEEFuWn+zKac65EWreiPW9d7ZzAWEosm
	 hjhTrQT/aSO+CswRVVL7U2Ca2HoHTdMHX4QO0D+myM/74aIXTvDLw0JSrhb6v+BsqHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qcxgI/Ns4WvtOt6H6UP0HsEplcfIU7aicu4QDdc3bw8=;
	b=HU4Xw8WQ1mbk9LAMT9flIIGtls5sjFwBUHwoVwTG2K9WL4Fv6Lxz5wJU7NesFoAiPvMa
	 jPnCJTPsRkul6ReAoSoFVBzDLayS4CwBA1ye5IZbdryp9A7QpY+Dlzh76IQ3nXolsOm09
	 JNctjK43LbDuYQIwPhoI5AKtT6dZz04OklZhaZcop46W6ofq/9156vs3QZbs16fZEBEsR
	 ftE+sfx6MBRkzajJens6RXXPi6zfYnYLy4si9qd6n/K5fhpzmU8Bi/hKFUV/4CTSFpuID
	 pMSOHyrjoZMj7UTMrx49B+ZfGWwnf5ZTCXPMV6i+rRCpTAcws1t0ZRYoz9eHob9oKBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DW53tXNV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9203606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9203606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DW53tXNV
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b8b20b2538so6796659a12.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:22:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795616527; cv=none;
        d=google.com; s=arc-20260327;
        b=itwSQ6zx1Bnh595XqsBzgXrLfU/+VazragRMFnrGJ/SyEH516FLWbJok0KXkZi8M6i
         u1e29JHiV6NBD5FPvjyO8YTCQjtKEnXlMjgfhgHGbwTijKHgsbkCA/Leu+f0h6X7VVXA
         5lxXnUfEd5/F2ilgT0+cFmZ38KVIqoslNN2eZ9zXX90uxMKDnulxFwyF79Tadrmqr0gH
         hykiw5dSBcXeu7EwOREQBDr/Gic9cogcQDLTw0wssMXBtzeN/PV0H+yXJ6Rr7EuwZMqt
         XThzRWRpYANy/Bv+5EJ0yuqK4ufx4i84lb5MNQJV5qbZKeI0JblXWBNUhdpq3a3J2j+a
         zVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qcxgI/Ns4WvtOt6H6UP0HsEplcfIU7aicu4QDdc3bw8=;
        fh=LjYysrR7BcEh4WWAPenZsr02/yR+aB1gQUhKdQWCfi4=;
        b=VMTCh7+gOoBOqbASXPSSBNekAYYP/2bfVP9YlWf0pDlhVi5YUxdO1RcVwxpdRr3v+K
         d2FN2Rr6PWmDHBIVopf2wD87avwzMDDW/gHnI1fgJ6yt6fzuvCdhFP7anh2uCDJKwF0U
         e570HzCLlmWx89I9tRrgAlyCqnc4eSg8BGUCOuBvabfTmQ4GqJgz5JuPO6ktojnw/9Vx
         w98UNehs5HbcVDE/EiVkFUDmon9loB3tGtGcg/y3TRDMgo9s6UDngwIhy+mwaS8yh3Yx
         hzjAz6Qz9DpAGpgBDczEQI9p+LgLXkiZV44lvBLjx6mSlTtfqYzH9QZKpxQogdGckB6x
         aiuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795616527; x=1796221327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qcxgI/Ns4WvtOt6H6UP0HsEplcfIU7aicu4QDdc3bw8=;
        b=DW53tXNVbMROXyXO7LPJbeWrSOOmJoQafMJAMbe95mWLIEWdZDPL/O6h5ml59H5pfa
         H91cibledm1yhBK0DOaBxIx44hWTKiOCMVmnh4wPU2tKTyhn/qKaZ1p4P84IL7dchDo1
         jfYE/+SwtO9vSunZ9eMHkIQA9lA1Hwx9PBfdr0PcfXxJREATKH8n8jqRoajoqJ/9Sr8H
         KChNdRaAxDrTfCN2o1W56751qgm3tSrxbjvdErxrfDtIaOY1X1aRy6CuySkFIgDEM+JT
         kwEMjPISdw9wqYnTkRz4sWptF6SjGK9Wfjv+NQCjUwtKQOCWTB6MC3Gdhq9EwcYTuEvq
         bvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616527; x=1796221327;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qcxgI/Ns4WvtOt6H6UP0HsEplcfIU7aicu4QDdc3bw8=;
        b=ociff5zbsj4l2m6EwY9FnqA4x/KXhuMVQJGKEWbyr1ne7+n59tyw6+rgeSTct7koko
         zDpUjZTRIEJcqqJfGcOoJ/grxZKrkZwGv4+wtmYw9LUkP00MqH8ZyNM9oLwvXy/6KXI6
         eiH7z83wR9Ri9SFuzxk8h1d/G6XyTJGvfJWWzD1K2bOLZ/cHtSiv1ylOJlMSIFafON3p
         LIAcjVKFeL1dGuUMOY8A7VUMhAgJeKWqlfJ9zp2hsXLOPpoK9MtZroqeyBYb2qeUTT+5
         561gyjkl0epOW51ANcom9IEWPNvi8eAjr+SY64GPlRtMiQMj/EIuubC6UrZB8YnM7xoe
         whpw==
X-Forwarded-Encrypted: i=1; AL+hErH/I3BUcTJYpSkW4NRPjFzNIOEy6LpCaSAezlLJL17i/9WxUdWcrsc4EKArzgsh6ocpqTk3nl3qSJQk@vger.kernel.org
X-Gm-Message-State: APuU4Z+SP+mZw9scn20maplfCFuWDvPqWicTV9NlFcMMFbR4hL/fnHbt
	emAmSTmGv5KBGcroVG/9UcHFy2rIfSFUNAzhLy6KGUfsESkQGVM44wquZGrhaPvgQ05i53fy6cI
	pI7UCsk3vPBp/zINPR3yMTnaI/cnOKjeNohAu
X-Gm-Gg: AZFdTZePI7Pq9BFL1HVs4Hl5IBkK4HKguiC8AVcJf+yDp3L1akrBCNpw3GzPmb65X2W
	ujRSp4zUj4Q/01kz8ATvo6JpORXPXMztU+YelLsk61q18fmowNkGP9p5fzUZbOhjERJK/85davf
	6NvHgTUK5aYN3S9QWIYvAOLtNqcaaIbMjbJ59GtPMypKnWSN3hJDTY756pCRjGCJKrWi1k8x658
	GtwUgycAHpoVZ21Jf45wyt1qOJYC0ijHBEgWvKONOQYSYuPWZ9wOn4tmO03GdfN+5qbzw7/Ldr9
	wI3D9oZ5r0IQpJN3cFNsVCuGzC6dDYBT1BNpVIW5AK0pLhHEfr9q7vMet+x3hB19z0/KolUbelP
	0x6J9M229qrXMMeT1UfD7+DR2Km6tpmhJ+Ehg
X-Received: by 2002:a05:6402:1941:b0:6ba:7b46:78a7 with SMTP id
 4fb4d7f45d1cf-6ba7b468320mr9290374a12.35.1795616526919; Wed, 25 Nov 2026
 06:22:06 -0800 (PST)
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
In-Reply-To: <CAKyUbwUyYptzZrMFKD-RjmufU7Wni8-w5vQvPyxUgx9BU++vsw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 25 Nov 2026 19:51:54 +0530
X-Gm-Features: Aa3M54o9-c3RGYDe5yPxK4MpGdTfrRnEWaETWf2MdzNo7lC6NrDNImRWSOSHHdE
Message-ID: <CANAwSgSNuEC72PM=1ai3xj31+=veLkDhAfuNJ3pmCggBtx9v-Q@mail.gmail.com>
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

On Wed, 25 Nov 2026 at 15:08, Zixian Zeng <sycamoremoon376@gmail.com> wrote=
:
>
> Hi Anand,
>
> On Wed, Nov 25, 2026 at 3:52=E2=80=AFPM Anand Moon <linux.amoon@gmail.com=
> wrote:
> >
> > Hi Aurelien,
> >
> > On Wed, 25 Nov 2026 at 00:14, Aurelien Jarno <aurelien@aurel32.net> wro=
te:
> > >
> > > Hi Zixian,
> > >
> > > On 2026-11-24 11:31, Zixian Zeng wrote:
> > > > Hi Aurelien,
> > > >
> > > > On 2026/11/24 5:58, Aurelien Jarno wrote:
> > > > > Hi,
> > > > >
> > > > > On 2026-11-23 12:41, Zixian Zeng wrote:
> > > > > > The bananapi-f3 carries an AT24C02 compatible EEPROM GT24C02B [=
1]:
> > > > > > 256 bytes with an 8-byte write page, which can be found in sche=
matic[2].
> > > > > > The device tree declares pagesize =3D <16>, which does not matc=
h the
> > > > > > eeprom chip datasheet which declares pagesize 8 bytes.
> > > > >
> > > > > Oops, I am not sure how I got that wrong. Sorry about that.
> > >
> > > The question of the page size has been raised in the initial review [=
1],
> > > and it seems that the GT24C02 has a 16-byte page size, while the
> > > GT24C02B [2] has a 8-byte page size. The BPI-F3 schematics confirms t=
hat
> > > the B version is used. Sorry about the mistake.
> > >
> > > > > > EEPROM pagesize of k1-bananapi-cm6-io[3] and k1-orangepi-rv2[4]=
 changed
> > > > > > together, based on the chip model shown in the schematic diagra=
m.
> > > > >
> > > > > The k1-milkv-jupiter board is also affected with the same issue, =
despite
> > > > > using a slightly different EEPROM (24C04).
> > > > >
> > > >
> > > > The GT24C04A EEPROM used on k1-milkv-jupiter board doesn't seem to =
have
> > > > the same issue, which you can find "Page Size: 16 bytes" in datashe=
et:
> > > > https://www.giantec-semi.com/uploads/20220929/GT24C04A.pdf
> > >
> > > Indeed you are correct, and I confirm that this is the exact version
> > > used on the schematics. Therefore there is no need to extend your pat=
ch,
> > > it can be merged that way.
> > >
> > > > But I don't have the board, simple test would be appreciated. Perha=
ps I
> > > > should include test steps in the commit message for the next revisi=
on.
> > >
> > > Unfortunately the board has the EEPROM write protection pin connected=
 to
> > > VCC, which means the write protection is enabled. Therefore testing i=
s
> > > not so easy.
> > >
> > > Regards
> > > Aurelien
> > >
> > > [1] https://lore.kernel.org/linux-riscv/aNLzRJcKCYOngc7z@aurel32.net/
> > > [2] https://www.giantec-semi.com/juchen1123/uploads/pdf/GT24C02_DS_Au=
.pdf
> > >
> > Apologies, this is a different issue.
> >
> > I am currently working on enabling multi-DTB support in U-Boot SPL
> > for SpacemiT K1 boards.
> >
> > While investigating the board detection issue, I noticed that the EEPRO=
M
> > on my Banana Pi BPI-F3 does not contain a Product Name TLV entry.
> >
> > alarm@k1:~$ sudo hexdump -C /sys/bus/i2c/devices/2-0050/eeprom
> > 00000000  54 6c 76 49 6e 66 6f 00  01 00 20 24 06 fe fe fe  |TlvInfo...=
 $....|
> > 00000010  d5 52 bd 2a 02 00 02 23  0c 39 38 61 39 63 33 61  |.R.*...#.9=
8a9c3a|
> > 00000020  32 62 64 34 37 fe 04 3b  e3 ff bd ff ff ff ff ff  |2bd47..;..=
......|
> > 00000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |..........=
......|
> > *
> > 00000100
> >
> > Although the EEPROM is readable, the missing Product Name TLV entry
> > explains why read_product_name() returns `-ENOENT` (-2), assuming the
> > EEPROM read and validation succeed.
> >
> > Consequently, automatic board detection fails, and U-Boot falls back to
> > CONFIG_DEFAULT_DEVICE_TREE, which may select an incorrect device
> > tree for the target board.
>
> Yes, exactly. I encountered the same problem. Board detect failed and the=
n used
> default device tree (MusePi Pro).
>
> > Since the SD card-detect GPIO polarity differs between the Banana Pi BP=
I-F3
> > and MusePi Pro, selecting the incorrect device tree can result in SD
> > card detection
> > and boot failures.
> >
> > The following SPL boot log shows the board detection failure, although
> > DDR initialization completes successfully:
> >
> > ```
> > U-Boot SPL 2026.10-01060-gf3080abcfe92-dirty (Oct 24 2026 - 17:30:03 +0=
530)
> > Fail to detect board:-2
> > vdd_core, value:900000
> > vdd_1v8, value:1800000
> > vdd_1v8_mmc, value:1800000
> > DDR firmware: [0xc0820900]:0xf0227179, size:0x8d98
> > DDR is ready
> > ```
> > Could you please confirm whether the Product Name TLV entry is
> > expected to be programmed into the EEPROM during manufacturing?
>
> Yes, No product name TLV entry in my Bananapi-f3 EEPROM. That's the reaso=
n
> I wanted to write EEPROM and found this EEPROM pagesize issue.
>
> > Also, is there a recommended approach for handling boards with missing
> > product information in the EEPROM to ensure reliable automatic device
> > tree selection?
>
> I'm not sure. Currently, after I corrected pagesize, I wrote EEPROM manua=
lly:
> ```
> U-Boot SPL 2027.01-rc2-00039-g4cff50f40343
> Get board name:k1-x_deb1
> vdd_core, value:900000
> vdd_1v8, value:1800000
> DDR firmware: [0xc081df80]:0xf0227179, size:0x8d98
> DDR is ready
> No SPI controller (-19)
> Trying to boot from MMC2
> ....
> =3D> tlv_eeprom
> TLV: 0
> TlvInfo Header:
>    Id String:    TlvInfo
>    Version:      1
>    Total Length: 29
> TLV Name             Code Len Value
> -------------------- ---- --- -----
> Base MAC Address     0x24   6 FE:FE:FE:90:1E:F0
> Product Name         0x21   9 k1-x_deb1
> MAC Addresses        0x2A   2 2
> CRC-32               0xFE   4 0xA88C93F0
> ```
> Maybe we can discuss this in u-boot mailling list? This is indeed a
> separate issue.
Correct, I will raise this issue over there.

Reviewed-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>

Can you follow up with the patch to read the MAC address from the EEPROM.

$ git diff .
diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 1db896536256..3928a47b7702 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -137,6 +137,8 @@ &eth0 {
        pinctrl-0 =3D <&gmac0_cfg>, <&gmac0_clk_ref_cfg>;
        rx-internal-delay-ps =3D <0>;
        tx-internal-delay-ps =3D <0>;
+       nvmem-cells =3D <&mac_address 0>;
+       nvmem-cell-names =3D "mac-address";
        status =3D "okay";

        mdio-bus {
@@ -160,6 +162,8 @@ &eth1 {
        pinctrl-0 =3D <&gmac1_cfg>, <&gmac1_clk_ref_cfg>;
        rx-internal-delay-ps =3D <0>;
        tx-internal-delay-ps =3D <250>;
+       nvmem-cells =3D <&mac_address 1>;
+       nvmem-cell-names =3D "mac-address";
        status =3D "okay";

        mdio-bus {
@@ -202,7 +206,7 @@ eeprom@50 {
                nvmem-layout {
                        compatible =3D "onie,tlv-layout";

-                       mac-address {
+                       mac_address: mac-address {
                                #nvmem-cell-cells =3D <1>;
                        };


>
> Best regards,
> Zixian

Thanks
-Anand

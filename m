Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121774FC8FF
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675724; cv=none; b=gY32+djqEu0X/VczwVd2aNxHatAYauC8x7Q+4devuaTisbGYpVk9DprbGMRS2N8mg1arRFWkvDlpEdZh+0OeR81w3E6CgqUDTFjvxCZP+Nd05dE66Vm46v2ft7iuA+tp2gDiLUV9mGs+cpkZRkCET72e+BMvA7B/kRt9D64WwQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675724; c=relaxed/simple;
	bh=98UbK4N2251SUFmDgHu33sL9B1Db+PPtpfyBhOYbq2k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=IFcmF9e4DpFcrbI2/1jlDEWQYaGapDmaFwDwE+jWcx0B30zJMzxkTV44HXQyKXIVId3GroqeaHtN8uRMUvNjfoaAQ97/7KY0ElDN3du4qGZNY9Vzs+W3c9ZSIA+VlOgjs96GKfSHtIAHliCI2RnAt9aslwdpYmXJRsSDUG51ZSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fMlJ1K9C; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fMlJ1K9C"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so22208425e9.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 02:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790675720; x=1791280520; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pmauSvEG/mGV3JuTK5ds225WsQMQmw8wXcrzlAj8aGc=;
        b=fMlJ1K9CjqXmM/VON+1gu4tv72zUKPhok+71NWnKcH2NT34lqL36mG0/9G9eCK1QBw
         9VJ9Hn9fNiAVHYFUhMMhp7/KbAJQe1GEtM//u2tgZ9G4SHUnf0tWTs/c6VajfAowucr/
         XFqfZNPEGjQQarHocV/9KPzD1Ysiw/ZF97bS/2Nk/3ZPALbgCvWd+Tn0Z29e9VJ2iZSW
         u8zUG7ULz1ifAzYDiYeuu6v8j0aClCw6N6uSGhKanWBdUm3FtXyAGj/cjTxPaItBydQT
         fvvrFJk70jThcPOyjev/zH6cNqsmEnrHfNHjT6JADj4bP8WOGGY2glxVNKVLdnDybQt1
         wySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675720; x=1791280520;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pmauSvEG/mGV3JuTK5ds225WsQMQmw8wXcrzlAj8aGc=;
        b=wj1heKdM+exa3VoTt7RLusVqHyUX0DfnTARlu1deeLdDlW1EyzpFIq6P+zSllfxqUz
         Pn1HKBhTO0Gm/wM63v+VmjAkiiHuhlZrRduzbyFxz/MFpZZYcu8DeF3XXH6TCgsGCdnD
         dDvspY692/csW7pC9IMkvNz2JDoT3qPBxf0qOXMh8Dh4ZbzgY32za/3/Bes+xv2RVSPN
         Zg2cLFIAClnB1sNQK5u5Cv/dL0AQ8yml1aTewTtxyX5vKDqOX0Wrj67MtnozLCwUrugX
         67JZtJrpeba+B51DNT3oTVN4h42umPjGHL1tzq8N1rH8bgelgQ69ujKwd0xkCtrxt+6K
         4cFw==
X-Forwarded-Encrypted: i=1; AKwUvBxDBE99OqIaDU/9JPGgNbhjohEMW6pub+mjwuW9gChggzOaZvALQxm1Efz9y3B1bYYbwuNxl1H25awG@vger.kernel.org
X-Gm-Message-State: AFuF++nMCoLRyYzNP2cyXJDZ6ckEkVMtYD0E5ljH3hOvy+H6A0vpQrTY
	iYc6jFXs5ivXOzTtUk1i+OLl7Z1OF1YV0XleFTQ1n/Y56dORahVdfe5qP8UHreQU44w=
X-Gm-Gg: AYBFou0QMU/PxOtLd2c6kbMTf2qc6LpS80AVAfP9ZQJHjUoeN3G2IPl4D4yoWAQez48
	gi0udbDI5gcPYSkmmTr6e1jSk7NaSWn+N+vg8t+lFYBYCo5OkQ/IglVebhKiGTTueRNEZfr2ari
	LMa5jRQVZ7Xc4yQ7D+OSr6EN4A4KCHFL/HemB25PZJ/x5xk3a4NzbBRL2z9ys+ggd47kUMT7v0Y
	GFLXKNWimcxUwCFU8hgL6b7u+LdMZ/KFJ3N0qZUMBJJolu5NWBg8p3IjfZWFDoTVTCnY5dtDEtg
	kDSrnwlKyr3JRivA30V4broLYQzS/SzBb/t6yjjnr7g7jF8aasLzEgU0o6gU3kq3RQSKhP6O4yZ
	I/9EjJjqW3npG7jwUf/yRbZx4uSzM1Rzu8ojPPbNBWFNANSNjk1v8pFKYTvz+ANmFdJs6cyGN1L
	NQliNfCwRNEQoInHLqBcRSS6yFbB0tWpldz3+kuRDkQJGQ9xFAaCugpIx0zcua2t3s
X-Received: by 2002:a05:600c:3550:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-49ffd408357mr138179665e9.34.1790675720029;
        Tue, 29 Sep 2026 02:55:20 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:c4e6:4d28:61c:74bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf2d973sm77824505e9.0.2026.09.29.02.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:55:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=a51f3dada9c225cfc13250421c3f01b3dbfa553491d9b870147849dc99d6;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 29 Sep 2026 11:55:11 +0200
Message-Id: <DLRPK96Q063Q.20AXDX3LTN7R@baylibre.com>
Subject: Re: [PATCH v9 7/9] arm64: dts: ti: k3-am62a: Split r5f memory
 region
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Nishanth Menon" <nm@ti.com>, <sashiko-reviews@lists.linux.dev>
Cc: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, <robh@kernel.org>,
 <devicetree@vger.kernel.org>, <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com> <20260918-topic-am62a-ioddr-dt-v6-19-v9-7-40972ef1f663@baylibre.com> <20260918094011.99AE01F000FF@smtp.kernel.org> <20260924145525.2g5ymuwsjwf5ecct@twice>
In-Reply-To: <20260924145525.2g5ymuwsjwf5ecct@twice>

--a51f3dada9c225cfc13250421c3f01b3dbfa553491d9b870147849dc99d6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Nishanth,

On Thu Sep 24, 2026 at 4:55 PM CEST, Nishanth Menon wrote:
> On 09:40-20260918, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 3 potential iss=
ue(s) to consider:
>> - [High] remoteproc: ti_k3: k3_rproc_da_to_va() rejects segments spannin=
g split memory regions
>> - [High] arm64: dts: ti: missing bootph-pre-ram breaks SPL DM firmware l=
oading
>> - [Medium] arm64: dts: ti: hardcoding volatile firmware layout into Devi=
ce Tree
>> --
>>=20
>> commit 33643294863f45f1ac37617eafcfc525d230effc
>> Author: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
>>=20
>> arm64: dts: ti: k3-am62a: Split r5f memory region
>>=20
>> Split the firmware memory region in more specific parts so it is better
>> described where to find which information. Specifically the LPM metadata
>> region is important as bootloader software like U-Boot has to know where
>> that data is to be able to read that data.
>>=20
>> > diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/ar=
ch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
>> > index 06d4e815b1670..94c1d60d8d7a1 100644
>> > --- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
>> > +++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
>> > @@ -65,8 +65,14 @@ &wkup_r5fss0 {
>> >  &wkup_r5fss0_core0 {
>> >  	mboxes =3D <&mailbox0_cluster0>, <&mbox_r5_0>;
>> >  	memory-region =3D <&wkup_r5fss0_core0_dma_memory_region>,
>> > -			<&wkup_r5fss0_core0_memory_region>;
>> > -	memory-region-names =3D "dma", "firmware";
>> > +			<&wkup_r5fss0_core0_ipc_region>,
>> > +			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
>> > +			<&wkup_r5fss0_core0_lpm_metadata_region>,
>> > +			<&wkup_r5fss0_core0_lpm_rest_region>,
>> > +			<&wkup_r5fss0_core0_dm_region>;
>>=20
>> [Severity: High]
>> Does this multi-region split cause a regression when loading a monolithi=
c
>> firmware ELF whose segments span across the new chunk boundaries?
>>=20
>> Looking at k3_rproc_da_to_va() in drivers/remoteproc/ti_k3_common.c, it
>> evaluates segments against each reserved memory region individually and
>> lacks logic to aggregate sequential chunks:
>>=20
>> drivers/remoteproc/ti_k3_common.c:k3_rproc_da_to_va() {
>>     ...
>>     if (da >=3D dev_addr && ((da + len) <=3D (dev_addr + size))) {
>>         offset =3D da - dev_addr;
>>         va =3D kproc->rmem[i].cpu_addr + offset;
>>         return (__force void *)va;
>>     }
>>     ...
>> }
>>=20
>> Will this bounds check fail and abort the boot sequence for any system u=
sing
>> standard firmware linked under the assumption of a single contiguous mem=
ory
>> block?
>
>
> Do we need to protect with something on the lines of
> https://lore.kernel.org/all/20260921145325.300025-3-richard.genoud@bootli=
n.com/

No, we don't need to protect this here. The devicetree nodes changed
here are only ever loaded with firmware in the bootloader. A monolithic
firmware ELF is never loaded in Linux because the driver code in
k3_r5_rproc_configure_mode() detects that it is already running and puts
it in RPROC_DETACHED for these cores.

> Could you please add in diffstat any comments if the sashiko reviews
> are'nt accurate from previous feedback?

Sure, will do that in the future. Does sashiko pick these up then?

>
>>=20
>> > +	memory-region-names =3D "dma", "ipc", "lpm-stub",
>> > +			      "lpm-metadata", "lpm-context",
>> > +			      "dm-firmware";
>>=20
>> [ ... ]
>>=20
>> > diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boo=
t/dts/ti/k3-am62d2-evm.dts
>> > index a8c794d073431..7cba3ff99e6a3 100644
>> > --- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
>> > +++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
>> > @@ -65,13 +65,37 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c8000=
00 {
>> [ ... ]
>> > +		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
>> > +			compatible =3D "shared-dma-pool";
>> > +			reg =3D <0x00 0x9ca00000 0x00 0x8000>;
>> > +			no-map;
>> > +		};
>>=20
>> [Severity: Medium]
>> Does this create a regression by hardcoding a software-defined volatile
>> firmware layout directly into the Device Tree?
>>=20
>> If a subsequent firmware build increases the size of lpm_fs_stub beyond =
the
>> 32KB hardcoded here, will this crash or require a lockstep DT update to
>> function properly?
>>=20
>> > +
>> > +		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
>> > +			compatible =3D "shared-dma-pool";
>> > +			reg =3D <0x00 0x9ca08000 0x00 0x1000>;
>> >  			no-map;
>> >  			bootph-pre-ram;
>> >  		};
>> > =20
>> > +		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
>> > +			compatible =3D "shared-dma-pool";
>> > +			reg =3D <0x00 0x9ca09000 0x00 0x97000>;
>> > +			no-map;
>> > +		};
>> > +
>> > +		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
>> > +			compatible =3D "shared-dma-pool";
>> > +			reg =3D <0x00 0x9caa0000 0x00 0x1c60000>;
>> > +			no-map;
>> > +		};
>>=20
>> [Severity: High]
>> Does the omission of the bootph-pre-ram tag on this new DM region create=
 a
>> regression for SPL DM firmware loading?
>>=20
>> Since U-Boot fdtgrep processes the SPL DTB by keeping only nodes tagged
>> with bootph-pre-ram, these split regions will be stripped.
>>=20
>> Will this result in the no-map protections being lost, causing U-Boot's
>> remoteproc driver to error out parsing dangling phandles when attempting
>> to load the Device Manager (DM) firmware?
>
> Is'nt this valid? why would we let R5 SPL or U-boot SPL think it has
> memory access? Adding a comment is probably worth in the code.

These bootph-pre-ram properties did not exist before this patch for
nearly all memory regions. R5 SPL or SPL u-boot does not care about
these memory regions. It is all configured through Kconfig options or
binman. Only the upcoming IO+DDR resume code cares about just a specific
region. I personally would prefer to keep the DT as small as possible
for SPL.

Best
Markus

--a51f3dada9c225cfc13250421c3f01b3dbfa553491d9b870147849dc99d6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaruK/xsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlPs
KwD+J2JQBCaUypBZe46jJO6/EE5+ULM609YmlMKERfB0TWUA/0xrll/BHTIAPhpr
dU3ZW9kGp9DMDVu0bFD91Jzuo8YD
=0LaM
-----END PGP SIGNATURE-----

--a51f3dada9c225cfc13250421c3f01b3dbfa553491d9b870147849dc99d6--

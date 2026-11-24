Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795519674;
	b=aK6XDzYh+xnHDzHuDpMYPNhOGTzHwenLDhjYivA/EL9HDXv8qB9dQYZ7iXFuwrS0z3t9
	 7pdrlaBSBtgh+ILbFu7J1xeKmBo9kqWe1JFE9C6qb5e3cJmWKFk9c5FDSo1rFFxafb0mQ
	 aGU8Ag6dyO28L9ZxBHdEmDWRSlV/0gGDWtnIbJDIcZsrSKHgdOen8j2b+n7mWgvRO66B5
	 Gmm2FANMChcBev+uj544kgm5RLfHIDJ5L4nlOTD9E1rWOToj75Nfb+kF2Xs3Shz2ZtUWW
	 kLEwVxa7Knqx3FsPoYaciByYyOHvD/tBGiedG9XyMh1OImNCESsOK14ycXQ5Ll3WIxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=xXCcl+kw2rM9Ke0wegquMdzWVHFbfKtLcutpVWvmQvM=;
	b=pnoKgYb9DxwxbFzZLdOGFsOG3scy8dR5UA58YKULvHjoRSMZldKt6dKyL3lzTlvZeWLj
	 Xs+mdPkHjV8lzzHUYF3GXJ/I/HaLdOCd1uW47NfqvnRuGr+s1800DC+hJLPFs3rvsRUHE
	 EpsuEZa++JlDM710FKXTRO66BA4sCHUWR6YyW1JiR1/IEZVz6yKlkdaFJTrn4pQGC7HQ0
	 /YnrgEfPvlB4l5jgaX6S9/u/9zn0Nih31BvD+K/HrE0BsNoAEeNuMFt+RSIwYRm7ltuB6
	 mnQknxWi7kpH2DX+8iLqnG7gOUVQJTphdVKiphj+36ix5rszN49LXb2Hr+EfhgsxEgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aoPCykak;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A042C606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A042C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aoPCykak
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-55c4e670fc6so35870961cf.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 03:27:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795519672; cv=none;
        d=google.com; s=arc-20260327;
        b=a0U4B/ON3qkw+5T/GXMbVgxRSWiYEu74s6N/Qz1LYhNl4900p8JwXEUFoKXFrItuO0
         dVxM+YloNh3mncfXlr8pjWva/eTtQ1+nUxuPK7Ry61bqHxYozDcObza9PN30+HmE7AmG
         99HZjxLKBB823lGX+PMg3T5RduO3NvTmLl0pYPoyXBTfSeVFhH29uNluiokPumTKz2/x
         MJ9270GhgLpcpHguTOMF1uuFcSstH7ioBgV7YrCRIvEylU0AUXskyK/msMrOhAt1XjAK
         gA5vyFxPbWN23WSCTAdA+mJXsz6RyePSBBtJRcvs8ZOJ4mfQT4uLPmSTHHNb/j9zubHf
         CQVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xXCcl+kw2rM9Ke0wegquMdzWVHFbfKtLcutpVWvmQvM=;
        fh=RU8nSI2EijC2y8B6rypEW77WbkjZMPjN4LQs4UIPXKo=;
        b=CBX0iielXtBrqNL7Vx4OkbbFaVPGMPUnU/RssD8bGgP0+6DUiYKwlpaFi54nylYzoo
         jQkPdfcpUeyYkXX5QWiFojx9bYgmohugPd5aK3NAFxJnjDF4htjOFlzW3O6J+lIr5jMU
         /0wIDxAeO6d9J5f/DO4ucN76211Vxno3/vqj1GPMnLXeTIEO2oq9t9iEETWQZSzh2oIM
         zLhKRUrYUJf4HmDKuKedVYue8eL7j2+gGyuDYGlTkE6X1zUgbaklsfAuNY+FVHv5IvBy
         j/7qN8o124L/ANTrfqWdBx8HrjyVygkmU8lFNaD2RgnYNQKV+wUZknLys0L4BGdfqOjb
         iHzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795519672; x=1796124472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xXCcl+kw2rM9Ke0wegquMdzWVHFbfKtLcutpVWvmQvM=;
        b=aoPCykakhkysIhqkhsYsf4/MY7O1fYq5P3QRAL95eDzpufNu8T9G8l23vrUIGD5HBg
         FzV+452Pexub1nrf9UMIC5oHl25WJg6NMTC6PioSZq3zMyb78kRwjwx6qYsunCGHO/FL
         gHA2CJD8lSlunBUksCcZKQ+vjNh9SPvj0KiGyadaTTFVuo+7h1/7f9aId6XY99w/I2rA
         a9KBfL9ILlibnB8nBzDS30wycgvlyJe2VelVuRDuoLvmArbQHl3Das9raTxQNyW6PjAD
         hMj2O8TohQAUskX6xZSNDZpljMvY6u/vrZiaq960sfeuqCrVmEVMp6SYWUyiV1+LNpyt
         S84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795519672; x=1796124472;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xXCcl+kw2rM9Ke0wegquMdzWVHFbfKtLcutpVWvmQvM=;
        b=MCUJA2nNp5VGlEUGHB/JmUvAu3hKb4R47OdtcNPXZIECBv6Lkk2hMRHgBRZTitEYGm
         UPleWCTBkh8BLhlRhNLgL5t1aWgyQ6l6GclV1gKLIIo41x4r2XbrgLqquAn37C/c1pFW
         WIEGZpq8Iy7FcTEwDbX2kDT/QatSpaqA+nAXlYDSkX0aeoHgS4YkahnSlDUu6KwZHdur
         Hm11/7P8IIyEJvXz6SppMlmbpFC+yDXcSiejsQRXXPGbiF+X17YKHIrDLK0i83guqMgt
         GhX+I9dQ73AIhkGfA6Rjse3Xbz5itATYQmUWxcuMuGd3CicPl/yV+T3SM7nsAUHmqtLB
         zAMw==
X-Gm-Message-State: APuU4Z+LzkKSvzn2JqTB2ZRfQ2Fi7mtjLrN3hfh1qNiRtNvkOyKKJaY5
	dGrAnuiORKt2QSTisLD0hZ2xlhjKXUPHiUZnRF8WToZGCdCxEHAeG8gWZMvUQ7o905vqq4kClcV
	XJTegIYR0Mdc7JDuK0Cjh6iNJIu9HZ0s=
X-Gm-Gg: AZFdTZcF9Rz+isbIivGTocJELClv6Z5L4nh+b/9J9ap2WMY9GT6H+v0BqXzOZQ1nsOa
	q0ChLH10dYxGwrV3YhpeTjyPBdnXYVAjEKvUDLJUlXyShnuWgXlTGRXotZKA+vxeezpwlQEfkjy
	H6O4busHKhXkFCFsu8tb8d+n7v/YNS0zL9oNrR6K1cXC00G++Ev3gqoTdSsf54p5gY5Aa7Fc187
	JEU/sqAcAvo3cN+p9jrK7P5n7q5Z8ey8Cu/H26JQuS6adfvhnOuxM+ZxHWUi+QDDd9X28o8Nyvf
	WmWF1gOrrRcMczEoN4WFM6as+CMaJdf4teiHWfI0InqEKFuhN8J2NXg+dvzTnYhyHXACb0yAbRd
	9pmqlCSS3KnNpHjXBaTcgvJRVya0rirZGMeqVXQqg7yAovsHhEVuoiIFM8L5Lxgf3SkvlZA==
X-Received: by 2002:ac8:6906:0:b0:535:2283:20a3 with SMTP id
 d75a77b69052e-55d76a1f731mr241074461cf.33.1795519672518; Tue, 24 Nov 2026
 03:27:52 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-sdhi_rzg3l-v2-0-bad3a6358849@bp.renesas.com>
 <20261123-sdhi_rzg3l-v2-2-bad3a6358849@bp.renesas.com> <sashiko-outbox-229391@kernel.org>
In-Reply-To: <sashiko-outbox-229391@kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 24 Nov 2026 11:27:41 +0000
X-Gm-Features: Aa3M54ppbsJLM4wVbJ_c7D0B6fZzE35d4EIHnXGoFNEoMK2kWDjqihyiCCRU6Sk
Message-ID: <CADT+UeBih2phy7qy_DeUtCdhj0QJQjfRco8AKWZn9NbRWPgM=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: rzg3l-smarc-som: Enable
 SD/eMMC on SDHI0
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 2:22=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Low] arm64: dts: renesas: non-generic node name vqmmc-sd0-pvdd for
>   GPIO regulator
> - [Low] arm64: dts: renesas: misplaced closing brace in #if
>   RZ_BOOT_MODE3 around &sdhi1
> --
>
> commit ef8324be968fe270658aa5eec8f4516a9acb1022
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0
>
> This commit adds pin control, regulator, and SDHI0 device tree nodes to
> support either eMMC or an SD card on the RZ/G3L SMARC SoM depending on th=
e
> SW_SD0_DEV_SEL macro.
>
> > diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/=
arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> > index e9b7b3280615c..3699712d8bf1d 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> > @@ -9,6 +9,7 @@
> >
> >  /* Switch selection settings */
> >  #define RZ_BOOT_MODE3                1
> > +#define SW_SD0_DEV_SEL               0
> >  #define SW_SD2_EN            0
> >  #define SW_DPI_EN            0
> >  #define SW_GPIO4             1
>
> [Severity: Low]
> In commit "arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC =
and
> SDHI1 pincontrol on SMARC EVK" earlier in this series, does closing &sdhi=
1
> before #else break DT compilation when RZ_BOOT_MODE3 is set to 0?
>
> arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts:
> #if RZ_BOOT_MODE3
> &sdhi1 {
>         pinctrl-0 =3D <&sdhi1_pins>;
>         pinctrl-1 =3D <&sdhi1_uhs_pins>;
>         pinctrl-names =3D "default", "state_uhs";
>
>         vmmc-supply =3D <&reg_3p3v>;
>         vqmmc-supply =3D <&vqmmc_sd1_pvdd>;
> };
> #else
>         status =3D "disabled";
> #endif
>
> When RZ_BOOT_MODE3 is 0, status =3D "disabled"; is emitted at top-level f=
ile
> scope outside any node, causing a DTC syntax error instead of overriding
> status =3D "okay"; from renesas-smarc2.dtsi.  &sdhi1 { ... }; should encl=
ose
> the #if RZ_BOOT_MODE3 / #else / #endif block.
>
> > diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/ar=
m64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> > index 91b2d0d431045..e64a611aebecd 100644
> > --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
>
> [ ... ]
>
> > @@ -78,6 +83,19 @@ reg_3p3v: regulator-3p3v {
> >               regulator-always-on;
> >       };
> >
> > +#if SW_SD0_DEV_SEL
> > +     vqmmc_sd0_pvdd: vqmmc-sd0-pvdd {
> > +             compatible =3D "regulator-gpio";
> > +             regulator-name =3D "SD0_PVDD";
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             gpios =3D <&pinctrl RZG3L_GPIO(L, 4) GPIO_ACTIVE_HIGH>;
> > +             gpios-states =3D <0>;
> > +             states =3D <3300000 0>, <1800000 1>;
> > +             regulator-ramp-delay =3D <1200>;
> > +     };
> > +#endif
>
> [Severity: Low]
> Should vqmmc_sd0_pvdd use the generic regulator-vqmmc-sd0-pvdd node name
> instead of vqmmc-sd0-pvdd to match the Devicetree generic node naming rul=
es
> and vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd in r9a08g046l48-smarc.dts?

Will fix this.

Cheers,
Biju

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-sdhi_rzg=
3l-v2-0-bad3a6358849@bp.renesas.com?part=3D2

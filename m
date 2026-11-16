Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794825466;
	b=jNlKJXTrVpuhxFrgWQsReJgl280T+D//tAs8lIrniCas6tt7LoSQabRbOVUUVRwuvrSx
	 csRf/pCHu1psCSfWX6t0j1YIOX4VhQgCVe1LKReQKMhhd66ozBDAwJogZAm534fLwja/2
	 CIIYbjUcrx1SZVNjrKygBcfhv1+yd/SPr8otvrBSNc1vZV87IPPKWgINP7kVV0wHVk215
	 3Dg+T8xshGLa1HsS/2QXLs/AJ1IbDDz4zOL1zowA+38DjQ0YOEGAaN+xqE2o6iLgcORhU
	 +0H6OA6D46CoZ0EJyMGiT05ijvwzUmpjIhw/ZsM/hzioNeJRDjDskG8AutCo7TdTpcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=vAdNdqMZpHFG+BSJ/Ajx6nPvS2zPMigzyGyeH1ja2j4=;
	b=sk2M6wilU5uPjSfz13ByLGL7iss28iDtlF4qoJkhWa4DF9ZX/Qe+/9SxZMrblVEQQUD/
	 fjKREFV/AMeng+1cn/K9vene2211CXU8ZopMi3oAkYki8+zk0iHMMIeRRI2nAzxxtrklW
	 HLyjdwjdVWkvtVnRrW9sOU69/0FknElsXv4ao7VxGhZuiIkrBefqpR5uIrnK9+x9RATDR
	 YiAh5LqwNjVs+KU5NOTTzrRW7/JD/Y1MZTUudKrvF0iFpeTnbLy3ffEaCkmotmOXoT+c3
	 U01TDr4yKAN746usTQgvNH2tNMjH95bzMQaJSDT44SBZbLJUmwZAde8yyeLjisQPpmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LQF7oTeJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD1E606A337
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 10:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAD1E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LQF7oTeJ
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5366ae57896so40642571cf.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:37:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794825465; cv=none;
        d=google.com; s=arc-20260327;
        b=JzktJPdgAgXvbpEVh8FvEKYuYNg/Hg7qNrjhCEVeJ7CSnxNEDBGDY+PuXGRQdN6OMX
         YKhlDV/cd8/NX2iH5ywDlj+2Nx/vaEdEfqyW7jQ6XI8bJnH6SwJyXuyOBkxvuRxy7+Ly
         1HwnyLQ5oRWiEs5FEK/bj8SAFspO8gPTxIkWaTGYCR/L5MCjvFhcSPOIeNjaJT0yG7Uv
         epznjA9/VgifkMPrOUTlqnfxZSIumsPeLg+8Arq009yLEjDCraeiVr7U831g2g+AniIE
         TNdIrnS5LsAYTS1RaZatzj7rpDEKxUM0LIESFCt1KkmvmUOSMJE+n1LKc7QMU/4g05jX
         xIPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vAdNdqMZpHFG+BSJ/Ajx6nPvS2zPMigzyGyeH1ja2j4=;
        fh=5atlI6N4DqhDJ/kROOWZt6Ol/QVkwus/c/CVt4iaZ0I=;
        b=nvyyMnccFf/FAKg05o/nO8o9K/2PZAqLAyRJ/+jTmL0TE122hY+A1Dxkz2Twfk+DQk
         Z3kXO+q+sK8YUjgJwOWxiNKr5y8SgREKh1sqSzjkw0/Pt2T9+puv1aBgnBiVr5KO7QFz
         itGSdAnNuVk/sbgYxnzgJ8pl+LA/o74Z3yBYez4lFjNdxLmZIRlWbDtPkM7dumKOyv6a
         hxaw6so+iNm5NKR7sQ/YRFsYC8KPpdYvrdvH4XMs1DUTHk6tjfowhJrubEFEtvhavQMk
         WA9Twr4+4KZvXrB81aZTCdysnLmd9CDqmy0CokQDtZx86qZBFQpXFeIOm1BDrTJ75Tax
         lQVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794825465; x=1795430265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vAdNdqMZpHFG+BSJ/Ajx6nPvS2zPMigzyGyeH1ja2j4=;
        b=LQF7oTeJXUmYYX7GD6HzYAHvjyOCEFEhBBLy/AdElE+gFHaztHun5Mhn6gjnN/as5M
         zNV6sEipktBEj1vCPGfGLk+cOwuIDnCTj6GK1mBNI3J2MkxAyr3JeNr4t56czsg7yjma
         1mEgysUQWNYP+bVidEgL2UkRb2Y+H1wXoHhPOtTEEMDNkVO01SLH126WEr5oSZmFAg15
         l+rUuhJvBPs6pCURm4Hx2pbwFJHX18dd4HHG4Ph1MU++j1GmnIveTXIN2UWYs4Qc7CZw
         1CL/wZVT+TUN9RPbuEuUswJMkz5/HPfT5vrxlmkfstOOD/m6zoUwa8vQsXyfMA6X9pOR
         gXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825465; x=1795430265;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vAdNdqMZpHFG+BSJ/Ajx6nPvS2zPMigzyGyeH1ja2j4=;
        b=D3cviM2xpw+DcTH5aImJsLwZ3Hc6GsiHKEfrNwJbye+KRFysM+ERVCg862hmW3f9ul
         rwc2dL/WZCx2+qhqDLuRWDpgZCvcatj1iwHwvBbTHGl0B0MoQcQZxPkbaXy0+IELtMrk
         OyT7sk6QsZv6PtZaZjsGKW77C3BzjYWvTbEY76NmpM7chtGNY0XWtBP7kpxE+JWn7VIp
         deydKuc6zcCPrncclFxgmKPFFbL0Qb367cqjm4Pdkm229Mpl8jU5KoNlLlFyL7z0EfCg
         6COElv/AuYhyk6bt29E8aRLalzjhOoBEpozDIvP/BYoKgjsoosi+282AXxwuoU2OU/AF
         9Axw==
X-Gm-Message-State: APuU4Z9vf2dQOiRhtz6EVDI5+58yCU9aQFXSvwGfcFmNXHAgdt13U3O7
	lLrRImTPoUh9BdQIGCPYj3Bdyz1O+AelegAcsLGozZaMlJSrd614uYiGcZ1r3EdEADhKH+pF7j/
	3cBWQB6Ll3resz1FclK/7+nxOwfuKSXc=
X-Gm-Gg: AYBFou3J9t59+3poVLUSyNfLIteSXUvEioXLDk7NjuC0X1rreNjunwtL5BqdB+tOn6j
	tXcLApOu4mbhKv6z/tsGzHkc7keVaotOr/SmRm/t4sGBurwwRKXW48REISCyIM0ehXCEoq+J1ZB
	JLOddYUcf7MTEU3BUH/OmOWawD0raAYX4ZtfJ0TA5pu41lrkREKlfaXq4MIvX7fTllyyK+K9dY8
	sCGim/IwVXxB9LnJsTtRPsWNmNMdgL9vm1C+CckYMfaqpTeGaTTgrvdAi7vpjSXte4Dcq5/f6sb
	YgOfFAvO2N7ZvKlxan40GHLdTnBYH0zGL9XNUFudfL+HXpNnQTepX9OuSiAfQ9iJAoKcRpHpxur
	BugomP97/nm29cmjaDh7kK0zJOJN3gp67g4PgkD8FgrCeTx2zsh+uJKYJC08whOQyoxpN5Q==
X-Received: by 2002:a05:622a:e40f:10b0:55c:6d3d:b688 with SMTP id
 d75a77b69052e-55c6d3db7eemr69199391cf.0.1794825464925; Mon, 16 Nov 2026
 02:37:44 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
 <20261112-sdhi_rzg3l-v1-2-ca30b209615d@bp.renesas.com> <sashiko-outbox-211741@kernel.org>
In-Reply-To: <sashiko-outbox-211741@kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 16 Nov 2026 10:37:34 +0000
X-Gm-Features: AclHuK9Eg4UhaKH1QJpvsKiOfCpTnXZRZ4Twf9MfbxpkNjE3e-ev8l8nHxuYT8M
Message-ID: <CADT+UeApMF1yftK27r9haAr3eU2Vk=H__TMMNzvFVuURuP_XOQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC
 on SDHI0
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 7:07=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] arm64: dts: renesas: rzg3l-smarc-som: sdhi0 pinctrl fails with
>   -EINVAL
> - [Low] arm64: dts: renesas: rzg3l-smarc-som uses RZG2L_PORT_PINMUX for
>   SD0_CD
> --
>
> commit e86cb26292885aecdb37f14368a14d0f62f6aee6
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0
>
> This commit enables SD card or eMMC support on SDHI0 for the RZ/G3L SMARC
> SoM, selected via the SW_SD0_DEV_SEL macro.
>
> > diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/ar=
m64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> > index 091a227233cba..f6f4eed9a2ea6 100644
> > --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
>
> [ ... ]
>
> > @@ -216,7 +234,132 @@ i2c0_pins: i2c0 {
> >               pinmux =3D <RZG3L_PORT_PINMUX(L, 2, 4)>, /* RIIC0_SCL */
> >                        <RZG3L_PORT_PINMUX(L, 3, 4)>; /* RIIC0_SDA */
> >       };
> > +
> > +     sd0-pwr-en-hog {
> > +             gpio-hog;
> > +             gpios =3D <RZG3L_GPIO(5, 1) GPIO_ACTIVE_HIGH>;
> > +             output-high;
> > +             line-name =3D "sd0_pwr_en";
> > +     };
> > +
> > +     sdhi0_emmc_pins: sd0-emmc {
> > +             sd0-clk {
> > +                     pins =3D "SD0_CLK";
> > +                     power-source =3D <1800>;
> > +                     drive-strength-microamp =3D <9000>;
> > +             };
>
> [Severity: High]
> Does configuring power-source on the SD0_* pins cause sdhi0 probe to fail
> with -EINVAL?
>

No. see below

> In drivers/pinctrl/renesas/pinctrl-rzg2l.c, the SD0_* entries in
> rzg3l_dedicated_pins do not set PIN_CFG_IO_VMC_SD0 or PIN_CFG_SOFT_PS:
>
> drivers/pinctrl/renesas/pinctrl-rzg2l.c:rzg3l_dedicated_pins[] {
>     ...
>         { "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x9, 0, PIN_CFG_IOLH_B) },
>         { "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x9, 1,
>           (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD)) },
>     ...
> }

{ "SD0_CLK", RZG2L_SINGLE_PIN_PACK(0x9, 0, PIN_CFG_IOLH_B |
PIN_CFG_IO_VMC_SD0) },
{ "SD0_CMD", RZG2L_SINGLE_PIN_PACK(0x9, 1,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_RST#", RZG2L_SINGLE_PIN_PACK(0x9, 2, PIN_CFG_IOLH_B |
PIN_CFG_IO_VMC_SD0) },
{ "SD0_DS", RZG2L_SINGLE_PIN_PACK(0x9, 5,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT0", RZG2L_SINGLE_PIN_PACK(0x0a, 0,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT1", RZG2L_SINGLE_PIN_PACK(0x0a, 1,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT2", RZG2L_SINGLE_PIN_PACK(0x0a, 2,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT3", RZG2L_SINGLE_PIN_PACK(0x0a, 3,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT4", RZG2L_SINGLE_PIN_PACK(0x0a, 4,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT5", RZG2L_SINGLE_PIN_PACK(0x0a, 5,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT6", RZG2L_SINGLE_PIN_PACK(0x0a, 6,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },
{ "SD0_DAT7", RZG2L_SINGLE_PIN_PACK(0x0a, 7,
 (PIN_CFG_IOLH_B | PIN_CFG_IEN | PIN_CFG_PUPD | PIN_CFG_IO_VMC_SD0)) },


>
> When sdhi0 binds its pinctrl states (sdhi0_emmc_pins, sdhi0_usd_pins, or
> sdhi0_usd_uhs_pins), rzg2l_pinctrl_pinconf_set() -> rzg2l_set_power_sourc=
e()
> -> rzg2l_caps_to_pwr_reg() returns -EINVAL, preventing SDHI0 from probing=
 in
> both eMMC and uSD modes.  (Dropping power-source from DT while keeping
> drive-strength-microamp would instead leave the cached power_source at 0,
> causing rzg2l_ps_to_iolh_idx(0) to return RZG2L_IOLH_IDX_MAX and read pas=
t
> the end of hwcfg->iolh_groupb_ua[] in rzg2l_ds_is_supported().)

Drive strength it uses reset values.

>
> [ ... ]
>
> > +     sdhi0_usd_pins: sd0-usd {
> > +             sd0-cd {
> > +                     pinmux =3D <RZG2L_PORT_PINMUX(5, 0, 8)>; /* SD0_C=
D */
> > +             };
>
> [Severity: Low]
> This isn't a bug since RZG3L_P5 expands to 5, but sd0-cd in both
> sdhi0_usd_pins and sdhi0_usd_uhs_pins uses RZG2L_PORT_PINMUX(5, 0, 8)
> instead of RZG3L_PORT_PINMUX(5, 0, 8) like the rest of this file.

Will fix this.

Cheers,
Biju

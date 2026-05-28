Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2FB3F7ABE
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975423; cv=pass; b=b3KJJqMcMr10QBVYR/Ioqp9VsOF9hDzhjFkY2kmBRFGsZzlQ7hmQ55xX0Xn+T1uVFwvPljHBg49H6s5Xj3hy6rhG7ex+15w9EgJSpWcD4N7xl5zIg8UqMKt1/XJNuh9n/50zYzdu3vbjbBEaSR1GIglfqe5pnG4MdGElwdV0pVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975423; c=relaxed/simple;
	bh=vurN08ldMD5PGiITwUyxIe/EslL+gOu64WFiyfSA5jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/51jFQAWftEJDMklTe8Kl2BrEvnWU/ZjkmpZWA8H55lysdyiLk8jjjZ151qXdZEM2tQG4v+8tpFp3bo6XwDfhMXe5NAXgAcCUP9h90c9uVn/iOU6nhbJl41MhH0up+/12eZi6PPuZznUHBwRAmzfbhkAw2msPUZ6pxBDL/UWJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D6nDT2RS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=awZlM7PM; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D6nDT2RS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="awZlM7PM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779975421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/lfVZp7HWqHjRqZVVhy7Ez9cx3BFg0k+dK3nLg7M60A=;
	b=D6nDT2RSiIcjllQUb/LjFaCyeQ1os3intL9y+N5nbasvR4/cmMefy33Yo1sKG20FW6dbg4
	4KmlB5VcmrWDrpBqZlm6ezjHTa669T+jCz9pMFqUzzzBmBDcooe6MfV56yj7UnUKJgTxTm
	hVoPo0VAy9wfVFWvnfooRbU2kZcTiLM=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-Tg6dbk9cO4GwufcmCoTggA-1; Thu, 28 May 2026 09:36:58 -0400
X-MC-Unique: Tg6dbk9cO4GwufcmCoTggA-1
X-Mimecast-MFC-AGG-ID: Tg6dbk9cO4GwufcmCoTggA_1779975417
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5a870f93c99so1065223e87.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 06:36:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779975417; cv=none;
        d=google.com; s=arc-20240605;
        b=XgiV6EyV1MtAE/tOcJJlQgEpCIpz2DLKdIV0mUzdPMLZNloSl8fIJMV87Kj/fnIone
         mX+0ndK+/nzNk9+9s3IVGL0i3sk0bQz3DzEAH2Pdez4XqhAMNJjvyaICxvI6ZpiMfbaP
         2pDjR73DIXtZVHbfAdvLeZ7Cyfd+66evVjwuyqvCWzFBHajFE3g/rzc9BG02h6DqrN9C
         vb3dpyd1xp7lPBa41ONgHrTJ5vFtjavyUS8aoDbF5AUE5GR6BkVUv5y69phoRMPT05El
         Mc7W0ZX7nEd46z5P0cho+uHqoEuI2Ev5oWCSR74mgpB/kDPfCKHV88YkITiKzqAfUgLt
         T1UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/lfVZp7HWqHjRqZVVhy7Ez9cx3BFg0k+dK3nLg7M60A=;
        fh=NWSdyqUj4Kwa62LcSkazlO3iHYhwnwOjvXYzA+Ev0Wk=;
        b=JqLBqTi+TASe0TjR/JN6EIbZw3sSI6vzNuyMVGD8HqtI9p+VywfYUAy6lttU0xcwax
         Uqd0+GYULXPmuMyQKk8zorqEeOh9leoKbolPlvvkBuG41rGFcQclo2EM2dY3/QsCmenQ
         LJMWWGLCjuQcwW6HhP/BWAm3MMxcEJMwFHqg2ScP8gCoGHP0Iswqaiom5IW4zWGzI20z
         m/u9P+B65f19T5eZPUG3PUGOxsqchjsU+ZBeIScTU99qNK0bsynA/wMbLobs7ezVV/lx
         bnPeN9uNn7mcUNrceitg1P5sH7iC3f/ID3DSzXQZK9R03pQ/SBxuWbgpRksotW0dHfqW
         KVDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779975417; x=1780580217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lfVZp7HWqHjRqZVVhy7Ez9cx3BFg0k+dK3nLg7M60A=;
        b=awZlM7PMJ3Z7qZ5Gc+9Os7atY24tQatdK6vPgtB0GuKjVZNf0JcWRBE16mc3BrP8KS
         I5pQcdQ9NwP9xodQpanE8sZWX7kooWERAB3MEjxA5Drkglo02FscN9z7isx23tclXxJ7
         JXOIH7/3W+XLZD2PGMDWt+cB1xE0iGP2cLQO/vImAfg+hxO1buhHGh/XAvW+8p5uXxs1
         gLboNdVRvb5vQr7e1HPTk+gE3oR7qNGGeaqOeQR13UNCjqD5i7f3FTNxZxHyOj4AbRY7
         9kSMCuQIG0RBoYoWUIqDM/TJBtNs7RjucuAIVey2zCezdWWB/hWVGRvexQ4KY4oQtWpK
         EACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975417; x=1780580217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/lfVZp7HWqHjRqZVVhy7Ez9cx3BFg0k+dK3nLg7M60A=;
        b=gTwJL+1kuLg6KTUaYM/eaesH0XSXhMKGZJFqut1w8mWDLP7MnY71DVVBUq6o+8rIXE
         E8u2iMLHnBPHuAKY9oam0b+DmqFP7/aTF5guZrSRHqjvMPq3pbehasHS6pU5KNHiMscP
         umQmgKpxajUVCGF/aSF41ERXnqdM++y9mzLvArktgmk/PhyHKbXU/si8t47JtCGEkH94
         nXs6H11eb0e4+SgqGaU4OB3bltQ68OtnebxQfnR8l1//8LHCkIGxBBGJE+Dtki+ZgSaO
         HUmo/DuRkBA6HD0Jc6Wk9jaebcHRwVVTIPiCtOXCN9t24Hy863tY3HwPQLcwdEiyjMcH
         JX6w==
X-Forwarded-Encrypted: i=1; AFNElJ+1M0sabqheNxtCetwTjTDJYwgPXi/ctmHPdNarNw5n0I9pS5Y/xaSAMZDn68RfnTlLmrZ0J86tE0nq@vger.kernel.org
X-Gm-Message-State: AOJu0YwRCu6su+IcfINzJUadGyR6u25henXbi8Nuakd1CjrDDOFq6YYX
	pgaSzgb6n+HN0H52QRT1LH77Ky1IrUYgVUylV4YjsWvU1Y3dJe3HEJhLO+kN7LJN1uGiNQdaq2w
	RlKmEGbqqB/rzkRp/FDdIZOu3DN9sYb4tkdf0Ajz7ORLJLfebkxW0C1r5R5v44N5RTseIXD4iMc
	LMa84Nl4kv/HCdvMHJMnG+3KqzEF0yIxxPfFqfSw==
X-Gm-Gg: Acq92OGgVCUzjSdbbcksq1/SzNEbL7ia+Pzm+xhuQpF40xkftdR1WE60oLqGA6/TpLu
	UeI75nzwpEj5u3zLjdx/DGp/wN6LxmwSFdvfgdx8Fka028AQ1kxDvlmV/aVcvqP2ZjLVGktQrbo
	8K74BrXj5sVggc/R1D3GhDdEJCLs5AB0tQFHBdu6YEr+uhChADsDkzZ5scckTsAldWBmGCU6ZJN
	QQy6e5nNKbZ8go5
X-Received: by 2002:a05:651c:210b:b0:393:5904:7411 with SMTP id 38308e7fff4ca-3963aeeaf73mr5032851fa.3.1779975416769;
        Thu, 28 May 2026 06:36:56 -0700 (PDT)
X-Received: by 2002:a05:651c:210b:b0:393:5904:7411 with SMTP id
 38308e7fff4ca-3963aeeaf73mr5032791fa.3.1779975416222; Thu, 28 May 2026
 06:36:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528083213.1399401-1-khristineandreea.barbulescu@oss.nxp.com> <20260528083213.1399401-2-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260528083213.1399401-2-khristineandreea.barbulescu@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Thu, 28 May 2026 15:36:43 +0200
X-Gm-Features: AVHnY4JWVlWlJ0EWffurf2OBWBeheI9s2tuuUOn2kqYHXaCLBerPUHpYRJVoR8U
Message-ID: <CALE0LRs_8oT+sagUm95uXhfdf28iHO+f-Wwo0DrBp8DK_PaiJA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: s32g: add PWM support for s32g2 and s32g3
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khristine,

Thank you for the patch.

On Thu, May 28, 2026 at 10:32=E2=80=AFAM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> Add PWM0 and PWM1 for S32G2 and S32G3 SoCs
>
> Issue: ALBSP-1959

You must remove the vendor-internal issue tracker reference before
submitting upstream.

> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/s32g2.dtsi      | 28 ++++++-
>  arch/arm64/boot/dts/freescale/s32g3.dtsi      | 30 ++++++-
>  .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 78 ++++++++++++++++++-
>  3 files changed, 133 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g2.dtsi
> index 51d00dac12de..907cf74e61f3 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -3,7 +3,7 @@
>   * NXP S32G2 SoC family
>   *
>   * Copyright (c) 2021 SUSE LLC
> - * Copyright 2017-2021, 2024-2025 NXP
> + * Copyright 2017-2021, 2024-2026 NXP

I see this is updated on every patch you recently submitted. While
this trivial conflict is easy to fix, it can be annoying. I suggest
creating a series with all the recent device-tree changes submitted
lately to facilitate the maintainers' work.

Other than the first comment I made, once that's fixed, you can add my:

Reviewed-by: Enric Balletbo i Serra <eballetb@redhat.com>

Thanks,
  Enric


>   */
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -554,6 +554,19 @@ i2c2: i2c@401ec000 {
>                         status =3D "disabled";
>                 };
>
> +               pwm0: pwm@401f4000 {
> +                       compatible =3D "nxp,s32g2-ftm-pwm";
> +                       reg =3D <0x401f4000 0x1000>;
> +                       #pwm-cells =3D <3>;
> +                       clocks =3D <&clks 5>,
> +                                <&clks 6>,
> +                                <&clks 5>,
> +                                <&clks 5>;
> +                       clock-names =3D "ftm_sys", "ftm_ext",
> +                                     "ftm_fix", "ftm_cnt_clk_en";
> +                       status =3D "disabled";
> +               };
> +
>                 swt4: watchdog@40200000 {
>                         compatible =3D "nxp,s32g2-swt";
>                         reg =3D <0x40200000 0x1000>;
> @@ -717,6 +730,19 @@ i2c4: i2c@402dc000 {
>                         status =3D "disabled";
>                 };
>
> +               pwm1: pwm@402e4000 {
> +                       compatible =3D "nxp,s32g2-ftm-pwm";
> +                       reg =3D <0x402e4000 0x1000>;
> +                       #pwm-cells =3D <3>;
> +                       clocks =3D <&clks 7>,
> +                                <&clks 8>,
> +                                <&clks 7>,
> +                                <&clks 7>;
> +                       clock-names =3D "ftm_sys", "ftm_ext",
> +                                     "ftm_fix", "ftm_cnt_clk_en";
> +                       status =3D "disabled";
> +               };
> +
>                 usdhc0: mmc@402f0000 {
>                         compatible =3D "nxp,s32g2-usdhc";
>                         reg =3D <0x402f0000 0x1000>;
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g3.dtsi
> index e314f3c7d61d..a4a9e21d1361 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2021-2025 NXP
> + * Copyright 2021-2026 NXP
>   *
>   * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>   *          Ciprian Costea <ciprianmarian.costea@nxp.com>
> @@ -617,6 +617,20 @@ i2c2: i2c@401ec000 {
>                         status =3D "disabled";
>                 };
>
> +               pwm0: pwm@401f4000 {
> +                       compatible =3D "nxp,s32g3-ftm-pwm",
> +                                    "nxp,s32g2-ftm-pwm";
> +                       reg =3D <0x401f4000 0x1000>;
> +                       #pwm-cells =3D <3>;
> +                       clocks =3D <&clks 5>,
> +                                <&clks 6>,
> +                                <&clks 5>,
> +                                <&clks 5>;
> +                       clock-names =3D "ftm_sys", "ftm_ext",
> +                                     "ftm_fix", "ftm_cnt_clk_en";
> +                       status =3D "disabled";
> +               };
> +
>                 swt4: watchdog@40200000 {
>                         compatible =3D "nxp,s32g3-swt", "nxp,s32g2-swt";
>                         reg =3D <0x40200000 0x1000>;
> @@ -792,6 +806,20 @@ i2c4: i2c@402dc000 {
>                         status =3D "disabled";
>                 };
>
> +               pwm1: pwm@402e4000 {
> +                       compatible =3D "nxp,s32g3-ftm-pwm",
> +                                    "nxp,s32g2-ftm-pwm";
> +                       reg =3D <0x402e4000 0x1000>;
> +                       #pwm-cells =3D <3>;
> +                       clocks =3D <&clks 7>,
> +                                <&clks 8>,
> +                                <&clks 7>,
> +                                <&clks 7>;
> +                       clock-names =3D "ftm_sys", "ftm_ext",
> +                                     "ftm_fix", "ftm_cnt_clk_en";
> +                       status =3D "disabled";
> +               };
> +
>                 usdhc0: mmc@402f0000 {
>                         compatible =3D "nxp,s32g3-usdhc",
>                                      "nxp,s32g2-usdhc";
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64=
/boot/dts/freescale/s32gxxxa-evb.dtsi
> index 803ff4531077..be7b645afa2d 100644
> --- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2024 NXP
> + * Copyright 2024, 2026 NXP
>   *
>   * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>   *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> @@ -245,6 +245,70 @@ dspi5-grp4 {
>                         bias-pull-up;
>                 };
>         };
> +
> +       ftm0_pins: ftm0-pins {
> +               ftm0-grp0 {
> +                       pinmux =3D <0x2912>;
> +               };
> +
> +               ftm0-grp1 {
> +                       pinmux =3D <0x122>,
> +                                <0xb42>;
> +                       output-enable;
> +                       input-enable;
> +               };
> +
> +               ftm0-grp2 {
> +                       pinmux =3D <0xb13>,
> +                                <0xb53>;
> +                       output-enable;
> +                       input-enable;
> +               };
> +
> +               ftm0-grp3 {
> +                       pinmux =3D <0x2904>;
> +               };
> +
> +               ftm0-grp4 {
> +                       pinmux =3D <0x2925>;
> +               };
> +
> +               ftm0-grp5 {
> +                       pinmux =3D <0x2936>;
> +               };
> +       };
> +
> +       ftm1_pins: ftm1-pins {
> +               ftm1-grp0 {
> +                       pinmux =3D <0x1d3>;
> +                       output-enable;
> +                       input-enable;
> +               };
> +
> +               ftm1-grp1 {
> +                       pinmux =3D <0x29b4>;
> +               };
> +
> +               ftm1-grp2 {
> +                       pinmux =3D <0x29c3>;
> +               };
> +
> +               ftm1-grp3 {
> +                       pinmux =3D <0x1f4>;
> +                       output-enable;
> +                       input-enable;
> +               };
> +
> +               ftm1-grp4 {
> +                       pinmux =3D <0x202>;
> +                       output-enable;
> +                       input-enable;
> +               };
> +
> +               ftm1-grp5 {
> +                       pinmux =3D <0x29d2>;
> +               };
> +       };
>  };
>
>  &can0 {
> @@ -293,6 +357,18 @@ &i2c4 {
>         status =3D "okay";
>  };
>
> +&pwm0 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&ftm0_pins>;
> +       status =3D "okay";
> +};
> +
> +&pwm1 {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&ftm1_pins>;
> +       status =3D "okay";
> +};
> +
>  &spi1 {
>         pinctrl-0 =3D <&dspi1_pins>;
>         pinctrl-names =3D "default";
> --
> 2.34.1
>


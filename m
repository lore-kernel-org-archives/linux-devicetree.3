Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B072C3248
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 12:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777465394; cv=none; b=i7bqc+NTQEFNhC2MJVCXG67uXdjdW17ok+iPN8WfSgo/SYLOeRE/OETKGj8r6QDVEb27mlr/+TTBUZdlRO/LLLqflyoRzSVrZu1ctcD0kFWRLgv8OxoGqMKmu0aLuQdRoGEBVOu5PaP1HnN9St7tjHZ84FnJM1Y1Wx7/A6Stdyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777465394; c=relaxed/simple;
	bh=KOGV9jLH5RXBywSOyxQCqGJvaYR1+Y2TL0szPQtLy74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lLysm32p9mQrCqF2NW3LShic2d0atWyrcWQ3dsDupNP9e9hMsbC5eEvuw6XIoTW+MHOGBfyLR8Ymgdnf5+HQze9/DngvO6O4KZCDJR4Q4kY1QYeamYhmYeP9s+aSz0cBP9ch6Y6j/kliYozWr/xVx4VZO82lmraa8bRFkOmOy7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a2c9c5ff87so13045184e87.0
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 05:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777465391; x=1778070191;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYIYCIsBtJDK4jXwWO2JUdTXoGJvuUmgU1KwSHdoXoc=;
        b=RA6DU4KpuxAra1Q5PGoUiSUMdOt5tuNCDzum09mVTAQBUU1PvNcZ8yrAlVoskpWPwD
         /l0Wp6nHcXZK5L/LeawFD+ZbVtrpUbZmVSOP7EDOn4fydGDn35jojgv2bTzns74ia2yF
         4z2+ewBQDhNJBe2dWdKzD83WpcMk4IzFpZSHRx3rGYUyqpReWUxBpGjp6h7DiCkfLDbZ
         ScuI/xu4qoRhpG7ye6TLmBBofONKeS4FSeXKMvBFaGrjZIfoFwsu4q/pF/U1Pl/VrpaH
         nc5KyQvJCOAjNb7rzP/SNrWg9GeCc6744ewRZl5ONyOXYeI9IIm2DrKDgof1OwaFgsdj
         jutA==
X-Forwarded-Encrypted: i=1; AFNElJ/+Mygne+UXBjXog+7p908WPStl380EselwkS8JVCruNVQU30PK4FPmUemsDHH7NHeURt2/nqaUjwm/@vger.kernel.org
X-Gm-Message-State: AOJu0YxG9waEE2Q/LhHJeOW4wXnj+TRfuclXuebmdR7FRZIAlKBZ8+G8
	cm5qMbecOjRgjYRA/18Jt/dARYf09X/r1YExe/cP9elCG1WtooPGAvB0dr/22y5ivfI=
X-Gm-Gg: AeBDies/QKN5v4Tbm448QYdtvWdDit4NjQ2zOonD4mf8TfsbKuLOtFyb3ODrJoNPHPJ
	AjfrG6lVMxIX+sI0De7+bovgN1m1s4imfAeRjb5qzHYGqBLRn4vu5CPH90tmkjlfYLmkVVN0sn4
	ze0V6ExDRciPvt6IBYd36i8c7EJmolLqAn/IqS+grMfL14fr+8yPdyENkDluXbpdbjMIF0ukUC8
	P2qrnQP1pDVj0rHakSnhP8mH5xiNAJ2G5VIwmXW2uzpso+ANrixUjF+BDXhYzXIAHlGk+QxuORi
	ntLuo61v6OpemDXB27RuDFoLfsHw80b+U036N1dDcWPyJ512graAu+1kgj6lZsPXAhUZfdiwm5q
	F5N1PmCsdVRkPCCyW8ZFPCGNV7xeNmZchLKdernogik7MabUk+AobgjiR3KJ846v+54QEXoXz67
	GwtiwsbMcoDoJR+4hSPsjbC3UnX6e90149/XLPB0iZPZJuAVWCPLxrHAizcSdeGYJw087xwNUwS
	04=
X-Received: by 2002:a05:6512:1110:b0:5a4:12a4:856f with SMTP id 2adb3069b0e04-5a74662c56dmr3278312e87.30.1777465389449;
        Wed, 29 Apr 2026 05:23:09 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74a756f99sm500781e87.43.2026.04.29.05.23.09
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 05:23:09 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38e7d984096so139823951fa.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 05:23:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Tm1lfCywCDB/Zcx4GuNUmTGDVRH/11PqRy7VdBpGiRiZDb4etKD7KgvWAyouBgQGJoP4xqfDE1Snm@vger.kernel.org
X-Received: by 2002:a05:6402:2b8d:b0:676:9c6d:7448 with SMTP id
 4fb4d7f45d1cf-679bb0969d8mr3789280a12.22.1777465006980; Wed, 29 Apr 2026
 05:16:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-7-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 14:16:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5NRFjGmLLSAFkst=y_v=haZ9_-oiZ7_3M2J1s5jiJSQ@mail.gmail.com>
X-Gm-Features: AVHnY4J_eIQauePt3-ENfJ0vvJTMmNJqoEy-L_5paGzJVO5LgQ5rAyTsYv0XxdM
Message-ID: <CAMuHMdV5NRFjGmLLSAFkst=y_v=haZ9_-oiZ7_3M2J1s5jiJSQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: renesas: r8a779md: Add Renesas R-Car
 R8A779MD M3Le DTs
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nguyen Tran <nguyen.tran.pz@bp.renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

CC wsa

On Sun, 19 Apr 2026 at 21:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> From: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
>
> Add support for the Renesas R-Car M3Le (R8A779MD) SoC, a variant of the
> R-Car M3-N (R8A77965) SoC. The Renesas M3Le SoC is a register-compatible
> variant of the R8A77965 (M3-N) with reduced set of peripherals.
>
> Signed-off-by: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779md.dtsi
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the R-Car M3Le (R8A779MD) SoC
> + *
> + * Copyright (C) 2025-2026 Renesas Electronics Corp.
> + */
> +
> +#include "r8a77965.dtsi"
> +
> +/ {
> +       compatible = "renesas,r8a779md", "renesas,r8a77965";
> +};
> +
> +/delete-node/ &csi20;
> +/delete-node/ &drif00;
> +/delete-node/ &drif01;
> +/delete-node/ &drif10;
> +/delete-node/ &drif11;
> +/delete-node/ &drif20;
> +/delete-node/ &drif21;
> +/delete-node/ &drif30;
> +/delete-node/ &drif31;
> +/delete-node/ &hdmi0;
> +/delete-node/ &mlp;
> +/delete-node/ &pciec1;
> +/delete-node/ &sata;
> +/delete-node/ &sdhi3;

I am not sure disabling sdhi3 is correct.
The R-Car M3Le documentation says:

   "M3Le does not support MMC1.
    M3Le supports one MMC channel (MMC0) only.
    SD3 is used only for SDHI and is not used for MMC.
    M3Le does not support MMC HS400 class transfer rate."

The main R-Car Gen3 documentation says:

   "This LSI has four SD card interfaces (SDHI0 to SDHI3), two of
    which can also be used as MMC interfaces (SDHI2 and SDHI3)."

So while MMC1 is indeed sdhi3, sdhi3 can still be used in SD mode?
Do we need a new compatible value, as R-Car M3Le does not support HS400?

> +/delete-node/ &usb3_peri0;
> +/delete-node/ &usb3_phy0;
> +/delete-node/ &vin0csi20;
> +/delete-node/ &vin1csi20;
> +/delete-node/ &vin2csi20;
> +/delete-node/ &vin3csi20;
> +/delete-node/ &vin4csi20;
> +/delete-node/ &vin5csi20;
> +/delete-node/ &vin6csi20;
> +/delete-node/ &vin7csi20;
> +/delete-node/ &xhci0;

Shouldn't the following be disabled, too?
  - ohci1, ehci1, and usb2_phy1,
  - cmm1 and vspd1 (cfr. DU below).

> +
> +&du {
> +       compatible = "renesas,du-r8a779md";

Assuming the DU needs a new compatible value...

> +       renesas,cmms = <&cmm0>, <&cmm3>;
> +       renesas,vsps = <&vspd0 0>, <&vspd1 0>;

Shouldn't this be

    renesas,vsps = <&vspd0 0>, <&vspd0 1>;

? DU1 is unused, but DU3 is used.

> +
> +       ports {
> +               /delete-node/ port@1;
> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

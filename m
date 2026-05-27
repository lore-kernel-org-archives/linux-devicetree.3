Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E4E366557
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779895909; cv=none; b=IHZvoxgHK76Pfp+0neb/VOwpo/UfnBGP+lmv4EeqlpEpMDA6w7IMvl8BhO4SXgMSclC9bII+V8ewqn/DapzRJBktk1W4ul+Iw8LBv1xEBpBC1Y01udeMm+vPB3FYwB4VRrg7D8BoigdegOMp4joCeomVmm5MtlG+GnHoGT6dbBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779895909; c=relaxed/simple;
	bh=Ai8Gc0M9Ll15iapnKmt/9wTra1TFQlAJ8XHoXUJSQ/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fhkoskdOSziOeWaRXhG0mrvdWkG+Tgyv30BuTy9DMXrViPgNtI629z3FSOd4wWHI2klj5vU7jtQ10BS4Nvt38KHCvuNxaHmI+OX4qc1IHON6B4MJQsDBbX7TQ7uuQp3JRl5DdlOuXYv3DA2I5je2upJ3yEHSm+ttBdl2pBRyvTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-96358d0a024so302948241.3
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 08:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779895906; x=1780500706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIlRZgCVpGMi8akEWxP8kXEJKnwQumISGZeYfvbOEPY=;
        b=F41VCph2TPtpXdOfJXi4H1bObWQ3jYKtsAcKr+LxUoGmbi2hQp2KdPSlb4zeBISExU
         hG7yyN13OH7EeAcIaKd3a7kqvTExiylWOR5LJoz5KavvAAx/mHsYBB9kylnEVl8j19lP
         QF+vs7I69pfXPi17XsajkMMLwJ2+3E8VY2LzZIvlTxWImynTT2W6l353AyfozeV2kz1N
         KtTPuDxPD5pxesin79syXcENzONi5M6VYK6SQmN5xCBZql53YeyIrhE96Pp/OoGCCN5A
         D1KB2LfEAcLOieYZ9IV66gvXwv16nprFT+A2ta503rgUZyLZZkidu7p0pdrEBUQF8fGe
         2Q7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/3WnY4JHU22mHmKskiAA4YFmmPog1kgY5KqXL0TMdq84JhlIUpUp95O4hIYNrb2itm8C0zxB0jVp2A@vger.kernel.org
X-Gm-Message-State: AOJu0YyMQy62LoAm88e5mY/cRtxXw9F3mKO1d26x/pj+4NHJrFHFC/Vn
	NFwgVDG9f5WTCZsaf4TD+4NqTOHcbJtGDJjLd/Xm9DKG+5T/96FvSXdyIRMCDpm9aCE=
X-Gm-Gg: Acq92OHRcKsSid4KEr7GP54PuqedGsVUB5pcocyw0k1VYGlYdhqsBb4BP8tJ67uSphq
	3nZmXlfHGPw/1c8XuwBDrw64L9MjFJgiM8wcdYEFue+0lBJRWYlJheBTYpOUXCmcAtNCwLd0nr2
	3NPsZWXC7/SnWZUamQF6O62veOKpKGO7Raq/zFIN3sbDJq7F0379Fzq2zJRiPebZQy0/nTeMszb
	O+iL6y8DtZeg+VIFp/uf9yEKIB9soSZbmafJD/LK2VdSx5x4HOV8VXWZTldC1QPM8U15EMeZM3l
	f3+GOL5Pkv5rPME/wVe7ecotrxf0NssegjjQg8mykUe8pUugzMjbZQx7tGKH0cDZOzt0UR4nIcq
	+Q9tVUEWjS4eCyYlcoKuWv/wsi3vj3tpMfi1eWJPJgQn68aj0ZLim3XfLSkW4/ewOJVB7RCBRcM
	QSLoWlILTnHXNwoG4KBvajyW4g/YGaFYQNrlHHrhP6cu1BGX2f+HzluZFR+9S+hJd2
X-Received: by 2002:a05:6122:ca3:b0:575:33d4:d101 with SMTP id 71dfb90a1353d-5865e69bf5bmr12883364e0c.2.1779895906380;
        Wed, 27 May 2026 08:31:46 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f2f79814sm21245268e0c.6.2026.05.27.08.31.41
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 08:31:41 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5873983d19eso5102066e0c.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 08:31:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+UedNd5ZxOQxPUTgTefwqywmB9ojTFC6AsUsVGB9iIZ+XwuzJaH3gYoc8IwjJPplQeeVD8nZFYymOU@vger.kernel.org
X-Received: by 2002:a05:6122:390c:b0:575:19a7:ae16 with SMTP id
 71dfb90a1353d-58662da22a6mr12763319e0c.11.1779895900700; Wed, 27 May 2026
 08:31:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505070206.7932-1-biju.das.jz@bp.renesas.com> <20260505070206.7932-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505070206.7932-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 17:31:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQxaiGKV+M2fZFnrL0cn6HZnm8KMU_FrpuLOOr23JEXg@mail.gmail.com>
X-Gm-Features: AVHnY4Lz-MCYK5IOf1GJVId8mM5byVTdsE82uuKVoBZTNLn4QsNmoS3qjRzNJzE
Message-ID: <CAMuHMdXQxaiGKV+M2fZFnrL0cn6HZnm8KMU_FrpuLOOr23JEXg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r9a08g046l48-smarc: Add gpio keys
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 5 May 2026 at 09:02, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> RZ/G3L SMARC EVK  has 3 user buttons called USER_SW1, USER_SW2 and
> USER_SW3. Instantiate the gpio-keys driver for these buttons by
> removing place holders and replacing proper pins for the buttons.
>
> The USER_SW{1,2,3} configured as wakeup-source, so it can wakeup the
> system during s2idle.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> @@ -7,10 +7,18 @@
>
>  /dts-v1/;
>
> -/* Add place holder to avoid compilation error with renesas-smarc2.dtsi */
> -#define KEY_1_GPIO             1
> -#define KEY_2_GPIO             2
> -#define KEY_3_GPIO             3
> +/* Switch selection settings */
> +#define RZ_BOOT_MODE3          0
> +#define SW_DPI_EN              0

The macro SW_DPI_EN is active-high...

> +#define SW_GPIO4               0

... but the macro SW_GPIO is active-low?

> +
> +#define PMOD_GPIO4             0
> +#define PMOD_GPIO6             0
> +#define PMOD_GPIO7             0
> +
> +#define KEY_1_GPIO             RZG3L_GPIO(J, 3)
> +#define KEY_2_GPIO             RZG3L_GPIO(6, 4)
> +#define KEY_3_GPIO             RZG3L_GPIO(6, 5)
>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> @@ -30,11 +38,17 @@ aliases {
>  };
>
>  &keys {
> -       status = "disabled";
> -
> +#if RZ_BOOT_MODE3 || SW_GPIO4 || PMOD_GPIO4
>         /delete-node/ key-1;
> +#endif
> +
> +#if SW_DPI_EN || PMOD_GPIO6
>         /delete-node/ key-2;
> +#endif
> +
> +#if SW_DPI_EN || PMOD_GPIO7
>         /delete-node/ key-3;
> +#endif
>  };
>
>  &pinctrl {
> diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> index 6d86b88ce104..bc1178c7484a 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> @@ -5,6 +5,23 @@
>   * Copyright (C) 2026 Renesas Electronics Corp.
>   */
>
> +/*
> + * Please set the below switch position on the SoM and the corresponding macro
> + * on the board DTS:
> + *
> + * Switch position SYS.5, Macro SW_DPI_EN:
> + *      0 - Select multiple SMARC signals active
> + *      1 - Select LCD

While the SW_DPI_EN macro is active-high, the signal SW_DPI_EN#
is active-low, so setting the switch ON pulls SW_DPI_EN# low, which
is OK...

> + *
> + * Switch position BOOT.1, Macro RZ_BOOT_MODE3:
> + *      0 - Select SDIO {CD,IOVS,PWEN} and GPIO4 Active
> + *      1 - Select JTAG enabled

Setting the switch on pulls RZ_BOOT_MODE3 low, hence disables JTAG!
So this is inverted compared to SW_DPI_EN above?

> + *
> + * Switch position SW_GPIO4, Macro SW_GPIO4:
> + *      0 - Select GPIO4
> + *      1 - Select RZ_VBAT_TAMPER

This is a single pole double throw switch, so please document the
which position corresponds to 0 and 1:

    *      0 - Select GPIO4 (position 2-3)
    *      1 - Select RZ_VBAT_TAMPER (position 2-1)

However, I think it would be more logical if SW_GPIO4 == 1 would mean
that GPIO4 is enabled.

> + */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

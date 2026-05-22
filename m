Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892C133A70A
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779464845; cv=none; b=oYm7j5Lxn6y7lMimGDz1kl6RZReA53nxUSEDUqOjE+mtWI7143C80Ih/5ML1hFJ3qxMS6X+e2wvVsBZMJ8hvj5AAEiBVDYx9XvbY5geshtZY4mNTdaWoTNFgoJwy1oyhRTynxmLR57vxij5DtSjxSpRY4PSAWy//9jcuej7fJnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779464845; c=relaxed/simple;
	bh=J9pqhe3rEd28EB+7QM4Mt7JtYR/l/3S7v8/M/aaqFQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DPPP9EeTZggw4UCBzLBkfx5QHi7k8y7FNWERHmH+6204ZbC3hLvNws9aLw4nRCRDvmPK0yX8H/ooEd651SWm8Ha/Kdu7nWzZCNZtM1TvpP0dDcHmCpBwvQ50ZrZso/CeeKF3HApV0upm1HOxouJ/aZB1wkoNXV3RMa26saQrBv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6314cc192a4so2294834137.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779464843; x=1780069643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mat1V267K7OB4qn2fEb5sEkdQiWDnrER2vm5Q5jlK3U=;
        b=Yj7D670e38JbmSOUtmQkRH08G3/E3oHeSeEXN3FYc25naGyWFdb79sschhaEMvWV34
         Oxz5ZND2Z72yqUPR8NbRVX36fN2hBdPE2jNncOgh4lRoB8oNcJZ6hX1Y601Y1EK3ZF6z
         6q8oyUZj/FHAppq6FzwmFdMLJaHsFUuzurtn4cfTZmCYXpWlAifrTLXmivBC1BPFFj1p
         o7zHDWqAsbYZ2rBDiBcp6Weyuyqd73Reoj8mJpuq26gCO/+1C6Wt6V/vyk3AZknWFEbs
         MDB52+V7oA65ipkX4XFimScyL/zDtg00GQzFdwZiw5SP7wCtPvO5HfICGpH3gigmpfQ3
         U1Ew==
X-Forwarded-Encrypted: i=1; AFNElJ+1yNlasLLjs+tU3IVcNnPbVwB4ZMJEfRdxJc8W6X/1MGnRh2pTRl5QnywxhsDTfhHhg/j5GL4+ReAa@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/YY8Bs9SO/867BHWtuh7XaYKE6O+ibVsq4MrXQCO0I6rs18dL
	xuXerDykCsJcfEn8hSV620/uY570RH0z31Nko0H3P2wrrl2r+aQK36ycap0Tr9MGJUg=
X-Gm-Gg: Acq92OG8e9lVky+SEB983seSeSpJCI02SKm19Orf7Ch1sArLS+rf10uNtoZe5MxQtiH
	l8KvPpSYtCd3CPngpeJGgNNxIBl2bpCxfYPyTEllIBZXoMXEWemADBRH4w3Pfyr9ekwIoJkihIx
	z0eCcBc0YyLgnWtzLtoG986NvYRSrctg4Arbe1T1I6vfVbXAFNFhyyBNeL2YiC67LQyMtg0cd6b
	xcUXupBQlvQ1lMarRvnq1e3Zk717ouvZlGR2vcSj14CflF8aGSPGR9B6EQ2pSnOMouq9uIJpgHK
	1XrNf1AhxmMZEDOz5vkAyv3KdPkHQoNb5zWaPDJi9I1o7IKK1kVS+O2irHIns/2NkkZVxQpVNAF
	cDEPR1d8Q6i5+ZeFj2DK0IHTJQPSH4H0fSM4LFM/9LI90aXMHkT3Robm+CdQw7qxBavuIUHjPii
	vWxfgKC2+9zGL52lRMvoR87nJ2ysb6GIYg78UnL909zdWc0AsXMFN5YW0ShU2mxPQt
X-Received: by 2002:a05:6102:d90:b0:639:4bb7:c920 with SMTP id ada2fe7eead31-67c7c073a62mr2162877137.16.1779464843247;
        Fri, 22 May 2026 08:47:23 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67ff5f0820csm1807276137.11.2026.05.22.08.47.20
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:47:21 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-57602a2d80aso2399007e0c.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:47:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Xt1MiHYzvGNyeFOd5nR/XVsuBXz7J05XwbYrF8F8QCUbR5QRkpnhIq4jJER5ohXVjojdqqQ4a2WpY@vger.kernel.org
X-Received: by 2002:a05:6122:3402:b0:56a:fff5:b4d6 with SMTP id
 71dfb90a1353d-5865e2b5250mr2614239e0c.4.1779464839874; Fri, 22 May 2026
 08:47:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-8-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 17:47:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWwantdbvPSFoYm=+_OoQQkKwz+K=qwWgy-7tSp1BNJBw@mail.gmail.com>
X-Gm-Features: AVHnY4IbX-4yvb6-_QqYAmKEvB5Pw7JiMigOp3rN1DUejXGr6NhPRl6ad5aF2d4
Message-ID: <CAMuHMdWwantdbvPSFoYm=+_OoQQkKwz+K=qwWgy-7tSp1BNJBw@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: renesas: r8a779md: Add support for
 R-Car M3Le R8A779MD Geist
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nguyen Tran <nguyen.tran.pz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> From: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
>
> Add support for the Geist board based on the Renesas R-Car R8A779MD (M3Le)
> SoC, a register-compatible variant of the R8A77965 (M3-N) with reduced set
> of peripherals.
>
> Signed-off-by: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Drop CS2500 variant suffix
>     - Drop cells from rcar_sound ports {}
>     - Drop ehci1, ohci1, usb2_phy1
>     - Drop Salvator-X reference from commit message
>     - Split panel DTO into separate patch
>     - Drop FCNL node
>     - Add another memory node for the second 2 GiB of DRAM,
>       although the DRAM layout is patched in by U-Boot
>     - Drop FIXME from audio-clkout {}
>     - Sort nodes without unit address
>     - Rename regulators, use npmv suffix for n.m V regulators
>     - Rename x12 node to x12-clock node
>     - Add PHY compatible string
>     - Use interrupts-extended in PHY node
>     - Rename clk_multiplier/clock-generator to clock-controller
>     - Use interrupts-extended
>     - Reinstate port@0 to rsound
>     - Drop iommus from SDHI2
>     - Drop DU until it can be tested

Thanks for the update!

--- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779md-geist.dts

> +&avb {
> +       pinctrl-0 = <&avb_pins>;
> +       pinctrl-names = "default";
> +       phy-handle = <&phy0>;
> +       tx-internal-delay-ps = <2000>;
> +       status = "okay";
> +
> +       phy0: ethernet-phy@0 {
> +               compatible = "ethernet-phy-id0022.1622";
> +               rxc-skew-ps = <1500>;
> +               reg = <0>;
> +               interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
> +               reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
> +               reset-assert-us = <100>;

10000?

> +               reset-deassert-us = <100>;

300?

> +       };
> +};

> +&pfc {

> +       pwm2_pins: pwm2 {
> +               groups = "pwm2_a";
> +               function = "pwm2";
> +       };

Shall I drop this while applying?

> +&pwm2 {
> +       pinctrl-0 = <&pwm2_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +};

Shall I drop this while applying?

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

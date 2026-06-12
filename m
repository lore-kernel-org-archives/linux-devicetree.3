Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28F1363C64
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 08:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781252728; cv=none; b=ljuTrbn7g3Vc7c3XuKdCUmiJlF2tvoEamHUm2rprwBc4cYkgYvjDKGH2IDGwJiFpePFNVWEiI6WSRVtPK5uwy2NcesIFREbCKxeWDb+nut1syMcm4AfKDFSyQH9afm7DzS9h37RLeS07UnYK67Nq9CcDNsQh8rS1QtNDhM9hnd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781252728; c=relaxed/simple;
	bh=GBSvLNXoZdRqGrEoUil4FgbmYpylukIOLRE6JinfAl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DU+l4rdJJNTBIWVUI1Ch4tlkQBdxC5hdURDz9X+wzktvNj48pi9UYHTjo75/lAQrGAkGzDIR44tyYEb2T9XfusztaYf0mcTxY8YAvigKOO0lEeHamt824/afpvFHUFp7yLhv0Z4lZGPt3JDc8y3LQgHDMahkDOgf00Qf0HgC//U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6c3a36fa9edso560300137.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 01:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781252724; x=1781857524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0BNgEMp+PgvikOQYQ6jo0rnxU2ZwAS3bRz4mmCmta0M=;
        b=E3UKxJghqKWQUyO5jZi9DSBzo7gz62YF2UguSf0dHZHmph0ZNS00ZHs0YkcmjKlDyi
         CftECpYn+xYnI6QwkDL5gIYia1PgKRm4uYcz1nTPOAPw3+YPtP67EM2/Xy5o8gac6JFI
         ZTP+qrfz0NRS5NXzIwR77oksQ4WsCTdncOsNiVZe4J7C4YexIt4DLG0flXcql4UEN6Md
         ye/cFBQehHKLFvOlCwdjAfWe3MunNgAJuAq32VVuN1xZPPLAchE3nnDc/5KjyzUTkp6M
         zaehByJ6xltOG6NAkDo4EzkyF32jdVWNt1q2AW+Bm8780f2Qal7pGshewxTpATf7Ajvh
         xLTg==
X-Forwarded-Encrypted: i=1; AFNElJ8qT56F/qsMQgkZgV4d+gQG3T2Xi52HwBjMFbF4jBBQdUC5YHubUXFzfJhLhafDqsj2KpsLFPfeCXN8@vger.kernel.org
X-Gm-Message-State: AOJu0YxUTC4VvdXcu+76M4Ft0DBqaPVWtjwG7u/u+sLxiCmRSJWefU74
	HFJznY5MzV/I7IkZY5KPBvTcZVawuqq49aSZBOJD6ZGTdM0LiaEHH4JtXS9Avdcv
X-Gm-Gg: Acq92OFgZXK6P6s8YbU2OZ0ZU3E9lIqz+jX6UUHWw05wQzPTLcCgfBrLuRv9xNbO6+t
	JUQWr/J9Hw910ClOSdZfGBOqKbJYXdWDO0YTfwWibTCE6m1UJyowAU8XFMbn+VVCJdaTOTfpgza
	pgsogK+euc5///b37DOZ4J1q1SoBWwdelwqNO5YYqn8GlY6GOsptxS2L2pkE+gdiNX4ZvMrUp/2
	aow4yrIJdK7zjJlEKsSp77Tk1T9mJmE31Q7gTBt7MqarqJNN2hfoWUdsJ5vqfgdFrXRTvLVMExM
	l0jwfI8cGRIRdADbckgh21rK5SlGDNInhCtCIw2LwN554Vw+R8cYNJI1WE0ujwOqzDobvCKYiTh
	1afD989G/afFX5FeSSHt8IANE6IVxxV5sUUupao7A3jyLxHlhnUIhG8ZHFP3VpE9BOyI+3OFLEJ
	UyxReBHEjgcui920Q3rbPnZWYWqR4FSWRaW36L1wf+Ol6SoH9GpKpPBjyaWIMs
X-Received: by 2002:a05:6102:8385:20b0:6dc:c4aa:472 with SMTP id ada2fe7eead31-71e66c8576dmr603978137.14.1781252724259;
        Fri, 12 Jun 2026 01:25:24 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9667407bbaasm851292241.11.2026.06.12.01.25.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:25:22 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-96387cf6335so648786241.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 01:25:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8AXB9Qw+VBxeEsHp45HcBP2DJUHQ0EHRI6vw0yVCIS80EcZ9VrP+57hqyeIMfbXRu9LHuZwEJoZSc+@vger.kernel.org
X-Received: by 2002:a05:6102:8354:10b0:64e:3424:cd45 with SMTP id
 ada2fe7eead31-71e6550cd28mr656883137.9.1781252722056; Fri, 12 Jun 2026
 01:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612080354.57459-4-wsa+renesas@sang-engineering.com> <20260612080354.57459-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260612080354.57459-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jun 2026 10:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6tup=MKtoJBjU1u-3QW+S4zAwrKKngMNy9bqVkgpTFg@mail.gmail.com>
X-Gm-Features: AVVi8CclvQe54KnQjvARQQ5gtHuWL5zZjaw84bM3DVCNJETR3y--hTHuieZNGgE
Message-ID: <CAMuHMdW6tup=MKtoJBjU1u-3QW+S4zAwrKKngMNy9bqVkgpTFg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: renesas: r9a06g032: Describe SPI controllers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Fri, 12 Jun 2026 at 10:04, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Add nodes for the 6 SPI controllers of the Renesas RZ/N1D SoC. The first
> 4 can only be controllers, the latter 2 can only be targets. DMA nodes
> are not added yet because DMA needs some extra code in the drivers and
> cannot be tested yet. Basic FIFO mode works reliably, though.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> @@ -563,6 +563,96 @@ gic: interrupt-controller@44101000 {
>                                 <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
>                 };
>
> +               /* Controller only */
> +               spi1: spi@50005000 {
> +                       compatible = "renesas,r9a06g032-spi", "renesas,rzn1-spi";
> +                       reg = <0x50005000 0x200>;
> +                       interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&sysctrl R9A06G032_CLK_SPI0>, <&sysctrl R9A06G032_HCLK_SPI0>;
> +                       clock-names = "ssi_clk", "pclk";
> +                       power-domains = <&sysctrl>;
> +                       spi-max-frequency = <12500000>;

That is 12.5 MHz (for all controllers).

According to Table 3.2, the maximum SPI reference clock frequency
depends on the instance:
  - spi1: 125 MHz,
  - spi2: 62.5 MHz,
  - spi3: 31.25 MHz,
  - spi4: 15.625 MHz.
As the minimum divider is 2, spi-max-frequency must be half of the
reference clock.

However, spi-max-frequency also depends on the target device(s),
and on board wiring, so typically it is overridden or set in board DTS.

> +                       num-cs = <4>;
> +                       status = "disabled";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +               };

> +               /* Target only */
> +               spi5: spi@50009000 {
> +                       compatible = "renesas,r9a06g032-spi", "renesas,rzn1-spi";
> +                       reg = <0x50009000 0x200>;
> +                       interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&sysctrl R9A06G032_CLK_SPI4>, <&sysctrl R9A06G032_HCLK_SPI4>;
> +                       clock-names = "ssi_clk", "pclk";
> +                       power-domains = <&sysctrl>;
> +                       spi-max-frequency = <12500000>;

spi-max-frequency doe snot make sense for a target-only controller.

> +                       num-cs = <1>;
> +                       status = "disabled";
> +                       #address-cells = <1>;

<0>

> +                       #size-cells = <0>;

Missing "spi-slave"

> +               };
> +
> +               /* Target only */
> +               spi6: spi@5000a000 {
> +                       compatible = "renesas,r9a06g032-spi", "renesas,rzn1-spi";
> +                       reg = <0x5000a000 0x200>;
> +                       interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&sysctrl R9A06G032_CLK_SPI5>, <&sysctrl R9A06G032_HCLK_SPI5>;
> +                       clock-names = "ssi_clk", "pclk";
> +                       power-domains = <&sysctrl>;
> +                       spi-max-frequency = <12500000>;
> +                       num-cs = <1>;
> +                       status = "disabled";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;

Likewise

> +               };
> +
>                 /*
>                  * The GPIO mapping to the corresponding pins is not obvious.
>                  * See the hardware documentation for details.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

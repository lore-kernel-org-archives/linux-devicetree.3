Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179154;
	b=tC/nYCM+I+N+8t0WullRVx7x8QZpti7bbjZdxQlzIzYhOa+gPrXwQiW1nCfTyFokrIc6
	 qD1wCP2rlFaOg2VtbqwNPSx/yr4MVcc52VF3YLT8Wr2vCMMXLiKGiMsV7npDEpD/EbqFT
	 lpu1FXryZDtmxU1DKYwDpVU9uiZmgWW1wo8db5gygytJ1AgPApIayX1rjqIXGKTMlm2Jd
	 AGaqiV1SM8i8MobKsylO4R9a5yuy50PvDY2PoAeDSB//eON2dICjjX4S/cNZmS6Xnxpq+
	 oRn5HgDp0SmWgYla4xSDYHQgmEwN7PCmbX/b7ExszXgRoqaiH3w+58xfcFohzWPIgoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179154;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=9SjRna3ikFVF0kjvJgTvEWSAoXwpZaelLjTatjkSd8k=;
	b=ZHVJgjDZRUZh89AlgY8/ZnHWQpZ8x8hKbiM5W4Ig4jPiCH3ndAjet4icEZEh7J5oHsZF
	 HNMdW+iAWQ4X45Z7XZX5RnshNZsZaSg0ZVIXGP00HG2H0pA4Z0+pxLchL84KCovyjrD2C
	 DeZOeZeJCH4FIjHQDAxrb7GzvaFH+nTgl1C9tTrrkk71Lt0zJc7mJ8s9G57edURBaFzVJ
	 c0/KzXUeoGLeKMM8dCxZ/MyxAuMmCoya1j3P0v9+iFr/a1YeDeuvO0fBnLkg4lUUMqqHA
	 8eJ99E9U86hBY46zNlPJPXj5kO3+mYXRlhCcsatxYoW2e5i14p84/EEPZQKwvtc+Cxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923D6606A32A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 923D6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-980c4258105so506630241.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 04:52:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179153; x=1795783953;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9SjRna3ikFVF0kjvJgTvEWSAoXwpZaelLjTatjkSd8k=;
        b=ZKBJQAsghbIZpt0CPunoFGZbz/qphtvs+YvW0sP4p4dfvTnC264ldzN0oMhPan72ky
         mdPWFULabHPo5i/AER+Vj0aLG+kNvpJ+QYocUILrGzJ4l309VoaPzmffwthXib107eEl
         xw3+W2iZXxK1XeBF3medHy0jJLQJeXfDnyBw2PqY/6oVd3fCiY6xcb2dxrJqSbahs9v2
         i5IotHCq/ZpqRG898sCNFiS5tctwNQsLHK7Vhu8ELDi+d03JBW404Xj9ZFwTeLXFRMlq
         FjPNyjZZjNGgIlA6pazEBbS74C+3kO53NKEwXqdGpZyF1x4wLeUcZQJel36ZCOasmQk4
         RlpA==
X-Forwarded-Encrypted: i=1; AL+hErE+jlrAz8cw7GnF87O7KehrzGZJ944sHvpkmCs3XokJqN0almWssZHOlWZ5QIGA1LThDaC3jXPfuYkc@vger.kernel.org
X-Gm-Message-State: APuU4Z8dT/+StU2vhRLwA9wl8Qa1aH5SLGSqvMwvu09w5pDTNfCGh2hX
	n93kr/GCPvGCNLgtErx58v5Ns8O3ghW27Ktg0EIxoMOHf2VGcnmPZImoG9oHzNoc
X-Gm-Gg: AZFdTZdPLWgJ4MUNq0AXPGlvMWZoSrxtjnr3a4KBzVHlqGt/CZbO4dw5HZ4uxNmR6Pf
	cTbe8dK049RilamRokMj2HIw6z35qXoWhDgP4Pc3H3H3NMyi3Lv6S0yUw3A7GIamzsClvqf1VmH
	HlQj2KNnqAm7HOElKsch/tFdKXrAKBX7M/+0vLvwTg+jrz5ANZWzLvoRlLA/zA/I5crDO7IGLQn
	WzwZlDQrFYxUxOTnKe1iTvokgVSLIJcS17WWGxHD57kuxbExbKujBMAHtzljFH6jS2WDVbAWdo1
	xmagtQazZUVr+wtk63rbgfC+IkFP+HE8AM1Ik9nGlP45Uc+y+hlwjyJch+gHh2gue9N4hx3+bGf
	0E5Jlxle0bzdHDzIR5ys3vQYmLVONlxgbNy0RE/O+ZoOGGdtKMDmhoDksNHkZdtyw9SLXpHQIuv
	HFeFZWUo3G33ZZNQL36YT6Isk4breTOiD4MUAU9cjdVDoeCkMY/xwUnXUEG6lcYJtEnVt5Qllgo
	PtaI3kQGRGxVoAgkxGFKI9GeBKlrLZOkqB6lQayA+0OY3MdBYgHl/F1WcPI7vVE5P63XFwDAXYz
	QPuYdnc0ij4OeJjTj8qOxB1VW1GjmxXIUJJpoyl7wC6MIgCvFtjK9YYA92PMS6kY9oeJXHX0/eK
	PDsSlVfvE2OsG9g==
X-Received: by 2002:a05:6102:3f13:b0:7b4:879c:bb76 with SMTP id ada2fe7eead31-7d739582ee2mr1202858137.21.1795179153460;
        Fri, 20 Nov 2026 04:52:33 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7f92680sm2914648137.5.2026.11.20.04.52.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 04:52:32 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7d6a6776719so455493137.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 04:52:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG9Zx3WNXr6Mj34PW4QYHuqWAcPktOgrfifm5+ScDn3gSr4Si7IzeZK14sKCgww28OUAha44ZLVpJUF@vger.kernel.org
X-Received: by 2002:a05:6102:3e8d:b0:7c3:fcb:180c with SMTP id
 ada2fe7eead31-7d739572406mr1186700137.20.1795179152283; Fri, 20 Nov 2026
 04:52:32 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com> <20261112-sdhi_rzg3l-v1-1-ca30b209615d@bp.renesas.com>
In-Reply-To: <20261112-sdhi_rzg3l-v1-1-ca30b209615d@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 13:52:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWk_0VT_UgaYoCW8c9zac2g88bL6niZF6aDu+UbWroFjw@mail.gmail.com>
X-Gm-Features: Aa3M54qyNQu_3mY0Gw0VIiuXO7cKeCCI_cdaF_qJo1F3yjQPV5KrJ3x92PPsDRE
Message-ID: <CAMuHMdWk_0VT_UgaYoCW8c9zac2g88bL6niZF6aDu+UbWroFjw@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a08g046: Add SDHI nodes for
 RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
To: Biju Das <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 12 Nov 2026 at 19:48, Biju Das <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add device tree nodes for the three SDHI controllers (SDHI{0,1,2})
> on the RZ/G3L SoC (r9a08g046) and enable SDHI1 on the RZ/G3L SMARC
> EVK platform with pincontrol and GPIO-based voltage switching
> regulator support.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -1062,9 +1062,80 @@ dmac: dma-controller@11820000 {
>                         dma-channels = <16>;
>                 };
>
> +               sdhi0: mmc@11c00000 {
> +                       compatible = "renesas,sdhi-r9a08g046";
> +                       reg = <0x0 0x11c00000 0 0x10000>;
> +                       interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI0_CLK_HS>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK2>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI0_IACLKM>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI0_IACLKS>;
> +                       clock-names = "core", "clkh", "cd", "aclkm", "aclks";
> +                       max-frequency = <150000000>;

Given the bus clock can only run at 200, 100, 50, or 6.25 MHz,
150 Mhz looks strange to me.

> +                       resets = <&cpg R9A08G046_SDHI0_IXRST>,
> +                                <&cpg R9A08G046_SDHI0_IXRSTAXIM>,
> +                                <&cpg R9A08G046_SDHI0_IXRSTAXIS>;
> +                       reset-names = "rst", "axim", "axis";
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +               };
> +
>                 sdhi1: mmc@11c10000 {
> +                       compatible = "renesas,sdhi-r9a08g046";
>                         reg = <0x0 0x11c10000 0 0x10000>;
> -                       /* placeholder */
> +                       interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI1_CLK_HS>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK2>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI1_IACLKM>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI1_IACLKS>;
> +                       clock-names = "core", "clkh", "cd", "aclkm", "aclks";
> +                       max-frequency = <150000000>;

Likewise. This instance does not support HS400, but HS200 and HS400
use the same bus clock speed, right?

> +                       resets = <&cpg R9A08G046_SDHI1_IXRST>,
> +                                <&cpg R9A08G046_SDHI1_IXRSTAXIM>,
> +                                <&cpg R9A08G046_SDHI1_IXRSTAXIS>;
> +                       reset-names = "rst", "axim", "axis";
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +
> +                       sdhi1_vqmmc: vqmmc-regulator {
> +                               regulator-name = "SDHI1-VQMMC";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               regulator-ramp-delay = <1200>;
> +                               status = "disabled";
> +                       };
> +               };
> +
> +               sdhi2: mmc@11c20000 {
> +                       compatible = "renesas,sdhi-r9a08g046";
> +                       reg = <0x0 0x11c20000 0 0x10000>;
> +                       interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI2_CLK_HS>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK2>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI2_IACLKM>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI2_IACLKS>;
> +                       clock-names = "core", "clkh", "cd", "aclkm", "aclks";
> +                       max-frequency = <150000000>;

This instance maxes out at SDR104, so max-frequency should be lower?

> +                       resets = <&cpg R9A08G046_SDHI2_IXRST>,
> +                                <&cpg R9A08G046_SDHI2_IXRSTAXIM>,
> +                                <&cpg R9A08G046_SDHI2_IXRSTAXIS>;
> +                       reset-names = "rst", "axim", "axis";
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +
> +                       sdhi2_vqmmc: vqmmc-regulator {
> +                               regulator-name = "SDHI2-VQMMC";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               regulator-ramp-delay = <1200>;
> +                               status = "disabled";
> +                       };
>                 };

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

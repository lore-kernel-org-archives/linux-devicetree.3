Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942313BD647
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 06:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783491736; cv=pass; b=tUNNI9KX0qdTL+x8iC5qVQm+9EtNCLzgQn181PF+JBMGivEeIO1RbHa+QEpas3iJIbvFBQeAYfIp6svxR8lcweTYw/iMPNRKD2KRT8P72L5/cj8eU7pEL1nVug/hDlRXlyVKi5Vy52VSL3gx8YzbYTW9Oo4gVGcrhEu54vkNBOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783491736; c=relaxed/simple;
	bh=Q+fJSBCJJKaFA5XtTf5qMvXQ35XMD3uNkGCHwK1jljw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZOde6HPYZca/EguLqJWiL46RAsSAOaU3nXBlw6Yna5+Cmbf9mddNojTlZgWYxkEu3yjKX0d+bb9DHlBMTJvC4s0J0uRjxC+fA/kies8pR0mSqCkQDkzJwo1Tpsoy8McxkbSiz/Ttq7dgyopZqWuWzNBnn5XsRIlQwiOccgvHO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SOMpkoxX; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SOMpkoxX"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6679d88abdcso438826d50.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 23:22:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783491732; cv=none;
        d=google.com; s=arc-20260327;
        b=j9QLiv6ji2mMokyCwUAmccaq/UEI6DOP1BFM3PdKyKmRVdVB6e24dkhR5zpXkWoLon
         MHlaLxjVMYUIbFVmV52eu53HIcDBTyy5WKkGPfwxlIe3lHu2fAJAsrktSv4011jg5iEv
         zSPNnOTilH/Otj4qV4hHNEMD3xo4n+OSgM7m7N0skKX+tG1daquIoAZYwbYZo4mItkU6
         tvd5LvtdPU2pdUnjhrWzCji5fPINS/qWLXb5z4vrcjF6de8oyH2yYl/dR6IzVGCUgkkb
         ROWolWLjvZS876o8NgGCcDv58oWFhoXDvd6os+czdwUT+L4AhqzXk6vwZRRs2noUFW0b
         e4gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nyXdoI7KZnNpfNaLYiInRne3qbmZfDvP+wR+FbUBMps=;
        fh=H7qEzLjKrrO0BseHMKaGHgwI2MjC7b/vU9u2lEGv/3Q=;
        b=Mp9SC5XuQzXu2tSCi/jfhbmn06RaacyCSUFQDhmB5PQT8OOjstg7EZ34MKt6oiO95b
         uMjLYYq1v32ZIJLfDmodbvVtRSWAE7fS01mnkU6YB+aLzim0dYFmCOhfNhztip0Yl8Oq
         DLjMEmcsOfvdjrog8BG+C5tw9yvx5y4KWFI+y0E1xDhqgo3Wv/dBkKw6XFR0GBLHjbcX
         LhRQnM+aSDURObp5pxBLvfgbSXeUv0QFgt4jWLOcvUJoN1K4sBaZS9xRHaK/zEUrSwjZ
         9MFXPXTYQxU6iGQ5UBQOagkPh46pfrb1N1ku4BpTkyDrswmVVYcagnX4fnM5FdnqjxqB
         CakQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783491732; x=1784096532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nyXdoI7KZnNpfNaLYiInRne3qbmZfDvP+wR+FbUBMps=;
        b=SOMpkoxXAYU0ha8zZXa3DkE9A+bHOU39O9Ki47900Ryaq5LoxhQ65H6WJKg5Z0B+Fn
         WlUqW3DVU748xZbcVS4TBX7Q8/w7WOV6kmqt60Xjf7vkmJnsmIbQTFIQqDwLDd7w9DsV
         3012VAd3OX7dNpmKfWf57X1BLlcXYtzqbFZUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783491732; x=1784096532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nyXdoI7KZnNpfNaLYiInRne3qbmZfDvP+wR+FbUBMps=;
        b=P9oQnuchDmdQtpVOFxm32eKipVHHpdgNbgxhhi3yB9MLnX1fSYusWpsCD0sEI1oPfN
         uqr+LAuCyLkKxcEolcr4HoLXJz1JT6q3/MYIZbyLZq4Uk35a8UP+P3VxWqO8ogS/8tPM
         rmAWFoLcaqySengwgpd3cMl26l5dL85KmrPiZmM8pL1TqcbLxdJCeQJnc4QOMgJy8qvR
         yC0G4lnyJdbWakVQzHU+eApU4emTtvYKvr8J+e+wVcMABThp1cNXpiWamzHCCR/bmRJ5
         kIopscvKbfNSF3XDPeAaFw/NbENMGlRcO0YV/9+BDmQJVAjJhHlEZ2kbVSoDJWfh3j9W
         Up9A==
X-Forwarded-Encrypted: i=1; AHgh+RqYd65iQQxEPqqomp631s3hhzpUvkffaB50P7/v8MIwOg1fHINT4mi52zQNRaTvCmvw6zJuCSoXuXTQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwWgK/dNZEAR3lwTYebXKQW9kTPhFmcdaUbSb9arAW+YFpiXoSF
	O4wHWZKsg1ZRET2no+4xhBBXYGWOWlhG6eWxjlQ13Mn+pso+Y5Evpm7KHDxCRub+0YZ671/j+lZ
	VSPRSib6ZSahBdF9YJnco32Y1liLlx0DU7wgx/3Y7
X-Gm-Gg: AfdE7cm2qUVV6hTLZxIyfoq2wnes13cMylpLm52V9KvzDxLE/xR0z6aHlDDY/5klChj
	Tdsc5pZaZ24qJSBWD+S6F6iCYc3cuts1hiHEjlzJ6Uf+peIQz7Jo0YyNMS0K+bfmnxlpymWFzFa
	BC9lwGkN1/76d8AbGhrDdiTQsOKwih+/o+CyNoxuPJE46Am/fX+/eLpX5qwHNAHNJZXJCXxDQoX
	N/RIUkcDG33lOXRUFN6s2LrwlSs+StTyIiinJeoWwnfCfqptP/BlIJqDolVrl8gjd1ilJHvxfpx
	mjNPadytYq1IqSCe/0lKST+Vvdo=
X-Received: by 2002:a05:690e:4841:b0:666:2480:2b0a with SMTP id
 956f58d0204a3-6679f201176mr697881d50.50.1783491732443; Tue, 07 Jul 2026
 23:22:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-add-mediatek-genio-520-720-evk-v2-0-19d5da4ef984@collabora.com>
 <20260701-add-mediatek-genio-520-720-evk-v2-3-19d5da4ef984@collabora.com>
In-Reply-To: <20260701-add-mediatek-genio-520-720-evk-v2-3-19d5da4ef984@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 8 Jul 2026 14:22:01 +0800
X-Gm-Features: AVVi8CeA6CFM4kR5Bt4fLtWwaGoE3MK5l8ZS1mrdHaGZI7ndDG_5d5ZiXOKEMvU
Message-ID: <CAGXv+5F9RPzKWTH1heDEUmWgE2k9mnvdj_uLO9MS5aKqN+3cDw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: mediatek: add Genio 720-EVK board
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sean Wang <sean.wang@mediatek.com>, kernel@collabora.com, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 12:36=E2=80=AFAM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:
>
> Add support for MediaTek MT8189 SoC and its variants, and a devicetree
> for the basic hardware enablement of the Genio 720-EVK board, based on
> MT8391 SoC.
>
> MT8391 SoC is a variant of MT8189 SoC with a difference for the Arm
> Cortex-A78 CPU core maximum frequency (2.6 Ghz for MT8391, 3 Ghz for
> MT8189). MT8391 hardware register maps are identical to MT8189.
>
> The Genio 720-EVK board has following features:
>   - MT8391 SoC
>   - MT6365 PMIC
>   - MT6319 Buck IC
>   - MT6375 Charger IC
>   - 8GB LPDDR5 RAM
>   - 64GB eMMC 5.1
>   - 128GB UFS
>   - 20V DC Jack
>   - USB Type-C Power Adapter
>   - Micro SD card slot
>   - Push Button x 4 (Power, Reset, Download and Home Key)
>   - LED x 3 (System Power, Reset, DC-IN Power)
>   - USB Type-C Connector (USB 3.2) x 2
>   - USB Type-C Connector (USB 2.0) x 1
>   - 3.5mm Earphone Jack x 1 (with Microphone Input)
>   - 3.5mm Line Out Audio Jack x 1
>   - Analog Microphone x 1
>   - Digital Microphone x 2
>   - Gigabit Ethernet with RJ45 connector
>   - DP x 1 (Mode over USB Type-C)
>   - LVDS port x 1
>   - eDP port x 1
>   - UART x2 with serial-to-usb converters and USB Type-C connectors
>   - UART Port x 2 on Pin Header
>   - M.2 Slot x 2
>   - I2C Capacitive Touch Pad
>   - 4-Lane DSI x 1
>   - 4-Data Lane CSI x 2
>   - I2S Pin header
>   - 40-Pin 2.54mm Pin Header x 1
>   - CAN Bus x 1 (RS232 Connector)
>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/Makefile              |   1 +
>  arch/arm64/boot/dts/mediatek/mt8189.dtsi           | 920 +++++++++++++++=
++++++
>  .../boot/dts/mediatek/mt8391-genio-720-evk.dts     |  27 +
>  .../boot/dts/mediatek/mt8391-genio-common.dtsi     | 673 +++++++++++++++
>  4 files changed, 1621 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/=
mediatek/Makefile
> index a86fb313b1a9..5c75ea1ef09a 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -173,6 +173,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8395-genio-1200-ev=
k-ufs.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8390-genio-700-evk.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8390-grinn-genio-700-sbc.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8390-tungsten-smarc.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8391-genio-720-evk.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8395-kontron-3-5-sbc-i1200.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8395-radxa-nio-12l.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt8395-radxa-nio-12l-8-hd-panel.dtbo
> diff --git a/arch/arm64/boot/dts/mediatek/mt8189.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8189.dtsi
> new file mode 100644
> index 000000000000..272b1b34c953
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8189.dtsi
> @@ -0,0 +1,920 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + *
> + * Copyright (c) 2025 Collabora Ltd.
> + * Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> + */
> +
> +#include <dt-bindings/clock/mediatek,mt8189-clk.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/power/mediatek,mt8189-power.h>
> +#include <dt-bindings/phy/phy.h>
> +
> +/ {

[...]

> +       soc {
> +               compatible =3D "simple-bus";
> +               #address-cells =3D <2>;
> +               #size-cells =3D <2>;
> +               ranges;
> +               dma-ranges =3D <0x0 0x0 0x0 0x0 0x10 0x0>;
> +
> +               performance: performance-controller@108d78 {
> +                       compatible =3D "mediatek,cpufreq-hw";
> +                       reg =3D <0 0x00108d78 0 0x120>, <0 0x00108e98 0 0=
x120>;
> +                       #performance-domain-cells =3D <1>;
> +               };
> +
> +               gic: interrupt-controller@c000000 {
> +                       compatible =3D "arm,gic-v3";
> +                       reg =3D <0 0xc000000 0 0x40000>, /* distributor *=
/
> +                             <0 0xc040000 0 0x200000>; /* redistributor =
*/
> +                       interrupt-parent =3D <&gic>;
> +                       interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <4>;
> +                       #redistributor-regions =3D <1>;
> +
> +                       ppi-partitions {
> +                               ppi_cluster0: interrupt-partition-0 {
> +                                       affinity =3D <&cpu0 &cpu1 &cpu2 &=
cpu3 &cpu4 &cpu5>;
> +                               };
> +
> +                               ppi_cluster1: interrupt-partition-1 {
> +                                       affinity =3D <&cpu6 &cpu7>;
> +                               };
> +                       };
> +               };
> +
> +               apdma: dma-controller@11300b00 {
> +                       compatible =3D "mediatek,mt8189-uart-dma", "media=
tek,mt6985-uart-dma";
> +                       reg =3D <0 0x11300b00 0 0x80>,
> +                             <0 0x11300b80 0 0x80>,
> +                             <0 0x11300c00 0 0x80>,
> +                             <0 0x11300c80 0 0x80>,
> +                             <0 0x11300d00 0 0x80>,
> +                             <0 0x11300d80 0 0x80>,
> +                             <0 0x11300e00 0 0x80>,
> +                             <0 0x11300e80 0 0x80>;
> +                       interrupts =3D <GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH 0=
>,
> +                                    <GIC_SPI 433 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 437 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH 0>,
> +                                    <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       clocks =3D <&peri_ao CLK_PERAO_DMA_B>;
> +                       clock-names =3D "apdma";
> +                       dma-requests =3D <8>;
> +                       #dma-cells =3D <1>;
> +               };
> +
> +               auxadc: adc@11019000 {

The .dtsi file's device nodes should be sorted by base address.
This file's device node order is inconsistent.


ChenYu

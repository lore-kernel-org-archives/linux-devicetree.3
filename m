Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6F155931C
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 13:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873936; cv=none; b=Rx6QbCFgKahRGE3GLZLRyIKcziB+jP8DTBcez8AzG8LpvIPvGTOPmmyje7+bLgQ9jAJDQ2hAgPj3o3wR6mUOKqTw8ThEiY8nXko5U0ejzjrgew6zcukMJgYs8jMMIh0VSXenA7IPnmYNwb1AM2nd29TjpVyUfdaLbZYLpjrKV6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873936; c=relaxed/simple;
	bh=f0mYgq709TFCq8csPg+JrqYq4OhaJnj3V0e2EFq9Hko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LRdVpB9CXj0mP6/J6utl/e0zNXe0sdFoSKytoUsK4ZN/tkokvjEvXz1syU/SnbjL8AWOYNXCooGzjP75lXzqidHVaQ7nH23xMlu88be/LHaPWXH8VzzmiyGGPsc6tgj3r3Pe9cwmTiWULXvmyxFQj+WIlJdXNaFhYWrjuV2NsI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-754ac74c495so1477111137.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873922; x=1789478722;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+pD3ZYpu7WIufaA0yFsTdMjQPCG+yEiYTTg9rhn0Xuk=;
        b=cLcnAlTiAo1BU4yd3dx0fxDiDtFsF9H55YWsHm0gunZXHRWYSO/9MW4n1tnkUc/gjs
         PsTn7jdU4+Rr5rC8H/EdH2Ei/hWfTOuZHhHjAb07sphfsGfjaOFKAJDM4J3T7Bdxmmf9
         OHFntQgtyK62dfdNrLvEsdY7Inul5PipVC1z6+yRcSi4l0320EU5fCxL1WXBJ1+Cc936
         WtK+EAoTDXFy4aKxmwOwERbQisnH1+3FR/qI2MM5oquF+wGRRqjSukhqrJUhhvNJnAAM
         f0mLzby4Anw+feLmbzqaqrBExlR7MdEZrn0LKJBazqoAi8P5Bjc5IKK3BG1/xdNW2IWL
         BVqA==
X-Forwarded-Encrypted: i=1; AKwUvBzWYdCMVKjBkoYWMV0czVj3iZxxmfZxJtDuFoXZGk/aMGWXnHcESsiBi9/UTbdql93cgLtwivEUT7CC@vger.kernel.org
X-Gm-Message-State: AFuF++ljtGy+tjrqy2FYBvgckjNj9+bF22jBZrY9M535clUkZn5pf9sW
	HhWhu5G7jTkRS5Glcdd34vdUFDoTVmN7XjjWbEi1/6g7hgvo44LolDF2Ri6FsIRi
X-Gm-Gg: AYBFou0IBlJY2cHDF2LTtyP0JZoeYP+J+W69wm1Rt7lm27J9uLh2tMp93m9VJC5rtUj
	vOTP3cgUp5RrEld6BMgj+kkOUwPdzz2xu7rbACKRH22ifWm5QkGCPtWqxUhjk+LiGkEwzLf2VzW
	lzxczQ2L70jgr4Lbg7OA5cblQO2NelhQEjd7sAmrn2kPUGpORqbQk6Paps4+eouf5QBhbunsUkH
	j7fZDpODUpkYCAfNNnpEp3DbHjFePwTAHh8ZxZppiPWIs0LkcL0RWMfteKBTb2f/JI2iuwv5roa
	y15Aa/6WqPqFtJFAykPDJ+Kls75OdnbHf7UInwTDdjxTCSG51rNRGprurGCFrAEGPZPdtWYUE3H
	SKS676vSIBdfrcrt+ItD0gT9QGXyfKKECm4O0YIn7NK97OV7kWIsAx1VGMX/kADHg1hsnHPx5jR
	rFjieGbTuUu3/NtMxDPgU4e/1xMZZg8VppHhm2jmMFxMvlQRjl25dyySTFOUTQFz4sh13EV0obz
	y4tQ1cAlZT5rQhql/NbWldP8w==
X-Received: by 2002:a05:6102:160e:b0:778:5369:763d with SMTP id ada2fe7eead31-78a4a6df1c0mr10463834137.1.1788873921729;
        Tue, 08 Sep 2026 06:25:21 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808edd3d81sm9391551241.7.2026.09.08.06.25.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:25:20 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-966eabad303so1065747241.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:25:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByTcmwCdZUboP4hRnarjo16REHZe2cz8+/P1yMWK1QjM0LiqFVCZ7b1IRgyrutfUmlVWaSDPUvFLGxt@vger.kernel.org
X-Received: by 2002:a05:6102:8099:b0:76f:eaa2:6fa7 with SMTP id
 ada2fe7eead31-78a4a6d4adfmr10265477137.2.1788873917561; Tue, 08 Sep 2026
 06:25:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com> <20260826174854.199139-13-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260826174854.199139-13-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 15:25:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXM9HEZigwC+rDcJd52c+XMGZ6+8fK+5+kDYFYkSQMt2g@mail.gmail.com>
X-Gm-Features: AcwNN1WhYdmJJQf86GwJ_V-yVMFnAkWuQK8aLWwP6w9JLx712fQ14_b7YbLUDoA
Message-ID: <CAMuHMdXM9HEZigwC+rDcJd52c+XMGZ6+8fK+5+kDYFYkSQMt2g@mail.gmail.com>
Subject: Re: [PATCH v3 12/13] arm64: dts: renesas: Add DSI overlay for RZ/G3L
 SMARC EVK with ADV7535
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 26 Aug 2026 at 19:49, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add a Device Tree overlay (r9a08g046l48-smarc-dsi-adv7535.dtso) for the
> RZ/G3L (R9A08G046) SMARC EVK board to support DSI-to-HDMI output via the
> Analog Devices ADV7535 HDMI transmitter.
>
> The overlay enables the DSI controller with a 4-lane data path and the
> display unit (DU/LCDC), and configures the ADV7535 on I2C2.
>
> Update the Makefile to build the overlay as both a standalone .dtbo and
> a composite .dtb (base DTB + overlay).
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-dsi-adv7535.dtso
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: GPL-2.0

Any chance this can be "(GPL-2.0-only OR BSD-2-Clause)", like all
already existing arch/arm64/boot/dts/renesas/r9a08g046* files
(and arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi)?


> +/*
> + * Device Tree overlay for the RZ/G3L SMARC EVK with ADV7535
> + * connected to DSI and LCDC enabled.
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h>
> +
> +&{/} {
> +       osc1: cec-clock {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <12000000>;
> +       };
> +
> +       dsi-to-hdmi-out {
> +               compatible = "hdmi-connector";
> +               type = "d";

No ddc-i2c-bus?

> +
> +               port {
> +                       dsi_to_hdmi_con_out: endpoint {
> +                               remote-endpoint = <&adv7535_out>;
> +                       };
> +               };
> +       };
> +};
> +
> +&dsi {
> +       status = "okay";
> +
> +       ports {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               port@1 {
> +                       reg = <1>;
> +                       dsi_out: endpoint {
> +                               data-lanes = <1 2 3 4>;
> +                               remote-endpoint = <&adv7535_in>;
> +                       };
> +               };
> +       };
> +};
> +
> +&du {
> +       status = "okay";
> +};
> +
> +&i2c2 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +
> +       adv7535: hdmi@3d {
> +               compatible = "adi,adv7535";
> +               reg = <0x3d>;
> +
> +               interrupts-extended = <&pinctrl RZG3L_GPIO(K, 3) IRQ_TYPE_EDGE_FALLING>;
> +               clocks = <&osc1>;
> +               clock-names = "cec";
> +               avdd-supply = <&reg_1p8v>;
> +               dvdd-supply = <&reg_1p8v>;
> +               pvdd-supply = <&reg_1p8v>;
> +               a2vdd-supply = <&reg_1p8v>;
> +               v3p3-supply = <&reg_3p3v>;
> +               v1p2-supply = <&reg_1p8v>;
> +
> +               adi,dsi-lanes = <4>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               adv7535_in: endpoint {
> +                                       remote-endpoint = <&dsi_out>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg = <1>;
> +                               adv7535_out: endpoint {
> +                                       remote-endpoint = <&dsi_to_hdmi_con_out>;
> +                               };
> +                       };

No audio?

> +               };
> +       };
> +};

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9822F3FADE8
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534259; cv=pass; b=lDx8+ZrU3fogU3uxA5RhO/I38d/9xtCyh9urodgRQv2MpmvEouqLx8lH2W+m/g9OCFUOBqnW7DM7TG/wvfFPqYFEZfQ5ovwfKenqTg8jnNJV8ADkx6yTLnIgtY9fa7Hmk6f+iisS+8TIBQe8U/l3zN3CvApSK0gL0p8/cgNp12M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534259; c=relaxed/simple;
	bh=4k2Mw99a5llfRvdMVuY0Q94wOPzpx+M3oiuPKHWHcyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GrLDwHLjoRvaLBROmeekYdrP4wY6DCLBIMvgaa6T88FpQ+n0SXFm6Qf9m/+Dy9rou3Vfy4RHCsMzX+zK4OFAkFJfAUV4+aB/gwCMwqzeEJPvtIqLkEVxeDZvKEwfLfzF4MeKas2s/YVGmCnP6GDXsTFBlhMMDjSnXKVTAw37DJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=trZDIpWN; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="trZDIpWN"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-68bac6e24fdso4840673a12.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781534254; cv=none;
        d=google.com; s=arc-20240605;
        b=heLjY+RRyFeROTKUpgZiR6swB9lCeBhY8Dovql20l/H9PfW/kqFe8itRsIbaAGA87l
         n7aa21Ab8Al8sYK3lqSRg9tSC8DOluZjDt9AlBP7j5gj5U8sibHzKZn5Dw4sef+fuVjY
         kwPnRIL6GIwZDHuWzWiU5ftbgDLLP8FDwPGBtEw2iQBcwPVgzPDPoF7K5ia3FHP+6dT1
         lUExvflIE6WshHJl+hqVuKDRxd0FBj7TJAx20hRdgbpOsdWkxlkp0fFvws8d6cl6vv0B
         0xL9eQvWt7srY+xdGGsn2pjOGdhFOgepQbrEuPSavlBYHS0dr/oWGillCGpY9wmWwNcw
         SAZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pNTgpeSODbW8fA2CiQ0TTKa3WB869mQ9r3APlwXpORg=;
        fh=UhRDtcpgeAvlHgAXhOgqU4FYD082Zc8sp3uxDPiXpk4=;
        b=l1yR1VVqBPJNpCbePrqt+hZvCcFwAc1ey8x/DnbNicA2nguebgahzHRChjtPQUUJa+
         TcRVJ19UUF4ZGcRQT9SGzKG8YNyp4tqcs7tqtKK9/GfVRgy5SGmldXSH97Ujsf/VuVHT
         Rszn++l5QzU+jVbDjv30PKEdn5QysK5KgIi2GJE7nDDqfQ9jlqPbkhcULkC/4waxxhDo
         qDkqXfE7+5h5pxp20eh5eRpMO8KdlGtFZI1cbcQQCQ0BOFvd10APX1izskq25xOI+/5r
         fW5W4gn8y1P8tH+EnPa+DotQuLWFebGSOMPeabXcRO9NFZek9kCvMGIdttXvXShFGXQg
         hBKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781534254; x=1782139054; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pNTgpeSODbW8fA2CiQ0TTKa3WB869mQ9r3APlwXpORg=;
        b=trZDIpWNF9siuoK2aPxp/ZmYsdhR+pnOZJuZAuin4sUCR8WHLi9AlMnRXpkXdbKopo
         XVOzRhUJOVqfpD0cyN+bO/a6K254tJGgsDYc68v2fw/foLQcCsBPDVchcsBjAiOIthVO
         Sub+dJ/nfGrx4Ih5uW+QTIwIdLXbfkvDDGGF71FF2QekZk6cis/VaMd/kz3agQbz9Kc8
         JHmnA/+XcAci+M5eMZ4hCpZd0AgONSUUZU1Vd24enqUEmBTqLbz9vQ6UETyOvD7qG35o
         0i0JKsmveQ0jIoyO7YttX3v/bg8O/XkIiU6qPyB7x7CS+fL1s48AxgUE+4bqNlc1pDNH
         e0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534254; x=1782139054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNTgpeSODbW8fA2CiQ0TTKa3WB869mQ9r3APlwXpORg=;
        b=Ohz6Ehm/IP52pICXQP7G5AV39pbyOqm5EvYZDpmYGBlH3jPKrISP8vObDidzhLyVeO
         uUG3AJrnW0vS19tYQhsCY0f56hWzjmzbqjTP6wVxraS0oUDbpq6Og8JvwPF56xuGsBOM
         AsepCNFxkCWZgKO9RTEAce+ovpCPpS/NJzfSr/TwKN7h7oGek1UL+c6owL6mIHWm4y3V
         Zorfbb1bAWbDi4zYao23b3CbsbJpRUtiD44y3EvGNfwemlYEkp6f4LQ0MvqUeMUqemmY
         OTW+kCJ63bclGSUIhnwjgfg6MSCt1/8Qp58p4W5924LwtcKeiMraiNFMtrj6xSj4tUrO
         +EFw==
X-Forwarded-Encrypted: i=1; AFNElJ/Lb/RMeK4z4bfMg0QD1IC0HlFM+/nPvM7nLdq5j6Z0xnYIdfqqE2cDXw9XncKz3SuiVZa1Db00d+5K@vger.kernel.org
X-Gm-Message-State: AOJu0YzIP4RJmRKvyBNla/72sPkZLOmsT4b5kkNorNszfChg4+Ik9eYi
	UuO75bOTHntxQHlucvUVQfpCZv6zyrkb/09SnViVS1WIs8fh/GMnxqsNZCgVxWHILFdymeJo/DL
	MmzyeH0PrBGZlnsXQQAgUZa6ktVXSM5gkSil9+hvn8A==
X-Gm-Gg: Acq92OFXkLme6QfPF1a8JxdSCR3IROV8kIBzHls3o8e/kKjPfd3HzsDCI7h9nqXAgr9
	CxQrA0WeYYP3FrUoPjEgRMCT+2NFjWbiNLRUS1yK2fdFOsCJeSFCBVOgi0KOPwqUKJsuawLKE5q
	dBjaMgujFuDgl3vj3V23TpAo5K/lCDIoplnU2a0EcHCQ5QRKuAlAoYwmvlXtJb2PBZYjwTo3SFU
	m8c+tFlArvukLbZTmB28mUxm9+iy67F4cr5gUPaydtwpsceS/9V+9QuZjlMcq/h22JDzYbvrwGS
	aPSWXb3+ekngYF8n9Cqrawe94pp0h7c3TPF1SBQd0A==
X-Received: by 2002:a05:6402:3509:b0:691:b129:6374 with SMTP id
 4fb4d7f45d1cf-693c6bb1155mr4076869a12.20.1781534253600; Mon, 15 Jun 2026
 07:37:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260615083428epcas5p15eb83d4d631296cf4863e330542cd7dc@epcas5p1.samsung.com>
 <20260615085252.1964423-1-alim.akhtar@samsung.com> <20260615085252.1964423-5-alim.akhtar@samsung.com>
In-Reply-To: <20260615085252.1964423-5-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 15 Jun 2026 15:37:21 +0100
X-Gm-Features: AVVi8CdyAmDV3V1XLVdrgHm2SJuvGn45ObQOKAvV3zPFgvm4HNYd9FmG2O2s0Nc
Message-ID: <CADrjBPqS=d2Q02UhdpkSxHJ-RYe-hvurB-1meurTOLoUcUidFQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: exynos: add initial support for
 Samsung Exynos8855 smdk
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	hajun.sung@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Alim,

On Mon, 15 Jun 2026 at 09:34, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Add initial devicetree support for Samsung smdk board using
> Exynos8855 SoC.

I think it would be worthwhile adding a more verbose description of
the Exynos8855 SoC in the commit message e.g. a brief list of the
major IPs on the SoC.

>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
[..]
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts b/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
> new file mode 100644
> index 000000000000..f5132bcaa47c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung Exynos8855 SMDK board device tree source
> + *
> + * Copyright (C) 2026 Samsung Electronics Co., Ltd.
> + *
> + * Device tree source file for WinLink's E850-96 board which is based on
> + * Samsung Exynos8855 SoC.

E850-96 isn't based on the Exynos8855 SoC. I guess it's leftover from
a copy/paste.

regards,

Peter



> + */
> +
> +/dts-v1/;
> +
> +#include "exynos8855.dtsi"
> +
> +/ {
> +       model = "Samsung Exynos8855 SMDK board";
> +       compatible = "samsung,exynos8855-smdk","samsung,exynos8855";
> +
> +       chosen {
> +       };
> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x0 0x80000000 0x80000000>;
> +       };
> +
> +};
> +
> +&oscclk {
> +       clock-frequency = <76800000>;
> +};
> +
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> new file mode 100644
> index 000000000000..d403f41bbecb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -0,0 +1,199 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung Exynos8855 SoC device tree source
> + *
> + * Copyright (C) 2023 Samsung Electronics Co., Ltd.
> + *
> + * Samsung Exynos8855 SoC device nodes are listed in this file.
> + * Exynos8855 based board files can include this file and provide
> + * values for board specific bindings.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +       compatible = "samsung,exynos8855";
> +       #address-cells = <2>;
> +       #size-cells = <1>;
> +
> +       interrupt-parent = <&gic>;
> +
> +       aliases {
> +               pinctrl0 = &pinctrl_alive;
> +               pinctrl1 = &pinctrl_cmgp;
> +               pinctrl2 = &pinctrl_hsi_ufs;
> +               pinctrl3 = &pinctrl_peric;
> +               pinctrl4 = &pinctrl_pericmmc;
> +               pinctrl5 = &pinctrl_usi;
> +       };
> +
> +       oscclk: clock-oscclk {
> +               compatible = "fixed-clock";
> +               clock-output-names = "oscclk";
> +               #clock-cells = <0>;
> +       };
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               cpu-map {
> +                       cluster0 {
> +                               core0 {
> +                                       cpu = <&cpu0>;
> +                               };
> +                               core1 {
> +                                       cpu = <&cpu1>;
> +                               };
> +                               core2 {
> +                                       cpu = <&cpu2>;
> +                               };
> +                               core3 {
> +                                       cpu = <&cpu3>;
> +                               };
> +                       };
> +
> +                       cluster1 {
> +                               core0 {
> +                                       cpu = <&cpu4>;
> +                               };
> +                               core1 {
> +                                       cpu = <&cpu5>;
> +                               };
> +                               core2 {
> +                                       cpu = <&cpu6>;
> +                               };
> +                       };
> +
> +                       cluster2 {
> +                               core0 {
> +                                       cpu = <&cpu7>;
> +                               };
> +                       };
> +               };
> +
> +               cpu0: cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a520";
> +                       reg = <0x0>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu1: cpu@100 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a520";
> +                       reg = <0x100>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu2: cpu@200 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a520";
> +                       reg = <0x200>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu3: cpu@300 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a520";
> +                       reg = <0x300>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu4: cpu@400 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a720";
> +                       reg = <0x400>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu5: cpu@500 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a720";
> +                       reg = <0x500>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu6: cpu@600 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a720";
> +                       reg = <0x600>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu7: cpu@700 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a720";
> +                       reg = <0x700>;
> +                       enable-method = "psci";
> +               };
> +       };
> +
> +       psci {
> +               compatible = "arm,psci-1.0";
> +               method = "smc";
> +       };
> +
> +       soc: soc@0 {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges = <0x0 0x0 0x0 0x20000000>;
> +
> +               gic: interrupt-controller@10200000 {
> +                       compatible = "arm,gic-v3";
> +                       #interrupt-cells = <3>;
> +                       interrupt-controller;
> +                       reg = <0x10200000 0x10000>,
> +                             <0x10240000 0x140000>;
> +                       interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               pinctrl_alive: pinctrl@11850000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x11850000 0x1000>;
> +
> +                       wakeup-interrupt-controller {
> +                               compatible = "samsung,exynos850-wakeup-eint",
> +                                            "samsung,exynos7-wakeup-eint";
> +                       };
> +               };
> +
> +               pinctrl_cmgp: pinctrl@12030000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x12030000 0x1000>;
> +               };
> +
> +               pinctrl_usi: pinctrl@15030000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x15030000 0x1000>;
> +               };
> +
> +               pinctrl_peric: pinctrl@15440000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x15440000 0x1000>;
> +               };
> +
> +               pinctrl_pericmmc: pinctrl@154f0000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x154f0000 0x1000>;
> +               };
> +
> +               pinctrl_hsi_ufs: pinctrl@17040000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x17040000 0x1000>;
> +               };
> +       };
> +
> +       timer {
> +               compatible = "arm,armv8-timer";
> +               /* Hypervisor Virtual Timer interrupt is not wired to GIC */
> +               interrupts =
> +                    <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +                    <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +                    <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +                    <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +       };
> +};
> +
> +#include "exynos8855-pinctrl.dtsi"
> --
> 2.34.1
>

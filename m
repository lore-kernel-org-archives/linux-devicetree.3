Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866E232FA2C
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 03:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782963523; cv=none; b=u/k++5l2bC+G5tls8kNwSzdwKnoM0VU8esiGdSkptw0AquYg0npZbyD8d/KWuEUMVUXPhfRsxVEHZGTgEsVO1adII0ZVPYwdbMypcB836BBaFaa1y7izz0Lm2/GARJ/9Y/ICGYoyfoShrv5kVG64d14SziU463H8SaZ6vcw6y3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782963523; c=relaxed/simple;
	bh=KzWBJrt0LTfwXDmdDpphpR4xZvwOIhGKBcmFfnwRM04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxnrz0NhhU0MZ5UPuGCc/6ZAf9HjMuPD8WgP63So6A7VNDvL4sQwYaayY0YIgzjCXJvgXM8lwEdK2cDPyDdCLix58xsD2Fdzmv0QLV73XA8mN/N/Us1NiljyixZhoms2K/XABpQuVnDSPJIa7XXC+d4fi3M1wcnmnzpplt0MbZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzUuHddu; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzUuHddu"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37e11438c66so714427a91.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 20:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782963519; x=1783568319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=avurPdrjTdWxBa40lvn4lDnsj5ihohdyVToiWVzOQRs=;
        b=nzUuHddu73V4FVXChzfSwQqvx6YenZgODM5o0S/YvKOOZS9miQQZN1lPWamkkNOiUk
         C0LEPnDzklVMYE5gVyF/HT6Ws1Fk6whte/Pnfq+EUkRNKKAUmhMv9C+qkzv7ebl2IVll
         puVBHp/CoLpJtbdMDEtSw1qOlVkLd7ifoCi0en4f8ognGgl1eUXjVMZnsCUp2+eK1C9C
         SzPq6XICQGjQ03SFU+Y+W2mpo+gfdAQkahwt/brwpPJykOr7ucMQksPYf0/sJDp+Yq1t
         Spj1XbGjGH98H4xCsqS7x9GF3RDUtdoKVFA2fTiFsBcapdkJtacCOv6NqEjTNdYWwt31
         dm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782963519; x=1783568319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avurPdrjTdWxBa40lvn4lDnsj5ihohdyVToiWVzOQRs=;
        b=URZX9f5Q/nkHR5M5mHvrn8y9ic0cWRbycZR2r+xbizi/vwSRX0TUdTLBcttG+MhzQj
         OzHrOOjqZ94VwWDZJIRZZ3IvnVqOTEdxGjQeefZEENaZzBGouC0IOCWlmezvY/2Fmnis
         iYQ8a/651wzknTwMgtg7t6P1be+Qso0d7mhEdqd16alZrAPwSuxskb7Xl2cGfFS1cDsK
         2eUl4SyVv8UpxGuEfd2CGs7sYp9hr6iFOO1o3AKD/gg2kDsZSluhji7R4+bSQJL6WYWr
         SI1C2cUHO6R1/KWaQ+c3Pk9tNDJfjElkUJB2ZDupI7YQmSxMTzyzM4f+Hi0oI3JBe34M
         TD5A==
X-Forwarded-Encrypted: i=1; AHgh+RqALOVC2SWeIzyy8AM7c5ctpr6uKyLYAZ1kB0ExT/X9CQpS8rPVhQQPTzaYAhjzyYGYSagtUNXN2dTl@vger.kernel.org
X-Gm-Message-State: AOJu0YwM7EHIqNxH18TPhKLjujoIKf5npVp4xTBV/X0SqlhxOcLSMMVw
	bsIMEjmSwe8Hel7BUwITR0oxcG3Nzd+8bQpGyreW8UcF86mJdAVQFdLP
X-Gm-Gg: AfdE7cn/q3C+Srw8+q9xn2xvJH8FZ7GujArHSTxW85lJaxzEvOu9mxzpLBHgRDXaGqe
	+X0qeCFJlVr6L1ShmXZlw5xGGgi6kFKkTc5Q2pGptIRzm5+ZXnuCNIzJhvCIKNCU07xo8jbRshH
	LqfBMtfrxG07Jk6ecBGTjDZ4ta44yxVUJvVtA3aWkOJ6/YH/gv+X239d8zb+LF67Gpz8se1xhuo
	2Ul5xbgf1NHRmIMo6a3jFBuaPFAJs1uZgC6lpoDrlw++gK5r9zm2puCODB3W2ZTl886ebSD5g3J
	2aZvn7as4DI4u54GGqyiag7+Llgd6h8w2puRaGyo83CiC0df0LCNKh+VlDKuKnigddr2uzK/3f4
	u62A8BEbonCmY9UkgS1m3yyo7nIOpj1C9E1WHXDbNTQRnlG/qJEVe0k+tMMMZ6ZH1
X-Received: by 2002:a17:90b:314d:b0:37f:9ce2:348b with SMTP id 98e67ed59e1d1-380aa207d9amr4283004a91.28.1782963519037;
        Wed, 01 Jul 2026 20:38:39 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e15e7032sm256154a91.7.2026.07.01.20.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 20:38:38 -0700 (PDT)
Date: Thu, 2 Jul 2026 11:38:09 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, unicorn_wang@outlook.com, 
	inochiama@gmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Han Gao <rabenda.cn@gmail.com>, 
	Nutty Liu <liujingqi@lanxincomputing.com>, Longbin Li <looong.bin@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] riscv: dts: sophgo: Add Milk-V Duo 256M board
 support
Message-ID: <akXbk7l9bZ_W0GLR@inochi.infowork>
References: <20260610121026.1517621-1-chenyou910331@gmail.com>
 <20260610121026.1517621-2-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610121026.1517621-2-chenyou910331@gmail.com>

On Wed, Jun 10, 2026 at 08:10:10PM +0800, Chen-Yu Yeh wrote:
> The Milk-V Duo 256M is a small form factor development board based on
> the Sophgo SG2002 SoC.
> 
> This patch adds basic device tree support for the board, including:
> - UART console
> - SD/MMC controller
> - USB host
> - Onboard blue status LED (connected to PWR_GPIO[2] / porte 2)
> 

> Tested on actual Milk-V Duo 256M hardware, verified boot to shell and
> heartbeat LED functionality.
> 

IIRC the led is not controlled by the small core, so the node should
be described in the dts.

I see the Sashiko does provide some good question, please check.

> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
> Changes since v1:
> - Removed the leds node because &porte is not yet supported in cv180x.dtsi,
>   which would cause a dtc compilation error.
> - Retained the &usb node because it is already defined in cv180x.dtsi.
> - Cleaned up the trailing blank line in the Makefile.
> 
>  arch/riscv/boot/dts/sophgo/Makefile           |   3 +-
>  .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  | 108 ++++++++++++++++++
>  2 files changed, 110 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> 
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> index 6f65526d4193..f9415c30a2c5 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -2,7 +2,8 @@
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
> -dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
> \ No newline at end of file


Why you change this? Please do not touch unrelated things.

> diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> new file mode 100644
> index 000000000000..4cf441ab3790
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>

I guess a right copyright is needed for your code.

> + */
> +
> +/dts-v1/;
> +
> +#include "sg2002.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "Milk-V Duo 256M";
> +	compatible = "milkv,duo256m", "sophgo,sg2002";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +		serial4 = &uart4;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		coprocessor_rtos: region@83f40000 {
> +			reg = <0x83f40000 0xc0000>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&osc {
> +	clock-frequency = <25000000>;
> +};
> +
> +&pinctrl {
> +	uart0_cfg: uart0-cfg {
> +		uart0-pins {
> +			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
> +				 <PINMUX(PIN_UART0_RX, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +	};
> +
> +	sdhci0_cfg: sdhci0-cfg {
> +		sdhci0-clk-pins {
> +			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <16100>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-cmd-pins {
> +			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-data-pins {
> +			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
> +				 <PINMUX(PIN_SD0_D1, 0)>,
> +				 <PINMUX(PIN_SD0_D2, 0)>,
> +				 <PINMUX(PIN_SD0_D3, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +
> +		sdhci0-cd-pins {
> +			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <10800>;
> +			power-source = <3300>;
> +		};
> +	};
> +};
> +
> +&sdhci0 {
> +	pinctrl-0 = <&sdhci0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +	bus-width = <4>;
> +	no-1-8-v;
> +	no-mmc;
> +	no-sdio;
> +	disable-wp;
> +};
> +
> +&uart0 {
> +	pinctrl-0 = <&uart0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&usb {
> +	dr_mode = "host";
> +	status = "okay";
> +};
> -- 
> 2.43.0
> 

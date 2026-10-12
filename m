Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170C648987F
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 17:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791825562; cv=none; b=UoG18pjKhs6t0iHJUlzYEgjReBZkFrGXfNfyHjogWL6qx96k8f6PUEUuPhFNiMlKWkjxZJLgNG+sKbnV5/VDBU9wp/KJdRge7L4cz+mTodf/bgCe8+WE9rnUvDJKinnacoO+/dKUKmw3NyKDzu2cAGRZuDp1qIXHEaIsCUJMaa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791825562; c=relaxed/simple;
	bh=xuHYOzqVDPF+T7DHJcXAkuDGTk5erdnYgh1uJDWbuqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EmdpT9JXs1ovVsMujwzIYlFrVhM0UhZ9Wt4wAV2FJMH7ZWZhns2ok6SHg8D3o6KWYxSzhT+j4kvludxlniemehb6PoQeGEse26TirYS8rtZ6ob8ihHONR+dGxoWKSI0zvQ9FyopsikJjKVNW2/5V4hRiIxuvbfvExIah93c7jNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=LdK4pH6I; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="LdK4pH6I"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48afe75f055so1977037f8f.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 10:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1791825557; x=1792430357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmWhe9edetnI1XYoSUk/a0gFm8QWgHCjQdahFD9uVho=;
        b=LdK4pH6I7Yzumf0mZ0A5q3/1aTQbSY3iQrtBa8521viG++vQ/VWcqERrE+sONb43VD
         u6kCbJNWDq0xyqEzcW0r2mXCiPK6v7XEzWHwWULHKhr//sIc/42pN6YaTCkMrUCUwpqa
         h0BVBRkjmtls3MnGTX9Qz08ohbt6iHZLFnqw59MRS22ZP6T3AMkAU8wVG6jbJSEjkxlP
         KF3rhp+hpbzU2kICW6lYD11H07IbVdQ0rkpnKv3P9+KIs1z8JU1/Bpg3D1ctSIciLG9h
         xwsk8PIUForfICivt1utvl9/M3acpwm5C0CgtIxWai9eTuKRVWSFBh1bur+XJGFUoPZL
         tWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791825557; x=1792430357;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmWhe9edetnI1XYoSUk/a0gFm8QWgHCjQdahFD9uVho=;
        b=0DbA9Qg0Zq4iy5kNz1hIZaPDb1MLZ37+4YuLSnCHnpshNekK5r/8leCgDtstskPvT7
         NK9GSxPZ59FtLdkCu/xTJey0tFhb0fDwZ1XYwsFEgub9X9EbpwllAyhd9KwYQ4+4JBuD
         uD6RbyAb6UOlaSM697b62cCHNvuPcCVWoyh0irKUqF+jhQ2W9v5EY8rxxyO2trYRd6Wg
         vTBWjRQFZVtwNApMGz/72iJ+sMIgmKsx70Vxuo8L9WlvLdC8ezU20VuuvYFTyJZbH1vL
         bGe7yYFwouhR7oCDBUqYS9q/MpAZQ6D5WXvr51GDmmBfb36cWP9Xa1vtwjJMIhlcmZBh
         96ow==
X-Gm-Message-State: AFq9FYLj5BvNm78v04mufgNd0jUD0WkXmmpRB43i4oKZfvxJuM8pQoGe
	F04j1fmseX0ALMNm1US4o71vAEOibQKZRQ8d4/xQ8/A1+KQEkS88GHcvTSm3SPzvMSFXjW+CIfM
	hLBzJ
X-Gm-Gg: AYBFou0q/CsyUs1MikvavoArUdoZi93C2F86Q7qOUEMD6/lACzJMMQ1z0mx0MolUOVw
	/l90GRF3I96Ky9cwXQlZc0POEqQ8CF4CiMgcr2Kv8Fr3/sS/4GEsJEPOQLnCcJYAT95hcnO2PaX
	8yT8AGKBvJTuQMTlpE0BaCieMvs50+DesYirW/F+Qgja/B8qn/CoaYuBv8kMYW1OAfXZjHqSl84
	7ydmbsW3hHPrBPj3m0Eaz+sH9EMTNAI1+rIJBy/Xhpbuy9kOqj4yyVRE4LRKrKkFOZQAZMOPyf4
	kANeW31rbpc7RERKCSD/SjG7Ji+sh3qEH2Lo8USNsfC+IIjNIMcXa+lxz/WoP+8QU/VFf6QbmZs
	QwMcPpdAtACA0yakXBGL7UMbPG0hHOGQyHYPkRHiQWvYbjmRWPbLvSZJh+vWC80iCeMWBvrA+Nq
	9NOiwWKhgdTeAt41locm+/fmw8UXYEjLW2I2fKR/wU4nXKV+EfIpfnVXusLC4zB/swSiLbfKiYq
	SMG/0rTXPeNmjJ94/Hvtr6BUmdU/isyvJ1M/vVAOE6O8+6CQt5b5j8aDcjXI3E=
X-Received: by 2002:a5d:5291:0:b0:486:f3db:e0f2 with SMTP id ffacd0b85a97d-48dbaade0b3mr13920551f8f.14.1791825555359;
        Mon, 12 Oct 2026 10:19:15 -0700 (PDT)
Received: from ?IPV6:2a01:599:840:e202:6f88:7a35:3ae9:6d10? ([2a01:599:840:e202:6f88:7a35:3ae9:6d10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm437267f8f.48.2026.10.12.10.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 10:19:15 -0700 (PDT)
Message-ID: <7d703c43-e462-41d6-a488-87342fd139a2@9elements.com>
Date: Mon, 12 Oct 2026 19:19:13 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ARM: dts: aspeed: add Intel AVCRP BMC
To: Dawid Glazik <dawid.glazik@linux.intel.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 maciej.lawniczak@intel.com
References: <cover.1791825961.git.dawid.glazik@linux.intel.com>
 <12f8124fea31a6c6b1401d6aee640842c8d896a7.1791825961.git.dawid.glazik@linux.intel.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <12f8124fea31a6c6b1401d6aee640842c8d896a7.1791825961.git.dawid.glazik@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/12/26 7:39 PM, Dawid Glazik wrote:
> Add the initial AST2600 device tree for the Intel AVCRP BMC platform.
> 
> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>

You got Review trailers from Andrew Lunn in v1. Unless you think Andrew 
has to re-review it (which should be then reasoned), please keep them in 
new revisions.

 From the kernel docs [0]:

"Both Tested-by and Reviewed-by tags, once received on mailing list from 
tester or reviewer, should be added by author to the applicable patches 
when sending next versions. However if the patch has changed 
substantially in following version, these tags might not be applicable 
anymore and thus should be removed. Usually removal of someone’s 
Acked-by, Tested-by or Reviewed-by tags should be mentioned in the patch 
changelog with an explanation (after the ‘---’ separator)."

> ---
> v2:
>   - Replace bootargs console=ttyS4,115200n8 with stdout-path = &uart5
>   - Remove the unreferenced video_memory reserved-memory node
> ---
>   arch/arm/boot/dts/aspeed/Makefile             |   1 +
>   .../dts/aspeed/aspeed-bmc-intel-avcrp.dts     | 315 ++++++++++++++++++
>   2 files changed, 316 insertions(+)
>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> 
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
> index 767f7c7652d5..ea4645ef9872 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -54,6 +54,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>   	aspeed-bmc-ibm-rainier-4u.dtb \
>   	aspeed-bmc-ibm-sbp1.dtb \
>   	aspeed-bmc-ibm-system1.dtb \
> +	aspeed-bmc-intel-avcrp.dtb \
>   	aspeed-bmc-intel-s2600wf.dtb \
>   	aspeed-bmc-inspur-fp5280g2.dtb \
>   	aspeed-bmc-inspur-nf5280m6.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> new file mode 100644
> index 000000000000..7c088c89d417
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> @@ -0,0 +1,315 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2026 Intel Corporation
> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model = "Intel AVCRP BMC";
> +	compatible = "intel,avcrp-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial4 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "earlycon";
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x40000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		video_engine_memory: jpegbuffer {
> +			size = <0x02000000>; /* 32M */
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +	};
> +
> +};
> +
> +&rtc {
> +	status = "okay";
> +};

Please sort your nodes, as described in the device tree design guideline 
[1]. There's also a tool called `scripts/dtc/dt-check-style` that can 
help with this.
Note on that: we usually run `--mode strict` but it is known to report 
false-positives, so please check any reported errors twice ^^

> +
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "bmc";
> +		spi-rx-bus-width = <4>;
> +		spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout-64.dtsi"
> +	};
> +};
> +
> +&uart1 {
> +	status = "okay";
> +};
> +
> +&uart3 {
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	status = "okay";
> +};
> +
> +&uart5 {
> +	status = "okay";
> +};
> +
> +&uart_routing {
> +	status = "okay";
> +};
> +
> +&mdio1 {
> +	status = "okay";
> +
> +	ethphy1: ethernet-phy@0 {
> +		compatible = "ethernet-phy-id001c.c916";
> +		reg = <0>;
> +		reset-gpios = <&gpio0 ASPEED_GPIO(C, 1) GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <10000>;
> +		reset-deassert-us = <50000>;
> +	};
> +};
> +
> +&mac1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii2_default>;
> +	clocks = <&syscon ASPEED_CLK_GATE_MAC2CLK>,
> +		 <&syscon ASPEED_CLK_MAC2RCLK>;
> +	clock-names = "MACCLK", "RCLK";
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy1>;
> +};
> +
> +&lpc {
> +	lpc_snoop: lpc-snoop@80 {
> +		snoop-ports = <0x80>;
> +		status = "okay";
> +	};

Why's this named if you don't use it as reference anywhere.

> +};
> +
> +&i3c_global {
> +	status = "okay";
> +};

That's enabled by default.

> +
> +&vhub {
> +	status = "okay";
> +};
> +
> +&video {
> +	status = "okay";
> +	memory-region = <&video_engine_memory>;
> +};
> +
> +&gpio0 {
> +	gpio-line-names =
> +		/*A0-A7*/ "", "", "", "", "SMB_CPU_PIROM_SCL", "SMB_CPU_PIROM_SDA",
> +				"SMB_IPMB_STBY_LVC3_SCL", "SMB_IPMB_STBY_LVC3_SDA",
> +		/*B0-B7*/ "", "", "", "FM_CPU1_ERR2_LVT3_N",
> +				"RGMII_BMC_RMM4_LVC3_R_MDC", "RGMII_BMC_RMM4_LVC3_R_MDIO",

Why do you name reserved GPIO lines (in this case the RGMII lines)? 
They're used by the kernel anyways.

Tan

[0] 
https://docs.kernel.org/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes
[1] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

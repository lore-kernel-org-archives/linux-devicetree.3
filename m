Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC1731AA8F
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 18:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787249045; cv=none; b=UX1HPEdYPki9K++OjrJ60MdNmVvGpS0tlxWC3FDUKBk3C1oQOGBsGlydP0smsthAZbYyfvSyATxlGoabsK9lF1TbzfjJsdrpGHFsCQN2Ph5zUDLYtD3/5dUwWIVw4TOY3oKZTmcA3F5TGSA8xoW/xZ7kdeVedLfesmswVLX2qe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787249045; c=relaxed/simple;
	bh=xkWAHbvERekeZVhLd1I6wnLOphqgBrouvz38NaGNYY4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=r0pQ8zTRW0DrdzTpqHbixad+mP3VNaPFoDYjvy039TeXmU1T+NzqiahZPGqFTJDHSvpe1ujONUN6t8o/7/9gNJrlHBi3I1N5+OwxlW89L3f1w1vbVovLa8I1X8K/r+rAStOI7eStpUOxkQPJ7Q7in0oFdoK4rhFblUzMeI8rzpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=QgJpWXMB; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="QgJpWXMB"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47de0093c42so177558f8f.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 11:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787249042; x=1787853842; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v0qjpTqnwOT8F+S6Xael7lBooJw6Dvt+DoYZ8ijRRr4=;
        b=QgJpWXMB7Cpv5oGCLOVoIUBt6V6rk27sqmPfpmbfauNLKuRHE3au/LU+oW9v78DRlL
         fDUN1KeLmCIoTRArq8ejjAgGJkXF/0lro+1EGyTdAlZP67WMKkU6IQeaa2Inq/KxLslC
         Hi2yEErne2Slio10CmvO9YKLtXLh9bMl5K+gABpw6NzTags/1UgeuKOilsIZ58NPSfSh
         UwADI5/f7VatOXGWNq5raf8suy/sRsAefDa0juGfku3+kljvT+mC/Lyo99mQ5rf4UX5C
         Q4S0KQaBNg0A6W+XcKNaNhsePzwAzflYPmRkhLP25ryhV17f1qh3s7bRaa/pQvRBYE6z
         ECyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787249042; x=1787853842;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v0qjpTqnwOT8F+S6Xael7lBooJw6Dvt+DoYZ8ijRRr4=;
        b=aH3mmFnXvQL4a8WyK+/KOf6PteWIAB/P7RdmI4+h7sHK+9qst8VkpxUrsXYNPUHXqx
         ZH93zm8ktrzfvql4LF62etrcP17TlLMBOLFxdXEpjjpztoSpE66tF/POtINglIYCh5uY
         aqSVh8fPOHSUdGMh228sO1UbwghIFWuG8+ciEo5Zjqt4eXt9YdZHwmW8DLZEGq4R3Vwk
         4qNbGZXs4uv53foQGzSvQtgbSa85dLlrMxCfvo7HOG/Zsho/rZvW84eRfwOGURm7FyP5
         ErzahPoj4avrZwbP5JuoUIOEmqlSZ9/4DVcsDvqTBIDCgypu9TPTkmzzmtz0F50p4mYO
         mucg==
X-Forwarded-Encrypted: i=1; AHgh+Rou7QN/maeCWw3o/IDgm7MWifuIJJFSqDqhxwtmd1nmnrm0SwXuyS/LYW3gFqf+pXDHMiDPDnn8e9/s@vger.kernel.org
X-Gm-Message-State: AFuF++mFU0MpbgwQnjjZDp8j8YLiCpC2b9eda9B2VOKNbNxXXO9eKMbm
	9g7scZlvosTPWxKKJXWyefdj5KaoDU4b1SZQPY1zXnGe3V/CSmhny7ZNkp13fHR27jk=
X-Gm-Gg: AR+sD102Dcxf8HmhlslgyVCPxrvQbiCFfKwwSwCaSziKG+RC3JKz38PJVkLqn8NfwfT
	85+iVfqIiJMhX78j2d9+mTw2MD7g4n6vFr2ggIXh5e1wb9XQNYNCVHFO6REKcLfwliBXPuAfQbv
	toRXkoOw+VrkBaj9Kx5NnZ3pZC1S/+/lZKBHwOCB9SY1+jZV2CNYaAE9Eyl3LDrvCVBG6ZyuIQV
	SEGtWfUrJSkvhl8b2Uo9ccDBoMc8ukO3kQfzNHHxOKGV4qVdjlyO67gvX/vZm586aomlLQe5Z7+
	IbZMwb/7370AyWFJumjEYc/AdcUo8XeRnnhaxJGzS+kmLqpPtvXyM5Ea87plmb6QWj0WicVvVFj
	sjCOX7795clEpgNGlb9ylByUQ0g4mYxcHIo+woGhfTq1iWTeNpOW3eSkK2qnuU23pJQXErSO/76
	TiqXRQ7jmBZjF+JZ1JZibfNSFygznX/xIyzpUsT6OdJZ2ymSIe2zvNA9lz1RUECrCxqz5oQMWWA
	fWLSA==
X-Received: by 2002:a05:6000:310f:b0:481:5bce:4485 with SMTP id ffacd0b85a97d-482c0b973acmr747490f8f.13.1787249041680;
        Thu, 20 Aug 2026 11:04:01 -0700 (PDT)
Received: from white-mocha.local ([2001:9e8:2f3:2d01:a8c3:fb9e:cfe9:fc36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b7d4asm12416365f8f.21.2026.08.20.11.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 11:04:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2
 BMC
From: Tan Siewert <tan.siewert@9elements.com>
To: Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Tan Siewert <tan.siewert@9elements.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260727-ventura2_initial_dts-v9-2-504c0ec68039@gmail.com>
References: <20260727-ventura2_initial_dts-v9-0-504c0ec68039@gmail.com>
 <20260727-ventura2_initial_dts-v9-2-504c0ec68039@gmail.com>
Date: Thu, 20 Aug 2026 20:03:47 +0200
Message-Id: <178724902712.20555.7009712214570349708.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787249032; l=5992;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=xkWAHbvERekeZVhLd1I6wnLOphqgBrouvz38NaGNYY4=;
 b=0/jvytgo6mJLzFT571ev1e0JoXXcjVpaJpVyrgS3abI7bpwqvu3jemBPBCGtwqkZJ3BFd3enh
 VJQBdxWcwzhDGwXmSyj1PsTyM3CxG6hUAZpOcnhFY2e96Lc39yXoCz4
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

Hi Kyle,

> Ventura2 is a Rack Management Controller. It is a modular
> device designed to manage liquid cooling systems and monitor hardware
> states within an IT rack. The system uses an AST2600 BMC for management.
> 
> RMCv2 serves several critical roles:
> - Detects liquid leakage at both tray and rack levels.
> - Communicates with and controls liquid cooling equipment.
> - Manages leakage events and executes system recovery protocols.
> 
> Key hardware features include:
> - An extensive I2C and IO expander topology to support comprehensive
>   sensor monitoring and backward compatibility with legacy trays.
> - MCTP over I2C support for asynchronous device communications.
> - A dual-flash design for BMC firmware redundancy.
> 
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>

*snip*

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> new file mode 100644
> index 000000000000..f1273ca31bf8
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> @@ -0,0 +1,3005 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2023 Facebook Inc.
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/i2c/i2c.h>
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	compatible = "facebook,ventura2-rmc", "aspeed,ast2600";
> +	model = "Facebook Ventura2 RMC";
> +
> +	aliases {
> +		/*
> +		* Pre-allocate I2C bus aliases for userspace predictability.
> +		* Several I2C channels are intentionally left empty in this
> +		* DTS as they are strictly reserved for future hardware
> +		* feature expansions and add-on boards that will interface
> +		* with these busses.
> +		*/
> +		/*
> +		* i2c switch 0-0077, pca9548, 8 child channels assigned
> +		* with bus number 16-23.
> +		*/

This alignment is one of the things that seem to be a false-positive for
dt-check-style in strict mode (value-whitespace). See [0] where Krzysztof said
that it may report false-positives, and "Review and investigate warnings from
'strict' mode, but do not fix them automatically without thinking".

@Krzysztof wdyt about this one?

> +		i2c16 = &i2c0mux0ch0;
> +		i2c17 = &i2c0mux0ch1;
> +		i2c18 = &i2c0mux0ch2;
> +		i2c19 = &i2c0mux0ch3;
> +		i2c20 = &i2c0mux0ch4;
> +		i2c21 = &i2c0mux0ch5;
> +		i2c22 = &i2c0mux0ch6;
> +		i2c23 = &i2c0mux0ch7;

*snip*

> +	spi {
> +		compatible = "spi-gpio";
> +		#address-cells = <1>;
> +		cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
> +		miso-gpios = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
> +		mosi-gpios = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
> +		num-chipselects = <1>;
> +		sck-gpios = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
> +		#size-cells = <0>;

Shouldn't #address-cells and #size-cells be ordered together? If reported by
dt-check-style as issue, then it might be a false-positive.

> +
> +		tpm@0 {
> +			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
> +			reg = <0>;
> +			spi-max-frequency = <33000000>;
> +		};
> +	};
> +};
> +
> +&adc0 {
> +	pinctrl-0 =
> +		<&pinctrl_adc0_default &pinctrl_adc1_default
> +		&pinctrl_adc2_default &pinctrl_adc3_default
> +		&pinctrl_adc4_default &pinctrl_adc5_default
> +		&pinctrl_adc6_default &pinctrl_adc7_default>;
> +	pinctrl-names = "default";
> +	vref-supply = <&p1v8_bmc_aux>;
> +
> +	status = "okay";
> +};
> +
> +&adc1 {
> +	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc10_default>;
> +	pinctrl-names = "default";
> +	vref-supply = <&p2v5_bmc_aux>;
> +
> +	status = "okay";
> +};
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&ehci1 {
> +	status = "okay";
> +};
> +
> +&fmc {
> +	status = "okay";
> +
> +	flash@0 {
> +		label = "bmc";
> +		spi-max-frequency = <50000000>;
> +		m25p,fast-read;
> +
> +		status = "okay";
> +		#include "openbmc-flash-layout-128.dtsi"
> +	};
> +
> +	flash@1 {
> +		label = "alt-bmc";
> +		spi-max-frequency = <50000000>;
> +		m25p,fast-read;
> +
> +		status = "okay";

Missing '#include "openbmc-flash-layout-128-alt.dtsi"'?

> +	};
> +};

*snip*

> +&mac2 {
> +	phy-mode = "rmii";
> +	pinctrl-0 = <&pinctrl_rmii3_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +
> +	/*
> +	* The Marvell 88E6393X is initialized at boot via EEPROM
> +	* configuration and hardware straps.
> +	* The BMC connects via an RMII fixed-link; link parameters are fixed
> +	* by board design.
> +	*/

This kind of writing gives me the suspicion that it was written with assistance
by an LLM, but I might be wrong.

Either way, if you have used AI assistance for your series (or only for this
patch), even if you have only used it for the commit message, then you must
declare it via the "Assisted-by" trailer [1][2].

> +	fixed-link {
> +		full-duplex;
> +		speed = <100>;
> +	};
> +};
> +
> +&mac3 {
> +	pinctrl-0 = <&pinctrl_rmii4_default>;
> +	pinctrl-names = "default";
> +	use-ncsi;
> +
> +	status = "okay";
> +};
> +
> +&peci0 {
> +	status = "okay";
> +};

You mentioned that this is a rack management controller. Does it really require
PECI?

> +
> +&sgpiom0 {
> +	bus-frequency = <100000>;
> +	gpio-line-names =
> +	/*"input pin","output pin"*/
> +	/*A0 - A7*/
> +		"power-chassis-good","FM_PLD_HEARTBEAT_LVC3_R",
> +		"host0-ready","R_BMC_PTH_RST_BTN_L",
> +		"CONTROL_VT2_SUPPLY1_CLOSE","FM_MDIO_SW_SEL_PLD",
> +		"CONTROL_VT2_SUPPLY2_CLOSE","FM_88E6393X_BIN_UPDATE_EN_N",
> +		"CONTROL_VT2_SUPPLY3_CLOSE","Sequence_TransFR_Alert",

Why's "Sequence_TransFR_Alert" written in camelcase?

Tan

[0] https://lore.kernel.org/linux-aspeed/3523fefc-8ba8-4512-b088-7a94a2df73f8@oss.qualcomm.com/
[1] https://docs.kernel.org/process/submitting-patches.html#using-assisted-by
[2] https://docs.kernel.org/process/coding-assistants.html

-- 
Tan Siewert <tan.siewert@9elements.com>

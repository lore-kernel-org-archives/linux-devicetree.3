Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202051991CB;
	Tue, 26 May 2026 02:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779763189; cv=none; b=Je1nV2AX8n0IiOQ0dyXju1SZs1koRMx84oecHKXaJsN3uHrOpgGimj/wygLGrpSSGqFVE4t+2AwmQ7YDBF83OaOzlkoTB1CkSXklzHOkOtcItzzRq21DGW1luWGaa8DKC3zg72EzpTEv5UgnY7t15uQhUatFavI9bFXh55F8swQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779763189; c=relaxed/simple;
	bh=6dfm7iYsP3WeHjhVLTmHyzmJ7F1FazC4kbkpPSNmrFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZI4siSPA4vd2zPlADMnwLPd28tZci/KopRmIxRp9UQ6Kja9kexyss1Ys10C/IIbJBjCDInPFEcGe81UhyUIMiMJLbatIT/+oF/eAqw5FyKpGUPap7HUmk/O0cHo8rT9NqoONFgx5UlwYeImY5bN6529RShfyM3qzoSdVkJlB5Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmKBJ0MN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmKBJ0MN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3071F000E9;
	Tue, 26 May 2026 02:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779763187;
	bh=SVx3n8jijEwHwQnlzIPCrnIHYDEfWf7NE5IKvAA6/EU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AmKBJ0MNwYy31ipCXQWPvdxo/546zfX3okmDK5YBXKu+jaatRs/YKf2o/UKyaNWzR
	 PUBvoG+0hx6ruIp/9YBq2B1KpM9YY5Pbi8PEPtQWXv/HvRi64dKPgKBSzgILcKoitc
	 pcddrSzLxbaZ00hCwehR65CCZVn7B58WfdBPrh8cwWRDxTDyE72zjpRLemwcbkfSN5
	 IdHRwQmfSZeLHGEZabs++jZOxXr8gM2fcLdlK/3AXr3jbHAIPd+w2o61JZMDkgvCvd
	 FRD5nlWD/8FDEAupArrqKukO+gnfFc2paNaDfEpJQ0vi6xytJYFeRJ4NWXdKoEeZnt
	 TNNXdQI+4WhuA==
Message-ID: <d295b574-a66b-4388-be46-e770844d5ad4@kernel.org>
Date: Mon, 25 May 2026 21:39:46 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: agilex5: add support for debug
 daughter card
Content-Language: en-US
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Niravkumar L Rabara <nirav.rabara@altera.com>
References: <cover.1779438754.git.adrian.ho.yin.ng@altera.com>
 <770778e3e66aab0ccb24c9197f5e63050a7f73cd.1779438754.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <770778e3e66aab0ccb24c9197f5e63050a7f73cd.1779438754.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

 From sashiko gemini-3.1-pro-review:

On 5/22/26 03:34, Adrian Ng Ho Yin wrote:
> The debug daughter card replaces gmac2 with gmac0 for Ethernet, leaves
> gpio0 unrouted, and adds a Microchip 25AA128 16 KByte SPI EEPROM on spi0.
> 
> Remove the dmas/dma-names properties from spi0: CONFIG_DW_AXI_DMAC is
> not enabled in the platform defconfig, so retaining them would stall the
> SPI driver in probe deferral.  Set spi-max-frequency to 500 kHz to match
> the signal integrity constraints of this board.
> 
> Signed-off-by: Niravkumar L Rabara <nirav.rabara@altera.com>
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
>   arch/arm64/boot/dts/intel/Makefile            |   1 +
>   .../dts/intel/socfpga_agilex5_socdk_debug.dts | 123 ++++++++++++++++++
>   2 files changed, 124 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts
> 
> diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
> index 088a03b89c99..84982bf13ee5 100644
> --- a/arch/arm64/boot/dts/intel/Makefile
> +++ b/arch/arm64/boot/dts/intel/Makefile
> @@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
>   				socfpga_agilex3_socdk.dtb \
>   				socfpga_agilex5_socdk.dtb \
>   				socfpga_agilex5_socdk_013b.dtb \
> +				socfpga_agilex5_socdk_debug.dtb \
>   				socfpga_agilex5_socdk_modular.dtb \
>   				socfpga_agilex5_socdk_nand.dtb \
>   				socfpga_agilex7m_socdk.dtb \
> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts
> new file mode 100644
> index 000000000000..e3fd2bf11688
> --- /dev/null
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_debug.dts
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023, Intel Corporation
> + */
> +#include "socfpga_agilex5.dtsi"
> +
> +/ {
> +	model = "SoCFPGA Agilex5 SoCDK - debug daughter card";
> +	compatible = "intel,socfpga-agilex5-socdk-debug", "intel,socfpga-agilex5";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		ethernet0 = &gmac0;
> +		ethernet1 = &gmac1;
> +		ethernet2 = &gmac2;
> +		i3c0 = &i3c0;
> +		i3c1 = &i3c1;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			label = "hps_led0";
> +			gpios = <&porta 11 GPIO_ACTIVE_HIGH>;

Isn't this in GPIO0? And since you're not enabling gpio0, wouldn't this 
lead to a infinite probe deferral?

> +		};
> +
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		/* We expect the bootloader to fill in the reg */
> +		reg = <0x0 0x80000000 0x0 0x0>;
> +	};
> +};
> +
> +&gmac0 {
> +	status = "okay";
> +	phy-mode = "rgmii"; /* TX/RX clock delays provided by Agilex5 I/O hardware */
> +	phy-handle = <&emac0_phy0>;
> +	max-frame-size = <9000>;
> +	mdio0 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "snps,dwmac-mdio";
> +		emac0_phy0: ethernet-phy@0 {
> +			reg = <0>;
> +		};
> +	};
> +};
> +
> +&gpio1 {
> +	status = "okay";
> +};
> +
> +&osc1 {
> +	clock-frequency = <25000000>;
> +};
> +
> +&qspi {
> +	status = "okay";
> +	flash@0 {
> +		compatible = "micron,mt25qu02g", "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <100000000>;
> +		m25p,fast-read;
> +		cdns,read-delay = <2>;
> +		cdns,tshsl-ns = <50>;
> +		cdns,tsd2d-ns = <50>;
> +		cdns,tchsh-ns = <4>;
> +		cdns,tslch-ns = <4>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			qspi_boot: partition@0 {
> +				label = "u-boot";
> +				reg = <0x0 0x04200000>;
> +			};
> +
> +			root: partition@4200000 {
> +				label = "root";
> +				reg = <0x04200000 0x0be00000>;
> +			};
> +		};
> +	};
> +};
> +
> +&spi0 {
> +	status = "okay";
> +	/delete-property/ dmas;
> +	/delete-property/ dma-names;

I don't think it's correct to modify a hardware description to work 
around a software configuration issue. The Device Tree should describe 
the physical hardware. If the physical DMA lines exist, deleting these 
properties to bypass the CONFIG_DW_AXI_DMAC Linux defconfig issue 
violates that principle.

Would it be better to retain the DMA properties and resolve the issue by 
either enabling the required DMA driver in the defconfig or ensuring the 
SPI driver gracefully falls back to PIO mode?

> +	eeprom@0 {
> +		compatible = "atmel,at25";

Since the commit message specifies the chip is a Microchip 25AA128, 
should this include the vendor-specific compatible string as the primary 
match (e.g., "microchip,25aa128", "atmel,at25")? The generic 
"atmel,at25" string without a specific model is deprecated for new 
device trees according to the at25 bindings.


Dinh


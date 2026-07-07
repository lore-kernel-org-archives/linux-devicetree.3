Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34401E1DE5;
	Tue,  7 Jul 2026 11:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422322; cv=none; b=Fe27fSBBE2K6fztHftFK2dIygvYQyRYkd8h6w+CuFsfmXj4ync02h9wsi5R+DA2j+BG1XaFONO6SaXlHwo3metWv+S4FPa1oBOjghbhc2a75haSJuwBuWXayIx5ozXtwKc2KtsqEBvtuutrq6ee9jlT6b41ZmVzWCDDr3sKfygI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422322; c=relaxed/simple;
	bh=njHkNcN5SX0HyTYDrLXSfIT1vV2uFDAlzNPRrE3fPD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AyZmRh6n/FaNOIMleOSjFJ7MAkydZBXyxwq09g5vUbmGZVJKin4YaYl2asEpC3SL8aT3jqBeWKloFp4BrlZ5YUcGEAfuUBFd73VjozdadqMYyVUj9tOYCI0zxEDIeEr7ehlYcD+0xXlEWGinFPYfDUi4yY+EiL5kTp1PouwV8M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TUmfrI4K; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TUmfrI4K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783422319;
	bh=njHkNcN5SX0HyTYDrLXSfIT1vV2uFDAlzNPRrE3fPD4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TUmfrI4KTPebhI3uWHQT+y9PJB6/3mFzMOEnVLnvpOecglrmvoqHN1ds9IosC2qjA
	 vBrfS5BL8ItVVExcZaazFsCGlc761mFAsF8HJ6YTp0m92fyZQ/2JWfSWL8YqqO+5tU
	 ao5d3IWenN5M63NBKb38GbkBUnABMlSAXmqNlyRf1vspX9tMXSxjvUAuRGF1yRQTbm
	 rQ5Er/1yHKKDQsx6/BShvN3+kq9rAeJHdEOApzFLbLVxOffh4jIsCRA/2gPYjsELnH
	 L9CySK2ofz0ZYKtownKUQBwtDq8BrA+rkyqiqGGQ0gs8h5OuBT70S8YVeLAh7VID/l
	 XzqH/dwxFF3WA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 238B417E0C88;
	Tue, 07 Jul 2026 13:05:19 +0200 (CEST)
Message-ID: <176dd24c-c3cf-4ab9-8497-594ed65d10ec@collabora.com>
Date: Tue, 7 Jul 2026 13:05:17 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260707104427.3409290-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260707104427.3409290-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/7/26 12:44, Chen-Yu Tsai wrote:
> The Geralt design uses a MT6319 PMIC to power the big cores and LPDDR4X
> DRAM.
> 
> Add a device node for it and hook up all the supplies.
> 
> This change requires a firmware fix for the SPMI bus to read back
> correctly. The required firmware version is 15842.175.0. This is
> included in ChromeOS releases R150-16700.22.0 (available in Beta
> channel as of writing or stable channel in mid-July) or
> R151-16721.0.0 and later.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

This is a big problem then.

I take it as if the firmware fix is not in place, probing the CPU power supplies
will fail, with all the consequences.

This means that with this, we're breaking all Geralt machines with older firmware,
which is not acceptable...

...so this needs a different solution, or strong reasons to make me understand that
I'm wrong, if I'm wrong.

Cheers,
Angelo

> ---
>   .../boot/dts/mediatek/mt8188-geralt.dtsi      | 66 +++++++++++++++++++
>   1 file changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> index f382f90c48f5..fea52c377d88 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> @@ -4,6 +4,8 @@
>    */
>   /dts-v1/;
>   #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
>   #include "mt8188.dtsi"
>   #include "mt6359.dtsi"
>   
> @@ -241,6 +243,14 @@ &cpu5 {
>   	cpu-supply = <&mt6359_vcore_buck_reg>;
>   };
>   
> +&cpu6 {
> +	cpu-supply = <&mt6319_buck1>;
> +};
> +
> +&cpu7 {
> +	cpu-supply = <&mt6319_buck1>;
> +};
> +
>   /*
>    * Geralt is the reference design and doesn't have target TDP.
>    * Ciri is (currently) the only device following Geralt, and its
> @@ -1156,6 +1166,14 @@ pins-bus {
>   		};
>   	};
>   
> +	spmi_pins: spmi-pins {
> +		pins-bus {
> +			pinmux = <PINMUX_GPIO175__FUNC_B0_SPMI_M_SCL>,
> +				 <PINMUX_GPIO176__FUNC_B0_SPMI_M_SDA>;
> +			bias-disable;
> +		};
> +	};
> +
>   	uart0_pins: uart0-pins {
>   		pins-bus {
>   			pinmux = <PINMUX_GPIO31__FUNC_O_UTXD0>,
> @@ -1267,6 +1285,54 @@ &spi2 {
>   	status = "okay";
>   };
>   
> +&spmi {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spmi_pins>;
> +	#address-cells = <2>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	pmic@6 {
> +		compatible = "mediatek,mt6319-regulator", "mediatek,mt6315-regulator";
> +		reg = <0x6 SPMI_USID>;
> +		pvdd1-supply = <&pp4200_s5>;
> +		pvdd2-supply = <&pp4200_s5>;
> +		pvdd3-supply = <&pp4200_s5>;
> +		pvdd4-supply = <&pp4200_s5>;
> +
> +		regulators {
> +			mt6319_buck1: vbuck1 {
> +					regulator-name = "ppvar_dvdd_proc_bc";
> +					regulator-min-microvolt = <520000>;
> +					regulator-max-microvolt = <1155000>;
> +					regulator-enable-ramp-delay = <256>;
> +					regulator-allowed-modes = <0 1 2>;
> +					regulator-always-on;
> +			};
> +
> +			/* vbuck2 is ganged with vbuck1 */
> +
> +			mt6319_buck3: vbuck3 {
> +					regulator-name = "pp1125_emi_vdd2";
> +					regulator-min-microvolt = <1060000>;
> +					regulator-max-microvolt = <1170000>;
> +					regulator-enable-ramp-delay = <256>;
> +					regulator-allowed-modes = <0 1 2>;
> +					regulator-always-on;
> +			};
> +
> +			mt6319_buck4: vbuck4 {
> +					regulator-name = "pp0600_emi_vddq";
> +					regulator-min-microvolt = <570000>;
> +					regulator-max-microvolt = <650000>;
> +					regulator-enable-ramp-delay = <256>;
> +					regulator-allowed-modes = <0 1 2>;
> +					regulator-always-on;
> +			};
> +		};
> +	};
> +};
> +
>   &uart0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&uart0_pins>;


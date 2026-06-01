Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AE2378D96;
	Mon,  1 Jun 2026 12:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318292; cv=none; b=KDuh+z01h67TJo3OFT4nyOign7X5pFIybScOzBEtnAyOHFtMqSQmTuEfZnX0c7YG3D48ukrsh493HXmYOsUSJacQnQiRRaYS8JUwU4df1mnzqKwBPd8Q6Vjl7vxrNvJWI8Q3yzPAVEE2NDu39VctUSdFnLujAbNzE5jVVb3qKS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318292; c=relaxed/simple;
	bh=XsDgrG1wwlJKbmhtx/bHUnEpUtio2Vl8dsYGbDpKQes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mGY5jxryho/GB9Tg+ugxM57a0+sk9rKI5vauT7e/FqKrHWVdR5p6ra8O1ChHxcA3oL7Em5dtGu8jjlfrBW9T+nr5JzHkk4OMjharHKQZqbXluLskMaa/Jn3HTP4eVOzHVbRw6Xps5My46eIeKwnAWa0+0CwEVbR5+w7pFGcoCps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=o5DN2HeW; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="o5DN2HeW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ipOTjP7LXkH4pE0+RZI23Zur3lgBYVWldPcYkb4vemU=; b=o5DN2HeWo+QQqsoPWET0z5Yz2u
	PVYCdJAu1TR+65E60gMED+5VJhdwoQ44aFFfChAG4LLZTmd0y3WFaHp/QCkcmLH0/fiO3AHo177sB
	F83N8esdzgVidMGWbOIuN1MSDHBwHsxs9BZ88rN8abPfl5E4I7YigqjOUxSkSu5NB86jSsp3tnSEf
	Oa/okvRtx+yYJ4UFg2BMyBfnk8JNFlYaAiSdHanIr0DY3QpR3i/kzx3tricLhrjajNfbYcQCEfPPH
	8peeTD0vvDRQW7Ta7jfHwJaq7bVPVQYI5hPIT3zKl8USKZ8MhKTFX5fmK+OmjCSfZjliFjNCbUrJ1
	Og3s3lZQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: add Vicharak Axon board
Date: Mon, 01 Jun 2026 14:51:22 +0200
Message-ID: <10605990.5OynTdThKG@phil>
In-Reply-To: <20260601123603.129679-2-hrushirajg23@gmail.com>
References:
 <20260601123603.129679-1-hrushirajg23@gmail.com>
 <20260601123603.129679-2-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Montag, 1. Juni 2026, 14:36:03 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Hrushiraj Gandhi:
> Add initial support for the Vicharak Axon single-board computer based on
> the Rockchip RK3588 SoC.
>=20
> The board supports:
>=20
> - eMMC storage
> - microSD card
> - Gigabit Ethernet
> - HDMI output (dual HDMI)
> - HDMI input
> - USB 2.0 host ports
> - PCIe 2.0 slots
> - PCIe 3.0 x4 slot
> - SATA
> - RTC
> - Status LEDs
>=20
> The board uses an RK806 PMIC and provides the regulators required by
> the RK3588 SoC.
>=20
> Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile        |    1 +
>  arch/arm64/boot/dts/rockchip/rk3588-axon.dts | 1069 ++++++++++++++++++

this is missing the addition of the board dt binding.
(in a separate patch)

Please see how other boards are handled in the git histoy.


>  2 files changed, 1070 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-axon.dts
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/=
rockchip/Makefile
> index cb55c6b70d0e..503927ffa849 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -179,6 +179,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-rock-4d.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3582-radxa-e52c.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588-armsom-sige7.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588-armsom-w3.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588-axon.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588-coolpi-cm5-evb.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588-coolpi-cm5-genbook.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588-edgeble-neu6a-io.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-axon.dts b/arch/arm64/bo=
ot/dts/rockchip/rk3588-axon.dts

please name that
rk3588-vicharak-axon.dts


> new file mode 100644
> index 000000000000..dcab9462f51b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-axon.dts
> @@ -0,0 +1,1069 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
> +#include <dt-bindings/usb/pd.h>
> +#include "rk3588.dtsi"
> +
> +/ {
> +	model =3D "Vicharak Axon";
> +	compatible =3D "vicharak,axon", "rockchip,rk3588";
> +
> +	aliases {
> +		mmc0 =3D &sdmmc;
> +		mmc1 =3D &sdhci;
> +		mmc2 =3D &sdio;
> +		serial2 =3D &uart2;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial2:1500000n8";
> +	};
> +
> +	hdmi0-con {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi0_con_in: endpoint {
> +				remote-endpoint =3D <&hdmi0_out_con>;
> +			};
> +		};
> +	};
> +
> +	hdmi1-con {
> +		compatible =3D "hdmi-connector";
> +		type =3D "a";
> +
> +		port {
> +			hdmi1_con_in: endpoint {
> +				remote-endpoint =3D <&hdmi1_out_con>;
> +			};
> +		};
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		status =3D "okay";
> +
> +		power_led: power-led {
> +			color =3D <LED_COLOR_ID_GREEN>;
> +			function =3D LED_FUNCTION_STATUS;
> +			gpios =3D <&pca9554 0 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +
> +		status_led: status-led {
> +			color =3D <LED_COLOR_ID_RED>;
> +			function =3D LED_FUNCTION_STATUS;
> +			gpios =3D <&pca9554 1 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger =3D "none";
> +		};
> +	};
> +
> +	pcie20_avdd0v85: pcie20-avdd0v85-regulator {

regulator nodes, should be like "pcie20_avdd0v85: regulator-pcie20-avdd0v85=
 {"

> +&cpu_b0 {
> +	cpu-supply =3D <&vdd_cpu_big0_s0>;
> +	mem-supply =3D <&vdd_cpu_big0_mem_s0>;

mem-supply for cpu-cores is vendor-kernel stuff (and it's the same
regulator anyway), so please
=2D drop those properties,
=2D drop the phandle

and run
make ARCH=3Darm64 CHECK_DTBS=3Dy rockchip/rk3588-axon.dtb

and fix all the reported issues please.


Thanks
Heiko





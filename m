Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795411919;
	b=hi1F0aoROnhUEcbW0jOCXMG8UZUzDwyDSmmgrymT2MjLb5K6FHfH748xmzCTWXTZaAe1
	 IhvjTTV7SfM1cDcDcfi9tGzzYm5fYn7qJoyf6ueA/vUrWpZbHP0WaqvAFZaVZ/ty3RGU1
	 iHiH13GJTN3vbZayADBfZr5EvGY764fftjprkvBQGiZOvA9s0EnCElm764B781iTS3jjs
	 KpcAHJa7ha4tAs8lm3ZygXlPw9VGy+KDkhVzn225s7XqngHl2lyhLZyhKi65S1AOYgYrM
	 68Z/slVaZOygi8p+3Z/0VwowycZTW6v3f44tFi7A49fHBBc6dtCxtfLoKxuqwCILkdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795411919;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CkosKFfEQY9KIB2ze4ArhWneRaFyWbxzmozMXVPO/UM=;
	b=3MBEWvr8i1f017mVmIa03pxASBsTH+lQQpxjEzw7qXnDbMHChhdjuYhh/ozY3Y5buAd5
	 OfOdNMYXda39v5pQtABAwbQOLBA8DKHV3lHvSp21H/xHv9JLiu+O/ZEtogDaTsHIar7+F
	 Jb4WPrl5uUt1Y2R1b4OqM1haHQaHv+plxEA5Zbj/4K9qlYAMB/ivff77ZFBlHEI+Mld6X
	 gqd3XnqmTbw7P8mfFw0GGi5w99UGeqFASM/RgxstxGI7AkHIdhFOrStukq7ZZlaJKLR01
	 42l4G2I7im0FDKmATMu14dP9U5vV2LHbhE23l8Nmn1gX1mEC6AIRLUMT2GmmVb6BX4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ib8rz4Es;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608A4606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ib8rz4Es
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090281F000D2;
	Mon, 23 Nov 2026 05:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795411919;
	bh=CkosKFfEQY9KIB2ze4ArhWneRaFyWbxzmozMXVPO/UM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ib8rz4EsSmUyTO0esyoV/WpPyH93dUWWnK45yQ0gcqnzPH2O1+QA0HiGUp9+Td/kG
	 khQp9sxkobOMDLKA1VupROXbDf1SVPrMAH2P804K7ihU3mpaijwRee+KOrtByEcK43
	 0tsTRu2sCX3SLYDjoO4TfDnwz1aRL7aXms0E0qHAYs7PdTdz5N2N2JT6PZxsG7m0uZ
	 Ri2KOr9uOpsMLXlgXyrHHe38AiZUWQ5HzSBCDiOFns15+bm27V9263buaZR7vIRh6D
	 ABky2PDjBnsjeqSsd0Xy4FCGILsMRnD7tweQjQdC4d6Qs+MVaJvKnmcS9wfi1P5o19
	 A2MCAa/wtaZ9w==
Message-ID: <sashiko-outbox-228719@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: monza: add Precision AD HAT
 overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Prashanth Reddy Baddam" <prashanth.baddam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-ventuno-q-precision-hat-v3-1-fb96fd6b7887@qti.qualcomm.com>
References: <20261123-ventuno-q-precision-hat-v3-1-fb96fd6b7887@qti.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 05:31:58 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] arm64: dts: qcom: monza: fake rohm,dh2228fv compatible and
  spidev@0 node name
- [Medium] arm64: dts: qcom: monza: spi3 cs-gpios conflicts with
  qup_spi3_cs on gpio28
--

commit 12190f9e8824425ba37639e1c8a7a3b6040d0713
Author: Prashanth Reddy Baddam <prashanth.baddam@oss.qualcomm.com>

arm64: dts: qcom: monza: add Precision AD HAT overlay

This commit adds a devicetree overlay and Makefile build rule for the
Waveshare High-Precision AD HAT (ADS1263) on the Monza 40-pin JHAT
connector.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza-precision-hat.=
dtso b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-precision-hat.dtso
> new file mode 100644
> index 0000000000000..e50b0c9560577
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-precision-hat.dtso
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Device tree overlay for the Waveshare High-Precision AD HAT (ADS1263)
> + * connected to the Monza 40-pin JHAT connector.
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&spi3 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	cs-gpios =3D <&tlmm 90 GPIO_ACTIVE_LOW>;

[Severity: Medium]
Does setting cs-gpios to gpio90 without overriding pinctrl-0 on &spi3
leave gpio28 (JHAT_P24_SPI_CE0) muxed to the hardware chip-select 0
function?

In monaco.dtsi, spi3 defaults to:

  pinctrl-0 =3D <&qup_spi3_data_clk>, <&qup_spi3_cs>;

where qup_spi3_cs muxes gpio28 to function "qup0_se3".  Because
spi-geni-qcom drives its internal CS 0 output in setup_spi_params() and
setup_gsi_xfer() on every reg =3D <0> transfer, the QUP engine will assert
gpio28 on pin 24 of the 40-pin header alongside the software-toggled
gpio90, while gpio90 itself has no pinctrl entry.  Should &spi3 override
pinctrl-0 to decouple gpio28 (for example with qup_spi3_cs_gpio) and
configure gpio90?

> +
> +	spidev@0 {
> +		compatible =3D "rohm,dh2228fv";
> +		reg =3D <0>;
> +		spi-max-frequency =3D <8000000>;
> +		spi-cpha;
> +	};
> +};

[Severity: Medium]
Should this node describe the TI ADS1263 ADC with adc@0 and
compatible =3D "ti,ads1263", "ti,ads1262" instead of spidev@0 and
"rohm,dh2228fv"?

"rohm,dh2228fv" is a deprecated entry in
Documentation/devicetree/bindings/trivial-devices.yaml for a non-existent
Rohm DAC used to force spidev binding, which prevents the in-tree IIO
driver (drivers/iio/adc/ti-ads1262.c) from binding and violates the
generic node name requirement.  In addition, trivial-devices.yaml sets
additionalProperties: false and does not permit spi-cpha, so this node
fails dtbs_check, whereas Documentation/devicetree/bindings/iio/adc/ti,ads1=
262.yaml
allows both spi-cpha and spi-max-frequency.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-ventuno-q-=
precision-hat-v3-1-fb96fd6b7887@qti.qualcomm.com?part=3D1

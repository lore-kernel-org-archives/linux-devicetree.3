Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793564273;
	b=xgpzSfTRM9elNdb9DmpJwXG8xvyLJRHGaZ76RxnHUXyjIP1fZuErdtCuxzyS0DSudEtM
	 T29R/YfLiaA+Mai8+W7R17pXWFeTUneSBa1Fz5bSLW4o4+eCFuppaohChUrT7+xDsUaZG
	 iNQz9oSaCOMEfFepwa9PaagxEYHaSV+L1UE4IO9frSepK/M6P1lqvQkTJc+zzge3o9569
	 IOCU5z0LNIXK1JdAXFno+2/GamzFOKa8dWKZjaz6pButCF66bLri6Uarrq+9J6tnBVj6w
	 E9uHWs3gvW96dGovopPpVg4YR/+/WTFuGAGBrtCuuMkb16ilmvDAtSCikU8EpD6tB9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793564273;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eImcpN2sp6/L4xXWhZ6dPAxBeVqKM9BfOjAqzdBBj7o=;
	b=tJ1/6tnUxmUy2s2lzJz6jViOcDY5rvXgol1VvinSuF+jscDQM7gS5mJKGAWmZVjUmq4d
	 9g+lxc4hUU0iHqOM5QHmuMXOuaXccuIASWekeJfOvXyaP7Bu1SjIat36YcKjgQhFhXd7k
	 jIN5KpI53B1UxgmVPZWkrJ2vysmJtasvpHBRsWEyuHn+DEySpu7JG+rKz4v0CzbAr8hpa
	 /YluChdnkiJQ40kcMLn9Uu68I0sTe3PWSNoX5K+u0v67i/BbMarKIs9AostWlo/6Lubmg
	 bvg2Gx45yVRNYhXkWJHBlpsS99jQ9OprCGGtvkxE7C8P84J+xz7Mtg7SvZYwGuVHi9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Npx2Z8KP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F7E606A329
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 20:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Npx2Z8KP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D604B1F000C1;
	Sun,  1 Nov 2026 20:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793564273;
	bh=eImcpN2sp6/L4xXWhZ6dPAxBeVqKM9BfOjAqzdBBj7o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Npx2Z8KPBP9vwW7LIhHKpinhNdfk55Jbn3j88TTItgpT4MUB9ysadFNynxrEX0r7/
	 FE0Pi+0ZR8ntVVZvr/q6Jz2+pJUzTUW0keoEOWL/Gzgaa6URLD+dAQ+G4GpQsTxQwQ
	 RW9IUDVxOfgr/TpROBw1lEYd5ZTKtR6lI5drERMK9mFcfxiqWfDEKDZvLYEJKCQ5wW
	 h6EEaTsss7aUC5aZbT/O1TVGlIVFdI0wiNwMF43md+/1cy1M9qZqEbYt2CZBo2NmfI
	 Q6mAyaRkqIOooJDHUEoHehVnvGpMPDZWG8WzT0Oc7jPnEPt+lD922P2vgYOMXSLm8a
	 G8+CJqhbIC/6A==
Message-ID: <sashiko-outbox-192662@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: add HP OmniBook Ultra
 14-kg0xxx
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Pettit" <jason.pettit@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261101-hp-omnibook-v2-v2-2-1b99767deda0@oss.qualcomm.com>
References: <20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com>
 <20261101-hp-omnibook-v2-v2-2-1b99767deda0@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 20:17:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: missing pmh0101 and pmh0110-glymur includes
- [Medium] arm64: dts: qcom: missing serial0 alias for enabled uart21
- [Medium] arm64: dts: qcom: missing regulator-always-on on vreg_l18b_e0_1p=
2 for pcie3b
--

commit 16bebd9c6c0b1cc3644884c02e54b4e1e8aa6439
Author: Jason Pettit <jason.pettit@oss.qualcomm.com>

arm64: dts: qcom: add HP OmniBook Ultra 14-kg0xxx

This commit adds a device tree for the HP OmniBook Ultra 14-kg0xxx laptop
based on the Qualcomm Snapdragon X2 Elite (Glymur) platform.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-hp-omnibook-ultra-kg0xxx.dts=
 b/arch/arm64/boot/dts/qcom/glymur-hp-omnibook-ultra-kg0xxx.dts
> new file mode 100644
> index 0000000000000..fdf8df6374fa2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-hp-omnibook-ultra-kg0xxx.dts
> @@ -0,0 +1,986 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include "glymur.dtsi"
> +
> +#include "pmcx0102.dtsi"
> +#include "pmk8850.dtsi"
> +#include "smb2370.dtsi"

[Severity: Medium]
Should this device tree also include pmh0101.dtsi and pmh0110-glymur.dtsi (=
and
possibly pmh0104-glymur.dtsi) like the other Glymur board files?

Further down under &apps_rsc, this board configures RPMh regulators on PMH0=
101
(B_E0) in regulators-0 and on PMH0110 (F_E0, H_E0, and F_E1) in regulators-=
1,
regulators-2, and regulators-3:

	regulators-0 {
		compatible =3D "qcom,pmh0101-rpmh-regulators";
		qcom,pmic-id =3D "B_E0";
		...
	};

	regulators-1 {
		compatible =3D "qcom,pmh0110-rpmh-regulators";
		qcom,pmic-id =3D "F_E0";
		...
	};

Without pmh0101.dtsi and pmh0110-glymur.dtsi included, the SPMI PMIC device=
s on
spmi_bus0 and spmi_bus1, their SPMI GPIO controllers, their qcom,spmi-temp-=
alarm
sensors, and their thermal zones (pmh0101-thermal, pmh0110-f0-thermal,
pmh0110-f1-thermal, and pmh0110-h0-thermal) are omitted, leaving those PMICs
without thermal monitoring or shutdown trip points.

[ ... ]

> +/ {
> +	compatible =3D "hp,omnibook-ultra-kg0xxx", "qcom,glymur";
> +	model =3D "HP OmniBook Ultra Laptop 14-kg0xxx";
> +
> +	aliases {
> +		i2c0 =3D &i2c0;
> +		i2c4 =3D &i2c4;
> +		i2c8 =3D &i2c8;
> +
> +		serial1 =3D &uart14;
> +	};

[Severity: Medium]
Should aliases also define serial0 =3D &uart21 (or should &uart21 be disabl=
ed if
it is not routed on this board)?

In arch/arm64/boot/dts/qcom/glymur.dtsi, uart21 (serial@894000, compatible
qcom,geni-debug-uart) is enabled by default and claims gpio86 and gpio87 via
qup_uart21_default.

When qcom_geni_serial_probe() in drivers/tty/serial/qcom_geni_serial.c prob=
es a
qcom,geni-debug-uart device, it looks up the serial alias ID and passes it =
to
get_port_from_line():

	if (data->console) {
		drv =3D &qcom_geni_console_driver;
		line =3D of_alias_get_id(pdev->dev.of_node, "serial");
	}

	port =3D get_port_from_line(line, data->console, &pdev->dev);

In get_port_from_line(), console ports require a valid alias in 0 ..
GENI_UART_CONS_PORTS - 1:

	if (console) {
		if (line < 0 || line >=3D nr_ports)
			return ERR_PTR(-ENXIO);

		port =3D &qcom_geni_console_port;
	}

Because no serial0 alias is present, of_alias_get_id() returns -ENODEV and
uart21 fails probe with -ENXIO on every boot.

[ ... ]

> +&apps_rsc {
> +	regulators-0 {
> +		compatible =3D "qcom,pmh0101-rpmh-regulators";
> +		qcom,pmic-id =3D "B_E0";
> +
> +		vreg_l1b_e0_1p8: ldo1 {
> +			regulator-name =3D "vreg_l1b_e0_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1800000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7b_e0_3p1: ldo7 {
> +			regulator-name =3D "vreg_l7b_e0_3p1";
> +			regulator-min-microvolt =3D <3072000>;
> +			regulator-max-microvolt =3D <3072000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l15b_e0_1p8: ldo15 {
> +			regulator-name =3D "vreg_l15b_e0_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1800000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l18b_e0_1p2: ldo18 {
> +			regulator-name =3D "vreg_l18b_e0_1p2";
> +			regulator-min-microvolt =3D <1200000>;
> +			regulator-max-microvolt =3D <1200000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};

[Severity: Medium]
Does vreg_l18b_e0_1p2 need regulator-always-on here?

This board enables &pcie3b for the NVMe SSD using gpio155 for reset-gpios a=
nd
gpio157 for wake-gpios:

&pcie3b_port0 {
	reset-gpios =3D <&tlmm 155 GPIO_ACTIVE_LOW>;
	wake-gpios =3D <&tlmm 157 GPIO_ACTIVE_LOW>;
};

In arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts, ldo18 on =
B_E0
is marked regulator-always-on because it provides the reference voltage for=
 the
&pcie3b wake and reset signals:

		vreg_l18b0: ldo18 {
			regulator-name =3D "vreg_l18b0";
			regulator-min-microvolt =3D <1200000>;
			regulator-max-microvolt =3D <1200000>;
			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;

			/*
			 * This is also reference voltage for &pcie3b wake and
			 * reset signals.
			 */
			regulator-always-on;
		};

In glymur-hp-omnibook-ultra-kg0xxx.dts, vreg_l18b_e0_1p2 is only referenced=
 as
vdd-io-supply by the SoundWire speaker nodes under &swr0 and &swr3, which do
not probe until &remoteproc_adsp boots. If the ADSP firmware or audio drive=
rs
are not loaded before unused regulators are disabled, turning off
vreg_l18b_e0_1p2 can drop the reference supply for the pcie3b reset and wake
signals and cause the NVMe SSD to drop off the bus.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-hp-omniboo=
k-v2-v2-0-1b99767deda0@oss.qualcomm.com?part=3D2

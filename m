Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574EC2AD3F
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785287652; cv=none; b=XkPne3Nt+l0R3uLAlUeaC/n0n76uEmxVxo4zP9gehbiZqAE4AET1dZJGgTbs08Ipi7wz4AQq9zeLJqkLyddkHQBvgB5w4MH7hI8yS4jDuBlH912fyFSjXTbH0vZkr/3EFE1GP/Wiavap6PUj2Hsa6vwluCH3JLkEd/hcjdLSXMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785287652; c=relaxed/simple;
	bh=Ud9dBwTVfeckDKKeTWvHxJ2nD9aAeW5ibrGbG1cHZU4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H25JGMgPQihKV9NCn5AZKJypo4Xg5PjR04RkzS2Ajk1tGFFLnhTRpYm2lfpfyFviGWERITUue+4XJX92WTPrOVMpUNVo80DCSHo9Ea8CzhX61GGvaCJYTs3xRsSV69GGsluYVyhmM0HAsi/h99LA5a33RiKY1pOSNSv3hnRXuls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+8z9v6W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+8z9v6W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09491F000E9;
	Wed, 29 Jul 2026 01:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785287651;
	bh=A0xuSYxtp5FJq/RNBjp/5nszYTkZ/+UVmPJW8M0b0pA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a+8z9v6WPUpCYVL6hhLJb3+aH4oCcXASiN8Ccc9AM00u9ynRosUeS+WhyRsp/Mwkw
	 c2nJNhIoCMs/a8XzeLvJ92vvUz5cooLr2YLw78/UU3kKPfqYe/EQZ53qUb8QGJwxDg
	 Gxc2sD6z5Q/zmHCq3zCBMMFbowo3hcrQlXVE+cH9LNmb5938VVdXhBAoT60twHn2zg
	 24r7y1S489ZVuQixtkLX7a8epnARY/bL80BcYs4LVNKv5N06mcu/RyEueI9Y7OoHJF
	 tsN291kPGklfxpv4oIxuwLKsrmINdYkVllVrOPGzuCkWk+3+7W2YfxNPU1b1pTDVGx
	 ZUNcWkCimWLWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/6] arm64: dts: qcom: Add device tree for Nord SoC
 series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729010022.875799-2-shengchao.guo@oss.qualcomm.com>
References: <20260729010022.875799-1-shengchao.guo@oss.qualcomm.com>
 <20260729010022.875799-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 01:14:10 +0000
Message-Id: <20260729011410.E09491F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing `critical` thermal trip points in all SoC thermal zones.
- [High] Sub-page `no-map` reserved memory regions for SCMI shared memory l=
eave parts of the physical 4KB page unreserved, leading to cache attribute =
aliasing.
- [Medium] All QUPv3 wrapper nodes and their child serial engines (I2C, SPI=
, UART) are missing mandatory clock definitions.
- [Low] Missing `#address-cells` and `#size-cells` in all QUPv3 `spi` contr=
oller nodes.
--

--- Patch [1]: [PATCH v8 1/6] arm64: dts: qcom: Add device tree for Nord So=
C series ---
commit dc243dd9ae24ddeada4cb82c2d839d010c16b477
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>
arm64: dts: qcom: Add device tree for Nord SoC series

This commit adds the base device tree include file (nord.dtsi) for the Nord
SoC series. It describes core hardware components like CPU clusters, memory,
thermal zones, and QUPv3 serial engines.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> new file mode 100644
> index 0000000000000..117bcc2c88377
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi

[ ... ]

> +		pdp0_p2a: scmi-shmem@87608000 {
> +			compatible =3D "arm,scmi-shmem";
> +			reg =3D <0x0 0x87608000 0x0 0x80>;
> +			no-map;
> +		};
> +
> +		pdp0_a2p: scmi-shmem@87608180 {
> +			compatible =3D "arm,scmi-shmem";
> +			reg =3D <0x0 0x87608180 0x0 0x80>;
> +			no-map;
> +		};

[Severity: High]
Do these sub-page no-map regions cause cache attribute aliasing?

The pdp0_p2a and pdp0_a2p regions only cover 256 bytes total within the
4KB physical page starting at 0x87608000. Because the rest of the page is
not reserved with no-map, it appears the kernel will map the entire 4KB
page as Normal Cacheable memory in the direct map, while the SCMI driver
will map the 256 bytes as Device/Non-cacheable memory.

[ ... ]

> +	soc: soc@0 {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		dma-ranges =3D <0 0 0 0 0x10 0>;
> +		ranges =3D <0 0 0 0 0x10 0>;
> +
> +		qupv3_2: geniqup@8c0000 {
> +			compatible =3D "qcom,geni-se-qup";
> +			reg =3D <0x0 0x008c0000 0x0 0x2000>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			iommus =3D <&apps_smmu_0 0x15a3 0x0>;
> +			ranges;

[Severity: Medium]
Will the QUPv3 drivers fail to probe because the clocks and clock-names
properties are missing from the wrapper nodes and child serial engines?

[ ... ]

> +			spi14: spi@880000 {
> +				compatible =3D "qcom,geni-spi";
> +				reg =3D <0x0 0x00880000 0x0 0x4000>;
> +				interrupts =3D <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				status =3D "disabled";
> +			};

[Severity: Low]
Does this spi controller node (and the other spi nodes) need #address-cells
and #size-cells properties to allow child devices to parse their addresses
correctly?

[ ... ]

> +		cpu-0-0-0-thermal {
> +			polling-delay-passive =3D <0>;
> +			polling-delay =3D <0>;
> +			thermal-sensors =3D <&tsens0 1>;
> +
> +			trips {
> +				trip-point0 {
> +					temperature =3D <105000>;
> +					hysteresis =3D <10000>;
> +					type =3D "passive";
> +				};
> +
> +				trip-point1 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <10000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};

[Severity: High]
Should these thermal zones include a trip point configured for system shutd=
own?

Because the highest trip point is set to passive, it looks like the kernel
will never perform an orderly shutdown, leaving the system to rely entirely
on hardware thermal resets if temperatures continue to rise.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729010022.8757=
99-1-shengchao.guo@oss.qualcomm.com?part=3D1

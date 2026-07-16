Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A9D42FCC1
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784213066; cv=none; b=kSrtY2kPqkog0mzW/SnxNKObmXLHofSOfTt/Lkx44H87BCUXc3PgD+Nz0VIr90sgno0/yiIOh/wzbhO+2bNIpD04KXGwTmEIuI7x1lEGOf1zJoxutVN9LJ0VWKMa1cSnRgS+qOhZvDEyiJTLvDTMQwC1AHTV8u0Idv45CbqvUFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784213066; c=relaxed/simple;
	bh=M2U019bOMEK9Lmb8RcIaBmSUMAJGibUmOkXZ+qx+QeY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dx8p8pcduFaYCwSfZ3XK48EyNPBaqB6cujBs+XOX2G3OlV7FYskHYemK2Lxw4GpbA2+y9YrQs7KrfOAtCH+KU3aJWRhgy5ke1nQH2ZP9vLuYoBL5KN1R0jz0eN3BNGPmbNiZ94Oo2rFuLzQmegkly0xBdnRkj3ajHw+4Y5Tou1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUHICPN6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUHICPN6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356EE1F000E9;
	Thu, 16 Jul 2026 14:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784213058;
	bh=3r+WkwQY1QpxK1eepC2be5q3MWwZelfWXUaMtf80+ZE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cUHICPN6TBkppPrVNQt9s4kvmEFkmVVoAOp4cxjDiWKpu+0v6lZTxMY+WwH5VhLzv
	 RoXP0s2CMlp+aXKDoyg3SbEwLwRDn8oRAm/JMkvdCz9l2FgITbva3hlY9dS+AGyM/L
	 KpcRP6lu0STMWd4rm3P8o7vtY3GaWM7zr1vbuK0nx7IDukDvTSvURvC2oxkaIHjWyA
	 //fgG6cEyOK7pzqa91aj0L/YGUFu97zRIMlixA0jr9YYhyJ7mXM+x21UVgs0XoHpbA
	 y/5tblB+46RO2BgpXISmJERoKgy+B8o6/rfOCWoMzgX8zmpWVj2Lvot3Fo67rb/HMO
	 TsH1WaIwxMRGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/6] arm64: dts: qcom: Add device tree for Nord SoC
 series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260716142605.2398433-2-shengchao.guo@oss.qualcomm.com>
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
 <20260716142605.2398433-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 14:44:17 +0000
Message-Id: <20260716144418.356EE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Thermal zones lack a 'critical' trip point and passive cooling is =
non-functional, disabling thermal safety protections.
- [Medium] QUP wrapper nodes (qupv3_0, qupv3_1, qupv3_2) are missing mandat=
ory 'clocks' and 'clock-names' properties.
--

--- Patch [1]: [PATCH v6 1/6] arm64: dts: qcom: Add device tree for Nord So=
C series ---
commit 95c2014f3c2e44a525b136382378e1766eccc72c
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord SoC series

Add base device tree include (nord.dtsi) for the Nord SoC series
describing the core hardware components.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> new file mode 100644
> index 0000000000000..117bcc2c88377
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -0,0 +1,4605 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	interrupt-parent =3D <&intc>;
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +
> +	cpus {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "qcom,oryon-1-5";

[Severity: High]
Are these CPU nodes missing the #cooling-cells property?

Without #cooling-cells, passive cooling mitigation cannot function for these
cores when thermal limits are reached.

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
Will the qcom,geni-se-qup driver fail to probe here?

It appears this node (along with qupv3_0 and qupv3_1 below) is missing the
mandatory clocks and clock-names properties. Without the m-ahb and s-ahb
clocks, devm_clk_bulk_get() during probe will return an error, preventing
all child serial interfaces from initializing.

[ ... ]

> +	thermal_zones: thermal-zones {
> +		ddr-0-0-thermal {
> +			polling-delay-passive =3D <0>;
> +			polling-delay =3D <0>;
> +			thermal-sensors =3D <&tsens0 0>;
> +
> +			trips {
> +				trip-point0 {
> +					temperature =3D <105000>;
> +					hysteresis =3D <10000>;
> +					type =3D "passive";
> +				};
> +
> +				trip-point1 {
> +					temperature =3D <115000>;
> +					hysteresis =3D <10000>;
> +					type =3D "passive";
> +				};

[Severity: High]
Should this maximum trip point type be "critical" instead of "passive"?

Since there are no cooling-maps defined in the thermal zones and the CPU
nodes lack #cooling-cells, passive cooling is non-functional. Setting the
highest trip points (e.g., 115C or 125C) across all thermal zones to
passive instead of critical means the kernel will not trigger a forced
emergency shutdown when the hardware overheats, which could lead to
hardware damage.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716142605.2398=
433-1-shengchao.guo@oss.qualcomm.com?part=3D1

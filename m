Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3062AF00
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 13:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786885581; cv=none; b=t5IB+lu4ZrvHATQsdO49Fxi56pYXm1n4xJStYW0SBC6U0sctAWDm3tNpUj2aSnArr13nZHReGWxt5KvRP1BdY+BWzUP/g58bJniLYWUGprq+Zmhxwi8ZGeadUWjOH5eCypaeE3beN1w4max9kp/q2eNvsEr76y4nG7TE0JOIqlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786885581; c=relaxed/simple;
	bh=3kFnzcYkBMB3Wz3g33E1Zu8Im7tYjlpZH5LbVQSfyX4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I55fUxbDV+N5t9/5RxFqlkC9+AvBQIlzxenNgNnSH/DgBJSFCraJmf0Jkdh8tYqYV5Hd8wZzYVopQOibdgWoUcwO77k/R3TcPatMFx44k3VhiCyTJHfvzyA0f5u1shKKwW+HkoEB5QlNypRg0qYXg3LmELHrwkSyG8rH3ooeGNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WidVnzmN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WidVnzmN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C311F000E9;
	Sun, 16 Aug 2026 13:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786885579;
	bh=tKccm/Bf65/0bfXtCsnuWR/ckckYE6EFlOJ4oCCEBfE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WidVnzmNk/fjPeY3FMtwMVAdvOs29OxnRZE47P9F2WijR/bbEQgBVWHby0f/qConk
	 2ctDa4s4NiczGo2V0XO5+x5fBmALDd+tEBnuN+VFds1Oi6a0oXOH09thXwvmMSuZSK
	 9JIwQkC68CWxZEZLlRKUFVTWI3S5qgoXKm68orJTGd+SCHbe80dSyfS6PdT3dHXyUi
	 iFDxHWEWueEs6sH2Vv6eNo/+tUu3b1bDuF7fGuyRHeyr94GFH46gSs30JrQ7LpVi1s
	 i2+tbbr7TNOz5P3M/Z8mYzjlQ0qWpD4wyV76JJ8lAz8naQzWglpOlQWUco104gEABK
	 Is5DzNKgoCAkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/6] arm64: dts: qcom: Add device tree for Nord SoC
 series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260816125413.1635150-2-shengchao.guo@oss.qualcomm.com>
References: <20260816125413.1635150-1-shengchao.guo@oss.qualcomm.com>
 <20260816125413.1635150-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 13:06:18 +0000
Message-Id: <20260816130619.40C311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] All thermal zones define high-temperature trip points as `pass=
ive` instead of `critical` and lack `cooling-maps`, disabling thermal emerg=
ency shutdowns.
- [Medium] The CPU idle state is broken due to a mismatch between its compa=
tible string and how it is referenced, and CPUs lack the `cpu-idle-states` =
property.
- [Low] All SPI controller nodes (e.g., `spi0`, `spi1`, `spi14`) are missin=
g `#address-cells =3D <1>;` and `#size-cells =3D <0>;`.
- [Low] Required `clocks` and `clock-names` properties are missing from var=
ious hardware block nodes (GENI QUP SEs, UFS, Crypto).
--

--- Patch [1]: [PATCH v11 1/6] arm64: dts: qcom: Add device tree for Nord S=
oC series ---
commit 3b03ce598a0e38b99b378a0b40cf86676c569565
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: arm64: dts: qcom: Add device tree for Nord SoC series

This commit adds the base device tree include for the Nord SoC series.
It describes core hardware components like CPUs, PSCI power management,
interrupt controllers, TLMM, thermal sensors, and SMMUs.

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/=
nord.dtsi
index 0000000000000..6373d2e65f24d 100644
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
[ ... ]
> +		cpu0: cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "qcom,oryon-1-5";
> +			reg =3D <0x0 0x0>;
> +			enable-method =3D "psci";
> +			power-domains =3D <&cpu0_pd>;
> +			power-domain-names =3D "psci";
> +			next-level-cache =3D <&l2_0>;
> +			clocks =3D <&cpu_perf 0>;
> +			#cooling-cells =3D <2>;
[ ... ]
> +		idle-states {
> +			entry-method =3D "psci";
> +
> +			core_off_c4: cluster-c4 {
> +				compatible =3D "arm,idle-state";
> +				idle-state-name =3D "retention";
> +				entry-latency-us =3D <93>;
> +				exit-latency-us =3D <129>;
> +				min-residency-us =3D <560>;
> +				arm,psci-suspend-param =3D <0x00000003>;
> +			};
> +		};
[ ... ]
> +	psci {
> +		compatible =3D "arm,psci-1.0";
> +		method =3D "smc";
> +
> +		cpu0_pd: power-domain-cpu0 {
> +			#power-domain-cells =3D <0>;
> +			power-domains =3D <&cluster0_pd>;
> +			domain-idle-states =3D <&core_off_c4>;
> +		};

[Severity: Medium]
Since core_off_c4 uses the arm,idle-state compatible, shouldn't it be
referenced directly via the cpu-idle-states property in the cpu nodes rather
than domain-idle-states in the power domains?=20

The genpd framework requires nodes in domain-idle-states to have the
domain-idle-state compatible, so it appears this idle state might not be
discovered by either the cpuidle or genpd frameworks.

[ ... ]
> +			spi14: spi@880000 {
> +				compatible =3D "qcom,geni-spi";
> +				reg =3D <0x0 0x00880000 0x0 0x4000>;
> +				interrupts =3D <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				status =3D "disabled";
> +			};

[Severity: Low]
Do these SPI controller nodes need #address-cells =3D <1>; and
#size-cells =3D <0>; properties?=20

Without them, the device tree compiler and kernel might fail to parse the
child addresses correctly if a board device tree adds child devices with reg
properties.

[ ... ]
> +		ufs_mem_hc: ufshc@1d44000 {
> +			compatible =3D "qcom,nord-ufshc",
> +				     "qcom,ufshc",
> +				     "jedec,ufs-2.0";
> +			reg =3D <0x0 0x01d44000 0x0 0x3000>,
> +			      <0x0 0x01d60000 0x0 0x15000>;
> +			reg-names =3D "std",
> +				    "mcq";
> +			interrupts =3D <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> +			lanes-per-direction =3D <2>;
> +			iommus =3D <&apps_smmu_0 0x14c0 0x0>;
> +			dma-coherent;
> +			msi-parent =3D <&gic_its 0x14c0>;
> +
> +			status =3D "disabled";
> +		};

[Severity: Low]
Are the mandatory clocks and clock-names properties missing for this block?

Bindings for peripherals like qcom,ufshc, qcom,geni-uart, and qcom,qce
typically require these. If they are omitted here, drivers might fail to
probe when enabled by a board file.

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

[Severity: Critical]
Could this highest temperature trip point lead to thermal runaway?=20

The trip-point1 is configured as type =3D "passive" without any cooling-map=
s,
which means the OS will not throttle or perform an emergency shutdown at 11=
5C.

Furthermore, since there is no critical trip point defined, it looks like t=
he
qcom,tsens-v2 hardware driver won't program the hardware critical threshold
either.=20

Should this trip point be changed to critical to enable graceful OS
shutdowns and hardware-level protections?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816125413.1635=
150-1-shengchao.guo@oss.qualcomm.com?part=3D1

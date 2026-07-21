Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C753BB9F8
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609687; cv=none; b=hMKgm1W2IuOkdk+JSjh2f3znRqWpbKMuvjlByZT/MKOjyvQ/DRmY0Wv/2E6Xf6UOymrneCtjEz61lm5MVFnHH5HiYTt6GeJXLUMo/rU4y7EddTlI3haAhkraPPo/UPC4IwxtVL0bvGln9mvXM6KHNCDclLVjGR4YrkxzcpqCi/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609687; c=relaxed/simple;
	bh=89bZEhyRU85bYaYFmIGvoOasIrw7Bd5E/+8/vS6bMc8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f7CB0zGewMTYOJZ5EZHqJlOQbBVDohAv3pmQYUAcyWNO8kPNFAm/PYljpRDEK1tuGx5LpHQiqF9WUCKpzYg2KBfceren3in0KxY7VzGtqJdyA560hnpKtsqpi30mUJ/7UkoDdzwL5I2pla+H6bKckHy5X/GkVI8hVJglSY8BaDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c22RbA/O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c22RbA/O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F591F000E9;
	Tue, 21 Jul 2026 04:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784609686;
	bh=l1ohz8SNVomRwJX7ym2JuDKEQ7dcEWU2CZIi79v9HVA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c22RbA/O5BxsIovs0UBA3y8eDX6subRo5K0wGXPwODUus8qAE+OaoTyYhFS262NKk
	 57zyZ9fQxLiJTPmrhvdy5/8YETOPs6nkfKbct4hPr4A2ZVQ/8VZtC/HJ1VyUAZAjIr
	 1GDEWZtVOVwR5Ry18A3tiBwGa/tNyBXCGfHXmq9vcrtAZjrV6KqJqMIHEszaqnZQx0
	 eCpc2g8Ujjc0iMHsaE8AUjBb5WMTvkvoZuDFPQVF7Dz61gMSp+KW6HzA5KeAQUORZy
	 3xw92DKW7DXrEd3Fc4mwdn5e5rSo2UR7gTja9XSENiJ3XivHNJtW3+VDuCtWSGc2KU
	 CTRKkarWHyYxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/6] arm64: dts: qcom: Add device tree for Nord SoC
 series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721044005.2882803-2-shengchao.guo@oss.qualcomm.com>
References: <20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com>
 <20260721044005.2882803-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 04:54:45 +0000
Message-Id: <20260721045445.D9F591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] All thermal zones lack a `type =3D "critical"` trip point for emer=
gency shutdown.
- [Medium] The `dump_mem` reserved-memory node statically reserves 121MB bu=
t lacks `no-map`, a `compatible` string, and is orphaned.
- [Medium] Duplicate 'iommus' Stream ID assignment on both the BAM DMA cont=
roller and the Crypto engine.
- [Medium] Enabled GENI QUP wrapper nodes are missing their mandatory 'cloc=
ks' properties.
- [Low] Missing `#address-cells` and `#size-cells` properties in all SPI co=
ntroller nodes.
--

--- Patch [1]: [PATCH v7 1/6] arm64: dts: qcom: Add device tree for Nord So=
C series ---
commit d0c5d04ca5794a27f3d1fad372e8a30ba477b937
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord SoC series

This commit introduces the base device tree describing the core hardware
components of the Nord SoC series. It includes definitions for the CPUs,
interrupt controller, memory regions, and various peripheral interfaces.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi

[ ... ]

> +		dump_mem: mem-dump-region {
> +			alloc-ranges =3D <0x0 0x00000000 0x0 0xffffffff>;
> +			size =3D <0x0 0x79b0000>;
> +		};
> +	};

[Severity: Medium]
Does this node need a compatible string and a no-map or reusable property?
Since it dynamically reserves ~121MB of system memory using alloc-ranges and
size, but lacks no-map, the kernel maps it into the direct linear map but
permanently removes it from the page allocator. As there is no device node
claiming it, this effectively creates a boot-time memory leak.

[ ... ]

> +		qupv3_2: geniqup@8c0000 {
> +			compatible =3D "qcom,geni-se-qup";
> +			reg =3D <0x0 0x008c0000 0x0 0x2000>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			iommus =3D <&apps_smmu_0 0x15a3 0x0>;
> +			ranges;

[Severity: Medium]
Since this wrapper node is active by default (lacking status =3D "disabled"=
),
does it need its clocks defined here? The qcom,geni-se-qup driver requires =
the
m-ahb and s-ahb clocks to probe successfully. Without them, the driver fails
to probe, which blocks any child node (I2C/SPI/UART) from probing even if a
board file enables them. This also applies to qupv3_0 and qupv3_1.

> +
> +			i2c14: i2c@880000 {
> +				compatible =3D "qcom,geni-i2c";
> +				reg =3D <0x0 0x00880000 0x0 0x4000>;
> +				interrupts =3D <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				status =3D "disabled";
> +			};
> +
> +			spi14: spi@880000 {
> +				compatible =3D "qcom,geni-spi";
> +				reg =3D <0x0 0x00880000 0x0 0x4000>;
> +				interrupts =3D <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				status =3D "disabled";
> +			};

[Severity: Low]
Should the SPI controller nodes explicitly define #address-cells =3D <1> and
#size-cells =3D <0>? These controllers act as parent buses for SPI client
devices addressed via chip select numbers. Omitting these properties will
cause DTC warnings when child devices are attached in board files. This
pattern appears across all spi nodes within the three GENI SE QUP wrappers.

[ ... ]

> +		cryptobam: dma-controller@1dc4000 {
> +			compatible =3D "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
> +			reg =3D <0x0 0x01dc4000 0x0 0x28000>;
> +			interrupts =3D <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells =3D <1>;
> +			iommus =3D <&apps_smmu_0 0x1689 0>;
> +			qcom,ee =3D <0>;
> +			qcom,num-ees =3D <4>;
> +			num-channels =3D <20>;
> +			qcom,controlled-remotely;
> +		};
> +
> +		crypto: crypto@1dfa000 {
> +			compatible =3D "qcom,nord-qce", "qcom,sm8150-qce", "qcom,qce";
> +			reg =3D <0x0 0x01dfa000 0x0 0x6000>;
> +			dmas =3D <&cryptobam 4>, <&cryptobam 5>;
> +			dma-names =3D "rx", "tx";
> +			iommus =3D <&apps_smmu_0 0x1689 0>;
> +
> +			/* It stops nord-gearvm variant from booting to console */
> +			status =3D "disabled";
> +		};

[Severity: Medium]
Are cryptobam and crypto intended to share the exact same iommus Stream ID
(0x1689)? The ARM SMMU driver will fail to map the identical Stream ID to t=
wo
independent master devices in the device tree, causing an IOMMU group confl=
ict
and a probe failure. While the crypto node is disabled to work around this,
enabling it on any board will re-trigger the failure.

[ ... ]

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
> +			};
> +		};

[Severity: High]
Does this thermal zone, along with all the other ones defined in this file,
need a type =3D "critical" trip point? By configuring the highest trip point
(e.g., 115000 or 125000) as "passive", the kernel will only attempt to
throttle the hardware. If passive cooling is insufficient, the OS will not
trigger an emergency shutdown, which could result in uncontrolled thermal
resets.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721044005.2882=
803-1-shengchao.guo@oss.qualcomm.com?part=3D1

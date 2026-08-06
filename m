Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251B440D574
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 08:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786005283; cv=none; b=S7cACb+zl7fVFb99Uq7m407XmXrzp1Y5HOPVvjAXMuI+C7ApVbgwcM+GnwGRLq5jxCEuLdU5+/xRrGj3vgjV1FsISokkDeq5oj8EtfQHb3cGcqS2pMBIIP/zjk+c/tsTKUp0x4cqxvfTcI0W0TjkzZlSS/coMwHNMJVm9H4uCVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786005283; c=relaxed/simple;
	bh=1Y6r7ezIrAuC/mY8wyM4qMtlyrOqFZNMrV85HVfKLYA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bp+huuIlZmY/jLN96PGRV9HeriQgw3WoY0BC0XgkWpYB4n/KW0TGWvDc0SmALKf/0Ux97uFOJasncN8krdc209eCsECpjK6sFaK1lBcJH0lP0HCqLCm/Jde+m9ZeWVDT1mRZK6qmzij1UWbNbHrbzfTqDZTok0ByMQgv2KntCdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hV9twvwy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hV9twvwy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3DC41F000E9;
	Thu,  6 Aug 2026 08:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786005273;
	bh=3nplVKuESZ6fPpbDcSdRpKGR69TIBmjSFB1P3wzXO/o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hV9twvwy2Q3mx8eeIzhCHLh6mFHkGcSI3LTJJ3+y8Hphxt6hOTuRbUsk35aGmvBCB
	 xoOSfrZppodfTLSOtk0WTuDzcI3EVpMWeHpRmUysEMvEMow6zFLQJHaAm4pjqsCp2x
	 RJZfbHXKlb0oQrTZwVhReFYrrmdkCaSh8JE67Ya7rJHG7sK2Ve1B0ksUbzWWnKB8mX
	 rVEjl3mlsFNrD/l05GwVQSVQpSvFF7JU0krfeN6Z9gjsfGQjiyCZwoIPPh6ft6xayO
	 kMEf79UvgpIogDWjHZUKH2zMmkOKRzSEfSSW4i+gQbqYAUH0JIFSrHhS16VPjhH5LS
	 CZmCa6fxwrSJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/6] arm64: dts: qcom: Add device tree for Nord SoC
 series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806081554.448531-2-shengchao.guo@oss.qualcomm.com>
References: <20260806081554.448531-1-shengchao.guo@oss.qualcomm.com>
 <20260806081554.448531-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 08:34:32 +0000
Message-Id: <20260806083432.E3DC41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The CPU idle state `core_off_c4` is incorrectly assigned as a `dom=
ain-idle-states` in the CPU power domains instead of `cpu-idle-states` in t=
he CPU nodes.
- [High] All thermal zones lack a 'critical' trip point, disabling the OS's=
 emergency thermal shutdown mechanism.
- [Low] The GENI SPI controller nodes are missing `#address-cells` and `#si=
ze-cells` properties.
- [Low] Missing `spi9` and `spi10` nodes in the `qupv3_1` GENI wrapper.
- [Low] Use of an invalid property name `#qcom,sensors` in the TSENS nodes.
--

--- Patch [1]: [PATCH v9 1/6] arm64: dts: qcom: Add device tree for Nord So=
C series ---
commit 0e9fe50e315b6e84c6b74e06788fe6d49d6b2710
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord SoC series

Adds the base device tree include (nord.dtsi) for the Nord SoC series,
describing the core hardware components including Oryon cores, interrupt
controllers, pinctrl, thermal sensors, SMMUs, and QUP blocks.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> new file mode 100644
> index 0000000000000..6373d2e65f24d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi

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

[Severity: High]
Will the generic power domain (genpd) framework fail to parse these CPU pow=
er
domains? Since core_off_c4 is defined as compatible =3D "arm,idle-state" ra=
ther
than "domain-idle-state", it looks like this miswires the CPU idle state as=
 a
domain idle state. Should this be in cpu-idle-states under the CPU node
instead?

[ ... ]

> +		tsens0: thermal-sensor@c22c000 {
> +			compatible =3D "qcom,nord-tsens",
> +				     "qcom,tsens-v2";
> +			reg =3D <0x0 0x0c22c000 0x0 0x1000>,
> +			      <0x0 0x0c222000 0x0 0x1000>;
> +			interrupts =3D <GIC_SPI 771 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 484 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "uplow",
> +					  "critical";
> +			#qcom,sensors =3D <16>;

[Severity: Low]
Does this property name violate device tree naming conventions? Since the h=
ash
character is typically reserved for cell count specifiers like #address-cel=
ls,
should this be named qcom,sensors without the prefix so that tools and driv=
ers
can parse it correctly?

> +			#thermal-sensor-cells =3D <1>;
> +		};

[ ... ]

> +		qupv3_2: geniqup@8c0000 {
> +			compatible =3D "qcom,geni-se-qup";
> +			reg =3D <0x0 0x008c0000 0x0 0x2000>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			iommus =3D <&apps_smmu_0 0x15a3 0x0>;
> +			ranges;
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
Are these SPI controller nodes missing #address-cells and #size-cells
properties? Without them, won't board files encounter compilation errors wh=
en
they attempt to add child devices to the SPI bus?

[ ... ]

> +		qupv3_1: geniqup@ac0000 {
> +			compatible =3D "qcom,geni-se-qup";

[ ... ]

> +			i2c9: i2c@a88000 {
> +				compatible =3D "qcom,geni-i2c";
> +				reg =3D <0x0 0x00a88000 0x0 0x4000>;
> +				interrupts =3D <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				status =3D "disabled";
> +			};
> +
> +			uart9: serial@a88000 {
> +				compatible =3D "qcom,geni-uart";
> +				reg =3D <0x0 0x00a88000 0x0 0x4000>;
> +				interrupts =3D <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				status =3D "disabled";
> +			};

[Severity: Low]
Are the spi9 and spi10 nodes intentionally omitted from the qupv3_1 wrapper?
Board files won't be able to use the QUPv3 Serial Engine instances 9 and 10=
 in
SPI mode because their base definitions appear to be missing here.

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

[Severity: High]
Do these thermal zones need a trip point with type =3D "critical" rather th=
an
just "passive"? Without a critical trip point, it looks like the Linux ther=
mal
core will not invoke the emergency orderly_poweroff() when the hardware
severely overheats, and will rely instead entirely on abrupt hardware cutof=
fs.

> +				};
> +			};
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806081554.4485=
31-1-shengchao.guo@oss.qualcomm.com?part=3D1

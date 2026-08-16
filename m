Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A844B0481
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 13:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786887723; cv=none; b=jUVUSw4WXOXcC1W9qySZtEuyrn4ayYrVhHw1n9J75+7d3Z8zkEvT0pOieXigTKXNDcVwz2YDaEIlZ82rXlo4z9R4kj2d1WLSaDvaQ9mMzHJBCZy0Vf70MXEE0o1eHZFH6wc/JWKNj+l2UmpIJqTbSCckBzPdtNnC/6HEBhoppQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786887723; c=relaxed/simple;
	bh=Xd7GrjwSxxC9kKR65ENEQjI4HhpZ+tyzfVGD3IXnX00=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pF7tS0iEIALABhwm1/I5QDeqVVUaLTOzEIVdkoXT8KPTCsyA7DPhyl9HeDYbTDxIX2kKWYumo6RMDpcg4vLHl2lDMklb6v/55f/HfUJ8Tu8jaJTQwRxQLbmjInopkbklPuTz2WmTNIME4HHjqf1EYet/au0qbTG6sbwioKX7aak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQAbE3mj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQAbE3mj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1111F000E9;
	Sun, 16 Aug 2026 13:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786887721;
	bh=WX/OTTJBB0u3Oie+p4iivrXqWl6IfmroQ8p3ukELRk4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kQAbE3mjVY8ZqctZncjtaBg1kpyG3B8nYnCC+fz1IIXKy3iK/kFXps6k8NA/E9kMU
	 y95DgOab1OdMe98EX2XNN4fRHdIrN8SL5y9H3pf8ocIwvFTf9hJiAnLvb1NVV11SAb
	 exz/eEb7D6TZ+zq1H9n/FdDVABdIsi5UovMpimDkd9uVskOTlt2ARFTAyPCpHu/CK+
	 ln5TzjU0W+120E8YnfIC8ieC3uvAZxcis5USuEo1T920aaFleiy4UdhTZ+3BU3en8L
	 kuWFuN2Q4t9k8pcTXldtsX1r7vkXF15FYFIZzflXIYAAjLmqP+NXInKrlCbP9YrMXL
	 +TvWtUzHpqKHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: Add SM7250 base dts file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeshankar K" <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260816133231.10875-2-sreeshankar0910@gmail.com>
References: <20260816133231.10875-1-sreeshankar0910@gmail.com>
 <20260816133231.10875-2-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 13:42:00 +0000
Message-Id: <20260816134201.4F1111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The `timer@17c20000` node incorrectly configures `#address-cells` =
and `#size-cells`, leading to broken memory mappings.
- [High] The `spmi@c440000` bus node incorrectly sets `#address-cells` and =
`#size-cells`, breaking SPMI device enumeration.
- [Medium] Missing mandatory properties `cache-level` and `cache-unified` i=
n L2 and L3 cache nodes.
- [Medium] The CPU topology `cpu-map` is entirely missing, breaking cluster=
-awareness and Energy Aware Scheduling.
- [Low] The SPMI node name `qcom,spmi@c440000` violates the standard generi=
c node naming requirements.
- [Low] The memory-mapped `tcsr_mutex` is placed at the root of the device =
tree rather than within the `soc` simple-bus node.
--

--- Patch [1]: [PATCH 1/5] arm64: dts: qcom: Add SM7250 base dts file ---
commit 0271d54882ba31c5bab214b6f9e5a7997f5a44fd
Author: Sreeshankar K <sreeshankar0910@gmail.com>

arm64: dts: qcom: Add SM7250 base dts file

This patch adds the base devicetree file for the Qualcomm SM7250 SoC and the
corresponding SM7250 MTP platform. It configures basic nodes like CPU, PSCI,
and serial console required for booting.

> diff --git a/arch/arm64/boot/dts/qcom/sm7250.dtsi b/arch/arm64/boot/dts/q=
com/sm7250.dtsi
> new file mode 100644
> index 0000000000000..66b3705461f1e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7250.dtsi
[ ... ]
> +	cpus {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <0>;
> +
> +		CPU0: cpu@0 {

[Severity: Medium]
Is a cpu-map node missing here?

Without a cpu-map to define the physical and logical clusters, the kernel
will treat all cores as a single flat cluster. This degrades scheduling
decisions and prevents Energy Aware Scheduling from functioning on this
big.LITTLE SoC.

> +			device_type =3D "cpu";
> +			compatible =3D "qcom,kryo475";
> +			reg =3D <0x0 0x0>;
> +			enable-method =3D "psci";
> +			next-level-cache =3D <&L2_0>;
> +			L2_0: l2-cache {
> +				compatible =3D "cache";
> +				next-level-cache =3D <&L3_0>;
> +				L3_0: l3-cache {
> +					compatible =3D "cache";
> +				};
> +			};

[Severity: Medium]
Should these cache nodes include the cache-level and cache-unified properti=
es?

Without these mandatory properties, the kernel cache topology parser cannot
accurately identify or expose the cache layout to userspace via sysfs,
which prevents userspace applications from optimizing workloads based on
cache topology.

[ ... ]
> +	firmware {
> +		scm: scm {
> +			compatible =3D "qcom,scm-sm7250", "qcom,scm";
> +			#reset-cells =3D <1>;
> +		};
> +	};
> +
> +	tcsr_mutex: hwlock@1f40000 {
> +		compatible =3D "qcom,tcsr-mutex";
> +		reg =3D <0x0 0x01f40000 0x0 0x40000>;
> +		#hwlock-cells =3D <1>;
> +	};

[Severity: Low]
Should this memory-mapped peripheral be instantiated as a child of the soc
simple-bus node instead of the root node?

Placing it at the root bypasses the address translation layers (ranges,
dma-ranges) established by the soc node and misrepresents the hardware
bus hierarchy.

[ ... ]
> +		pdc: interrupt-controller@b220000 {
[ ... ]
> +		};
> +
> +		spmi: qcom,spmi@c440000 {

[Severity: Low]
Does this node name violate the standard generic node naming conventions?

The node name should ideally be generic, such as spmi@c440000. Including
the vendor prefix (qcom,) in the node name typically results in dtbs_check
validation errors against the spmi-pmic-arb schema.

> +			compatible =3D "qcom,spmi-pmic-arb";
> +			reg =3D <0x0 0x0c440000 0x0 0x0001100>,
> +			      <0x0 0x0c600000 0x0 0x2000000>,
> +			      <0x0 0x0e600000 0x0 0x0100000>,
> +			      <0x0 0x0e700000 0x0 0x00a0000>,
> +			      <0x0 0x0c40a000 0x0 0x0026000>;
> +			reg-names =3D "core", "chnls", "obsrvr", "intr", "cnfg";
> +			interrupt-names =3D "periph_irq";
> +			interrupts-extended =3D <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
> +			qcom,ee =3D <0>;
> +			qcom,channel =3D <0>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;

[Severity: High]
Are these address and size cells correct for an SPMI bus?

The SPMI bus bindings require #address-cells =3D <2> (for the 8-bit slave ID
and 16-bit register offset) and #size-cells =3D <0>. Using <1> and <1> will
cause parsing of any child PMIC nodes to fail, breaking PMIC enumeration
and disabling dependent power domains.

[ ... ]
> +		timer@17c20000 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			ranges;
> +			compatible =3D "arm,armv7-timer-mem";
> +			reg =3D <0x0 0x17c20000 0x0 0x1000>;
> +			clock-frequency =3D <19200000>;
> +
> +			frame@17c21000 {
> +				frame-number =3D <0>;
> +				interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +				reg =3D <0x0 0x17c21000 0x0 0x1000>,
> +				      <0x0 0x17c22000 0x0 0x1000>;

[Severity: High]
Will this configuration correctly parse the 64-bit addresses in the child
nodes?

The child frame nodes use 4 cells for their reg properties (e.g.,
<0x0 0x17c21000 0x0 0x1000>). Because this parent node sets #address-cells
and #size-cells to 1, the dt-parser will incorrectly split this single
64-bit region into distinct, erroneous memory regions. Attempting to map a
region starting at physical address 0x0 with a size of 0x17c21000 can lead
to a kernel panic during boot.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816133231.1087=
5-1-sreeshankar0910@gmail.com?part=3D1

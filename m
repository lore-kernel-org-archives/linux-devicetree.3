Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B592F83A0
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779174276; cv=none; b=fG4JETJzvDKjht2oQg3YjwC7pShv5uOsusX/7AM5I0TdaZ66xlItvfbZW3+JgBaRg2vD8rLyN7vQp/PhpC5TJFpK7A99nfhgU7sZc3sklv/ZKesl+haxeqwI5/t063LMTLjSc5UbSDudWlb3441ifT35zBuK5OYtEadjYyITTNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779174276; c=relaxed/simple;
	bh=Kvo2bP7sF0ZsQRtWDKTiW903tqF1p3n28QXipRihoxM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tl9/TIS83reqDFRVj6Zs4D2vtz4GcKsU2bkSqY+CuRo0UjYHz37n5EhZRLtdzsTQxnlA0JVina7kCJ2nkWt+01xvkflMniqZy5y5CrgRJ4L2F4w/55azCh1xxG9PfyhUelqxosQOHGkZ4vC+fhLYOOE3/BU8ZwUhgA2X1+XyI7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PamhpUBW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PamhpUBW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C703C2BCB3;
	Tue, 19 May 2026 07:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779174275;
	bh=Kvo2bP7sF0ZsQRtWDKTiW903tqF1p3n28QXipRihoxM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=PamhpUBWS9wmvdIMar2N3auVL8RGrj/X1bs6Cx+TMYoSZsk9n/OqdOsqWfQSnR2uU
	 xm5DEfSSRSifNA5OX8dWzmaXfiCD6k+6VZb7xUX/nCTLrri/rvzlXFThlRG2k1dFOM
	 lPpQAqZA1dzwRs6PBf+XqR3gR1fCYYSn0Jcrp2oD+W55PkcbWDH2IRY5QC3kXLafAs
	 xt1g+H58ffM9MVUzbTRS0c6tfzIDI+ZE7XAqxxYJhgznApqSwuDvoXxmPMRvui4I42
	 +kLAcxXMv5X62+sy1z1Vzwpf2rLoXjEqX9S84Gv4u+k3gFR3KiOHszV53obsTpyrUM
	 sSSOF41gsi96Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: Add device tree for Nord SoC
 series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519063505.883379-6-shengchao.guo@oss.qualcomm.com>
References: <20260519063505.883379-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 07:04:34 +0000
Message-Id: <20260519070435.6C703C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The `ufs_mem_hc` node is missing the required `reg` property.
- [High] The CPU idle state `core_off_c4` is improperly wired to power doma=
ins instead of CPU nodes.
- [High] The `arch_timer` node incorrectly uses the legacy GICv2 `GIC_CPU_M=
ASK_SIMPLE(8)` macro for its interrupts in a GICv3 system.
- [Medium] The `pdp_scmi` node provides fewer `shmem` entries than `mboxes`=
, which breaks channel assignments.
- [Medium] The `i2c15` and `spi15` nodes are missing their `compatible` pro=
perties.
- [Low] The `pdp0_a2p` shared memory node has a mismatched unit address in =
its name.
- [Low] The `l2-cache` nodes are incorrectly placed as nested children insi=
de the `cpu` nodes.
--

commit e4aaf34e88835bde7e82aca29bb473de34bfe007
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord SoC series

This commit adds the base device tree include (nord.dtsi) for the Nord SoC =
series.
It describes the core hardware components including CPUs, GICv3 interrupt
controller, TLMM, SMMU instances, QUPv3 blocks, SCMI, and timers.

> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qco=
m/nord.dtsi
> new file mode 100644
> index 0000000000000..b425a91a7890a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -0,0 +1,4511 @@
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
> +			reg =3D <0x0 0x0>;
> +			enable-method =3D "psci";
> +			power-domains =3D <&cpu0_pd>;
> +			power-domain-names =3D "psci";
> +			next-level-cache =3D <&l2_0>;
> +			clocks =3D <&cpu_perf 0>;
> +
> +			l2_0: l2-cache {
> +				compatible =3D "cache";
> +				cache-level =3D <2>;
> +				cache-unified;
> +			};

Are these l2-cache nodes correctly placed?

The l2_0 (and other L2 cache) nodes are declared directly inside their
respective CPU nodes. The cpus.yaml schema forbids cache nodes as children
of a CPU node; they must be declared as peer nodes within the /cpus
hierarchy and referenced via next-level-cache phandles.

> +		};

[ ... ]

> +	firmware: firmware {
> +		scm {
> +			compatible =3D "qcom,scm-nord",
> +				     "qcom,scm";
> +			qcom,dload-mode =3D <&tcsr 0x79000>;
> +		};
> +
> +		pdp_scmi: scmi {
> +			compatible =3D "arm,scmi";
> +			mboxes =3D <&pdp0_mbox 0>,
> +				 <&pdp0_mbox 11>,
> +				 <&pdp0_mbox 1>;
> +			mbox-names =3D "tx",
> +				     "tx_reply",
> +				     "rx";
> +			shmem =3D <&pdp0_a2p>,
> +				<&pdp0_p2a>;

Does this configuration provide enough shmem entries for the defined mailbo=
xes?

The SCMI node defines 3 mailboxes (tx, tx_reply, rx) but only 2 shmem
phandles. The SCMI driver maps shared memory regions to mailbox channels
sequentially.

This mismatch causes the tx_reply channel to erroneously bind to the p2a
buffer, and leaves the rx channel without any shared memory, which will
break SCMI notifications and split completions.

> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;

[ ... ]

> +		tme_crash_dump_mem: tme-crash-dump-region@87000000 {
> +			reg =3D <0x0 0x87000000 0x0 0xa0000>;
> +			no-map;
> +		};
> +
> +		pdp0_a2p: scmi-shmem@87060180 {
> +			compatible =3D "arm,scmi-shmem";
> +			reg =3D <0x0 0x87608180 0x0 0x80>;

Is there a typo in the unit address for this node?

The node is named scmi-shmem@87060180, but its reg property maps address
0x87608180. According to Device Tree specifications, the unit address in
the node name must exactly match the base address in the reg property.

> +			no-map;
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

Is core_off_c4 properly wired to this power domain?

The core_off_c4 idle state has compatible =3D "arm,idle-state", making it
a CPU idle state. However, it is assigned via the domain-idle-states
property inside CPU power domain nodes instead of the cpu-idle-states
property inside the CPU nodes.=20

The domain-idle-states property only accepts targets with
compatible =3D "domain-idle-state". Due to this mismatch, the cpuidle driver
will not discover the CPU idle states, preventing the cores from entering
intended retention states.

> +
> +		cpu1_pd: power-domain-cpu1 {
> +			#power-domain-cells =3D <0>;

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

[ ... ]

> +			uart14: serial@880000 {
> +				compatible =3D "qcom,geni-uart";
> +				reg =3D <0x0 0x00880000 0x0 0x4000>;
> +				interrupts =3D <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				status =3D "disabled";
> +			};
> +
> +			i2c15: i2c@884000 {
> +				reg =3D <0x0 0x00884000 0x0 0x4000>;
> +				interrupts =3D <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				status =3D "disabled";
> +			};
> +
> +			spi15: spi@884000 {
> +				reg =3D <0x0 0x00884000 0x0 0x4000>;
> +				interrupts =3D <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
> +
> +				status =3D "disabled";
> +			};

Are these i2c15 and spi15 nodes missing their compatible strings?

They lack a compatible property (e.g., "qcom,geni-i2c"). Although
currently marked as disabled, any board device tree that sets them to okay
will find them completely non-functional because the kernel driver model
requires a compatible string to bind the correct device driver.

> +
> +			uart15: serial@884000 {
> +				compatible =3D "qcom,geni-debug-uart";

[ ... ]

> +		ufs_mem_hc: ufshc@1d44000 {
> +			compatible =3D "qcom,nord-ufshc",
> +				     "qcom,ufshc",
> +				     "jedec,ufs-2.0";
> +			interrupts =3D <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
> +			lanes-per-direction =3D <2>;
> +			iommus =3D <&apps_smmu_0 0x14c0 0x0>;
> +			dma-coherent;
> +			msi-parent =3D <&gic_its 0x14c0>;
> +		};

Is this node missing its reg property?

The ufshc@1d44000 node defines a unit address but omits the reg property
entirely. This will prevent the UFS host controller driver from mapping its
memory-mapped I/O registers during probe, rendering this hardware block
non-functional.

> +
> +		tcsr_mutex: hwlock@1f40000 {

[ ... ]

> +	arch_timer: timer {
> +		compatible =3D "arm,armv8-timer";
> +		interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LO=
W)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +	};

Can the GIC_CPU_MASK_SIMPLE(8) macro be used safely here for a GICv3 system?

For an arm,gic-v3 interrupt controller, bits 8-15 of the third interrupt
cell specify the PPI partition number, not a CPU mask. Using
GIC_CPU_MASK_SIMPLE(8) resolves to (0xff << 8), setting the GICv3 PPI
partition number to an invalid 255. This will cause the architectural timer
interrupts to be misrouted or fail mapping altogether.

> +
> +	thermal_zones: thermal-zones {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519063505.8833=
79-1-shengchao.guo@oss.qualcomm.com?part=3D5

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACA33D3D1B
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 11:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214125; cv=none; b=l5B0wquU5UEXCTKbfZREms+iUsSNhUVpZ3ppE1A+3ePJXycrsqJGMfBa8Ao2EOCH5z2/6CMCktkc35mX+5sX4p57i1nQcXGwrSPJRhylX5l0jsfcyRQ74yNDgxyH0LzOKfMVu6eHHJ9F2F7aP3fLEYj7k2bgkx9AqyM5+YrZX24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214125; c=relaxed/simple;
	bh=8HC1kGwUdNwYeirHQdvdz+uKxwLQizhvVgxZ21Fu4GU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ATFfDSva/hd7yIQqfOnmJ3NvdznKiKpfuqsPuMEW/cElm6XsZQyUNAQgnzXFc3LE9Yw0glIYuJ7i3wKrfEcO4ZSYcct7mvI8YNqBQo4k9wcc5reMJTV0gqN23DEwW2zyB4YQmBrg/uOORKqZBU7evvQ8DYbouEoMpyef6AwwzaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LWESjyaF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LWESjyaF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11BEA1F000E9;
	Tue, 23 Jun 2026 11:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782214124;
	bh=6zA1gjDsK6oxC7OWavsoIpKr+2+SsYYhSKBTJLXiIIA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LWESjyaFoNLtkHOm9R688zBjlZSnEi47HYSPDEugclnZvn/UXT0kDMr405bDILujH
	 Tu9tMibuJtImY9QKFD7ESfjYgbLCxa4GS/F9ndYSj+CBLnbM2DMXX3eIUuczvxGjxM
	 waqtTi/+6eExGEFci/nzrQxwlKAMHQqSu2oXjM0O/y5JTBAnR6AxOMYJ+7jlMknVrK
	 Upu+4ASGA03r9RNAqNiy/oKiMubR8tsw8TIOVN3aB/Y6LIOt073ZfwcLmX/rYOWqzp
	 FingbJAe3RX2WEwQQwn8ya57bi4ocp+n3hndsI1yupCFOh0unI2XPjG8jlRpaWkSQL
	 Ou+atmml3gHBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: socfpga: agilex7-gen2: Add initial
 device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260623111716.16690-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260623111716.16690-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260623111716.16690-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 11:28:43 +0000
Message-Id: <20260623112844.11BEA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] Missing mandatory ARM architected timer (`arm,armv8-timer`) no=
de.
- [High] The ATF (ARM Trusted Firmware) reserved memory is improperly decla=
red as a shared DMA pool.
- [Medium] Missing Energy Aware Scheduling (EAS) capacity and topology maps=
 for heterogeneous big.LITTLE CPUs.
- [Medium] Missing UART/serial console and `chosen` node.
- [Medium] Missing VGIC maintenance interrupt in the GICv3 node.
- [Low] Invalid combination of `reg` and `alignment` properties in `reserve=
d-memory` nodes.
- [Low] Incorrect `#address-cells` for 64-bit CPUs.
--

commit 686f550501dd7f94cdc969838594ed32ff4cbd42
Author: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

arm64: dts: socfpga: agilex7-gen2: Add initial device tree

This patch adds the initial device tree support for the Intel SoCFPGA Agile=
x7
Gen2 platform. It includes the SoC DTSI and the SoCDK board DTS, featuring
a heterogeneous CPU cluster with Cortex-A520 and Cortex-A720 cores.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex7_gen2.dtsi b/arch/a=
rm64/boot/dts/intel/socfpga_agilex7_gen2.dtsi
> new file mode 100644
> index 0000000000000..e3b777408f9a6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex7_gen2.dtsi
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026, Altera Corporation
> + */
> +/dts-v1/;
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	compatible =3D "intel,socfpga-agilex7-gen2";
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;

[Severity: Critical]
Is it intentional to omit the arm,armv8-timer node from the root level? Wit=
hout
the architectural timer node, the system may fail to establish a clocksource
and clockevents, which typically leads to an indefinite hang during early b=
oot
when timer_probe() fails.

[Severity: Medium]
Does this platform need a chosen node and UART serial console configured at
the root level? Omitting them usually results in no interactive console or
kernel boot logs over serial, which makes early boot validation very diffic=
ult.

> +
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		atf_reserved: atf@80000000 {
> +			compatible =3D "shared-dma-pool";

[Severity: High]
Does declaring the ATF reserved memory as a shared-dma-pool expose the secu=
re
EL3 memory region to the kernel's DMA allocator? If the kernel resolves a D=
MA
allocation to this region and a device writes to it, it could overwrite the
TrustZone firmware, potentially triggering a secure access violation (SErro=
r).

> +			reg =3D <0x0 0x80000000 0x0 0x100000>;
> +			alignment =3D <0x1000>;

[Severity: Low]
Is it necessary to include the alignment property when reg is already
explicitly provided? Device tree schema validation typically rejects combin=
ing
reg and alignment in reserved-memory nodes, as the kernel parser typically
ignores alignment when reg is present.

> +			no-map;
> +		};
> +
> +		service_reserved: svcbuffer@80100000 {
> +			compatible =3D "shared-dma-pool";
> +			reg =3D <0x0 0x80100000 0x0 0xf00000>;
> +			alignment =3D <0x1000>;

[Severity: Low]
Similar to the ATF reserved node, is the alignment property needed here whe=
n a
reg property is explicitly defined?

> +			no-map;
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells =3D <1>;

[Severity: Low]
Should #address-cells be 2 for 64-bit ARM CPUs? While it might work if the
Aff3 field is zero, setting it to 1 truncates the MPIDR_EL1 representation =
to
32 bits and violates ARM64 device tree binding conventions.

> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible =3D "arm,cortex-a520";
> +			device_type =3D "cpu";
> +			enable-method =3D "psci";
> +			reg =3D <0x0>;
> +		};

[ ... ]

> +		cpu3: cpu@300 {
> +			compatible =3D "arm,cortex-a720";

[Severity: Medium]
Are the Energy Aware Scheduling (EAS) capacity and topology maps missing for
these heterogeneous cores? Without them, the scheduler might treat the
Cortex-A520 and Cortex-A720 as having identical performance capabilities,
leading to suboptimal task placement.

> +			device_type =3D "cpu";
> +			enable-method =3D "psci";
> +			reg =3D <0x300>;
> +		};
> +	};
> +
> +	psci {
> +		compatible =3D "arm,psci-0.2";
> +		method =3D "smc";
> +	};
> +
> +	intc: interrupt-controller@7000000 {
> +		compatible =3D "arm,gic-v3";
> +		reg =3D <0x0 0x7000000 0x0 0x10000>,
> +		      <0x0 0x7080000 0x0 0x100000>;
> +		ranges;
> +		#interrupt-cells =3D <3>;
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		interrupt-controller;
> +		#redistributor-regions =3D <1>;
> +		redistributor-stride =3D <0x0 0x40000>;

[Severity: Medium]
Does the GICv3 node need to declare a VGIC maintenance interrupt? Without t=
his
interrupt, the KVM hypervisor might not receive maintenance interrupts,
which can break virtualized interrupt state management for guest VMs.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623111716.1669=
0-1-muhammad.nazim.amirul.nazle.asmade@altera.com?part=3D2

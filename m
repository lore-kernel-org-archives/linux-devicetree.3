Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3A738BF67
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 10:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306561; cv=none; b=pHZxGitjxGjd9wp4W4mmfy1itMexMuJ5SCWjzJIY/mhl/kXgyDTTtiCsVNsRyX494aV948R+lp9BneyapRWpv2FhKSTysEOMtYfVZuY60R4e9ek3V/t6EuG0cpJt79jp8s/ssrl1Tj+Pn9+EmpUzvf5vqiYL97gx5k8BuXlmca8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306561; c=relaxed/simple;
	bh=ekYbNXKFXIcCtkk0pBYSFI/DvgLLy8kr5UsYwBoK4wc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NJKElNhIg1NRK7DU38MuVZulsmlX2HzpE+07ekDYrUxBISEsybnvpcTfPe4LeHkWLRE63yCS5MfZBpJFTtUEuOJwAS3IHvgx6feb921JgwSwilHoCymz7ylfCOzbkTdyKrYtD7h10zlHXYETtUoiRdv4DhHdDJaU51BbX7a67q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7kstpdU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7kstpdU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B7981F000E9;
	Fri, 21 Aug 2026 10:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787306552;
	bh=AU/W93bS3tC5X5maOjvwtZ8r6eOLWI01pOWrjGc0u8I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c7kstpdUElZ/f1YaP2NbzWkxTvQpmp2qDlkQrmPK+iH7rjl63cX/queoveJx5Ku5D
	 h1sivOi/FVucDP8002INxlxBv0uX+6lm4tEmDBGkehQKRPgHAqGUcS884fXnAWmk15
	 S7sel/vsmGw61i1+Ml1pDModv63mDUzbp05Y3fw+10E+Sblj9TJtHcgdpMb+623pHZ
	 x1vDWmKnGIA2Wlv9IJJU0dogFTvpicSkDkZSJ8371jFx7xixiMOIaiJcNZUh3Hz3S2
	 Rvlm/xP4DDKUujfOhw+dAOr5PQChT+X7oTnZk2t9QQfb7x9tZOL+S3oZT0lPXNPDiD
	 V9WjuoYQBo+nQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: axera: add AX650 Demo initial support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Leng Honglin" <lenghonglin@axera-tech.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260821-ax650-v1-v1-5-e1b013938e6b@axera-tech.com>
References: <20260821-ax650-v1-v1-0-e1b013938e6b@axera-tech.com>
 <20260821-ax650-v1-v1-5-e1b013938e6b@axera-tech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 10:02:31 +0000
Message-Id: <20260821100232.3B7981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Architectural incompatibility: Cortex-A55 CPUs paired with a legac=
y GIC-400 interrupt controller.
- [Medium] The GIC-400 node is misconfigured: incorrect CPU interface size,=
 missing VGIC maintenance interrupt, and unit address mismatch.
- [Medium] The `cpus` node incorrectly uses `#address-cells =3D <1>` on an =
ARM64 system.
--

--- Patch [5]: [PATCH 5/6] arm64: dts: axera: add AX650 Demo initial suppor=
t ---
commit 37472cfe2d70aac44a9e284715ad040433a0f768
Author: Leng Honglin <lenghonglin@axera-tech.com>

arm64: dts: axera: add AX650 Demo initial support

This commit adds initial device tree support for the Axera AX650 SoC and
Demo board.

> diff --git a/arch/arm64/boot/dts/axera/ax650.dtsi b/arch/arm64/boot/dts/a=
xera/ax650.dtsi
> new file mode 100644
> index 0000000000000..4fceaee81496c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/axera/ax650.dtsi
> @@ -0,0 +1,134 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 Axera Semiconductor Co., Ltd.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	interrupt-parent =3D <&gic>;
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +
> +	cpus {
> +		#address-cells =3D <1>;

[Severity: Medium]
Should this node use #address-cells =3D <2>? ARM64 systems typically require
2 cells to correctly represent the 64-bit MPIDR_EL1 register (which includes
the Aff3 field) and comply with ARM CPU device tree binding schemas.

> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "arm,cortex-a55";
> +			reg =3D <0x0>;
> +			enable-method =3D "psci";
> +		};

[ ... ]

> +	/* GIC-400 block base; register frames start at offset 0x1000. */
> +	gic: interrupt-controller@4900000 {
> +		compatible =3D "arm,gic-400";

[Severity: High]
Can a legacy GIC-400 interrupt controller be paired with the Cortex-A55
cores defined above? Cortex-A55 cores integrate a GICv3 CPU interface
accessed via system registers and do not support the legacy GICv2
memory-mapped CPU interface (GICC).

The kernel will attempt to probe a GIC-400 and memory-map its GICC region,
while the CPUs expect to use GICv3 system registers, which could lead to
incorrect interrupt routing or boot failure.

[Severity: Medium]
Is the configuration of this node completely accurate?

The unit address (@4900000) does not match the first register address
(0x4901000).

The CPU interface size (second reg entry) appears to be 0x1000 instead of
0x2000. This undersized CPU interface prevents the kernel from accessing the
GICC_DIR register, forcing it to disable split-EOI functionality.

Does this node also need an interrupts property for the VGIC maintenance
interrupt? Without it, KVM virtualization will fail to initialize.

> +		#interrupt-cells =3D <3>;
> +		#address-cells =3D <0>;
> +		interrupt-controller;
> +		reg =3D <0x0 0x4901000 0x0 0x1000>,
> +			<0x0 0x4902000 0x0 0x1000>,
> +			<0x0 0x4904000 0x0 0x2000>,
> +			<0x0 0x4906000 0x0 0x2000>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-ax650-v1-v=
1-0-e1b013938e6b@axera-tech.com?part=3D5

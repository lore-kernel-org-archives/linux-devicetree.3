Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E723E49C3
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 10:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963089; cv=none; b=LyYz4OeJzPReqDhe8VsIKr0zw9VK7uQXNW/7kV83aOL7dMjvPB7dSTJ+4PP6I4JZsVLAWefYMJwJHqyxVScnuWH1xu08I2/i5ExUi35GxY2OruF2rl8lM/TSsxvGO/k4CgNoKea9T8nGcncOOQiW+hUMuuSwKKV6na9hH4Dkex8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963089; c=relaxed/simple;
	bh=GavKxTPHeujEqe+HEnLmgvChsNdnTxE3FQV2HDxahZg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NwADehS82CS2VqrwhOyqYJ7nE63e8Km9xeXtyrLAHSzMxWBhVASrAiIJzzQoH+K71S0aWgEyWcWZtWVCqfq+6Dlksg0I7tqKdgjEXCYSWh10XHR41DxXE/2aRXy7iZuuWDYNi5cIu8DUijTqsgyLbr66x/Tl7/wgpsBG/+fuy90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UudKDtHJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UudKDtHJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788801F000E9;
	Mon, 17 Aug 2026 10:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786963087;
	bh=4pdRN810uyDedpwGEo+LFWLpz4CjZRdIdqGZYKldFKE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UudKDtHJTVvgQAX7hEV1ektMMHlzd7qv5ztfTLq+CQ1mOOAotgw7VAvvvNCGby93+
	 JCDMc+z6sEUxbcPlr2X7gTvwC8f2Btmx4D45gz6akg6azKMeA83rdpJ9Nt4+sv0na4
	 G5SQ1AxzGVgepHQ8USvy5fBIQlgbygXz6vsvFQ2SSmEgL0V1jNZby60vdOhsme5suQ
	 iyYvSgHPTlH9iazSGq56100BbuY7CSX+jNLFxsAFAu9U/YCjDkR9eAe37590oX/W+Q
	 6gqJi7L1UficSGtzsmLLxQNBx5D6XDp5Y8uNGuT6syh5IGKTLM6S8G4KbV8ke5mZOg
	 NzGkH4VOLF3LA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: exynos: Add initial support for
 Exynos5515 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aiden Isik" <aidenisik@member.fsf.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260817-for-next-lucky7-v1-1-42ffb2b71ba2@member.fsf.org>
References: <20260817-for-next-lucky7-v1-0-42ffb2b71ba2@member.fsf.org>
 <20260817-for-next-lucky7-v1-1-42ffb2b71ba2@member.fsf.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 10:38:07 +0000
Message-Id: <20260817103807.788801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Medium] The GIC-400 node lacks the VGIC maintenance interrupt property.
- [Medium] GIC CPU interface (GICC) memory region is incorrectly sized at 0=
x1000, which breaks VGIC support.
- [Low] Node unit-addresses for `cpu1` and `gic` do not match their `reg` p=
roperties.
- [Low] Redundant and deprecated custom function IDs are provided for PSCI =
1.0.
- [Low] Missing dt-bindings clock header `samsung,exynos5515-cmu.h`.
--

--- Patch [1]: [PATCH 1/2] arm64: dts: exynos: Add initial support for Exyn=
os5515 SoC ---
commit e8b991884f3a3fd45bff9e8dcdd76dcc3db06db9
Author: Aiden Isik <aidenisik@member.fsf.org>

arm64: dts: exynos: Add initial support for Exynos5515 SoC

The patch adds initial device tree support for the Exynos5515 SoC, used in
Samsung Galaxy Watch models. It adds CPUs, generic timer, watchdog, and
various clock management units.

> diff --git a/arch/arm64/boot/dts/exynos/exynos5515.dtsi b/arch/arm64/boot=
/dts/exynos/exynos5515.dtsi
> new file mode 100644
> index 0000000000000..5584c1a3aaf4f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos5515.dtsi
> @@ -0,0 +1,186 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Samsung Exynos 5515 SoC device tree source
> + *
> + * Copyright (c) 2026 Aiden Isik <aidenisik+git@member.fsf.org>
> + */
> +
> +#include <dt-bindings/clock/samsung,exynos5515-cmu.h>

[Severity: Low]
Is this header file missing? It appears it was not added in this patch or
earlier in the series, which will cause the device tree compilation to fail.

> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
[ ... ]
> +		cpu1: cpu@1 {
> +			compatible =3D "arm,cortex-a55";
> +			reg =3D <0x100>;

[Severity: Low]
Does the unit-address for cpu1 match the reg property? The device tree
specification requires the unit-address to match the first address in the
reg property, so should this be cpu@100?

> +			device_type =3D "cpu";
> +			enable-method =3D "psci";
> +		};
> +	};
[ ... ]
> +	psci {
> +		compatible =3D "arm,psci-1.0";
> +		cpu_off =3D <0x84000002>;
> +		cpu_on =3D <0xc4000003>;
> +		cpu_suspend =3D <0xc4000001>;

[Severity: Low]
Are these custom function IDs necessary? Since compatible =3D "arm,psci-1.0"
is used, the kernel relies on standard architecturally mandated function
IDs, and explicitly defining cpu_off, cpu_on, and cpu_suspend will be ignor=
ed.

> +		method =3D "smc";
> +	};
[ ... ]
> +		gic: interrupt-controller@15600000 {

[Severity: Low]
Does the unit-address for the gic node match its reg property? The first
address in the reg block is 0x15601000, so should the node be named
interrupt-controller@15601000?

[Severity: Medium]
Is the interrupts property for the VGIC maintenance interrupt missing from
the gic device node? Without it, KVM virtualization cannot properly handle
virtual interrupt maintenance.

> +			compatible =3D "arm,gic-400";
> +			reg =3D <0x15601000 0x1000>,
> +			      <0x15602000 0x1000>,

[Severity: Medium]
Is the GICC memory region incorrectly sized at 0x1000? KVM VGIC
initialization requires access to the GICC_DIR register at offset 0x1000 in
the GICC region for EOI mode 1, so should this size be at least 0x2000?

> +			      <0x15604000 0x2000>,
> +			      <0x15606000 0x2000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-for-next-l=
ucky7-v1-0-42ffb2b71ba2@member.fsf.org?part=3D1

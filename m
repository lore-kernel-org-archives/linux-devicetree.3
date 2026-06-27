Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729C72EFDA6
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 17:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782579974; cv=none; b=JZqEZX4jNuKT6oYccnlKtQmHEM1FJvPTFkt9DtMJnKsIVR0Q1N2v+Bagyk1EFM8kRIgxNmxXp4MQHmCVTdJXM4U78Ev5z0tGsWqGRNLGpV1H30ahzAZYDkYzv/J9RadnUwBv3hbF+JEfI/y322L7n12phup5M+KpuT8hhHVdepY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782579974; c=relaxed/simple;
	bh=M9L7AXXhJgQLTz5NpAwi7LaclsewlY8QyWJg7WtnVi4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CIIfVjD01GGvaxurH5C53SduiGpXEKkor0Y1W9J+uAOrY+ZLUdA3T9d7NsYa/WfaRnNtlG0u5ixmAr5LQsYcUGnA2Il17/q56v4EozSeVSvWJJj967szyjdTD8K3Mpvlxcvl/pIJLxSrPy+iiBZXntZQ0eoos1KRM7k41k3SDOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4plowG3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4plowG3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDCFA1F000E9;
	Sat, 27 Jun 2026 17:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782579973;
	bh=kTlZBBiVMZn6SswD0xhgS1f2XNydaojBH23tbMcp6B8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m4plowG3qKHA8VDOCpneaTyGsvKlNo5xIyfSwMx72Mv0Jc56iy5UPzTKDUww5ldoW
	 Vmr6//yb2KbVBJX67Oj1eNJEpKcCmYD6LW2LXCNgrnVSC/APT7MuoOZuWugS4PVrFw
	 +3GDI+4i65MrpfjpilWS1y/ENy+y6t9Y8gDxUG73cwBfyGotEKjJxu2I5sBiwI/hnZ
	 O8YP0/l7nICFiDWXzPdVGAg9HrERp7peZAGJDPjc+Vn9kR5bbMjByZ7Us5PF712i4d
	 wxVOK8HpaWnyTzH28m+q6N+lYqvO0YIoosWUeAWflWTt10J2gkts7EGUn/wbjaC7MO
	 b6WuY3rrf1rEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/6] arm64: dts: exynos: add initial support for
 Samsung Exynos8855 smdk
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alim Akhtar" <alim.akhtar@samsung.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260627171228.2687857-6-alim.akhtar@samsung.com>
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
 <CGME20260627165422epcas5p4e4c6bce0e2daa6d08a9ec18afde9ce0e@epcas5p4.samsung.com>
 <20260627171228.2687857-6-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 27 Jun 2026 17:06:12 +0000
Message-Id: <20260627170612.BDCFA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The pinctrl_cmgp controller and its first child bank gpm0 both cla=
im the exact same GIC interrupt (SPI 114), and the driver configuration is =
fundamentally broken for CMGP interrupts.
- [Medium] The asymmetric big.LITTLE CPU topology (Cortex-A520 and Cortex-A=
720) is missing CPU capacity definitions.
--

commit 46c39da58bc865179bf89eb7be4c747cacdd7227
Author: Alim Akhtar <alim.akhtar@samsung.com>

arm64: dts: exynos: add initial support for Samsung Exynos8855 smdk

This commit adds initial devicetree support for the Samsung SMDK board using
the Exynos8855 SoC. The SoC features an Octa-core CPU with a tri-cluster
architecture, a custom GPU, and an NPU supporting up to 14.7 TOPS.

Link: https://semiconductor.samsung.com/processor/mobile-processor/exynos-1=
580/

> diff --git a/arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi b/arch/ar=
m64/boot/dts/exynos/exynos8855-pinctrl.dtsi
> new file mode 100644
> index 0000000000000..b65f1698cd74a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
[ ... ]
> +&pinctrl_cmgp {
> +	gpm0: gpm0-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;
> +		interrupt-parent =3D <&gic>;
> +		interrupts =3D <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
> +	};

[Severity: High]
Does this child bank gpm0 claim the exact same SPI 114 interrupt as its
parent pinctrl_cmgp node?

If the child explicitly requests SPI 114 here, it might create an IRQ
resource conflict with the parent.

[ ... ]
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot=
/dts/exynos/exynos8855.dtsi
> new file mode 100644
> index 0000000000000..9d82fceb5130a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
[ ... ]
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;

[Severity: Medium]
Will the Energy Aware Scheduler function properly without the
capacity-dmips-mhz property defined here for the asymmetric Cortex-A520 and
Cortex-A720 nodes?

Without this property and lacking OPP tables, the scheduler might assume a
symmetric topology, which could cause it to schedule heavy tasks on the
small A520 cores or background tasks on the big A720 cores.

[ ... ]
> +		pinctrl_cmgp: pinctrl@12030000 {
> +			compatible =3D "samsung,exynos8855-pinctrl";
> +			reg =3D <0x12030000 0x1000>;
> +			interrupts =3D <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
> +		};

[Severity: High]
Could claiming GIC_SPI 114 here in the parent node lead to initialization
failures for CMGP interrupts?

The Exynos driver configures CMGP to use exynos_eint_gpio_init, which
expects a single demultiplexed IRQ on the parent. However, the gpm banks
are Wakeup EINTs with direct per-bank GIC interrupts (like the SPI 114
requested by gpm0).

Because exynos_eint_gpio_init skips EINT_TYPE_WKUP banks, the parent
successfully claims SPI 114 for a non-functional demux handler, blocking
gpm0. Any peripheral attempting to map an interrupt from a CMGP bank might
fail to probe. Should this instead have a wakeup-interrupt-controller
child node without claiming a parent interrupt?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260627171228.2687=
857-1-alim.akhtar@samsung.com?part=3D5

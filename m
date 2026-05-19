Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8DF330652
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779191258; cv=none; b=ow5idugSvXjCOmLxS++MtbhC6HRYkImgAjdj1J3gNyy2PdqmAYakNTdb1qL6QlTP3hvL+JAnteVILBM8V/8YbG1ZZzDP+mCLuHYb6Qy5rn+GArMU6+gYxG1HTR0odR2hu2LtIWVSLBdGghYdQto21wPY0BHhz/reMkuynrQPN0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779191258; c=relaxed/simple;
	bh=edZUHM4oy/ZnaWenXyHT3ZSTtu52A/pGcuZ62FCM+n8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XVuCHGW4v0unlPqrxcpQL5oQOkp0z0zEDWik0FBAKdrR+r5iGMAURYFro9bTh7yIu/jP2rXevXXmDjC3h+fRXb/C2B9ReBA0APKCmcrj05RHWCCUaAzKRNlRyNSEUkcSVmiz0pPlJLG3NflQSbErd36ThtVvyAgCnNPwC/JX5PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnDhVVYX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnDhVVYX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CD0C2BCB3;
	Tue, 19 May 2026 11:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779191257;
	bh=edZUHM4oy/ZnaWenXyHT3ZSTtu52A/pGcuZ62FCM+n8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=cnDhVVYX2B/4xBARtG6J89RTM1E5ruIlMT5A/kOSV9hPHHL4suxJ/B6e1ztgE/OQt
	 m5b1avlSw0e3eVVwPLdfbBiWndTiIc84D+KVCzAKymONbqL4epYSiOZLlqOYGUTVnA
	 69b2M26Z7zbNFNgf6W1Szdt2EqSFGmKSLI/KLGyqD9rcGNWIeKDMksrCUdZIbFkhyt
	 qnI+nbyBj7oDDIBSNMXPUY0P6nKRqVmp/Aor/oyqrJx6cP+5JmYJluLxvWbFjP9BJg
	 HgfWTzMiG5O421WLdNfe9L/8ad+nE9ZLz+jbs2CxKX9mYHLNLtO71EB4J7ABaTLxvZ
	 ir1Ym0fD4lZSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: Introduce Shikra SoC base dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260519-shikra-dt-v2-2-c01b90fb4395@oss.qualcomm.com>
References: <20260519-shikra-dt-v2-2-c01b90fb4395@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:47:36 +0000
Message-Id: <20260519114737.70CD0C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] Incorrect PPI numbers are specified for the ARM architected ti=
mers and GIC maintenance interrupts.
- [High] The base memory node specifies an incorrect start address, obscuri=
ng 512MB of DDR system RAM and breaking reservations.
- [Medium] The `sdhc_1` node incorrectly references a power domain specific=
 to a different SoC.
- [Medium] The logical `cpu-map` splits CPUs into two clusters, contradicti=
ng physical MPIDR topology and shared cache.
- [Medium] The `usb_1` node is missing MPM-routed interrupts for USB 2.0 wa=
ke from deep sleep.
--

commit 32b9841bdefaa72fe3d5267070711875edaaafa0
Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

arm64: dts: qcom: Introduce Shikra SoC base dtsi

Add initial device tree support for the Qualcomm Shikra SoC, an
IoT-focused platform built around a heterogeneous CPU cluster
(Cortex-A55 + Cortex-A78C) with RPM-based power and clock management.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> new file mode 100644
> index 0000000000000..31d0126e5b3ee
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -0,0 +1,981 @@

[ ... ]

> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu =3D <&cpu0>;
> +				};
> +
> +				core1 {
> +					cpu =3D <&cpu1>;
> +				};
> +
> +				core2 {
> +					cpu =3D <&cpu2>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu =3D <&cpu3>;
> +				};
> +			};
> +		};

Is this logical topology misaligned with the physical MPIDR topology?

The CPU reg values (0x0, 0x100, 0x200, 0x300) have their Aff2 bits set to 0,
meaning they physically reside in the same cluster. The A55 cores and A78C
core also share the same L3 cache.

Does splitting cpu0-cpu2 into cluster0 and cpu3 into cluster1 violate
DynamIQ specifications and confuse the scheduler's task migration and
domains?

[ ... ]

> +	memory@a0000000 {
> +		device_type =3D "memory";
> +		/* We expect the bootloader to fill in the size */
> +		reg =3D <0x0 0xa0000000 0x0 0x0>;
> +	};

Is this base address correct?

The reserved-memory list allocates memory regions well below this address,
such as hyp@80000000 and smem@86000000.

Does starting the system RAM at 0xa0000000 cause the kernel to disregard the
0x80000000-0x9fffffff region, effectively losing 512MB of RAM and
potentially causing the reservations to fail?

[ ... ]

> +		sdhc_1: mmc@4744000 {
> +			compatible =3D "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
> +
> +			reg =3D <0x0 0x04744000 0x0 0x1000>,

[ ... ]

> +			interconnects =3D <&system_noc MASTER_SDCC_1 RPM_ALWAYS_TAG
> +					&mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
> +					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
> +					&config_noc SLAVE_SDCC_1 RPM_ACTIVE_TAG>;
> +			interconnect-names =3D "sdhc-ddr",
> +					     "cpu-sdhc";
> +
> +			power-domains =3D <&rpmpd QCM2290_VDDCX>;

Is this a copy-paste error?

The gcc node correctly uses the generic or Shikra-specific RPMPD_VDDCX.

Could referencing a QCM2290-specific power domain macro here result in the
hardware attempting to scale the wrong voltage domain or cause an
out-of-bounds array access in the driver?

[ ... ]

> +		usb_1: usb@4e00000 {
> +			compatible =3D "qcom,shikra-dwc3", "qcom,snps-dwc3";
> +			reg =3D <0x0 0x04e00000 0x0 0xfc100>;
> +
> +			clocks =3D <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,

[ ... ]

> +			interrupts-extended =3D <&intc GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH 0>,
> +					      <&intc GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH 0>,
> +					      <&intc GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH 0>,
> +					      <&intc GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH 0>,
> +					      <&mpm 12 IRQ_TYPE_LEVEL_HIGH>;

Is this missing MPM-routed interrupts for USB 2.0 wake from deep sleep?

The mpm node explicitly maps pins 90 and 91 for QUSB2_PHY DM and DP, but
usb_1 does not include them here.

Because the main GIC is powered down during deep sleep, will USB 2.0 devices
be incapable of waking the system from suspend without these interrupts?

[ ... ]

> +		intc: interrupt-controller@f200000 {
> +			compatible =3D "arm,gic-v3";
> +			reg =3D <0x0 0xf200000 0x0 0x10000>,
> +			      <0x0 0xf240000 0x0 0x80000>;
> +
> +			interrupts =3D <GIC_PPI 8 IRQ_TYPE_LEVEL_HIGH 0>;

Is this the correct PPI for the GIC maintenance interrupt?

The architecturally mandated GIC maintenance interrupt is PPI 9, rather than
PPI 8.

[ ... ]

> +	timer {
> +		compatible =3D "arm,armv8-timer";
> +
> +		interrupts =3D <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW 0>,
> +			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW 0>,
> +			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW 0>,
> +			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW 0>;
> +	};
> +};

Are these PPI numbers correct for the ARM architected timers?

The architecturally hardwired ARM core timer PPIs are 13 (Secure),
14 (Non-Secure), 11 (Virtual), and 10 (Hypervisor).

Could specifying these incorrect numbers prevent the kernel from receiving
timer ticks and cause the system to hang during boot?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-shikra-dt-=
v2-0-c01b90fb4395@oss.qualcomm.com?part=3D2

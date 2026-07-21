Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FF62BE7DD
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609417; cv=none; b=gNyTILcTl7tYflu51Mc6c+Od6d2GhLL/FRbsb4DRf3K2vr5KgIlrOrcdL5jN0R/ljs/JENT2A1czTH25sqlOJnEnCsFF1yHOkKyDr7grFNLT+Ff3Z6Q+UGtg3LXcNyNQT4LTKjbNgZZr/cO1bOR0mwiENaeqaBi0jPF5/SnEDeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609417; c=relaxed/simple;
	bh=jKJ/zfOg2QQUazCrfvANLQQryT0DlnZ769Hbus3bBj0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=swbSKeORztdNGuMgUXqQ2yhJGgnpFldtUMFjAXaSro33qMi97QVbSUoEFQaKLvLEerC0R4lhOm96NO5WMXEjfuLpYR5FIdQl1eH8y0/1l+ffkI6bp8oqyLSySp2ZjWHQYk3kk4MGmr7OjqWhr7YSP4dgYAUamWUASXUBkrus7pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NY3UCzED; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NY3UCzED"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF2A1F000E9;
	Tue, 21 Jul 2026 04:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784609415;
	bh=HorroWqFGx1ETennp6uVSTJG7OC5mZwppwo3cgqpLtI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NY3UCzEDdlSWzz6w5zrdjaUk8VA30CDWD0VmriyQd4unuZ11qyM72xTVBliCF5zSi
	 8FQ3+W6lyfPABfhBS16oJT5q3Hpx4VSqYUDBo8L+IJHrFd1DHdY4brlo5xoRLuLJXs
	 7CzXgPAdqoLgEOaYIF7y0qKPGb1fE1/Y6mPkhysqFVJytb4O6YuVFAN4uCeJ9QcSh6
	 EtEK7gASGI8djOSlB846Sr4TXsAMp2n9dhSd7DlK8l4X5SGRm3+OhZGYxN9QjHDMb1
	 QY8phYpVWPdqdMRexQ4nQWshAu3ozXZgtVeXZWEbxWuNqythyO/GqxEdNDboDUMwV1
	 1DBSE392EGtPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/6] arm64: dts: qcom: Add device tree for Nord
 Embedded variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721044005.2882803-4-shengchao.guo@oss.qualcomm.com>
References: <20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com>
 <20260721044005.2882803-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 04:50:15 +0000
Message-Id: <20260721045015.7AF2A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Copy-paste error in QUP0 SE1 pinmux definitions causes pin confl=
icts with QUP0 SE0.
- [Medium] Redundant and conflicting `required-opps` property on the `ufs_m=
em_hc` device node.
- [Low] Invalid OPP node names `opp2` and `opp3` in `rpmhpd_opp_table`.
--

--- Patch [3]: [PATCH v7 3/6] arm64: dts: qcom: Add device tree for Nord Em=
bedded variant ---
commit 117f55e166223f765ed4a271d49a9e24d8a3d432
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord Embedded variant

Unlike the GearVM variant, Nord Embedded variant has platform resources
(clocks, regulators, powerdomains, pins, etc.) directly controlled by
the operating system. Add a separate dtsi file extending the existing
top-level nord.dtsi with nodes representing these peripherals as well as
describing how they are wired up with the already defined components.

> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boo=
t/dts/qcom/nord-embedded.dtsi
> new file mode 100644
> index 0000000000000..032d384f6eb3e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi

[ ... ]

> +				rpmhpd_opp_min_svs: opp-1 {
> +					opp-level =3D <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +				};
> +
> +				rpmhpd_opp_low_svs: opp2 {
> +					opp-level =3D <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +				};
> +
> +				rpmhpd_opp_svs: opp3 {
> +					opp-level =3D <RPMH_REGULATOR_LEVEL_SVS>;
> +				};
> +
> +				rpmhpd_opp_svs_l1: opp-4 {
> +					opp-level =3D <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +				};

[Severity: Low]
This isn't a bug, but there's a missing hyphen in the node names for opp2
and opp3. Will this trigger a dtbs_check warning against the
operating-points-v2.yaml binding schema, which expects node names to match
the standard ^opp(-[0-9]+)?$ regex?

[ ... ]

> +&tlmm {
> +	qup_i2c0_default: qup-i2c0-default-state {
> +		pins =3D "gpio111", "gpio112";
> +		function =3D "qup0_se0";
> +		drive-strength =3D <2>;
> +		bias-pull-up;
> +	};
> +
> +	qup_i2c1_default: qup-i2c1-default-state {
> +		pins =3D "gpio111", "gpio112";
> +		function =3D "qup0_se1";
> +		drive-strength =3D <2>;
> +		bias-pull-up;
> +	};

[Severity: Medium]
Is this a copy-paste error? This assigns pins gpio111 and gpio112 to
qup_i2c1_default, which are the exact same pins assigned to qup_i2c0_default
just above it.=20

Could this cause a pinmux conflict between QUP0 SE0 and QUP0 SE1, breaking
hardware functionality for peripherals connected to SE1 if both are enabled?

[ ... ]

> +	qup_uart0_default: qup-uart0-default-state {
> +		pins =3D "gpio109", "gpio110";
> +		function =3D "qup0_se0";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};
> +
> +	qup_uart1_default: qup-uart1-default-state {
> +		pins =3D "gpio109", "gpio110";
> +		function =3D "qup0_se1";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};

[Severity: Medium]
Similarly here, qup_uart1_default is using pins gpio109 and gpio110,
identical to the assignments for qup_uart0_default. Should this be assigned
to a different set of pins to avoid a QUP0 SE0 / SE1 conflict?

[ ... ]

> +&ufs_mem_hc {
> +	clocks =3D <&negcc NE_GCC_UFS_PHY_AXI_CLK>,
> +		 <&negcc NE_GCC_AGGRE_NOC_UFS_PHY_AXI_CLK>,
> +		 <&negcc NE_GCC_UFS_PHY_AHB_CLK>,
> +		 <&negcc NE_GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> +		 <&tcsrcc TCSR_UFS_CLKREF_EN>,
> +		 <&negcc NE_GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> +		 <&negcc NE_GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
> +		 <&negcc NE_GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
> +	clock-names =3D "core_clk",
> +		      "bus_aggr_clk",
> +		      "iface_clk",
> +		      "core_clk_unipro",
> +		      "ref_clk",
> +		      "tx_lane0_sync_clk",
> +		      "rx_lane0_sync_clk",
> +		      "rx_lane1_sync_clk";
> +
> +	resets =3D <&negcc NE_GCC_UFS_PHY_BCR>;
> +	reset-names =3D "rst";
> +
> +	interconnects =3D <&aggre1_noc_tile MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
> +			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +			<&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +			 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> +	interconnect-names =3D "ufs-ddr",
> +			     "cpu-ufs";
> +
> +	phys =3D <&ufs_mem_phy>;
> +	phy-names =3D "ufsphy";
> +
> +	power-domains =3D <&negcc NE_GCC_UFS_PHY_GDSC>;
> +	operating-points-v2 =3D <&ufs_opp_table>;
> +	required-opps =3D <&rpmhpd_opp_nom>;
> +	qcom,ice =3D <&ice>;
> +	#reset-cells =3D <1>;

[Severity: Medium]
Does setting required-opps statically on the ufs_mem_hc node conflict with
the dynamic performance state votes requested by the ufs_opp_table?

The ufs_opp_table defines operating points that scale down to
rpmhpd_opp_low_svs, but a static device-level required-opps vote
establishes a permanent minimum floor at NOM upon attach.

Will this lock the power domain at the NOM level and prevent the dynamic
power scaling from working as intended?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721044005.2882=
803-1-shengchao.guo@oss.qualcomm.com?part=3D3

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416114B2CDE
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 14:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445187; cv=none; b=B/z4QwMaepRz0AFoUj6Wx+8dj70c2D1SqWdStW4KacXW6BPGx66CikKWF45VI5ai6pDddll38qwfB2DR5sobrxMC5d4t8GMdMEiklaOVR1bIHWwFF+0SJAG+4HV8hXmOkbhtVbhhtH68Nsi01LvfvnD+DwlgxnhSlBjbIPqK9Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445187; c=relaxed/simple;
	bh=m6+ZsbYyXZbH4ryHwx6n33EjJo0AWoi1K1iJYiclqpU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o7H3neM92+DrsJQe3m/pJ6HDiaprXIgEEcDvHYUZXG2bu41oBKvSHs4hpDmbcuRYhhf+qKXupTzAiJeZBHNerRkS1XFFbKMsLjUTe8Aq0pg7S7y4tKRtcrKrccPhpX3SMUXxy3ZhJC/ctkYfbjA4s7hWbTDQdUdGFAWDEH9uHrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fyjGKURY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fyjGKURY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2E91F00AC4;
	Thu,  3 Sep 2026 14:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788445179;
	bh=g6FydBnAPxw+eu9x2g8kW+H8Ex8xLcVdIPr91z366A4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fyjGKURYfU99/6Eo+9p/p0amsxTjLsM5JYFeGqXGqcuDEZcb/cFc934Npr8wRcjcd
	 PH/cN6OK5aFe+p5QA9tYF6EWHweLQOh7BWggAoCMIdfZCrMSPjUeUiITikr8aVhzFf
	 nkimdhBGbCyv3VyEY5q3W1wCR6vsJxy13elAvnf1txRXZzczADS+jcx5CKaRJx3k7L
	 WEIxIrglZJyLqgijkDht25jZ8DHbvwtBS36SczbKTIHL4aWsLLolkYYuw0onlmWpBI
	 ShJsl/3tln1iEgIoszuQdrM5JoeDMoYstefPDldY1a5F/jWAfa3Owf34HxPNIW/zS5
	 INauUq5svthiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 3/6] arm64: dts: qcom: Add device tree for Nord
 Embedded variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260903140617.441111-4-shengchao.guo@oss.qualcomm.com>
References: <20260903140617.441111-1-shengchao.guo@oss.qualcomm.com>
 <20260903140617.441111-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 14:19:38 +0000
Message-Id: <20260903141938.CD2E91F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Mismatch between `power-domains` and `required-opps` in `ufs_mem_h=
c`.
- [High] The UFS PHY clocks are not wired to the `negcc` clock controller, =
breaking the UFS clock hierarchy.
--

commit 7034c99626d2986e3ca10a97a1a9799d821d7a58
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

arm64: dts: qcom: Add device tree for Nord Embedded variant
   =20
Unlike the GearVM variant, Nord Embedded variant has platform resources
(clocks, regulators, powerdomains, pins, etc.) directly controlled by
the operating system. Add a separate dtsi file extending the existing
top-level nord.dtsi with nodes representing these peripherals as well as
describing how they are wired up with the already defined components.

> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boo=
t/dts/qcom/nord-embedded.dtsi
> new file mode 100644
> index 0000000000000..1a2f61a2c9522
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -0,0 +1,1820 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */

[ ... ]

> +	negcc: clock-controller@8900000 {
> +		compatible =3D "qcom,nord-negcc";
> +		reg =3D <0x0 0x08900000 0x0 0xf4200>;
> +		clocks =3D <&bi_tcxo_div2>,
> +			 <&sleep_clk>,
> +			 <0>,
> +			 <0>,
> +			 <0>,
> +			 <0>,
> +			 <0>;

[Severity: High]
Does this missing parent clock configuration break the UFS clock hierarchy?

The UFS probe routine acquires its symbol clocks (like NE_GCC_UFS_PHY_TX_SY=
MBOL_0_CLK)
from negcc. With these dummy <0> entries, the symbol clocks lack a source f=
rom the=20
UFS PHY (ufs_mem_phy), which will cause clk_get_rate() to return 0 and UFS=
=20
initialization to fail.

Could these be updated to reference the UFS PHY clocks instead?

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

[Severity: High]
Does this mix of a GDSC power domain and an RPMh performance state cause
frequency scaling failures during UFS probe?

The negcc clock controller that provides NE_GCC_UFS_PHY_GDSC does not appea=
r to
declare a parent power domain (like rpmhpd). Because of this, when dev_pm_o=
pp_set_opp()
is called, the OPP framework won't be able to translate or forward the rpmh=
pd_opp_nom
performance state, which will result in an error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903140617.4411=
11-1-shengchao.guo@oss.qualcomm.com?part=3D3

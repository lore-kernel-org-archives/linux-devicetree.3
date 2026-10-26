Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011878;
	b=MYUaf8i9zRgrJPIpdOvXZrExRUOH2YM9/xnTC6t6XGWDuImhN5hGX/fsGpLmDOIRhvP8
	 d6zCwROKNuiIlIDZLEMemJXlfYxy9PjB6XsudzvmFSi/mZ2DguYRwg+3LabDGe1IzNEDY
	 4jWHkvnAzf6JM1W0TNsvFzROrXzCNB21dPdX6AkgixUGTrQIgOBKh13BopYDmryl7XX8t
	 Yx+FxE84W1ubqir2cxQA5zhtXLaqDFNVRqWIeRla97tRdcgmzvbF7Oa+9d3QDFZouGG+P
	 Fh6CkNNphaBsN1K6KzRFSehtlIemeJvzCGjcjGfwODbMk6QGiu7HTnicL6VqIqFSZIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011878;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tltF2SuCaSeisXup2l5+o6rUHxfQNf/m/7mmr5H2TjA=;
	b=py1Z0xuZUMq04H0dV1IcO+8guJJUErMKqhsXX5l6H3VuaXdnX4Pn/NPNI4b+iabJzD4B
	 nZg/CdrIRfy7LhqtwOWkQn6xUFm+w/lCohn0mtbf83BHpKpkwKQk0ANacPQqajJ8847Ac
	 onkeSueQHTtuK5j+6vtPdJCNK89phctUTNlJlmxs6E4G7jWaF9IgT0x3BkGhjvBKVeP33
	 nnUI8FzjXfY3QxFSLBm2nu1MdQCKNHPGzMNzWi3AgeCbu8wJqGFH5CLHH/hX0g9YQyooJ
	 nry+DfrRxT5N4gAEuBU1FkAzIhZd8/DZ+bt3ZcGrHyx6lJULIYuAbdJhuhcqjNnv5Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WA+xbKSn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E09606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WA+xbKSn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736E71F01825;
	Mon, 26 Oct 2026 10:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793011877;
	bh=tltF2SuCaSeisXup2l5+o6rUHxfQNf/m/7mmr5H2TjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WA+xbKSnC/apPfocHnRNxD8ldH9D7iBR7Vkg8jYPC9BfPGLSFZek7X0lTGsO/9KI+
	 UYVuG60+pM8ZnM0XprUyrG/MJ6I2hklSeeFZDYMspTqBNHw1jSUQ6HC3oAoyCrPINJ
	 pLxccWxHuIzmVDwdfKYDACIc81I1YrUWfMm5zHlwJ0buvmRuYIsZ+tVMRZSUiYE7Sz
	 kcha2b0M+OFP5EPdPUGPnNzZIZQvBlXyUXEguHG7fXdVdb8+valMmCS49iZAV19PqA
	 r/oqVURG527Ggsoew9CMspfVpoJEiy39/4TkUVs9ax3y0OGyyyS+syS5GhZC76U884
	 509NFBh2jDW7g==
Message-ID: <sashiko-outbox-185019@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/9] arm64: dts: airoha: en7581: add CPU OPP and scaling
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026095727.31708-3-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
 <20261026095727.31708-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 10:51:17 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] cpufreq: airoha: positive return from dev_pm_domain_attach_list() =
mishandled
- [Medium] arm64: dts: airoha: en7581: zero opp-level in smcc_opp0 conflict=
s with genpd
--

commit ade97d9a263f63e320dd00b49d71387b254adb06
Author: Christian Marangi <ansuelsmth@gmail.com>

arm64: dts: airoha: en7581: add CPU OPP and scaling nodes

This commit adds the cpufreq node, CPU OPP tables, and CPU clock and power
domain references to arch/arm64/boot/dts/airoha/en7581.dtsi to enable CPU
frequency scaling on Airoha EN7581.

> diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts=
/airoha/en7581.dtsi
> index 83b30a340950f..c5a3350867410 100644
> --- a/arch/arm64/boot/dts/airoha/en7581.dtsi
> +++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
> @@ -74,8 +74,12 @@ cpu0: cpu@0 {
>  			device_type =3D "cpu";
>  			compatible =3D "arm,cortex-a53";
>  			reg =3D <0x0>;
> +			operating-points-v2 =3D <&cpu_opp_table>;
>  			enable-method =3D "psci";
> -			clock-frequency =3D <80000000>;
> +			clocks =3D <&cpufreq>;
> +			clock-names =3D "cpu";
> +			power-domains =3D <&cpufreq>;
> +			power-domain-names =3D "perf";
>  			next-level-cache =3D <&l2>;
>  		};

[Severity: High]
Does adding the cpu clock and perf power domain to cpu0 cause
airoha_cpufreq_probe() to fail and leak priv->pd_list on boot?

Prior to this change, airoha_cpufreq_probe() in
drivers/cpufreq/airoha-cpufreq.c returned early at dev_pm_opp_set_config()
with -ENOENT because cpu0 did not have the clock and power domain propertie=
s.
With these properties now present, probe reaches dev_pm_domain_attach_list(=
):

drivers/cpufreq/airoha-cpufreq.c:airoha_cpufreq_probe() {
	...
	/* Attach PM for OPP */
	ret =3D dev_pm_domain_attach_list(cpu_dev, &attach_data,
					&priv->pd_list);
	if (ret)
		goto clear_opp_config;
	...
}

In drivers/base/power/common.c, dev_pm_domain_attach_list() returns the
positive number of attached power domains on success:

drivers/base/power/common.c:dev_pm_domain_attach_list() {
	...
	pds->num_pds =3D num_pds;
	*list =3D pds;
	return num_pds;
}

When attaching the single perf domain succeeds, dev_pm_domain_attach_list()
returns 1. Because airoha_cpufreq_probe() checks if (ret) rather than
if (ret < 0), it treats the successful attach as an error, jumps to
clear_opp_config without calling dev_pm_domain_detach_list(priv->pd_list),
leaks priv->pd_list along with the virtual genpd device and device link, and
returns 1 from probe so cpufreq-dt is never registered.

[ ... ]

> @@ -115,6 +131,159 @@ l2: l2-cache {
>  		};
>  	};
> =20
> +	cpufreq: cpufreq {
> +		compatible =3D "airoha,en7581-cpufreq";
> +
> +		operating-points-v2 =3D <&cpu_smcc_opp_table>;
> +
> +		#power-domain-cells =3D <0>;
> +		#clock-cells =3D <0>;
> +	};
> +
> +	cpu_opp_table: opp-table {
> +		compatible =3D "operating-points-v2";
> +		opp-shared;
> +
> +		opp-500000000 {
> +			opp-hz =3D /bits/ 64 <500000000>;
> +			required-opps =3D <&smcc_opp0>;
> +		};

[ ... ]

> +	cpu_smcc_opp_table: opp-table-smcc {
> +		compatible =3D "operating-points-v2";
> +
> +		smcc_opp0: opp-0 {
> +			opp-level =3D <0>;
> +		};

[Severity: Medium]
Can setting opp-level =3D <0> in smcc_opp0 cause the first transition to
500 MHz (opp-500000000) to be silently skipped by the generic PM domain cor=
e?

In drivers/pmdomain/core.c, performance state 0 represents the initial
unconstrained state, and both gpd_data->performance_state and
genpd->performance_state are zero-initialized when the domain is registered
and attached.

If the CPU boots at a frequency above 500 MHz and the first cpufreq
transition targets opp-500000000, the call chain
dev_pm_opp_set_rate() -> _set_opp() -> _set_required_opps() ->
_set_opp_level() -> dev_pm_domain_set_performance_state() invokes
genpd_set_performance_state() with state =3D 0:

drivers/pmdomain/core.c:genpd_set_performance_state() {
	...
	prev_state =3D gpd_data->performance_state;
	if (prev_state =3D=3D state)
		return 0;
	...
}

Because prev_state is already 0 (and genpd->performance_state in
_genpd_set_performance_state() is also 0), genpd_set_performance_state()
returns 0 immediately without calling
airoha_cpu_pmdomain_set_performance_state() in
drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c, leaving the hardware at the
boot frequency while cpufreq and OPP record 500 MHz as active.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026095727.3170=
8-1-ansuelsmth@gmail.com?part=3D2

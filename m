Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E3F3C3F4C
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 14:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785420821; cv=none; b=SBSikS7X81OTA76D+d4ep7wBhXiYM4rc/DoaSVt49fa9/MyZF6HLF/ZRZx/o/kBC5SePkCn1dr6iZwIN0nlGEaPu61mHkRhpOkpFXHefD1Aon+/EjHw4oUZBL0wDgMmyt4BjcLW3g0FjMpS/LApKy+tVGJtiktchV5jhAYlz8yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785420821; c=relaxed/simple;
	bh=nmLetJqmRQz56qeG7CExVX5XcOQM646N8rwLYK9wIxo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PkAkL9t7v5IHUMb6xpvxpFKG12lK9bm6Ppa74cXupqJJNuHiVvlbwKYzNv6jkKAl/Ru6+hfjQ5YLLi0cIbfdUGe1DpYzl1t0HV03sjeS/etoXZZE4gBvCE/Dh+UoR30D/fnCYYwDmXbSso9CPLxn9DsQk7t37l8E/tyRLuAxPao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+TSJCJi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+TSJCJi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 680B81F000E9;
	Thu, 30 Jul 2026 14:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785420819;
	bh=I5GwpwZWmSMbLHVBAn1Wn6Dr/xQbgXHKS/lIG0Te5Sw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e+TSJCJithB42FTdeMYT8bRbWa7shv/AabqBDar7zKFvJo7s1PbaOZSI1/3jT+tko
	 SBXIIC3ai3B5kAOU4/Z4C56DTKrvTulpOjFhhLZrqQCFDgpKp+vD+5l/SULDgs0dtd
	 gDO5G0O8GpdlxbCjtsV9PwDM148XHIwbZc+KBB61A9GaHp86hoqh+dX1AlQCs9ZR2M
	 JPEhNF6M28tB3dP2wGpchkTzdU9FJRcIH5ly47qsdoB2bnSV4jz20unOQTNGzxHK8k
	 QowDxBkjWpBEPKWm/BAYHXG8OROt+ESzo97zsqR3GMtVc7hyhF/XDbwEB4HaKIG8gX
	 CNazamHR/WgmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] phy: qcom-snps-femto-v2: Add support for SA8255P
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mattijs Korpershoek" <mkorpershoek@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, neil.armstrong@linaro.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-phy-qcom-snps-femto-v2-8255-v1-2-8b8bf5105a68@kernel.org>
References: <20260730-phy-qcom-snps-femto-v2-8255-v1-0-8b8bf5105a68@kernel.org>
 <20260730-phy-qcom-snps-femto-v2-8255-v1-2-8b8bf5105a68@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 14:13:38 +0000
Message-Id: <20260730141339.680B81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect power domain enablement and teardown ordering in d3 <-->=
 d0 transitions.
- [Medium] The `sa8255p_snps_hs_phy` match data is defined as a scalar stru=
ct but iterated over as an array, risking out-of-bounds memory access.
--

--- Patch [2]: [PATCH 2/2] phy: qcom-snps-femto-v2: Add support for SA8255P=
 ---
commit 337a4b6fa46b42e255f6aa6b19e2b52e65e59f7d
Author: Sriram Dash <quic_sriramd@quicinc.com>

phy: qcom-snps-femto-v2: Add support for SA8255P

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power protocols.

> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/=
qualcomm/phy-qcom-snps-femto-v2.c
> index eb0b0f61d98e0..4a9bd3ae0e535 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c

[ ... ]

> @@ -136,8 +139,81 @@ struct qcom_snps_hsphy {
> +/* d3_to_d0 transition by turning on all the suppliers */
> +static int qcom_snps_d3_to_d0(struct qcom_snps_hsphy *hsphy)
> +{
> +	int ret;
> +
> +	if (!hsphy->pd_list)
> +		return 0;
> +
> +	ret =3D pm_runtime_resume_and_get(hsphy->pd_list->pd_devs[0]);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D pm_runtime_resume_and_get(hsphy->pd_list->pd_devs[1]);
> +	if (ret)
> +		pm_runtime_put_sync(hsphy->pd_list->pd_devs[0]);
> +
> +	return ret;
> +}

[Severity: High]
Does this resume the power domains in the correct order?

The commit message states that the power domain 'core' (pd_devs[1]) controls
the GDSC, and 'transfer' (pd_devs[0]) controls clocks and interconnects.
Resuming 'transfer' before 'core' means clocks are enabled without their
powering GDSC, which could cause bus hangs on Qualcomm SoCs.

Additionally, since state d1 has 'transfer' OFF and 'core' ON, shouldn't 'c=
ore'
always be enabled first and disabled last?

> +
> +/* d0_to_d3 transition by turning off all the suppliers */
> +static void qcom_snps_d0_to_d3(struct qcom_snps_hsphy *hsphy)
> +{
> +	if (!hsphy->pd_list)
> +		return;
> +
> +	pm_runtime_put_sync(hsphy->pd_list->pd_devs[1]);
> +	pm_runtime_put_sync(hsphy->pd_list->pd_devs[0]);
> +}

[Severity: High]
Should the 'transfer' domain (pd_devs[0]) be put before the 'core'
domain (pd_devs[1])?

Putting 'core' before 'transfer' disables the GDSC while the clocks are
still active.

[ ... ]

> @@ -316,6 +394,10 @@ static const struct override_param ls_fs_output_impe=
dance_sc7280[] =3D {
>  	{ 1310, 0 },
>  };
> =20
> +static const struct override_param_map sa8255p_snps_hs_phy =3D {
> +	.fw_managed =3D true,
> +};
> +

[Severity: Medium]
Will this scalar struct cause an out-of-bounds read in
qcom_snps_hsphy_read_override_param_seq()?

The match data is defined here as a single scalar struct, but
qcom_snps_hsphy_read_override_param_seq() casts the match data to an array =
and
iterates over it until cfg[i].prop_name !=3D NULL:

drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:qcom_snps_hsphy_read_override=
_param_seq() {
    ...
	cfg =3D of_device_get_match_data(dev);
	if (!cfg)
		return;

	for (i =3D 0; cfg[i].prop_name !=3D NULL; i++) {
    ...
}

Currently this terminates on the first iteration because the uninitialized
.prop_name field is implicitly NULL, but if a property is ever added to this
struct in the future, it will read past the end of the struct into adjacent
memory.

Should this be defined as an array with an empty sentinel element like the
other param maps?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-phy-qcom-s=
nps-femto-v2-8255-v1-0-8b8bf5105a68@kernel.org?part=3D2

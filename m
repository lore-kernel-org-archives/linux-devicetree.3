Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826662;
	b=IiuFp/rcPxkoFoVR+9s5nyAo1F4/TP25LYJGk2dutjoVrRc2DudQFhLE2r3YiNyZQCko
	 M6GvASwuyjEQeimbo1l6cBIqpKKMZM4uqR3j03ccsHMFlpZTkJuAE24y7fkwv9SvQ8cN4
	 2oer1LfzqVRqloAXUsFzxCZj7PCBQzHW8eBpi0WmODNBfkyTKQp6h/JKEsCOq9zzZQX5R
	 L6L2lcHeL0Q6VuDyAI/kKwfhuFo6/yQXM7V2m34YEVYIWrz/1Om7HVJd0Pyqgy5sCh2W4
	 Z3bmVnPOWzWh7cQMI48hz4btpfUbK3jsdK3y4fzJsBYUVsbrXAtLUf6C9aNFOQsvhLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826662;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VbkL8LQViZifO3xFhZOAP83LuW2URUVsFhAJbvn2DMw=;
	b=u1k9IibJlqWeWlYUW2gnEkzLsGNz4h/6q8ckU3mzoOhbczlDoNqMoqVb/zCQSODgdeRk
	 ed+YoST7LQwnGUxDMyvPbj0ONHTD6aHK5ipz40tz5nmABCL4V9Hgj8zCyJmE5RD7DrPa5
	 nfJBtrGkzz+84K07vEwm5MbKSIRyfdNwlhyEIGbv9NFMUjiTJp5ulRGxl8PintzSXyIbx
	 hYuVQxuzqciVvjjcypT/BEdyOV7lPswO57Z0rvjA+cj/Gp0Egi280r+RymPtY8JJ4h1qB
	 XaDPHy/rdL/Q/rkjCMGcIOQbUaE3NhP6B/uwIj7T1P8oT/usCzZ35w+6l+PZwrV4WRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WPJQihX0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2744606D81E
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 21:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WPJQihX0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2961F000C1;
	Wed,  4 Nov 2026 21:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793826661;
	bh=VbkL8LQViZifO3xFhZOAP83LuW2URUVsFhAJbvn2DMw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WPJQihX0tXtaKNrFS/WLLbPkmhIi3vy3mfACs9GNEmcn/K8l8xdib/AeHx/Q2Ex1I
	 82bD70+XLFKuqwfxVAPEkhcaITKNEAoal3IUK2plCh5z5VnxCpAUdbccZEeI6mahct
	 6FwZgF+PSeDHdmw1LaMndFRwYCzQ7grTvoq7B8zJar7guwKpeaofPJDFamsmeiKyZ3
	 o5MyUXY+6LEVmbjd/jskWkRbO0fDWpqF8q10zVOa7vr+kBDjlaaVXd6aH4Xbzypjgl
	 hHveG6gjpNKrlZQq90bGEW58mpKCHlMYYmajUsgiBel5no6qlhZtYm/9kHB8P5VP63
	 Ltt1IRFNLkaRQ==
Message-ID: <sashiko-outbox-198051@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] media: qcom: camss: Add support for SM8150
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Gigena" <mail@andrewgigena.dev>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261104-sm8150-v7-4-rc1-camss-v1-3-7a9534a9a22f@andrewgigena.dev>
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-3-7a9534a9a22f@andrewgigena.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 21:11:00 +0000
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
- [High] media: qcom: camss: vfe_lite0/1 clock rates ignored in vfe_set_clo=
ck_rates()
- [Medium] media: qcom: camss: vdda-phy and vdda-pll assigned to CSID inste=
ad of CSIPHY
--

commit aa7ed9591fa067f32f7175a9e60c6b9597ae38fa
Author: Andrew Gigena <mail@andrewgigena.dev>

media: qcom: camss: Add support for SM8150

This commit adds CAMSS platform support for the Qualcomm SM8150 SoC,
including four CSIPHY, four CSID, two VFE, and two VFE-Lite instances. It
adds CAMSS_8150 to the shared CSIPHY and VFE paths and defines the per-block
clocks, regulators, power domains, interrupts, and interconnects.

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a9..7035f5b333ff3 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1940,6 +1940,254 @@ static const struct resources_icc icc_res_sm6350[=
] =3D {
>  	},
>  };
> =20
> +static const struct camss_subdev_resources csiphy_res_sm8150[] =3D {
> +	/* CSIPHY0 */
> +	{
> +		.regulators =3D {},
> +		.clock =3D { "csiphy0", "csiphy0_timer" },

[ ... ]

> +static const struct camss_subdev_resources csid_res_sm8150[] =3D {
> +	/* CSID0 */
> +	{
> +		.regulators =3D {
> +			{ .supply =3D "vdda-phy", .init_load_uA =3D 0 },
> +			{ .supply =3D "vdda-pll", .init_load_uA =3D 0 }
> +		},

[Severity: Medium]
Should the vdda-phy and vdda-pll supplies be attached to csiphy_res_sm8150
instead of csid_res_sm8150 (similar to how commit 0567d0f1cc62 moved them
from CSID to CSIPHY for SM8250)?

When streaming starts via video_prepare_streaming() -> v4l2_pipeline_pm_get=
()
-> pipeline_pm_power(), media_graph_walk_next() pops upstream entities firs=
t,
invoking csiphy_set_power_legacy() on CSIPHY before csid_set_power() on CSI=
D:

drivers/media/platform/qcom/camss/camss-csiphy.c:csiphy_set_power_legacy() {
	...
		ret =3D regulator_bulk_enable(csiphy->num_supplies,
					    csiphy->supplies);
		if (ret < 0) {
			pm_runtime_put_sync(dev);
			return ret;
		}

		ret =3D camss_enable_clocks(csiphy->nclocks, csiphy->clock, dev);
		if (ret < 0) {
			regulator_bulk_disable(csiphy->num_supplies,
					       csiphy->supplies);
			pm_runtime_put_sync(dev);
			return ret;
		}

		enable_irq(csiphy->irq);

		csiphy_reset(csiphy);

		csiphy->res->hw_ops->hw_version_read(csiphy, dev);
	...
}

With csiphy_res_sm8150 leaving .regulators empty and csid_res_sm8150 holding
vdda-phy and vdda-pll, won't csiphy_set_power_legacy() enable the CSIPHY
clocks and access CSIPHY registers in csiphy_reset() and hw_version_read()
before the PHY regulators are enabled, and also power on the PHY regulators
unnecessarily when CSID is used standalone with its test pattern generator?

> +		.clock =3D { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_axi" },

[ ... ]

> +	/* CSID_LITE0 */
> +	{
> +		.regulators =3D {
> +			{ .supply =3D "vdda-phy", .init_load_uA =3D 0 },
> +			{ .supply =3D "vdda-pll", .init_load_uA =3D 0 }
> +		},
> +		.clock =3D { "vfe_lite0_csid", "vfe_lite0_cphy_rx", "vfe_lite0" },
> +		.clock_rate =3D { { 400000000, 480000000, 600000000 },
> +				{ 0 },
> +				{ 0 }, },

[ ... ]

> +static const struct camss_subdev_resources vfe_res_sm8150[] =3D {

[ ... ]

> +	/* VFE_LITE_0 */
> +	{
> +		.regulators =3D {},
> +		.clock =3D { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb", "camnoc_axi", "vf=
e_lite0" },
> +		.clock_rate =3D { { 0 },
> +				{ 0 },
> +				{ 19200000, 80000000},
> +				{ 19200000, 150000000, 266666667, 320000000, 400000000, 480000000 },
> +				{ 320000000, 400000000, 480000000, 600000000 }, },
> +		.reg =3D { "vfe_lite0" },
> +		.interrupt =3D { "vfe_lite0" },
> +		.vfe =3D {
> +			.is_lite =3D true,
> +			.line_num =3D 4,
> +			.hw_ops =3D &vfe_ops_170,
> +			.formats_rdi =3D &vfe_formats_rdi_845,
> +			.formats_pix =3D &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE_LITE_1 */
> +	{
> +		.regulators =3D {},
> +		.clock =3D { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb", "camnoc_axi", "vf=
e_lite1" },
> +		.clock_rate =3D { { 0 },
> +				{ 0 },
> +				{ 19200000, 80000000},
> +				{ 19200000, 150000000, 266666667, 320000000, 400000000, 480000000 },
> +				{ 320000000, 400000000, 480000000, 600000000 }, },

[Severity: High]
Will the clock rates for vfe_lite0 and vfe_lite1 (as well as cpas_ahb) ever
get configured on SM8150?

During probe, camss_init_subdevices() initializes each entry in
vfe_res_sm8150 with vfe->id set to the array index, so VFE_LITE_0 has
vfe->id =3D=3D 2 and VFE_LITE_1 has vfe->id =3D=3D 3.

When powering on a VFE instance, vfe_get() calls vfe_set_clock_rates() (or
vfe_check_clock_rates()), which only processes clocks matching
vfe_match_clock_names():

drivers/media/platform/qcom/camss/camss-vfe.c:vfe_match_clock_names() {
	char vfe_name[7]; /* vfeXXX\0 */
	char vfe_lite_name[12]; /* vfe_liteXXX\0 */

	snprintf(vfe_name, sizeof(vfe_name), "vfe%d", vfe->id);
	snprintf(vfe_lite_name, sizeof(vfe_lite_name), "vfe_lite%d", vfe->id);

	return (!strcmp(clock->name, vfe_name) ||
		!strcmp(clock->name, vfe_lite_name) ||
		!strcmp(clock->name, "vfe_lite") ||
		!strcmp(clock->name, "camnoc_axi") ||
		!strcmp(clock->name, "camnoc_rt_axi"));
}

For VFE_LITE_0 and VFE_LITE_1, vfe_lite_name evaluates to "vfe_lite2" and
"vfe_lite3", which do not match "vfe_lite0" or "vfe_lite1" (nor does
vfe_match_clock_names() match "cpas_ahb"). Since csid_res_sm8150 also sets
the clock_rate entry for "vfe_lite0" and "vfe_lite1" to 0, neither
csid_set_clock_rates() nor vfe_set_clock_rates() will set their rates,
leaving the VFE-Lite clocks at their 19.2 MHz boot frequency when streaming.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-sm8150-v7-=
4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev?part=3D3

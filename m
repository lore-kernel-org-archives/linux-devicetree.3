Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228903101D0
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 08:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534511; cv=none; b=NJb01KuCYRR2Bb3TEIHqfbKCN/kVyNgpVyoZwvD2x/hXqK7OX7wHTNTno88gIf2e9HmNjNK8P+F3wZfW1mDgANUI6hE0OQKTYol7eLKH4516XvNh5kyFAJ/hb7YMhwJ/9HjoMp8d95EArDOpPT4M9J4pPtbqj7BSSng08fl/Hu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534511; c=relaxed/simple;
	bh=AJd7dXjedglPZBJosK8gRUgqIZYpfPLu5BhGv6DUtgU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JpLCCR+OJ/rhaQN9hzLFfVjKHRzApkaOiPq7pqTUyCsrTkHHj3JTO46IsyHfGYx7bTY40PjfUtevtFCUJ7pvWN40ipy1zTR7EFi4YmS6YVSrjnG4/YTfrNuDhk8RvUjCBRQgSBBgHJz1xYOpADpBrOJzLrZxeaIB+NHEv++Fm04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ae3QGpgs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ae3QGpgs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551DB1F000FF;
	Fri,  9 Oct 2026 08:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791534509;
	bh=6WTvQFTMQb6XSy56A4WnVj0COY+gOWiviCd/X/rqekw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ae3QGpgsz+HOQ3v2xN5S174O4GpktY+v7zqGfeo6kPNN+Cb+1B08xAdQ7EcHM56hO
	 QPWK0SqNnzoEvikgAVQPQTv1WyoppmmvVN0eknCAJGLwkXA0XSAZl6+IY2RzKO816c
	 HbGS2CEulW7jMa8/p1avAWV/pPG3qjAcsCxsMZz0D6yae/eG1fUHhLIfcRtRrnGyCm
	 Q7p5gAGIab1RHJYPRx4Np52yYu26EJc8RMmfUNePKtnTvfKws3an6yG2QEJnlNMabJ
	 fhd4E3hy1l8EiEGQna3RtVzsDsGt2aIhvJFKUyHU0L0yhplSCrbG09FxosxTJJdAIf
	 CRoTLerXklGww==
Message-ID: <sashiko-outbox-165088@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] media: qcom: camss: Add support for X1P42100
 CAMSS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261009-purwa_camss-v5-3-58c13dc7c4d2@oss.qualcomm.com>
References: <20261009-purwa_camss-v5-0-58c13dc7c4d2@oss.qualcomm.com>
 <20261009-purwa_camss-v5-3-58c13dc7c4d2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 08:28:28 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] media: qcom: camss: CSID_LITE power on failure and incorrect VFE m=
apping due to 1:1 ID assumption
- [High] media: qcom: camss: NULL ptr deref in legacy init on malformed DT
- [High] media: qcom: camss: OOB array access due to missing DT port bounds=
 check
--

commit f107a0f6644c97e69bdf263cd7e5e868d13b9438
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

media: qcom: camss: Add support for X1P42100 CAMSS

Add CAMSS support for the Qualcomm X1P42100 (Purwa) SoC.

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a9..5f0e5cadc06d5 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -36,6 +36,13 @@
>  /* Top-level CAMSS version register */
>  #define CAMSS_HW_VERSION		0x0
> =20
> +/* CSIPHY resources for PHY API devices, only id and formats are needed =
*/
> +#define CAMSS_CSIPHY_RES_PHY_API(_id, _formats)		\
> +	.csiphy =3D {					\
> +		.id =3D (_id),				\
> +		.formats =3D (_formats),			\
> +	}

[Severity: High]
Does this macro leave the hw_ops pointer uninitialized?

If a device tree is malformed or lacks endpoints, camss_detect_legacy_phy()
will leave camss->legacy_phy as true. This causes camss_init_subdevices() to
use the legacy initialization path:

camss_init_subdevices()
    msm_csiphy_subdev_init_legacy()
        csiphy->res->hw_ops->init(csiphy);

Since this macro does not set hw_ops, will this result in a NULL pointer
dereference during driver probe when legacy_phy defaults to true?

[ ... ]

> +static const struct camss_subdev_resources csiphy_res_x1p42100[] =3D {
> +	/* CSIPHY0 */
> +	{
> +		CAMSS_CSIPHY_RES_PHY_API(0, &csiphy_formats_sdm845),
> +	},
> +	/* CSIPHY4 */
> +	{
> +		CAMSS_CSIPHY_RES_PHY_API(4, &csiphy_formats_sdm845),
> +	},
> +};

[Severity: High]
Can a device tree mapping for CSIPHY4 cause an out-of-bounds array access?

camss_parse_endpoint_node() assigns the device tree port endpoint directly =
to
csd->interface.csiphy_id without checking bounds:

    csd->interface.csiphy_id =3D vep.base.port;

Later, camss_subdev_notifier_bound() uses this unvalidated ID to index the
dynamically allocated camss->csiphy array:

    u8 id =3D csd->interface.csiphy_id;
    struct csiphy_device *csiphy =3D &camss->csiphy[id];

Since the X1P42100 SoC has a csiphy_num of 2, mapping CSIPHY4 to port@4 in =
the
device tree would cause an out-of-bounds access at camss->csiphy[4] during
device probe.

[ ... ]

> +	/* CSID_LITE0 */
> +	{
> +		.regulators =3D {},
> +		.clock =3D { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
> +			   "csid", "csid_csiphy_rx" },
> +		.clock_rate =3D { { 0 },
> +				{ 64000000, 80000000 },
> +				{ 80000000,  100000000, 200000000,
> +				  300000000, 400000000 },
> +				{ 300000000, 400000000, 480000000 },
> +				{ 300000000, 400000000, 480000000 }, },
> +		.reg =3D { "csid_lite0" },
> +		.interrupt =3D { "csid_lite0" },
> +		.csid =3D {
> +			.is_lite =3D true,
> +			.hw_ops =3D &csid_ops_680,
> +			.parent_dev_ops =3D &vfe_parent_dev_ops,

[Severity: High]
Will CSID_LITE0 fail to power on because its ID is too high?

When powering on a CSID, csid_set_power() calls:
    csid->res->parent_dev_ops->get(camss, csid->id);

For vfe_parent_dev_ops_get(), it checks if the ID is strictly less than
camss->res->vfe_num. The vfe_num for X1P42100 is 3, but CSID_LITE0 has an ID
of 3, and CSID_LITE1 has an ID of 4.

Since 3 < 3 and 4 < 3 are false, vfe_parent_dev_ops_get() will return -EINV=
AL.
Additionally, this direct 1:1 index mapping seems to incorrectly pair CSID1
and CSID2 with IFE_LITE_0 and IFE_LITE_1 instead of full IFEs.

> +			.formats =3D &csid_formats_gen2
> +		}
> +	},

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-purwa_cams=
s-v5-0-58c13dc7c4d2@oss.qualcomm.com?part=3D3

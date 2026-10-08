Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE4C475330
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 08:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449320; cv=none; b=AtjxzvUo5U8BSH41KeuALAvKO7CMayb4C1Bw6nD+wVv4+N3ijDiZtvCzRV7vumGAM47OINNwMOBh+9H8lIyQzwyq2oSYj9x9JYWgM7Fgrzm0RqOtPzDGAHAE0xT2+IUEVjqyqCqcYKfhZ65M2qMYtn766Yv3aesFqpRzGIVBbuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449320; c=relaxed/simple;
	bh=hWFbNMJjwL4k972CFZEuep/ioh5vPJezbEMEDz6EiKk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=MILMJv+vVlRp2Gbl1qMSY/Fde4XiYLIcuSSoqj/k8eQrRLDxSShZt3RSqx5iAgMbPsHKUfqkWCMfr7e1dMaRcvlO2AjKB9F97++HGAkxxrE3fsNarap2ySO7dA+VI3Ms3LlOIGz2v+57kyxXk6/tgDZwA+LNmZGeb46amAeV7d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iY7ntKtM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iY7ntKtM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FD41F000FF;
	Thu,  8 Oct 2026 08:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791449318;
	bh=Eg4ja9Is1/Zi4P3CbxEyasncP9EgIeifMlUMSe7kttk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iY7ntKtMRI3/Zn3ZrDT9Olw2zEDSmui7pVMjj+qRc9EK5WpKHQFVR1nirehwyJ8aK
	 dojlVMbAoSsYFy/0uJLaKLmEyG4vWT/3CY05RIUzKUjX/Ya2LAv4zc1gOLOFtDMBb1
	 ZWbsQDnHOP9PPnGTQs4L013ywgAAikH8R3ldPqTKgN2wC7aLHvQz/+YQEEOHWsbtpP
	 oLIcpwPKDN88PHaqJFytvcM8kwUhzNkR3hwBOcrXcrNOJbDTbLy6jgBAU2qvoYBhHq
	 SGH0Gr/ZnzZiYDxOFPibRpVlgSZwznlCVD6e5xn5GYxScDMziG1ML4PH0kB1XtHTS0
	 9WQtreEbpkPWA==
Message-ID: <sashiko-outbox-163854@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] media: qcom: camss: Add support for X1P42100
 CAMSS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261008-purwa_camss-v4-3-bcf11bf2c650@oss.qualcomm.com>
References: <20261008-purwa_camss-v4-0-bcf11bf2c650@oss.qualcomm.com>
 <20261008-purwa_camss-v4-3-bcf11bf2c650@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 08:48:37 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] media: camss: mismatched CSID to VFE indices break power on
- [High] media: camss: null dereference during probe with malformed DT on X=
1P42100
- [High] media: camss: missing bounds check on DT port number leads to OOB =
write
--

commit ab38e0eb97dc4d60c438b6b2e2fd2590708e04a4
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

media: qcom: camss: Add support for X1P42100 CAMSS

This commit adds CAMSS support for the Qualcomm X1P42100 (Purwa) SoC.
It defines the X1P42100 hardware configuration, reusing existing CSID/VFE o=
ps
while omitting unused components like CSIPHY1-3 and one IFE.

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a9..7bc6b2e61438d 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4452,6 +4452,205 @@ static const struct resources_wrapper csid_wrappe=
r_res_x1e80100 =3D {
>  	.reg =3D "csid_wrapper",
>  };
> =20
> +static const struct camss_subdev_resources csiphy_res_x1p42100[] =3D {
> +	/* CSIPHY0 */
> +	{
> +		.csiphy =3D {
> +			.id =3D 0,
> +			.hw_ops =3D &csiphy_ops_3ph_1_0,
> +			.formats =3D &csiphy_formats_sdm845
> +		},
> +	},

[Severity: High]
If camss_detect_legacy_phy() falls back to legacy_phy =3D true due to a
malformed device tree without a phy remote endpoint, camss_init_subdevices()
invokes msm_csiphy_subdev_init_legacy().

That function attempts to map memory using res->reg[0], but since this
structure does not define .reg, it passes a NULL pointer to
platform_get_resource_byname() which then crashes in strcmp().

Additionally, csiphy_init() lacks a case for CAMSS_X1P42100, which leaves
regs->lane_regs uninitialized in this fallback path.

Will this cause a NULL pointer dereference during driver probe?

> +	/* CSIPHY4 */
> +	{
> +		.csiphy =3D {
> +			.id =3D 4,
> +			.hw_ops =3D &csiphy_ops_3ph_1_0,
> +			.formats =3D &csiphy_formats_sdm845
> +		},
> +	},
> +};

[Severity: High]
When parsing endpoints from the device tree, camss_parse_endpoint_node()
assigns the device tree port number directly to csd->interface.csiphy_id
without bounds checking against csiphy_num.

If port 4 is used in the device tree to match this hardware ID, csiphy_id
becomes 4. Later, camss_subdev_notifier_bound() uses this unvalidated id
to index into the camss->csiphy array.

Since that array only has 2 elements allocated for X1P42100, could defining
this with id 4 lead to an out-of-bounds memory overwrite during subdevice
binding?

[ ... ]

> +static const struct camss_resources x1p42100_resources =3D {
> +	.version =3D CAMSS_X1P42100,
> +	.pd_name =3D "top",
> +	.csiphy_res =3D csiphy_res_x1p42100,
> +	.tpg_res =3D tpg_res_x1e80100,
> +	.csid_res =3D csid_res_x1p42100,
> +	.vfe_res =3D vfe_res_x1p42100,
> +	.csid_wrapper_res =3D &csid_wrapper_res_x1e80100,
> +	.icc_res =3D icc_res_x1p42100,
> +	.icc_path_num =3D ARRAY_SIZE(icc_res_x1p42100),
> +	.csiphy_num =3D ARRAY_SIZE(csiphy_res_x1p42100),
> +	.tpg_num =3D ARRAY_SIZE(tpg_res_x1e80100),
> +	.csid_num =3D ARRAY_SIZE(csid_res_x1p42100),
> +	.vfe_num =3D ARRAY_SIZE(vfe_res_x1p42100),
> +};

[Severity: High]
During initialization, csid->id is assigned the index from the resource
array (0 to 4). When csid_set_power() attempts to power on its paired VFE
using its own ID, it calls vfe_parent_dev_ops_get() which checks
if id < camss->res->vfe_num.

For IDs 3 and 4 (CSID_LITE0 and CSID_LITE1), this bounds check fails and
unconditionally returns -EINVAL, aborting the power-up.

Additionally, this 1:1 index pairing appears to cause CSID1 and CSID2 to
incorrectly power up IFE_LITE_0 and IFE_LITE_1 instead of their expected
components.

Does the mismatch between the number of CSIDs (5) and VFEs (3) break the
power-on sequence for the CSID blocks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-purwa_cams=
s-v4-0-bcf11bf2c650@oss.qualcomm.com?part=3D3

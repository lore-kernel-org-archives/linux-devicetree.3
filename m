Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101610;
	b=A7fTNk4TzVJNvA0zqQLvPQOqW2/EG96vl1q9KMDfU05ZLSCs1VAAx8LKRRTnZnEb+IgB
	 XxLY/xueP1YxEewDfWawR/DZZc3Tu7TkrgzjNp810F6khJlvA12w6MieUoofI+8yC7//S
	 Ej8nyKIUfj2lFYKGgVn1GFtg/5EjCkbMwgCZ7HoLcrxhNGZolNMGtbeS76GSQnHJeigbI
	 FD7khR7UtW1+ogkmylDxzrjnd4hoc38VXUXk9MdFPCnZzwqcDuCzH7aiSx3xsKeSd8tl8
	 8/vhe3BdJ143wDFV+YrjR/RY3gaidL1wjoOE6vgXaKeAg+nEYNO5HstH5ZJfBsBuObQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101610;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NkgE7T3zZmQKYks2o2nlFeIFHCdWwShbAZZuiVBktsc=;
	b=hwi3QCKJAELtwc+fr3CIsNMQkDHdk0CPP2aTOB3SAOmDeRAOimTABVTZsG1trcrauana
	 YyhR8QBasLWTTmon35z7nAjg6anFb6hsXAilWHirNu//NB0LlGBs6xXBSXOjrYAS8di4H
	 XtHOrDpX98TnZKsSXtSsAu/YRBNz9NB5ofGs8OCucngqUralXD9y3+5HKR8mTvjHgzA3o
	 /dG0arPVZR5nHaRuRzTDcIlVP4OA66ZJZ1gbCPNRsJ0Bsh6x0ETkdlThwIumQA06an1zC
	 tZD/5uNb9d0ZhZCZxNSzmi9BplBIzFDTmwiq+CqFa5rx0rLKPb7q8ewk2gfwxpz0PLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fDgPHC/g";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE83606A330
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fDgPHC/g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69731F000C4;
	Thu, 19 Nov 2026 15:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795101610;
	bh=NkgE7T3zZmQKYks2o2nlFeIFHCdWwShbAZZuiVBktsc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fDgPHC/gLx38YmcPFzqcHKHPTo7jtMgLV52L0kvucb0ZfTgT2SrnVizuwretg0kqH
	 ZvwoaxPBMphwy5po6/i3CsT2K6QeWf715AW5qnNIQDr21nCYsM4Ft8BJ3eYaK3WtKW
	 g6UYzhXB1xI2EQ8tX7RSBkSedBBN+BA8QL91y1UYmzZ2yVe3cTIUe1bkUBOPg2bBxn
	 IIsdlY56RzG5WvdlDdNrU4McglqqD80XQuy2neBk0E5Ml/BNKbJSoOQU5HW82zY9ub
	 mAIKB2OBiTxAm70LUPd6UWFKy2SoU9ZRSHT2nxvKWjb3QCs/fZHT9ND9nsKExiHIFJ
	 IWjXhJyfAWE2A==
Message-ID: <sashiko-outbox-223366@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Add Glymur-specific
 resources
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nihal Kumar Gupta" <nihal.gupta@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
 <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 15:20:09 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] media: qcom: camss: NULL deref in
  msm_csiphy_subdev_init_legacy() on Glymur
--

commit d70c41f9364c13281ae9244b3389299002ad38d7
Author: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

media: qcom: camss: Add Glymur-specific resources

This commit adds Glymur-specific CSIPHY and CAMSS resources so that ports
0, 1 and 2 map to hardware PHY IDs 0, 1 and 4 while reusing X1E80100
resources for the remaining blocks.

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index f8e5cf9f3ff09..f3cab9ecef042 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4103,6 +4103,30 @@ static const struct resources_icc icc_res_sa8775p[=
] =3D {
>  	},
>  };
> =20
> +static const struct camss_subdev_resources csiphy_res_glymur[] =3D {
> +	/* CSIPHY0 */
> +	{
> +		.csiphy =3D {
> +			.id =3D 0,
> +			.formats =3D &csiphy_formats_sdm845
> +		},
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.csiphy =3D {
> +			.id =3D 1,
> +			.formats =3D &csiphy_formats_sdm845
> +		},
> +	},
> +	/* CSIPHY4 */
> +	{
> +		.csiphy =3D {
> +			.id =3D 4,
> +			.formats =3D &csiphy_formats_sdm845
> +		},
> +	},
> +};

[Severity: High]
Can probing qcom,glymur-camss trigger a NULL pointer dereference in
msm_csiphy_subdev_init_legacy() when no CSI2 PHY remote-endpoint is
connected in Device Tree?

csiphy_res_glymur leaves .csiphy.hw_ops NULL.  In camss_init_subdevices(),
camss_detect_legacy_phy() defaults camss->legacy_phy to true and only sets
it to false if it finds an endpoint with a remote port parent named "phy":

drivers/media/platform/qcom/camss/camss.c:camss_detect_legacy_phy() {
	camss->legacy_phy =3D true;

	/* Find first remote-endpoint and determine if its a PHY */
	for_each_endpoint_of_node(camss->dev->of_node, ep) {
		remote =3D of_graph_get_remote_port_parent(ep);
		if (!remote)
			continue;

		camss->legacy_phy =3D !of_node_name_eq(remote, "phy");
		of_node_put(remote);
		of_node_put(ep);
		break;
	}
}

Because endpoints under ports are optional (for example when using only
the internal TPGs or before board endpoints are wired up),
camss->legacy_phy remains true when none are present.
camss_init_subdevices() then calls msm_csiphy_subdev_init_legacy(), which
unconditionally calls csiphy->res->hw_ops->init(csiphy).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-glymur_cam=
ss-v3-0-71ab966c41c9@oss.qualcomm.com?part=3D2

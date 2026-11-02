Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609905;
	b=qqVyOhewLJIjywjKkYigk0ZORGQSt47jZpMj0gSCR3kRMN84hx74if8BQxQjA0N2qISA
	 pSoYD1ns49ne68Vej3b3VSLlWr3UYJAbd7YLQ1Kpbd+aDtR0qo4ptgeIiSvOILGW9/BgG
	 qlZ5XfNSShUbHhVukZX41O5MeFumaHI5akRSDJCldT/GaqITe5U56bGOMC7rsaypM634s
	 WCDYNwH/qVg/Eo4J6ul9e3FWuY0p0BgR9FJC3tO7VIWzQx81F2W8yR5ExnFnnfzXGfbAy
	 bWkTqlAoY+S3Rgiwly1t2/AaRt3dV4ZKWtnstkBQJLi+53/3yw8yJUVpmkcAO52mF7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609905;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9x2p6ruC9LeX5eLFS5yeCbqC4eCLLOjHubYyZBomDPg=;
	b=V8em9Xqp9UsPtVk5XljruO4mk+R1zDUlKvw4iJyzO+ZZqCWOVeUnklF9RtBYDUY/E11U
	 Y8RJWTdXU5lwR5A8TuGKYs4lIm+movuMagYHUGz2Lo7Ejnm8uqpD/RcEXNwDp22M2p7uT
	 0Pm6cnjazFB7HwHdMWAncszk9jP5AhkIrd2tDnOwFMY+8cLjCbvADCt0Z+rKSlC5UZ++i
	 MeFOQHUVrLOqHLOSy/Xw42Oz6ZAG+iwJRW+ieUL+xrrg0WtX4LeVfnKxxACbR7OTTXOA6
	 3GMVSgyrJlF1llSUSSUhYzYDv6+PThVt5UzcwgYy+XJixU/QFJvq0mya4jaMFjcdbeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZyQcL0yA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD83606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 08:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZyQcL0yA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686F11F000C1;
	Mon,  2 Nov 2026 08:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793609904;
	bh=9x2p6ruC9LeX5eLFS5yeCbqC4eCLLOjHubYyZBomDPg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZyQcL0yA/ppttU+W0Vv0XjBGUtPtiYgjSLtuEWPs7M3EGhYymUjXb+krPj2iWyLp8
	 5E+AfCWGgTMQnI+aLuv0vhHactJitbW0vimxApjdh3JV95fk8jnPZYCCFkQsyEbzxm
	 pfugON2yGC1ngKUFUtoPfk4KWOINk+vt3ZHJHN0nO4Bb1hDz4qSEnZDs5fpyHSJMJd
	 huiA5Bpg104hz00ZzQQwGQUX2cgH9mjJFJuu5ETmSmjoDeIFNCLLUuo9RB07Z1gcwF
	 38ryhPUROiAfduBVlBMbXFgx7vvIlSIS07ZYpoIfSnZWvXus5u9oZtwweLL6qrBa4C
	 202xQ3DM+q+nQ==
Message-ID: <sashiko-outbox-193144@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] media: qcom: camss: Add Glymur specific resources
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nihal Kumar Gupta" <nihal.gupta@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261102-glymur_camss-v1-2-fcb619fc7319@oss.qualcomm.com>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-2-fcb619fc7319@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 08:58:23 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: qcom: camss: NULL dereference from missing csiphy_res in gl=
ymur_resources
--

commit 8950cd65e1bb42630c5e3d1c122c6f357c2b384e
Author: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

media: qcom: camss: Add Glymur specific resources

This commit adds a dedicated camss_resources table for Glymur so that its
standalone CSI2 PHYs do not reuse the X1E80100 CSIPHY resource table.

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a9..72541ce3a632e 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5576,6 +5576,21 @@ static void camss_remove(struct platform_device *p=
dev)
>  	camss_genpd_cleanup(camss);
>  }
> =20
> +static const struct camss_resources glymur_resources =3D {
> +	.version =3D CAMSS_X1E80100,
> +	.pd_name =3D "top",
> +	.tpg_res =3D tpg_res_x1e80100,
> +	.csid_res =3D csid_res_x1e80100,
> +	.vfe_res =3D vfe_res_x1e80100,
> +	.csid_wrapper_res =3D &csid_wrapper_res_x1e80100,
> +	.icc_res =3D icc_res_x1e80100,
> +	.icc_path_num =3D ARRAY_SIZE(icc_res_x1e80100),
> +	.csiphy_num =3D 5,
> +	.tpg_num =3D ARRAY_SIZE(tpg_res_x1e80100),
> +	.csid_num =3D ARRAY_SIZE(csid_res_x1e80100),
> +	.vfe_num =3D ARRAY_SIZE(vfe_res_x1e80100),
> +};

[Severity: High]
Does leaving csiphy_res as NULL while setting csiphy_num =3D 5 cause a NULL
pointer dereference when probing qcom,glymur-camss?

In the standalone PHY path, camss_probe() -> camss_init_subdevices() calls
msm_csiphy_subdev_init(camss, i) for each port, which indexes
camss->res->csiphy_res and dereferences res->csiphy.id:

drivers/media/platform/qcom/camss/camss-csiphy.c:msm_csiphy_subdev_init() {
	const struct camss_subdev_resources *res =3D &camss->res->csiphy_res[port];
	...
	csiphy->camss =3D camss;
	csiphy->id =3D res->csiphy.id;
	csiphy->res =3D &res->csiphy;
}

Even if msm_csiphy_subdev_init() failed early (for example with
-EPROBE_DEFER from devm_phy_get_by_of_node()), or if no remote PHY
endpoints are enabled and camss_detect_legacy_phy() leaves
camss->legacy_phy as true, camss_init_subdevices() also dereferences
res->csiphy_res[i].csiphy.id:

drivers/media/platform/qcom/camss/camss.c:camss_init_subdevices() {
		if (camss->legacy_phy)
			ret =3D msm_csiphy_subdev_init_legacy(camss, &camss->csiphy[i],
							    &res->csiphy_res[i],
							    res->csiphy_res[i].csiphy.id);
		else
			ret =3D msm_csiphy_subdev_init(camss, i);
		if (ret < 0) {
			dev_err(camss->dev, "csiphy %d init fail\n",
				res->csiphy_res[i].csiphy.id);
			return ret;
		}
}

Furthermore, the standalone PHY subdev operations in
drivers/media/platform/qcom/camss/camss-csiphy.c (via
msm_csiphy_register_entity() -> csiphy_init_formats() ->
csiphy_set_format() -> csiphy_try_format(), as well as
csiphy_enum_mbus_code() and csiphy_stream_on()) unconditionally dereference
csiphy->res->formats:

drivers/media/platform/qcom/camss/camss-csiphy.c:csiphy_stream_on() {
	u8 bpp =3D csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->form=
ats->nformats,
				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
}

Should glymur_resources provide a csiphy_res table (or should the CSIPHY
init and format paths handle a NULL csiphy_res) so this doesn't crash at
probe or runtime?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-glymur_cam=
ss-v1-0-fcb619fc7319@oss.qualcomm.com?part=3D2

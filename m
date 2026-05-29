Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948243E5EFE
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 15:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780068800; cv=none; b=fjwfc/7bUEmK7n8ggE5CDTzY7N8qZRmWOE5kNXZeubaxL/moeFl9eF2Yyiz9gSQOa3oLXaogcRtHCLuynJs9y15trRjiZW+oXz19cOLBc1/jcuP2l48s0LkVnFmGr2pvWdkDxlvFvIlxosWDWZJgAIEJ0jdaPpyeO63m4zEQJ8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780068800; c=relaxed/simple;
	bh=DOH+3g7w+KmlfDTsjLjiuMu/Fxk6iqxGULdvT+bBH5g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XUqy4Sbvqzy0DDsggWoogkDLvJrPvD6VDhqthzeWZEcSbVUaz+j3knYziPyOS7beH7k//NwnJ2d/S2E9YtRNh2s5PWY5wEZt0BiZccGto80fMlUvtFWu4v+p2ZeJWJRib0mMpLOzqunxZx/Wjtfs2iW4zsnI3KK6GMlztWsJTDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2Q12tkt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2Q12tkt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114FF1F00893;
	Fri, 29 May 2026 15:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780068799;
	bh=sCTB6lhHJrDoYEUN4ycP4vcjGGxoWiAPdnW/TIo6ytc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D2Q12tktcFP7g5aayzYSoM6cZeTfm3hIHTyc5BYtidtmUBqhbwfvLVABqKFP69I1i
	 6mw7q50yUDoFGpGsyIP8jbs4ojikwFnfGNlAP59Kq+nMJELd1S3i2YjaEeDOxkyz3n
	 i15y4xn3wa31FwkKMRVJ9uLhoq/93ozbWhrWq2hBPaJm2LEMhIzTX/fPgJmOueBIcf
	 NPifzQRwl0rv9l2f8YhSklVbK+flmpLAQaYO6BilGb0DAFyMqaUjZ+Mntqxq7ghQ4S
	 zN0SBiVrx+gApZad4OC/fn0GnTDO5aTTsDARZ5RJw8EMf+vPRYcEEzgaa4uiuUuLVH
	 N4M5RrLxGrCtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] media: qcom: camss: Add Glymur compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikram Sharma" <vikram.sharma@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260529-glymur_camss-v1-3-bee535396d22@oss.qualcomm.com>
References: <20260529-glymur_camss-v1-3-bee535396d22@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 15:33:18 +0000
Message-Id: <20260529153319.114FF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing bounds check for device tree endpoint port number against =
`camss->res->csiphy_num` leads to out-of-bounds array access and memory cor=
ruption.
--

commit f84037afd7728553fdb93e0bd472a151b8696e13
Author: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
   =20
media: qcom: camss: Add Glymur compatible
   =20
This commit adds the CAMSS_GLYMUR enum, the Glymur compatible string, and
the initial private data structure for the Glymur camss driver. The
resources will be populated in subsequent commits.
   =20
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5507,6 +5507,11 @@ static void camss_remove(struct platform_device *p=
dev)
>  	camss_genpd_cleanup(camss);
>  }
> =20
> +static const struct camss_resources glymur_resources =3D {
> +	.version =3D CAMSS_GLYMUR,
> +	.pd_name =3D "top",
> +};

[Severity: High]
This isn't a bug introduced by this patch, but is a pre-existing issue
affecting all supported SoCs.

In camss_parse_endpoint_node(), the device tree endpoint port number
(vep.base.port) is assigned to csd->interface.csiphy_id without verifying
if it is strictly less than camss->res->csiphy_num.

Later, when the external subdevice is bound, camss_subdev_notifier_bound()
uses this unchecked id to directly index the dynamically allocated
camss->csiphy array:

camss_subdev_notifier_bound() {
    ...
    struct camss_csiphy_device *csiphy =3D &camss->csiphy[id];
    ...
    csiphy->cfg.csi2 =3D &csd->interface.csi2;
    ...
}

If a device tree (including runtime DT overlays) defines an endpoint with an
abnormally high port number, could this unconditionally result in an
out-of-bounds write past the allocated block, leading to memory corruption?

While the specific 0-resource crash for the newly added Glymur driver in
this intermediate commit is resolved later in the patch series, the
underlying lack of bounds checking remains unfixed.

> +
>  static const struct camss_resources msm8916_resources =3D {
>  	.version =3D CAMSS_8x16,

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-glymur_cam=
ss-v1-0-bee535396d22@oss.qualcomm.com?part=3D3

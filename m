Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A39147A86D
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465423; cv=none; b=JMGmSf/auoG8MAcyzes8m7/R15m7gz0BT5PwWCABHGOCtdSBAsRS3nG3dUGjmApuaaWd/FE4oJ/SsDij0CK/APRWh4LGBGDND5w4dMhYwBdHRS1NOxrGzrPamHil6rim2IzMQubNcn8/Pz3yn9z5LnB8dhef3nLd/VYS3rBlQL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465423; c=relaxed/simple;
	bh=/EX3olZnWFFHxmBYff+EBMrpjY35TO2MFvOoVwSbLl0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UMtQmmsuxRiIGu179T/17nGjhgZR2RLEEP36k5Jt1nmfks42NUly+d15E8+4PZvWZokg6Nsa5a/rAajlxDE8noPqv22rliH/YkAkIyl3QhZLsSHXGXgeYR4zEzOhOuhvODYJyVSc4s/zw/yIisOMVoBQZunKRJGubsnmznp/sT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KvDtr8kr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KvDtr8kr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEAA41F000FF;
	Tue, 15 Sep 2026 09:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789465419;
	bh=S4LrfRBhWfUz/kSKYhmWJFYC7o0fFuVXM24Pjvl1/yA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KvDtr8krXYDgwpOGx61+zGbPyiy1YRJRLdVmgZcQ+sl1tf9JcDl69TpGXzq5upAvk
	 PCX1KXELCAqE21c7C2ubDzYN4SJza3cEUqFrJl2iMYdzFEwiZ0a3UXtt7V6SoBfZ9I
	 5KqOu1p9GGSsZp0+QdGrAsCbMeXgjeg4oyJxuIG5SLILhM3KolzYHPOl05m4dkXD8A
	 eEVfjNRIriDutwoWmX2fgseY0p4QVzydhMSBHil84jr/286QKijihdrkebRDALVW77
	 ctgHGzBAeX7MeQ2z5SmVTIdqH1y9Oip5nPDZKKqBeMgBl4WHqWUWYtFG5ZZGOHmrLC
	 37Mhip3tmAW+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] media: qcom: camss: vfe: Add support for VFE 900
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260915-nord-v1-4-20db41a7f1ff@oss.qualcomm.com>
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
 <20260915-nord-v1-4-20db41a7f1ff@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 09:43:38 +0000
Message-Id: <20260915094338.CEAA41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: camss: incorrect FRAME_INCR address shift for VFE 900
--

commit dd5f8f2cb07db9a03dde1f94e9ccbfb47aa55597
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

media: qcom: camss: vfe: Add support for VFE 900

This commit introduces support for the VFE 900 hardware variant on the Nord
platform. It adds a new configuration structure to handle register base
differences and updates the image address shift in vfe_wm_update().

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c b/drivers=
/media/platform/qcom/camss/camss-vfe-gen4.c
> index d73d70898710a..f1429a6d2be54 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c

[ ... ]

> @@ -83,18 +147,36 @@
>   * RDI3			3
>   * GAMMA		4
>   * STATES_BE		5
> + *
> + * v900 full IFE write master client map: the RDI clients start at 28,
> + * after the 28 image/stats clients (0-27):
> + *
> + * MAIN C0/C1/C2/UV		0-3
> + * PIXEL_RAW			4
> + * W_IR				5
> + * AI_1 C0/C1/C2/UV		6-9
> + * AI_2 C0/C1/C2/UV		10-13
> + * HV_DS16 / HV_DS4		14-15
> + * STATS BG_IR..BLTM		16-27
> + * RDI0				28
> + * RDI1				29
> + * RDI2				30
> + * ... RDI11			39
> + *
> + * v900 IFE Lite matches the generic map above (RDI0 at client 0).
>   */
> -#define RDI_WM(n) ((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
> =20
>  static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line =
*line)
>  {
>  	struct v4l2_pix_format_mplane *pix =3D
>  		&line->video_out.active_fmt.fmt.pix_mp;
> =20
> -	wm =3D RDI_WM(wm);
> +	wm =3D vfe_gen4_rdi_wm(vfe, wm);
> =20
>  	/* no clock gating at bus input */
> -	writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
> +	if (vfe_gen4_get_hw_info(vfe)->has_wm_cgc_override)
> +		writel(WM_CGC_OVERRIDE_ALL,
> +		       vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
> =20
>  	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
> =20

[Severity: High]
Should VFE_BUS_WM_FRAME_INCR also be updated to use the new addr_shift?

Just below this in vfe_wm_start(), the frame increment is still
hardcoded to shift by 8:

	writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
	       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));

Since VFE 900 uses an addr_shift of 0, leaving this hardcoded shift means
the frame increment will be 256 times smaller than required. During
multi-frame captures on VFE 900, will subsequent frames be written to
incorrect offsets and overwrite previous frame data?

[ ... ]

> @@ -123,15 +205,19 @@ static void vfe_wm_start(struct vfe_device *vfe, u8=
 wm, struct vfe_line *line)
> =20
>  static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
>  {
> -	wm =3D RDI_WM(wm);
> +	wm =3D vfe_gen4_rdi_wm(vfe, wm);
>  	writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
>  }
> =20
>  static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
>  			  struct vfe_line *line)
>  {
> -	wm =3D RDI_WM(wm);
> -	writel(addr >> 8, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
> +	const struct vfe_gen4_hw_info *hw_info =3D vfe_gen4_get_hw_info(vfe);
> +
> +	wm =3D vfe_gen4_rdi_wm(vfe, wm);
> +
> +	writel(addr >> hw_info->addr_shift,
> +	       vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
> =20
>  	dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n", wm, addr);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-nord-v1-0-=
20db41a7f1ff@oss.qualcomm.com?part=3D4

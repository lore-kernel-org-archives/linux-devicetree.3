Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A1C190473
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 01:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790212184; cv=none; b=OKxLqAxig1Ahd+5Z+CDSi5uTEunfOcePJEDZ7SYOWA7BP89OhtHWiUuduUbVWIjyeTv4kTyVLw7Y5KhdPZtm03FligxlFUBKB7qHtDJzk6qW6y7R4uhhFxdh8gWcNPKvX39ZIy82K01cWIvLh2s9diUT5jFo3B3dxYUC3yTZfI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790212184; c=relaxed/simple;
	bh=WpKEXfy1KiH+U1dNtyfhk/0ZWTksyIJQELYAphWinMw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eWUjocaCs9QCVjg6krFO9WJsliS64OAGYF57O0jx/bYcj59J+Y+kB0KlwCIPoZK9BJEDvps8KZklSemJp8Aj8FBF8PDzuwbImIWw6MUE9tRnq4Cnt71rqTc1rtZzYD75dhlJrMTbnBaAHBw7yPdLS0EDgUr5SUSWU64D7CH1siQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gHiDmhfv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gHiDmhfv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95AB1F00893;
	Thu, 24 Sep 2026 01:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790212183;
	bh=yf33nOQzxCBb7lDqkEur5pTojFVgG6j9uUvF0T9HVBc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gHiDmhfvi/b4mFjS/ghJS3Ta8pOyh1u8g9xsKYRCSsobSaIPM1DE/9/ULgdMtIrDC
	 1BZ6Lij6Z5HkX1oq6SeP/pUEkScLOaC8sgMoCDlFE0LAYMBXrnSpO89YZ8u9J/eUB1
	 AjVvAO7613gk95+sJJJsi5Yg3cpK8Barrw77X+XUsnJ3xu2l6q/gSOHkebayRfxbXy
	 swY3ilQHQIYnofdU47p4/qJdUoaP1Bcng048PepZkME8qtm1N9bbbha7l/fbmZl7sx
	 5he70HEIkC6917cW+eORZWy98AcDDy5KSqdsF+BQEvrG/bc5fp6GuyrSv1n8Mf3Fvd
	 6+JzYs7CTR3AA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC net-next 4/9] net: pcs: xpcs: add Qualcomm Nord
 platform support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-4-4b1c682af70f@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923-qcom_xpcs_nord_emac-v1-4-4b1c682af70f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 01:09:42 +0000
Message-Id: <20260924010942.E95AB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: pcs: missing bounds check enables out-of-bounds MMIO read/wri=
te
--

commit 2b4e5bfd24ebda95c719fb78f892dda332feef24
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

net: pcs: xpcs: add Qualcomm Nord platform support

Adds Qualcomm Nord platform support by exposing DW XPCS register blocks via
separate direct-MMIO windows. It introduces accessors to translate MMD
accesses to these Nord windows and selects them using the Nord synthetic
XPCS ID.

> diff --git a/drivers/net/pcs/pcs-xpcs-plat.c b/drivers/net/pcs/pcs-xpcs-p=
lat.c
> index e78a233fb198d..e013a5253a226 100644
> --- a/drivers/net/pcs/pcs-xpcs-plat.c
> +++ b/drivers/net/pcs/pcs-xpcs-plat.c
[ ... ]
> @@ -285,7 +298,7 @@ static int xpcs_plat_init_res(struct dw_xpcs_plat *px=
pcs)
>  	else
>  		spc_size =3D pxpcs->reg_width * SZ_2M;
> =20
> -	if (resource_size(res) < spc_size) {
> +	if (!pxpcs->ops && resource_size(res) < spc_size) {
>  		dev_err(dev, "Invalid reg-space size\n");
>  		return -EINVAL;
>  	}

[Severity: High]
Does bypassing the resource_size() check for platforms with custom ops in
xpcs_plat_init_res() leave the hardware mapping size unvalidated?

Since xpcs_qcom_ops is set for the Qualcomm Nord platform, this skips
ensuring the physical mapped region is large enough to encompass the largest
possible offset.

> diff --git a/drivers/net/pcs/pcs-xpcs-qcom.c b/drivers/net/pcs/pcs-xpcs-q=
com.c
> new file mode 100644
> index 0000000000000..63c95c9514548
> --- /dev/null
> +++ b/drivers/net/pcs/pcs-xpcs-qcom.c
[ ... ]
> +static int xpcs_qcom_reg_offset(int dev, int reg)
> +{
> +	switch (dev) {
[ ... ]
> +	case MDIO_MMD_VEND2:
> +		if (reg >=3D DW_VENDOR)
> +			return QCOM_XPCS_VR_MII_BASE +
> +			       ((reg - DW_VENDOR) << 2);

[Severity: High]
Is there a bounds check missing for the reg index in xpcs_qcom_reg_offset()?

MDIO registers can be read from userspace up to 0xFFFF via ioctl or ethtool.
With MDIO_MMD_VEND2, a large index like 0xFFFF translates into an offset of
0x24fffc (approx 2.4MB), which may exceed standard hardware mapping slices.

> +
> +		return QCOM_XPCS_SR_MII_BASE + (reg << 2);
> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +int xpcs_qcom_reg_read(struct platform_device *pdev, void __iomem *reg_b=
ase,
> +		       int dev, int reg)
> +{
> +	int offset, ret;
> +
> +	offset =3D xpcs_qcom_reg_offset(dev, reg);
> +	if (offset < 0)
> +		return offset;
> +
> +	ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D readl(reg_base + offset) & 0xffff;

[Severity: High]
Could this readl() in xpcs_qcom_reg_read() trigger an out-of-bounds MMIO
access and a Data Abort?

Because xpcs_plat_init_res() bypassed the mapping size check, and
xpcs_qcom_reg_offset() translates unvalidated register indices into large
offsets, this reads from an unmapped physical address if a large reg value
is provided. (The same question applies to writel() in xpcs_qcom_reg_write()
below this block).

> +
> +	pm_runtime_put(&pdev->dev);
> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-qcom_xpcs_=
nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com?part=3D4

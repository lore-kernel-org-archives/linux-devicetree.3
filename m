Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B1C44238F
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 13:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108561; cv=none; b=Zh3B6pBSlukITk0oPjwdcX4TZ1KKIYMTpvaNal0QCHUoRxmqM0geyx7B0YZt4cbDtrYfSvIy7izsPiAA6cZLNN3A21PnrfQ3bw8IZl3N5cwHmRuiAaBZgJ3tCM6jvHrulndmE5Kcaz3DMOFp6LD4IvgR6GHLKuatWEXSVALfq3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108561; c=relaxed/simple;
	bh=EjHXVu4TbDF/bNmBVKxmF042xiIKqJiqdJBiprO1bLs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ALGLZ+3n1bEonBTU36I6QRCcY1X2Mt1MmUGjiZh4Rvur5G+lNfbSTi6yQwgNpDqflbHS30duXMQ1DUNiuGuImpy3fEGnQ/SkwILBgBEVdn6S4e7dYGgx9oh8/5lGGTE7TeDE/2mJkayJUaU/aehdf2C0Oml9rp4cDLROAY07nhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m8pnoxeF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m8pnoxeF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB0CE1F000E9;
	Fri,  7 Aug 2026 13:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786108557;
	bh=6Ni8FAqnIHSDqyMHgbZcLRj0l8PGpCYA1DRb/RCqZlA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m8pnoxeFY9lc66J3neelnHVDUZVXB8nM1mwkTUrqjGILwxHaVDEI2ZvXiKxgUMVEo
	 zzIIebfpWueaOrUyn8M0q87Kw7/5u6DAto6a1SfCZq9JZkrrF3saArL/trgFzhhoqz
	 HmttOb5rZ2BIld8HYVAs8PnzU+cy23dd3lIC6+Gqvb7lDb/XjlwyxKQblt8+G7UibX
	 Ls9gMdMwrbK/RyIQUSklR0zHQSFxD0gmorLCckzTsAY/MoXa0VWHPLW2X7cuCqDeOk
	 840mcnf8ug+N5t475Wu4S2+WlBXJKECjiUs0dENsFH3nOOv2hX+7JZaW4Y3Lomjw6I
	 MJux0kERkQY9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] media: ccs-pll: Support optional input for VT
 pixel rate
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jai Luthra" <jai.luthra@ideasonboard.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807-imx708-v2-2-7d3d7b57779d@ideasonboard.com>
References: <20260807-imx708-v2-0-7d3d7b57779d@ideasonboard.com>
 <20260807-imx708-v2-2-7d3d7b57779d@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 13:15:55 +0000
Message-Id: <20260807131556.DB0CE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] State reuse logic bug: Repurposing the output field `pixel_rate_pi=
xel_array` as an optional input causes subsequent PLL recalculations to reu=
se the previous achieved rate, breaking dynamic adaptation.
- [High] Missing validation: The DUAL_PLL configuration path bypasses hardw=
are limit checks for FIFO derating and overrating.
--

--- Patch [2]: [PATCH v2 2/3] media: ccs-pll: Support optional input for VT=
 pixel rate ---
commit 61f223eeeb41f300a2760175cdb5d9c15c35bf95
Author: Jai Luthra <jai.luthra@ideasonboard.com>

media: ccs-pll: Support optional input for VT pixel rate

This commit adds support for an optional target VT pixel rate input when
the PLL is configured in DUAL_MODE. It utilizes the pixel_rate_pixel_array
field to pass this input target, falling back to pixel_rate_csi if it is
not provided.

> When the PLL is configured in DUAL_MODE (separate VT and OP trees) and
> the sensor's FIFOs allow derating and/or overrating, the VT pixel rate
> might be higher or lower than OP pixel rate.

[Severity: High]
Does this bypass the hardware capability validation for FIFO derating and
overrating?

When CCS_PLL_FLAG_DUAL_PLL is set, ccs_pll_calculate() breaks out of the lo=
op
early and returns successfully after calling ccs_pll_calculate_vt_tree(). T=
his
completely skips the call to check_ext_bounds().

Could this allow arbitrary diverging VT pixel rates to be applied that exce=
ed
the sensor's FIFO capabilities without throwing an error, leading to FIFO
underflows or overflows?

> diff --git a/drivers/media/i2c/ccs-pll.c b/drivers/media/i2c/ccs-pll.c
> index 1605cfa5db19d..9aa164994cc73 100644
> --- a/drivers/media/i2c/ccs-pll.c
> +++ b/drivers/media/i2c/ccs-pll.c

[ ... ]

> @@ -388,6 +388,14 @@ __ccs_pll_calculate_vt_tree(struct device *dev,
>  	return 0;
>  }
> =20
> +static inline u32 ccs_pll_vt_pixel_rate(const struct ccs_pll *pll)
> +{
> +	if (pll->pixel_rate_pixel_array)
> +		return pll->pixel_rate_pixel_array;

[Severity: High]
Does this cause a state reuse issue for subsequent PLL recalculations?

This helper treats pixel_rate_pixel_array as an input target. However,
__ccs_pll_calculate_vt_tree() writes the achieved VT rate back into this
same field:

drivers/media/i2c/ccs-pll.c:__ccs_pll_calculate_vt_tree() {
    ...
    pll->pixel_rate_pixel_array =3D
        pll_bk->pix_clk_freq_hz * pll->vt_lanes;
    ...
}

Callers like ccs_pll_update() in ccs-core.c maintain the struct ccs_pll acr=
oss
multiple calls (such as during V4L2 link frequency changes) without zeroing
this field.

Since this helper unconditionally prefers pixel_rate_pixel_array if non-zer=
o,
won't subsequent configuration changes silently use the stale achieved rate
from a previous calculation instead of the intended target?

> +
> +	return pll->pixel_rate_csi;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-imx708-v2-=
0-7d3d7b57779d@ideasonboard.com?part=3D2

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AE13BF689
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785267692; cv=none; b=QtSxliQSSTjdl3icMJGO1Gv8rxkAzsXSpPj8+kcdtwoihY/Uj3HmqKxVho86NZMTySKsXq21kB8qLvTczXtdeDrdd5JtQlwrWmpUxy7gs61A8eCi5ekJ9luB515DnP1pdWFDEl9J+eXSlG4l1iE9bQfPAr7lhlphojt+M4HMnPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785267692; c=relaxed/simple;
	bh=8298hEAJonQ7sgmW3rGPIQK3BDAt3pSHNDGC2mXBlqM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jAjhYC1smQNEnByqPzuHBI2+RI6EUt9iF6sNmWHCQW8RlUK1d88Tx8s2YWxTowh+NnvHU/5br0OKcFrnJ/M1kaCwBZL9M9EIaUgZbFOwvtA7lc1XvFYvp7YWP/GNrnKAkXzwVNcsDay97xrSdNjwUXGiYhhggGMGn3dxWqFRh7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hqp3xcVD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hqp3xcVD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCBB41F000E9;
	Tue, 28 Jul 2026 19:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785267691;
	bh=HjR5pw5/gfOy+jhyu25quQeDLamlpk27FN6+f+2Qb98=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hqp3xcVDDOWVvMEollem4sHf8bgYjz5Mimt4yqh4cwgVYD9EdFQT66W8O3zTzRl1D
	 bFVtf8yQyqJssqQweAaJxuaAVkWPI7HQiL8XpdfhwJFkzefMzMnlc6YdA+qp02Q88W
	 Y7Fiv/YWDxsX+hI6jb5xF0hNir8HJJfa8JNpVkDkTxXw6oCiavNWHsQZxDZPIlH1+f
	 hRxTf7Q0VazFJIBLmgsxTK0RrFXnk9qerzslVf4MrGSY+dQ424Q43Wwzh05NG5K3h3
	 DjSgXmOrs3kC25LLRDwOnnZq612aklr653oMeV8Iu2dVGLU4FLBIDYg0xyzQKtpCuc
	 ToownFZDkBiOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 11/18] drm/rockchip: dw_dp: Implement out-of-band HPD
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-synopsys-dw-dp-improvements-v7-11-b7640fa8cf48@collabora.com>
References: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
 <20260728-synopsys-dw-dp-improvements-v7-11-b7640fa8cf48@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 19:41:30 +0000
Message-Id: <20260728194130.CCBB41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing runtime PM acquisition in out-of-band HPD callbacks lead=
s to SError crashes once runtime PM is enabled.
--

--- Patch [11]: [PATCH v7 11/18] drm/rockchip: dw_dp: Implement out-of-band=
 HPD handling ---
commit 38a0d76cc721376e1ac94e73ba9bcc954b4597fd
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/rockchip: dw_dp: Implement out-of-band HPD handling

This patch implements out-of-band hotplug handling to receive external hotp=
lug
information from the USB-C state machine. This moves the logic from the USB=
DP
PHY driver to avoid SError crashes once runtime PM is enabled.

> diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/=
rockchip/dw_dp-rockchip.c
> index 005938dc66c9f..b2e817044c942 100644
> --- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c

[ ... ]

> +static void dw_dp_rockchip_hpd_sw_sel(void *data, bool force_hpd_from_sw)
> +{
> +	struct rockchip_dw_dp *dp =3D data;
> +	u32 hpd_reg =3D dp->pdata->hpd_reg[dp->id];
> +
> +	dp->hpd_sel =3D force_hpd_from_sw;
> +
> +	regmap_write(dp->vo_grf, hpd_reg,
> +		     FIELD_PREP_WM16(ROCKCHIP_VO_GRF_DP_SINK_HPD_SEL, dp->hpd_sel));

[Severity: Medium]
Will this regmap_write() trigger an SError if the USB-C state machine
triggers an out-of-band hotplug event while the DP controller is runtime
suspended?

The commit message notes this patch is intended to prevent SError problems
once runtime PM is enabled. Since the register access requires the DP
controller's power domain, should there be a runtime PM acquisition before
writing to the vo_grf regmap?

> +}
> +
> +static void dw_dp_rockchip_hpd_sw_cfg(void *data, bool hpd)
> +{
> +	struct rockchip_dw_dp *dp =3D data;
> +	u32 hpd_reg =3D dp->pdata->hpd_reg[dp->id];
> +
> +	dev_dbg(dp->dev, "Force HPD connected=3D%s\n", str_yes_no(hpd));
> +
> +	dp->hpd_cfg =3D hpd;
> +
> +	regmap_write(dp->vo_grf, hpd_reg,
> +		     FIELD_PREP_WM16(ROCKCHIP_VO_GRF_DP_SINK_HPD_CFG, dp->hpd_cfg));

[Severity: Medium]
Similarly, could this asynchronous write cause an SError crash if it fires
without first ensuring the DP controller's power domain is active via runti=
me
PM?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-synopsys-d=
w-dp-improvements-v7-0-b7640fa8cf48@collabora.com?part=3D11

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893323BFE34
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 19:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783626092; cv=none; b=CyHjdebVutLwHU/M1yP8wTOR6ax6IXKVBmcEWETNd6Zv3U0cr58S6UxVsszGdPEnIvrGtI3+BySmfmnIUOEWVZRZULI3TsEEODyxjCbh2Mu2MHwiN+uG5ssjTCvKnnH/i55zsfrgleajkjqr+WSl54g1W6PtNz65KNkqgaL0gBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783626092; c=relaxed/simple;
	bh=3GIVQCPRqYKvW4hZLuxEDQmunZ36vk38xoI1venMEmU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nSIriMN0D3Df01yD8K2gixRubarqBSmmso50t8QpW5lVaSSmD5buif2wbepG6u0OBel00GZM6sgdZ7zCWOgANi/9CuxDNnupaQ8EPptFk8pGPCKjqGA1ZN+skTnNpjdVYMOl4HSw5zWnS7MbknCI0vuNyqTYnxFDP0xaAT1hsH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXZc9qgo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXZc9qgo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE87D1F000E9;
	Thu,  9 Jul 2026 19:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783626091;
	bh=BSwixGZacA8eJ/2GfyJWVMp7rzTtyXn7KbRqjhiLazQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bXZc9qgoFduqHQlI3CYAzo1wII2NGTBhLb+7ggJbHdUUnX02QCanx6vtlq0uQ0eOP
	 VpR9tbs8ZJOofZ1/16n3zTUbfVqoP3wmPF1hWuyXxDVlwi5tn9Q8hNUw7W1sR7dqbg
	 ihbDneWsVGFdCzvbSBNQFuVg6Ikxa3VaprEZNgBr3E1QFt+7/Rox71wtLVb1Ud6B0k
	 4Y4LtCPmV6tKS+PvFiQtenz0tmRH/wAe/aj85jmn43hTCPJj+62MC3bz/uw8h34Iec
	 cbDlSIXwrOI+r2mhHBKuz18cxVBeM19URez1o5+Tl0eqG6O6bYGtuoO1weCKq9JMjw
	 +1dC/AvdeGOng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 35/36] phy: rockchip: usbdp: Re-init PHY on mux
 change
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, olteanv@gmail.com, robh@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-35-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
 <20260709-rockchip-usbdp-cleanup-v11-35-a149ac60f76c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 19:41:30 +0000
Message-Id: <20260709194130.AE87D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Deadlock / Recursive Lock

Pre-existing issues:
- [High] Silent DP PHY State Loss
--

--- Patch [35]: [PATCH v11 35/36] phy: rockchip: usbdp: Re-init PHY on mux =
change ---
commit 63e6102eaff345b4ebf6faefafd6aae88e7bb98e
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Re-init PHY on mux change

Ensure that the right part of the PHY are powered up when the mode changes.
This ensures the PHY is re-initialized when cable orientation changes witho=
ut
DP being involved, and when switching from DP-only into a mode with USB
support.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index c5ad300620a65..ecf0ed0139f69 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1383,7 +1383,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_=
dev *mux,
> =20
>  	rk_udphy_set_typec_state(udphy, state->mode);
> =20
> -	return 0;
> +	return rk_udphy_update_power_state(udphy);

[Severity: High]
Could this lead to a recursive locking deadlock if the DWC3 controller is
runtime-suspended?

Since rk_udphy_typec_mux_set() holds udphy->mutex using a guard, the
following chain seems to re-acquire the same mutex:

rk_udphy_typec_mux_set()
   guard(mutex)(&udphy->mutex);
   rk_udphy_update_power_state()
      phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);

If the DWC3 driver handles this notification in device role:

dwc3_usb3_phy_notify()
   pm_runtime_resume_and_get()
      ...
      dwc3_resume_common()
         dwc3_core_init_for_resume()
            dwc3_phy_init()
               phy_init()

The PHY init then attempts to acquire the lock again:

rk_udphy_usb3_phy_init()
   guard(mutex)(&udphy->mutex);

Will this cause a system freeze when hotplugging or switching modes?


[Severity: High]
This isn't a bug introduced by this patch, but does invoking
rk_udphy_update_power_state() during a mux change cause the DP link to be
permanently lost?

When the power state updates, the PHY is re-initialized:

rk_udphy_update_power_state()
   rk_udphy_init()
      regmap_write(..., FIELD_PREP(CMN_DP_LANE_EN_ALL, 0));

This reset sequence clears the CMN_DP_LANE_EN_ALL bits and disables DP
transmission. Since rk_udphy_dp_lane_enable() does not appear to be called
afterward to restore the active DP configuration, does the DRM subsystem
lose the link without a full power cycle?

>  }
> =20
>  static void rk_udphy_typec_mux_unregister(void *data)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-rockchip-u=
sbdp-cleanup-v11-0-a149ac60f76c@collabora.com?part=3D35

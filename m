Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E99357D00
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 01:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785978399; cv=none; b=Vh5+EUuVkGtk6jYcAEFW0rZZiWo6N1tirbU42uxNmGH9NH6y0g/TVgwN8cmJCRPVakU0yNMqTiHBCN0QO8JDu7g+EABvAJkb4ZoXn8iwF/BjeAm1Q6CFjOYiZdAdLmWJ7Qs+ouHLk/wVAdH29Ovng9j+CKKx11oql9KElxgI/fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785978399; c=relaxed/simple;
	bh=wR1XNcdO8EPNljDtogyVFQim7hxmWRC0virQZUfym68=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SAVtUmdavdCysFf2b1IZ7pP1bQTb8foftkzMV2+7gvp8f8BoZXQe1kGXYYWHBa4RqQm8ybyPEeQ5N29cQUjn2zcWKRtsYC/Qcj3XWNT/KKlZcBj3DrQ4j8fhALh88BEsils50gpu+w1zQQujdG+cLyRFj/CpaSh8+J4M7kwFt2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ThnQRTNU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ThnQRTNU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485FD1F000E9;
	Thu,  6 Aug 2026 01:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785978397;
	bh=5c/cN7ZtOWSlGDW9V5l7RLTjGbWSKIPZFS/+ErdV6vQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ThnQRTNUiTApyoBM9eOk3wnWVn5bmzTYEAf5esm7HIF5P9FAV4EFK1re97svi9V9O
	 odE0ZY4J/I9EscO6cRiEDIIiici/4k9Wd2wS/t84vlrYk6m+YYYhKn7vhiu0w8x7eq
	 pOlwm+U24/uSfRTF19dH9BoEg9/1u8B0fj1VgHg8xaMhfv3+PET1vhXNm7Fc2pBbhm
	 /aBR04UOE8mWzgPt5J6Lt6VnYHYo7y8mcb0XXHQ408B2fn/qYLMu1ndxVS+m6C4UVX
	 8ZMSZrh8o2T3H/3ZvLDINWCn70Zb/Tohi26mISwzbzPXHNj/MoDs6ryi5MSFyTSwkV
	 lqDwYqy0r0C9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 15/21] drm/rockchip: dw_dp: Add runtime PM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v10-15-d84a26c303d6@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v10-15-d84a26c303d6@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 01:06:36 +0000
Message-Id: <20260806010637.485FD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Omission of system sleep PM callbacks breaks hardware reinitializa=
tion after system suspend (S3).
- [High] Activating runtime PM skips the manual initialization of controlle=
r clocks, causing `phy_init()` to be called with disabled clocks.

Pre-existing issues:
- [High] Asynchronous runtime PM put on driver unbind leads to resource lea=
ks because the suspend is cancelled by pm_runtime_disable().
--

--- Patch [15]: [PATCH v10 15/21] drm/rockchip: dw_dp: Add runtime PM suppo=
rt ---
commit a8b68fca7b517a740f570a28e454719c2577d17d
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/rockchip: dw_dp: Add runtime PM support

This patch adds runtime PM support to the Rockchip RK3576/3588 Synopsys
DesignWare DisplayPort driver.

> diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/=
rockchip/dw_dp-rockchip.c
> index ffcfb887d0d2a..770ab042a1879 100644
> --- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
[ ... ]
> @@ -231,6 +232,7 @@ static int dw_dp_rockchip_probe(struct platform_devic=
e *pdev)
>  	if (IS_ERR(dp->vo_grf))
>  		return PTR_ERR(dp->vo_grf);
> =20
> +	plat_data->autosuspend_delay =3D 500;

[Severity: High]
This is a pre-existing issue, but activating runtime PM for this driver by
setting this autosuspend delay exposes a potential resource leak during
driver unbind.

During component unbind, devm_drm_bridge_add() cleanup invokes
dw_dp_bridge_detach():

drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_bridge_detach() {
    ...
    if (!dp->usbc_mode)
        pm_runtime_put_autosuspend(dp->dev);
    ...
}

Shortly after, the devm_pm_runtime_enable() cleanup invokes
pm_runtime_disable(), which cancels any pending asynchronous suspend reques=
ts.

Since this is an async put, will the hardware clocks (apb_clk, aux_clk)
remain enabled indefinitely after driver unbind?

[Severity: High]
Does activating runtime PM here skip the clock enablement needed for PHY
initialization?

In dw_dp_probe(), the fallback manual resume is skipped when runtime PM is
enabled:

drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_probe() {
    ...
    if (!pm_runtime_enabled(dev)) {
        dw_dp_runtime_resume(dp);
        ...
    }
   =20
    ret =3D phy_init(dp->phy);
    ...
}

Since we set autosuspend_delay here, pm_runtime_enabled() evaluates to true
and we skip dw_dp_runtime_resume(). However, there is no corresponding
pm_runtime_get_sync() before phy_init() is called.

Will this cause phy_init() to execute with the controller's APB clock turned
off, potentially resulting in a bus hang?

>  	plat_data->max_link_rate =3D plat_data_const->max_link_rate;
>  	plat_data->pixel_mode =3D plat_data_const->pixel_mode;
[ ... ]
> @@ -253,6 +255,24 @@ static void dw_dp_rockchip_remove(struct platform_de=
vice *pdev)
>  	component_del(&pdev->dev, &dw_dp_rockchip_component_ops);
>  }
> =20
> +static int dw_dp_rockchip_runtime_suspend(struct device *dev)
> +{
> +	struct rockchip_dw_dp *dp =3D dev_get_drvdata(dev);
> +
> +	return dw_dp_runtime_suspend(dp->base);
> +}
> +
> +static int dw_dp_rockchip_runtime_resume(struct device *dev)
> +{
> +	struct rockchip_dw_dp *dp =3D dev_get_drvdata(dev);
> +
> +	return dw_dp_runtime_resume(dp->base);
> +}
> +
> +static const struct dev_pm_ops dw_dp_pm_ops =3D {
> +	RUNTIME_PM_OPS(dw_dp_rockchip_runtime_suspend, dw_dp_rockchip_runtime_r=
esume, NULL)
> +};

[Severity: High]
Does this struct need to map system sleep callbacks as well?

Because we only define RUNTIME_PM_OPS here, the PM core takes no action for
this device when the system enters S3 suspend. The device remains tracked as
active in software.

Upon system wake, since there is no system resume callback, the software
state remains active.

When a subsequent pm_runtime_get() is called during display enable, will it
skip executing dw_dp_rockchip_runtime_resume() because the software status =
is
already active? If so, this could leave the hardware uninitialized after a
system suspend.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-synopsys-d=
w-dp-improvements-v10-0-d84a26c303d6@collabora.com?part=3D15

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B31429CEB
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 18:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785783359; cv=none; b=TqrN18wa8LiMPf31W05LeqdrA1sXwL63eOE2aHn8d7qwulwUOQUJeQXXBvPDOAEqldCgCctjaXVROzk4tmuzhnRtl5aOcsW4gvBZaxBDrHH1x6bNCQ3mGUDlUScPiLl80i0eo/kU3AxR7j++menZfdKYRyPLvYlWnWcOHZ2GcMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785783359; c=relaxed/simple;
	bh=5otRkD2awT8dY9ktuaiuztvobbrbKdSLlEELdN8j0uw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cH8btL+xChq16EpXr4rR9sLC7PEm01CQS6ll6P8SNSXmC9AYakI8QMxiD5sHMYjwjeLKbsoemLbb/oE2cNsssr4fnYKN/3fr19qHsItLGHePdSo+iZLnNhcoXGcjpAQyFTvN/Qk8WC5Ew06lsS7OAIA+W89V2J4h+PujWWlPcr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEdc8A6+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEdc8A6+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85591F000E9;
	Mon,  3 Aug 2026 18:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785783356;
	bh=D12yxEdys/E0SH2cuBykeyefK6BxWQnERgkBCzHZ7qc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UEdc8A6+WNcGx7EWfUwxfGzwcp4rup2ZwXc/6iZqaz9FOYh45b5CBcR2RstrE0cMF
	 3HRghTALVk7lo9z56mD9rxbxxAlLac2gCopACldjKEUAQq4j+7LpQBTmEK8jvHEgZN
	 LOTzRp7P4HnWrEbtGsQxlZm53cUwELFurIimzu+G708WjFvHx+ZIOkOXzqTpL1em16
	 aJBJmyklTLC9BEk/8aylupm+2OL97Ajo0XNBrviagdfhzzskOmHFA+GilsOTTIi8UE
	 mzK+572lGmlqvJItLCMI7otyPxMUu0JNQ0oPpBM6RC4UOzqclKuGzHLEYIWxJpIwra
	 DMJK8Fqhv3YyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 15/22] drm/bridge: synopsys: dw-dp: Add Runtime PM
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-synopsys-dw-dp-improvements-v9-15-2e6e46135312@collabora.com>
References: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
 <20260803-synopsys-dw-dp-improvements-v9-15-2e6e46135312@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 18:55:54 +0000
Message-Id: <20260803185555.C85591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Asynchronous runtime PM puts are used during device teardown, raci=
ng with pm_runtime_disable() and leaving the device explicitly powered on.
- [High] Sleeping functions are invoked synchronously from an atomic contex=
t during bridge atomic enable.

Pre-existing issues:
- [High] Unbalanced resource handling (double-free of phy power and underfl=
ow) during failed atomic enable.
--

--- Patch [15]: [PATCH v9 15/22] drm/bridge: synopsys: dw-dp: Add Runtime P=
M support ---
commit 2b85362372523d505a6d2f6be68c1219a8790052
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Add Runtime PM support

Add runtime PM stubs to the Synopsys DesignWare DisplayPort bridge
driver. Support is not enabled automatically and must be hooked up
in the platform specific glue code.

The early bits of the dw_dp_probe function are split into a new
function called dw_dp_alloc, so that the platform driver can assign
it before running dw_dp_probe. This is necessary because the runtime
PM resume/suspend events land at the platform driver and must be
forwarded to the helper once runtime PM is enabled in the middle
of the probe function.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 7b8a9855ceae0..501b28abeca24 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c

[ ... ]

> @@ -1675,6 +1683,13 @@ static void dw_dp_bridge_atomic_enable(struct drm_=
bridge *bridge,
>  	struct drm_connector_state *conn_state;
>  	int ret;
> =20
> +	ret =3D pm_runtime_get_active(dp->dev, RPM_TRANSPARENT);
> +	if (ret) {
> +		dev_err(dp->dev, "runtime PM failure\n");
> +		return;
> +	}
> +	dp->pm_active =3D true;
> +

[Severity: High]
Does this synchronous runtime PM resume call sleep while in an atomic conte=
xt?

The DRM core invokes dw_dp_bridge_atomic_enable() during atomic commits, wh=
ich
runs in an atomic context for non-blocking commits.=20

If the device is suspended, pm_runtime_get_active() can synchronously execu=
te
dw_dp_runtime_resume(), which calls clk_prepare_enable() and msleep():

drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_runtime_resume() {
    ...
    msleep(110);
    ...
}

Could this lead to kernel warnings for scheduling while atomic, or potential
deadlocks?

>  	connector =3D drm_atomic_get_new_connector_for_encoder(state, bridge->e=
ncoder);
>  	if (!connector) {
>  		dev_err(dp->dev, "failed to get connector\n");
>  		return;
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but does this early return cause=
 an
unbalanced resource cleanup if the link enable fails?

If the connector is NULL, the function returns early without clearing
dp->pm_active. Likewise, if dw_dp_link_enable() fails later in the function=
, it
cleans up by calling phy_power_off() and returns early, leaving dp->pm_acti=
ve
set to true.

Later, the DRM core invokes dw_dp_bridge_atomic_disable() which sees
dp->pm_active =3D=3D true and proceeds to call dw_dp_link_disable(), which
unconditionally calls phy_power_off() and drm_dp_link_power_down().

Could this result in a double-free of the phy power or an underflow of the
power count?

[ ... ]

> @@ -2110,6 +2161,9 @@ EXPORT_SYMBOL_GPL(dw_dp_bind);
>  void dw_dp_unbind(struct dw_dp *dp)
>  {
>  	drm_bridge_put(dp->next_bridge);
> +
> +	if (!dp->usbc_mode)
> +		pm_runtime_put_autosuspend(dp->dev);
>  }
>  EXPORT_SYMBOL_GPL(dw_dp_unbind);

[Severity: High]
Can this asynchronous put race with device teardown?

During component teardown, pm_runtime_put_autosuspend() queues an asynchron=
ous
suspend. However, pm_runtime_disable() cancels pending asynchronous suspend
requests. Will this leave the device permanently active? Should a synchrono=
us
put like pm_runtime_put_sync() be used here instead?

[ ... ]

> @@ -2120,76 +2174,125 @@ static void dw_dp_phy_exit(void *data)
>  	phy_exit(dp->phy);
>  }
> =20
> -struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_=
dp_plat_data *plat_data)
> +static void dw_dp_manual_suspend(void *data)
> +{
> +	struct dw_dp *dp =3D data;
> +
> +	dw_dp_runtime_suspend(dp);
> +}
> +
> +static void dw_dp_irq_free(void *data)
> +{
> +	struct dw_dp *dp =3D data;
> +
> +	/* ignore error as the interrupt needs to be free'd in any case */
> +	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dp->dev, pm);
> +
> +	free_irq(dp->irq, dp);
> +	dp->irq =3D -1;
> +}

[Severity: High]
Similarly, does this asynchronous put in dw_dp_irq_free() race with
pm_runtime_disable() during devm cleanup?

When devm triggers cleanup on driver unbind or probe failure, it invokes
dw_dp_irq_free() which uses PM_RUNTIME_ACQUIRE_AUTOSUSPEND to release the
reference asynchronously. The next step in devm cleanup is usually
devm_pm_runtime_enable() unwinding, which calls pm_runtime_disable().

Could this cancel the pending suspend request and result in a power and
clock resource leak?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-synopsys-d=
w-dp-improvements-v9-0-2e6e46135312@collabora.com?part=3D15

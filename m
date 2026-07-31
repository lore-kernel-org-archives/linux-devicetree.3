Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2F9449992
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 17:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785518591; cv=none; b=HJtSrMrfrK00mJPW6VfSBqsvlnzliwHpJfINmjRNXAPNb5G0/veRDa0Kt1HfkhxGceBY3+ay596FREd0AEB8e+mrYiQd/0eXhISSKriNULrBurnI0wgXhKP+GBSqgXHXsLEO8+YxMVW6leAvHB0qEYE216Jb3e+cCRYc4jZmJbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785518591; c=relaxed/simple;
	bh=VeuLp4Ff3ieDDGqSOzPc5CxXHmiG7eksIyhGnAzfg/w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MSJUBH9g4aQ0WX2QHzUSHDXpWPGvIsrOXcdBi1LxUhV3l5x0NkEhOzdNdBq1FyIJP0YBEMKJDmMWpFzZnV8S8umO8TwXzl4a+auV7Oqf+Uk9BBQ+zagatXQSJos5JLWCI6B/xM/IhOpxLaDo7TbpZrBbMMExnSfU6vjmZFpWxXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fxS+il1m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxS+il1m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523B01F00AC4;
	Fri, 31 Jul 2026 17:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785518589;
	bh=3QUPjHQoA2jPBqgJA9n6F3HRhE+YyFCYjdLaWBs9pWU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fxS+il1mKsR4ZNObNC4xXfXFGB5UN3R3UWe9OgU+1BvMQ5mI7aQPDE8ynITYzYWcu
	 Wev8o7fxGqWGOBP4Ntzm9g6WUomgLSQ7jpt9gFhnVCajH/LbFP9X+/Laju/xE240z8
	 iuWPMtqAxNJ5IjON9FFGb40DO+Cqykzd3zujaeUCPvKrtXv26n/jGy8CIhTzXbAfwx
	 kOhb3bVuHFply/wXUkA8rLiKXPWdyut7YnXcoXU8rUGNHeN9X5o2aE6tqudBcx0v0Q
	 BwPMYv0XjComcL9qcC4FEzUA1jC6kF0p5dtyUvZ7LZmJzybfv1HIOkApjFOILYF9We
	 5SluLmdKEt72A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 14/21] drm/bridge: synopsys: dw-dp: Add Runtime PM
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260731-synopsys-dw-dp-improvements-v8-14-ac1e6a75782f@collabora.com>
References: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
 <20260731-synopsys-dw-dp-improvements-v8-14-ac1e6a75782f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 17:23:08 +0000
Message-Id: <20260731172309.523B01F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Asynchronous pm_runtime_put_autosuspend() during driver teardown a=
nd error paths is cancelled by pm_runtime_disable(), leaving the device per=
manently active and leaking clock resources.
- [High] phy_init() is called while the device is in its initial RPM_SUSPEN=
DED state with APB and AUX clocks disabled, risking a bus hang.
--

--- Patch [14]: [PATCH v8 14/21] drm/bridge: synopsys: dw-dp: Add Runtime P=
M support ---
commit e3dd87d799174b12a4a2ad492ab236cf0e86bc18
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: drm/bridge: synopsys: dw-dp: Add Runtime PM support

This commit adds runtime PM stubs to the Synopsys DesignWare DisplayPort
bridge driver. It splits the early parts of dw_dp_probe into dw_dp_alloc
to allow platform drivers to assign it before probing.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index b21c2016dbd29..c24a5436e8fe8 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
[ ... ]
> @@ -2108,76 +2162,125 @@ static void dw_dp_phy_exit(void *data)
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
Will this asynchronous autosuspend be cancelled by pm_runtime_disable() dur=
ing
device removal?

When this devm teardown action runs, it releases the PM runtime reference
asynchronously via the PM_RUNTIME_ACQUIRE_AUTOSUSPEND scope guard. Immediat=
ely
afterward, the devm_pm_runtime_enable cleanup callback executes
pm_runtime_disable().

As documented in the PM subsystem rules, pm_runtime_disable() cancels pendi=
ng
autosuspend work, meaning dw_dp_runtime_suspend() will never be called. Wou=
ld
it be safer to use a synchronous suspend operation like pm_runtime_put_sync=
()
here to ensure the clocks do not remain permanently enabled?

[ ... ]
> +	if (dp->plat_data.autosuspend_delay > 0) {
> +		pm_runtime_use_autosuspend(dev);
> +		pm_runtime_set_autosuspend_delay(dev, dp->plat_data.autosuspend_delay);
> +		ret =3D devm_pm_runtime_enable(dev);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!pm_runtime_enabled(dev)) {
> +		dw_dp_runtime_resume(dp);
> +
> +		ret =3D devm_add_action_or_reset(dev, dw_dp_manual_suspend, dp);
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	ret =3D phy_init(dp->phy);
>  	if (ret) {
>  		dev_err_probe(dev, ret, "phy init failed\n");
> -		return ERR_PTR(ret);
> +		return ret;
>  	}

[Severity: High]
Could this phy_init() call trigger a bus hang if the device is still suspen=
ded?

Prior to this patch, the APB and AUX clocks were explicitly enabled before
phy_init() was called. Now, clock enablement is delegated to
dw_dp_runtime_resume().

If autosuspend_delay > 0, devm_pm_runtime_enable() is called but the device=
 is
left in its default RPM_SUSPENDED state. Since phy_init() is called without
first waking the device via pm_runtime_get_sync(), the DP controller's APB
and AUX clocks are still disabled.

If the external PHY shares the APB bus or relies on the controller being
clocked to access its registers, will this unclocked access cause a
synchronous external abort?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-synopsys-d=
w-dp-improvements-v8-0-ac1e6a75782f@collabora.com?part=3D14

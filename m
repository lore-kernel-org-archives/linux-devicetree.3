Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1205438E5E9
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 01:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785978446; cv=none; b=PM5Qe2yHX0d3TlO7Iy5yQWTKP44DeNXjtUaHiob3KVxSFOQ+0ytfBdI5/PMiK10fhJRskjoCPXi0HEXKi6boTPkJzkRveNpWQd07X5vaWgb3ktNA081Fs3z4GBKpBn5JUvS0HR9El0ad2G1u8g/CORdmKi4f+kQ3A0wZVwvZhTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785978446; c=relaxed/simple;
	bh=eK+f6P/t+PwolEbhdybsn+NqA4u8X+/WILa7x6VgVKI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KD4UgLC/FalqDqPCQx+LobF84zx137QlD7+QrZJN7MxjWhiSQJ4s4MdplhZ8k7azcyP9xYUyOtSxsSN7/G/UhvWSelhpsNScSIFcv0Oqfc/fxESSL9RUfJEZ2OA7EYZfpcBNm+JCfUJ8qkcROQGI+5v9vYypjjetAyhYjWYvT+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQ0gAkXi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQ0gAkXi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733A41F00ACF;
	Thu,  6 Aug 2026 01:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785978444;
	bh=UZh6Vl+SDWun7kQdsYP+XH2G2x68xAvslP4Y7UyzRt4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lQ0gAkXichqB49LXb76/jCC7rFU7h3D0zDHhtcyg5DSigOGgOGnS1rgFEwixzwPKS
	 oZPKkf/Tkk5NBl9o2A2yghOY5cwEcHGkh72aVS2bg9Z6sBONKyeytZQTb6Ta/pqF8y
	 26P34tqz2P1SlfpWkYaLt43DSE/QDmPhkRuId8jMJBFoH+Y0dLvNj9685bPOofkefJ
	 ks1DVEJsf9+whqJ6hlbU79gWzJp07rVP26JboTtJsBkSCGKyfBb7KYoG3hMHInawn8
	 p5kCxmI/8pIIgIbGPpztdUBKjAAOUvLjBhJ3u3v/ZbQxJLMp6hTRk6dvsDb0hzSw6Y
	 54HG5QIFg3VCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 14/21] drm/bridge: synopsys: dw-dp: Add Runtime PM
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v10-14-d84a26c303d6@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v10-0-d84a26c303d6@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v10-14-d84a26c303d6@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 01:07:23 +0000
Message-Id: <20260806010724.733A41F00ACF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Using asynchronous pm_runtime_put_autosuspend() during teardown pa=
ths leaves hardware in an active power state.
- [High] Calling sleeping functions from within the bridge atomic enable an=
d disable callbacks violates atomic context restrictions.
- [Medium] Calling `phy_init()` while the APB and AUX clocks are disabled m=
ay cause hardware faults.
--

--- Patch [14]: [PATCH v10 14/21] drm/bridge: synopsys: dw-dp: Add Runtime =
PM support ---
commit c4724f477a725eaa23bb5ef5b62b3fe8b8f02e8a
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Add Runtime PM support
   =20
Add runtime PM stubs to the Synopsys DesignWare DisplayPort bridge
driver. Support is not enabled automatically and must be hooked up
in the platform specific glue code.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 847c2aa95e27c..545dddce69e7b 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
[ ... ]
> @@ -1681,6 +1689,13 @@ static void dw_dp_bridge_atomic_enable(struct drm_=
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
Does this introduce a sleeping function into an atomic context?

During a non-blocking atomic commit, the DRM core invokes
dw_dp_bridge_atomic_enable(). This callback executes in an atomic context
where sleeping is forbidden. However, pm_runtime_get_active()
synchronously resumes the device, invoking dw_dp_runtime_resume(), which
subsequently calls msleep(110).

This isn't a bug introduced by this patch, but there are pre-existing
sleeping operations in these paths, including a mutex lock
(scoped_guard(mutex, &dp->audio_lock)) and usleep_range() inside
dw_dp_reset(), which may also need attention to avoid kernel warnings.

[ ... ]
> @@ -1940,6 +1972,9 @@ static int dw_dp_bridge_attach(struct drm_bridge *b=
ridge,
>  err_disable_irq:
>  	disable_irq(dp->irq);
>  	cancel_work_sync(&dp->hpd_work);
> +
> +	pm_runtime_put_autosuspend(dp->dev);
> +
>  	return ret;
>  }

[Severity: High]
Will this async put leave the hardware in an active power state?

This async put is used in the attach error cleanup path, which will also be
immediately followed by driver unbind and PM disable. The delayed suspend
is scheduled right before the device is unregistered.=20

Because device removal immediately follows, the devres cleanup executes
pm_runtime_disable(), which cancels the pending async suspend work. This
aborts the power-down sequence and leaves the apb_clk and aux_clk enabled.
Should pm_runtime_put_sync() be used here instead?

[ ... ]
> @@ -1951,6 +1986,8 @@ static void dw_dp_bridge_detach(struct drm_bridge *=
bridge)
>  	drm_dp_aux_unregister(&dp->aux);
>  	disable_irq(dp->irq);
>  	cancel_work_sync(&dp->hpd_work);
> +	if (!dp->usbc_mode)
> +		pm_runtime_put_autosuspend(dp->dev);
>  }

[Severity: High]
Similar to the error path in dw_dp_bridge_attach(), does this need to be a
synchronous put? pm_runtime_put_sync() ensures the idle/suspend completes
before the subsequent device deletion.

[ ... ]
> @@ -2209,31 +2283,57 @@ struct dw_dp *dw_dp_probe(struct platform_device =
*pdev, const struct dw_dp_plat_
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

[Severity: Medium]
Can calling phy_init() while the APB and AUX clocks are disabled cause
hardware faults?

If PM runtime is active (which is the default if autosuspend_delay > 0),
the apb_clk and aux_clk remain disabled until the device is explicitly
resumed. However, phy_init() is still called unconditionally at the end of
probe. If the generic PHY driver accesses internal registers that rely on
the display controller's APB bus clock, the unclocked access might hang the
system.

[ ... ]
> +int dw_dp_runtime_resume(struct dw_dp *dp)
> +{
[ ... ]
> +	/*
> +	 * HPD_HOT_PLUG bit is asserted only after the sink holds HPD
> +	 * high for at least 100ms.
> +	 */
> +	msleep(110);
> +
> +	return 0;
> +}

[Severity: High]
As mentioned earlier, does this msleep(110) introduce a sleep into atomic
context when reached from dw_dp_bridge_atomic_enable() via
pm_runtime_get_active()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-synopsys-d=
w-dp-improvements-v10-0-d84a26c303d6@collabora.com?part=3D14

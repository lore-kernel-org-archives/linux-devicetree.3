Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EBD46D2DB
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 16:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515409; cv=none; b=K/ranMYxWyOTyj2UB5HPlOyZi1WZdbaMtEQQP3KSGxqfgRGTJiQkptTnyeTYnnx3DGEzSBaVgVeymd9sLvgrfn7vrdEiwfSs6ZtVPzMCOS4zWe2kqieVLzCcaVsgahlh6FEOvlt2UTrevnWn050+hFQbmNoTxRVrcx2y+cd1cX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515409; c=relaxed/simple;
	bh=sDrXjnP1L9JVto8k+Y3vWPU1GO8bMdkSJyg8e7DPhao=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nqJScCeHczpSaVLZNxs8c+GOOR/YHoN7Wn4gveWHnrmBM2XfzyECJt/rqvQFngxQ9hsFRUJ/HqknRb7M3YzQnOhqr8RYDF3K7F/sPp0TB41t2Jn+brwelHlc8gQ8F221OCxQe7kETjPSLBr2sWciBAYcCrr6jClphBictSGkfDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TeFkwCrK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TeFkwCrK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FA81F00ACA;
	Fri, 31 Jul 2026 16:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785515408;
	bh=wc3Lv+IkzPJ5w9srUtZfHSRdaMtbBfmRfgTfV0kDU6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TeFkwCrKcZk31zFULrqjUQ4hAURsxzrmqpeIRo6e7Oo5VSrEi7jFGS+na7TAzTD/u
	 0I/toMyvlJhcjWYQIrUr9E0Mn2bh9xS5moGDEAE5qY81suzlfdkshkhZfBOAEw/Fdz
	 oimdaWYoOzlFyguSmJGabLEGogYC7jLHRgP7D4fsJhx9AC3CtoZJyrldoGi9JuR/tB
	 cmNt5Vo+seSA4g5/l5Ga+bm6f/lAKA9Uw3LaVGmdYSHjToRABKFbq9OmCA6pm66BVb
	 aG5V/zRvY9UZrzVzUun4PFIH3Fsxyu8XoNk5wseBGpNGlJcTW6weFY5iTTA2WmGbJk
	 2+IEUt1P4TlhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 08/21] drm/bridge: synopsys: dw-dp: Free output_fmts
 when none are valid
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260731-synopsys-dw-dp-improvements-v8-8-ac1e6a75782f@collabora.com>
References: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
 <20260731-synopsys-dw-dp-improvements-v8-8-ac1e6a75782f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 16:30:07 +0000
Message-Id: <20260731163007.E9FA81F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unbalanced phy_power_off() and regulator_disable() if phy_power_on=
() fails in dw_dp_link_enable().
- [High] NULL pointer dereference in dw_dp_hpd_work() and dw_dp_link_retrai=
n() due to missing bridge.dev check.
--

--- Patch [8]: [PATCH v8 08/21] drm/bridge: synopsys: dw-dp: Free output_fm=
ts when none are valid ---
commit 749c8cb81f0227b8f3795cdf2bcba3b9e0038179
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Free output_fmts when none are valid

If dw_dp_bandwidth_ok() returns false for all formats, *num_output_fmts
might end up becoming 0. This commit frees output_fmts within the function
in that case to avoid leaking memory.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 760e1e0f8234b..7127928c26506 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -1804,6 +1804,11 @@ static u32 *dw_dp_bridge_atomic_get_output_bus_fmt=
s(struct drm_bridge *bridge,
>  		output_fmts[j++] =3D fmt->bus_format;
>  	}
> =20
> +	if (j =3D=3D 0) {
> +		kfree(output_fmts);
> +		output_fmts =3D NULL;
> +	}
> +
>  	*num_output_fmts =3D j;
> =20
>  	return output_fmts;

[Severity: High]
This isn't a bug introduced by this patch, but could there be an unbalanced
phy_power_off() if phy_power_on() fails during dw_dp_link_enable()?

In dw_dp_link_enable(), if phy_power_on() fails:

    ret =3D phy_power_on(dp->phy);
    if (ret)
        return ret;

It returns without incrementing the PHY's power_count. However, if the DRM
core continues tracking the bridge as enabled, it will eventually call
dw_dp_link_disable() when the bridge is disabled.

dw_dp_link_disable() does:

    phy_power_off(dp->phy);

Because the power_count was not incremented earlier, does this cause
phy_power_off() to decrement it to -1 and unconditionally call
regulator_disable(), potentially dropping power for other shared devices?

[Severity: High]
This is also a pre-existing issue, but can dw_dp_hpd_work() or
dw_dp_link_retrain() trigger a NULL pointer dereference if the bridge is
detached?

If the DRM encoder is unbound, drm_bridge_detach() explicitly sets
bridge->dev =3D NULL. If a physical hotplug event occurs before the bridge
device itself is unbound, the IRQ can fire and schedule dw_dp_hpd_work().

In dw_dp_hpd_work():

    drm_helper_hpd_irq_event(dp->bridge.dev);

And in dw_dp_link_retrain():

    struct drm_device *dev =3D dp->bridge.dev;
    ...
    ret =3D drm_modeset_lock(&dev->mode_config.connection_mutex, &ctx);

Since neither function checks if dp->bridge.dev is NULL, could a hotplug
event after encoder unbind cause a kernel panic here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-synopsys-d=
w-dp-improvements-v8-0-ac1e6a75782f@collabora.com?part=3D8

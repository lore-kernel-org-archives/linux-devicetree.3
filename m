Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F2738DC53
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 17:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786037830; cv=none; b=lCnjDXB8cYmJro7i8op99xKKGvbaCq6cVMv0CYL/u0RR5BStzG7/gM440PWTEkXK3uNGsO4LvaqlLAe37qB95NovWvyvGwj0u/kaHWgOdPIaAsp1GK/wIcRs21ZDygbtGuiRIo+WtSGGpfrS31fDr7bjit28ytP0m+fk7Xb5ouY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786037830; c=relaxed/simple;
	bh=ajFTTFSMUJZlQWiGHLjTj595YZ01BH+Bm9rq17PxoHI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bMZyaja1wXeCPUHcQpDuk4MVOOgQnQsv41Ck30W2R0MjCsX96cRC0Gine3yH2JZ16VbLMgrogWp+9yD512NVnSZsu2h2A5gLWLuAMEDI7prd6B7Q2WJq94njbDQqkqfaU09andybFswqqxYwI6LIK95zw2HXL+KQ4N3ChZrXGaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmjT6ABk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmjT6ABk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E821F00A3E;
	Thu,  6 Aug 2026 17:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786037829;
	bh=/AmSBg+bSlHudXnKp0obu5ljE24U7DbCHe6qNShJI7c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gmjT6ABkxnj7zPhlY3vOj5BNCmR5bBeuToPnh9lV16fv5n9fwHWzoIWwbjckMTrSA
	 mjC+TiNnDuzrdK7uhfXTaoa4/YvBXluHHvCPFUlH9TUAT1al5uqTtufRgMpEO6jJeZ
	 60CvSEO7lf7JeTUBcfKmsz29mJvWkfrkCaiCt5LNku+pq6mI4V6rN/HE7PVICBe/nI
	 dMYhUIspY8a3VMCTYPAGrz+CaR6HXHtIEw27O3+8yrMXbyZQP32981oDPxAs901rZ/
	 pKANyj2DpN1EB5VMISA1RwbZze+jtq9n1oZVMoF3krPX1XVa0w+q8n2i1JQI6cTSp0
	 HMCI5Jh/Kkv2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 01/21] drm/bridge: synopsys: dw-dp: Register DP AUX
 on bridge attach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-1-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v11-1-0d508505f383@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 17:37:07 +0000
Message-Id: <20260806173708.71E821F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Moving `drm_dp_aux_unregister()` to the `.detach` bridge hook intr=
oduces a use-after-free vulnerability during driver unbind.

Pre-existing issues:
- [High] Using `devm_` APIs inside the component `bind` callback causes res=
ource leaks and permanent probe failures if the aggregate device defers pro=
bing.
- [High] Missing `reinit_completion()` in `dw_dp_aux_transfer()` leads to p=
ermanent completion desynchronization after an initial timeout.
- [High] Missing cancellation of `dp->hpd_work` during unbind/remove leads =
to a Use-After-Free if a hotplug interrupt arrives just before the module i=
s unloaded.
--

--- Patch [1]: [PATCH v11 01/21] drm/bridge: synopsys: dw-dp: Register DP A=
UX on bridge attach ---
commit c6879b7a6958b5129284c9fb809eb29af0d93f7c
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Register DP AUX on bridge attach
   =20
This commit delays the registration of the DP AUX device until the bridge
is attached, and unregisters it in the detach hook. This helps ensure that
it is only accessed when the DRM device is ready.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 8b8529e1723c8..60feb3d1e14bb 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c

[ ... ]

> @@ -1813,7 +1813,36 @@ static struct drm_bridge_state *dw_dp_bridge_atomi=
c_duplicate_state(struct drm_b
>  	return &state->base;
>  }
> =20
> +static int dw_dp_bridge_attach(struct drm_bridge *bridge,
> +			       struct drm_encoder *encoder,
> +			       enum drm_bridge_attach_flags flags)
> +{
> +	struct dw_dp *dp =3D bridge_to_dp(bridge);
> +	struct device *dev =3D dp->dev;
> +	int ret;
> +
> +	dp->aux.dev =3D dev;
> +	dp->aux.drm_dev =3D encoder->dev;
> +	dp->aux.name =3D dev_name(dev);
> +	dp->aux.transfer =3D dw_dp_aux_transfer;

[Severity: High]
This is a pre-existing issue, but does dw_dp_aux_transfer() permanently
desynchronize after a single timeout?

If an AUX transaction times out, wait_for_completion_timeout() returns
and dp->complete.done remains 0. When the late hardware interrupt
eventually arrives, dw_dp_irq() calls complete(), setting done to 1.

Since dw_dp_aux_transfer() lacks a preceding call to reinit_completion(),
the very next AUX transfer will immediately succeed the wait without actual=
ly
waiting for the hardware, leading to premature reads of DW_DP_AUX_STATUS.

> +
> +	ret =3D drm_dp_aux_register(&dp->aux);
> +	if (ret)
> +		dev_err(dev, "Aux register failed: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static void dw_dp_bridge_detach(struct drm_bridge *bridge)
> +{
> +	struct dw_dp *dp =3D bridge_to_dp(bridge);
> +
> +	drm_dp_aux_unregister(&dp->aux);

[Severity: High]
Will moving drm_dp_aux_unregister() to the bridge detach hook cause a
use-after-free if userspace keeps the DRM device open?

If a process holds an open file descriptor for the DRM device while the
driver is unbound, the DRM device's refcount prevents the bridge's detach
hook from running immediately.

The component's memory (like the dp structure) will be freed by the driver
core during unbind, but the AUX char device remains registered. If userspace
then reads or writes to the AUX device, dw_dp_aux_transfer() will
dereference the freed memory.

> +}
> +

[ ... ]

> @@ -2064,37 +2083,33 @@ struct dw_dp *dw_dp_bind(struct device *dev, stru=
ct drm_encoder *encoder,
>  	ret =3D phy_init(dp->phy);
>  	if (ret) {
>  		dev_err_probe(dev, ret, "phy init failed\n");
> -		goto unregister_aux;
> +		return ERR_PTR(ret);
>  	}
> =20
>  	ret =3D devm_add_action_or_reset(dev, dw_dp_phy_exit, dp);
>  	if (ret)
> -		goto unregister_aux;
> +		return ERR_PTR(ret);
> =20
>  	dp->irq =3D platform_get_irq(pdev, 0);

[Severity: High]
This isn't a bug introduced by this patch, but can using devm_ APIs inside
the component bind callback cause resource leaks?

If the aggregate DRM device defers probing, the component framework undoes
the bind, but it does not release the devm_ resources because the component
device itself remains bound to its platform driver.

When the aggregate device retries probing, dw_dp_bind() allocates them
again. The calls to devm_request_threaded_irq() or
devm_platform_ioremap_resource() will fail with -EBUSY, permanently
preventing the pipeline from probing.

>  	if (dp->irq < 0) {
>  		ret =3D dp->irq;
> -		goto unregister_aux;
> +		return ERR_PTR(ret);
>  	}
> =20
>  	ret =3D devm_request_threaded_irq(dev, dp->irq, NULL, dw_dp_irq,

[ ... ]

> @@ -2101,8 +2112,8 @@ EXPORT_SYMBOL_GPL(dw_dp_bind);
> =20
>  void dw_dp_unbind(struct dw_dp *dp)
>  {
> -	drm_dp_aux_unregister(&dp->aux);
> +	/* nothing to do */
>  }

[Severity: High]
This is a pre-existing issue, but is it possible for an HPD interrupt to
race with module unload?

If an HPD interrupt triggers and schedules dp->hpd_work just before the
driver is unbound, the global workqueue may execute dw_dp_hpd_work() after
the devm_ cleanup path frees the dp structure.

Does dw_dp_unbind() need a call to cancel_work_sync(&dp->hpd_work) to
prevent a use-after-free?

>  EXPORT_SYMBOL_GPL(dw_dp_unbind);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-synopsys-d=
w-dp-improvements-v11-0-0d508505f383@collabora.com?part=3D1

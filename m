Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02363B6BF5
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 15:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785511019; cv=none; b=PS9l0tIZ88au+vjMojSA+UIKalU6F5H9IfGx97W8YDQbDw8vK0QTMckON1DMjBuNJnj7UbRHe79zY2in/Opf0XYdBlFwY16wfk28uCbw79NotxLvm6eHI5uWxpeOLegrd3NnqnBIPvap822f72fOeLtyrTCooZEJ8wj6qISfiL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785511019; c=relaxed/simple;
	bh=FKnzD/ZggcrXm3sAZrv/kQfebM8o5g/l0ucA1HvYDCs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rVSGpwn4c7teEeL3OlIOlWNLILzI8xi0O5PJUmI2rGrdnvnGV2wPD+stNJ76s7X4ioAnjg19chPuZhLaA3eX/LmyHZnMAd1puIfTP01ogFhS503+zkzEGgO4S4Q2IAsZy6wSFq6d9bU/BfSbFb+xw9+fCGvO3Ua/AT5FVKf80/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K33G9FuQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K33G9FuQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F301F000E9;
	Fri, 31 Jul 2026 15:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785511015;
	bh=mKwmZWaVlLAyg2w+cN3djUCsX40X0Lbtl9xxIx11Ebo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K33G9FuQf6NktQX/r1G82IDkk+KyI4OnqfY75ZbDMFqFQoUjB5HpAVS2BGsSgY7cI
	 KNyEDbQOYW0GcZK04EmT1M36b5ybG/rQGHVfDeZKCPdD80wFQRcKNf5zrgxYaViQaR
	 xD/arAE4L4hZw+4Rh7KRIxkzYFG2EEFMaAV863k/OMyYzf2Z8yhbztgbJyNIURTLtc
	 isMy4RNi4vbzp/5t80Hp/kiQdiD/YqVpr7nzJVU+hXAUOygHiveeBxoLAmXq8GrCie
	 djUa7LfwCFs+UgFoKAdrc3NRNF99hrM5SRHeAXXHFZ/sc4ZgfHneZaZrn6R0FpfchD
	 bQkP3qR1jMUpQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 02/21] drm/bridge: synopsys: dw-dp: Fix incorrect
 resource lifetimes in bind callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260731-synopsys-dw-dp-improvements-v8-2-ac1e6a75782f@collabora.com>
References: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
 <20260731-synopsys-dw-dp-improvements-v8-2-ac1e6a75782f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 15:16:55 +0000
Message-Id: <20260731151655.95F301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Moving IRQ registration and hardware initialization to probe creat=
es a window where an HPD interrupt causes a NULL pointer dereference on `dp=
->bridge.dev`.

Pre-existing issues:
- [Critical] Use-After-Free of the `dp` structure due to uncancelled `hpd_w=
ork` on driver removal.
--

--- Patch [2]: [PATCH v8 02/21] drm/bridge: synopsys: dw-dp: Fix incorrect =
resource lifetimes in bind callback ---
commit 9de3c09754cbe88e934e9c5f4adf581795df6d41
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Fix incorrect resource lifetimes in bind callb=
ack

Currently the Synopsys DesignWare DP controller driver's bind function
requests lots of resources using device managed functions. These are
free'd on driver removal instead of at unbind time. Fix this discrepancy
by introducing a new probe helper function and moving over the whole
bind function.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 112a499113095..7f82495141711 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c

[ ... ]

> @@ -2091,11 +2094,19 @@ struct dw_dp *dw_dp_bind(struct device *dev, stru=
ct drm_encoder *encoder,
>  	if (ret)
>  		return ERR_PTR(ret);
> =20
> -	dp->irq =3D platform_get_irq(pdev, 0);
> -	if (dp->irq < 0) {
> -		ret =3D dp->irq;
> +	bridge =3D &dp->bridge;
> +	bridge->of_node =3D dev->of_node;
> +	bridge->ops =3D DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_=
OP_HPD;
> +	bridge->type =3D DRM_MODE_CONNECTOR_DisplayPort;
> +	bridge->ycbcr_420_allowed =3D true;
> +
> +	ret =3D devm_drm_bridge_add(dev, bridge);
> +	if (ret)
>  		return ERR_PTR(ret);
> -	}
> +
> +	dp->irq =3D platform_get_irq(pdev, 0);
> +	if (dp->irq < 0)
> +		return ERR_PTR(dp->irq);
> =20
>  	ret =3D devm_request_threaded_irq(dev, dp->irq, NULL, dw_dp_irq,
>  					IRQF_ONESHOT, dev_name(dev), dp);

[Severity: High]
Can this IRQ registration create a window for a NULL pointer dereference?

If a monitor is connected, the HPD interrupt can fire immediately after
devm_request_threaded_irq() completes in dw_dp_probe(). The interrupt handl=
er
schedules dw_dp_hpd_work(), which directly dereferences dp->bridge.dev:

dw_dp_hpd_work()
   drm_helper_hpd_irq_event(dp->bridge.dev);

Since the component bind hasn't run yet, drm_bridge_attach() hasn't been
called to assign dp->bridge.dev. Could this cause dw_dp_hpd_work() to
dereference a NULL pointer if an interrupt fires before the bridge is
attached?

> diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/=
rockchip/dw_dp-rockchip.c
> index b23efb153c9e6..005938dc66c9f 100644
> --- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c

[ ... ]

> @@ -128,12 +119,30 @@ static const struct component_ops dw_dp_rockchip_co=
mponent_ops =3D {
>  	.unbind =3D dw_dp_rockchip_unbind,
>  };
> =20
> -static int dw_dp_probe(struct platform_device *pdev)
> +static int dw_dp_rockchip_probe(struct platform_device *pdev)
>  {

[ ... ]

>  }
> =20
> -static void dw_dp_remove(struct platform_device *pdev)
> +static void dw_dp_rockchip_remove(struct platform_device *pdev)
>  {
>  	component_del(&pdev->dev, &dw_dp_rockchip_component_ops);
>  }

[Severity: Critical]
This is a pre-existing issue, but does this remove function leave a pending
work item that can cause a use-after-free?

Since there is no explicit cancel_work_sync(&dp->hpd_work) before the driver
exits dw_dp_rockchip_remove(), if an HPD interrupt fires right before remov=
al,
the scheduled dw_dp_hpd_work() might remain on the system workqueue.

The devm cleanup runs after this function returns, freeing the IRQ and the =
dp
structure. If the work executes after dp is freed, it will access freed mem=
ory
when it runs container_of(work, struct dw_dp, hpd_work).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-synopsys-d=
w-dp-improvements-v8-0-ac1e6a75782f@collabora.com?part=3D2

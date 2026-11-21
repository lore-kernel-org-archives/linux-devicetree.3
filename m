Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289825;
	b=2yn3CMKz7/KUCRjJMaoTrogJKVkpIq5zJmCT7ir/Ni1NF7OLkimnH+dPZsvW1MCtXvK+
	 HNAoU3YAb1/aYKMZ042/NkMR1069S+Lbt9B/6WGj2w2lEzvo03z0rTGwZxenLLdaWCcQ7
	 IXbVRRz97gz2dZkCcmhVJA6CgWdHfYnufqqUk464wRZigwVpmI6ayWt/H6GblEEp1a/1A
	 j0luGvMD4ISvlhEjLMkajfUvytTthO3HtC2sSbG5nK9cfcpA3qof/+r05vV6BHzaKiwhd
	 PvAINu5+Dx5omBPON4LM44mpYXJfTkp3G3jym8zR5tctPrjlM0fqL2AFs9ECZWcH3Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289825;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RUCRU0qWPwd9+EyyfY16haNQPZ3FbjyQHzlUswnyoQY=;
	b=q1fcHGECGApKbWYkLA6K6exS9RCxR3+PQYCHx/dTzmgNySAMbh14SBaQPzpt27+2LiwY
	 ZyZ6+qQrxx56BH9IizHxhib9vRptaL9Mgu7A8QEWb51Aaf7CFnOUdqA4JBo1/qHNvVUZh
	 /9L0dLe5x3vhRfNJVLgaln5NNAYrHZtctuYbI03ORyiFxCsJODvlRCsEXOkyRPhrUp1m6
	 9W//I13d09TyF2RTmAd5eIQuGj6qOFdVEo1TPkX4AeigrL7QpRdWT/EOZV3E0RRFiXNyA
	 KezlD3eEb87/gtnkGztg2sAR6jNHmcOEM5ctiT8oIl9xb51EPvideHyoPRAQyes3QbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jBnZFc4T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43080606A330
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 19:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jBnZFc4T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C131F000CA;
	Sat, 21 Nov 2026 19:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795289824;
	bh=RUCRU0qWPwd9+EyyfY16haNQPZ3FbjyQHzlUswnyoQY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jBnZFc4T25mKhKzRF51L0ARaNmifquHlYUfXu+6Pckl7yqVItvl/wIhmsyoML88x/
	 bH6wn7W1K1geyIMI/C0+i6OFLPJptfGvBzebRs/0Erwl/UTOxkb3tPtKZ0YrY4TYBg
	 bu682nTNBmtKIJckPk6EcrJJiIHLLLfPoJ/MHYg0WNviBEEDmvCYFruHzC1cvgUQd+
	 4lUJmJ7wuD8KdytF/wP0MRwgUzhv2tXyAKIlKVpXau+7AequW6YAnSUnvrCSQyn4Gz
	 brKH0BIIFTeTtpcDzp8ORBLndFGSMjDcne0d0cA+78axKQv6SoG7x6wCbMVkJgv/DH
	 f9yoyb9u9DwLQ==
Message-ID: <sashiko-outbox-227314@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/11] drm/meson: dw-hdmi: Use the generic PHY
 framework for the HDMI TX PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20261121-meson-drm-create-hdmitx-phy-v3-8-f8f471788076@aliel.fr>
References: <20261121-meson-drm-create-hdmitx-phy-v3-0-f8f471788076@aliel.fr>
 <20261121-meson-drm-create-hdmitx-phy-v3-8-f8f471788076@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 19:37:03 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] drm/meson: dw-hdmi: invalid phy_destroy() in
  meson_dw_hdmi_bind() error path
- [Medium] drm/meson: dw-hdmi: stateless device link leaked in
  meson_dw_hdmi_unbind()
- [Medium] drm/meson: dw-hdmi: meson_venc_init() clobbers PHY CNTL0 on
  system resume
--

commit 60b745dc55898638b05c8fcafed9d3683b30dff0
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

drm/meson: dw-hdmi: Use the generic PHY framework for the HDMI TX PHY

This commit converts the Meson DW-HDMI glue driver to manage the HDMI TX
PHY through the generic PHY framework, with a legacy fallback when the
device tree lacks a "phys" property, and adds a stateless device link
between the VPU master and HDMI-TX device.

> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meso=
n/meson_dw_hdmi.c
> index 20a821936b3af..8fdb997c28b40 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c

[ ... ]

> @@ -746,7 +663,26 @@ static int meson_dw_hdmi_bind(struct device *dev, st=
ruct device *master,
>  		return ret;
>  	}
> =20
> -	meson_dw_hdmi_init(meson_dw_hdmi);
> +	meson_dw_hdmi->phy =3D devm_phy_optional_get(dev, NULL);
> +	if (IS_ERR(meson_dw_hdmi->phy))
> +		return dev_err_probe(dev, PTR_ERR(meson_dw_hdmi->phy),
> +				     "failed to get HDMI PHY\n");
> +
> +	if (!meson_dw_hdmi->phy) {
> +		/* DEPRECATED: DT without "phys" */
> +		dev_warn(dev, "missing \"phys\", using legacy HDMI PHY\n");
> +		meson_dw_hdmi->phy =3D meson_hdmi_phy_create_legacy(dev, priv->hhi,
> +						meson_dw_hdmi->data->phy_soc);
> +		if (IS_ERR(meson_dw_hdmi->phy))
> +			return dev_err_probe(dev, PTR_ERR(meson_dw_hdmi->phy),
> +					     "failed to create legacy HDMI PHY\n");
> +
> +		meson_dw_hdmi->legacy_phy =3D true;
> +	}
> +
> +	ret =3D meson_dw_hdmi_init(meson_dw_hdmi);
> +	if (ret)
> +		return ret;
> =20
>  	/* Bridge / Connector */
> =20
> @@ -767,14 +703,26 @@ static int meson_dw_hdmi_bind(struct device *dev, s=
truct device *master,
>  	platform_set_drvdata(pdev, meson_dw_hdmi);
> =20
>  	meson_dw_hdmi->hdmi =3D dw_hdmi_probe(pdev, &meson_dw_hdmi->dw_plat_dat=
a);
> -	if (IS_ERR(meson_dw_hdmi->hdmi))
> -		return PTR_ERR(meson_dw_hdmi->hdmi);
> +	if (IS_ERR(meson_dw_hdmi->hdmi)) {
> +		ret =3D PTR_ERR(meson_dw_hdmi->hdmi);
> +		goto err_hdmi_probe;
> +	}
> =20
>  	meson_dw_hdmi->bridge =3D of_drm_find_and_get_bridge(pdev->dev.of_node);
> =20
> +	link =3D device_link_add(master, dev, DL_FLAG_STATELESS);
> +	if (!link)
> +		dev_warn(dev, "failed to link HDMI (supplier) to DRM master (consumer)=
\n");
> +
>  	DRM_DEBUG_DRIVER("HDMI controller initialized\n");
> =20
>  	return 0;
> +
> +err_hdmi_probe:
> +	phy_exit(meson_dw_hdmi->phy);
> +	phy_destroy(meson_dw_hdmi->phy);
> +
> +	return ret;
>  }

[Severity: High]
Does calling phy_destroy(meson_dw_hdmi->phy) in err_hdmi_probe cause a
double free or destroy the external provider's PHY when dw_hdmi_probe()
fails (for example with -EPROBE_DEFER)?

Both devm_phy_optional_get() and meson_hdmi_phy_create_legacy() (which
uses devm_phy_create()) are devres-managed in the component devres group
that component_bind() releases on bind failure.  When legacy_phy is
false, meson_dw_hdmi is only a consumer, so phy_destroy() unregisters
the external PHY provider's device while the provider remains bound.
When legacy_phy is true, component_bind() immediately runs
devm_phy_consume() -> phy_destroy() a second time on the already-freed
phy.

Dropping phy_destroy() from err_hdmi_probe and leaving the cleanup to
component_bind()'s devres release avoids both issues.

> =20
>  static void meson_dw_hdmi_unbind(struct device *dev, struct device *mast=
er,
> @@ -786,6 +734,10 @@ static void meson_dw_hdmi_unbind(struct device *dev,=
 struct device *master,
> =20
>  	devm_free_irq(dev, irq, meson_dw_hdmi);
>  	dw_hdmi_unbind(meson_dw_hdmi->hdmi);
> +
> +	phy_exit(meson_dw_hdmi->phy);
> +	if (meson_dw_hdmi->legacy_phy)
> +		devm_phy_destroy(dev, meson_dw_hdmi->phy);
>  	drm_bridge_put(meson_dw_hdmi->bridge);
>  }

[Severity: Medium]
Does meson_dw_hdmi_unbind() leak the DL_FLAG_STATELESS device link
created in meson_dw_hdmi_bind()?  Stateless device links are not removed
automatically by the driver core on unbind and require an explicit
device_link_remove(master, dev) or device_link_del().

> @@ -801,6 +753,8 @@ static int __maybe_unused meson_dw_hdmi_pm_suspend(st=
ruct device *dev)
>  	if (!meson_dw_hdmi)
>  		return 0;
> =20
> +	phy_exit(meson_dw_hdmi->phy);
> +
>  	/* Reset TOP */
>  	meson_dw_hdmi->data->top_write(meson_dw_hdmi,
>  				       HDMITX_TOP_SW_RESET, 0);
> @@ -811,11 +765,14 @@ static int __maybe_unused meson_dw_hdmi_pm_suspend(=
struct device *dev)
>  static int __maybe_unused meson_dw_hdmi_pm_resume(struct device *dev)
>  {
>  	struct meson_dw_hdmi *meson_dw_hdmi =3D dev_get_drvdata(dev);
> +	int ret;
> =20
>  	if (!meson_dw_hdmi)
>  		return 0;
> =20
> -	meson_dw_hdmi_init(meson_dw_hdmi);
> +	ret =3D meson_dw_hdmi_init(meson_dw_hdmi);
> +	if (ret)
> +		return ret;
> =20
>  	dw_hdmi_resume(meson_dw_hdmi->hdmi);

[Severity: Medium]
With the new device link ordering dev (supplier) to resume before master
(consumer), will meson_drv_pm_resume() -> meson_venc_init() clobber
HHI_HDMI_PHY_CNTL0 after meson_dw_hdmi_pm_resume() has initialized the
PHY?

drivers/gpu/drm/meson/meson_venc.c:meson_venc_init() {
	...
	/* Disable HDMI PHY */
	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0, 0);
	...
}

meson_dw_hdmi_init() calls phy_init(), which programs HHI_HDMI_PHY_CNTL0
to cntl0_init (0x000b4242 on G12A for the bandgap).  When the consumer
meson_drv_pm_resume() runs next, meson_venc_init() overwrites
HHI_HDMI_PHY_CNTL0 with 0, leaving the G12A bandgap disabled whenever no
HDMI mode is active across suspend and resume.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121-meson-drm-=
create-hdmitx-phy-v3-0-f8f471788076@aliel.fr?part=3D8

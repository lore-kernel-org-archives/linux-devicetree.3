Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795039510;
	b=Bs/mZwjP4OzxHIA5BnIbwL1eAPEiytDRM965fQQv1oN1EtTScbSQzuBUWwEgL/xCNuT+
	 io3Y6OkaEEzQPINPoMLOUlcduhvJmw89iOJirwJNvF4ys9lPqwZ8E7Ka7mQUi6pgne4IZ
	 95rhuVilH0dNMMsoXv1dcoSDDDvn7nq1FUDPQmmO0m2sAmeeqUl3YkvEcd41cS4/jqctZ
	 RfFyOAVg2CqyfWtNVCAX7jQDmA1wNeNP18xQrv9dp+7E/mh518xpJySKJEunMbzJDjkl9
	 NmZ1WjGt84iTExcCNlEE2L3wqqrZ3BJTlawHJgKapATEce+3kpEJHUl//MO5uxPu2pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795039510;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IIc7twuSMCJv49qBEXa12fA8LCRjjiEJYGjYVZZI3g0=;
	b=OVvN351sXeXPm75YBTgyKH0NQT7EFa6EhjJlwPb3CUCSgpyZRSun2lcBKfdUF3i5dk1N
	 q70HxpRELcx1qmB5tCT7UwDZEwrwi9XvFqivSAwACTVg8xpT+9Oi8L1npfnEstXYikVbp
	 sMa7v2PXtTTVAT92pwJvyicNqKvDOlJ4hEGTirQlv3L4JWOrVEx/+l4nLkZmO2wFlSfRa
	 FEmcmp2BS1wIvJ2dNbNHwsB5ttD2xs8UnITDv8sZblrODvSws4CGPVHmV1hUbH1GymLzU
	 NktuDN8jSFXFB3TXpejDKEmlYlBVCDU9eKJONHnInA/wz/usGJKIZUAm8sTHDFdkeNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a4+pnCC3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78F7606A32C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 22:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a4+pnCC3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2889E1F000C5;
	Wed, 18 Nov 2026 22:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795039510;
	bh=IIc7twuSMCJv49qBEXa12fA8LCRjjiEJYGjYVZZI3g0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a4+pnCC3TuAFJpo3h2GSSm3wcQTgfQzuIVfbGlJ0vrmmEl/30RoX7w/MF1p36uYAA
	 j51sW1MiwaBfd8F4qhlBIqCeXmD/JPfSaii2iXvgQPoDf8j+pYGs/HJtcT/JVWc2ms
	 0xmWVHiD/nX1zF4GXHsRxR8NrL3B+8/DJATDLXR+C2O2PZMLtNMpEv0JAL/D5w27gH
	 20P0ife+RKf3NI5WkvmY6gWXR+cpmjNo2AH/K/yGaJdFKvHco4XS7fJJNnzkt7FFgG
	 eutNRV4U1VrGqQ7mUf+09HuHqbPm8aXKquUV07HYM3FwwgHoUo3fhn2fvaaVVE9iOT
	 5pCDxCPcihjDg==
Message-ID: <sashiko-outbox-222076@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] drm/bridge: synopsys: dw-hdmi-qp: Attach the next
 bridge in the chain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joachim Eastwood" <joachim.eastwood@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-dw-hdmi-qp-bridge_attach-v1-2-e370920bc7f3@gmail.com>
References: <20261118-dw-hdmi-qp-bridge_attach-v1-0-e370920bc7f3@gmail.com>
 <20261118-dw-hdmi-qp-bridge_attach-v1-2-e370920bc7f3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 22:05:09 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/bridge: dw-hdmi-qp: missing DRM_DISPLAY_CONNECTOR Kconfig
  select
--

commit 2fdd511539969260584719b2d1604f9b1b9ed26e
Author: Joachim Eastwood <joachim.eastwood@gmail.com>

drm/bridge: synopsys: dw-hdmi-qp: Attach the next bridge in the chain

This commit implements drm_bridge_funcs.attach for dw-hdmi-qp to look up and
attach the next bridge connected to output port 1.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/d=
rm/bridge/synopsys/dw-hdmi-qp.c
> index eed249aca1e23..200229e5d9afc 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
[ ... ]
> @@ -1024,7 +1028,33 @@ static void dw_hdmi_qp_bridge_hpd_disable(struct d=
rm_bridge *bridge)
>  		hdmi->phy.ops->disable_hpd(hdmi, hdmi->phy.data);
>  }
> =20
> +static int dw_hdmi_qp_bridge_attach(struct drm_bridge *bridge,
> +				    struct drm_encoder *encoder,
> +				    enum drm_bridge_attach_flags flags)
> +{
> +	struct dw_hdmi_qp *hdmi =3D bridge->driver_private;
> +	struct device_node *remote __free(device_node) =3D
> +		of_graph_get_remote_node(hdmi->dev->of_node,
> +					 DW_HDMI_QP_OUTPUT_PORT, -1);
> +
> +	/*
> +	 * The HDMI connector node is optional. When present, chain its bridge
> +	 * so that properties such as ddc-i2c-bus, hpd-gpios and supplies are
> +	 * honoured by the DRM bridge connector.
> +	 */
> +	if (!remote)
> +		return 0;
> +
> +	struct drm_bridge *next_bridge __free(drm_bridge_put) =3D
> +		of_drm_find_and_get_bridge(remote);
> +	if (!next_bridge)
> +		return -EPROBE_DEFER;

[Severity: High]
Should DRM_DW_HDMI_QP (or ROCKCHIP_DW_HDMI_QP) select DRM_DISPLAY_CONNECTOR
in Kconfig?

All in-tree RK3576 and RK3588 board device trees wire port 1 to an
"hdmi-connector" node, which is handled by display-connector.c under
CONFIG_DRM_DISPLAY_CONNECTOR.  Neither DRM_DW_HDMI_QP nor
ROCKCHIP_DW_HDMI_QP selects DRM_DISPLAY_CONNECTOR, so configs that previous=
ly
worked without it will now have of_drm_find_and_get_bridge() return NULL and
defer probe forever, preventing rockchip_drm_bind() from binding the display
subsystem.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-dw-hdmi-qp=
-bridge_attach-v1-0-e370920bc7f3@gmail.com?part=3D2

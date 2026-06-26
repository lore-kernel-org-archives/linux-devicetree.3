Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012573BF660
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 21:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782508487; cv=none; b=Ps2HTXbR/eZe6ut3w1lJrsAZk4Sqd3DAIjqN7sxtiCTVNvmxUE1TxpZyGx9qPNrGfE06e717JmhCAahv1E/DF/8O3VP4U0gPFKBFEcm1oQVcz8EBruBz9riAkVIyoglEn9weH7yTNb2TWkAnVL7KmsJzzitJcT1k4tTMe5vXt+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782508487; c=relaxed/simple;
	bh=ey28x3LJxjePfXMA1pE7g6sAY7eOKqf52VHAHV2l2TY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cg1uLE0mHd+VjrIs4cJW44mHoPm1I+WOvkjN7DJxGn2zEYhsHWcj3ZpmbUhhxHuHtNcwOvyv2bNoqfb0297VCrGQ4t89Fm7FW/WoPd1wKSUOXLU3vnSUTxTATjZdz6amRJgYGj/S29M7wVjpdWkMI+MtZ296GVe1Kz6UzSpQN3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VKrmGjth; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKrmGjth"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1151F000E9;
	Fri, 26 Jun 2026 21:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782508485;
	bh=4+e1r8jT3JogeYU9rX54CBUZqrxvMgDlNyHi9c2oDvQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VKrmGjthw1uLeVaz1HPGCR+WPOxvJAsNxPC+YScDKfvSwxu248W3kP+IXTOjpk30Y
	 0hwC+SvRYKaG49pRzzgQPsrreIhBCNXve+0lgjCb1ecobp2CCgkxw1TtRLW2yKAv3Z
	 pREdaU3MCvn5/HFfu2LgAZrZbIgIXnO5X3DtN/22prH7fJFUDKEFUErlt1Ds3mODDW
	 O+wJhG8L4IPSilF2z9v8mp3XnYi+SXQlzdSTnYfSoUFYNCtB8HPapYK02GGTnDd19/
	 7jqE4zbyHkVqAXX55TGD1UBLtBooPWgpag9RoOG8BDdd2ixVpKfUeeVZkiFxG+RRg3
	 aAEU0IwoI0H1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 17/29] phy: rockchip: usbdp: Register DP aux bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-17-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
 <20260626-rockchip-usbdp-cleanup-v8-17-47f682987895@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 21:14:44 +0000
Message-Id: <20260626211445.1D1151F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm_aux_bridge_register() is incompatible with the rockchip-usbdp =
PHY topology, breaking the DP bridge chain when USB and DP ports are split.
--

commit 70d2ba94c5da680bd420eb74b5cffb26d6fad15d
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
phy: rockchip: usbdp: Register DP aux bridge

This patch adds support to register a DRM auxiliary bridge if the DP
aux channel is connected. This enables DP altmode helper code on
devicetree based platforms.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index e243d92483e09..a204699619b80 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
[ ... ]
> @@ -1505,6 +1507,18 @@ static int rk_udphy_probe(struct platform_device *=
pdev)
>  			return ret;
>  	}
> =20
> +	/*
> +	 * Only register the DRM bridge, if the DP aux channel is connected.
> +	 * Some boards use the USBDP PHY only for its USB3 capabilities.
> +	 */
> +	dp_aux_ep =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 3, 0, 0);
> +	if (dp_aux_ep) {
> +		ret =3D drm_aux_bridge_register(dev);

[Severity: High]
Since the PHY detects the DP connector on port 3, is the call to
drm_aux_bridge_register() compatible with this topology?

Looking at how the auxiliary bridge driver probes in
drivers/gpu/drm/bridge/aux-bridge.c, it hardcodes the downstream bridge
lookup to port 0:

drm_aux_bridge_probe()
  data->next_bridge =3D devm_drm_of_get_bridge(..., 0, 0);

If port 0 (the USB output) is unconnected or connected to a non-DRM
component, will devm_drm_of_get_bridge() return an error like -ENODEV?
This looks like it would cause the aux bridge probe to fail, breaking the
DP chain and leaving the DP controller waiting indefinitely with
-EPROBE_DEFER, unless both port 0 and port 3 happen to point to the exact
same connector node.

> +		fwnode_handle_put(dp_aux_ep);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	udphy->phy_u3 =3D devm_phy_create(dev, dev->of_node, &rk_udphy_usb3_phy=
_ops);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626-rockchip-u=
sbdp-cleanup-v8-0-47f682987895@collabora.com?part=3D17

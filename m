Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE59B3A6B68
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 08:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698889; cv=none; b=rtZnLVWly/LAlFZIZy4tazzCwJoYOv1RlnxquCduEyMsxEU5fCPPRpElPMCcrE4I50i8HStkrCGue0Tl2WlOC9PdwHdFJcomysKac1azns/OSTjGUhN/dvpEStIkoDdmZQnaliLkDtig43Vj171fxuEEi+fHSUMnKpEbFcsw1gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698889; c=relaxed/simple;
	bh=FOwXCnWbHcx6UHhHIBi33U2geRYPxqghh1IHxCmGHMo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BSxK2khAh8BCEBZq+ExIK15Bjj0wCvSJqQ7BtHpM/V6eklRvg/DKLGi3lfbIUy/dUd0Ss9S3VDxZEdGEzRrwDF2lGr2R65SvTOiBGPld3eBwcVOt6ta/ZXpc9v8fRGjKM0U3L+dOlS/tvbIabjf97u1WMOVrkSYWMv+bIcHykTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JjXmUag2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JjXmUag2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 292061F000E9;
	Mon, 25 May 2026 08:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779698888;
	bh=pkKxIjlj2rwzL7EHRmvP7j28JN+SQat/w8cn2extqwE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JjXmUag2pTBRMHzzWvkZ5lGjcJRmQoOUyOTqYgu4feDGtqsTSKz5YM/kH/g9lL8z4
	 FHusexnYz078IQR8r+dOJYizGrjm4rNh1qwFiNbZX9ZZssVelIZyoEfKX6JYkXeNws
	 i51SjUavcmEg63CLkE2CcIzJ0Ae59+CVysbMFGwIwSeLptFZdyO3CVCseQukMu/kO2
	 GGKvik56BDBYK+yGsYgvKmSvIM5KbH0yGYLCblvcuUlwj9JnlvvlBz63TQ6iTTIOC4
	 nggJ04G/b96Bl0nt7dQerJiCuTjvdQ9R/wnVru2ELybacTaZq/VCIY/X8w2rkhyFl9
	 9VFnUy5ezDxCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/10] drm/rockchip: analogix_dp: Enable hclk for
 RK3588
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260525082033.117569-6-damon.ding@rock-chips.com>
References: <20260525082033.117569-6-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 08:48:07 +0000
Message-Id: <20260525084808.292061F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Power and clock leak for 'hclk' during suspend and display power=
down.

Pre-existing issues:
- [Critical] Dangling pointer dereference / Use-After-Free via `endpoint.lo=
cal_node`.
--

commit 4b37db64b85dfb304df892e845f75e6e05adbfbe
Author: Damon Ding <damon.ding@rock-chips.com>

drm/rockchip: analogix_dp: Enable hclk for RK3588

This commit acquires and enables the HCLK_VO1 bus clock explicitly for
the RK3588 eDP controller. It fetches the optional hclk clock in the
driver probe to align with updated device tree bindings.

> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gp=
u/drm/rockchip/analogix_dp-rockchip.c
> index 06072efd7fca3..d2af5eb29dbb5 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c

[ ... ]

> @@ -327,6 +328,11 @@ static int rockchip_dp_of_probe(struct rockchip_dp_d=
evice *dp)
>  		return dev_err_probe(dev, PTR_ERR(dp->pclk),
>  				     "failed to get pclk property\n");
> =20
> +	clk =3D devm_clk_get_optional_enabled(dev, "hclk");
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "failed to get hclk property\n");
> +

[Severity: Medium]
Does this cause a clock leak during system suspend or when the eDP
controller is powered down?

Because hclk is acquired and enabled here but only stored in a local
variable, the driver has no way to reference it later to disable it
during suspend or powerdown.

Unlike pclk which is saved in the driver context and explicitly managed,
would leaving this clock permanently enabled prevent its parent power
domain from entering low-power states?

>  	dp->rst =3D devm_reset_control_get(dev, "dp");
>  	if (IS_ERR(dp->rst))

[ ... ]

[Severity: Critical]
This is a pre-existing issue, but can the usage of endpoint.local_node
in rockchip_dp_drm_encoder_enable() cause a use-after-free?

drm_of_encoder_active_endpoint() populates the of_endpoint structure,
setting endpoint.local_node to the endpoint node, but explicitly calls
of_node_put(ep) before returning. This drops the reference to the node.

When rockchip_dp_drm_encoder_enable() later passes this unreferenced
pointer to of_graph_get_remote_port_parent(), could this result in
dereferencing a dangling pointer if the node's reference count has
reached zero?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525082033.1175=
69-1-damon.ding@rock-chips.com?part=3D5

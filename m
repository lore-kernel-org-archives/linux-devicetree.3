Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB9B27B32C
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 18:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782411084; cv=none; b=EGimA/5IB0Wquh0vxcyqzM/nRQD979UwvqdBaIctsTQJqUsrbe6yNKLnYXCD/nb4m4/OWpdBt4Uk5ScBOumoWOSJD8n20iq+BKGYGEof+sAnwcRNYKyfOqeHzx0r3bgHbcyA/QtdcnhbF86nsbc36tmO3jWFVLuiyu3YS9mOrtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782411084; c=relaxed/simple;
	bh=KQ9Fqaqnh3HTGL05IQ7sRvhmb3PuL9n5lBLsJ3lC0Qg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iJ7b9Jbpnk2PYBEFhFfV5bCnTXuhJ2kuzC0bDl7gqQLlIJlBIzcr8WEWD58tE2uEnjejZBpHfQWECjwcR0ebSSYA1YFnCHGyGaIcErodIXQ6fp1pvBtqJgBvgINL8L8CsruCBJsmGnaxEogVrdtXog/m++EtXMcwZAZw30n4K2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8gLwM2h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8gLwM2h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BDB1F000E9;
	Thu, 25 Jun 2026 18:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782411082;
	bh=y5UPaOGHnpnYDmhc58eVJL+p1//zSIxO7jsVvb6HobA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d8gLwM2hhYVRilku9CANBerETGqeUst/4+ciXFkkjdT5WEZzWFQNIjv56s/r7bH7m
	 Nvu3p0suyQaagGX6TXkJuWCgqdCYKjKKCrF5aLQvXv88T+TzgwkWOLlr45FWHe5uV7
	 Oq5F1KufIF1KUipD0r23MiuKnge3D8/vg5R3pwQF0Qhgy8UjVuWpK5uNPnQshkevei
	 yHNQYKEGexNMa7aDonVXiAXe8GVywUAWqnrMD0aAIfK3xuya4NYX6JycYrKj1oft6V
	 VJLQo1Zmo73tXo22BPPVwm0xFgNDM9PIOzCRdYLbbzUbUGrMMyBK2aouJOUM8BTMVE
	 uKgfOg07yk3lA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 22/27] phy: rockchip: usbdp: Properly handle
 TYPEC_STATE_SAFE and TYPEC_STATE_USB
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: olteanv@gmail.com, robh@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-22-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
 <20260625-rockchip-usbdp-cleanup-v7-22-38eb3cf654fd@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 18:11:21 +0000
Message-Id: <20260625181122.43BDB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] A critical boolean logic error in `rk_udphy_typec_mux_set` incorre=
ctly uses logical OR (`||`), causing all valid Type-C events to be ignored =
and breaking the state machine.

Pre-existing issues:
- [High] NULL pointer dereference when handling non-DP accessory modes (lik=
e Audio Accessory) in Type-C mux drivers.
--

commit b36f3de7b0f44156b05e5cda72d2bdd174f98299
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Properly handle TYPEC_STATE_SAFE and TYPEC_STATE_USB

This patch handles TYPEC_STATE_SAFE and TYPEC_STATE_USB Type-C state events
so that the muxing is properly updated when exiting DP AltMode.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619155020.CC7361F000E9%40smtp.ke=
rnel.org

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 0bcaf54c5645d..0119b6229b0a9 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1329,11 +1329,12 @@ static int rk_udphy_typec_mux_set(struct typec_mu=
x_dev *mux,
>  	struct rk_udphy *udphy =3D typec_mux_get_drvdata(mux);
> =20
>  	/*
> -	 * Ignore mux events not involving DP AltMode, because
> -	 * the mode field is being reused, e.g. state->mode =3D=3D 4
> -	 * could be either TYPEC_MODE_USB4 or TYPEC_DP_STATE_C.
> +	 * Ignore mux events not involving Safe State, USB State or DP AltMode,
> +	 * because the mode field is being reused, e.g. state->mode =3D=3D 4 co=
uld
> +	 * be either TYPEC_MODE_USB4 or TYPEC_DP_STATE_C.
>  	 */
> -	if (!state->alt || state->alt->svid !=3D USB_TYPEC_DP_SID)
> +	if (state->mode >=3D TYPEC_STATE_MODAL || !state->alt ||
> +	    state->alt->svid !=3D USB_TYPEC_DP_SID)
>  		return 0;

[Severity: High]
Does this conditional unintentionally ignore all valid states by using
logical OR instead of logical AND?

If a DP AltMode event is passed, state->mode >=3D TYPEC_STATE_MODAL evaluat=
es
to true, causing an early return.=20

If a Safe State or USB State event is passed, state->alt is NULL, which also
causes an early return.=20

This appears to short-circuit and return 0 for all expected Type-C muxing
events, breaking the state machine.


[Severity: High]
This is a pre-existing issue, but can accessory modes trigger a NULL pointer
dereference in other Type-C mux drivers?

When the Type-C port is set to an accessory mode like TYPEC_MODE_AUDIO,
state->mode >=3D TYPEC_STATE_MODAL evaluates to true, but state->alt is
initialized to NULL.

In drivers/usb/typec/mux/it5205.c:it5205_mux_set():

	if (state->mode >=3D TYPEC_STATE_MODAL &&
	    state->alt->svid !=3D USB_TYPEC_DP_SID)
		return -EINVAL;

And similarly in drivers/usb/typec/mux/tusb1046.c:tusb1046_mux_set():

	if (state->mode >=3D TYPEC_STATE_MODAL &&
	    state->alt->svid !=3D USB_TYPEC_DP_SID)
		return -EINVAL;

Does this condition dereference state->alt without checking if it is NULL
when a non-DP modal device is plugged in?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-rockchip-u=
sbdp-cleanup-v7-0-38eb3cf654fd@collabora.com?part=3D22

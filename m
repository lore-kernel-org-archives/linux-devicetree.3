Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A3A3ED3A3
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 18:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782410402; cv=none; b=PALT/LRIGK8vFiLnwByGMf+SBiw16QtVArEr1A7vuNWXt4xR949ZiO+DinN/JbIJlAhSSXQRmgDL6KILRd9wj955t3zo2vu8k0alnpLhz1bA2VjrFVeSdJGB/BQ0ywOmbujyqrRZSb/hXWwVtprT+f+6/lJpCmZdICWXj2vuAfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782410402; c=relaxed/simple;
	bh=y7eLFLk86Jgl1c7g5lvgjHCJgN8D/MWjakI9BihzOOQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BZmJEeOpnYedGnGWFak+D94uvbCIWbiksDpTlit733S7+8MIOfsuxvervEomNjkYB6cQQTPZqYjFEaLIYNIUsRslHg9WNWLcmuZ1BvDb5fyDBKoSh3q260TcTpQAdz5pDfRV5+1O2Tmp8nOmbp36LqeOBq7GqHOpcWL8NxLxleQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oaLobpGk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oaLobpGk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5371F00A3D;
	Thu, 25 Jun 2026 18:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782410401;
	bh=7lPt1KiJ4zmpA0sseVXVB44Nt3j6qKXPo1V0g8v808I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oaLobpGkInkadCnM1IevKpQucfDvby3iPeBXqhqVv/Z2uNO4sBaNpkoj/GkiCXI34
	 due+Nied42wh8/gt5tud4X1GqKn8PYLGltTTTcb6gYYdKwJhV0M1vxFNaLnFY/sPhO
	 q9v/8GD2OFEKFwhdne/3W38DSWpdizhPaF3Qaml+iVDCo0hF9X3TaJ07XHP4BNoDal
	 APDKyQFca82Ws/piaiwoW0thcfTHM492NCZH75KPj3mzX1VQAQXF+1KoLT3/Hs3gm5
	 V2qHFmrM8cnMEhp1XorbN8TQ0qPMNiQaY0/088IjpqBCFuhkENXBp0Fve+P53lT/jE
	 0An97/0b5Qcfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 02/27] phy: rockchip: usbdp: Update mode_change after
 error handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, vkoul@kernel.org, robh@kernel.org
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-2-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
 <20260625-rockchip-usbdp-cleanup-v7-2-38eb3cf654fd@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 18:00:00 +0000
Message-Id: <20260625180000.CD5371F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Asynchronous mode changes orphan PHY status bits causing permanent=
 clock and PHY power leaks.
--

commit 1706823bf92c7aae72801ef7a1f3c4258e09e79e
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Update mode_change after error handling

This commit updates rk_udphy_power_on() to clear the mode_change flag
only after all potential errors have been handled. This ensures that
if initialization fails, the driver will correctly attempt to
reinitialize on the next try.

Closes: https://lore.kernel.org/linux-phy/20260612163835.8D5471F000E9@smtp.=
kernel.org/

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index fba35510d88ce..a5ffdf7a6e76b 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1000,15 +1000,14 @@ static int rk_udphy_power_on(struct rk_udphy *udp=
hy, u8 mode)
>  	}
> =20
>  	if (udphy->status =3D=3D UDPHY_MODE_NONE) {
> -		udphy->mode_change =3D false;
>  		ret =3D rk_udphy_setup(udphy);
>  		if (ret)
>  			return ret;
> =20
>  		if (udphy->mode & UDPHY_MODE_USB)
>  			rk_udphy_u3_port_disable(udphy, false);

[Severity: High]
This isn't a bug introduced by this patch, but could asynchronous mode
changes orphan PHY status bits here and cause permanent clock and power
leaks?

If a Type-C AltMode is negotiated that drops a previously available mode
(for example, dropping USB when transitioning to TYPEC_DP_STATE_C), the
Type-C mux callback in rk_udphy_typec_mux_set() updates the volatile
udphy->mode asynchronously:

    rk_udphy_set_typec_state(udphy, state->mode);

When the USB framework reacts and calls phy_exit(), rk_udphy_usb3_phy_exit()
checks the newly updated mode instead of the active status:

    if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
        return 0;

    rk_udphy_power_off(udphy, UDPHY_MODE_USB);

Because udphy->mode no longer contains the USB bit, the driver aborts early
without actually powering off the hardware.

Additionally, rk_udphy_power_off() itself redundantly checks udphy->mode:

    if (!(udphy->mode & mode)) {
        dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
        return;
    }

This leaves the active mode bit permanently orphaned in udphy->status,
which prevents rk_udphy_disable() from ever executing. Should the teardown
paths be validating against udphy->status instead of udphy->mode to avoid
this desynchronization?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-rockchip-u=
sbdp-cleanup-v7-0-38eb3cf654fd@collabora.com?part=3D2

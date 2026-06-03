Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A49399CF2
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 06:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469463; cv=none; b=UKIG/4aGVCUGPMfedFMuzwJCObQM/n4afm4x/90I9jX4l7W/KVchP3mVtMFJOz1CLux8ulL5ZfflH1JLgMpfhxjbGd59wXvl59MLoTiKZOQA9Xw1XM/77y3MTB7o5QHuSHMhg5jA1ZDK5NfhUqiIfTP70EtdhZjWRx5EZmrztic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469463; c=relaxed/simple;
	bh=j19SMHQDAUru1F3Na0v9q/cAZeQjSwngfVTLGUKsWXQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r8eElKydz9jS39p4KJ5xJ6oYhrMFx86uoZxa6gh3SPhBI/+8mUB+aEABTOIg4OZVkKnEyVd47LVALewS/Q00qcSf1v/am8fznFBrt/L1k9tJhiQGAEAEJwxtFCvUAiyhnSHHkbJ1gHsBFUhunoRaif00ONwnAnqaHXugu2aTTao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=czKR/Q42; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="czKR/Q42"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 928F21F00898;
	Wed,  3 Jun 2026 06:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780469459;
	bh=UeGDRdhIV/keDnx+oAWJ5I8ootb37It+IJsqDoNWryY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=czKR/Q42u1rdk3imGuMB6wuf/FY7S/46l3NX2LNd9Si3HygB4lGH3ZXPG2MnlrvAv
	 XAWSGP+ItX8bncIm3idcu6W/FUZNapP0JcWxflP3ydwnkH56zWLHXRptY1EnpGdgxw
	 ZuHN7YF5b4qA8+xhS4ZkztdGJPS3VShGHNIJF3sTe5vW0hn83ymYMX+DE+fkWE5YcD
	 FPS7jzJZIckMOsLgJ19KDqVvlNphETS/2vvBKHodDp2lC5jZLyfQr6qn9DY/d2B5+t
	 UL7+FnZQ58qn72iCRQsNJw8dBPZZD0RkaUdzO96i2WGT4PJx3KIwALU2703TaXfcI7
	 IOF4nFUQT0L6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: net: qca,ar803x: Add clocks
 property for IPQ5018 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem via B4 Relay" <devnull+george.moussalem.outlook.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260602-ipq5018-gephy-clocks-v2-2-65a1f1d881f3@outlook.com>
References: <20260602-ipq5018-gephy-clocks-v2-2-65a1f1d881f3@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 06:50:59 +0000
Message-Id: <20260603065059.928F21F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The PHY's link_change_notify callback naively toggles clocks based=
 on link state without tracking its own enable state, leading to severe clo=
ck leaks and unbalanced disables.
--

commit b2bbbd0f6e2e237442a168520c225e85c25f2d4a
Author: George Moussalem <george.moussalem@outlook.com>

net: phy: at803x: add RX and TX clock management for IPQ5018 PHY

Acquire and enable the RX and TX clocks for the IPQ5018 PHY. These clocks
are required for the PHY's datapath to function correctly. In addition,
gate the clocks upon link state changes for improved power management.

> diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
> index 63726cf98cd42..b7361a14220d8 100644
> --- a/drivers/net/phy/qcom/at803x.c
> +++ b/drivers/net/phy/qcom/at803x.c
[ ... ]
> @@ -1062,6 +1065,16 @@ static int ipq5018_config_init(struct phy_device *=
phydev)
> =20
>  static void ipq5018_link_change_notify(struct phy_device *phydev)
>  {
> +	struct ipq5018_priv *priv =3D phydev->priv;
> +
> +	if (phydev->link) {
> +		clk_enable(priv->rx_clk);
> +		clk_enable(priv->tx_clk);
> +	} else {
> +		clk_disable(priv->rx_clk);
> +		clk_disable(priv->tx_clk);
> +	}
> +

[Severity: High]
Can this logic in ipq5018_link_change_notify() lead to unbalanced clock
enable and disable operations?

The callback is executed by phy_process_state_change() for every change in
phydev->state.

If an interface is brought down manually, phy_stop() transitions the state
to PHY_HALTED and calls phy_process_state_change(). At this exact moment,
phydev->link has not been updated yet and remains 1 if the interface was
running. Consequently, this callback executes a duplicate clk_enable() on an
already enabled clock, incrementing the enable count to 2 and causing a
permanent clock leak.

Conversely, if the interface is brought down when the link is already down
(meaning phydev->link =3D=3D 0 and the clock was already disabled during the
PHY_UP to PHY_NOLINK transition), phy_process_state_change() triggers the
callback again. The callback reads phydev->link =3D=3D 0 and executes a
duplicate clk_disable() on an already disabled clock.

This triggers an unbalanced clock disable kernel warning and underflows the
clock's enable count, which can corrupt the system's clock tree and block
power state transitions.

Could we track the clock's enable state within struct ipq5018_priv to preve=
nt
these duplicate operations during state machine transitions?

>  	/*
>  	 * Reset the FIFO buffer upon link disconnects to clear any residual da=
ta
>  	 * which may cause issues with the FIFO which it cannot recover from.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-ipq5018-ge=
phy-clocks-v2-0-65a1f1d881f3@outlook.com?part=3D2

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794093553;
	b=wIp65/d3BFI9+4m7ZqwpVJBAEDVNfpuyIJNA68lRCcM1KUS8ckbqhIkyXbNZASe/5cl+
	 a6bhDhJDK5qUguY5w/x9yMkeOHZbY+CZtOt42M+GTyq6QSbw/4TRco0ThMjjxs9keSfQX
	 gnZ0/fGq1RG3QJKIDk6dngewPS1YRIvkqDckYXVitXl9Sj/g+pQ5MQoEyoFW33H4pzB/M
	 WZX2QjRnDaIYxRxxqwHtOCkT0LsBEpDjodwJHdojrjSpgGN7KfFxZ5tgJAzvg5LiCeZn/
	 0cmfIihH+E2AwNcexdl8lteZyGZ4l8b1ZuXwByfxZX9nTVUJNtTkFbUYBT9xkQIPBmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794093553;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DWaQHfawWV827XTyXJAtha+HWUzWwzeqp5zsyR8cvlc=;
	b=NHFOj4vSGS5LYOG5PG3geRMhofIc3SNYAOkvfnrv8AcjxDJvFqNNe22lHBz+1Rp+zGmv
	 iVTgrCOJpGioTyXihLFDZ356Uix8sLHguamjMcVD4CKg6VXx8W1Y3xiYrrQoJ9dBzrIIP
	 Ck6lrtZ/YvQlKdI4V2kwGblTD07RV/hiPLpVS6UrWukgwBPDQNSBzhhmhHw/AIGX4OIk1
	 ifl8zawBV3AzA5gTICt6cZuSkPxkz2H3dkN1XGXCNT4YiuhS5CEZ287Dqf2cNvfVM6BSR
	 Z9d4BDLExGmuUVVDgLwGA2lBekWvSvkdA2txn/SIsZkatSado52UzI7y4UN9EpJJgnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifkciqB1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83998606A334
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 23:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifkciqB1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F051F008A6;
	Sat,  7 Nov 2026 23:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794093553;
	bh=DWaQHfawWV827XTyXJAtha+HWUzWwzeqp5zsyR8cvlc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ifkciqB1eqEynrKR3i1PGuVB0p1xzYZVgJJ/fENKIHocrFbG3kOyQCzPv9bLgXkwF
	 WbHZDF+5oyv8C0yQNBopUfNvYf9vOLKwbJkFWQGxvhQDXOZ9kLxPW5wZovLPg9AOcu
	 X2xXcO9R6YziDoQWrDmEtynI2dSWfGooCjVwypkImDue4vWn5kCwAi5Ib1TOnE8J+G
	 ERKIrNEcRYU9ZwTWlQ2NbGrsHdiINNhu3uzdKFJekPfniEKwe+iPgqbe8AdCaELg5I
	 lPIB+jx41HEAYZBW8R6jLuP6Q4EQBOOmw1mBg5Sz+MSIN1+ItxKLpt7DD1OWsIuCZG
	 qaHbW3Um/NWng==
Message-ID: <sashiko-outbox-203387@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 11/11] net: phy: ncn26000: Support for
 loopback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106-s2500-mac-phy-support-v10-11-31b5a69b85b7@onsemi.com>
References: <20261106-s2500-mac-phy-support-v10-0-31b5a69b85b7@onsemi.com>
 <20261106-s2500-mac-phy-support-v10-11-31b5a69b85b7@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 23:19:12 +0000
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
- [Medium] net: phy: ncn26000: ncn26000_config_aneg() clears
  BMCR_LOOPBACK in MII_BMCR
--

commit a6fa19dd96a071675ca905f2adbb2958359bdcce
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: phy: ncn26000: Support for loopback

This commit introduces a generic genphy_loopback_no_speed() helper that
toggles BMCR_LOOPBACK in MII_BMCR without setting speed, and wires it as
the .set_loopback callback for the S2500 and TI DP83867 PHY drivers.

> diff --git a/drivers/net/phy/ncn26000.c b/drivers/net/phy/ncn26000.c
> index 0006e157917df..c115af6eda33d 100644
> --- a/drivers/net/phy/ncn26000.c
> +++ b/drivers/net/phy/ncn26000.c
> @@ -176,6 +176,7 @@ static struct phy_driver ncn26000_driver[] =3D {
>  		.config_init           =3D ncn26000_config_init,
>  		.config_aneg           =3D ncn26000_config_aneg,
>  		.read_status           =3D ncn26000_read_status,
> +		.set_loopback          =3D genphy_loopback_no_speed,
>  		.set_plca_cfg          =3D ncn26000_c45_plca_set_cfg,
>  		.get_plca_cfg          =3D genphy_c45_plca_get_cfg,
>  		.get_plca_status       =3D genphy_c45_plca_get_status,

[Severity: Medium]
Does ncn26000_config_aneg() clear BMCR_LOOPBACK when phy_config_aneg() runs
while PHY loopback is enabled?

drivers/net/phy/ncn26000.c:ncn26000_config_aneg() {
	...
	// bring up the link
	return phy_write(phydev, MII_BMCR, NCN26000_BCMR_LINK_CTRL_BIT);
}

genphy_loopback_no_speed() sets BMCR_LOOPBACK in MII_BMCR, but any
subsequent phy_config_aneg() call (for example when phy_state_machine()
processes PHY_UP) overwrites the entire MII_BMCR register via phy_write().
This disables hardware loopback while phydev->loopback_enabled remains
true, causing loopback selftest frames to be transmitted onto the line
instead of looping back.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-s2500-mac-=
phy-support-v10-0-31b5a69b85b7@onsemi.com?part=3D11

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5375C381E86
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 02:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786673184; cv=none; b=FlKM0V7nBrtKkkTQryGGi/s9XdrNRXOTBD56+8Q8hDkGvWWEFpbHGWrXBKmJaA+03GqkTBN/jKcRUPkjdOIUyWS8AoglxC0RJUd6EjhwyLIfot0eeYRVqP63rj4G7KINk0ZPtPL6GEwHdW2B9JgraaUN839bJte3xITkx5o92Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786673184; c=relaxed/simple;
	bh=6EiiiQ/FxREKcE8BccZDn4Wv8Hfzcv8X+SiMoa7tYVE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HtRbueeiCzlNyLqSxhm19RwvVrWJ7OU6dM6XuURh/7M6sTtAenjj/wbCSWNYtsOYup/Nt8YdDnIBo3dEnE6+aPe63Kp4YXYyT9fNhjszaqEBZiObKuEmRtiCdqBeMFd9erDPaG0lS0iB+I8U1hR8jh4NJVwtyAbWXPDHraSzdI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIptuvhp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIptuvhp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B28AE1F000E9;
	Fri, 14 Aug 2026 02:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786673183;
	bh=ytcy07OYll58mGNUv7bSH6a0dGOxB8RFENLaPK4k8lY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IIptuvhp78QpxcqvIDBU3X0zrpxiSm8AYzbPa6MtESn4whahalT4JnwtIgObT6XR/
	 8luGj12DTTR6JFBn6PC7sgq1badtjkYZuzS0IoUD5WC4Taoc9Hh8SHSW2tB1qm8FPz
	 jYt8NflfFnAJKxnql5D2qCus29QZvY+zKEjfNqYqhUFabOBJO6HntMEQyHWdVUd9O5
	 nLtSmzJRnnG70HRmlVf4T64d3+SYbWLNKsme+LJ0JhJ6EzzFVtfYXa3J9lnaM1ITNC
	 ExCxyWJM/msPgN7HB+vXj6hJc9KIAcSOjjF5bY9so2BRvmoihUh+XDWr0yMLwrYmN3
	 n1iqn/wwbEaLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 06/38] phy: rockchip: usbdp: Drop seamless DP
 takeover
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-6-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-6-b5ad9c68fa11@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 02:06:22 +0000
Message-Id: <20260814020622.B28AE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] If PHY setup fails during a mode change, the driver returns an err=
or but leaves the software state `udphy->status` incorrectly indicating tha=
t the PHY is still powered on, leading to an unbalanced clock disable later.
- [High] The driver no longer asserts the PHY resets during probe, leaving =
the hardware in an unknown, potentially active state inherited from the boo=
tloader. If the bootloader left the PHY enabled, the CCF will cut its clock=
s during late initcall, which can cause a bus lockup.
--

--- Patch [6]: [PATCH v14 06/38] phy: rockchip: usbdp: Drop seamless DP tak=
eover ---
commit 50b49f9a40304fe270c1d3495217384507476b1d
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: phy: rockchip: usbdp: Drop seamless DP takeover

This commit removes seamless DisplayPort takeover functionality from the
rockchip usbdp driver, as it is incomplete and untestable. It removes the
initial status checking and reset deassertion logic during probe.

Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.=
kernel.org/

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 3fc8222fcaec2..6cb9f6b4dbf6d 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c

[ ... ]

> @@ -1495,10 +1468,6 @@ static int rk_udphy_probe(struct platform_device *=
pdev)
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D rk_udphy_get_initial_status(udphy);
> -	if (ret)
> -		return ret;
> -

[Severity: High]
Since rk_udphy_get_initial_status() is removed, the driver no longer manages
the initial bootloader state of the PHY. If the bootloader left the PHY
enabled, could the clock framework's late initcall disable the clocks while
the hardware is still active?

Should a forceful rk_udphy_reset_assert_all(udphy) be added here to ensure
the PHY is cleanly suspended and prevent a bus lockup when unused clocks
are disabled?

>  	mutex_init(&udphy->mutex);
>  	platform_set_drvdata(pdev, udphy);

[ ... ]

> 		rk_udphy_disable(udphy);
> 		ret =3D rk_udphy_setup(udphy);
> 		if (ret)
> 			return ret;

[Severity: High]
If rk_udphy_setup() fails during a mode change, does returning here leave
udphy->status incorrectly indicating the PHY is still powered on?

If the status is not cleared, could a subsequent teardown via
rk_udphy_power_off() observe the stale udphy->status and call
rk_udphy_disable() again, resulting in an unbalanced clock disable?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-rockchip-u=
sbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com?part=3D6

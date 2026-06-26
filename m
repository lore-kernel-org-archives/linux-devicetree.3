Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B850EEA8
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 21:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782508628; cv=none; b=LBnPCFGphHh84etz1zOu7zD8zSK81nJlYo7s9yYN+T+YoieItSDXhSqklY1OhD1g41Uuik+W6Ia4F3YZo1J+xSM+cz/ZlotRsJYMSU37XLwCZmqbAjpj7abFdiBcP2SpnOtqQcflucdOWJy8Pyk4QhygJ5pQfXw/PsOAV73I2Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782508628; c=relaxed/simple;
	bh=R8H28COvniL+p+y3NNqOLaOQMwsw5rwtkWjTXUoN7uM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dSwkHF5TMcC71iYsM0WMFlcPvmvjjBvP5FVzHUYGKY7qfJpjhBzEREbMWtw+F5DQ2tT8cShzVjXnt9gT6amCtn+8PQPIbEExCwIVgSJvBL0pFghzf36GuYDSVH/XYj9tqkTHMs+16e+M2Od0Igtg9p5aNnDWAJ1gFcxTjA/cddE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbJWSaLV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbJWSaLV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9C01F000E9;
	Fri, 26 Jun 2026 21:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782508626;
	bh=d+xkjnRAjprgqmzLZvbsx+txg+5SKpCU78Bm0o2+m/U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dbJWSaLVsTksfu0T9kXAeQsd6eq6j3M7YRSXNfuFv975xMxpbScWGVZG266jALoxr
	 hEKMF/QJE6htsPxdMsD77jfU//x3OEbCRs6N1yw7Wtx4jsLiVEvad34RRYW87k+gGO
	 mHy/jLz9wNn7Fauv2ZRP7s/zTVFSHMaQNBoBXIy2vMvpVcDHgyTzE3AFoweJ2Xdtqa
	 JHFSKxw6HBgI35m0wp23dxVJiImixhNlsGV3lgy0auz9npcBSc261pTJrpvYyhfcs5
	 jh6qnv9AFdso7R+z3drAJFQz9PIYD+xxxeD+Zsy8zKt/idzoxzz9xPYfiT8QPDK4GU
	 IvoOACeGbm0dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 25/29] phy: rockchip: usbdp: Clear USB status on PHY
 exit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, olteanv@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-25-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
 <20260626-rockchip-usbdp-cleanup-v8-25-47f682987895@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 21:17:05 +0000
Message-Id: <20260626211706.1A9C01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Clearing `udphy->status` and returning early in `rk_udphy_usb3_p=
hy_exit` bypasses hardware disablement when the status drops to 0, leading =
to a permanent clock enable count leak and keeping the PHY hardware incorre=
ctly powered on.
--

commit 0522ec66e66f7228817b6bf6fcd2ff4639f6af01
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
phy: rockchip: usbdp: Clear USB status on PHY exit

This commit modifies the USB3 PHY exit routine to ensure the USB status
flag is cleared when the system is in DP-only mode. This addresses a
case where the USB3 controller is unbound while a DP-only adapter is
plugged in.

Closes: https://sashiko.dev/#/message/20260625-rockchip-usbdp-cleanup-v7-24=
-38eb3cf654fd%40collabora.com

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 4566822d70c4a..15c18c6e30935 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1322,8 +1322,10 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
>  	udphy->usb_in_use =3D false;
> =20
>  	/* DP only or high-speed */
> -	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
> +	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
> +		udphy->status &=3D ~UDPHY_MODE_USB;
>  		return 0;

[Severity: Medium]
If udphy->status drops to 0 after this bitwise clear, does returning early
bypass hardware disablement?

It appears this might lead to a permanent clock enable count leak and keep
the PHY hardware incorrectly powered on when a USB3 connection is unbound
or exited while the PHY is in a DP-only mode.

> +	}
> =20
>  	rk_udphy_power_off(udphy, UDPHY_MODE_USB);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626-rockchip-u=
sbdp-cleanup-v8-0-47f682987895@collabora.com?part=3D25

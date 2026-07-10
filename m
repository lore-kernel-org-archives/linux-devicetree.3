Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5283B4E8B
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 21:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718235; cv=none; b=sSdqW6EUQlbi+Rtnsn4lvQYW+shSTXNSRZWIMFHEPz9axNqNt6q0yKAeXYMGChO4mhLtPsw8drQG6CYSSEe9DJdZ2MUEfgoPmU6UPdkgIIpGOHQdZVzLmnYLC9FnXlCL3v2fydcem/nBQk/vg5nRlPKfdVJTlw/82zQw1xpojHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718235; c=relaxed/simple;
	bh=4nS7AAIEeHikTcY+5gRo/qtgcIz5azqNdCkC+8VxlHs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mm//FiGLKHX0Wq1M4i6/MWe4KCxvTCLffcOLKId2yv2TOUKFlOnXLjBSXByUb0Cr60wUK7vNhZbnSgXNPqSJA76tpJZYCUsWHn8wjqd2jljz6Q6Cbj0uWoOaHLIYfx1yTnbI9z56oR6+prKVhgPo752nYC4/NrXZKHM0KQWOPUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9yRTCpV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9yRTCpV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A891F000E9;
	Fri, 10 Jul 2026 21:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718234;
	bh=3kAKtJifAmqhY5uQydDew1OG49zgWiKMKwW6/uKxx+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A9yRTCpVv1OW31qXCYipnFdjOu5N5QSihN0rbj7r6OfKAFBBHDzYLx9uVm1/CJcNo
	 t4nDfqZOV1pghbpZwCh8dLSE7VT/FCKtYAiJp4mE1AmYlpHShG01MK2+Bf2M0iFnV4
	 IYgX9zKxeb2vL3jJ1wrD7p0FUbmbo6Ri+PFKrY7O3IWpH/tK6VFbDUP8tg4V/pD3kE
	 zZljgZVCqvFpisY8WUR/b2oSmMU1RDyvmeBrSJV/wFT/PzioHobbWKzFcrXsp7AYs3
	 J4YoqmeZCCHfOpBu8iNtEX9PSsXVFstsfA+7HR+XOs9USLwso3e3iIMVz1K/Gs1iJ/
	 Z6LGi6/LZSBVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 27/36] phy: rockchip: usbdp: Handle
 rk_udphy_reset_deassert errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-27-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
 <20260710-rockchip-usbdp-cleanup-v12-27-8b41a9a9bef0@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 21:17:13 +0000
Message-Id: <20260710211713.99A891F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] If PHY re-initialization fails during a mode change, the U3 port=
 is left permanently disabled and in reset, but the software state incorrec=
tly remains active.
--

--- Patch [27]: [PATCH v12 27/36] phy: rockchip: usbdp: Handle rk_udphy_res=
et_deassert errors ---
commit 00e32198a00a3780b193e546b8f16d2218cefb74
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Handle rk_udphy_reset_deassert errors

This commit modifies the initialization sequence to handle errors returned
by reset deassertion, avoiding a theoretical SError.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260626211151.2332F1F000E9%40smtp.ke=
rnel.org

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -803,8 +803,12 @@ static int rk_udphy_init(struct rk_udphy *udphy)
>  	/* Step 1: power on pma and deassert apb rstn */
>  	rk_udphy_grfreg_write(udphy->udphygrf, &cfg->grfcfg.low_pwrn, true);
> =20
> -	rk_udphy_reset_deassert(udphy, "pma_apb");
> -	rk_udphy_reset_deassert(udphy, "pcs_apb");
> +	ret =3D rk_udphy_reset_deassert(udphy, "pma_apb");
> +	if (ret)
> +		goto assert_resets;

[Severity: Medium]
This is a pre-existing issue, but returning an error here propagates up to
rk_udphy_power_on(). Does this leave the U3 port in a permanently disabled
state?

When USB3 is active and a new mode is enabled, rk_udphy_power_on() triggers
re-initialization. It disables the U3 port and calls rk_udphy_init(). If
rk_udphy_init() fails and returns an error here, the caller propagates it
immediately:

rk_udphy_power_on() {
        ...
        ret =3D rk_udphy_init(udphy);
        if (ret)
                return ret;

        if (udphy->mode & UDPHY_MODE_USB)
                rk_udphy_u3_port_disable(udphy, false);
        ...
}

If this path is taken, the U3 port is left permanently disabled and in rese=
t,
but the software state (udphy->status) incorrectly remains active. The USB3
controller is unaware that the PHY has been forced into reset.=20

Could this result in a silently dropped USB3 connection, potentially causing
I/O errors for active storage devices?=20

While a previous patch in the series mitigates the SError by safely routing
the PIPE clock to UTMI, the state inconsistency and dead USB connection seem
to remain.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-rockchip-u=
sbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com?part=3D27

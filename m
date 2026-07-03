Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF00C8EB
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 23:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783122395; cv=none; b=KhapCWpjfKoDHmC1PO/PY8AOOrsJnqHe6ufOZpFkLXhdUkHwvS5vebn2kJ4yYOiMKhi2R2mpKAVJL8NCxA2N9p6rf26zQaM9LBcniN20M/M1dY441Puta3Cl1g38yb0Ms2FD/6pxh92HHnzZdbNiGtzyKKsRdvbkgNLtkUaT4iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783122395; c=relaxed/simple;
	bh=XPyL/+f/VpGuiGaQlLxSb56yVWfhIO1D2tBMZXFwgC8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qu/1DTX9NLLIPSypxskIzE5jBrUxgPbiCsb2HWwR5LM95/ajzn0JpWTXyjpJe+ZhvUgiFP2zdd337ILDZHwOPNDRTEyjYsbHyuQHCvJwifxJSsskZKuRMow3aRuXPgFzSofEkgftlNHYpkFgKem7zHOnzpD+B7DeQmJurIRR9bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifREnGdy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifREnGdy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 380871F000E9;
	Fri,  3 Jul 2026 23:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783122394;
	bh=Me0KTYANJC1q7E2WahW7qoNyJDmN20NHVn7vkm1V9m8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ifREnGdysJ0MUvnqm8NAxP5QCX9qHrXLHxmOdrY9Ce83AbP+KnmdvjDuKBS+pGaIq
	 b3hg8pyKKxFyZq6LfG8Dww12AkKVepPaYkp7Bo2KUzIn/qVIfl+KMDg/RpwXJ2m7Jr
	 zQyf3E+OU0cb5uInQEfYGIeNRXmQ7dk2TlDBpn+WoyM4/XjOcqJN/Uj72/NAXiUa64
	 3Q07aScGEjUJB3Fzp3IEbd5bmYB1FKy1X9rBNNi7+0PRyWU3TC+Lghv5DTGyf67rAO
	 3dJte5l1yrwair+Ne9zvFEEzVXxNXTA80JPnCwq2yTzUKqaA9HNxBwsKXoFI/dbD3I
	 +uvAiPqHuRapg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 13/36] phy: rockchip: usbdp: Rename DP lane
 functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: olteanv@gmail.com, vkoul@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-13-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
 <20260703-rockchip-usbdp-cleanup-v10-13-a392711ca8a9@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 23:46:32 +0000
Message-Id: <20260703234633.380871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Failure during PHY initialization destroys active PHY hardware sta=
te while leaving software state out of sync.
--

commit 27edcd7e836a7f62ad5d0b336e4f8cfd4fedc67c
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Rename DP lane functions

The patch updates the two DisplayPort lane functions to follow the common
rk_udphy_dp_ prefix scheme for consistency.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index b172ce6a722ee..7fb864a1486c0 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
[ ... ]
> @@ -1069,7 +1069,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *ph=
y)
>  	struct rk_udphy *udphy =3D phy_get_drvdata(phy);
> =20
>  	mutex_lock(&udphy->mutex);
> -	rk_udphy_dplane_enable(udphy, 0);
> +	rk_udphy_dp_lane_enable(udphy, 0);
>  	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
>  	mutex_unlock(&udphy->mutex);

[Severity: High]
This isn't a bug introduced by this patch, but looking at the driver, does
failure during PHY initialization destroy active PHY hardware state while
leaving the software state out of sync?

If rk_udphy_init() fails during a mode change (e.g., PLL lock timeout when a
DP cable is plugged in), it aborts, asserts all PHY resets, and returns an
error:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_init() {
    ...
assert_resets:
	rk_udphy_reset_assert_all(udphy);
	return ret;
}

When this happens, rk_udphy_update_power_state() receives the error, notifi=
es
DWC3 that the reset is complete, and returns early without clearing
udphy->status:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_update_power_state() {
    ...
		ret =3D rk_udphy_init(udphy);
		if (ret) {
			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
			return ret;
		}
    ...
}

Will this cause the DWC3 USB controller to access a physically dead (reset)
PHY and crash the system with a synchronous external abort (SError), since
the controller is explicitly told the PHY is ready and the software driver =
is
left believing it is fully functional?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-rockchip-u=
sbdp-cleanup-v10-0-a392711ca8a9@collabora.com?part=3D13

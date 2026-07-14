Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49472F9D82
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784058457; cv=none; b=ue76SWb5Fh2xcUSZJukumEkGeBE+yniPcg3u4nEO0LbeQN4nKHNiXkBB5he3yIBvIASlqmo1YoXfPrBEtWRnp57mAGlRKu7ZxM2+mURmxzp1TT9T38XaXFrt2DtqNCs8+jHWvHv1nAG6cJ743Q//NvtT+ngUraiYEFcaHQQCK4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784058457; c=relaxed/simple;
	bh=3jrjtiYA/ePTdhaa72dNKjSvwGHQiVd1iDu3KxKqEJ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P/Ka7oL4XLU9f33UBLH3phE77MqveI99mMjKuISYF6hMTGlQKW+ZoZ6YRdNFUVDDcWvLO0itQ4ANMpCI8mcxJY8Z2i/5FzxjC/XfwhpPQ9/wcSNMLI3p/p6JfGptOQWTzkp2YBl03Zf5aWG1dpoEonYBiBF1+BU11Z6H+PRUXtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W646cstV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W646cstV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50AE1F00ACF;
	Tue, 14 Jul 2026 19:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784058456;
	bh=nXHjhU3zzxZS+D7A9hEj2tuSM9TlLQQMYiGI4BCD/3s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W646cstVOS0mKBrMUQArA9Rlbg5CE8YR1hvFHnahN9aykLnaTyF9hlO/An00eFvI7
	 rckF3+7++8aqRy46DHm52Ke3t5sF7n2f7/SzY0H73M94mm6Cy6By4N8sHAgM27QXwR
	 cqUv6rN3N+XmdnNTJHQxcnpeEWIMF/N7UZgqjMuGsAC9TVMW9d0dpgTskp98okuXtD
	 2io2npplwjkrTXFD4lNpuervNlYWdFuyTjx9uu577QnRI131S8yn2U5Dz5DhDuQ6sz
	 eVYQmefyQZqVE7KCXeLlZj2fghxTjXLFHxTn/pQmlUsguVqFOqfDIhEjgfVHd4JxQ2
	 pHocHhiy1Qf1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 07/35] phy: rockchip: usbdp: Keep clocks running on
 PHY re-init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-7-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
 <20260714-rockchip-usbdp-cleanup-v13-7-6cb3e769d4c5@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 19:47:35 +0000
Message-Id: <20260714194735.E50AE1F00ACF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Potential clock leak and state corruption if PHY re-initialization=
 fails during a mode change.

Pre-existing issues:
- [High] The `rk_udphy_dp_phy_configure` callback modifies the shared `pma_=
regmap` and reads shared lane mapping arrays without holding the driver-spe=
cific `udphy->mutex`.
- [High] The USB3 (U3) port is not re-enabled in the GRF registers if the P=
HY dynamically transitions from a DP-only mode to a DP+USB mode while power=
ed on.
--

--- Patch [7]: [PATCH v13 07/35] phy: rockchip: usbdp: Keep clocks running =
on PHY re-init ---
commit 0ed1125cb68d99c18b6937c983323c7c388ecb47
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Keep clocks running on PHY re-init

When a mode change is required, rk_udphy_power_on() originally disabled
clocks before re-enabling them. This commit updates it to call
rk_udphy_init() directly, keeping clocks running during PHY
re-initialization.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 6cb9f6b4dbf6d..e3f5a26c876a5 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -987,8 +987,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, =
u8 mode)
>  		if (udphy->mode =3D=3D UDPHY_MODE_DP)
>  			rk_udphy_u3_port_disable(udphy, true);
> =20

[Severity: High]
This is a pre-existing issue, but does this code fail to unmask the USB3
port during dynamic mode changes?

If the PHY transitions dynamically from a DP-only mode to a DP+USB mode
while powered on, this block handles the mode change but does not call
rk_udphy_u3_port_disable(udphy, false) to re-enable the U3 port in the GRF
registers. This seems to prevent USB3 devices from enumerating after the
transition.

> -		rk_udphy_disable(udphy);
> -		ret =3D rk_udphy_setup(udphy);
> +		ret =3D rk_udphy_init(udphy);
>  		if (ret)
>  			return ret;

[Severity: High]
If rk_udphy_init() fails, does this regression leak the clock resources?

Prior to this patch, if rk_udphy_setup() failed, rk_udphy_disable() had
already powered off the PHY. Now, if rk_udphy_init() fails (e.g., due to a
PLL lock timeout), it returns the error without disabling the clocks.

Since udphy->status was already set to UDPHY_MODE_NONE earlier in this
block, the teardown path will see a 0 status:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_power_off() {
    if (!udphy->status)
        return;
    ...
}

and return early without calling rk_udphy_disable(), permanently leaking
the clocks.

>  		udphy->mode_change =3D false;

[Severity: High]
This is a pre-existing issue, but does rk_udphy_dp_phy_configure() need to
hold the udphy->mutex?

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_dp_phy_configure() {
    struct rk_udphy *udphy =3D phy_get_drvdata(phy);
    struct phy_configure_opts_dp *dp =3D &opts->dp;

    if (dp->set_rate) {
    ...
}

Unlike other PHY operations in this driver, rk_udphy_dp_phy_configure() does
not acquire udphy->mutex. Since the generic PHY framework serializes
phy_configure on a per-instance basis, this could run concurrently with
operations on the USB3 PHY instance (like rk_udphy_usb3_phy_init) or Type-C
callbacks.

This can result in unprotected accesses to shared resources, such as
pma_regmap or dp_lane_sel, and potentially cause synchronous external aborts
if registers are accessed while the hardware block is concurrently put into
reset by rk_udphy_init().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-rockchip-u=
sbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com?part=3D7

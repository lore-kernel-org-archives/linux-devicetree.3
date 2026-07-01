Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6C53A3E76
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 23:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782950273; cv=none; b=tpCwex6/8vyt3a2AF9kdtGSnwBl5uU8cGZMP1YBI6CEN9ClTW4R994IQmvso4UXDod5esEion0WFT+cdya8ZkEti43Nssz+dtjfzSqwBG190Mi96ClE7OFv3+J1IOHQUJtqUVRfphQOf1iWXd5wI6+FWrkcdfXzTHXjAh77YWn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782950273; c=relaxed/simple;
	bh=l0wWOzWcNjTasSm2lPYP+8SAIv5cNwM2sANv6EzP1LI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l4817tPfvlP/DbzmjvtqDtAVAHGID1vc3HuulVd+VNPzqhZWY+uubS3R7C/NMJndUoGQOlkOlV+BvvhccVqfCSwh5CVNa5qvtgp7hmEAwctsrrrTf2mNxVXgs85rXz/0tT7qsZLqjlkXpDQcA6Hv0tHzAUwtMZnbc9LOWW7JU9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vff2MXLj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vff2MXLj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1B41F000E9;
	Wed,  1 Jul 2026 23:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782950272;
	bh=RhHB9fd4GiFtDnkrU/6QH+iCke89EIsXTQOsDoSI4W8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vff2MXLj31dFLiShVTFTgRI78xeBV6zVCa+iy7VqpGRIhuNxGGmEkHIVU+CR9vyYr
	 Y4iQaP0TtciQphhCp1pYnCd/8+IXdez0Cb1PpEI6vH0M34204yqKHFioCsM/N/iYnq
	 zxt/IGBmdHmDBJ/dYrngZ0yt2XU+4NMkTYqMaZKaUE0gPW9kq0sIckoW082b29ITuB
	 F60CAjTlBcQATPOryJpBJFLspxLbBPY2RLQN8glwx5PmLE+Q7tnrBiXiPM2vV7j/n3
	 IH9TAYWvrWX+yGu1RmNEvmEf5retuMs+SyyA2wATXK0SaU/Sxmxs9AH/+PcWsNsx9B
	 UliosvPvYanBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 08/38] phy: rockchip: usbdp: Keep clocks running on
 PHY re-init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, olteanv@gmail.com, conor+dt@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-8-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
 <20260702-rockchip-usbdp-cleanup-v9-8-e31efbb62d2e@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 23:57:51 +0000
Message-Id: <20260701235752.0B1B41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but `rk_udphy_dp_phy=
_power_on()` returns 0 (success) when the DP mode is unsupported by the cur=
rent Type-C state, leading callers to access clock-gated MMIO registers and=
 causing a Synchronous External Abort (SError).
--

commit 1135135471c21f67a83c25aab8254a6056976c31
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

    phy: rockchip: usbdp: Keep clocks running on PHY re-init

This commit modifies the PHY mode change logic in rk_udphy_power_on() to av=
oid
unnecessarily toggling the clocks off and on again. It skips the clock disa=
ble
and setup steps, directly calling rk_udphy_init() instead.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 5d0e4f82de2f8..2b27fd1c15d8d 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1022,8 +1022,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy=
, u8 mode)
>  		if (udphy->mode =3D=3D UDPHY_MODE_DP)
>  			rk_udphy_u3_port_disable(udphy, true);
> =20
> -		rk_udphy_disable(udphy);
> -		ret =3D rk_udphy_setup(udphy);
> +		ret =3D rk_udphy_init(udphy);

[Severity: High]
This isn't a bug introduced by this patch, but rk_udphy_power_on() returns 0
(success) when the requested mode is not supported by the current Type-C
state, which can lead to a Synchronous External Abort (SError).

If rk_udphy_dp_phy_power_on() calls rk_udphy_power_on() before a Type-C Alt
Mode is negotiated, rk_udphy_power_on() returns 0 without enabling the APB
clocks:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_power_on() {
	if (!(udphy->mode & mode)) {
		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
		return 0;
	}
...
}

Because rk_udphy_power_on() returns success, rk_udphy_dp_phy_power_on()
assumes the PHY is powered on and proceeds to access clock-gated MMIO
registers:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_dp_phy_power_on() {
...
	ret =3D rk_udphy_power_on(udphy, UDPHY_MODE_DP);
	if (ret)
		goto unlock;

	rk_udphy_dplane_enable(udphy, dp_lanes);
...
}

Here, rk_udphy_dplane_enable() performs read/modify/write operations on
udphy->pma_regmap. Accessing these registers with disabled APB clocks
triggers an SError system crash.

The same vulnerability exists in rk_udphy_dp_phy_power_off() and
rk_udphy_dp_phy_configure(), which unconditionally access the PMA registers
before updating or checking the power state.

Could rk_udphy_power_on() return an error code instead of 0 when the mode
is unsupported, or could the callers verify if the PHY actually powered on
before accessing the registers?

>  		if (ret)
>  			return ret;
>  		udphy->mode_change =3D false;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-rockchip-u=
sbdp-cleanup-v9-0-e31efbb62d2e@collabora.com?part=3D8

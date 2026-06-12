Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6994400DF4
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 17:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781283801; cv=none; b=p5Tn/YSL4l7/Kak1o+7ZoILqEfLtUeT6EKecaMWGbiChypNB9tqq9v8bnNFvbyqnjZlAl+8QQcPqFRcz4ywG6PU6f05CyU/YZ9J0HEftsRf9pt/Zp45GizGFKw7DKmED3t/lkq/5Vij8EHjPTquuShBfLpZXX8X7nZ1R6cK/5cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781283801; c=relaxed/simple;
	bh=FbVLOuW90DjP2omm8g250bXgLPg54YhwMa6OBKbxBnE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QZTCgRRVZp/DPWODQ2rupR8n7E5dOK3jljMuIG2ruws4nh2L/ALeXYLDPZaYmVEsQbXK9Zc4kfbT9e1GimIlaxXc/oqDWUaTktykLfN/7snuZ3shon4ofTKqIV6Eti4IBDkNOlJ4deSAfF9Luz9AkYIQU5SAm7Yla//tiBjWTuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eh/fQESn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eh/fQESn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14ADB1F000E9;
	Fri, 12 Jun 2026 17:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781283800;
	bh=2e/ewDluqZcF9QQMAbrWuWfztuefytlywL3nY1KgalQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eh/fQESnEdW4nJCvrRUPsqJgp5tAhP//0T4X+0zhlsoY4lOH/M0SD/AC7DgZltBDq
	 uStyR+qkFRnXiWRfkYPjgUwlNE4bhaZfl5sFcp9ufJjTJuWhRJz7JNV1X7/f+mVRh5
	 e72KupdalOoQO9eMAlg2qQO19Y/2YEIzD5T1OG0M12aU1mtKyiZ/DKbJud3vbnEYrI
	 mH+pa5uyrZigVWAa5CuCYLjjTUMNNZRDuIspVMGTge9YsZ0qEvYuW/7hpY5I3LBDYx
	 Eo3wmsPspOGrvsVUqu6SaLn1bQY7g/ph7kPXC6LMULmeRbVZlqn4bq4dy5TE3v1EW4
	 M5uwLtrxo6UrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 14/18] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-14-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-14-efc83069869f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 17:03:19 +0000
Message-Id: <20260612170320.14ADB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] rk_udphy_dp_phy_configure accesses shared state and modifies PHY r=
egisters without holding udphy->mutex, racing with orientation switches and=
 PHY resets.
- [High] udphy->phy_needs_reinit is cleared before initialization but is no=
t restored if rk_udphy_init fails, permanently breaking the PHY.
--

commit c7d9d38e9a690c6a3592fb9c0e4736966a879674
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Re-init the PHY on orientation change

Changing the cable orientation reconfigures the lane muxing, which requires
re-initializing the PHY. This patch sets the phy_needs_reinit flag when the
cable orientation is swapped to ensure the PHY is reset and reconfigured
appropriately.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index a3b4e2e0f5786..89a08267611c5 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
[ ... ]
> @@ -633,7 +634,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch=
_dev *sw,
>  		goto unlock_ret;
>  	}
> =20
> -	udphy->flip =3D orien =3D=3D TYPEC_ORIENTATION_REVERSE;
> +	if (udphy->flip !=3D flipped)
> +		udphy->phy_needs_reinit =3D true;

[Severity: High]
This isn't a bug introduced by this patch, but setting
udphy->phy_needs_reinit here interacts with an error handling issue.

In drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_power_on(), the flag
is eagerly cleared before initialization:

rk_udphy_power_on() {
    ...
    } else if (udphy->phy_needs_reinit) {
        udphy->phy_needs_reinit =3D false;
        ...
        ret =3D rk_udphy_init(udphy);
        if (ret)
            return ret;
    ...
}

If rk_udphy_init() fails (for example, due to a retryable PLL lock timeout
returning -EPROBE_DEFER), the flag is not restored to true. Since the
hardware is held in reset on failure, will subsequent calls to
rk_udphy_power_on() skip reinitialization entirely and falsely report
success while leaving both USB and DP functionally dead?

> +
> +	udphy->flip =3D flipped;
>  	rk_udphy_set_typec_default_mapping(udphy);

[Severity: High]
This is a pre-existing issue, but can this state update race with DP PHY
configuration?

This function holds udphy->mutex while updating state like udphy->flip and
lane selections in rk_udphy_set_typec_default_mapping(). However,
rk_udphy_dp_phy_configure() is called by the generic PHY framework holding
only the DP-specific phy->mutex:

rk_udphy_dp_phy_configure() {
    struct rk_udphy *udphy =3D phy_get_drvdata(phy);
    // ... accesses udphy->dp_lane_sel without taking udphy->mutex
    ...
}

If a concurrent Type-C mode switch or USB PHY initialization holds
udphy->mutex and triggers rk_udphy_init(), it will assert all hardware
resets:

rk_udphy_init() {
    ...
    rk_udphy_reset_assert_all(udphy);
    ...
}

Because rk_udphy_dp_phy_configure() does not acquire udphy->mutex, can its
register writes interleave with a full hardware reset, leaving the DP PHY
unconfigured and causing link training failures?

>  	rk_udphy_usb_bvalid_enable(udphy, true);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-rockchip-u=
sbdp-cleanup-v5-0-efc83069869f@collabora.com?part=3D14

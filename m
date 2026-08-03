Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45776434E56
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785783753; cv=none; b=CQp8C1g5/VnBA6Rk5gL8ytZHkL8Ti8N8XZG2GQbtGesWz4fG8enip6QhvL20ANYQv63wSD4+P5aMjV1suEBGUWSAoRVXmSRDP3T8mACJDoMl5BFx/8eUz5VcDHhy5ibRbBnorIqiO0JKWnv9ofnNAP1VTJgCnjXcd93xwWm8Xcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785783753; c=relaxed/simple;
	bh=N8UzKpCIPdqFo6N9zrilB4iw4bgH5bJjhBENFD2iGq4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o5t5nBEm9PN/GrZDZeeIDgI8ASCu26SaYQLLIE0kVyKyFGhRmett5UCpJZOvBM6yYzRu9R1wjZDAK1oqZwCKDbNc74Mxoa35OMeYHfKV59ZCLqcB+TSbUamY362NCQhRftnpbRg8gECJpg/cwGseBvmY3yL/UV9ZHZsqVPcRaOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=je4MlngN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="je4MlngN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E3D1F000E9;
	Mon,  3 Aug 2026 19:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785783751;
	bh=zaPGMlQUaq9J2FWn4IXfo4a8GLR6eQyMDMz2OWTQgkc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=je4MlngNyeAGvlVIH3lKFk0CaSxYyClC9lMouPQmXSInSe/vXnYNvesnQ5rnk9ZYZ
	 Z61bIprJnmf9n//3GIgy3gcWF7kNp0yl4P7JphPJge6NFSi8981BhQS3cBEO1LXNxq
	 rCplG/iTHt5F4vYINJW/8x+dZRQ2Fb8KDxfkMho7lx/oM2v1XU5HGHOcRKWdsHqscu
	 PDiIZeckmMH2QSFHU4/iTFmwvzAshA30pCDMgGoHO+9wVWKx0vJRWhg4R6JI0htTKH
	 C7MfXSP46On1sEutnDrSL+2Ty0gDTE11Pp83dVRWRSQFVg1I7K51e3144OayWnnXa8
	 cruZhcZaw7EHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 18/22] drm/bridge: synopsys: dw-dp: Drop useless
 reservation of first slot
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260803-synopsys-dw-dp-improvements-v9-18-2e6e46135312@collabora.com>
References: <20260803-synopsys-dw-dp-improvements-v9-0-2e6e46135312@collabora.com>
 <20260803-synopsys-dw-dp-improvements-v9-18-2e6e46135312@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 19:02:30 +0000
Message-Id: <20260803190231.52E3D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unbalanced resource lifecycle operations on error paths in dw_dp_b=
ridge_atomic_enable
--

--- Patch [18]: [PATCH v9 18/22] drm/bridge: synopsys: dw-dp: Drop useless =
reservation of first slot ---
commit 7167a1f6669c417c9c943c6894f5b2a33b32f0bf
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Drop useless reservation of first slot

This commit removes the reservation of the first SDP slot in the atomic_ena=
ble
path. The reservation was unclear in origin and could race with audio SDP
reservation features.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 19b6c11f672f9..05d3485a4d8db 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -1706,9 +1706,6 @@ static void dw_dp_bridge_atomic_enable(struct drm_b=
ridge *bridge,
>  		return;
>  	}
> =20
> -	scoped_guard(mutex, &dp->sdp_lock)
> -		set_bit(0, dp->sdp_reg_bank);
> -
>  	ret =3D dw_dp_link_enable(dp);
>  	if (ret < 0) {
>  		dev_err(dp->dev, "failed to enable link: %d\n", ret);

[Severity: High]
Does this error path leave dp->pm_active =3D true while the PHY is powered =
off?

If dw_dp_link_enable() fails, it cleans up by calling phy_power_off():

dw_dp_link_enable() {
    ...
err_phy_power_off:
    phy_power_off(dp->phy);
    return ret;
}

However, when we return early here, dp->pm_active remains true. Because the
DRM core considers the atomic commit successful even if the bridge enable
callback returns early, a subsequent mode-set or display-off operation will
invoke dw_dp_bridge_atomic_disable().

Because dp->pm_active is true, the disable path proceeds to call
dw_dp_link_disable(), which unconditionally calls phy_power_off() again:

dw_dp_bridge_atomic_disable() {
    if (!dp->pm_active)
        return;
    dp->pm_active =3D false;
    ...
    dw_dp_link_disable(dp);
}

dw_dp_link_disable() {
    ...
    phy_power_off(dp->phy);
    ...
}

Can this unbalanced phy_power_off() cause the PHY power count to go negativ=
e,
causing subsequent power-on attempts to silently fail?

This same unbalanced teardown could also occur earlier in this function if
drm_atomic_get_new_connector_for_encoder() or
drm_atomic_get_new_connector_state() return NULL, as dp->pm_active is set to
true before those checks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-synopsys-d=
w-dp-improvements-v9-0-2e6e46135312@collabora.com?part=3D18

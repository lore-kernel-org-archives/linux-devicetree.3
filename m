Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1274F23FC41
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809260; cv=none; b=DR2Y+8Xc/qQB2xBc44eFDbiyellKE/Xrua6vM+bAP0zMS5Ekh1133RL1OQ+iTtEcoa8+zx2DqNze5VG0hUnySvYlVLjsJH8ZSwS8eQ9o5fza+7nhzIa4J3IEnshOxdgqm/IwHeg8njfDF9eQG8n/Gi3DYeGcQnJwV1EJJ49ZchU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809260; c=relaxed/simple;
	bh=SePdOY+CtfqZdQOi82lMSNqOVzP3dLOBC3/zEAER8e0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=m2Algb99bXLraOscAjrC/JXwaei7aPQGXPW1FqngyQswBqBxAB/HhbaRhFirPee/6gonT52mSWmBjfNeCxQsKz00A9HmyvRZ0rxBM/b1vOSdnLE6ZQsFOXT/QnfC/IWVG5CgvvA9ydTav+fxt+Z0VFOdH1ESW6tHEDTg+V0446w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kK1B0pRY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kK1B0pRY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4710B1F0089B;
	Mon, 12 Oct 2026 12:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791809258;
	bh=ni48CHLOz7JypUH7cdsSw4gne0QqilVpvyo1x9KIrqI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kK1B0pRYNdywuPdv0xWuuAQXlegLJlLhYqSk0vOTTIzZKFAeQvp6XlLDsGzKu3aer
	 A/v6Kac/TG910evbBnUXV6+F07FFtAyt1wVjRaIm+HrLd1xZiR9FjPLtTUNU3EEP1g
	 NKUAb/JeJ0lup54vXs6C1HwnVK0TPglpMoz08t2g6E4ZNGbNsLXr2znefrr1R6L41M
	 A5/QLNOqbKx7sCKO+6y9/Ote+0Ebb6ZGeF4JW7fy0loS3aU1hqmKuthT4rZ1E9H/gk
	 GUuh2GfHZdp95/Q54Gf7kHotHseT7GOd7rUI7iQPngdrq49bHcnw0ut1JMbtyIOXEu
	 IyePrISBMJAzw==
Message-ID: <sashiko-outbox-168127@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] phy: cix: Add Sky1 DP PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Liu" <Luo.Liu@cixtech.com>
Cc: olteanv@gmail.com, devicetree@vger.kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261012123618.648930-3-Luo.Liu@cixtech.com>
References: <20261012123618.648930-1-Luo.Liu@cixtech.com>
 <20261012123618.648930-3-Luo.Liu@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 12:47:37 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] phy: cix: missing state restore on cix_dp_phy_set_lane_voltage()=
 error path
- [Medium] phy: cix: Race condition in CDB transaction completion due to ig=
nored busy pulse timeout
--

commit 813f2a99f8250a74e6b3856914829e75ea21a786
Author: Luo Liu <Luo.Liu@cixtech.com>

phy: cix: Add Sky1 DP PHY driver

This commit adds a PHY driver for the CIX Sky1 dedicated DisplayPort PMA.
It supports configuring the link rate, lane count, SSC, and voltage swing
using the generic PHY DP operations.

> diff --git a/drivers/phy/cix/phy-cix-dp.c b/drivers/phy/cix/phy-cix-dp.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/phy/cix/phy-cix-dp.c

[ ... ]

> +static int cix_dp_phy_cdb_complete(struct cix_dp *dp)
> +{
> +	u32 value;
> +
> +	readl_poll_timeout_atomic(dp->base + CIX_DP_CDB_READY, value,
> +				  !(value & BIT(0)), 0, 1);
> +
> +	return cix_dp_phy_cdb_ready(dp);
> +}

[Severity: Medium]
Does this explicitly suppress the return value from the busy-pulse poll?

If the hardware takes longer than 1us to drop the CIX_DP_CDB_READY bit to 0
after CIX_DP_CDB_ENABLE is written, the first polling loop will time out and
the error is ignored. The second polling loop in cix_dp_phy_cdb_ready()
could then immediately read the stale READY =3D=3D 1 state and return succe=
ss
before the hardware actually processes the command.

Can this race condition lead to PHY initialization failures by allowing
overlapping commands to be issued to the hardware?

[ ... ]

> +static int cix_dp_phy_set_lane_voltage(struct cix_dp *dp, u32 lane,
> +				       const struct cix_dp_voltage_conf *cfg)
> +{
> +	int value;
> +	int ret;
> +
> +	value =3D cix_dp_phy_cdb_read(dp, CIX_DP_TX_DIAG_ACYA_LANE(lane));
> +	if (value < 0)
> +		return value;
> +
> +	ret =3D cix_dp_phy_cdb_write(dp, CIX_DP_TX_DIAG_ACYA_LANE(lane),
> +				   value | BIT(0));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D cix_dp_phy_cdb_write(dp, CIX_DP_TX_TXCC_CTRL_LANE(lane),
> +				   cfg->tx_txcc_ctrl);
> +	if (ret)
> +		return ret;

[Severity: Medium]
If this write or any subsequent configuration write fails, the function
returns immediately. Does this skip the cleanup step at the end of the
function that restores the CIX_DP_TX_DIAG_ACYA_LANE register?

It appears that returning early leaves the hardware stuck in a diagnostic
override state (with BIT(0) still set), which might silently corrupt future
operations or link training attempts. Should these error paths ensure the
original state is restored?

> +
> +	ret =3D cix_dp_phy_cdb_write(dp, CIX_DP_DRV_DIAG_TX_DRV_LANE(lane),
> +				   cfg->drv_diag_tx_drv);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D cix_dp_phy_cdb_write(dp,
> +				   CIX_DP_TX_TXCC_MGNFS_MULT_000_LANE(lane),
> +				   cfg->tx_txcc_mgnfs_mult_000);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D cix_dp_phy_cdb_write(dp,
> +				   CIX_DP_TX_TXCC_CPOST_MULT_00_LANE(lane),
> +				   cfg->tx_txcc_cpost_mult_00);
> +	if (ret)
> +		return ret;
> +
> +	return cix_dp_phy_cdb_write(dp, CIX_DP_TX_DIAG_ACYA_LANE(lane),
> +				    value & ~BIT(0));
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012123618.6489=
30-1-Luo.Liu@cixtech.com?part=3D2

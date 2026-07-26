Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EA92BB13
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785078439; cv=none; b=RchU6izhMTStc4dpJfgC+raI7WZaTWff0CBk7bpkC2tgKlO8x91uPLwabirwbYgZ79ipjkdcT5jVq03WGaLuvZGs2gxABkmbGxxdZVIGq64Rk51/dMD1At2UoU/D9VQMhUpU9QevhMoaAi0bjgerl6ND0XzgGAwjL9GWj0VuUtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785078439; c=relaxed/simple;
	bh=yRm1qfxNRKO1anAeAiUyEB4si8PimlckZup4yr8S/a8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IBP96MBhu1oWZPaQbO2hNiy6L3+fbXI1OrMm9uf5AB+cD3nviTAUBUlzDLI5HhT5EqzX0Ugui4eegdYtXpfNaHLkSLtWQWOZvUb3oqKp7YCLGRhb48JhU0Md5z+9vG7riELiV/Ka+0hMYvtTTNuI20Zehdxcxwi1tnpISAv7V+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzjYbSaQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzjYbSaQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D3F1F000E9;
	Sun, 26 Jul 2026 15:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785078437;
	bh=uGRbpXlG3QleRJfizWsEy0laEFOZppLNdNA1FH5muh8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hzjYbSaQ/NXdWTfbjCLn1ex/az1BhYO5KTfNSO8vEiTkqCc8Xfnlql+PLwfbQHHLQ
	 /jcg4U0Zfb9+heiiShaGoKIdhvmhfGILvDWGhGg9gd0HTKtMnMG5zpCCTEdtClypUE
	 O0XIVmpufIVz0Zyxc7jA7sGjx+zFBL8EPnTf/6sfp3rhhXwHlnAFoU+3B0WWpii76k
	 4NWSzoYsZMIr9mXsKqKrhTRwoc1AIaB/K1At4XV21mDAjHTtJxY6l7kinh4iKl6AX8
	 xynJDjMul8Iar6uqS4RrGLIZEst5dx3ZTKJodJfOrP/zzKHRHM2CbZterByLFNi1Xx
	 dA6AC5gBdZvSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] phy: rockchip-samsung-dcphy: add MIPI D-PHY
 receiver support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Yang" <jason98166@gmail.com>
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, conor+dt@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260726-dcphy-rx-v1-v2-4-cf9cc34a412a@gmail.com>
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
 <20260726-dcphy-rx-v1-v2-4-cf9cc34a412a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 15:07:16 +0000
Message-Id: <20260726150717.05D3F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The RX power-on sequence fails to toggle the shared APB reset (`ap=
b_rst`) when it is the first PHY direction to power on, potentially leaving=
 shared PHY state uninitialized.
- [High] The RX lane enable function polls for `PHY_READY` while the PHY is=
 still held in reset, guaranteeing a timeout failure.
--

--- Patch [4]: [PATCH v2 4/4] phy: rockchip-samsung-dcphy: add MIPI D-PHY r=
eceiver support ---
commit 8b1f5adbd06df56ad03e2b8d081a6587be5fe71d
Author: Jason Yang <jason98166@gmail.com>

phy: rockchip-samsung-dcphy: add MIPI D-PHY receiver support

This patch implements the receiver (CSI) direction of the D-PHY for the
Rockchip Samsung driver. It adds the RX register layout, HS-frequency settle
table, and hooks the receiver bring-up and teardown into the per-direction
power paths. The PLL sequence is also skipped for the receive path as the
sensor supplies the link clock.

> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/=
phy/rockchip/phy-rockchip-samsung-dcphy.c
> index 95eb1200cab48..f6d112935c016 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
[ ... ]
> @@ -988,6 +1046,228 @@ struct samsung_mipi_dphy_timing samsung_mipi_dphy_=
timing_table[] =3D {
[ ... ]
> +static int samsung_mipi_dphy_rx_lane_enable(struct samsung_mipi_dcphy *s=
amsung)
> +{
> +	struct samsung_mipi_dcphy_dir *pd =3D &samsung->phys[RK_DCPHY_DIR_RX];
> +	u32 sts;
> +	int ret, i;
> +
> +	regmap_update_bits(samsung->regmap, DPHY_SC_GNR_CON0, PHY_ENABLE, PHY_E=
NABLE);
> +	for (i =3D 0; i < pd->lanes; i++)
> +		regmap_update_bits(samsung->regmap, rx_data_lane_gnr_con0[i],
> +				   PHY_ENABLE, PHY_ENABLE);
> +
> +	ret =3D regmap_read_poll_timeout(samsung->regmap, DPHY_SC_GNR_CON0,
> +				       sts, sts & PHY_READY, 200, 4000);

[Severity: High]
Does this code poll for PHY_READY while the PHY is still held in reset?

Looking at samsung_mipi_dphy_rx_power_on(), samsung->s_phy_rst is asserted,
then samsung_mipi_dphy_rx_lane_enable() is called, and only after that is
s_phy_rst deasserted.=20

Will this cause the PHY_READY poll to always timeout?

> +	if (ret) {
> +		dev_err(samsung->dev, "RX clock lane not ready\n");
> +		goto err_lane_disable;
> +	}
[ ... ]
> @@ -1004,6 +1284,44 @@ static void samsung_mipi_dcphy_bias_block_enable(s=
truct samsung_mipi_dcphy *sams
[ ... ]
> +static int samsung_mipi_dphy_rx_power_on(struct samsung_mipi_dcphy *sams=
ung)
> +{
> +	bool first =3D !samsung->phys[RK_DCPHY_DIR_TX].powered;
> +	int ret;
> +
> +	if (!samsung->phys[RK_DCPHY_DIR_RX].hs_clk_rate)
> +		return -EINVAL;
> +
> +	reset_control_assert(samsung->s_phy_rst);
> +
> +	if (first)
> +		samsung_mipi_dcphy_bias_block_enable(samsung);

[Severity: High]
If the RX direction is powered on first, does it need to toggle the shared =
APB
reset (apb_rst) before enabling the bias block?

In samsung_mipi_dphy_tx_power_on(), when first is true, it does:

	if (first) {
		reset_control_assert(samsung->apb_rst);
		udelay(1);
		reset_control_deassert(samsung->apb_rst);
	}

Without this in the RX path, could the shared APB bus interface and BIAS
block remain in an uninitialized state from the bootloader?

> +	samsung_mipi_dphy_rx_config_common(samsung);
> +
> +	ret =3D samsung_mipi_dphy_rx_config_settle(samsung);
> +	if (ret)
> +		goto out_deassert;
> +
> +	ret =3D samsung_mipi_dphy_rx_lane_enable(samsung);
> +
> +out_deassert:
> +	reset_control_deassert(samsung->s_phy_rst);
> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726-dcphy-rx-v=
1-v2-0-cf9cc34a412a@gmail.com?part=3D4

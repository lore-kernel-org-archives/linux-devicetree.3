Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6F6387347
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 09:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947661; cv=none; b=ajenP9T1vmb6dj+CrYD/xN+UhSL7ZDh4Z9pVz4slUyPwdWosLW9mK1U7N0pWCr0E1sBCcWxEtRZZ187L5JP3v6IvrObZKVFxjiuasyO2U7q2jH+WIjBE4U7PM/jrfqZMg/kyKySqHF+8SZnucry0coKv9anitJyQS0Ps1H03noY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947661; c=relaxed/simple;
	bh=7Y6iDoWSVZLfFBshi0b4hs2DykWxH9/UUHj9OOzof+0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gdT80EuuOhylR75FDRpyt0gAu6Ci9vZZYjBu71C7sR41gRqNENV78ThcIESGFYaPSJWiutAsE+Wz5C+303R24QQ5Rkty4+3ic0PAib3dpD+34XcmsoX7hiyRlbavG4Ni0iYEgbn7tYyQKZc4tMMZo9BgObW9ZAbv0EckM2dXACY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHwxHSBF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHwxHSBF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30C81F00A3D;
	Wed,  9 Sep 2026 09:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788947660;
	bh=WIuUZcVe2UXewNV0LRzVMQyS4T34o/IpvI/Gf9Rv474=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nHwxHSBFm5HdcGDYoGKXmTHExwPbkP+vHb5D8t7mZJf1y9GV6LrLZF7adL4djEXa7
	 Kq57E3S6jjUiPxuKuuEVOT9f316gMHfI+COa5UrO2qjDRsjr9XPJlE6MZyIZ+pyOgI
	 YMoId8PezDCzpMwQHUx3GgBnjohxgHAUMWd3/MsI4Uj2ZGo2rBoEBe1jZivDwzR2PV
	 7X9/VORUaXzizQ6YdtnGoK32dEgg22eiZ8aR0OjetHUWd+oEROt17+XltB0mydKKJa
	 ijak89K1/e9TpNlKJVb7LElxlCogMUlbSDqZkCYa6BtaZBYO84WLUCCRc7EAnsXaA3
	 2iPL/8m3CA8bg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] phy: tegra: Add Tegra264 MPHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kartik Rajput" <kkartik@nvidia.com>
Cc: robh@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260909-tegra264-mphy-v1-2-ce61a80dc065@nvidia.com>
References: <20260909-tegra264-mphy-v1-0-ce61a80dc065@nvidia.com>
 <20260909-tegra264-mphy-v1-2-ce61a80dc065@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 09:54:19 +0000
Message-Id: <20260909095419.C30C81F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Data race on shared `mphy->power_count` and clock state across mul=
tiple PHY instances.
- [High] TX PHY lacks power management operations, creating a fragile API c=
ontract that risks system crashes.
- [High] Wrong base address pointer used for `MPHY_RX_APB_CAPABILITY` regis=
ters.
- [Medium] Missing reset assertion for `mphy->rst_clk_ctl` in the normal `t=
egra_mphy_rx_power_off` path.
--

commit bceb08380e03847a80ce77db39c3ff271cbccb0c
Author: Kartik Rajput <kkartik@nvidia.com>

phy: tegra: Add Tegra264 MPHY driver

Add a driver for the MIPI M-PHY found on NVIDIA Tegra264 SoCs. The
M-PHY has two lanes, each with a transmit and a receive direction,
exposed as four PHYs to the UFS host controller.

> diff --git a/drivers/phy/tegra/phy-tegra-mphy.c b/drivers/phy/tegra/phy-t=
egra-mphy.c
> index 0000000000000..01cafe1c7477f
> --- /dev/null
> +++ b/drivers/phy/tegra/phy-tegra-mphy.c

[ ... ]

> +static int tegra_mphy_rx_power_on(struct phy *phy)
> +{
> +	struct tegra_mphy *mphy =3D dev_get_drvdata(phy->dev.parent);
> +	struct tegra_mphy_lane *lane =3D phy_get_drvdata(phy);
> +	u32 value;
> +	int err;
> +
> +	if (mphy->power_count++ =3D=3D 0) {
            ^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Since l0 and l1 are distinct PHY instances exposed to the consumer, can
concurrent phy_power_on() or phy_power_off() calls race on this shared
mphy->power_count?

The PHY framework's internal mutex only serializes operations on a per-PHY
basis. An unprotected read-modify-write here could lead to corrupted
reference counts, unbalanced clock states, and hardware faults.

> +		err =3D clk_bulk_prepare_enable(mphy->num_clks, mphy->clks);
> +		if (err) {
> +			mphy->power_count--;
> +			dev_err(&phy->dev, "failed to enable clocks: %d\n", err);
> +			return err;
> +		}
> +		reset_control_deassert(mphy->rst_clk_ctl);
> +	}
> +
> +	reset_control_deassert(lane->rst_rx);
> +	reset_control_deassert(lane->rst_tx);
                               ^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Is it intentional that the RX power-on path handles the reset logic for the
independently exposed TX PHY?

The TX PHY currently lacks .power_on and .power_off callbacks and seems to
rely implicitly on the RX PHY to enable hardware clocks. If the TX PHY is
accessed via phy_configure() before the RX PHY is fully powered on, could
this result in unclocked memory-mapped I/O and trigger a synchronous
external abort?

> +
> +	err =3D tegra_mphy_rx_write_kick_go(lane, MPHY_RX_APB_VENDOR3B, MPHY_EQ=
_TIMEOUT);
> +	if (err) {
> +		dev_err(&phy->dev, "eq_timeout programming failed: %d\n", err);
> +		goto err_reset;
> +	}
> +
> +	err =3D tegra_mphy_rx_write_kick_go(lane, MPHY_RX_APB_VENDOR49, MPHY_PW=
R_CHANGE_CLK_BOOST);
> +	if (err) {
> +		dev_err(&phy->dev, "pwr_change_clk_boost programming failed: %d\n", er=
r);
> +		goto err_reset;
> +	}
> +
> +	value =3D readl(lane->regs + MPHY_RX_APB_CAPABILITY_88_8B);
                      ^^^^^^^^^^

[Severity: High]
Should this use lane->rx_regs instead of lane->regs for offset application?

Using lane->regs misdirects the read/write operations to offsets 0x88 and
0x94 instead of 0x2088 and 0x2094 (since MPHY_RX_OFFSET is 0x2000), which
may lead to memory corruption and failed configurations.

> +	value &=3D ~RX_HS_G1_SYNC_LENGTH_CAPABILITY(~0);
> +	value |=3D RX_HS_G1_SYNC_LENGTH_CAPABILITY(0xf);
> +	writel(value, lane->regs + MPHY_RX_APB_CAPABILITY_88_8B);
> +
> +	value =3D readl(lane->regs + MPHY_RX_APB_CAPABILITY_94_97);
                      ^^^^^^^^^^

[Severity: High]
Does this also need to use lane->rx_regs instead of lane->regs?

> +	value &=3D ~RX_HS_G3_SYNC_LENGTH_CAPABILITY(~0);
> +	value |=3D RX_HS_G3_SYNC_LENGTH_CAPABILITY(0xf);
> +	value &=3D ~RX_HS_G2_SYNC_LENGTH_CAPABILITY(~0);
> +	value |=3D RX_HS_G2_SYNC_LENGTH_CAPABILITY(0xf);
> +	writel(value, lane->regs + MPHY_RX_APB_CAPABILITY_94_97);

[ ... ]

> +static int tegra_mphy_rx_power_off(struct phy *phy)
> +{
> +	struct tegra_mphy *mphy =3D dev_get_drvdata(phy->dev.parent);
> +	struct tegra_mphy_lane *lane =3D phy_get_drvdata(phy);
> +
> +	if (WARN_ON(mphy->power_count =3D=3D 0))
> +		return -EINVAL;
> +
> +	reset_control_assert(lane->rst_rx);
> +	reset_control_assert(lane->rst_tx);
> +
> +	if (--mphy->power_count =3D=3D 0)
> +		clk_bulk_disable_unprepare(mphy->num_clks, mphy->clks);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Medium]
Should mphy->rst_clk_ctl be asserted here before or after disabling the
clocks?

The driver intentionally deasserts mphy->rst_clk_ctl in
tegra_mphy_rx_power_on() when power_count goes from 0 to 1, but omits the
corresponding reset_control_assert() in this successful power-off path,
which leaks the reset state across power cycles.

> +
> +	return 0;
> +}

[ ... ]

> +static const struct phy_ops tegra_mphy_tx_ops =3D {
> +	.configure =3D tegra_mphy_tx_configure,
> +	.calibrate =3D tegra_mphy_tx_calibrate,
> +};
        ^^

[Severity: High]
Are .power_on and .power_off callbacks intentionally omitted for the TX PHY
ops?

Leaving the TX PHY exposed to configuration while in an unclocked state
creates a fragile API contract that risks system crashes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-tegra264-m=
phy-v1-0-ce61a80dc065@nvidia.com?part=3D2

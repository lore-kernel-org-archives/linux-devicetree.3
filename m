Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E380F25392C
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035054; cv=none; b=m4vVP6+FUm2IgsWrpPilPl1a6JoWo4vqmGMb1Nfu8ZUkb8Qx7HItGEXboV8d+80nePUcaSpXg/ZrcrzMLuFVSyAWgI1BJKlYgwdih5iqvB/4lAjKhVmqFu/LyZ1ZjsYhKQ+ygN2L3LRkqLtmL+MNe+Feey2x9AUsEo1kxihnMQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035054; c=relaxed/simple;
	bh=vg/bF4bcQh6zbIdXIK7uFCJJyPgYqbw29PWg5Lle2JU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HmQbRdEkr3H1YsjkUkjn80MqpqiybNWuIi9D83frQ//ruLdMH/AiSStZqCGKkVwVyHpSshkL97MB+bH4d5qPTU+xxTGDQZWlY8z2IJb4WW6WbRC4mXreXFH+KMvqK9DGaLLJKK2D5WYnjpOXKhx5QDMY/YigvgxO6xFgXsVYpwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKD/euM9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKD/euM9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48CD81F00A3A;
	Tue, 14 Jul 2026 13:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784035049;
	bh=IfUY3xrb8fuI/lXfMT3/L1r60/RQdGQeEpC/sBXMs+4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OKD/euM9ABPOEIpUi9YgGrvdwehSiiuBnXwISn2kxEYePpME1/eVgzKpCNsKdwOwN
	 r+YaPVV4T5CkIcmv1s6QTcMBHQMm6t9NWEvjaoclo0tAHZtGjmjvrnCuvyTCHXTvG6
	 jQAPcuNnqo/iVbNfaE3Z+pxmg0aj9VA4mi9c9I8JHMfnsbNkyYMP1SW6BmiQiVa4DI
	 JY5Aobg7QlFDOP2Tbeluf2/p6hxx50Jpfyhu9DWNmktsJz3iskatdOBJ+Gai2I2jpM
	 Ck0oZ3QySCc64BmP9jhJNlAPsZ2GHFycEr6yHLYYSCvNVVM2npg2QR+JiC2Ibe49bm
	 hi7sNzfRB1KLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/2] net: phy: add DAPU Telecom DAP8210R(I)
 Gigabit Ethernet PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260713131223.279555-3-a.shimko.dev@gmail.com>
References: <20260713131223.279555-1-a.shimko.dev@gmail.com>
 <20260713131223.279555-3-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 13:17:28 +0000
Message-Id: <20260714131729.48CD81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] PHY software reset is not actually triggered because the driver wr=
ites `0` to the reset bit instead of `1`.
- [High] RGMII delay configurations are not explicitly cleared when the int=
erface mode disables them.
- [Medium] The debugfs package generator interface unconditionally overwrit=
es the Auto-Negotiation state upon disable.
- [Medium] The debugfs write callback modifies the PHY's MII_BMCR register =
without acquiring `phydev->lock`.
- [Low] The driver uses a fixed sleep instead of polling the self-clearing =
reset bit.
- [Low] Incorrect use of `abs()` macro with unsigned types causes a build f=
ailure.
- [Low] The device tree property for clock inversion in the code does not m=
atch the commit message.
--

--- Patch [2]: [PATCH net-next 2/2] net: phy: add DAPU Telecom DAP8210R(I) =
Gigabit Ethernet PHY driver ---
commit 78567017e0db0de14fb31e8cedc75e8b75b18e2f
Author: Artem Shimko <a.shimko.dev@gmail.com>

net: phy: add DAPU Telecom DAP8210R(I) Gigabit Ethernet PHY driver

This commit adds support for the DAPU Telecom DAP8211R(I) Gigabit
Ethernet PHY. It implements extended register access for RGMII delay
configuration and provides a debugfs interface for diagnostics.

> The rx-internal-delay-ps and
> tx-internal-delay-ps properties allow precise tuning of clock delays in
> 150 ps steps from 0 to 2250 ps, with automatic selection of the nearest
> supported value if an exact match is not specified. Additionally,
> the optional tx-inverted-clk flag enables 180-degree TX clock phase shift
> for boards where signal integrity or MAC requirements necessitate clock

[Severity: Low]
The commit message documents the property as tx-inverted-clk, but the
code implementation looks for tx-use-inverted-clk.

Which one is the intended property name?

> diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
> new file mode 100644
> index 0000000000000..bd695bc4953a2
> --- /dev/null
> +++ b/drivers/net/phy/dap8211r.c

[ ... ]

> +static u16 dap8211r_delay_ps_to_sel(struct phy_device *phydev, u32 ps)
> +{
> +	int i, best_idx =3D 0;
> +	u32 best_diff =3D UINT_MAX, diff =3D 0;
> +
> +	if (!ps)
> +		return 0;
> +
> +	for (i =3D 0; i < DAP8211R_DELAY_COUNT; i++) {
> +		diff =3D abs(ps - delay_config[i].ps);

[Severity: Low]
Does this cause a compilation error?

The abs() macro in the kernel strictly checks for signed types, but the
result of the subtraction here is unsigned.

[ ... ]

> +static int dap8211r_config_init(struct phy_device *phydev)
> +{
> +	struct device_node *phydev_node =3D phydev->mdio.dev.of_node;
> +	u16 mask =3D 0, set =3D 0;
> +	int ret;
> +
> +	switch (phydev->interface) {
> +	case PHY_INTERFACE_MODE_RGMII:
> +		break;

[Severity: High]
If the bootloader configured RGMII delays, are they left intact here?

By not setting the mask to clear the delays for pure RGMII mode, this
leaves the PHY with whatever delays were previously configured, violating
the RGMII interface contract.

[ ... ]

> +	if (of_property_read_bool(phydev_node, "tx-use-inverted-clk"))
> +		set |=3D DAP8211R_RGMII_CLK_INVERT;
> +
> +	mask |=3D DAP8211R_RGMII_CLK_INVERT;
> +
> +	ret =3D dap8211r_modify_ext(phydev, DAP8211R_PHY_CON, DAP8211R_PHY_SW_R=
ST, 0);

[Severity: High]
Does this write actually trigger the software reset?

This clears the reset bit by passing 0 for the set argument, instead of
asserting it by writing DAP8211R_PHY_SW_RST.

> +	if (ret)
> +		return ret;
> +
> +	/* Wait for reset self-clear */
> +	fsleep(200);

[Severity: Low]
Would it be safer to poll the self-clearing reset bit instead of using a
fixed sleep?

A fixed sleep might fail if the hardware reset takes longer than expected,
and contradicts the comment about waiting for a self-clear.

[ ... ]

> +static ssize_t pkg_gen_write(struct file *file,
> +			     const char __user *user_buf,
> +			     size_t count, loff_t *ppos)
> +{
> +	struct seq_file *sf =3D file->private_data;
> +	struct dap8211r_priv *priv =3D sf->private;
> +	struct phy_device *phydev =3D to_phy_device(priv->dev);
> +	bool en;
> +	u16 mask, set, set_bmcr;
> +	int ret;
> +
> +	ret =3D kstrtobool_from_user(user_buf, count, &en);
> +	if (ret)
> +		return ret;
> +
> +	if (en) {
> +		set =3D DAP8211R_PKG_GEN_EN | DAP8211R_PKG_CHK_EN | DAP8211R_PKG_PL_5A=
A5;
> +
> +		if (priv->crc_cor)
> +			set |=3D DAP8211R_PKG_COR_CRC;
> +
> +		if (priv->loopback)
> +			set_bmcr =3D BMCR_LOOPBACK;
> +		else
> +			set_bmcr =3D BMCR_ANENABLE;
> +	} else {
> +		set =3D DAP8211R_PKG_GEN_MODE | DAP8211R_PKG_GATE_EN;
> +		set_bmcr =3D BMCR_ANENABLE;
> +	}
> +
> +	ret =3D phy_modify(phydev, MII_BMCR, BMCR_LOOPBACK | BMCR_ANENABLE, set=
_bmcr);

[Severity: Medium]
Is it safe to modify MII_BMCR here without acquiring phydev->lock?

Concurrent execution of the phylib state machine might race with this
debugfs write, leading to corrupted link state.

[Severity: Medium]
Does the else branch intentionally destroy the previous BMCR state?

By unconditionally writing BMCR_ANENABLE to 1 when disabling the packet
generator, any manual speed or duplex settings previously configured by the
user via ethtool will be overwritten.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713131223.2795=
55-1-a.shimko.dev@gmail.com?part=3D2

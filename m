Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBF6429032
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 17:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784309627; cv=none; b=TSQDtbNb8iLq+2xUDdoI7EfA1LIZN2RroQk2liT2PgE4yplV9NAEpeN0UTJaE2nbpxmHmpwvuxwdVOwu+wlWqzUVJ8qYuG2AuL1G5EmbrKx1E5OMSokrmTnn5YZBF092jLZowuGDEQWNaRnl7kxpdTC17dpASGK/U4HXnEaJO34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784309627; c=relaxed/simple;
	bh=g8lt+JaesE+ExdqjUecqVefMKjhMUt1pSs8kwkA6fCs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fUYwHWH6XnjcCeAmAFXomXH0buB30vYYKwv0moZuZaH/AXWtQWSg0VN0HAO5Fbd6/pSAtzbdrPMujP+KClqZ2tjjpKGCSo6yYqgEgm7oQXNJe0f8j29qMEWbh1Jc60+RYHy6XtwAHMupO297WmcOiqBXCfOrtc1Gyt2utpqwbI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPDn2/Cn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPDn2/Cn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F261F00A3A;
	Fri, 17 Jul 2026 17:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784309624;
	bh=9k/QBB7kXxm70NbuIbcBdulx1BUSAqK35iOJppc1+3E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lPDn2/CnBTRoWbnl9P7fqzDSJgFln6y+CmTMGkv8SIvNG18N+4oMSwFQK8+JAriSr
	 M/N0jkI94BeKtyQA+J4lUe1CZaMxTK2AFij3xF2lrX+EuyEkqxpeIRhZXGY/CT+mLo
	 ClPNpG42KUiuDv/kofuK+X2a6xQC17wo6uoIZ10/yZGk2Sa+tP0owrlg5/02kYjf/H
	 5mDfjOpzXB6L83T2W40maPueJ9mAs3AvcJ/gIgDDDFKRE0FwqCP4qHtfHfEL9OcYv6
	 rK61vJUikts0oCnnPfeBffXRl08BQjEBpvRM+tJSWyOwfT2khE8GESPVNmoGfMFw5/
	 TAj1ntZk7xFnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 2/2] net: phy: add DAPU Telecom DAP8211R(I)
 Gigabit Ethernet PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260716173325.653164-3-a.shimko.dev@gmail.com>
References: <20260716173325.653164-1-a.shimko.dev@gmail.com>
 <20260716173325.653164-3-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 17:33:44 +0000
Message-Id: <20260717173344.81F261F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The fallback logic for missing delay properties incorrectly applie=
s default delays to both RX and TX paths for RGMII_TXID and RGMII_RXID mode=
s, breaking RGMII semantics.
- [High] Silent truncation of negative MDIO read errors due to `u16` variab=
le typing causes the PHY reset polling loop to falsely report success.
- [High] The RGMII configuration is written to the PHY after the software r=
eset, preventing the settings from taking effect.
--

--- Patch [2]: [PATCH net-next v3 2/2] net: phy: add DAPU Telecom DAP8211R(=
I) Gigabit Ethernet PHY driver ---
commit cafde85b2bbf112f7902c7badc2f66ec1f9c7bc5
Author: Artem Shimko <a.shimko.dev@gmail.com>

    net: phy: add DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY driver

This commit adds a new driver for the DAPU Telecom DAP8211R(I) Gigabit
Ethernet PHY. It supports RGMII delay configuration through device tree
properties and optional 180-degree TX clock phase shifting.

> diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
> new file mode 100644
> index 0000000000000..e6381fd8c98c2
> --- /dev/null
> +++ b/drivers/net/phy/dap8211r.c
[ ... ]
> +static int dap8211r_config_init(struct phy_device *phydev)
> +{
> +	struct device_node *phydev_node =3D phydev->mdio.dev.of_node;
> +	u16 set =3D 0, val =3D 0;

[Severity: High]
Does declaring val as u16 truncate negative error codes returned by=20
dap8211r_read_ext() during polling?=20

If dap8211r_read_ext() returns a negative error like -EIO, the truncated=20
value will still have its high bit set, which might cause the polling=20
loop below to exit early and falsely report success.

> +	int ret;
> +	s32 internal_delay;
> +
> +	if (of_property_read_bool(phydev_node, "dapu,tx-inverted-clk"))
> +		set |=3D DAP8211R_RGMII_CLK_INVERT;
> +
> +	internal_delay =3D phy_get_internal_delay(phydev, dap8211r_internal_del=
ay,
> +						DAP8211R_DELAY_SIZE, true);
> +	if (internal_delay < 0) {
> +		if (phydev->interface =3D=3D PHY_INTERFACE_MODE_RGMII)
> +			internal_delay =3D 0;
> +		else
> +			internal_delay =3D DAP8211R_DEFAULT_DEL_SEL;
> +	}

[Severity: High]
If the rx-internal-delay-ps property is missing and the interface mode is=20
PHY_INTERFACE_MODE_RGMII_TXID, does this fallback logic incorrectly apply=20
the default delay (DAP8211R_DEFAULT_DEL_SEL) to the RX path?=20

For RGMII_TXID, should the RX delay instead be 0?

> +
> +	set |=3D FIELD_PREP(DAP8211R_RGMII_RX_DEL_MASK, internal_delay);
> +
> +	internal_delay =3D phy_get_internal_delay(phydev, dap8211r_internal_del=
ay,
> +						DAP8211R_DELAY_SIZE, false);
> +	if (internal_delay < 0) {
> +		if (phydev->interface =3D=3D PHY_INTERFACE_MODE_RGMII)
> +			internal_delay =3D DAP8211R_INIT_TX_DEL_VAL;
> +		else
> +			internal_delay =3D DAP8211R_DEFAULT_DEL_SEL;
> +	}

[Severity: High]
Similarly, if tx-internal-delay-ps is missing and the interface mode is=20
PHY_INTERFACE_MODE_RGMII_RXID, will this incorrectly apply the default dela=
y=20
to the TX path when it should be 0?

> +
> +	set |=3D FIELD_PREP(DAP8211R_RGMII_TX_DEL_MASK, internal_delay);
> +
> +	ret =3D dap8211r_modify_ext(phydev, DAP8211R_PHY_CON, DAP8211R_PHY_SW_R=
ST, 0);
> +	if (ret)
> +		return ret;
> +
> +	/* Wait for reset self-clear (max 200 us) */
> +	ret =3D read_poll_timeout(dap8211r_read_ext, val,
> +				(val & DAP8211R_PHY_SW_RST),
> +				20, 200, false, phydev, DAP8211R_PHY_CON);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D dap8211r_modify_ext(phydev, DAP8211R_RGMII_CON, DAP8211R_RGMII_=
CONFIG_MASK, set);

[Severity: High]
Is the RGMII configuration written to the PHY after the software reset=20
completes?=20

The initialization comment mentions a software reset is used to apply=20
settings. If we write the RGMII configuration after the reset, will the=20
settings take effect, or will the PHY operate with uninitialized values?

> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716173325.6531=
64-1-a.shimko.dev@gmail.com?part=3D2

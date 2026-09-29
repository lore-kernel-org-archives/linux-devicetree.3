Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0552E2852
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 23:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790722917; cv=none; b=H9Giup6iKSV7sqocvh8RpQQowNdrkiyMvI6fGiRdt1uGt5etYuVwr4gCO1g5QLEFSxA0fZLaZyIzPHqPIYumbj31e7Q3Tb1k+lxh+BsNj61ORQmB96AIs65+59xpY1l4MNlK7TvXRtuSDMvX93xbPx2ZRWp7fRdT0OOLBgDtYD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790722917; c=relaxed/simple;
	bh=Xhe5hc2GNrD7zDnNIF2OdepYDjDp28eUaNkv9vy5NWw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=scJ+2sSsyoT0zHkhxlDxqj+1zTwun1lkQG1mxlHsfRU6XpbpKqIoyt2bwEm4UzKo8W9iQHaBmw7GF7NUf8mlU04+ZWgwbKty4H3mvu1JqATYbjM82CExMM4saQ/s5CEARVBTqYOLobgAUL+huqYfJ8xEDesMvugRBsFfmh7yL/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkU32PXj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MkU32PXj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E74861F000FF;
	Tue, 29 Sep 2026 23:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790722916;
	bh=yELjQesnL2N5/5H1w/tBa3KbYLGAZsB8hn9erXHK6pk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MkU32PXjZNHOkKFk7/rl1zBeIzjX5dl0EuL1XGg9sQSM4ag422uxyUAE5RTkD2JnP
	 sIvAM4xrA4f7iZFq8YysIpznT5bwLJXObsAXZLKFOk0q3y8BdSuS4pbj91fAAaYDzl
	 ALJM6BmwCLo6/muzAniEFpngoamBNMoaUz4oroBQI1f2eLVJ4COqf7fCSzB4cU8VOG
	 +9CB/XAN2NAaXgX6afIc7b718LKN8hESteIwdUrFTJHqWTWRDwS0Mn6r10jbvVLPjD
	 2J+Lx3iiqiYnD0nWOJz9EuArGMP7XvC3+dxnxTqf4MrBdu+02BzzUQiXm2/TkFmUen
	 gZ6AaBBNdKaMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v18 18/23] media: i2c: maxim-serdes: add MAX96717 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: media-ci@linuxtv.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260930-gmsl2-3_serdes-v18-18-43117818f499@analog.com>
References: <20260930-gmsl2-3_serdes-v18-0-43117818f499@analog.com>
 <20260930-gmsl2-3_serdes-v18-18-43117818f499@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 23:01:55 +0000
Message-Id: <20260929230155.E74861F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: max96717: MIPI RX lane map and polarity are swapped and use=
 logical indices
- [Medium] media: max96717: incorrect pinctrl offset mapping rejects valid =
slew-rate pins and configures wrong pins
--

commit b166b51a6d16288e98d7dffe39c310bebd68f7e0
Author: Cosmin Tanislav <demonsingur@gmail.com>

media: i2c: maxim-serdes: add MAX96717 driver

This patch introduces a new driver for the Maxim MAX96717 and related
serializers. It integrates with the common serializer framework while adding
support for features across multiple chips, receiving video over MIPI CSI-2
and outputting via GMSL2/3.

> diff --git a/drivers/media/i2c/maxim-serdes/max96717.c b/drivers/media/i2=
c/maxim-serdes/max96717.c
> new file mode 100644
> index 0000000000000..c87ea9e82c1ca
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max96717.c
> @@ -0,0 +1,1703 @@
[ ... ]
> +static int max96717_get_pin_config_reg(unsigned int offset, u32 param,
> +				       unsigned int *reg, unsigned int *mask,
> +				       unsigned int *val)
> +{
[ ... ]
> +	switch (param) {
> +	case PIN_CONFIG_SLEW_RATE:
> +		if (offset < 3) {
> +			*reg =3D MAX96717_PIO_SLEW_0;
> +			if (offset =3D=3D 0)
> +				*mask =3D MAX96717_PIO_SLEW_0_PIO00_SLEW;
> +			else if (offset =3D=3D 1)
> +				*mask =3D MAX96717_PIO_SLEW_0_PIO01_SLEW;
> +			else
> +				*mask =3D MAX96717_PIO_SLEW_0_PIO02_SLEW;
> +		} else if (offset < 5) {
> +			*reg =3D MAX96717_PIO_SLEW_1;
> +			if (offset =3D=3D 3)
> +				*mask =3D MAX96717_PIO_SLEW_1_PIO05_SLEW;
> +			else
> +				*mask =3D MAX96717_PIO_SLEW_1_PIO06_SLEW;
> +		} else if (offset < 7) {
> +			return -EINVAL;
> +		} else if (offset < 9) {
> +			*reg  =3D MAX96717_PIO_SLEW_2;
> +			if (offset =3D=3D 7)
> +				*mask =3D MAX96717_PIO_SLEW_2_PIO010_SLEW;
> +			else
> +				*mask =3D MAX96717_PIO_SLEW_2_PIO011_SLEW;
> +		} else {
> +			return -EINVAL;
> +		}

[Severity: Medium]
Does this logic map the correct pins for slew-rate configuration?

When offset represents the actual pin index, this sequentially maps offset 3
to PIO05_SLEW, offset 4 to PIO06_SLEW, and offsets 7 and 8 to PIO010_SLEW a=
nd
PIO011_SLEW.

This mistakenly configures PIO05 and PIO06 when pins 3 and 4 are requested.
When valid slew-capable pins like 5, 6, or 10 are passed, they fall into the
else if branches and are incorrectly rejected with -EINVAL.

[ ... ]
> +static int max96717_mux_set_rclkout(struct max96717_priv *priv, unsigned=
 int group)
> +{
> +	unsigned long config;
> +	int ret;
> +
> +	config =3D pinconf_to_config_packed(PIN_CONFIG_SLEW_RATE,
> +					  MAX96717_PIO_SLEW_FASTEST);
> +	ret =3D max96717_conf_pin_config_set_one(priv, group, config);

[Severity: Medium]
When max96717_mux_set_rclkout() requests the fastest slew rate for
MAX96717_RCLK_MFP (pin 4), does the mapping issue mentioned above cause
it to erroneously configure PIO06's slew rate instead of the RCLK pin?

[ ... ]
> +static int max96717_init_phy(struct max_ser *ser,
> +			     struct max_ser_phy *phy)
> +{
[ ... ]
> +	/* Configure lane mapping. */
> +	val =3D 0;
> +	for (i =3D 0; i < 4; i++) {
> +		unsigned int map;
> +
> +		if (i < num_data_lanes)
> +			map =3D phy->mipi.data_lanes[i] - 1;
> +		else
> +			map =3D ffz(used_data_lanes);
> +
> +		val |=3D map << (i * 2);
> +		used_data_lanes |=3D BIT(map);
> +	}
> +
> +	ret =3D regmap_update_bits(priv->regmap, MAX96717_MIPI_RX3,
> +				 MAX96717_MIPI_RX3_PHY2_LANE_MAP,
> +				 FIELD_PREP(MAX96717_MIPI_RX3_PHY2_LANE_MAP, val));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_update_bits(priv->regmap, MAX96717_MIPI_RX2,
> +				 MAX96717_MIPI_RX2_PHY1_LANE_MAP,
> +				 FIELD_PREP(MAX96717_MIPI_RX2_PHY1_LANE_MAP, val >> 4));

[Severity: High]
Are the lane assignments for PHY1 and PHY2 swapped here?

The driver constructs val with physical lane mappings for logical lanes 0-3,
where bits 0-3 correspond to lanes 0-1 and bits 4-7 correspond to lanes 2-3.

However, val (lanes 0-1) is written to MAX96717_MIPI_RX3_PHY2_LANE_MAP, and
val >> 4 (lanes 2-3) is written to MAX96717_MIPI_RX2_PHY1_LANE_MAP. PHY1
normally controls lanes 0-1 and PHY2 controls lanes 2-3.

> +	if (ret)
> +		return ret;
> +
> +	/* Configure lane polarity. */
> +	for (i =3D 0, val =3D 0; i < num_data_lanes; i++)
> +		if (phy->mipi.lane_polarities[i + 1])
> +			val |=3D BIT(i);

[Severity: High]
Does lane polarity configuration use the correct index?

Setting polarity using BIT(i) applies the inversion based on the logical la=
ne
index. If the lanes are remapped, this could apply the inversion to the wro=
ng
physical lane. Should this use the physical lane index
BIT(phy->mipi.data_lanes[i] - 1) instead?

Additionally, the same PHY1/PHY2 swap from the lane map appears to occur for
the polarity map just below this loop.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-gmsl2-3_se=
rdes-v18-0-43117818f499@analog.com?part=3D18

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9141C84D0
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 13:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786110926; cv=none; b=nBSZxX+ZLPN7M7l9kCkGJYTXDxqoyOgLp8XuAYEvlsUpeW3vg5+7VZJqI0Avgxdt/lTz5kWdiOFnPBTSW3uzzIP4oJJXnhKZfH4LI9Di1VHtJpfNV2Xaf1pqMbwnIFo+MLm3lvpVeekq+S6Bg6Ox2qme1z/WBlB5SpRGoi6IEAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786110926; c=relaxed/simple;
	bh=ryy+3zMSdzqkcAQLymPDVPbUf7vTmX5bbHW/GHyzDrk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Kx+fBHnc+FCcLzpVr8mT1lflT6WFV5Lr6Nz5pViL3rH/AkUjj1TCiTI+1cewLRtY2dyzLtvfkSFUDHPB/J6XJDj/+l6WKPVywiKXdbS7HRyUITAfX1yI/skPjbu6y/dJzksymtv0KeZM+fEBVxLdnd6YYmAyKihWFvKrHhz34dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2cNLzUj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2cNLzUj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034641F000E9;
	Fri,  7 Aug 2026 13:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786110918;
	bh=bGhT+DkYLJeL9mhfYwDK9KOoTUUuu8PrWfmnUUQxxX0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I2cNLzUjY/C51iJyz0cA2yo13S+noaW9Myp1Y/JFwqfxj4BBkcgWB2g1dJxqyaMBj
	 vKWA0p7wSADmQw53A+fKnVvY33jrxXSzmZtbdTEJ8h2LDSFM/wsAQF98s3P5bjtdGc
	 Cg7gL/6+YAf7qdWFB5WJ565HPz0dJt8ps2ynjIr/9FPjAkuZPmqEpr0EOVuBB+UvGu
	 6oFrbxlk+QlfyKpLC6nHM7p819IRyFMYAe9p0eE6CxcthDtq+255wGe58uoHwFw5Sn
	 J6Nt6A1OAv9ez6KIco8QUu56b+S28/1ZOX8627H6EvXeyld+1R6F9tQlbFUUxBt4L/
	 lv5222WhB1lug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 18/22] media: i2c: maxim-serdes: add MAX9296A driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260807-gmsl2-3_serdes-v15-18-7212e9e5156a@analog.com>
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-18-7212e9e5156a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 13:55:16 +0000
Message-Id: <20260807135518.034641F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect logic for MAX9296A PHY0 hardware quirk breaks lane swapp=
ing and polarity inversion.
--

--- Patch [18]: [PATCH v15 18/22] media: i2c: maxim-serdes: add MAX9296A dr=
iver ---
commit 8d5f521bc04765a9e0396458e2f5ac75686e72fa
Author: Cosmin Tanislav <demonsingur@gmail.com>

media: i2c: maxim-serdes: add MAX9296A driver

Add a new MAX9296A driver that also supports MAX96714, MAX96714F,
MAX96714R, MAX96716A and MAX96792A.

> diff --git a/drivers/media/i2c/maxim-serdes/max9296a.c b/drivers/media/i2=
c/maxim-serdes/max9296a.c
> new file mode 100644
> index 0000000000000..3dcdb63dbb9ee
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max9296a.c

[ ... ]

> +	/* Configure lane mapping. */
> +	/*
> +	 * The lane of each PHY can be mapped to physical lanes 0, 1, 2, and 3.
> +	 * This mapping is exclusive, multiple lanes, even if unused cannot be
> +	 * mapped to the same physical lane.
> +	 * Each lane mapping is represented as two bits.
> +	 */
> +	val =3D 0;
> +	for (i =3D 0; i < num_hw_data_lanes ; i++) {
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
> +	if (phy->index =3D=3D 0 && priv->info->phy0_lanes_0_1_on_second_phy)
> +		val =3D ((val & 0xf) << 4) | ((val >> 4) & 0xf);

[Severity: High]
Does this logic correctly handle physical lane routing for the PHY0 hardware
quirk?=20

Since val stores the physical lane targets per logical lane, swapping the
4-bit nibbles swaps the logical lane assignments rather than the physical
targets. For example, if a custom mapping like data-lanes =3D <4 3> is
requested, this shift moves the mapping to the unused logical lanes 2 and 3,
while logical lanes 0 and 1 receive the default ffz mapping.=20

Should this instead transform the physical targets, for example by XORing
them with 2?

> +
> +	ret =3D regmap_update_bits(priv->regmap, MAX9296A_MIPI_PHY3(index),
> +				 MAX9296A_MIPI_PHY3_PHY_LANE_MAP_4,
> +				 FIELD_PREP(MAX9296A_MIPI_PHY3_PHY_LANE_MAP_4, val));
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Configure lane polarity.
> +	 *
> +	 * PHY 0 and 1 are on register 0x335.
> +	 * PHY 2 and 3 are on register 0x336.
> +	 *
> +	 * Each PHY has 3 bits of polarity configuration.
> +	 *
> +	 * On MAX9296A, each bit represents the lane polarity of logical lanes.
> +	 * Each of these lanes can be mapped to any physical lane.
> +	 * 0th bit is for lane 0.
> +	 * 1st bit is for lane 1.
> +	 * 2nd bit is for clock lane.
> +	 *
> +	 * On MAX96714, each bit represents the lane polarity of physical lanes.
> +	 * 0th bit for physical lane 0.
> +	 * 1st bit for physical lane 1.
> +	 * 2nd bit for clock lane of PHY 0, the slave PHY, which is unused.
> +	 *
> +	 * 3rd bit for physical lane 2.
> +	 * 4th bit for physical lane 3.
> +	 * 5th bit for clock lane of PHY 1, the master PHY.
> +	 */
> +
> +	for (i =3D 0, val =3D 0; i < num_data_lanes; i++) {
> +		unsigned int map;
> +
> +		if (!phy->mipi.lane_polarities[i + 1])
> +			continue;
> +
> +		/*
> +		 * The numbers inside the data_lanes array specify the hardware
> +		 * lane each logical lane maps to.
> +		 * If polarity is set for the physical lanes, retrieve the
> +		 * physical lane matching the logical lane from data_lanes.
> +		 * Otherwise, when polarity is set for the logical lanes
> +		 * the index of the polarity can be used.
> +		 */
> +
> +		if (priv->info->polarity_on_physical_lanes)
> +			map =3D phy->mipi.data_lanes[i] - 1;
> +		else
> +			map =3D i;
> +
> +		val |=3D BIT(map);
> +	}
> +
> +	if (phy->index =3D=3D 0 && priv->info->phy0_lanes_0_1_on_second_phy)
> +		val =3D ((val & 0x3) << 2) | ((val >> 2) & 0x3);

[Severity: High]
Does this bitwise shift break polarity inversion for the active lanes?

Since the active logical lanes remain 0 and 1, shifting by 2 moves their
polarity configuration to the unused logical lanes 2 and 3.=20

As the polarity val here applies to logical lanes, does it need any quirk
adjustment at all?

> +
> +	ret =3D regmap_update_bits(priv->regmap, MAX9296A_MIPI_PHY5(index),
> +				 MAX9296A_MIPI_PHY5_PHY_POL_MAP_0_1 |
> +				 MAX9296A_MIPI_PHY5_PHY_POL_MAP_2_3,
> +				 FIELD_PREP(MAX9296A_MIPI_PHY5_PHY_POL_MAP_0_1, val) |
> +				 FIELD_PREP(MAX9296A_MIPI_PHY5_PHY_POL_MAP_2_3, val >> 2));

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-gmsl2-3_se=
rdes-v15-0-7212e9e5156a@analog.com?part=3D18

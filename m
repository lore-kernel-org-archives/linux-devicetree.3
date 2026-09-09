Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76805437CC
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 13:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961986; cv=none; b=Jc3/R3vIH4pjFv5biA3vbHQiM4c5Y4dsMcwiAf/COX0OYik/g022bkk+gzZrDmFGQ3LoPcPr9Y94XZ45/tYTTaB5Bx5DfMDJqzKQTGrGKdFGrl7d4nJrTH0whxTwMEYipGMPSq0PI68A/6z+wX4Dm3JTjERwWirUoEw60OJAcHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961986; c=relaxed/simple;
	bh=0uPvPNpkcZGekahMEekLOX30jmjNlvM5QoRbbYQTk3U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jCrBgj6Bvpsp7Sy76aGzXhegR12gYvJX0udvw9cAtnAC7E0WS2uYk7poQBbNS4i2NyYc8AoIhieAscNylZxhVJxemUeGnqjqjKsKbXj4sZ2aWVOvP7sPUkzM+QtvK2V/Sk8sTXYxIYmPv1s9Kip17GkSvm9wvmjC3Bea2mVz+Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hLEtI5Yj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hLEtI5Yj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33BCC1F00A3D;
	Wed,  9 Sep 2026 13:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788961984;
	bh=wWiYW35MGqSLsxMPa/5CIpMoelEULjLBOKxve6JGIHE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hLEtI5YjEF72GKxTDsO4UCqcrJbXpzcnq1BGvtp6usT0JlayVZdSoZZr42xxQR/sW
	 aLAZl43Ph+SsdBnAa+/DUMocI10eUpFf2l0QMm02rBStUN84LXDcfm+oAhBV2DRQGk
	 R5wRw3cmC9bKYsMgflUYxoryUNABtS42P4FtHBGzLnNx47Ik1AJBJG0grqIt5kD4KW
	 wabRuRfeEjZlI9vD5KCNGqw/jrQImFeEisO8ANBPIOXNdLMbAcF+vTOTf87hZlZO08
	 fXChMg/QSE1qgWUGUCUAn7MZPbimjyMQKdLdydWDqP7Q4eFR0MCrwpAJdw6TiP1arw
	 tZdTBwzRR0mQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 22/22] media: i2c: maxim-serdes: add MAX9296A driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260909-gmsl2-3_serdes-v17-22-002499e534e8@analog.com>
References: <20260909-gmsl2-3_serdes-v17-0-002499e534e8@analog.com>
 <20260909-gmsl2-3_serdes-v17-22-002499e534e8@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 13:53:03 +0000
Message-Id: <20260909135304.33BCC1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] MIPI TX controller registers (e.g. MIPI_TX10, MIPI_TX3, MIPI_TX51)=
 are incorrectly configured using PHY IDs instead of Pipe IDs, leaving vide=
o pipes 0 and 3 unconfigured.
--

commit 66bd782f7bdf1b5e7ef00c3c965bc6161148af83
Author: Cosmin Tanislav <demonsingur@gmail.com>

media: i2c: maxim-serdes: add MAX9296A driver

Add a new MAX9296A driver that also supports MAX96714, MAX96714F,
MAX96714R, MAX96716A and MAX96792A.

Integrate it with the common Deserializer framework, while keeping
compatibility with existing usecases, avoiding code duplication, and
also enabling more features across all chips.

> diff --git a/drivers/media/i2c/maxim-serdes/max9296a.c b/drivers/media/i2=
c/maxim-serdes/max9296a.c
> new file mode 100644
> index 0000000000000..7b25b54e63deb
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max9296a.c
> @@ -0,0 +1,1461 @@
[ ... ]
> +static int max9296a_init_phy(struct max_des *des, struct max_des_phy *ph=
y)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +	bool is_cphy =3D phy->bus_type =3D=3D V4L2_MBUS_CSI2_CPHY;
> +	unsigned int num_data_lanes =3D phy->mipi.num_data_lanes;
> +	unsigned int dpll_freq =3D is_cphy ? phy->link_frequency
> +					 : phy->link_frequency * 2;
> +	unsigned int num_hw_data_lanes;
> +	unsigned int hw_index =3D max9296a_phy_id(priv, phy);
> +	unsigned int index =3D phy->index;
> +	unsigned int used_data_lanes =3D 0;
> +	unsigned int val;
> +	unsigned int i;
> +	int ret;
[ ... ]
> +	/* Configure a lane count. */
> +	ret =3D regmap_update_bits(priv->regmap, MAX9296A_MIPI_TX10(hw_index),
> +				 MAX9296A_MIPI_TX10_CSI2_LANE_CNT,
> +				 FIELD_PREP(MAX9296A_MIPI_TX10_CSI2_LANE_CNT,
> +					    num_data_lanes - 1));

[Severity: High]
Are the MIPI_TX registers correctly indexed using the PHY ID here?

The MIPI_TX register block (base 0x400) appears to be per-pipe as seen in
max9296a_set_pipe_remap(), meaning its index should likely be the pipe ID
(0, 1, 2, 3), not the PHY ID. If indexed by PHY ID, video pipes 0 and 3 will
remain unconfigured, while pipes 1 and 2 will be misconfigured.

> +	if (ret)
> +		return ret;
[ ... ]
> +static int max9296a_set_phy_mode(struct max_des *des, struct max_des_phy=
 *phy,
> +				 struct max_des_phy_mode *mode)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +	unsigned int phy_id =3D max9296a_phy_id(priv, phy);
> +	int ret;
> +
> +	/* Set alternate memory map modes. */
> +	ret =3D regmap_assign_bits(priv->regmap, MAX9296A_MIPI_TX51(phy_id),
> +				 MAX9296A_MIPI_TX51_ALT_MEM_MAP_12,
> +				 mode->alt_mem_map12);

[Severity: High]
Does this code also incorrectly use the PHY ID to configure the alternate m=
emory
map on the MIPI TX block instead of the pipe ID?

> +	if (ret)
> +		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-gmsl2-3_se=
rdes-v17-0-002499e534e8@analog.com?part=3D22

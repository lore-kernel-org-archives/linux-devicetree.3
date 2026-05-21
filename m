Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56B03E556B
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370594; cv=none; b=VWrwe+s4whS3q9xg8Oq2dvirDRLm4Cn0Zg422KCVv0kJ0W5CbGlNHKZ4jYo1MLJd00mePTb3REuLIc5BFzAehM7AaVPPt62VdyeCaCv6XqW1TJp3K0vgvr3El0uaNtK4GoMtWq80XzZ8jXNS9igawl0gckubJloKHeHzpxGVHSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370594; c=relaxed/simple;
	bh=neathnGLKu0iBMfnJeA1h15bOA216Aqph6lh7EznpwM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qHVOw4IhJGQF4jmjXwV/lf312Xb9u3t5bJh2wx9PB7BdAhoMzJdtAn0v3mZE3LmvG0iyr4WG+3xnfd/53VB3FxltLzxX+1Lfv1TnH+/m03jBjDHJdn918SXuSudasLay5M2aihjWscIoR5LQPEnabGWppy9XTV/aMVlzZLNXdeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZ3DWicu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZ3DWicu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B531F000E9;
	Thu, 21 May 2026 13:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779370592;
	bh=FuDpfx0dN1lcIKm+mdv3RyF2gy3uADCy4umHteb33es=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JZ3DWicub6BOdc6NndbY64pF1DUttD9iL+6/CcqncFbLUCphp+g3CHpcjs9E9vCeJ
	 FYvQGCNCCmJiJgJbhuYbYJamADfXv271JvnwhvLcmsk3GMcZ6MCAf+LTmNPQ0m5aSp
	 Wr/oOBDGI+/k+XE9WRAtvhNihA1esPoHY7RGRC5TSQSruBzQbznkgFp+jChnocWIZr
	 MjDv/XheE7i5PK9I759okAkBJWdQmYWM0dqAAfqlDG1Q2ZZI6eH1wdmat8Y4+zux1v
	 Snm0FAtQj35G9JJ1zFCzmPJPK24/oxN0vwK53a4l0k7xrWAMHlbWFarnXcb2PhQxG5
	 hYmzEsOOF+Mjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 17/22] media: i2c: maxim-serdes: add MAX96724 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521-gmsl2-3_serdes-v12-17-b26d92931196@analog.com>
References: <20260521-gmsl2-3_serdes-v12-17-b26d92931196@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 13:36:31 +0000
Message-Id: <20260521133632.39B531F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Incorrect macro definition for MAX96724_BACKTOP32_BPP12(p) causes =
register corruption for pipes 4-7.
- [High] Disabling an unused PHY inadvertently disables half of the active =
PHY when using 4-lane mode.
- [Medium] The VIDEO_MAX96724 config selects VIDEO_MAXIM_SERDES without inh=
eriting its dependency on VIDEO_DEV.
- [Medium] Missing GPIO power-off in probe error paths leaves the hardware =
powered on indefinitely.
- [Medium] The 64-bit link_frequency is truncated to a 32-bit unsigned int =
before being passed to a 64-bit division function.
- [Low] Mismatch between comment and actual bitfield operation for PHY 4-la=
ne standby masks.
--

commit e87ac21571cc062a409316fe229ce7535941f437
Author: Cosmin Tanislav <demonsingur@gmail.com>

media: i2c: maxim-serdes: add MAX96724 driver

Add a new MAX96724 driver that also supports MAX96712, MAX96724F
and MAX96724R. Integrate it with the common deserializer framework,
while keeping compatibility with existing usecases, avoiding code
duplication, and also enabling more features across all chips.

> diff --git a/drivers/media/i2c/maxim-serdes/Kconfig b/drivers/media/i2c/m=
axim-serdes/Kconfig
> index ddbb5791e9349..f060307e3de38 100644
> --- a/drivers/media/i2c/maxim-serdes/Kconfig
> +++ b/drivers/media/i2c/maxim-serdes/Kconfig
> @@ -33,3 +33,15 @@ config VIDEO_MAX96717
> =20
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called max96717.
> +
> +config VIDEO_MAX96724
> +	tristate "Maxim MAX96724 Quad Deserializer support"
> +	depends on I2C
> +	select VIDEO_MAXIM_SERDES

[Severity: Medium]
Does selecting VIDEO_MAXIM_SERDES here without inheriting its dependency on
VIDEO_DEV cause Kconfig unmet direct dependency warnings? Compiling the
kernel with I2C=3Dy and VIDEO_DEV=3Dn might trigger warnings.

> diff --git a/drivers/media/i2c/maxim-serdes/max96724.c b/drivers/media/i2=
c/maxim-serdes/max96724.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max96724.c
[ ... ]
> +#define MAX96724_BACKTOP31(p)			(0x41e + (p) / 4 * 0x20)
> +#define MAX96724_BACKTOP31_BPP10DBL2		BIT(6)
> +#define MAX96724_BACKTOP31_BPP10DBL2_MODE	BIT(7)
> +
> +#define MAX96724_BACKTOP32(p)			(0x41f + (p) / 4 * 0x20)
> +#define MAX96724_BACKTOP32_BPP12(p)		BIT(p)

[Severity: High]
Can this corrupt register 0x43f when configuring 12-bit double mode for
pipes 4-7? BIT(p) evaluates to BIT(4) through BIT(7) for those pipes, which
might overwrite the 10-bit mode configuration (e.g., BPP10DBL0) instead of
setting the correct BPP12 bit. Should this be BIT((p) % 4) instead?

[ ... ]
> +static int max96724_init_phy(struct max_des *des, struct max_des_phy *ph=
y)
> +{
> +	struct max96724_priv *priv =3D des_to_priv(des);
> +	bool is_cphy =3D phy->bus_type =3D=3D V4L2_MBUS_CSI2_CPHY;
> +	unsigned int num_data_lanes =3D phy->mipi.num_data_lanes;
> +	unsigned int dpll_freq =3D is_cphy ? phy->link_frequency
> +					 : phy->link_frequency * 2;

[Severity: Medium]
Will this truncate the 64-bit link_frequency if link_frequency * 2 exceeds
UINT_MAX (e.g., frequencies > 2.14 GHz)? Since dpll_freq is later passed to
div_u64() which expects a 64-bit dividend, should this be declared as a u64
to prevent silent overflow?

[ ... ]
> +static int max96724_set_phy_enable(struct max_des *des, struct max_des_p=
hy *phy,
> +				   bool enable)
> +{
> +	struct max96724_priv *priv =3D des_to_priv(des);
> +	unsigned int index =3D max96724_phy_id(des, phy);
> +	unsigned int num_hw_data_lanes;
> +	unsigned int mask;
> +
> +	num_hw_data_lanes =3D max_des_phy_hw_data_lanes(des, phy);
> +
> +	if (num_hw_data_lanes =3D=3D 4)
> +		/* PHY 1 -> bits [1:0] */
> +		/* PHY 2 -> bits [3:2] */

[Severity: Low]
This isn't a bug, but the comment mentions bits [1:0] and [3:2], while the
MAX96724_MIPI_PHY2_PHY_STDB_N_4 macro evaluates to GENMASK(5, 4) and
GENMASK(7, 6). Could this comment be updated for accuracy?

> +		mask =3D MAX96724_MIPI_PHY2_PHY_STDB_N_4(index);
> +	else
> +		mask =3D MAX96724_MIPI_PHY2_PHY_STDB_N_2(index);
> +
> +	return regmap_assign_bits(priv->regmap, MAX96724_MIPI_PHY2, mask, enabl=
e);
> +}

[Severity: High]
Does this inadvertently break PHY 0 when it is running in 4-lane mode?

If PHY 0 is in 4-lane mode, it combines with PHY 1, leaving
phy[1].enabled =3D false. The common framework calls this function for the
disabled PHY 1, which max96724_phy_id() maps to index 0.

Because num_hw_data_lanes for phy[1] is 0, the else branch sets mask to
MAX96724_MIPI_PHY2_PHY_STDB_N_2(0), which is BIT(4), and clears it. However,
PHY 0's 4-lane mode needs both BIT(4) and BIT(5) set.

Should this function return early when handling disabled PHYs during 4-lane
mode?

[ ... ]
> +static int max96724_probe(struct i2c_client *client)
> +{
[ ... ]
> +	if (priv->gpiod_enable) {
> +		/* PWDN must be held for 1us for reset */
> +		udelay(1);
> +
> +		gpiod_set_value_cansleep(priv->gpiod_enable, 1);
> +
> +		/* Maximum power-up time (tLOCK) 4ms */
> +		usleep_range(4000, 5000);
> +	}
> +
> +	priv->cc_port_cfg =3D MAX96724_REG3_CC_PORT_CFG_PORT0;
> +
> +	ret =3D device_property_read_u32(dev, "maxim,control-channel-port",
> +				       &cc_port);
> +	if (!ret) {
> +		switch (cc_port) {
> +		case 0:
> +			priv->cc_port_cfg =3D MAX96724_REG3_CC_PORT_CFG_PORT0;
> +			break;
> +		case 1:
> +			priv->cc_port_cfg =3D MAX96724_REG3_CC_PORT_CFG_PORT1;
> +			break;
> +		default:
> +			dev_err(dev, "Invalid control-channel port %u\n", cc_port);
> +			return -EINVAL;
> +		}
> +	} else if (ret !=3D -ENODATA && ret !=3D -ENOENT && ret !=3D -EINVAL) {
> +		return ret;
> +	}
> +
> +	*info =3D max96724_des_info;
> +	info->versions =3D priv->info->versions;
> +	info->modes =3D priv->info->modes;
> +	info->num_pipes =3D priv->info->num_pipes;
> +	priv->des.info =3D info;
> +
> +	*ops =3D max96724_des_ops;
> +	ops->set_pipe_tunnel_enable =3D priv->info->set_pipe_tunnel_enable;
> +	ops->set_pipe_phy =3D priv->info->set_pipe_phy;
> +	ops->set_pipe_tunnel_phy =3D priv->info->set_pipe_tunnel_phy;
> +	priv->des.ops =3D ops;
> +
> +	ret =3D max96724_reset(priv);
> +	if (ret)
> +		return ret;
> +
> +	return max_des_probe(client, &priv->des);
> +}

[Severity: Medium]
If max96724_reset() or max_des_probe() fails and returns an error, is the
hardware left powered on indefinitely? While devres will free the GPIO
descriptor, it doesn't actively pull the pin low. Should the error paths
symmetrically deassert the GPIO to match the cleanup in max96724_remove()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-gmsl2-3_se=
rdes-v12-0-b26d92931196@analog.com?part=3D17

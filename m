Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572533DE439
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370481; cv=none; b=bltpYUXCYNNQ+Z4mcRzVtvxge+s7+fDh8/BTGjYOetieuOIw+HQO1UhyTMuhiotqtuwAYNiKSaX/BmRQxMfkQhumSHjPFljKdqw3tSOPASfx93iuvDNc0acI5FvMzMGUEi/rbDjmON3XVKvfjz30MoqC8oAJjZblPY0vRIYinuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370481; c=relaxed/simple;
	bh=VHNl2FJuZREXOuYJTjFF6lcubq9teRXcmkAbvZo+xOM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DxVlfyC17QiQW87tSdoDjwZf5sZiHuSPKhbY+KqbqZGcrwmEzSDRseblGJu1+wqWFdesl+ImRNaQsl737v9i3B0NXEjjTu5pKBBzY0BwW1y205//EVM6HNej/uLpp2naezOFDVXzrKE1EsLuxyWXv6H2BbyOW4Oj5sae9gk2Yak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rn2r5VSZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rn2r5VSZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2821F00A3C;
	Thu, 21 May 2026 13:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779370480;
	bh=kIn48+50eYsxEVhrkPItncx80Sm0R3JWSEPt9Rm/dW4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rn2r5VSZqZRx2mf7vc8zl46Rff4WEgVKYKihoA8+OhngvNpPnlBmvNDRsCdZKp+VY
	 jLSXwe+TLpDkXOsmmsznXjB9sOSn5pBXDCu+d8AOwhe48H6Ke7SmOKqgFs2fu+oBL7
	 BWquudXbVLEmQBsXA6WS7I1SBX74piGumB0eqQ4ohkPdE3ZBDGNiX94iAc0r+rK53Y
	 6JNgoHnO6+gOXzjyXQpzf5PgUzrxrdTIuC83qaOTx9yvXAlT57Ww0uKIPy0xNOtij/
	 lqhtmsLlthkK0vXggvF6/xeUsy9vuvc8mwolofUV6Oo011YxTp1Q2l9tp3Zpp9hHt5
	 Zeqbj1nkTjl9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 18/22] media: i2c: maxim-serdes: add MAX9296A driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521-gmsl2-3_serdes-v12-18-b26d92931196@analog.com>
References: <20260521-gmsl2-3_serdes-v12-18-b26d92931196@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 13:34:38 +0000
Message-Id: <20260521133439.CA2821F00A3C@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] max96792a_ops is missing the .set_pipe_link callback, preventing p=
roper link routing.
- [High] max9296a_set_pipe_stream_id ignores the new stream_id argument and=
 programs the old state.
- [High] Unvalidated data lane values of 0 can trigger an integer underflow=
 and undefined bitwise shift behavior.
- [Medium] The device remains powered on (resource state leak) if probe fai=
ls after toggling the powerdown GPIO.
- [Low] The Kconfig symbol VIDEO_MAX9296A selects VIDEO_MAXIM_SERDES but do=
es not inherit its dependency on VIDEO_DEV.
--

commit dd3188793bbc20f9b99b6950a6fcec1fa7e23c5d
Author: Cosmin Tanislav <demonsingur@gmail.com>

media: i2c: maxim-serdes: add MAX9296A driver
   =20
Add a new MAX9296A driver that also supports MAX96714, MAX96714F,
MAX96714R, MAX96716A and MAX96792A.

Integrate it with the common Deserializer framework.

> diff --git a/drivers/media/i2c/maxim-serdes/Kconfig b/drivers/media/i2c/m=
axim-serdes/Kconfig
> --- a/drivers/media/i2c/maxim-serdes/Kconfig
> +++ b/drivers/media/i2c/maxim-serdes/Kconfig
[ ... ]
> @@ -45,3 +45,16 @@ config VIDEO_MAX96724
> =20
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called max96724.
> +
> +config VIDEO_MAX9296A
> +	tristate "Maxim MAX9296A Dual Deserializer support"
> +	depends on I2C
> +	select VIDEO_MAXIM_SERDES

[Severity: Low]
Is there a missing dependency here? VIDEO_MAXIM_SERDES depends on VIDEO_DEV,
but this config only depends on I2C. Selecting a symbol without meeting its
dependencies can lead to unmet direct dependency warnings and silent build
failures.

> diff --git a/drivers/media/i2c/maxim-serdes/max9296a.c b/drivers/media/i2=
c/maxim-serdes/max9296a.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max9296a.c
[ ... ]
> +static int max9296a_init_phy(struct max_des *des, struct max_des_phy *ph=
y)
> +{
[ ... ]
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

[Severity: High]
What happens if a malformed Device Tree provides a lane value of 0?

It appears the core framework only validates if the value exceeds
num_data_lanes. If the data lane is 0, the subtraction will underflow to
UINT_MAX, which could trigger undefined behavior when shifting bits in the
BIT(map) macro.

[ ... ]
> +static int max9296a_set_pipe_stream_id(struct max_des *des, struct max_d=
es_pipe *pipe,
> +				       unsigned int stream_id)
> +{
> +	struct max9296a_priv *priv =3D des_to_priv(des);
> +	unsigned int index =3D max9296a_pipe_id(priv, pipe);
> +
> +	return regmap_update_bits(priv->regmap, MAX9296A_RX50(index), MAX9296A_=
RX50_STR_SEL,
> +				  FIELD_PREP(MAX9296A_RX50_STR_SEL, pipe->stream_id));

[Severity: High]
Should this use the passed stream_id argument instead of pipe->stream_id?

If the framework hasn't updated the pipe state yet, this might program
the hardware with the old stream ID, potentially breaking video stream
routing.

[ ... ]
> +static int max9296a_probe(struct i2c_client *client)
> +{
[ ... ]
> +	if (priv->gpiod_pwdn) {
> +		/* PWDN must be held for 1us for reset */
> +		udelay(1);
> +
> +		gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
> +		/* Maximum power-up time (tLOCK) 4ms */
> +		usleep_range(4000, 5000);
> +	}
> +
> +	priv->des.info =3D priv->info->info;
> +	priv->des.ops =3D priv->info->ops;
> +
> +	ret =3D max9296a_reset(priv);
> +	if (ret)
> +		return ret;

[Severity: Medium]
If max9296a_reset() or max_des_probe() fails below, does the device remain
powered on?

The powerdown GPIO is driven to 0 here to wake up the device, but it
doesn't appear to be reverted to 1 on the error paths, potentially leaving
the hardware drawing power.

> +
> +	return max_des_probe(client, &priv->des);
> +}
[ ... ]
> +static const struct max_des_ops max96792a_ops =3D {
> +	MAX9296A_COMMON_OPS,
> +	.set_pipe_stream_id =3D max96714_set_pipe_stream_id,
> +	.set_pipe_enable =3D max96714_set_pipe_enable,
> +	.set_pipe_tunnel_phy =3D max96716a_set_pipe_tunnel_phy,
> +	.set_pipe_tunnel_enable =3D max96714_set_pipe_tunnel_enable,
> +};

[Severity: High]
Should this struct include the .set_pipe_link callback?

The MAX96792A chip supports 2 pipes and 2 links, and it looks like the clos=
ely
related max96716a_ops uses max96716a_set_pipe_link for proper link routing.
Without it, could the core framework skip configuring the pipe-to-link mapp=
ing,
leaving the hardware with an incomplete configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-gmsl2-3_se=
rdes-v12-0-b26d92931196@analog.com?part=3D18

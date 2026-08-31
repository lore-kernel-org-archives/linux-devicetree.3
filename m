Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886B4439354
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 13:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184582; cv=none; b=Pa3KazVznxglnRtu1ZXHis1mbg1uoYQSIUEFM8HqAALLR6LcVXa2Dma5/SnH3mrYbhWVg3GbxRQxdURBCEwNGktqFdxRKcWUW73Y7jL3zc86QRcw+EI9If09+kdyArp4AWACRYmV6R3kn8IFZ/tgOsbPC5LpgJe4YK9UAXw1+Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184582; c=relaxed/simple;
	bh=/BY81AXykTf8NAi4C3kSS2zBOsyNdt/6xHy16ehOfP0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jfeRHVMQntYB7dalGuR/rCUCgIOU4LxCBJCbBA/6UPKpORnE17fY9HM1gAQvju0bNOf32j8BpMfSCkDQV0kN53QbNb5SQYSIQErcZ6lUpAlcyiH/psE8EBen2V9KfS/irP2Eu33WM4E06z8IdceP3iWQhGbcninBsKUAmmM7Y8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Znovn1PD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Znovn1PD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC601F00A3E;
	Mon, 31 Aug 2026 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788184581;
	bh=+e8V0PLSqjMelu3HH3Utjz0nJXZq+xCL5GD/8QI/AoU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Znovn1PDrnU0yOWiONjr2hfhf+VYYjCVXn1/i/bqatQqrZM4wRz9vwqpJnmLiON1F
	 +mjUFkss574khrP/kAkMePrIoSOiWnbKoA2863GwvKw7JWGM3txBEsFnQjZj+gqmnA
	 btJpO18KFJbmxxHg4y1rkQci+eC711To1Qoik5auCBU6rdeQnflBhe7NFgKiw/D5EQ
	 upfey05jeRtDELSv+Kfx7IB+uIZcAl/jY7FA0QJBjZDFdGcQ76ezFJDEDUhi55HMxm
	 1M4fyUto66vNG01cN6OMCOuoFVgu7cbBLbaC9AhS1uhOJVD7pL9PkqzSy4wfY0r7qx
	 LbQmyWhR2wteQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 20/22] media: i2c: maxim-serdes: add MAX96724 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
In-Reply-To: <20260831-gmsl2-3_serdes-v16-20-4fa6e08bb514@analog.com>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <20260831-gmsl2-3_serdes-v16-20-4fa6e08bb514@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 13:56:20 +0000
Message-Id: <20260831135621.0EC601F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect clock polarity configuration for 4-lane mode on PHY 2.
--

commit feec3c7ecf801109d27fdda12bede738f83b8546
Author: Cosmin Tanislav <demonsingur@gmail.com>

media: i2c: maxim-serdes: add MAX96724 driver

This commit adds support for the Maxim MAX96724 Quad Deserializer and
integrates it with the common deserializer framework.

> diff --git a/drivers/media/i2c/maxim-serdes/max96724.c b/drivers/media/i2=
c/maxim-serdes/max96724.c
> new file mode 100644
> index 0000000000000..458e78f285111
> --- /dev/null
> +++ b/drivers/media/i2c/maxim-serdes/max96724.c
[ ... ]
> +static int max96724_init_phy(struct max_des *des, struct max_des_phy *ph=
y)
> +{
[ ... ]
> +	if (num_hw_data_lanes =3D=3D 4) {
> +		ret =3D regmap_update_bits(priv->regmap, MAX96724_MIPI_PHY5(index),
> +					 MAX96724_MIPI_PHY5_PHY_POL_MAP_4_0_1 |
> +					 MAX96724_MIPI_PHY5_PHY_POL_MAP_4_2_3,
> +					 FIELD_PREP(MAX96724_MIPI_PHY5_PHY_POL_MAP_4_0_1,
> +						    val) |
> +					 FIELD_PREP(MAX96724_MIPI_PHY5_PHY_POL_MAP_4_2_3,
> +						    val >> 2));
> +		if (ret)
> +			return ret;
> +
> +		ret =3D regmap_assign_bits(priv->regmap, MAX96724_MIPI_PHY5(index),
> +					 MAX96724_MIPI_PHY5_PHY_POL_MAP_4_CLK,
                                         ^^^^

[Severity: High]
Does this hardcoded assignment to MAX96724_MIPI_PHY5_PHY_POL_MAP_4_CLK cause
an issue for the second port in a 4-lane configuration?

The macro MAX96724_MIPI_PHY5_PHY_POL_MAP_4_CLK unconditionally evaluates to
BIT(5). While this is correct for PHY 1 (the master for the PHY 0+1 group),
it seems incorrect for PHY 2 (the master for the PHY 2+3 group). For PHY 2,
it looks like the correct clock polarity bit should be BIT(2) in register
0x8a6.

Writing to BIT(5) when configuring PHY 2 leaves its own clock polarity
unconfigured (falling back to default) and inadvertently overwrites PHY 3's
clock polarity instead. This could break MIPI D-PHY links on the second
4-lane port when configured via the device tree.

> +					 phy->mipi.lane_polarities[0]);
> +		if (ret)
> +			return ret;
> +	} else {
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-gmsl2-3_se=
rdes-v16-0-4fa6e08bb514@analog.com?part=3D20

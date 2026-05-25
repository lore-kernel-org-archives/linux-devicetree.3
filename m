Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CBC3A1DB
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 15:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779722250; cv=none; b=S5vhB9mlcx1AXiT/jGdh+MmJpOdD9aS4FB8JPjPI/Y/1ztyUrEuc+/SStlksjJ3l6sT+o16pKAt+aUlbzUdfIzYGEHP2HL8RjGmXhfVr83CJfMrn9H0ZmxedXFMxggHXNHwWH4T/TAoR+5SUUVXu2rt/b/A8kY2lvT2xVVi5DzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779722250; c=relaxed/simple;
	bh=OHz7LbAXzaFwZrpRRno0mSqbe8h0w6nOlwLOEzTTCqc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JiaNNyDz+LPKZwihS9MnfYdToh5nT4LGnAG3S/IAaJuUhctF1ucPXI36wqmrZA/WI4ELzIAFdUcFkr59RLaFod+6IT6xKxlv2J0X94jbe8EbbMLUA83jf2TxhWoEY8pa+1y+m01Fwvz8x6KB56yMZcxOYtPqgsGkxLeq7TNNArk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SLgk1eCS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SLgk1eCS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A3B1F00A3A;
	Mon, 25 May 2026 15:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779722248;
	bh=FMgOdtjlME3ikR+FWWil/7Ykiis2ROUZlo8nibhDleM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SLgk1eCS9qgJYOgLdqAkWGJdJSzga13YQ8YtYTcwvEouDGQYfqPDgiPUPAW29G/aV
	 hgVf7BWaT7SC2bnKXZQDXLL3ZxEkwdnzfQGUApC2D4tA8uMgGu9Wj3rC7GcCTQE/qH
	 frrFXdp1jw0TltaAIQZehaSfhdCNDxpNqlMThvFki114ZfEVoNQA9qzyXGLD/ZHRyN
	 tKcjHa7fXdmCezc3+F7rI258IGM1n/9MP/TbAqb18g2Ad0/Na1YgSk2e8PYz9jBP6F
	 nGaueukaG/UEj2bMEZ9PSXlG5NSm7XsY4U8egoMVWCmugSZWq4j9C9nQO//hIi/nDq
	 sGC6Np3su1WrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/6] leds: is31fl319x: Fix shutdown GPIO initial
 state and remove redundant startup pulse
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jun Yan" <jerrysteve1101@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260525144629.498630-3-jerrysteve1101@gmail.com>
References: <20260525144629.498630-3-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 15:17:28 +0000
Message-Id: <20260525151728.A4A3B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Changing the shutdown GPIO initialization to `GPIOD_OUT_LOW` break=
s backwards compatibility with existing device trees that use `GPIO_ACTIVE_=
HIGH`.
- [High] Removing the 5ms startup pulse on the shutdown GPIO eliminates a c=
ritical hardware stability workaround necessary for I2C recovery.
--

commit fcc0a676fc8cf1ed234a4483a3db1410e5475415
Author: Jun Yan <jerrysteve1101@gmail.com>

leds: is31fl319x: Fix shutdown GPIO initial state and remove redundant star=
tup pulse

This commit alters the initial state of the shutdown GPIO from OUT_HIGH
to OUT_LOW. It also removes the 5ms toggle of the shutdown GPIO during
driver probe, relying instead on the existing software reset via I2C.

Link: https://lumissil.com/assets/pdf/core/IS31FL3193_DS.pdf

> diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319=
x.c
> index e411cee06dabd..41087ed262cb4 100644
> --- a/drivers/leds/leds-is31fl319x.c
> +++ b/drivers/leds/leds-is31fl319x.c
> @@ -396,7 +396,10 @@ static int is31fl319x_parse_fw(struct device *dev, s=
truct is31fl319x_chip *is31)
>  	int count;
>  	int ret;
> =20
> -	is31->shutdown_gpio =3D devm_gpiod_get_optional(dev, "shutdown", GPIOD_=
OUT_HIGH);
> +	/* Driving this GPIO line low (in fact high) takes the chip out of shut=
down,
> +	 * as it is flagged as GPIO_ACTIVE_LOW in provider (such as the device =
tree).
> +	 */
> +	is31->shutdown_gpio =3D devm_gpiod_get_optional(dev, "shutdown", GPIOD_=
OUT_LOW);

[Severity: High]
Does this break backwards compatibility with existing device trees that
configured the shutdown pin as GPIO_ACTIVE_HIGH?

Legacy device trees mapping logical 1 (GPIOD_OUT_HIGH) to a physical HIGH
signal will now drive the physical pin LOW when GPIOD_OUT_LOW is used. This
keeps the chip permanently in shutdown.

While a subsequent gpiolib commit in this series attempts to add a polarity
quirk, that quirk only covers 3 specific compatibles (issi,is31fl3199,
si-en,sn3190, si-en,sn3193). The driver supports 10 distinct compatibles,
so out-of-tree device trees using the other 7 (like issi,is31fl3193 or
si-en,sn3196) will bypass the quirk and fail to probe.

[ ... ]

> @@ -506,12 +509,6 @@ static int is31fl319x_probe(struct i2c_client *clien=
t)
>  	if (err)
>  		return err;
> =20
> -	if (is31->shutdown_gpio) {
> -		gpiod_direction_output(is31->shutdown_gpio, 0);
> -		mdelay(5);
> -		gpiod_direction_output(is31->shutdown_gpio, 1);
> -	}
> -

[Severity: High]
Does removing this hardware toggle prevent recovery of a wedged I2C bus?

The commit message states the toggle is redundant because a software reset
is performed via I2C later. However, the original commit adding this pulse
(dddb4e38c6ba) noted it was to make the chip more stable in complex EM
environments.

If EMI causes the chip's I2C state machine to become stuck (e.g., holding
SDA low), the subsequent software reset command via regmap_write() will
fail because the bus is unresponsive. Toggling the hardware shutdown pin
acts as a hardware reset for the I2C interface. Without this pulse, the
driver loses its ability to recover a hung I2C interface, which could lead
to probe failures with a no response from chip write error.

>  	is31->client =3D client;
>  	is31->regmap =3D devm_regmap_init_i2c(client, is31->cdef->is31fl319x_re=
gmap_config);
>  	if (IS_ERR(is31->regmap))

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525144629.4986=
30-1-jerrysteve1101@gmail.com?part=3D2

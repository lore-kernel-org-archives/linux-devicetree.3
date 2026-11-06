Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965488;
	b=QmaFJtVwvLHWW48il30iIDHelG0rZEda3K7zE4RLvpWeXXp+RWU2dbUXWgPCTvDSnBaf
	 cTx2eoSTL/7lgpj4KUPkTwZmaHUI2s5fjPJOBf69KkSzI6QWuvPrFZ/lwbgebGhb3Lxh1
	 faZeAyTgLNg6/YjZ6rrUG84hTRfsZh+eYsbED3sopFxYDa8bu9sLK7EAMbNyw2Yco8HnU
	 ECcuaaunzfcVI5vsi1xGGrmV8TkPHkrWWDytSksMX6jTSIhvNCWQORobKjyieb7qx4u9Q
	 lu5CAqAkYBg/DEWSv8CYjfATijeef7OzIfC02jFyM3z155gvq9fowwW5oxMjGvEXOkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965488;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=D6eJcucHZMy8pembbc9IHgWD5Kr5yTGsKrLvtlj+R/0=;
	b=xrjsC42Ac5k8trneO70Z+Pp+uWESKn19X1NBjM52XY2VH+c+Xc8msUzxvSFVuqB36tX/
	 vcRGHE33OWIEhVlHCJ5C2hWAYy8TWi40yeHoHWKC42WF6oOGxv6xwZekI4B/LffW1xJC6
	 xQzKdnaeypqlw8u28CUuXkJWcd+/6eY8QNK5RTJdZCMpNcrLraLalxys9oVYCd2HW2OdV
	 mwZa78M4gjy7O9zI2W9T7nURdkOopRYnNYIzb3MQVMNzwtW4bPDyLN/kENac4OICburco
	 AXV4jCRCxhOSFN4MitP2ohnzhHjFrM/4nb5FiuAzyhaure/nOB4HlNbMFWywzAoIljg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H6zU9NNm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E95D606A33D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 11:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H6zU9NNm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50201F0089F;
	Fri,  6 Nov 2026 11:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793965488;
	bh=D6eJcucHZMy8pembbc9IHgWD5Kr5yTGsKrLvtlj+R/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H6zU9NNmsYwNmRZNEbGr8ixRRd6bttEfqn8vZpsjUaC+kE7Pw+fgawvlrnkuCZpZC
	 cwMSIA+ExxJMhsjRURCWmr5PfKs4k53m1lm9u7TgILkNNY1PrUvNEkMOtjMKyyKTXE
	 A//K4fRElfH8yuqckO0YdnAlmBKl9P2Itt8O42IBMpb1rCvsFLhhZ8Ld8GZ8bNeJa2
	 drR4gEZtRKWBWbcOjOhDwAFUG+P0oLsU8fT4H6VO6oz7ais0b/AFXu/AbRJsJrEOfM
	 neLwlTe4Idyv1n30mGPZLJUQENnIXM8/4nb+KBjvano8GAq031rLc/h9GXJjPijsWW
	 LGObSuQe3Y35Q==
Message-ID: <sashiko-outbox-201353@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] regulator: willsemi,wl2868c: add the WL2868C camera
 PMIC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106113005.970822-3-xiaqinghuan@mail.ustc.edu.cn>
References: <20261106113005.970822-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261106113005.970822-3-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 11:44:47 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] regulator: wl2868c: check SYS_EN before seeding enabled in
  wl2868c_probe()
- [Medium] regulator: wl2868c: enable vsys before deasserting reset in
  wl2868c_probe()
- [Medium] regulator: wl2868c: handle vin7-supply for control logic in
  wl2868c_probe()
--

commit 3a2a7e94fa21fa44fb2fb53973938985aaea5820
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

regulator: willsemi,wl2868c: add the WL2868C camera PMIC driver

This commit adds a regulator driver for the Will Semiconductor WL2868C
seven-channel I2C camera PMIC.

> diff --git a/drivers/regulator/wl2868c-regulator.c b/drivers/regulator/wl=
2868c-regulator.c
> new file mode 100644
> index 0000000000000..64baeeacf378b
> --- /dev/null
> +++ b/drivers/regulator/wl2868c-regulator.c

[ ... ]

> +static int wl2868c_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct regulator_config config =3D { .dev =3D dev };
> +	struct regulator_dev *rdev;
> +	struct gpio_desc *reset;
> +	struct wl2868c *chip;
> +	unsigned int id, value;
> +	int ret, i;
> +
> +	chip =3D devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	mutex_init(&chip->lock);
> +	config.driver_data =3D chip;
> +
> +	reset =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(reset))
> +		return dev_err_probe(dev, PTR_ERR(reset), "Failed to get reset GPIO\n"=
);
> +
> +	if (reset) {
> +		ret =3D devm_add_action_or_reset(dev, wl2868c_reset, reset);
> +		if (ret)
> +			return ret;
> +		fsleep(1000);
> +	}

[Severity: Medium]
Should the supply be enabled before releasing reset and waiting 1 ms?

devm_regulator_get_enable(dev, "vsys") is called after this block, right
before reading the device id register.  If vsys was off before probe,
reset is deasserted and the 1 ms fsleep(1000) delay elapses while the chip
is still unpowered, and the first register read runs immediately after
vsys turns on with no startup delay.

Registering wl2868c_reset() before devm_regulator_get_enable() also means
devres teardown disables vsys before asserting reset on unbind.

> +
> +	chip->regmap =3D devm_regmap_init_i2c(client, &wl2868c_regmap_config);
> +	config.regmap =3D chip->regmap;
> +	if (IS_ERR(config.regmap))
> +		return dev_err_probe(dev, PTR_ERR(config.regmap),
> +				     "Failed to create regmap\n");
> +
> +	/*
> +	 * The I2C interface is powered from the higher of VIN7 and VSYS, so the
> +	 * system supply has to be up before the device can answer at all. It
> +	 * stays enabled for as long as the driver is bound.
> +	 */
> +	ret =3D devm_regulator_get_enable(dev, "vsys");
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable the system supply\n");

[Severity: Medium]
What happens on boards that power the control logic from vin7-supply and
omit vsys-supply?

The devicetree binding allows supplying either vin7-supply or vsys-supply:

Documentation/devicetree/bindings/regulator/willsemi,wl2868c.yaml:
    anyOf:
      - required:
          - vin7-supply
      - required:
          - vsys-supply

When vsys-supply is omitted, devm_regulator_get_enable(dev, "vsys") falls
back to a dummy regulator with a warning and leaves vin7-supply disabled
during the register reads below.  Because vin7 is only attached as the
supply for ldo7, the chip also loses control power whenever ldo7 is off.

> +
> +	ret =3D regmap_read(config.regmap, WL2868C_DEVICE_ID, &id);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to read device ID\n");
> +	if (id !=3D WL2868C_DEVICE_ID_VALUE)
> +		return dev_err_probe(dev, -ENODEV, "Unexpected device ID: %#x\n", id);
> +
> +	/*
> +	 * Seed the tracked set with the outputs the firmware left enabled, so
> +	 * that the first enable() or disable() of any output preserves them.
> +	 * The regulator core reads the state back through is_enabled(), which
> +	 * does not look at this set.
> +	 */
> +	ret =3D regmap_read(config.regmap, WL2868C_LDO_ENABLE, &value);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to read the enable register\n");
> +
> +	chip->enabled =3D value & WL2868C_LDO_ENABLE_MASK;

[Severity: Medium]
Does seeding chip->enabled without checking WL2868C_SYS_ENABLE turn on
preset outputs when the first regulator is enabled?

As described in wl2868c_enable(), firmware may preset per-output bits in
WL2868C_LDO_ENABLE while WL2868C_SYS_ENABLE is still clear, and
wl2868c_is_enabled() reports those outputs as disabled.  Copying those
bits into chip->enabled when WL2868C_SYS_ENABLE is clear causes the first
wl2868c_enable() call on any output to write WL2868C_SYS_ENABLE | ldos and
power on all preset outputs as well.  Seeding chip->enabled only when
value & WL2868C_SYS_ENABLE is set avoids this.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106113005.9708=
22-1-xiaqinghuan@mail.ustc.edu.cn?part=3D2

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932A63D0C00
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 22:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781305178; cv=none; b=N4pI+D8B12AbnYOrbf+HgAeWzSQBAVnQNyWZF5bQZN0V8DEpw4FYnkLUhwS7mPe+N/TqPwRUaedqhZ++RNyPOHWPPTsVG8axB4QgYz7woqJYdchA1y/oTVs1N9RPESYUPKnRd1dPlcgLhfcj1WHsHk/mLvHrK7uslRufSG/9dMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781305178; c=relaxed/simple;
	bh=suH9WSTLs1E0XyzVbjhLBsIiipLv9aYJLpaYrIWMqjk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PHP3MIO/uxvAzoaQA1tFgX/ET4HBgc/FhN2Ielnd4qLI15nhKWECIaDGJbcl61eApAaGuneRmsoR8XWh+6dV4zZTel8p5ZYNAWH4pOXcPxLISxjQNwjIp9EEFQWB3wJ2zopjrmMlX2eitopF8LcvfPCdPpkqbCVRzCy/xhF6GtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HoAZNG9B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HoAZNG9B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160421F000E9;
	Fri, 12 Jun 2026 22:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781305177;
	bh=K7tLVNpuWK1gDlgcLjhGLoaUGSLqAMI2xFSw4m+NABw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HoAZNG9BW+mZknvW6Zz8/zaoKCQ40Him5ZecjKHmL5w8/4EtlEawWZCXV316+poNw
	 3ZTAEw3RXN43cs/qC1zjplT8jX39HKzaVNajNG8TZ+zFQ5YAkGTHCd1pEpufyKpZVZ
	 M7/NobSGep673RWJmqqynURkpSwwRgK7pb9fsF/6qREl1v62Ad+DgJU00qgKCdQBGB
	 Rj0OjIcmLglDZf+rHZImO0T2a3UnfHu8GhNWROJdhacWCDbyH9LFgouumBoNTIj3/f
	 fy0rC4eV3EVBb8oaPKoOXRiHTesDKWGtKlhZEG3LWiHew39cpgzlqDWG30lQN73q5Z
	 Bs8wREE5CxpIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] iio: adc: ti-ads1262: Add GPIO controller support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260612-ads126x-v1-3-894c788d03ed@gmail.com>
References: <20260612-ads126x-v1-3-894c788d03ed@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 22:59:36 +0000
Message-Id: <20260612225937.160421F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [High] The `ads1262_gpiochip_request` function leaks a runtime PM usage r=
eference on the error path if `regmap_update_bits` fails.
- [High] `ads1262_gpiochip_get_multiple` does not populate the `bits` array=
 and incorrectly returns a positive integer on success.
- [High] `ads1262_gpiochip_direction_input` clears the direction bit instea=
d of setting it for any pin other than AIN3, incorrectly configuring them a=
s outputs.
- [High] `ads1262_gpiochip_get_direction` returns unnormalized bitmask valu=
es, causing the GPIO core to reject them as errors.
- [High] Read-modify-write operations on the volatile `ADS1262_GPIODAT_REG`=
 can corrupt other GPIO output states.
- [Medium] GPIO output direction and value are configured in the wrong orde=
r, causing a brief hardware glitch.

Pre-existing issues:
- [High] The driver uses C bitfields to define hardware registers, leading =
to incorrect device configuration on big-endian architectures.
--

commit eb4400b2ae3fbe9b5c7913202712fe75c797c8c0
Author: Kurt Borja <kuurtb@gmail.com>

iio: adc: ti-ads1262: Add GPIO controller support

Add support for the GPIO controller capability found in both TI ADS1262
and ADS1263 ADCs. Eight analog input pins can be programmed as GPIO.

> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> index fd1911cf65ace..6d5f22836ad8b 100644
> --- a/drivers/iio/adc/ti-ads1262.c
> +++ b/drivers/iio/adc/ti-ads1262.c

[ ... ]

> @@ -1050,6 +1055,146 @@ static irqreturn_t ads1262_trigger_handler(int ir=
q, void *p)
>  	return IRQ_HANDLED;
>  }
> =20
> +static int ads1262_gpiochip_request(struct gpio_chip *gc, unsigned int o=
ffset)
> +{
> +	struct ads1262 *st =3D gpiochip_get_data(gc);
> +	struct device *dev =3D &st->spi->dev;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_update_bits(st->regmap, ADS1262_GPIOCON_REG,
> +				  BIT(offset), BIT(offset));

[Severity: High]
Does this error path leak a runtime PM usage reference?

If regmap_update_bits() fails:

ads1262_gpiochip_request()
    ret =3D pm_runtime_resume_and_get(dev);
    // ...
    return regmap_update_bits(...); // Fails, returns error

Because the gpiolib core will not invoke .free for a pin that fails to be
requested, this usage count is permanently leaked, preventing the device fr=
om
ever entering runtime suspend.

> +}

[ ... ]

> +static int ads1262_gpiochip_get_direction(struct gpio_chip *gc,
> +					  unsigned int offset)
> +{
> +	struct ads1262 *st =3D gpiochip_get_data(gc);
> +	unsigned int val;
> +	int ret;
> +
> +	ret =3D regmap_read(st->regmap, ADS1262_GPIODIR_REG, &val);
> +	if (ret)
> +		return ret;
> +
> +	return val & BIT(offset);

[Severity: High]
Does this return unnormalized bitmask values?

For input pins with offset > 0, val & BIT(offset) returns values like 2, 4,
or 8. The GPIO subsystem strictly checks for 0 or 1 and returns -EBADE
otherwise, rendering the direction read functionality broken for most pins.

> +}
> +
> +static int ads1262_gpiochip_direction_input(struct gpio_chip *gc,
> +					    unsigned int offset)
> +{
> +	struct ads1262 *st =3D gpiochip_get_data(gc);
> +
> +	return regmap_update_bits(st->regmap, ADS1262_GPIODIR_REG,
> +				  BIT(offset), 1);

[Severity: High]
Does this clear the direction bit instead of setting it for any pin other
than AIN3?

Because val is hardcoded to 1, val & BIT(offset) evaluates to 0 for any
offset > 0. This unintentionally clears the bit, configuring the pin as an
output instead of an input. If an external component is actively driving the
line, this creates an electrical short circuit, potentially causing hardware
damage.

> +}
> +
> +static int ads1262_gpiochip_direction_output(struct gpio_chip *gc,
> +					     unsigned int offset, int value)
> +{
> +	struct ads1262 *st =3D gpiochip_get_data(gc);
> +	int ret;
> +
> +	ret =3D regmap_update_bits(st->regmap, ADS1262_GPIODIR_REG,
> +				 BIT(offset), 0);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_update_bits(st->regmap, ADS1262_GPIODAT_REG,
> +				  BIT(offset), value ? BIT(offset) : 0);

[Severity: Medium]
Are the GPIO output direction and value configured in the wrong order?

The direction register is set to output before setting the data register to
the desired value. This ordering drives the pin with the previously latched
output value during the interval between the two SPI transactions, causing a
brief hardware glitch.

The data register must be updated to the new output value before changing t=
he
direction to output.

> +}

[ ... ]

> +static int ads1262_gpiochip_get_multiple(struct gpio_chip *gc,
> +					 unsigned long *mask,
> +					 unsigned long *bits)
> +{
> +	struct ads1262 *st =3D gpiochip_get_data(gc);
> +	unsigned int val;
> +	int ret;
> +
> +	ret =3D regmap_read(st->regmap, ADS1262_GPIODAT_REG, &val);
> +	if (ret)
> +		return ret;
> +
> +	return val & *mask;

[Severity: High]
Does this fail to populate the bits array and incorrectly return a positive
integer on success?

The gpiolib core expects get_multiple to populate the bits bitmap and return
0 on success. The implementation entirely ignores the bits argument and
returns the bitwise AND of the register value and mask (val & *mask).

If any requested GPIO line is high, this returns a positive integer, which
gpiolib treats as an error (-EBADE). This completely breaks the get_multiple
operation and leaves the bits array uninitialized.

> +}
> +
> +static int ads1262_gpiochip_set(struct gpio_chip *gc, unsigned int offse=
t,
> +				int value)
> +{
> +	struct ads1262 *st =3D gpiochip_get_data(gc);
> +
> +	return regmap_update_bits(st->regmap, ADS1262_GPIODAT_REG,
> +				  BIT(offset), value ? BIT(offset) : 0);

[Severity: High]
Can this read-modify-write operation corrupt other GPIO output states?

ADS1262_GPIODAT_REG is a volatile register. Consequently,
regmap_update_bits() performs a physical read of the current GPIO pin levels
rather than reading a cached output latch state. If an output pin's physical
voltage is temporarily dragged down by a load or shorted to ground, the read
might yield 0 even if its output latch is 1.

The subsequent RMW cycle will permanently overwrite the output latch for th=
at
pin with the incorrect physical value. A software shadow copy must be
maintained to prevent this corruption.

> +}

[ ... ]

[Severity: High]
This is a pre-existing issue, but does the driver use C bitfields to define
hardware registers?

Looking at the preexisting code in drivers/iio/adc/ti-ads1262.h:

struct ads1263_adc2_channel {
	/* ADC2CFG */
	u8 gain:3;
	u8 refmux:3;
	u8 data_rate:2;

	/* ADC2MUX */
	u8 negative_input:4;
	u8 positive_input:4;
};

And in drivers/iio/adc/ti-ads1262.c:

ads1262_channel_enable_and_read()
    static_assert(sizeof(*chan) =3D=3D 4);
    mutex_lock(&st->chan_lock);
    memcpy(&st->tx[2], chan, sizeof(*chan));

The C standard leaves bitfield memory layout implementation-defined, and the
layout varies by architecture endianness. On big-endian systems, bitfields
are packed in reverse order compared to little-endian CPUs.

Copying these structs directly into SPI transfer buffers via memcpy or
writing them via regmap_bulk_write will send completely corrupted bit
patterns to the hardware registers. The kernel explicitly forbids using C
bitfields to describe hardware register layouts; FIELD_PREP, FIELD_GET, and
fixed-width types must be used instead.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-ads126x-v1=
-0-894c788d03ed@gmail.com?part=3D3

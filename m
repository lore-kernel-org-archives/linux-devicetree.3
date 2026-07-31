Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF369349CD8
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 03:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467601; cv=none; b=jAZ87x2BrJZotKLibmihQONUNJiND9oyOLahfKJo/LXd48anQ9bf/nE8SFq1TvjHVqQa17SWfIM0N40a2Ne9TrtudTBV3IlpKsWjhgZRBRlcgDsWBwccpqoEBQruX9RTLSprFa0Xf8v0phDdsFOBmnmV1RQf2U7fYKQBEU4guXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467601; c=relaxed/simple;
	bh=euVWymUtmRk15/GNLGS2Eoa/CT31SMtaVtthF2t3apQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lYhMRDUkJlKek3Xj/LgFpxNPJ5PS+KpXwtX8Ze88rPi4v48Z2XT0hzurdfUVZfF1ahYL4UluwZvjDuVkDvNr3TBSU5najVENAlgJgFmd9mcGySrwhaj0UUjgUF0LUrO9gH+396Y/7BlEO4/8vp5cvrstv91+V6/v5xbSDjlbNaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3ao47ad; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3ao47ad"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA801F000E9;
	Fri, 31 Jul 2026 03:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785467599;
	bh=Yn8rs7RjG625w9qc9LcF5d4OEArFAHy+CdqyLG8jGUo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F3ao47adkuu5T3SOvCkBZuDbaeZ1kCW2RymiW3pjLkMcyN6ufMBLRXnK0VQl1c/QP
	 NKIM0aj0Qi15JXaFsibQpcPJ+yVG2mQ3ojFz2aQXSBBd8gSXjomx8v9kuq1KyHK+zM
	 PDQwDuwm0j3Lne1pF0jkPVfsQQuae0M/mN/CFpLo4OdE4rDyYXIpr3JJpdlr3lxe3C
	 fTbqcxrgC9CIVCbaznYxbmxDD3KdsUZshSturXr4X00SHZfUCPEQPpa+qm4qDmvkzL
	 CiD2Pb7rlGUkPfghMbp9/2YEIhgILtBTgSrFkbLvCoQIcIfhaXzgis6T4GnyAxQIyQ
	 ifVygkHz+EGPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] iio: adc: ti-ads112c04: Add support for TI
 ADS112C04
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Hsieh" <kylehsieh1995@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260731-ti-ads112c04-driver-v2-2-aab0168c3c01@gmail.com>
References: <20260731-ti-ads112c04-driver-v2-0-aab0168c3c01@gmail.com>
 <20260731-ti-ads112c04-driver-v2-2-aab0168c3c01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 03:13:18 +0000
Message-Id: <20260731031319.2BA801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The `read_poll_timeout` macro silently swallows I2C read errors, i=
ncorrectly returning success and allowing the driver to read stale or prema=
ture data.
- [High] Level-triggered interrupts will cause an unhandled interrupt storm=
, locking up the CPU.
- [Medium] Missing return value checks for `fwnode_property_read_u32` leads=
 to the use of uninitialized stack memory.
- [Medium] The driver claims support for differential reference voltage sca=
ling but omits the negative reference (refn-supply).
- [Medium] Non-atomic I2C register reads lack a Repeated Start condition, r=
isking multi-master interference.
- [Low] The driver accepts any value from the `single-channel` property wit=
hout bounds validation, risking silent out-of-bounds MUX configuration.
- [Low] Missing Power-On Reset (POR) delay after enabling regulators.
--

--- Patch [2]: [PATCH v2 2/2] iio: adc: ti-ads112c04: Add support for TI AD=
S112C04 ---
commit 0ef91a5fb4e473da243372df8436c4501bbc780c
Author: Kyle Hsieh <kylehsieh1995@gmail.com>

iio: adc: ti-ads112c04: Add support for TI ADS112C04

This patch adds IIO driver support for the Texas Instruments ADS112C04 16-b=
it
delta-sigma ADC. It implements raw reads, device tree parsing, hardware
interrupts/polling, and regulator-based dynamic reference scaling.

> diff --git a/drivers/iio/adc/ti-ads112c04.c b/drivers/iio/adc/ti-ads112c0=
4.c
> new file mode 100644
> index 0000000000000..28d3be81934f9
> --- /dev/null
> +++ b/drivers/iio/adc/ti-ads112c04.c
[ ... ]
> +static int ads112c04_read_reg(struct i2c_client *client, u8 reg, u8 *val)
> +{
> +	u8 cmd =3D ADS112C04_CMD_RREG(reg);
> +	int ret;
> +
> +	ret =3D i2c_master_send(client, &cmd, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D i2c_master_recv(client, val, 1);

[Severity: Medium]
Will this sequence of i2c_master_send() followed by i2c_master_recv() cause
problems on a multi-master I2C bus?

Because this splits the read into two separate transfers with a STOP
condition in between, another master could initiate a transaction before the
read completes, disrupting the ADC's state. Could i2c_transfer() be used
instead to guarantee an atomic transaction with a Repeated Start?

> +	return ret < 0 ? ret : 0;
> +}
[ ... ]
> +static int ads112c04_wait_for_data(struct ads112c04_state *st)
> +{
> +	int ret;
> +	u8 val;
> +
> +	if (st->client->irq > 0) {
> +		ret =3D wait_for_completion_timeout(&st->completion, msecs_to_jiffies(=
1000));
> +		if (!ret)
> +			return -ETIMEDOUT;
> +		return 0;
> +	}
> +
> +	return read_poll_timeout(ads112c04_read_reg, ret,
> +				 (ret < 0 || (val & ADS112C04_DRDY_MASK)),
> +				 1000, 1000000, false,
> +				 st->client, ADS112C04_REG_CONFIG2, &val);

[Severity: High]
Does this polling loop properly handle I2C read errors?

When an I2C bus error occurs and ads112c04_read_reg() fails, ret becomes
negative. This makes the condition (ret < 0) evaluate to true, causing the
read_poll_timeout() macro to successfully break out of the loop and evaluate
to 0.

Since the driver directly returns the macro's result instead of checking if
ret contains an error, ads112c04_get_adc_result() will assume the conversion
is complete. This leads to reading and returning stale or corrupted data to
userspace.

> +}
[ ... ]
> +static irqreturn_t ads112c04_irq_handler(int irq, void *private)
> +{
> +	struct iio_dev *indio_dev =3D private;
> +	struct ads112c04_state *st =3D iio_priv(indio_dev);
> +
> +	complete(&st->completion);
> +
> +	return IRQ_HANDLED;

[Severity: High]
Can this handler lead to a CPU hard lockup if the DRDY interrupt is configu=
red
as level-triggered in the device tree?

Since the hardware interrupt source is not cleared before returning
IRQ_HANDLED, a level-triggered interrupt will remain asserted. The interrupt
controller will then immediately re-trigger this handler infinitely, starvi=
ng
the process context.

> +}
[ ... ]
> +static int ads112c04_parse_channels(struct iio_dev *indio_dev)
> +{
[ ... ]
> +		if (fwnode_property_present(child, "single-channel")) {
> +			fwnode_property_read_u32(child, "single-channel", &pair[0]);

[Severity: Medium]
What happens if the single-channel property is present but malformed or emp=
ty
in the device tree?

Since the return value of fwnode_property_read_u32() is not checked, pair[0]
might remain uninitialized if the read fails. The driver would then proceed
to calculate spec->address using uninitialized stack memory.

> +			spec->channel =3D pair[0];
> +			spec->differential =3D 0;
> +			spec->address =3D 0x08 + pair[0];

[Severity: Low]
Is it possible for pair[0] to exceed the valid 0-3 range if the device tree=
 is
misconfigured?

Without bounds validation, an out-of-bounds value here will be incorporated
into spec->address and eventually bit-truncated by FIELD_PREP() in
ads112c04_get_adc_result(), resulting in a silent and unpredictable hardware
multiplexer state.

> +		} else if (fwnode_property_present(child, "diff-channels")) {
[ ... ]
> +static int ads112c04_probe(struct i2c_client *client)
> +{
[ ... ]
> +	st->vref_reg =3D devm_regulator_get_optional(&client->dev, "refp");

[Severity: Medium]
The commit message states the driver supports dynamic reference scaling via
both refp-supply and refn-supply, but is refn-supply actually parsed?

Because only refp is requested and used to calculate st->vref_mv, the driver
implicitly assumes VREFN is always 0V. If a board uses a differential
reference voltage with a non-zero VREFN (for example, 3V and 1V), this will
calculate an incorrect ADC scale based on 3000mV instead of 2000mV.

> +	if (IS_ERR(st->vref_reg)) {
[ ... ]
> +	if (reset_gpio) {
> +		gpiod_set_value_cansleep(reset_gpio, 1);
> +		fsleep(1000);
> +		gpiod_set_value_cansleep(reset_gpio, 0);
> +	} else {
> +		ret =3D ads112c04_write_cmd(client, ADS112C04_CMD_RESET);

[Severity: Low]
Could the device NACK this I2C command if it hasn't finished its Power-On
Reset sequence?

The avdd and dvdd regulators were enabled earlier in ads112c04_probe(), but
there is no stabilization delay before this software reset command is issue=
d.
This might cause intermittent driver probe failures on certain boards.

> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	fsleep(1000);
> +
> +	st->config0 =3D 0x01;
> +	ret =3D ads112c04_write_reg(client, ADS112C04_REG_CONFIG0, st->config0);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ads112c04_write_reg(client, ADS112C04_REG_CONFIG1, st->config1);
> +	if (ret)
> +		return ret;
> +
> +	if (client->irq > 0) {
> +		ret =3D devm_request_irq(&client->dev, client->irq,
> +				       ads112c04_irq_handler,
> +				       0,

[Severity: High]
Does passing 0 for irqflags safely handle all device tree configurations?

Passing 0 allows the interrupt to inherit its trigger type from the device
tree. However, as noted in the ads112c04_irq_handler() comments, the driver
does not clear the hardware interrupt source on level triggers. Should this
enforce IRQF_TRIGGER_FALLING to prevent potential CPU lockups if a level
trigger is specified in the device tree?

> +				       indio_dev->name, indio_dev);
> +		if (ret) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-ti-ads112c=
04-driver-v2-0-aab0168c3c01@gmail.com?part=3D2

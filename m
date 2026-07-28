Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEDA3D953D
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785226174; cv=none; b=CXqL2SP8/TKnxPvwj3Y3WAlwAYNXLRiJLOQQdNfGi/rCYxDjJVF26dupf4Ceu5dMmilooqXlk4Ng1tZrKRrAloGHY6KvVUC/4dGWp/bwns20Dwvq/cI/b+dH12jvslFninQ99FdVps/Fcq7576BeYCcUnnIu8nP8NgnXTP1nRpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785226174; c=relaxed/simple;
	bh=jDlBsgiH4k0thPmkVvghpyJrEjgixfr0Dr0N5XA/OKk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rO4PvPDozmHq/fIEtmq4SmVMGH+8S8ZLlLLJ4O8cDmOBht4NEy1yklZ++lDlSV6tbDob9lD0/b9e2t4dG5+ghDEJIwkrS/AONRATrQVgdeemPu471aOwpslSW1bL0hgHCIyVE4nhO6H7xHoQFyjEheBg5VE0fltcK4ghT2SpLno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gk9z2jhM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gk9z2jhM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55F41F000E9;
	Tue, 28 Jul 2026 08:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785226173;
	bh=kITQKnNjfIyPe7pmUg0tMczUrjC9OvFrWGeRCIMMlds=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gk9z2jhMEkE6OCy6+MEfKgzl9KnxN3mHvcqwiDMiCMXlC9OiYI8hp5qM/cM6wbPLq
	 7CA4BXpMjsUpNzCLyUvzXIssAyl9X7nsGQmS/3SWzmwClGgF6CBcMai1itD1E0dfYe
	 GesrI3IZkZqKAE7lkNv1zmxKrkWLsVbVK9p/8gjzP5NH+PdMDwztfWDflZg8JovQYN
	 z1kty3KVFl0q2PbFh3yxSb5ECTVxUF5rtwkuJlxxKHhRpLnrqDEoXAy5gFnLLekR1x
	 9LZW9ioYswBNlfmuw3RcYQIqJM+U6Y85djhzHYBf38OWCnQlkZcgrMACG8LiI8Oy4A
	 RYhIwPEodR1ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: adc: ti-ads112c04: Add support for TI
 ADS112C04
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Hsieh" <kylehsieh1995@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260728-ti-ads112c04-driver-v1-2-475efe4e2b78@gmail.com>
References: <20260728-ti-ads112c04-driver-v1-0-475efe4e2b78@gmail.com>
 <20260728-ti-ads112c04-driver-v1-2-475efe4e2b78@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 08:09:32 +0000
Message-Id: <20260728080932.E55F41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Ignoring the return value of `ads112c04_write_reg` when updating t=
he MUX configuration causes software state to permanently desync from hardw=
are on I2C failure.
- [Medium] Ignored I2C error codes during initialization lead to silent pro=
be success for disconnected devices and potential use of incorrect VREF sca=
ling.
- [Medium] The driver intends to disable the PGA for safety by default but =
fails to write this configuration to the hardware.
- [Medium] The polling fallback timeout in `ads112c04_wait_for_data` is too=
 tight and will likely cause spurious `-ETIMEDOUT` errors for standard conv=
ersions.
- [Low] The `struct i2c_device_id` array uses positional initializers inste=
ad of named initializers.
--

--- Patch [2]: [PATCH 2/2] iio: adc: ti-ads112c04: Add support for TI ADS11=
2C04 ---
commit 3a317f1a20e84079a63ca8ca55693bc279239c64
Author: Kyle Hsieh <kylehsieh1995@gmail.com>

iio: adc: ti-ads112c04: Add support for TI ADS112C04
   =20
Add IIO driver support for the Texas Instruments ADS112C04 (16-bit)
delta-sigma ADCs.

> diff --git a/drivers/iio/adc/ti-ads112c04.c b/drivers/iio/adc/ti-ads112c0=
4.c
> new file mode 100644
> index 0000000000000..0f1d415e3f21e
> --- /dev/null
> +++ b/drivers/iio/adc/ti-ads112c04.c
[ ... ]
> +static int ads112c04_wait_for_data(struct ads112c04_state *st)
> +{
> +	int ret, timeout =3D 50;
> +	u8 val;
> +
> +	/* If IRQ is available, wait for DRDY interrupt completion */
> +	if (st->client->irq > 0) {
> +		ret =3D wait_for_completion_timeout(&st->completion, msecs_to_jiffies(=
1000));
> +		if (!ret)
> +			return -ETIMEDOUT;
> +		return 0;
> +	}
> +
> +	/* Fallback: Poll DRDY bit in CONFIG2 */
> +	while (timeout--) {
> +		ret =3D ads112c04_read_reg(st->client, ADS112C04_REG_CONFIG2, &val);
> +		if (ret < 0)
> +			return ret;
> +		if (val & ADS112C04_DRDY_MASK)
> +			return 0;
> +		usleep_range(1000, 2000);
> +	}
> +
> +	return -ETIMEDOUT;
> +}

[Severity: Medium]
Will this polling fallback timeout too early for standard conversions?

The timeout loop allows for up to 50 iterations with 1-2ms sleep per
iteration, totaling around 50ms. If the default conversion time at 20 SPS
is exactly 50ms, could this prematurely return -ETIMEDOUT before the
conversion completes?

[ ... ]
> +static int ads112c04_get_adc_result(struct ads112c04_state *st,
> +				    struct iio_chan_spec const *chan,
> +				    int *val)
> +{
> +	int ret;
> +	u8 mux;
> +
> +	mux =3D (chan->address << 4) & 0xF0;
> +	if ((st->config0 & 0xF0) !=3D mux) {
> +		st->config0 =3D (st->config0 & 0x0F) | mux;
> +		ads112c04_write_reg(st->client, ADS112C04_REG_CONFIG0, st->config0);
> +	}

[Severity: High]
Does ignoring the return value of ads112c04_write_reg() here cause the
software cache to desync from the hardware state?

If ads112c04_write_reg() fails due to an I2C error, st->config0 has already
been updated. Subsequent reads from this channel would bypass the update
block, leaving the hardware permanently on the wrong channel while software
thinks the MUX has been successfully changed.

Should the software cache update only be applied if the I2C write is
successful?

[ ... ]
> +static int ads112c04_probe(struct i2c_client *client)
> +{
[ ... ]
> +	/* Reset device to defaults */
> +	ads112c04_write_cmd(client, ADS112C04_CMD_RESET);
> +	usleep_range(1000, 2000);
> +
> +	/* Set defaults: PGA Disabled (For single-ended safety), Gain=3D1 */
> +	st->config0 =3D 0x01;
> +
> +	ads112c04_write_reg(client, ADS112C04_REG_CONFIG1, st->config1);

[Severity: Medium]
Should the I2C writes during initialization check for error returns?

If a device is disconnected or an I2C error occurs during
ads112c04_write_cmd() or ads112c04_write_reg(), the errors are silently
ignored. Could this allow the driver to successfully probe a missing device,
or operate with mismatched voltage references?

[Severity: Medium]
Does the driver fail to disable the PGA on the hardware?

st->config0 is initialized to 0x01 to disable the PGA, but unlike config1, =
it
is never explicitly written to the hardware during probe.

If channel 0 is read first in ads112c04_get_adc_result(), the MUX update
block check for (st->config0 & 0xF0) !=3D mux evaluates to false, bypassing
the write entirely. Could this leave the hardware running with its reset
default (PGA enabled) instead of the intended safe configuration?

[ ... ]
> +static const struct i2c_device_id ads112c04_id[] =3D {
> +	{ "ads112c04", 0 },
> +	{ }
> +};

[Severity: Low]
Does this struct initialization violate the I2C subsystem guidelines?

The subsystem rules specify that initialized arrays of type
struct i2c_device_id must be declared const and use named initializers.
Should this array use named initializers instead of positional ones?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-ti-ads112c=
04-driver-v1-0-475efe4e2b78@gmail.com?part=3D2

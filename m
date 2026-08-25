Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8234DF76
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787647405; cv=none; b=VyzqRu8yuhHPMTsOz0ASaSY6Xdhlpr7bEDBfSEZU8uMwgSoQKlqYMuG6etff6xMRpyiN/w5/oAGnTTFazvMddLNQxGVZieNwNLxvE0pPqjVQUsoPYzd/FLpp1C9tNr/NNw9Sdj06jL4Q2vaDTdL3Vj1XbxQKBdWVZfrpKv41L8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787647405; c=relaxed/simple;
	bh=AOL6VFNdC+SF/qq/hPE4GrMSqVzzndh3XxY+y5GB7no=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XTsanEqABG204t2RQNIKvPAOQJjMTvsq5bBuGOLF+WYR2+jhXYeJ5tMn9R495ajU9uCmX5Pyu+8mJ2W6wEzAA18XJb/jjSasKu804K2z1QhVzSY3OI2OhlN5SAe6vMBOLXZ9aIiKvbTaZ5vCdLwasD2I0OhJtDwqitt/084XDa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ug9BOae/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ug9BOae/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958231F000E9;
	Tue, 25 Aug 2026 08:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787647403;
	bh=1Q9YAJxIbZdYzJKHtAyKC+HjVDLj/ZQCl6J5eBlF/QI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ug9BOae/shuFPr4j3/R9W54CXgGDNm5pelMeNRxPo6OuGZrALFfG5xvdRRMkQs6dd
	 m3uv8/PLXCbf3aTW4AVUygxuhTnpZB2CBJVTvSI7sHwUalBYPTiuu8KOwKww9wDHE3
	 SQDiQ7CjY273LZpzfkX8kg8npMyD4IuwOo1Oi7+w2MUT4P4VLmIEw6v/bAkw0tdn/q
	 BXnSgXvCIWUOW4t09WZNLIcSk+L8VAvQ5EuKIPn6apGzyZsafAkefIPY4hSfmlErk5
	 C9gAbo/IJ9fIi4DUgvx/mjdJLrkcScrDh27gji+sfPefsAABBlkafQc1LFhuVKzXXl
	 Qfxome2wIba7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/9] iio: accel: mma8452: Only apply trigger type
 when not set by firmware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260825-mma8452-open-drain-v6-3-9b252804ee80@geanix.com>
References: <20260825-mma8452-open-drain-v6-0-9b252804ee80@geanix.com>
 <20260825-mma8452-open-drain-v6-3-9b252804ee80@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 08:43:23 +0000
Message-Id: <20260825084323.958231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Hardware-Software Polarity Mismatch

Pre-existing issues:
- [High] PM runtime usage counter leaks permanently on I2C read/write error=
s.
- [High] Hardware state is accessed over I2C before acquiring runtime PM re=
ferences, failing if the device is suspended.
--

--- Patch [3]: [PATCH v6 3/9] iio: accel: mma8452: Only apply trigger type =
when not set by firmware ---
commit b862ff26c69f226387993dc22a2537b8dc72d9fd
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Only apply trigger type when not set by firmware

This patch modifies the mma8452 driver to only apply a default active-low
trigger type if the firmware does not specify one. This aims to improve
backward compatibility while respecting firmware configuration.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index f645a5c6fd1c2..1fb43c5b0b72f 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c

[ ... ]

> @@ -1683,9 +1683,16 @@ static int mma8452_probe(struct i2c_client *client)
>  		goto trigger_cleanup;
> =20
>  	if (client->irq) {
> +		unsigned long irq_flags;
> +
> +		irq_flags =3D irq_get_trigger_type(client->irq);
> +		if (irq_flags =3D=3D IRQ_TYPE_NONE) {
> +			dev_info(dev, "invalid irq type, setting default active low\n");
> +			irq_flags =3D IRQF_TRIGGER_LOW;
> +		}
> +		irq_flags |=3D IRQF_ONESHOT;
>  		ret =3D request_threaded_irq(client->irq, NULL, mma8452_interrupt,
> -					   IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> -					   client->name, indio_dev);
> +					   irq_flags, client->name, indio_dev);

[Severity: Medium]
Does this configuration leave the hardware and software out of sync?

The code reads the firmware's IRQ trigger type and requests the IRQ with
it, but the actual MMA8452 sensor hardware polarity doesn't appear to be
updated. If the firmware requests an active-high or rising-edge trigger,
the host interrupt controller is configured for active-high, but the sensor
would continue to drive its default active-low signal.

Unless there is an external hardware inverter on the board, could this=20
mismatch break interrupts? Should the driver read the requested trigger type
and configure the IPOL bit in CTRL_REG3 to match?

>  		if (ret)
>  			goto buffer_cleanup;
>  	}


While reviewing the I2C handling in this driver, I also noticed a couple of
other issues.

[Severity: High]
This is a pre-existing issue, but I noticed a potential leak of the runtime
PM usage counter when handling I2C errors.

In mma8452_read(), the device is woken up, incrementing the PM counter:

mma8452_read() {
    ...
    ret =3D mma8452_set_runtime_pm_state(data->client, true);
    ...
    ret =3D i2c_smbus_read_i2c_block_data(data->client, ...);
    if (ret < 0)
        return ret;
}

If the I2C read fails, the function returns immediately and bypasses the
matching mma8452_set_runtime_pm_state() false call. Could this permanently
prevent the device from re-entering autosuspend?

A similar pattern appears to exist in mma8452_write_event_config() where
an early return on a failed I2C read skips restoring the PM state.


[Severity: High]
This is a pre-existing issue, but could some I2C accesses fail if the
device is currently suspended?

In mma8452_read(), the code checks for data readiness before waking up the
device:

mma8452_read() {
    ...
    ret =3D mma8452_drdy(data);
    if (ret < 0)
        return ret;

    ret =3D mma8452_set_runtime_pm_state(data->client, true);
}

Because mma8452_drdy() executes an I2C read against the MMA8452_STATUS
register, it happens before the power regulators are enabled. If the device
has already autosuspended (after 2 seconds of inactivity), will this I2C
read hit powered-off silicon and fail?

A similar direct I2C read without a runtime PM reference seems to happen
in mma8452_read_raw() for IIO_CHAN_INFO_CALIBBIAS.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-mma8452-op=
en-drain-v6-0-9b252804ee80@geanix.com?part=3D3

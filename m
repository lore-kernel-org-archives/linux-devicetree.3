Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31C939CD01
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 08:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787128172; cv=none; b=o3d50cDoXvJVDSs98W8IjvI7R7OMiGFUCLFRRxeZdk2nzdcLRjWUvmQetPWPm+Iq7zCO+GR98eykl2XlrRlclLVpskTr5QpqRxnYiMQueMUCKVlyog0tVKEshQ6NTsmZRIUfp34YjYdc+2qaKrkMhPKC446Dkjjm6ln3CUU7nGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787128172; c=relaxed/simple;
	bh=J+7FIWeFSNlCF/SBGKbIoTF/ML8qePbVtoZtF/oALRU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IhDXv0HG+Ai6Cp3vHTVe5M47ULgECCuYkfYLFAxPHltP/ORXuUYcf4ThgIMk2q4Z2vY16oABSpfY0/lpnkk7Vu/6aRRf+ZQ+5c0c/jJwQHJ/I2u05RIKbVhCDU36+bT2UYJG3ysOqQQZ+SimwK+kKloiI1lAhDSoYK0KJM5D86U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0JYLuSU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0JYLuSU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C391F00A3A;
	Wed, 19 Aug 2026 08:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787128170;
	bh=Z86A86oIpvnqzjmaLrdLWONLzoh1VvjRc56fyX5dxrE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V0JYLuSUKtg0isjkeWxTAzOdIi5IjqIljB1XoyhlItRYnGhAStpbD9NLaGGKmr9dH
	 pN0r40EeH07GWWqOQ2kSZpUuGEP5UPMS8oqk662G1pVEk+v1b5UiB0IPDWYpC9cEcd
	 Q+Wj3b5J6o6llQMidtEKJ3BAtNoAzl36L76Tk0BwA2O+8FcLs9q2q6jH0QatTqnwON
	 DRevEr8e3Yz1vM2GfZjvf7pZ8MuH2vG+y0USkcPzSZOvilbl2oNFPKkzZyhR5A5uxr
	 9yW5tY8jZTugqbKUExnmCsnaV1Bodxk0DBr3LS8WB1fnsQGqEpA0OqPAchsnoi67tr
	 XgnCZSCo9OOAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v5 3/6] iio: accel: mma8452: Only apply trigger
 type when not set by firmware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260819-mma8452-open-drain-v5-3-d8aa590d7c36@geanix.com>
References: <20260819-mma8452-open-drain-v5-0-d8aa590d7c36@geanix.com>
 <20260819-mma8452-open-drain-v5-3-d8aa590d7c36@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 08:29:30 +0000
Message-Id: <20260819082930.63C391F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The patch dynamically trusts the firmware's IRQ trigger type but f=
ails to configure the sensor hardware's interrupt polarity to match, causin=
g an interrupt storm.

Pre-existing issues:
- [High] I2C register accesses are performed while the device is physically=
 powered off in PM runtime suspend.
- [High] Unhandled latched motion events (`INT_FF_MT`) cause an infinite IR=
Q storm.
--

--- Patch [3]: [PATCH RESEND v5 3/6] iio: accel: mma8452: Only apply trigge=
r type when not set by firmware ---
commit ad034b1db299a86a70db53d5a2b4a52f2a134eee
Author: Esben Haabendal <esben@geanix.com>
iio: accel: mma8452: Only apply trigger type when not set by firmware

Instead of unconditionally overriding the trigger type, it is better to
only apply a default when no trigger type is set by firmware. This should
be reasonably backward compatible.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index f645a5c6fd1c2..1fb43c5b0b72f 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -1683,9 +1683,16 @@ static int mma8452_probe(struct i2c_client *client)
>  		goto trigger_cleanup;
> =20
>  	if (client->irq) {
> +		unsigned long irq_flags;
> +
> +		irq_flags =3D irq_get_trigger_type(client->irq);

[Severity: High]
If the firmware specifies an active-high interrupt, will this cause an
interrupt storm?

The irq_get_trigger_type function fetches the interrupt polarity from the
firmware (e.g., active-high) and passes it to request_threaded_irq.
However, the driver forces the sensor into its power-on default state
via mma8452_reset, which hardcodes the interrupt pin to active-low.

Because the driver never writes to CTRL_REG3 to set the IPOL bit
to active-high to match the requested IRQ type, the sensor's idle-high
line could be seen as a permanently asserted interrupt.

> +		if (irq_flags =3D=3D IRQ_TYPE_NONE) {
> +			dev_info(dev, "invalid irq type, setting default active low\n");
> +			irq_flags =3D IRQF_TRIGGER_LOW;
> +		}
> +		irq_flags |=3D IRQF_ONESHOT;
>  		ret =3D request_threaded_irq(client->irq, NULL, mma8452_interrupt,
> -					   IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> -					   client->name, indio_dev);
> +					   irq_flags, client->name, indio_dev);
>  		if (ret)
>  			goto buffer_cleanup;
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but are there I2C register
accesses occurring while the device is physically powered off?

If userspace attempts to read or write sysfs attributes after the
autosuspend timeout, the regulators are disabled. Direct calls are
made without resuming the device:

drivers/iio/accel/mma8452.c:mma8452_read_raw() {
    ...
    ret =3D i2c_smbus_read_byte_data(data->client,
                                   MMA8452_OFF_X + chan->scan_index);
    ...
}

A similar pattern happens in __mma8452_write_raw calling
mma8452_change_config. Any unprivileged userspace read/write to the
configuration attributes 2 seconds after the last activity will result
in an I2C NACK (-EREMOTEIO or -ENXIO).

[Severity: High]
This is a pre-existing issue, but can unhandled latched motion events
cause an infinite IRQ storm?

For chips that lack the TRANS event (like mma8652), rising-edge motion
events are mapped to the ff_mt registers. When the latch is explicitly
enabled for rising events, the hardware will hold the interrupt until
read:

drivers/iio/accel/mma8452.c:mma8452_write_event_config() {
    ...
    val |=3D ev_regs->ev_cfg_ele;
    ...
}

When the interrupt fires, the handler evaluates freefall mode and skips
handling, never reading the MMA8452_FF_MT_SRC register to clear the latch:

drivers/iio/accel/mma8452.c:mma8452_interrupt() {
    ...
    if (src & MMA8452_INT_FF_MT) {
        if (mma8452_freefall_mode_enabled(data)) {
            ...
        }
        ret =3D IRQ_HANDLED;
    }
    ...
}

Remotely triggering a physical motion event after enabling the rising
threshold via sysfs could permanently lock up the interrupt line.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-mma8452-op=
en-drain-v5-0-d8aa590d7c36@geanix.com?part=3D3

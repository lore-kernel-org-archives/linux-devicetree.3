Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0AF22D7A9
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 12:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932105; cv=none; b=c4cbWQkRJiCiRc7UI8vHIByy7sZUPj1a7Yb2MhA0+eV+HSHLYvlCIuTF86Oac24DnWFStY1PlovGPVK4jkXPAm8Jl5AGfzuxA0DKZSHGrUu7IFMubs7dcIufgLWVywH/gA2qvTCNUoaKI6pjP53CBCWOczULqfu9+iQwEumBRME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932105; c=relaxed/simple;
	bh=YNNZwrlKASrM+Fq0iS832Ifke7lEyNbUWfj13esdQR0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kx7ZXcyMghwgotzhNdcF1SbpRpHDCL2/OKBZVrrOUID2Mf9wf9UzIcpB4nguAjUMK6pME9gYxFn8zYaBpu17j9241KHAdjPmLEkb6Tb8/fTC/pEl8hHYYo0rAcel1fK4YRWi1o16Oq8MedcBR/kNF/YUjQ+GhhBD9lLDJM9n1FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ar50JBvQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ar50JBvQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC5461F000E9;
	Wed,  5 Aug 2026 12:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785932104;
	bh=O/4UARMMqdCToGMFs7WkUpdtIROp3fIfpb78IXE56J0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ar50JBvQDIVszFpS0EJ0FaDzUnr9ghWH0kw82BvEzwcyJ43OlckiWzRw8FwlGPuPq
	 ZbsTBTvYxzSNjbzw//9vg5DU3csNu7g+zu71k5UFXgUmISVXNk2B3YSJa1FcZZO5Oo
	 dJb8FwFQvzYnz8DbLWZmOToeSm3s8FshCrTepeu9nRoWB1aWzlkOZ+kIqiVvtkE/0+
	 2vlPcf3xCmILqRMQHw9cTw7+nvdPt752/g18Yvc579+y/sUWSYaSFcEzq8VcYzJl9V
	 uUchc1sngpT7kTEkP8DbE4Pb4ydG8vnJklvXLW72iyTJlUhXZGT1kjLdDUI6dCj5s0
	 byJwkavbnZYKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: accel: adxl367: add support for INT2 interrupt
 pin
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antoniu Miclaus" <antoniu.miclaus@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260805115952.33894-3-antoniu.miclaus@analog.com>
References: <20260805115952.33894-1-antoniu.miclaus@analog.com>
 <20260805115952.33894-3-antoniu.miclaus@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 12:15:03 +0000
Message-Id: <20260805121503.DC5461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The driver swallows -EPROBE_DEFER and other negative error codes f=
rom fwnode_irq_get_byname(), breaking probe deferral.

Pre-existing issues:
- [High] Out-of-bounds write in adxl367_push_fifo_data due to missing bound=
s check on fifo_entries.
- [High] Kernel panic due to a modulo-by-zero operation in adxl367_push_fif=
o_data when fifo_set_size is uninitialized.
--

--- Patch [2]: [PATCH 2/2] iio: accel: adxl367: add support for INT2 interr=
upt pin ---
commit 726b611b27f821c71f931174d7f0a134dabcdb00
Author: Antoniu Miclaus <antoniu.miclaus@analog.com>

iio: accel: adxl367: add support for INT2 interrupt pin

The ADXL367 provides two independent interrupt output pins, INT1 and
INT2, each with its own event mapping register sharing an identical bit
layout. This commit determines the connected pin from the
interrupt-names device tree property and routes the interrupt mappings
to the matching register, defaulting to INT1 if no interrupt-names are
present.

> diff --git a/drivers/iio/accel/adxl367.c b/drivers/iio/accel/adxl367.c
> index 8c3de11a10a37..229974478d10b 100644
> --- a/drivers/iio/accel/adxl367.c
> +++ b/drivers/iio/accel/adxl367.c
[ ... ]
> @@ -1426,6 +1430,27 @@ static int adxl367_setup(struct adxl367_state *st)
>  	return adxl367_set_measure_en(st, true);
>  }
> =20
> +static int adxl367_get_int_line(struct adxl367_state *st, int irq)
> +{
> +	int int_irq;
> +
> +	int_irq =3D fwnode_irq_get_byname(dev_fwnode(st->dev), "INT1");
> +	if (int_irq > 0) {

[Severity: High]
Could this condition inadvertently swallow negative error codes like
-EPROBE_DEFER? If fwnode_irq_get_byname() returns -EPROBE_DEFER because the
interrupt controller is not yet ready, this check treats it as a missing
property instead of properly deferring the probe. This can cause the driver
to fall back to trying INT2 or returning the default irq. If the default irq
is 0, devm_request_threaded_irq() will subsequently fail with -EINVAL.

> +		st->int_map_reg =3D ADXL367_REG_INT1_MAP;
> +		return int_irq;
> +	}
> +
> +	int_irq =3D fwnode_irq_get_byname(dev_fwnode(st->dev), "INT2");
> +	if (int_irq > 0) {

[Severity: High]
Does this check suffer from the same -EPROBE_DEFER issue as above?

> +		st->int_map_reg =3D ADXL367_REG_INT2_MAP;
> +		return int_irq;
> +	}
> +
> +	/* No interrupt-names: default to INT1 for backwards compatibility. */
> +	st->int_map_reg =3D ADXL367_REG_INT1_MAP;
> +	return irq;
> +}

[Severity: High]
This is a pre-existing issue, but I noticed a potential out-of-bounds write
in adxl367_push_fifo_data():

drivers/iio/accel/adxl367.c:adxl367_push_fifo_data()
    ret =3D st->ops->read_fifo(st->context, st->fifo_buf, fifo_entries);

Is it possible to overflow st->fifo_buf here? The fifo_entries value is read
from the hardware as a 10-bit value (up to 1023), but st->fifo_buf is fixed
at 512 elements. If the hardware returns a value greater than 512, this
would cause an out-of-bounds write.

[Severity: High]
This is also a pre-existing issue, but there appears to be a potential
modulo-by-zero panic in the same function:

drivers/iio/accel/adxl367.c:adxl367_push_fifo_data()
    fifo_entries -=3D fifo_entries % st->fifo_set_size;

Can this cause a kernel panic? If an interrupt triggers before the IIO
buffer is enabled (where st->fifo_set_size is populated), st->fifo_set_size
will be zero. If the ADXL367_STATUS_FIFO_FULL_MASK bit happens to be set,
this division by zero will crash the kernel.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805115952.3389=
4-1-antoniu.miclaus@analog.com?part=3D2

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CB519067C
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 11:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780139220; cv=none; b=Mzou/zzg0XylkIiZ6EjLp1gUW0DlqZjSgiGwXR440lNNHy8KzOSdVLTwLuhBE3uqPaXEsKIEJCiFTgCJlSXM7njAipYcKjSK82X+IcJflt+7H3etgUqE8XL45/2mP0boVQfLvkhyuU0hFX1RvA2c5ZQpbRhAC1zDRnI7/zdwk/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780139220; c=relaxed/simple;
	bh=Qk6ws+2gRiRv80msip+31Qeeu0wjbvRVe1TY8KA8ltI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mk73U8LRZR6RyZ64Grs74xseIaNTkZziLVaTD0KpYeqTXscMd05O2dPK+rzGByYNJE70JfmekfJ8YG4WYT4SFvDAhQGi3SEl9j0swh7tDYQ/nrqK/FRbHoKYTTI+iqQiUNZ9j0VVvvksCsu8Ugl/usIBiNrK3gPja1r9VM3N8j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXoXlR8k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXoXlR8k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30EB11F00893;
	Sat, 30 May 2026 11:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780139218;
	bh=eN8LCCPpVYft6NeaVeDYYIMSna0MYsSd81hWjj8pJSo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jXoXlR8kPiv1PKgQ9v3MzOjBDUtWYcOPqGXq2ks0Y0eQV5l1wKXKBWemLWgjK1UUp
	 A+bDmLYpFvNqkJ3ZHwYRbM3Ct7vJxwM2FYU84DjmQQr1YzdIUT+GR5uzv6n6hysCu9
	 JIlHXBDoVgn1lBPK/XJyDzYXZXikK5c82Zl0+kQd4BwGZtEWU+45azGibc1QP77/6K
	 HnWtWkT6kHAKOeIgRzKjkJrxgJQmjYGAcH33xsyUV6Bh1I9gBLwTpxhPwFGBNpI7ZW
	 WG+x7MzHJvMfQ4OlRiITxaEUDrG2MLE1StTTil20+bcH5JoT9HwjrnDQeodvxAfsId
	 LMDRwMHhLK5DQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: iio: adc: Add schema for AD7816/7/8
 digital temperature sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taha Narimani" <tahanarimani3443@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260530135302.54688-1-tahanarimani3443@gmail.com>
References: <20260530135302.54688-1-tahanarimani3443@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 11:06:57 +0000
Message-Id: <20260530110658.30EB11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing concurrency protection during sysfs accesses.
- [High] Stack-allocated buffers are passed directly to `spi_read()` and `s=
pi_write()`, violating DMA mapping rules.
- [High] Unbounded polling loop for the BUSY pin can cause a hard CPU locku=
p.
--

commit cb7e57cc9cdde2668abda84c0f0d3e60ebb9a962
Author: Taha Narimani <tahanarimani3443@gmail.com>

dt-bindings: iio: adc: Add schema for AD7816/7/8 digital temperature sensor

This commit adds a new YAML device tree binding schema for the Analog
Devices AD7816, AD7817, and AD7818 digital temperature sensors. It
documents the compatible strings, SPI configuration, interrupts, and
required GPIO pins.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
> new file mode 100644
> index 0000000000000..74008c14d40c6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7816.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/adi,ad7816.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - adi,ad7816
> +      - adi,ad7817
> +      - adi,ad7818

[Severity: High]
This isn't a bug introduced by this patch, but is there a missing lock to
protect concurrent sysfs accesses?

Looking at ad7816_show_value() in drivers/staging/iio/adc/ad7816.c:

drivers/staging/iio/adc/ad7816.c:ad7816_show_value() {
    ...
    ret =3D ad7816_spi_read(chip, &data);
    ...
}

Since this is called for world-readable sysfs attributes, can multiple
userspace processes trigger this concurrently?

If so, could concurrent execution of ad7816_spi_read() interleave GPIO pin
toggling and SPI transfers, corrupting the hardware state?


[Severity: High]
This isn't a bug introduced by this patch, but does this code pass
stack-allocated buffers to SPI transfers?

Looking at drivers/staging/iio/adc/ad7816.c:

drivers/staging/iio/adc/ad7816.c:ad7816_spi_read() {
    ...
    ret =3D spi_read(spi_dev, &buf, sizeof(*data));
    ...
}

And also in ad7816_spi_write():

drivers/staging/iio/adc/ad7816.c:ad7816_spi_write() {
    ...
    ret =3D spi_write(spi_dev, &data, sizeof(data));
    ...
}

Since the SPI subsystem often maps these buffers for DMA, will passing
variables from the stack cause mapping failures or crashes on architectures
with virtually mapped kernel stacks?


[Severity: High]
This isn't a bug introduced by this patch, but can this unbounded polling
loop cause a CPU lockup?

Looking at ad7816_spi_read() in drivers/staging/iio/adc/ad7816.c:

drivers/staging/iio/adc/ad7816.c:ad7816_spi_read() {
    ...
    while (gpiod_get_value(chip->busy_pin))
        cpu_relax();
    ...
}

If the external device malfunctions or the GPIO line gets permanently stuck
high, will this loop block indefinitely and cause a hard lockup?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530135302.5468=
8-1-tahanarimani3443@gmail.com?part=3D1

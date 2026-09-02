Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267264A499C
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 17:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788370780; cv=none; b=o1fMsVZ3jEEr2un3WM0rbkKcD6ptWixc9k9RGyE6Zermqxk0xH3M5dZUifLJ72hw02VSmtN1FgJlVja7LZJU+fXd/00ZeJYpOaftbqgKYPspBT3+TBFm83jpUexo+D0s97HditELhcQeVEcU08pZJ21lMY+cuqz54fmZhG7R1TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788370780; c=relaxed/simple;
	bh=Julwe9YOqy93QGrEIpjf06GMVVTXOxvGnS0I606YNFk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ot9SFgLGoPKTDgD9Z1l83SpG8QCiU5+orQ8MBET9tKf0jkz6yKnFVCt5Jkf1sbdRHH28TZ8Wkc6xFcLduUd0Gyb/wcCmCriavNzQnW9NfL50kTZO60esT7JgC0t5830RMyaA0d/QxtmIfFYOK0PxWO3LZf5/3p2D2cRoLn8GYYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SsMGQcdO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SsMGQcdO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E981F000E9;
	Wed,  2 Sep 2026 17:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788370778;
	bh=8AewKQxQPXiK66+plhmEeXmwlsza+/x5vXSimwNu9bk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SsMGQcdOri0KlZMHWVFDFa1uWRZXCZZeVo3Kd8wQ0FKgEZbxU8dxvN6I62JovSH+0
	 Q/Z9xoZZ4a7pSBmfpUmhU2bzEMCvQo42kVVzaS6J1chZDayr4wZrJ0f56n8a9X7AiL
	 Y2m5BU4oG0noA4JKCFkb4XekePgdcHmt0Tc/+GKcdkhnwbT9KzsQg6tR1yuSrMrMZa
	 5dk00Vkp/zMm3qStm8EnWrBpAxljd6vgb/7oDj2Rp6yKP+MPFZ+8//svFJM05+Z3YH
	 jZ4DFxrXj7krMJm2jutledeq+H2xJlpVr9BKGjYUtLWjJiIXGdJGhkJ8mk33fHHuj+
	 CmDDcbBc6QdNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 11/13] dt-bindings: iio: adc: adi,ad4134: Add high
 data throughput example
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <4044581dcec9854acedb2110acdbc84f6b1713e3.1788368334.git.marcelo.schmitt@analog.com>
References: <cover.1788368334.git.marcelo.schmitt@analog.com>
 <4044581dcec9854acedb2110acdbc84f6b1713e3.1788368334.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 17:39:37 +0000
Message-Id: <20260902173938.55E981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] The newly added device tree example includes 'mux-states' and 'mux-=
state-names' properties, but these are not defined in the schema, causing s=
chema validation to fail.

Pre-existing issues:
- [High] Out-of-bounds array write in `ad4134_trigger_handler` due to incor=
rect loop bounds over `masklength`.
- [High] Timestamp push fails with `-ENOSPC` because the buffer size passed=
 to `iio_push_to_buffers_with_ts` is undersized.
--

commit 9db0b7d2cda5447620683544f83d4587b18252b7
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

dt-bindings: iio: adc: adi,ad4134: Add high data throughput example

Add device tree example for AD4134 operation in 4-wire SPI mode with 4
lines to transfer data samples to the host controller.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
> index 34043f89730b2..6f0b4346426a0 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml

[ ... ]

> +            clocks =3D <&sys_clk>;
> +            clock-names =3D "clkin";
> +
> +            avdd5-supply =3D <&avdd5>;
> +            dvdd5-supply =3D <&dvdd5>;
> +            iovdd-supply =3D <&iovdd>;
> +            refin-supply =3D <&refin>;
> +            avdd1v8-supply =3D <&avdd1v8>;
> +            dvdd1v8-supply =3D <&dvdd1v8>;
> +            clkvdd-supply =3D <&clkvdd>;
> +
> +            mux-states =3D <&ad4134_sdo_dout0_mux 0>, <&ad4134_sdo_dout0=
_mux 1>;
> +            mux-state-names =3D "data_read", "reg_access";

[Severity: Low]
Are the mux-states and mux-state-names properties fully documented in the
schema definition?

The newly added device tree example includes these properties, but they do
not appear to be defined in the schema properties section. Since the schema
uses unevaluatedProperties: false, the example will fail schema validation
during a dt_binding_check.

> +
> +            adi,spi-mode =3D "4-wire";
> +        };
> +    };
>  ...

While reviewing this series, I also noticed a couple of pre-existing issues
in the driver implementation:

drivers/iio/adc/ad4134.c:ad4134_trigger_handler()
{
[ ... ]
	for (unsigned int ch =3D 0; ch < iio_get_masklength(indio_dev); ch++) {
		ret =3D spi_write_then_read(st->spi, NULL, 0, &st->scan[ch],
					  BITS_TO_BYTES(AD4134_CHAN_PRECISION_BITS));
[ ... ]

[Severity: High]
This is a pre-existing issue, but does this loop overflow the st->scan array
when the soft timestamp channel is enabled?

The loop unconditionally iterates up to iio_get_masklength(indio_dev).
Because the soft timestamp channel is registered with scan_index =3D 4, the
mask length evaluates to 5 whenever the timestamp is enabled.

Since st->scan is an array of size 4, when ch evaluates to 4,
spi_write_then_read() will write 3 bytes out-of-bounds to &st->scan[4],
corrupting adjacent memory.

[ ... ]
	iio_push_to_buffers_with_ts(indio_dev, &st->scan, sizeof(st->scan),
				    pf->timestamp);
[ ... ]

[Severity: High]
This is a pre-existing issue, but will the statically sized length passed
here cause iio_push_to_buffers_with_ts() to fail with -ENOSPC?

The iio_push_to_buffers_with_ts() function requires the buffer size argument
to be at least indio_dev->scan_bytes to accommodate all active channels plus
the 8-byte timestamp.

The driver statically passes sizeof(st->scan), which is 16 bytes. When 3 or=
 4
channels plus the timestamp are active, the required size expands to 24 byt=
es
(16 bytes of data + 8 bytes timestamp). This will cause the push to abort,
resulting in lost samples.
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788368334.gi=
t.marcelo.schmitt@analog.com?part=3D11

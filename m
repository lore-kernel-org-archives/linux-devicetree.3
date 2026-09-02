Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E504A9D4C
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 17:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371190; cv=none; b=qVDcD8X9/Bx1fY/OfEil66SHEJYwWYfPq6lsToMytT5xSnGI9pHRUA1JqSvaDB/FIx4W4ik905CUgI6cyMisJgNUaNSI01IHwKix3rGWt1OBuL+jKKtnk245AadqlslHlq8wOAsDi9eEUaW7suk0T/vBtbBpAGAiVHe0ZkEaopQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371190; c=relaxed/simple;
	bh=2dTLCwYGei8n0qvi92DKN1sv4BtycszLUivW5dnBzzg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=em1fKmRi5nFMDZRXIvZkzbAt9HOPhcif6N+Rnp/ZBEPimjXa5PDMvaBhaMgQauOqCnBYW5woVweFXMYRMHcwUoC11e4hs9zut7Wt2Gyt719z2kYCksa6VJPvtdRJ5OFsyDhnq7YIbGYR/psYGWoty6MYso3oKgcDFR9xyY3RNuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TO1vROY8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TO1vROY8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF141F00A3A;
	Wed,  2 Sep 2026 17:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788371188;
	bh=grDn57SJ/q6+9gsFE+82E4T+9hlfE2FH7Xbrm6N6Qn8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TO1vROY8yKUWdpH5pfMw70bDqyZr1R+v94dJR6kUHep+eBkHzn/1pyL+neXycnpwu
	 yS+7ayMyDQMEFZdIvADdUnPcIJagHfgyIODy3R1jXEeqy3zUDT6InSKbf/5gfW92dB
	 3E3Q9cf7popq6fib02o8i98TsIE1596+PJC5EN+sgjBSWROtGuEqlQUqu1OudFh3g7
	 ebPQjqQSCrfP0gY1JFHOJnADp9ZFt7VcmikqD9KHMJLvUW8BRNKmXtYctDlXJeS7va
	 gayjXi5Wy5kxEOP31CvWAZV+ay4++kH3iZ2u7vb4HLnHjlbpv+D+yBEgfgekTMU/vg
	 LTnB7XVBRA8zQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 08/13] dt-bindings: iio: adc: adi,ad4134: Document
 SPI connection mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <d9b759d29fa8ca12b6cf083e180b2556ca4533f0.1788368334.git.marcelo.schmitt@analog.com>
References: <cover.1788368334.git.marcelo.schmitt@analog.com>
 <d9b759d29fa8ca12b6cf083e180b2556ca4533f0.1788368334.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 17:46:27 +0000
Message-Id: <20260902174628.5CF141F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Unconditional buffer overflow in `ad4134_trigger_handler()` an=
d silent data loss when the timestamp channel is enabled.
- [High] The ad4134 driver ignores unsupported `adi,spi-mode` values and si=
lently falls back to `no-cs` mode without throwing an error.
- [Medium] Adding daisy-chain modes without explicitly allowing the '#daisy=
-chained-devices' property.
- [Low] The `adi,spi-mode` property describes a default fallback in text bu=
t lacks the YAML `default` keyword in the schema.
--

commit 5c85e25862888f2e9a104a75c26404312b5feaf0
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

dt-bindings: iio: adc: adi,ad4134: Document SPI connection mode

Document how AD4134 chips are connected to the host SPI controller
according to different wiring configurations.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
> index ea6d7e0264190..d843c02a394a3 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
> @@ -131,6 +131,28 @@ properties:
>      enum: [ free-running, gated ]
>      default: gated
> =20
> +  adi,spi-mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [ no-cs, 4-wire, one-channel-chain, two-channel-chain ]

[Severity: Medium]
Does this schema need to explicitly allow the '#daisy-chained-devices'
property, or reference /schemas/spi/spi-peripheral-props.yaml?

Standard devicetree descriptions for daisy-chained IIO devices require
'#daisy-chained-devices' to communicate chain length.

Without it, won't any devicetree using the newly added 'one-channel-chain'
mode fail dt_binding_check validation?

> +    description: |
> +      This property indicates the SPI wiring configuration.
> +
> +      When this property is omitted, it is assumed that the device is us=
ing
> +      'no-cs' wiring.

[Severity: Low]
Is it possible to add the YAML 'default: no-cs' keyword to the schema
definition?

Since the text describes a default fallback, structurally representing it
ensures tooling can infer the default configuration.

[ ... ]

I also noticed some regressions in the driver code related to these SPI mod=
es.

In drivers/iio/adc/ad4134.c:ad4134_probe():

	ret =3D device_property_match_property_string(dev, "adi,spi-mode",
						    ad4134_spi_modes,
						    ARRAY_SIZE(ad4134_spi_modes));
	/* Default to "no-cs" mode if adi,spi-mode is not specified */
	if (ret =3D=3D -EINVAL)
		st->spi_mode =3D AD4134_SPI_MODE_NO_CS;

[Severity: High]
Does this code silently ignore unsupported strings?

device_property_match_property_string() returns -EINVAL when the property
exists but contains a string not in the array (such as the newly added
"one-channel-chain" mode).

If the driver doesn't support the chain modes yet, will this incorrectly
configure the SPI host and multiplexer for no-cs minimum I/O mode?

Could this cause hardware protocol violations and garbage data reads during
system initialization when a misconfigured or untrusted DT is provided?


In drivers/iio/adc/ad4134.c:ad4134_trigger_handler():

	for (unsigned int ch =3D 0; ch < iio_get_masklength(indio_dev); ch++) {
		ret =3D spi_write_then_read(st->spi, NULL, 0, &st->scan[ch],
...
	iio_push_to_buffers_with_ts(indio_dev, &st->scan, sizeof(st->scan),
				    pf->timestamp);

[Severity: Critical]
Does this loop overflow the st->scan array?

Because ad4134_chan_set includes the soft timestamp channel,
iio_get_masklength(indio_dev) returns 5. The loop will unconditionally iter=
ate
up to ch=3D4, performing an SPI read into &st->scan[4].

Since st->scan is only sized for 4 channels (u32 scan[AD4134_NUM_CHANNELS]),
won't this result in out-of-bounds memory corruption on every hardware trig=
ger?

Furthermore, when the timestamp channel is enabled, IIO requires a 24-byte
buffer (4x4 bytes + 8-byte timestamp). Because sizeof(st->scan) is 16 bytes,
will iio_push_to_buffers_with_ts() detect the undersized buffer and silently
drop all captured data?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788368334.gi=
t.marcelo.schmitt@analog.com?part=3D8

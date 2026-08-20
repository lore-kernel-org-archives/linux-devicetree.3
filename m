Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1BF3BCD0A
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787210377; cv=none; b=IQYZRvZxNFy0GpbyumrPBWif0BdGMiOi+lWvYipPIP6s3PqQSFtdjidDq8pzNi8XOl4//zQkQaNRDKliygjX8UPA6oG5yXHoYv6IU0CpBzzVlu+Qo3c3WpsSWUx+Fet0EtFfgxWlsGrNfZnZJr46wLhK/hUDmBy6vdWJFprgruY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787210377; c=relaxed/simple;
	bh=3hR8v8kEt+bWtncXUHAaNnFQAKtTyYBrcn3/bhqK+bY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UeXhwseU/XWdQk16xHIk6TKef817/1/dqYGnwDhNX/2WOplRVhgKQLUSk6KjvqBnwvF1dF2kkPMlbDds35dnDDlyKT+ak2WmepvDua2paqWMpQSEvqndNppmhRZ1/TBII8ntTZlz60E1Qyr1VafdpFhDJPvr3O8xghwosvTTVOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AODhKETU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AODhKETU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C517D1F00A3A;
	Thu, 20 Aug 2026 07:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787210376;
	bh=cDfVkkgtjB+KkmIXtDsGDy8FcRce+kZu94Ryq7fVUZY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AODhKETUXVgkN+AmjsEe3bthTEHZgqGkuzW46HXUtnP4uVjWNjJ1gPvJ0SG7jcAZL
	 azocl0GZDK64sUghtIhuSCVyPM7vv8fW0oRpGOH/ZmCj9wj/QeHOPKZYlFQHWFoXq+
	 s9P+erIFXvCC9O0ARbrNLjHDsEKpnb+7AEFEL190KVNL+0hHFRtuOFWnSoRABqnXNk
	 +AQDIoIi23VvVhxeVfIFPSbJLUApKsJCbBReTpxjHgoUX/0UqWnlBZuo1CtdF6FRlO
	 yPFBj8+qLDWLxetc7VD9Mp6ba9xq7kldxemuyyzOZn8xVV2FtaWxmnLkQFGP77C0lj
	 gCSn7p/k5XClA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/3] dt-bindings: iio: dac: Add AD5529R
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260820-ad5529r-driver-v9-2-ba62e0b2a816@analog.com>
References: <20260820-ad5529r-driver-v9-0-ba62e0b2a816@analog.com>
 <20260820-ad5529r-driver-v9-2-ba62e0b2a816@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 07:19:35 +0000
Message-Id: <20260820071935.C517D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] The `spi-device-addr` property specifies a default value of integer=
 `0`, but it is typed as a `uint32-array` in standard SPI bindings, causing=
 schema validation to fail.
- [Low] The `default` values for `output-range-microvolt` are incorrectly p=
laced inside the tuple `items` definition, rendering them ineffective in De=
vice Tree schemas.
- [Low] The child node schema uses `additionalProperties: false` alongside =
a `$ref: dac.yaml` reference, which improperly rejects inherited standard p=
roperties like `label`.
--

--- Patch [2]: [PATCH v9 2/3] dt-bindings: iio: dac: Add AD5529R ---
commit 8e1fecbc9f92b4d6893726d1c141e8c978f52489
Author: Janani Sunil <janani.sunil@analog.com>

dt-bindings: iio: dac: Add AD5529R

Devicetree bindings for AD5529R 16 channel 12/16 bit high voltage,
buffered voltage output digital-to-analog converter (DAC) with an
integrated precision reference.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml b=
/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml
> new file mode 100644
> index 0000000000000..9c390d460e5ff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5529r.yaml

[ ... ]

> +  spi-device-addr:
> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      enum: [0, 1, 2, 3]
> +    default: 0

[Severity: Low]
Does this default value cause schema validation to fail?

Since this property can contain multiple items, standard SPI bindings
often type these as a uint32-array. Should the default be formatted
as an array like default: [0] instead of a scalar integer 0?

> +    description:
> +      Hardware address of each device, selected by the ID0 and ID1 pins.
> +      Up to four AD5529R devices can share a single SPI chip select.

[ ... ]

> +  "^channel@([0-9a-f]{1,2})$":
> +    $ref: dac.yaml
> +    type: object
> +    description: Child nodes for individual channel configuration
> +
> +    properties:
> +      reg:
> +        description:
> +          Flattened channel number across all AD5529R devices sharing th=
e chip
> +          select. Within each 16-channel block, the physical channel num=
ber is reg % 16.
> +        minimum: 0
> +        maximum: 63
> +
> +      output-range-microvolt:
> +        description:
> +          Output voltage range for this channel as [min, max] in
> +          microvolts.
> +        oneOf:
> +          - items:
> +              - const: 0
> +                default: 0
> +              - enum: [5000000, 10000000, 20000000, 40000000]
> +                default: 5000000

[Severity: Low]
Are these default values correctly placed?

Placing the default keyword inside the tuple items definition generally
renders them ineffective in Device Tree schemas when the property is
entirely omitted.

Should the default be applied to the property as a whole instead?

> +          - items:
> +              - const: -5000000
> +              - const: 5000000

[ ... ]

> +    required:
> +      - reg
> +
> +    additionalProperties: false

[Severity: Low]
Will this additionalProperties: false constraint improperly reject standard
properties?

Since this child node includes a $ref: dac.yaml reference earlier in the
block, this constraint typically prevents the use of inherited properties
like label and causes schema validation errors.

Should this be unevaluatedProperties: false instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-ad5529r-dr=
iver-v9-0-ba62e0b2a816@analog.com?part=3D2

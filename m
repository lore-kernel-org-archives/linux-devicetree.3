Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FD22D7DC8
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 12:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786020839; cv=none; b=T8OzJIY6+aB6KOCxcknLQn/1nqHD0D1LbIbT1yYyseS771WOpPN6bpnu1jnbUwi5E6lSW4swa50F7cnEDlt6vRIkbZep/L2/Yg3/Srz6XSyF0Z9DhOnuAzxOnp5kMTHcKOJNPb5k9QFS/9miSGgNfdLkcza/ODH8+sS0DoetyfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786020839; c=relaxed/simple;
	bh=kdRE9Igk0OhxSLt3rVPmYCr06wb6ArhPxBSTpLU9tpI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GL058MSeGMfr9qU8AvE3VO9gNb8kt/MMXGxByfl5Tw8jQlhL828y3pHZ41MtQLyrwYMY5D8cBfjBxBP6zFS4ajchLheAfreyQCYdxpasUQtDObDaq/m+98Du65PQdA/D6SE1lL6nrXX6URoUVArqwGEW/erORnkEzxr/QHhRQiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vqz87z6V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vqz87z6V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855091F000E9;
	Thu,  6 Aug 2026 12:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786020837;
	bh=S3wA/Qc+hePpQjOzG4QXSZtpwdcyJx3ImsQQIdP8Lik=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vqz87z6VUPUqxegRIL5roeVoqLnY6QJiIOhp1TYDqDkHRUFX4m7kj5PAtSsDIdLYE
	 ZE1UmsmEm9b9wQyNJCGcDMoiAmqkFccBWY1w8ljtAf2ftGjDGai2tnvFm06Q4rkBOc
	 6K44v5n7Y9LK0jyEcwVgpP85hYuQYMvj32N8tvm14tilfv8MNYEP2j4xscn4ANjZOK
	 s7avl4SMOlPtPPg2Q7+4EuCuCEPgeowlp7PqKAaehjZvCm0gOiYLwzX3z0Xb9RbiIH
	 lI6yAKsmx3DZXyohhS4k/UfS4FDrG7h6IQRt0XcyakBXD31OtyvIMuNEV/EU18IV90
	 mqikNaLa3Y7og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: Add InvenSense ICM-42370-p
 accelerometer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kanak Shilledar" <kanak.shilledar@axis.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806-b4-inv_icm42370p-v1-1-670837f5842f@axis.com>
References: <20260806-b4-inv_icm42370p-v1-0-670837f5842f@axis.com>
 <20260806-b4-inv_icm42370p-v1-1-670837f5842f@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 12:53:55 +0000
Message-Id: <20260806125357.855091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Medium] The binding intentionally omits support for SPI and I3C protocol=
s, breaking schema validation for valid hardware configurations.
- [Medium] The `interrupts` property is restricted to a single item, contra=
dicting the device's 2 programmable interrupts.
- [Medium] The schema is missing the `mount-matrix` property, which is esse=
ntial for 3-axis accelerometers.
- [Low] The binding includes a fragile link to a staging (UAT) website inst=
ead of a production URL.
- [Low] The compatible string drops the 'P' suffix from the part number, ri=
sking future naming collisions.
--

--- Patch [1]: [PATCH 1/3] dt-bindings: Add InvenSense ICM-42370-p accelero=
meter ---
commit 12d3935884516d76927755afe69d0ed970ee7417
Author: Kanak Shilledar <kanak.shilledar@axis.com>

dt-bindings: Add InvenSense ICM-42370-p accelerometer

Adds devicetree documentation for the ICM-42370-P 3-axis accelerometer.
Support is currently only described for I2C, leaving out SPI and I3C and
reset for future work.

> diff --git a/Documentation/devicetree/bindings/iio/accel/invensense,icm42=
370.yaml b/Documentation/devicetree/bindings/iio/accel/invensense,icm42370.=
yaml
> new file mode 100644
> index 0000000000000..561e798b911ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/accel/invensense,icm42370.yaml
[ ... ]
> +description: |
> +  3-axis accelerometer MotionTracking device.
> +
> +  It supports I3C, I2C and SPI serial communication, has a 2.25kB FIFO
> +  and 2 programmable interrupts with low-power wake-on-motion support.
> +
> +  It also has programmable filters and an embedded temperature sensor.
> +
> +  https://uat.invensense.com/en-us/products/3-axis/icm-42370-p

[Severity: Low]
This isn't a bug, but this documentation link points to a staging (UAT)
website instead of a production URL. Could this be updated to the production
URL?

> +
> +properties:
> +  compatible:
> +    const: invensense,icm42370

[Severity: Low]
This isn't a bug, but the compatible string drops the 'P' suffix from the
part number. Does this risk future naming collisions if a non-P variant
exists or is released? Could the compatible string be updated to strictly
match the part number invensense,icm42370p?

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1

[Severity: Medium]
Will this limitation of maxItems to 1 conflict with valid hardware designs
that route both of the device's interrupt lines to the host? Should the
schema allow up to 2 items for this property and define interrupt-names?

> +
> +  drive-open-drain:
> +    type: boolean
> +
> +  vdd-supply:
> +    description: Regulator operating range between 1.71V to 3.6V.
> +
> +  vddio-supply:
> +    description: Regulator operating range between 1.71V to 3.6V.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +unevaluatedProperties: false

[Severity: Medium]
By omitting support for SPI and I3C protocols and setting
unevaluatedProperties to false without including SPI schema references, won=
't
this cause schema validation errors for valid hardware configurations? Stan=
dard
properties like spi-max-frequency or spi-cpol will be incorrectly rejected.
Should the binding describe all hardware capabilities rather than just the
tested protocols?

[Severity: Medium]
Does the omission of the mount-matrix property, combined with
unevaluatedProperties being set to false, mean that device trees describing
the sensor's physical orientation on the PCB will also fail validation? Cou=
ld
mount-matrix be explicitly declared as true?

> +
> +examples:
> +  - |
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-b4-inv_icm=
42370p-v1-0-670837f5842f@axis.com?part=3D1

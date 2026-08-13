Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0088D271456
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 12:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786624463; cv=none; b=sbmUR32/h8mNlhbw0tZ/b8r/oObQ60FTQf2Zg5/qEVdOOrhOhC2gyd2KwY7eOScA9Phkpod0MEgXJC4Dq4rn74/tkPFIY8AaQbOo2yHOnkMbUi+mfpASNJ+xqyT5nHKzoUcZ++E9HFa2hWxxQKgOs1USzx12B+VzjzHmpQhnugw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786624463; c=relaxed/simple;
	bh=wxl/HB5wl0Pn7n+rsGqh1fTJFuxfLj0pfEIpURUEQ/I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pMtA/2bMjKfcFk4fDopWZzTntWMnlN5BQpB6XoyYTPLgTNjqpsze+NwdAkauUtEfdOmxMKq+m24vdK5EB4OYyKxfuhp+uZsbKbb26q7q4n5G8nsstB1z2ZAFC2wFYyeyYa/QbApLWqXHLealcql5Sz9VKFfVTtpVxdCqPV2ttA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ishxMoUM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ishxMoUM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC681F000E9;
	Thu, 13 Aug 2026 12:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786624461;
	bh=JlAvSV2NbtOemg8mDSTc/p98lUnB4C3TfvsaFNQXvec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ishxMoUMfNNIZbmuqLVJraUTfFc4olsoijc6hsZGF8SWCyCorPYCLVxxnJgXsjo0w
	 fVbxtMvxtJTzNpnwiGTFYjZRXx3Q/ynt/4T2uC8er4NsQZ73svom2KDIKmGuRC4vx2
	 10G3ywPxU9veP+h0ocx5wE5WhNgqHFFjgMz0C5OcHj7jUpEQAhf3+TE3GRXOC4OU0B
	 t7xJg3Hvu+BkhTQI962s+qyDzKbNUyCUD0dW/OqSk4TbzI7yrM0lKMARPAPedGjwND
	 YLTjBOm6oYfw7RnZV2vLXZedYuuqA0UAe00sILI1tcaP7fKhIk6IjYUwa30zjjFHzC
	 Ayra6CxWg7m8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: Add InvenSense ICM-42370-p
 accelerometer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kanak Shilledar" <kanak.shilledar@axis.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260813-b4-inv_icm42370p-v2-1-11aedfdf76d3@axis.com>
References: <20260813-b4-inv_icm42370p-v2-0-11aedfdf76d3@axis.com>
 <20260813-b4-inv_icm42370p-v2-1-11aedfdf76d3@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 12:34:20 +0000
Message-Id: <20260813123421.3AC681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Incomplete device tree binding schema rejects valid hardware con=
figurations for SPI, I3C, and reset lines.
- [Low] Missing IIO subsystem mailing list in MAINTAINERS entry.
- [Low] Contradictory schema constraints for the `interrupts` property.
--

--- Patch [1]: [PATCH v2 1/3] dt-bindings: Add InvenSense ICM-42370-p accel=
erometer ---
commit 580d5dd4de723a5224325d048b11cddaf0d9a2b1
Author: Kanak Shilledar <kanak.shilledar@axis.com>

dt-bindings: Add InvenSense ICM-42370-p accelerometer

This commit adds device tree binding documentation for the InvenSense
ICM-42370-P 3-axis accelerometer. The device supports I2C, SPI, and I3C,
but this initial binding is geared towards I2C. The commit updates the
MAINTAINERS file with the new binding.

> diff --git a/Documentation/devicetree/bindings/iio/accel/invensense,icm42=
370p.yaml b/Documentation/devicetree/bindings/iio/accel/invensense,icm42370=
p.yaml
> new file mode 100644
> index 0000000000000..df23406921a51
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/accel/invensense,icm42370p.ya=
ml
[ ... ]
> +dependencies:
> +  interrupt-names: [ interrupts ]
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

[Severity: Low]
Does this schema unnecessarily enforce interrupts as a strict requirement?

Since interrupts is listed in the required array, the dependency check=20
for interrupt-names: [ interrupts ] above is dead logic. Also, since IIO
sensors typically support polling, making interrupts strictly mandatory=20
might prevent valid polling-based hardware designs from passing validation.

> +  - vdd-supply
> +  - vddio-supply
> +
> +unevaluatedProperties: false

[Severity: Medium]
Will this strict constraint actively reject valid hardware descriptions for
SPI, I3C, or reset lines?

The commit message mentions support for SPI, I3C, and resets, but since
standard SPI/I3C peripheral property $ref inclusions and the resets property
are missing, unevaluatedProperties: false will cause validation to fail when
standard properties like spi-max-frequency or resets are provided in the
device tree.

[ ... ]
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 04fa5322d9f74..e4764489ea971 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
[ ... ]
> +INVENSENSE ICM-42370-P ACCELEROMETER
> +M:	Kanak Shilledar <kanak.shilledar@axis.com>
> +M:	Henrik Grimler <henrik.grimler@axis.com>
> +L:	kernel@axis.com

[Severity: Low]
Should this MAINTAINERS entry include the standard IIO subsystem mailing li=
st?

Currently, it only lists a corporate mailing list, omitting=20
linux-iio@vger.kernel.org which is typically mandatory for IIO entries. This
means patches modifying this binding will not be automatically CC'd to the=
=20
subsystem list by get_maintainer.pl.

> +S:	Maintained
> +W:	https://invensense.tdk.com/
> +F:	Documentation/devicetree/bindings/iio/accel/invensense,icm42370p.yaml

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-b4-inv_icm=
42370p-v2-0-11aedfdf76d3@axis.com?part=3D1

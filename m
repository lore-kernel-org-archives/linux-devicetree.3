Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6B050B8B1
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 13:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897148; cv=none; b=e2umFwulYScH21wN7o2P9bv0FP1kx5yJde1BjUHNEiV4relsSYbzBkWmxDL4t7yr5uIsoVAN3vkiW6izrSOKg0Sn0PG6xTi0e9L6kXCsdTgBFyX5wWLu+S86ik/0JDCGLYfUNgO9tzdw4MpdM/zvdKF2YV+JLKBTCEOa+TsAh/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897148; c=relaxed/simple;
	bh=XuotWq6F8XXkPgG8d0EA50H/o4boQBz3fv8XbpzZdGg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=oRyUIeYnpWkA5EqEUO1JqdWFFe96NkN4MoQaQzUuRXmsZNUmPbYFyIbFu0RmGAZvzmJoH8p/RWb8N1s4vnfJO2Icx5D7tzaHUM5chkAb1sUaIRUyJWpKKArZmEzQ/sXU6szq3fKR80Ry1O1IQeV8QDJXwkvsUz+Kpr4vhNclgb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ya+Zmg7x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ya+Zmg7x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F871F00898;
	Tue, 13 Oct 2026 13:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897146;
	bh=suWcXggIYPy1ZT09i6nGqzG7CWACHoTLSi/WR0dmfrE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ya+Zmg7xkL37vqYLrMXZrnzuYNEpDV8bAU4Noqs847HvHp5vAlzDOd4XyiCRYFWmH
	 hnkVh1hurF/TDHoTtRZXDJKACJ6VsE0VaAplmt0CzYBzjVFPLWlDnxNSZNYEgnSbwx
	 nxy02rPFtVoIB+FhkbbmTqjFoCFqB26hv5VEh62U38+5bx5cMzi3bOwAVhfbuumd0N
	 /cgSd5Y0iG4VbGMLzMAbeA2B9JwuS6cUieStT/nJIIs8saYJCesZvVAvSPwXWLbTyf
	 DjI2cmW6me0UK+fiLzlgQJypcF8/sh2R1moy8dTzB3gJY4CqUNe5twGkCHXW9HwiGF
	 SpXw2zGH6RORQ==
Message-ID: <sashiko-outbox-169784@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/7] dt-bindings: beagle: Add BeagleConnect Freedom
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ayush Singh" <ayush@beagleboard.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, ojeda@kernel.org, gary@garyguo.net
In-Reply-To: <20261013-gb-uart-transport-v3-6-81d0a8a1acf7@beagleboard.org>
References: <20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org>
 <20261013-gb-uart-transport-v3-6-81d0a8a1acf7@beagleboard.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 13:12:25 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: unconditional SPI ref prevents multi-bus properties
--

commit 44eee00f4f36c047d5c19f05fb44716903b22221
Author: Ayush Singh <ayush@beagleboard.org>

dt-bindings: beagle: Add BeagleConnect Freedom
   =20
Add devicetree bindings for the BeagleBoard.org BeagleConnect Freedom,
a wireless-enabled board based on the TI CC1352P7. The board exposes an
MCU that can be attached to a host over USB, UART, SPI or I2C, and is
described as a child node of the corresponding bus.

> diff --git a/Documentation/devicetree/bindings/beagle/beagle,beagleconnec=
t-freedom.yaml b/Documentation/devicetree/bindings/beagle/beagle,beagleconn=
ect-freedom.yaml
> new file mode 100644
> index 0000000000000..be051a39acdc6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freed=
om.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/beagle/beagle,beagleconnect-freedom.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: BeagleBoard.org BeagleConnect Freedom
> +
> +description:
> +  The BeagleBoard.org BeagleConnect Freedom board connected over USB, UA=
RT, SPI or I2C.

[ ... ]

> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +unevaluatedProperties: false

[Severity: Medium]
Does unconditionally referencing spi-peripheral-props.yaml while setting
unevaluatedProperties to false restrict the allowed properties strictly to =
SPI
definitions?

The commit message and description state this node can be attached to USB, =
UART,
SPI, or I2C buses. If this node is added as a child of a non-SPI bus and
standard bus properties like current-speed or baudrate are specified, the s=
chema
will reject them and fail dt_binding_check.

Should the reference to spi-peripheral-props.yaml be conditionally applied
based on the parent bus type, or should references to peripheral schemas for
the other supported buses also be included?

> +
> +examples:
> +  - |
> +    serial {
> +      mcu {
> +        compatible =3D "beagle,beagleconnect-freedom";
> +        vbat-supply =3D <&vbat>;
> +      };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-gb-uart-tr=
ansport-v3-0-81d0a8a1acf7@beagleboard.org?part=3D6

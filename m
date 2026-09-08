Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64C553ECFC
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 12:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871736; cv=none; b=mqVLxPMvDC+NvDaPEeOPtoO3pNMVF2/gAv488Fel/iXcIDcTv+zxwciING7S7gmHKYa+6PvLK6L0LruY575f/eC2bUMKLl6iqOSXt84q2L8bIdTNZUY+nYXWlHISIwLv7IvqjbfdT9FE/glw4Z4MdAXEFDrz+xLqh4K16zIdhiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871736; c=relaxed/simple;
	bh=m46b1VEd+2JqbQEtciIvpqlFA+c9LGD+B4FO/rKczhQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kp8Y5OmkPucGIzE3UWpq6iQCbRe0XT0+ht7hLtBUM8OvQJMh8tgD/iGGVo3L06DSgOxWXpLnj4AtumTwei2GSpbsEasFJ7cGhm2yhLRzWzzb8VL/p3hZ/gKDQeFJV2awBYMagXI/6qaz4W5XtCMEhC0dqL4bHRlSFOFxzcdk5z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0+f9VBe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0+f9VBe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D441F00A3D;
	Tue,  8 Sep 2026 12:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788871734;
	bh=HTGKmgOhNfYoBKCDhdzVNVpvsC9fIP2anXB2TTXqsjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D0+f9VBeWoVU8U2lbl+27oGNfPUN9ES3VcBw2sN3xanR0pawM6tLIN8LQCK+EeHPu
	 46fN4EyfStm8mau8s0otRZQY73IRSWqurDlFe69VqBYHHsdTxQUdW0fICLgKoC9QBU
	 QtMUd0R8HsvYWDEufhInZ9wi957GCnX19niNVtX9iC9b2R//KIsk8bddyKK4zTHZUx
	 k4BruKNhbu8VqUIbdpLRU/gd09rLW3BPFD65URrfHLO5E+vGcU/dsGVvkL0S2y9Fwu
	 n3pgMh4sq1yTfCP1GUyJN2tyc1o6+AJ7J5xSB4ZzT7VgR7M433saLBlG0q48+RYgn6
	 1/AGtiTiOrVAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: Add NXP PCA9641 I2C bus master
 arbiter
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shiv Prakash Gupta" <shivprakash.gupta@nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908123146.1839854-2-shivprakash.gupta@nxp.com>
References: <20260908123146.1839854-1-shivprakash.gupta@nxp.com>
 <20260908123146.1839854-2-shivprakash.gupta@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 12:48:53 +0000
Message-Id: <20260908124854.42D441F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The PCA9641 acts as an interrupt controller for downstream devic=
es by propagating interrupts, but the binding omits the required `interrupt=
-controller` and `#interrupt-cells` properties.
--

commit f66b0c3d86e4ae950a20caea6a9eb2ad2243149c
Author: Shiv Prakash Gupta <shivprakash.gupta@nxp.com>
Subject: dt-bindings: i2c: Add NXP PCA9641 I2C bus master arbiter

This commit adds a device tree binding schema for the NXP PCA9641 2-to-1 I2C
bus master arbiter. The PCA9641 arbitrates between two upstream I2C masters
using a lock/grant model and supports an optional interrupts property for
interrupt-assisted arbitration.

diff --git a/Documentation/devicetree/bindings/i2c/nxp,pca9641.yaml b/Docum=
entation/devicetree/bindings/i2c/nxp,pca9641.yaml
new file mode 100644
index 0000000000000..649a3f6d1776f
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nxp,pca9641.yaml
[ ... ]
> properties:
>   compatible:
>     const: nxp,pca9641

[Severity: Medium]
Since the commit message notes the PCA9641 has an INT_IN interrupt input th=
at
propagates downstream slave interrupts upstream, it appears to act as an
interrupt controller.=20

Should the interrupt-controller and #interrupt-cells properties be defined =
here
to expose the hardware's capabilities to schema validation?

[ ... ]
> required:
>   - compatible
>   - reg
>   - i2c-arb
>=20
> additionalProperties: false

[Severity: Medium]
If a downstream I2C device correctly specifies interrupt-parent =3D <&i2c_a=
rbiter>
to route its interrupts through the PCA9641, would the device tree fail sch=
ema
validation because additionalProperties: false is set and the interrupt
controller properties are omitted?

Should the interrupt-controller and #interrupt-cells properties be included=
 in
this required block to ensure nodes are correctly validated?

>=20
> examples:
>   - |
>     /* Minimal example: polling mode (no interrupt wiring) */

[Severity: Medium]
If the interrupt controller properties are added to the required block, wou=
ld
these examples also need to be updated to include them so the examples can
continue to pass dt_binding_check?

>     i2c {
>         #address-cells =3D <1>;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908123146.1839=
854-1-shivprakash.gupta@nxp.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E41391E73
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 07:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977571; cv=none; b=H9457gDEb/kbQ6+WLrXcq15ZHUIHh7zDB/JEF832KpYqa4RYQtmfRMWcxDm//foSlAX0p+dlpJw7gXxMmXiaXJ/akqzea/v3ozRP2rMNvPS5VKiI50erQ5R1beIPsLVx+63jYtaJJ5TDruxQb1Hsj9EL6SkUQH7aLaNxJxcDPgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977571; c=relaxed/simple;
	bh=NX8NBKytqpUTtmc/NWy8eAS7Y/YTag0/84c4ZkG6S+E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m91VUaARnJn1OL243EmB8biA+z1Rll/0SwuHXucvixp/jIaYmzPf+ebP52+QxXfGGkUc+2z7iwHc6hlIgXDCXHofmwffW05q055EzDSgiVGNS081VLKdyMI6hof/uflj2DXokclmCBWZS9zkV4SlaHVm8t0yWp17LeVBvGxpYMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMEGMhB/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMEGMhB/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8975D1F000E9;
	Thu,  2 Jul 2026 07:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782977569;
	bh=HqwbbsmD07qLph5NTExpCeCvy6H8RyuNlhtqbxJGaCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oMEGMhB/Ot2txftttNjhgEhkjSWbdbijcwoW4oUg1QO7WJ2o+k8nXKPgVdYCfnJjJ
	 YxLXK6H8AtFjf0eHbldzJR7lSCzqWNtnT93n6rxEiCxMOrWz9I0xekVijfID8PZQ/O
	 BC1LQPSrIH6P+WxUgKWhFBzOoYaEwiLSsoB+7nEhmneGLwqOA1/KdqOSOInOk7I9gD
	 jaCLry9vVHWKqPBSCHb9/3RTjnbYyQDhq9UomlVsPaP4MTkhDwcVYKMnW3TJdtZLjc
	 L5wT0adeGaorhNcsI6LE86rN6JcJaZpsnAZXDi5/6jjieBlOrwdKSN3WYlXHZg3L+8
	 TQLA1ZBvBqBEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add os02g10 sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elgin Perumbilly" <elgin.perumbilly@siliconsignals.io>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260702072502.7907-2-elgin.perumbilly@siliconsignals.io>
References: <20260702072502.7907-1-elgin.perumbilly@siliconsignals.io>
 <20260702072502.7907-2-elgin.perumbilly@siliconsignals.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 07:32:48 +0000
Message-Id: <20260702073249.8975D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing hardware-specific constraints for `data-lanes` and `link=
-frequencies`, and missing `data-lanes` in the required list.
- [Low] Contradictory voltage level for `dvdd-supply` and a typo in a phand=
le name in the example.
--

commit ce94f55aec46b60fcbb8306168231259fed7b004
Author: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>

dt-bindings: media: i2c: Add os02g10 sensor
   =20
This commit adds the Device Tree bindings for the OmniVision OS02G10 image
sensor. The sensor outputs RAW10 format data and supports a 2-lane MIPI
interface.

> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yam=
l b/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
> new file mode 100644
> index 0000000000000..72c6beff3625e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---

[ ... ]

> +  dovdd-supply:
> +    description: I/O Domain Power Supply (1.8v)
> +
> +  dvdd-supply:
> +    description: Digital core Power Supply (1.5v)
> +
> +  reset-gpios:

[ ... ]

> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        required:
> +          - link-frequencies

[Severity: Medium]
Should data-lanes be included in this required list?

Since the sensor specifically supports a 2-lane MIPI interface, would it al=
so
make sense to add constraints for data-lanes (e.g., maxItems: 2) and
link-frequencies (e.g., maxItems: 1) here so that unsupported configurations
will fail schema validation?

> +
> +    required:
> +      - endpoint

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        camera-sensor@3c {
> +            compatible =3D "ovti,os02g10";
> +            reg =3D <0x3c>;
> +            clocks =3D <&os02g10_clk>;
> +            reset-gpios =3D <&gpio1 7 GPIO_ACTIVE_LOW>;
> +
> +            avdd-supply =3D <&os02g10_avdd_2v8>;
> +            dvdd-supply =3D <&os02g10_dvdd_1v2>;
> +            dovdd-supply =3D <&os2gb10_dovdd_1v8>;

[Severity: Low]
Does the digital core power supply require 1.5V or 1.2V? The property
description for dvdd-supply above states 1.5V, but the example phandle name
here implies 1.2V.

Also, this isn't a bug, but there appears to be a typo in the dovdd-supply
phandle name (os2gb10 instead of os02g10).

> +
> +            port {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702072502.7907=
-1-elgin.perumbilly@siliconsignals.io?part=3D1

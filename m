Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D567F539770
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 18:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917792; cv=none; b=fZTI1KC9/S/6Uzz3f+VPx19G7ovkO77iMvwErIQBJkPGmSpG+HR/db6XZvMM/yvQthNZnaW6wRl+8FK7uGDUCsVba8t+wK/FqCgJzxNOQmwk4uI5pn97QHh6Bvl6wKp/mPDIhsx7CjZuECQ0OyJo5AV8Arpalsl/PVC2BfbtbC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917792; c=relaxed/simple;
	bh=+NDPVNLcqeL0rqR8VOQAFp0BoAYEU3fmgAvf4zFrif8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=BOU0WdVGEFVHAXgLZpVx7B7Vh1PJL4nr8IdLePjejWNIJZg67//WHb94EUdsB63uji4LZ5wOQEP4NK4WIjfADeX2/LNFXbeGSzZpDpWHdRdffRatdjdXoK4cMln5XZo6o9qF2LlAGss66VoP66NOlCg3julaI0rt/onxT0k2WXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnGgIbC/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnGgIbC/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B4A91F000FF;
	Tue, 13 Oct 2026 18:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791917791;
	bh=DaTW5sSeQ9DkkPYO1lHNhc31Iba+L/ndZtWkX1g/hm0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mnGgIbC/8Ygwbt4/ONGBukWOvo5Rh0BJgGMbGejL/CpX5VGf1YZ3x6oVAOtN/Zqh8
	 oxWE8V167w5YwCrWnDzaAMK6+XXdD43ZHErwSDDODhQXZ6bCmIjI1T/noU2RHA9bpE
	 GP/pE8CuIb4tLmBw/phPJdoBja4fEm1FDJzJW1Z6HSnwGGQqdZVlqngB/sViS2+2Lc
	 OhR9YT+SewNUyIar/bzIB9hz1wN8S/ukyh2JgAdAf0lhiUhc7Gq7vOEn7yJ4F2QxdX
	 Ol5lr1QJ091tEYL/t/2g3BwV+SVkguSffHc8CSwMti4/5cmOy7yrMjS9gLvOzpQt/Q
	 AJ4IdfWHa5uEQ==
Message-ID: <sashiko-outbox-170357@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2 RESEND] ASoC: dt-bindings: Document FM34NE DSP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013184755.530392-2-clamor95@gmail.com>
References: <20261013184755.530392-1-clamor95@gmail.com>
 <20261013184755.530392-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 18:56:30 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: typo in example clock phandle fn34ne_clk
- [Low] dt-bindings: missing audio-graph-port validation on nested ports ch=
ildren
--

commit 7ea62b580d59721cf9be3722ba0f59686684d184
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ASoC: dt-bindings: Document FM34NE DSP
   =20
Document the FM34NE DSP based voice processor used in the ASUS Transformer
devices.

> diff --git a/Documentation/devicetree/bindings/sound/asus,tf201-dsp.yaml =
b/Documentation/devicetree/bindings/sound/asus,tf201-dsp.yaml
> new file mode 100644
> index 0000000000000..6b1c478bd03cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/asus,tf201-dsp.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---

[ ... ]

> +  bypass-gpios:
> +    maxItems: 1
> +    description: Signal that switches DSP into programming mode.
> +
> +  vdd-supply: true
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports

[Severity: Low]
Does this node lack audio-graph-port validation for its nested port childre=
n?

When a device tree configuration uses the ports container node, any propert=
ies
inside its nested port@X children will only be validated against the generic
graph.yaml schema, not audio-graph-port.yaml#. As a result, invalid or
misspelled audio-specific properties will silently pass schema validation.

Should this explicitly apply patternProperties with a reference to
audio-graph-port.yaml# for the children?

> +
> +  port:
> +    $ref: audio-graph-port.yaml#
> +    unevaluatedProperties: false

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        codec@60 {
> +            compatible =3D "asus,tf201-dsp";
> +            reg =3D <0x60>;
> +
> +            clocks =3D <&fn34ne_clk>;

[Severity: Low]
This isn't a bug, but should this phandle name be &fm34ne_clk to match the
FM34NE chip name?

> +
> +            bypass-gpios =3D <&gpio 222 GPIO_ACTIVE_HIGH>;
> +            reset-gpios =3D <&gpio 115 GPIO_ACTIVE_LOW>;
> +
> +            vdd-supply =3D <&vdd_1v8_dsp>;
> +        };
> +    };
> +...

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013184755.5303=
92-1-clamor95@gmail.com?part=3D1

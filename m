Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87FA2DFF04
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 14:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779977299; cv=none; b=djRN/6+vQkORgxn/DfYcrIeM2sgNxtk6egG5pKt8OYwXZdXZ9ZfNxG/SBtaLB7eBYUmb6YuXOWHa+L0yMMhm/jkD4B3K4FP7bziYcptUbgtX/dL22fKfhWbxFQd8Cu+QWpYFaxx5VvI4IKBUF66jnuERFQf2o3qaYdOEd+LaRAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779977299; c=relaxed/simple;
	bh=S8iyudqOv6JcpMnVzlrB80GyO1KvtIqWPWPDnwz/lik=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QYqVW1sQQMpmyDrrjyJBSRKWIHD0755pQ1CgqDXvMxigKQ2oNPnHMJ845dGW9DPdNdfpElMZA/O7WBPoFhbFr0P0cghSUnKtpJQjdiOwSIL+Y4O1r3V02vJrlHQquEBjSkXPtbCF23zIfvogLTlqsNRLAe83C3G9pmj++gXOjas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCePkFYk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCePkFYk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4676F1F000E9;
	Thu, 28 May 2026 14:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779977298;
	bh=NYhlbEnr/j86eTtWnVydiHokNs1OtiqtJhFPUqvCKiQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MCePkFYkoPaxqmrMb2BiiGtAjGcyyY2sq4LsA2emVkqRm8SWjckFjC8BjE0bSgBHL
	 ZXMWzvlo/sbq4/ngyjVaOtURQ68QRVDQJI/JurETzYr86uzv29pT8w1Gp41BQ+gFtR
	 DT+l9LNkUtGLX7P+o3CBD/+Of8RGS8ZukeUM414vY8m8qys6emPLmQBo8ULR6aSYuH
	 WMyqrdIo67jwZjQPnxjTseSuEO4mG0uZbfjdwnnw+VQT6ucS43n6rzSW2EISEryocU
	 CuspktADEwXcPt6RkFVyL/Es7CKUCV9JbpsRhZ4YW6+nfu4nRglHrJtCrUOxSdFo0V
	 l6qS3o7OAHsXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: leds: Document TI LM3533 LED
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260528135123.103745-2-clamor95@gmail.com>
References: <20260528135123.103745-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 14:08:17 +0000
Message-Id: <20260528140818.4676F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The property `ti,resistor-ohm` does not use the standard DT schema =
unit suffix (`-ohms`), and its description contains a typo ('resister').
--

commit 3710ffb632b560bb2fb8a924f794c4e747f0362b
Author: Svyatoslav Ryhel <clamor95@gmail.com>

dt-bindings: leds: Document TI LM3533 LED controller

This commit documents the LM3533, a complete power source for backlight, ke=
ypad,
and indicator LEDs in smartphone handsets. The high-voltage inductive boost
converter provides power for two series LED strings for the display backlig=
ht
and keypad functions.

> diff --git a/Documentation/devicetree/bindings/leds/ti,lm3533.yaml b/Docu=
mentation/devicetree/bindings/leds/ti,lm3533.yaml
> new file mode 100644
> index 0000000000000..6e12e12be08e5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/ti,lm3533.yaml
> @@ -0,0 +1,170 @@
[ ... ]
> +  light-sensor:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        const: ti,lm3533-als
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      ti,resistor-ohm:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Internal configuration resister value when light sensor is in

[Severity: Low]
This isn't a bug, but should this property use the standard dt-schema unit
suffix -ohms instead of -ohm? Standardizing the unit suffix allows
dt-schema to automatically infer the property type without needing an
explicit reference.

Additionally, is there a typo in the description where it says resister
instead of resistor?

> +          Analog Sensor mode and PWM mode is disabled. The expectation is
> +          the input is a current from the external analog light sensor a=
nd
> +          this is used to convert it to a voltage within the target rang=
e.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528135123.1037=
45-1-clamor95@gmail.com?part=3D1

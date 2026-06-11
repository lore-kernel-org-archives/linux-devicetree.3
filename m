Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9FE363095
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 08:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165293; cv=none; b=Je+rraEw7UXkDzv7GfqHIVFqKAyVWnBczEEk06t3di8R7vEdpa5R4IArMrL6AfCLGaD1mfTG68FW7YQ5PO3G41ndB4/tje9/h5CbhVBU4/0xUxSJo+Hoy5XIjKg3cSUHECszH6i8jTIGeI7ofwRJp6Go2l4mfLjwS1zG9ATZHUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165293; c=relaxed/simple;
	bh=ocD3tvoXzXahZzTUISDMSItBUM1o1jp9yk9f2v3muQg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HQm4s3Q+EAflzChsLJW+AQwpI6OHUwZuCuDwZnUvzU8wvERaeIaon75XSIS6kAAeMdsI3EOe1WvhVMr+KNUwEssRpGU3lOFY9+1ixbhuODYcoYUFkNxoc0i2ssaqJdWIUCIupNLTdN2iGwCaEiWAGmYxTfBXM348w1FhZF0MKoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEtk5hpA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEtk5hpA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105111F00893;
	Thu, 11 Jun 2026 08:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781165292;
	bh=p2Xukh7aO/wY2LIEC2GcugcnW0NKdcHKo6PEnzIDPrU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MEtk5hpAfPlUlC4ajCdVVHGDDfdNSBK5f0yJ6DWa3B93aw1C8maIY0yj9EYGlbpoA
	 HE0icCnkVeopfMnKGljcPbeYFPEFG03lbR68YpmpGe0nqsgXfFFTOalpmKBu+Wj1Le
	 Tg2c/hZi4b8jtPL2rMlApIwzPwmwO2OQe4sh8WurKLok3zHAgiPPfFPJDQcLZIO0Lg
	 W2AQC8N2JxSC1RgcekWUMIGFauYQ8wiWaRZszf9YLfs227piaRcQYW3pIjMzg+cKjD
	 sD2o2FPZaWfuFGYisbfrgptUWmDBHv6qlUJHG3twDbBFoOGhb5IFtV7Xirif/c49Gj
	 Jp35JOsJwCbZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: interrupt-controller: ti,irq-crossbar:
 Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260611-crossbar-v2-1-231d4f88298e@gmail.com>
References: <20260611-crossbar-v2-1-231d4f88298e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 08:08:11 +0000
Message-Id: <20260611080812.105111F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect property name referenced in the description of `ti,irqs-s=
kip`. The description refers to `ti,crossbar-irqs-reserved` instead of the =
actual property name `ti,irqs-reserved`.
--

commit 19def91a21d8fc01d4494e60735ef7f90bf2fedd
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: interrupt-controller: ti,irq-crossbar: Convert to DT schema

This commit converts the TI irq-crossbar binding from text format to DT sch=
ema.
It also adds the missing '#interrupt-cells' property and moves the binding =
into
the interrupt-controller directory.

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,ir=
q-crossbar.yaml b/Documentation/devicetree/bindings/interrupt-controller/ti=
,irq-crossbar.yaml
> new file mode 100644
> index 0000000000000..ec9a33511aae3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/ti,irq-cross=
bar.yaml

[ ... ]

> +  ti,irqs-reserved:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      List of the reserved irq lines that are not muxed using crossbar. =
These
> +      interrupt lines are reserved in the soc, so crossbar bar driver sh=
ould not
> +      consider them as free lines.
> +
> +  ti,irqs-skip:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      Similar to "ti,crossbar-irqs-reserved", but these are for SOC-spec=
ific

[Severity: Low]
This isn't a bug, but there is a typo in the property name referenced here.=
 The
original text binding correctly referred to "ti,irqs-reserved", but it was
mistakenly changed to "ti,crossbar-irqs-reserved" during the conversion. Sh=
ould
this reference the actual property name "ti,irqs-reserved"?

> +      hard-wiring of those irqs which unexpectedly bypasses the crossbar=
. These
> +      irqs have a crossbar register, but still cannot be used.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-crossbar-v=
2-1-231d4f88298e@gmail.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40475385D7F
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 16:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784825424; cv=none; b=NKGbzG6QeU2sLpIHzm0zkouaWo6vi62G8R8HYvo1v65cIggBcI+FN2udOdECmViX4FRRQ+VrJkUsQmE8RFmrS4CHfVBy3fGD1PAkoMwY6hKNJME5jl2iuWPG0QQNENT6b88uydBpwaT8F71dPDU9FJSHK5JZqIO5Kh3Su7ou0hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784825424; c=relaxed/simple;
	bh=Qt9veuOiCZeibe2A+dYFqdhj/6tXJVZqmA2XxtTXh8c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NMLUwzIV3qrg0M7vCjNK5NGkihgTIdsrhFU3GPA41ExvpWOHeBwsIsL4A2CT+2BHYdcHIO+Q8MGSWDHjFPPf7iCvgRDG0zWgDWBnTpD9H/Af6CmlZuw2+XAzqeGtWQUCMJNhKygpqXKxHUiTbDybftbi/mrEol22akNvXfL0Q3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7oRQftg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7oRQftg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D811F000E9;
	Thu, 23 Jul 2026 16:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784825422;
	bh=52jr6pIPz0HjasM0gCb7JmuTRrOapn8JRzKx/rVZlvg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X7oRQftgNh+HgyMGdT8wXf2LmmLpdf3HFf705+7T/a8JaN1PrvKU186KGih+cJi0I
	 5amGMH4mCwutqG6QwbyETC5Zf6Ld478yKRzyVuMjLKpAxKyIGagiY1FFJbXlA2PuT/
	 UzrbiV3VmJ5EfZWtWbv/p332OTzcLqebTiVxqfOk1+dq3N7iiBr5MyqGfQsEyLPiMj
	 uNV9tnIp4fyePC6uQjYr+LqdGLV4bZMQaWUTHZC7ZVr9ElEpJhWoZEBTAFoI5wXwK+
	 EziepR0iE5wIsCLAX687Lt4fHWFa/m/2bDEOFDGRl2C7ZCFQkZJtuwU1hxT+b5lUGj
	 biFpk1adEhbpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: clock: ti,da850-pll: Convert to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260723-ti-pll-v2-1-cdc5e559a77d@gmail.com>
References: <20260723-ti-pll-v2-1-cdc5e559a77d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 16:50:22 +0000
Message-Id: <20260723165022.83D811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The YAML conversion fails to enforce the legacy binding requirem=
ent that `ti,da850-pll0` must have two clocks (`clksrc` and `extclksrc`).
--

--- Patch [1]: [PATCH v2] dt-bindings: clock: ti,da850-pll: Convert to DT s=
chema ---
commit b42ff860694a3d7f4cabbc240cd8dff47c5f7fc0
Author: Bhargav Joshi <j.bhargav.u@gmail.com>

dt-bindings: clock: ti,da850-pll: Convert to DT schema
   =20
Convert TI da850-pll binding from legacy text to dt schema.

Link: https://lore.kernel.org/r/20260717-ti-pll-v1-1-f6f9ba8c9b5e@gmail.com

> diff --git a/Documentation/devicetree/bindings/clock/ti/davinci/ti,da850-=
pll.yaml b/Documentation/devicetree/bindings/clock/ti/davinci/ti,da850-pll.=
yaml
> new file mode 100644
> index 0000000000000..c6563290a702b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti/davinci/ti,da850-pll.yaml
[ ... ]
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: Primary reference clock input
> +      - description: External clock source
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: clksrc
> +      - const: extclksrc
[ ... ]
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: ti,da850-pll1
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1
> +        ti,clkmode-square-wave: false
> +        auxclk: false

[Severity: Medium]
Does this conversion correctly enforce the legacy requirement for
ti,da850-pll0?

The text binding required two clocks (clksrc and extclksrc) for
ti,da850-pll0. While the allOf block correctly restricts ti,da850-pll1 to
maxItems: 1, it doesn't enforce minItems: 2 for ti,da850-pll0.

Could incomplete device tree nodes for ti,da850-pll0 with only one clock
silently pass schema validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-ti-pll-v2-=
1-cdc5e559a77d@gmail.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F60367B6F
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 06:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786689348; cv=none; b=Jc4bTgWQSQz5yPupdQqAd+VPYDkCeRSb/9RPBPyJjVxekEpHCpsoJ6xoBXGNkKezQgBRMGkQYVuOQiyvmrk2LWBzFLdpKGwSowY794OnaU1EvGp/Ia7ZjGyiTDY+olaK1kYQy8Q+thlJg4X0nvwsekVi4hMdtMBgdLGtRImBans=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786689348; c=relaxed/simple;
	bh=Jlx9gU45H0IEDjeG6Yx96KGRRD+gAgUhsO9qcddRphE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DJD0GC69LbP9B7QQOXjpU0JnRjumAaddhz7GVgXIrrf19tWYbumPson6ILlU6RCQBZNGBR1qitAgrRUJ+fbRSNqBYVfb6Knp4JlXi9HuyCOjy8rwefefklUVHNxjhPHsTmomyGauEAhPhi9y5P+UoOM5JHSyh0VEMS2x0WIngz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1NxpriA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1NxpriA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5351F000E9;
	Fri, 14 Aug 2026 06:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786689347;
	bh=yX78z9i7YFFfnazFnXB17ep5U+GbUgvn0tHb+PVHsC8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l1NxpriAkYFykD+v0+u/jT+gJtQWhwinqmwCcuKqtYGkuMwbkO71NG+4PU2aVby/v
	 qe25lYDoz+9Aw3bVfueZWAFtyGqtsJpV+4rFSUDClYw+30GtKawtxKDBNVT8I4joo7
	 Yndkg0u7iTzZrt74kR3OX2ixopqMgY1bvlrigUBI/jCZAtsFUculswN/tadId5fLth
	 oC2pmtqQvESa+eXsZvQab1zZS+tiXJSxKGHyTe7GhkXAMtitUr9LY5HVtEX8uw3uyj
	 48ixUkhWDpc/WDxM4OlqGPK+zKKI6lZs26MRzTofpkQBRrmCMINR2+9kCNDwJbz6/L
	 KOdC1+JOArU2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: pinctrl: add Ambarella CV75 pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260814-cv75-v4-b-v4-1-ef2e83ec0eac@ambarella.com>
References: <20260814-cv75-v4-b-v4-0-ef2e83ec0eac@ambarella.com>
 <20260814-cv75-v4-b-v4-1-ef2e83ec0eac@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 06:35:41 +0000
Message-Id: <20260814063546.AB5351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding schema prevents configuring bias and drive strength =
for GPIO pins because 'function' is strictly required (with no 'gpio' optio=
n), the 'groups' enum lacks GPIO options, and the 'pins' property is forbid=
den.
--

--- Patch [1]: [PATCH v4 1/4] dt-bindings: pinctrl: add Ambarella CV75 pinc=
trl ---
commit a8e38fe4533be470b102e4e747568db3d0143b1a
Author: Long Zhao <longzhao@ambarella.com>

dt-bindings: pinctrl: add Ambarella CV75 pinctrl

Document the CV75 pin controller binding using generic function and
groups properties for pinmux configuration.

> diff --git a/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pin=
ctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctr=
l.yaml
> new file mode 100644
> index 0000000000000..9d65da32d3d28
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.ya=
ml
[ ... ]
> +patternProperties:
> +  "^[a-z0-9-]+-pins$":
> +    type: object
> +    allOf:
> +      - $ref: pinmux-node.yaml#
> +      - $ref: pincfg-node.yaml#
> +    additionalProperties: false

[Severity: Medium]
Will this combination of 'additionalProperties: false' and omitting a
definition for 'pins' prevent configuring individual pins?

This appears to reject the standard 'pins' property, meaning users cannot
specify pin-level configurations for GPIOs.

> +
> +    properties:
> +      function:
[ ... ]
> +      drive-strength:
> +        enum: [3, 4, 5, 6, 7, 8, 9, 12]
> +
> +    required:
> +      - function
> +      - groups

[Severity: Medium]
Does requiring both 'function' and 'groups' unconditionally prevent=20
config-only nodes, such as configuring bias or drive strength for individua=
l=20
GPIO pins?

Since 'gpio' is not an option in the 'function' enum, and 'pins' is blocked=
=20
by the earlier 'additionalProperties: false', it seems impossible to define=
 a=20
valid node for GPIO configuration without incorrectly multiplexing the pin =
to a=20
peripheral function.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814-cv75-v4-b-=
v4-0-ef2e83ec0eac@ambarella.com?part=3D1

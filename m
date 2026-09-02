Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6CA34E74B
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 05:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788325645; cv=none; b=KmIJ+ltY2F7ojyfssmVyePN2eOYEt51HGlBGvvUgciao+XLada03mo+rST9NY3H/oB4u6p9P7CPadiY6+gfoor6PSUd8UorLeiY6GCFl+8KSzgM3OeT4RnlGXldOC/3kad1dP6wsnxbKqaYYkOLPeLsPlxSdKcTq8+fgR2jpoHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788325645; c=relaxed/simple;
	bh=yeVvRt4XABl65vmOJWd03NbseDrVkLHaQ93/FBDd7h4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lijg4uA2UT8YB5+P6+S/LMqlj+h7BJPFGFXr9Pih/H4Myl1/HLYJ6Jjovx8c3zUYZARJQUFr1GbrCg+A0bxAnrg6FH9iHIrMEDBG3fL7gtSIUYaDtLFUeOLj7c8Ko/hzaZRxZczMXCAb2S//vcjTdd0nFpbDlD+jXo0gqsMsezE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNQhAUXy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNQhAUXy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E071F000E9;
	Wed,  2 Sep 2026 05:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788325644;
	bh=Mh4fHpayyeRv0qu8scDHO+B0HvB37114oXpk0Ao8cPc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GNQhAUXyrD0BIGYTHguZZb1suBO+tpoLUkNYVfth4rP4PrMtMF4NVB+Jukl8AJPIB
	 O1/yZFGkxzobjUme5bZLqUDRMrowVjGOtOZgROQfMcfhvMa5/ttv3ynfYRuNVl2rTo
	 9i3a/z50L1Qe3KJo1HanDUJJBilbH1uLA2Ji7yd1deawPCtz4TmjRc226RVFqkKLe3
	 SCGQyTGZ//7K3jaDmaBFlNeNg7qAK2g/rhhCZg9mHIKQMZyp+qmJjzM5Eb5U2zEHh0
	 LTiVYhw3hDnD5ojFrOkJ8nzqnt81b+R0ZuxnAAxHn0gL195apMZUNLNHftaXF9BEKT
	 5ukWZdGoefdAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C and
 PD controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902045938.184221-2-shengchao.guo@oss.qualcomm.com>
References: <20260902045938.184221-1-shengchao.guo@oss.qualcomm.com>
 <20260902045938.184221-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 05:07:23 +0000
Message-Id: <20260902050724.15E071F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Invalid application of JSON Schema 'maximum' keyword to the 'reg' a=
rray property.
--

commit 5b798d6ff22fa60fafae940009972a32c9ecd0c7
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller

This commit introduces a device tree binding for the onsemi FUSB15201, an
autonomous dual-port USB Type-C and Power Delivery controller. It defines
the required properties, interrupts, and connector child nodes to describe
the ports in a device tree.

> diff --git a/Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml b/=
Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
> new file mode 100644
> index 0000000000000..09f2e964d3ef3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
> @@ -0,0 +1,152 @@

[ ... ]

> +patternProperties:
> +  '^connector@[01]$':
> +    type: object
> +    $ref: /schemas/connector/usb-connector.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      compatible:
> +        const: usb-c-connector
> +
> +      reg:
> +        maximum: 1

[Severity: Low]
Does this introduce a regression by applying the JSON Schema maximum keyword
directly to the reg property?

The reg property is an array in device tree schemas, so applying a numeric
keyword like maximum to it is syntactically invalid and silently ignored by
validation tools.

Because the node name regex ^connector@[01]$ combined with automatic unit
address validation already restricts the value to 0 or 1, this doesn't allow
invalid hardware descriptions to pass.

Should this constraint be updated to use an items list constraint, or remov=
ed
entirely since the unit address validation already enforces the limits?

> +        description:
> +          0 for port A, 1 for port B.
> +
> +    required:
> +      - reg

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902045938.1842=
21-1-shengchao.guo@oss.qualcomm.com?part=3D1

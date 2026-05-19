Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603AC3537E8
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 23:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779233058; cv=none; b=lXR0RNLriyFOY7iW19byqDYNW8qHklz9FhMZxnY1RRMXpnIoMaA6FhC1s0FXOWGb0Dp8jYSO3cXtIjTM4HG/r/am3Jg/m67OrePeXYQL4yUW52n5g9Z1JMKPykKd2cxEiWmq70V6OAnEsRTtS1JI7kU7LiTlfroNO5emi063iHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779233058; c=relaxed/simple;
	bh=S3a5iAKpD+cE3WklY9yNbjgh/fqkdUOBWf6LlKc3kvo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cUCOecvRepQEKhqrSZzQY2eSLLnDtbRPvhWVHKhU+rmBYpcsHbVK5wUPZ9SUJHBQhHFkSDZmKk1byJl6EHfQ8iisiuCug7xI3OAMbsnXF+Fn23FVO8VABIYnCx8PCaDickW14kNi11QYuw3tTU6rjONysDEWCDJI6z3ypZsmER8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cr4MS3tg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cr4MS3tg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB941F000E9;
	Tue, 19 May 2026 23:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779233057;
	bh=Ow+zU68oNPbQeDgdrbcq+V8d6UQYi5JgdjeuZQr+WFM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cr4MS3tgrjQ0rxXcY4yKce/JlfS2zwo2mAVJB3kVTyyhnYHKyi4GFBBuQg7DXCpOO
	 wQ9J7z33ZubSP5/Fv58UuDRC30C7JnCQ967W+e6TwmwCjM+gsiu5aOPa5LWQuqkzHX
	 6oijKaEmQLbEcbPB7MdMtpMxis19VQ8JujjQbJ2Ym6cQd7OU8s5Ka/HlxAzJqWbtne
	 7rfRb7BwMVUgBsX3tTjyumy2LY751qqJFP00fPm+BDYFtmakStBoK2p82hVzAfqliK
	 BbekW1lPtwZ6GP3QPP4NcnLmqq1+/XekJ31ZaPRcQ+MuFYwqIETDUgqXLjXNpxQ9Yb
	 f55tLOGpa3Sig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: i2c: mt7621: Document an7581
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260519223253.1093-4-ansuelsmth@gmail.com>
References: <20260519223253.1093-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 23:24:16 +0000
Message-Id: <20260519232417.0AB941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `resets` property is simultaneously required globally and fo=
rbidden for `airoha,an7581-i2c`, creating an unfulfillable schema constrain=
t.
--

commit 3adf72aadbf7e46de9e7f59a27a4659de5c618d9
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: i2c: mt7621: Document an7581 compatible

This commit adds the airoha,an7581-i2c compatible to the mt7621-i2c binding.
It notes that the Airoha SoC lacks a dedicated reset line and adds a
conditional block to reject the resets property for this new compatible.

> diff --git a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.ya=
ml b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
> --- a/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/mediatek,mt7621-i2c.yaml
[ ... ]
> @@ -38,6 +40,16 @@ required:
>    - "#address-cells"
>    - "#size-cells"
> =20
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: airoha,an7581-i2c
> +then:
> +  properties:
> +    resets: false

[Severity: Medium]
Since the resets property is listed in the global required block for this
schema, does setting resets: false here create an unfulfillable constraint
for the airoha,an7581-i2c compatible?=20

It appears a device tree node will fail validation if it omits resets due to
the global requirement, and also fail if it includes it due to this conditi=
onal
constraint.=20

Should resets be removed from the global required list and instead be requi=
red
conditionally for the other compatibles?

> +    reset-names: false
> +
>  unevaluatedProperties: false
> =20
>  examples:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519223253.1093=
-1-ansuelsmth@gmail.com?part=3D3

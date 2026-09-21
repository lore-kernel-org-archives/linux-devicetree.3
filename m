Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8352485950
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 23:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033494; cv=none; b=syHb8G2CPFEPDCXZhEUkSnei6BDdoicdZcWYQ6Demnhc5VKMHVQPC59Zmz/yDbknHmkr/SrBhXfPymZrtL+hBO45Tr9KU7JYD7RCeisfYy//IEalZ7tXQ+dAluAxZ5SmLMf6sOaEUODzD+tZrs2oOarYmrIflsEzYvFdUmOGZ+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033494; c=relaxed/simple;
	bh=ngYdl9UZAB1DqGatFNwRlGp3ejvyBXphxPXjJOALX/M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TsUONwVGdkL7C0o+NUtSrUdFIkxcqsAKaPG4BTMl1fMLMdmLuCJzvzjdEy83KJJldnJA617Awh28qVEd5P24ZIkbW19QfKCR7yeGvvQvk8UVbGaVa/LJe9QP3GlEdqs/smNBBjKtSi0l85VjoG838pMvr0Ia3ICSz92oe6R4oAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CjXqqGto; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CjXqqGto"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F1E1F000FF;
	Mon, 21 Sep 2026 23:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033488;
	bh=x9lp7gPOH4HN0ABVJ+mnRA/E2DYHcAtL7p17OLva6Sw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CjXqqGtoH8rNEEO06NNp5LkVdG2N94y96orykZd4hTn63p4zRl3J/8xChcfKps2RZ
	 LgxUqYrmZ9kR5r6tFyo9zKT4ZmvEGvaAqc2r/f7ET89fPQRHvf6H5j4UG8/DFLX85V
	 UXcI32XVY6OxisA/1V0rXkvfwJT/TBt7AqRG6UDQ5CC69rjXUzmD07XUu92bx4sM7x
	 WXI17zvSjWse89uXFwwfelDbf3RsulVbNFOqV5bSxFtzdCI4unYyg/G8f4FYqpYOfo
	 Txx8uMUZFVDBonot0U09nHYTbmQVHlqWp6KIx7y/ysTiHWOmvv1m4XP20RWFGsGVQh
	 xcDBppX+g8EIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: panel: Add JDI NT35596S
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260921232609.3130272-1-robh@kernel.org>
References: <20260921232609.3130272-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 23:31:27 +0000
Message-Id: <20260921233127.C2F1E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: incorrect use of additionalProperties instead of uneva=
luatedProperties
--

commit e0dc4d49c687f6d5568ce2c31031086acb6cd5e6
Author: Rob Herring (Arm) <robh@kernel.org>

dt-bindings: panel: Add JDI NT35596S

This commit adds a new device tree binding schema for the JDI FHD
NT35596S MIPI-DSI panel. It documents properties such as the DSI reg value,
reset GPIO, backlight, port, and various power supplies.

> diff --git a/Documentation/devicetree/bindings/display/panel/jdi,fhd-nt35=
596s.yaml b/Documentation/devicetree/bindings/display/panel/jdi,fhd-nt35596=
s.yaml
> new file mode 100644
> index 0000000000000..aefc9ae5d8abd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/jdi,fhd-nt35596s.ya=
ml

[ ... ]

> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: jdi,fhd-nt35596s

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - vddio-supply
> +  - vddneg-supply
> +  - vddpos-supply
> +  - port
> +
> +additionalProperties: false

[Severity: Low]
Does the use of additionalProperties: false here incorrectly reject standard
inherited panel properties?

Because this schema references panel-common.yaml in an allOf block,
additionalProperties does not traverse the $ref references. This blocks
standard properties like rotation and forces the redundant declaration of
properties like backlight, reset-gpios, and port just to pass static JSON
schema validation during a make dt_binding_check.

Should this use unevaluatedProperties: false instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921232609.3130=
272-1-robh@kernel.org?part=3D1

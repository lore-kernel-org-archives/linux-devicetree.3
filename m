Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9716F2D5C83
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785202445; cv=none; b=T2H4TTlFZDuneQAZ98LFtcfhkkAEphI9CXFPjlRBb4RU0WPb2WI60kFcn2A88ZT8KUisvGHazvbqxBhIN8eAO0lfA7lFyaOmTVwQZZ5sB/g2ilaXP6q9QJLKSeHf8aMa9z2R5NON9KsqNJBOcqyG6jKJmIFY4mU/qlNgDFJoVBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785202445; c=relaxed/simple;
	bh=eLJ4cm9aXbCg4AG6cBWY6zl9jR/oCZjPRsFw4LHK8zE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SLb3vHB3JuzVb5HTB6zvzAhSq2eqyc/LYN1ha8Pn0KGEBTc+wVqtkdOYQdGWRDrdDuy4hCn35CDPra7iy6XR6mVoYJzgdv+1KWBL58UHunH5jAp5THiocVJti45Rguuw00BqZKFtgm4w4yZ+1Ky2sDOj6zW46HGerLaK4yK8Ato=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XZmuT19u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XZmuT19u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA71D1F000E9;
	Tue, 28 Jul 2026 01:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785202444;
	bh=y2ZS71WoNaulKBW7nTpsYZ0yCqmGfmS07Fi6RI+zClM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XZmuT19uwj7slcOw2Rj+F8lbIDsP7ZnXs/zZ65+H4KHNzeoxg/7Jt5C+pKhNbBHkf
	 JSgJgzOWP6R/Xf88tKWP91NjRZ24gfL0GNPGFZmRzyfEcE4S3J8hBIOu1ej3VeREfw
	 cVOb7JouPEYtlqH8Q5JLDJakKIC79g0m0r8Oj6kKtb6RV0qMHo8wKL6jPnXbG8W0I+
	 bUriJQYG8q4HFeV3+2iOAg+Y6PFVcBGucqVHTvNkm8Ph+PRs8q+kDn1j9rzdeN1HaG
	 G6SjcxrMI/lDQI4FlOPp+ut2NQl5D6XdeW4Bcca7GGsZwHWokNOhQu7VxtTNuo9an1
	 HC3kkxxEvRDSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: Add Parade PS5169 redriver
 bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esteban Urrutia" <esteuwu@proton.me>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727-ps5169-bup-v1-1-c76a8ef3b239@proton.me>
References: <20260727-ps5169-bup-v1-0-c76a8ef3b239@proton.me>
 <20260727-ps5169-bup-v1-1-c76a8ef3b239@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 01:34:03 +0000
Message-Id: <20260728013403.BA71D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The schema incorrectly uses `additionalProperties: false` at the=
 top level, rejecting inherited properties from referenced schemas and brea=
king altmode support for the PS5170 variant.
- [Medium] The `ports` object lacks an `unevaluatedProperties: false` const=
raint, rendering the `if-then` restriction ineffective and silently allowin=
g `port@2` on the PS5169 variant.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: usb: Add Parade PS5169 redriver bin=
dings ---
commit dc85f2d66c6d67f68f982e513db1687e5793eecf
Author: Esteban Urrutia <esteuwu@proton.me>

dt-bindings: usb: Add Parade PS5169 redriver bindings

Add bindings for the Parade PS5169 and PS5170 USB Type-C linear redrivers.
The difference between PS5169 and PS5170 is that PS5170 features an
embedded AUX switch, while PS5169 does not.
Future-proof the binding by adding PS5170 as well.

diff --git a/Documentation/devicetree/bindings/usb/parade,ps5169.yaml b/Doc=
umentation/devicetree/bindings/usb/parade,ps5169.yaml
new file mode 100644
index 0000000000000..23ca8e6c0491f
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/parade,ps5169.yaml
[ ... ]
> +  parade,usb-tx-set-gain:
> +    type: boolean
> +    description:
> +      If this property is specified a gain of -0.9 dB will be applied on=
 the USB transmit channels.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:

[Severity: Medium]
Should this ports definition include unevaluatedProperties: false?

Without it, any unlisted extra properties are permitted by default.

This means the if-then block later in the schema will successfully define
port@2 for PS5170, but it won't prevent port@2 from being silently accepted
for the base PS5169 device that lacks an AUX switch.

> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Super Speed (SS) Output endpoint to the Type-C conn=
ector
[ ... ]
> +allOf:
> +  - $ref: usb-switch.yaml#
> +  - $ref: usb-switch-ports.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: parade,ps5170
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@2:
> +              $ref: /schemas/graph.yaml#/properties/port
> +              description:
> +                Sideband Use (SBU) AUX lines endpoint to the Type-C conn=
ector for the purpose of
> +                handling altmode muxing and orientation switching.
> +
> +additionalProperties: false

[Severity: Medium]
Does this need to be unevaluatedProperties: false instead of
additionalProperties: false?

In JSON schema, additionalProperties only considers the explicitly listed
local properties and ignores properties imported via $ref in allOf.

Because mode-switch (inherited from usb-switch.yaml) is omitted from the
local properties list, additionalProperties: false will reject it. This
might break validation for the PS5170 variant acting as an altmode switch.

> +
> +examples:
> +  - |
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-ps5169-bup=
-v1-0-c76a8ef3b239@proton.me?part=3D1

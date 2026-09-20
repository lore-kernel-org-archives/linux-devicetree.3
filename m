Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86624357D11
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 05:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880826; cv=none; b=k2J8CdnwQfSSbr2Btd6q1q/HgBvR6zhBU000nVhmunSTmX1bgstNrqC1vY0hY1brc1wHaFh6PJYK5N+NE2BRyoni+vB6S6LAcSNAImBAHiXDbXv8LsGp7UFhcPVOL4ll/F1z1PIs5uOSN3jtozCdRckZfN9ZsMZiSyCWJov8Ko0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880826; c=relaxed/simple;
	bh=QmsR5YOpCTja6j0s08Bf+fd+ty2eseqet4socRz5KYU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=erxHs7p5RlLLC7MRkkgw4VuPamFASrVCmfoDERRFtzKi4Q2MyLwvGFnfW003/0rk4rx9RIQhKMSmHSOEoRWs4E+tOJvyvNHYYF77p73GGzTSmacBM2g6icezoOattx0pMYBHYhiCTIE76tHUAGqgECr87/o+b5WYvhteFv1A6Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NH2ys+jD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NH2ys+jD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3401F000FF;
	Sun, 20 Sep 2026 05:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789880815;
	bh=MW2YujnqN6YjoV319UEwmftjy7c4DK1VyFFklk20jX8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NH2ys+jDtvB3wZE5QXEeFh+745w2NBsZCz8SzXQMd8prd4GJvlO6Mf5Cp671nWHoe
	 nbmf3fvyjekP4AlgxI64NkesGyJ00CYaY6rNaOfHs9bfirlQyS3Rr4ORcp1pq6OtHq
	 etxiGC3Ks/WDZkt+XFSUyd3rZgeUp0xc2j0NJ9/iQFj+2ymvjep3/+h16kEXDInnf4
	 2mXvodJ3fRQE6oiGJOW+Znay4wWYP0wMyYuTkdHM9BTD+IuB7YRJnywxsAH495ixXP
	 /rmR0sL7tUuKmqtvJ70QnAHpxhGdMPZmOh1clYvo42sXsXEnNsxQISsFKJCMVUI42R
	 wRwFHHO7xJHvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/28] dt-bindings: sound: Add Apple Macs sound
 peripherals
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260920-macaudio-v1-1-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-1-741cc20a74e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 05:06:53 +0000
Message-Id: <20260920050654.2A3401F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] dt-bindings: schema rejects tdm-slot properties due to additionalPr=
operties: false
- [Low] dt-bindings: missing additionalProperties constraint in cpu and cod=
ec nodes
--

commit 6dde9306ab23cf8705214300b5ab2897b3cef4f7
Author: Martin Povi=C5=A1er <povik+lin@cutebit.org>

dt-bindings: sound: Add Apple Macs sound peripherals

This commit adds a device tree binding for Apple Silicon Macs machine-level
integration of sound peripherals, starting with the M1 series.

> diff --git a/Documentation/devicetree/bindings/sound/apple,macaudio.yaml =
b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
> new file mode 100644
> index 0000000000000..bd844c9928c99
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
> @@ -0,0 +1,235 @@

[ ... ]

> +patternProperties:
> +  "^dai-link(@[0-9a-f]+)?$":
> +    description: |
> +      Node for each sound peripheral such as the speaker array, headphon=
es jack,
> +      or microphone.
> +    type: object
> +    $ref: tdm-slot.yaml#
> +
> +    additionalProperties: false

[Severity: Low]
Does this block valid properties from tdm-slot.yaml? additionalProperties: =
false
only evaluates properties explicitly defined in the local schema node. Since
the referenced properties from tdm-slot.yaml are not considered evaluated, =
they
will be incorrectly rejected. Should this be unevaluatedProperties: false
instead?

> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      link-name:
> +        description: |
> +          Name for the peripheral, expecting 'Speaker' or 'Speakers' if =
this is
> +          the speaker array.
> +        $ref: /schemas/types.yaml#/definitions/string
> +
> +      cpu:
> +        type: object
> +
> +        properties:
> +          sound-dai:

[Severity: Low]
Are we missing an additionalProperties: false constraint for the cpu object?
Without it, any extraneous invalid properties or typos like sound_dai will
silently pass schema validation.

> +            description: |
> +              DAI list with CPU-side I2S ports involved in this peripher=
al.
> +            minItems: 1
> +            maxItems: 2
> +
> +        required:
> +          - sound-dai
> +
> +      codec:
> +        type: object
> +
> +        properties:
> +          sound-dai:

[Severity: Low]
Similar to the cpu object above, does the codec object also need an
additionalProperties: false constraint to catch typos and invalid propertie=
s?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-macaudio-v=
1-0-741cc20a74e5@gmail.com?part=3D1

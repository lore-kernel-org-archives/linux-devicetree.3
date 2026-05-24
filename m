Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886393AA4EB
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 16:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779639432; cv=none; b=Ul8R/OUX3FmBO6mXPzDOijp9ZR+NBKBWziIIpR7SlfcSQGusjv09F7L7+8mJmYfvhkFdzdI/sh9pcBa2uOdp46hMsXQtUuPkk+Rb7oZ3+xf4D/7HI+V4jozzgf8MCIr+F3xBM5g5i57Tm2uUS/HMM8bT2LNMqmAAPkIshGaXcts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779639432; c=relaxed/simple;
	bh=jzBJfvcNJ5xroNkuEkq5tVmpV7AViS72zZZKbw5bKMk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WTJH/lsthjYmqvFoJeAbTeIplre7Nd+UtjSBweQ9/pAajC+igwxSTGNdXNyTmbPBMSWeTXdlwoIK382JHxj207edCSN8AXqa0GHQx1RicyNjUoeZzw5d8P55RphQP84Z5bS3ak3wyB5U5M/OJh9kor2rxvm+gewKGVrDeHOhgZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5EmBwHn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5EmBwHn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D867A1F000E9;
	Sun, 24 May 2026 16:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779639430;
	bh=0cHZDw6TLEhBmxXBLVOaTi6Jg5J9oppGxuL8xRtfpWY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V5EmBwHn7b87tGitCzmd4naw262nu4lYVg0vQ5cUWmPE2U5GOC2YRMY/YEI1Ad53K
	 PxMvUWUOlLFVf/Te/rky4Zf6QQt6xkbycRIyKVqx6RDqJgXV/2dHA1AtA9ZfehNEBu
	 G8flbA1SmBkH5yaAyTjIIdxHBPjHTgv6Hlz4DEIPP4BwESCja2+9GFemqcCJd7BXuY
	 BEJwj85udEQaTXVCeJY1wAGfNbc5vsmK1lJHsZyyg0zwYFB4SCnDVPZu0z2dMOerRj
	 cfHWxx38Q/Y+4DeuArOS7Kb69jNd/LKl2j7dL8dNK5yvznGMAwspPg+2S0Uv0hk8GG
	 R8KZdQaeY+/cA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: sound: asahi-kasei,ak5386: Convert
 DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manish Baing" <manishbaing2789@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260524160158.109983-1-manishbaing2789@gmail.com>
References: <20260524160158.109983-1-manishbaing2789@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 16:17:09 +0000
Message-Id: <20260524161709.D867A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The schema uses `additionalProperties: false` but omits a refere=
nce to `dai-common.yaml#` and the `#sound-dai-cells` property, which will c=
ause validation failures for valid audio configurations.
- [Medium] The new schema breaks backward compatibility by rejecting the le=
gacy `reset-gpio` property that was documented in the original text binding.
--

commit 53f12bd4c4466e68926d73a25cd532a103036343
Author: Manish Baing <manishbaing2789@gmail.com>

ASoC: dt-bindings: sound: asahi-kasei,ak5386: Convert DT schema

This commit converts the Asahi Kasei AK5386 ADC binding from the legacy
text format to the YAML schema format.

> diff --git a/Documentation/devicetree/bindings/sound/ak5386.txt b/Documen=
tation/devicetree/bindings/sound/ak5386.txt
> deleted file mode 100644
> --- a/Documentation/devicetree/bindings/sound/ak5386.txt
> +++ /dev/null
[ ... ]
> -Optional properties:
> -
> -  - reset-gpio : a GPIO spec for the reset/power down pin.
> -		 If specified, it will be deasserted at probe time.
[ ... ]
> diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak5386.y=
aml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak5386.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak5386.yaml
[ ... ]
> +properties:
> +  compatible:
> +    const: asahi-kasei,ak5386
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: A GPIO spec for the reset/power down pin.

[Severity: Medium]
Does this break backward compatibility with existing device trees?

The original text binding explicitly documented the reset pin as
reset-gpio (singular), and existing device trees may be using that
property.

Since the driver uses devm_gpiod_get_optional() which handles the legacy
-gpio suffix automatically, the driver still works, but the new schema
will reject it due to additionalProperties: false.

Should the legacy reset-gpio property be defined here, perhaps marked as
deprecated, to maintain DT ABI backwards compatibility?

> +
> +  va-supply:
> +    description: Power supply for the analog section.
> +
> +  vd-supply:
> +    description: Power supply for the digital section.
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false

[Severity: Medium]
Will this reject valid audio configurations?

The AK5386 functions as an audio codec and Digital Audio Interface (DAI)
provider. Standard ASoC generic sound cards require the codec node to have
the #sound-dai-cells property to resolve the codec phandle.

Because the schema enforces additionalProperties: false without defining
#sound-dai-cells or referencing dai-common.yaml#, it seems dtbs_check
will fail on valid device trees.

Should this include a reference to dai-common.yaml# and use
unevaluatedProperties: false instead?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524160158.1099=
83-1-manishbaing2789@gmail.com?part=3D1

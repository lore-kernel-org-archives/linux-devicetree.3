Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615A843CE42
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 06:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303445; cv=none; b=flJCfXUdWIivxSQyFGZurJVx1uoCC/5aCizumDc3UHSPyiZdjMjkgtrr69juXYUH/J8UL0C06CLR8pbxiSn5v22urIO0C2iXkCSW9pms4B7+aaNwpidum4MU/YPn81/9BwnvLvytPWxTN972h/+7hcDuvv69jJoYYbw3PDGM/f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303445; c=relaxed/simple;
	bh=oDrxnRvaMQ9fNuaIF2mnuJEWQAJtBTB+iO6pTcXEk/M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=FTWJfpexT0AY6fq0kERP0lBXnsgrcwW27CYpOJPWLA/RMA47UQFS8RK2tinots0t0KOOcMxvNnIekTWGvy003jH7mOz1R/q08u75kySH1WDP+wrKQiusefqIu2AxQLKiCIQrUId2fRwPnud/isfEnAATJx8MGRkS+st5ZQ2PKVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NtWmq4x6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NtWmq4x6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FBFE1F000C4;
	Sun, 18 Oct 2026 06:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792303442;
	bh=0pzURY3z1IbdLOwAL1nAXV67/bYnnShH/kyMOIC5bRw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NtWmq4x6x16Wgm6+j5WgFwjz8+GoQLbicQuBTQAifKpPaGI0qzdXgydwSwPOq3VLO
	 O9YIehlyMMjtiCrDA9Z/0tNwBTKwXUSVX/WJP9YBffspWutjkmwG0ENvpzV0/LrPrI
	 ETVzAr5Qhyo2JNhSwEeyxEjKo/aLYARetZuj4aIQR6G1k4fB6Hw7FxcZdC3u3pqMWi
	 hBHqr54ETZYNGCzmV+oGx2KNDjmIT7d/i44tBDT3ptR9S9zOG7zG1QbHyul6h/rMET
	 0wltvDFtlu5gA41vmP8R0gZAPzFdUDK9yESR71iMMsJWrLeBYLofCHCBrjzGIxtWn2
	 T/v8E2NUOIdvw==
Message-ID: <sashiko-outbox-175975@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/21] ASoC: dt-bindings: cs42l42: Document
 additional dai-common properties
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261018-macaudio-v3-2-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
 <20261018-macaudio-v3-2-abdff7741dea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 06:04:02 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] ASoC: dt-bindings: cs42l42: unconstrained #sound-dai-cells property
--

commit 41e0b44d1b55811c2f6af66b07ffb649188a35d3
Author: James Calligeros <jcalligeros99@gmail.com>

ASoC: dt-bindings: cs42l42: Document additional dai-common properties

This patch references dai-common.yaml# and documents #sound-dai-cells
and sound-name-prefix in the cirrus,cs42l42.yaml device tree binding.

> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml =
b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> index ab4c7d22dc0eb..aba2121ac64a7 100644
> --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
> @@ -9,6 +9,9 @@ title: Cirrus Logic CS42L42 audio CODEC
>  maintainers:
>    - patches@opensource.cirrus.com
> =20
> +allOf:
> +  - $ref: dai-common.yaml#
> +
>  description:
>    The CS42L42 is a low-power audio codec designed for portable applicati=
ons.
>    It provides a high-dynamic range, stereo DAC for audio playback and a =
mono
> @@ -26,6 +29,10 @@ properties:
>        The I2C address of the CS42L42.
>      maxItems: 1
> =20
> +  '#sound-dai-cells': true
> +
> +  sound-name-prefix: true
> +

[Severity: Low]
Should '#sound-dai-cells' be constrained to const: 0 here instead of true?

In Documentation/devicetree/bindings/sound/dai-common.yaml,
'#sound-dai-cells': true is a generic placeholder, and referencing codec
schemas normally constrain the cell count to match the hardware.

In sound/soc/codecs/cs42l42.c, cs42l42_common_probe() registers a single
DAI without a custom .of_xlate_dai_name callback:

    ret =3D devm_snd_soc_register_component(cs42l42->dev, component_drv, da=
i, 1);

Leaving '#sound-dai-cells' as true allows non-zero cell counts in device
tree nodes to pass schema validation while failing at runtime during
ASoC DAI phandle resolution.

Also, if additionalProperties: false at the bottom of
Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml is changed
to unevaluatedProperties: false when referencing dai-common.yaml# in
allOf, would that avoid needing to list sound-name-prefix: true here?

>    VP-supply:
>      description:
>        VP power supply.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018-macaudio-v=
3-0-abdff7741dea@gmail.com?part=3D2

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC91314A60
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 03:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781148536; cv=none; b=LtJBc4gNXw8V9Gsi9C9d3+kj9c2az1j1IvNjo4RN1S1pOXpggtWCSdYPYsLStW1LyqncO4bb+byiT+Mr9MCA3Fgx/jL2Gu69Mp+u0HAdlfTEjetw74hff2Twqr/yR29ZI8k31TBEv+OT396fKwv7UkNWY+Yncs5nKnKAq2M5ZP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781148536; c=relaxed/simple;
	bh=o2ozFnc+Gc/pnZk9OoiN8FZ1xx1GFz3faysvYepdETI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PIRx1/8SJqDLI0J3UqZA/mnss+c/Drcn68c3Vl3wLQfqwwxAAvX8JGVi7oTOghTaL+arTxwtn7JPyuwg2bUlAoE6rpEHPFkoahiPRUqBnmrXTCQ8VjBMNQpiGjfEWvhWVcDgMKeO2oh+dIP3aNoURkHVpJoXM/PpTNF/6vCECo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fs99/QEf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fs99/QEf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B111F00893;
	Thu, 11 Jun 2026 03:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781148535;
	bh=wymfZTBgOfweMlLzrqKijSjOUe0FCm5d5n6S+vT8QL0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fs99/QEfGjaWlJc0wld8RRGrKw5raN2/5LNfbx937SCSPmud3SnXPcuwUd4ooF5TG
	 NiyvqUVQ3X9AfSxPKErMWWTbhApJn6uwqe9CDNNtrQKeNjT5W4CY4ZoQihTyz/7Kko
	 HZ4Up2oOANSQkp+ig1iaedSXCXRp+KHrLIKqNoW9FfMzvNqqQBBf/R7IkC33VzVtph
	 AQf7pe0C3gkBaHZYDfc3uIPDnphHsuqHu3YWRhT+VNVSk2VPJH5UMyvrLMyntZ9eOw
	 euWTGVIoQzo09VjwKFaHokCWUL3pVhIHXJuD3h3H4GFlzHd8TCmrafRkfoBUSadabe
	 6cc425siegW+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/7] ASoC: dt-bindings: ES8389: Add members about HPF
 and clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260611031824.4628-2-zhangyi@everest-semi.com>
References: <20260611031824.4628-2-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 03:28:53 +0000
Message-Id: <20260611032854.41B111F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Adding Devicetree properties ('everest,hpfl', 'everest,hpfr') th=
at represent raw register values instead of physical hardware descriptions,=
 and statically configuring audio processing features that should be ALSA k=
controls.
- [Medium] Custom clock routing property 'everest,mclk-from-sclk' bypasses =
standard ASoC clock configuration APIs.
--

commit f53482d6ef6f3f66c8185a876c24dae03171cfd8
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: dt-bindings: ES8389: Add members about HPF and clock

Add members related to HPF and mclk_source. The value of HPF is not dB, it
is just the value of registers. And add HPF settings to the example.

> diff --git a/Documentation/devicetree/bindings/sound/everest,es8389.yaml =
b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
> index 75ce0bc489045..be92014c0c597 100644
> --- a/Documentation/devicetree/bindings/sound/everest,es8389.yaml
> +++ b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
> @@ -38,6 +38,27 @@ properties:
>      description:
>        Interface power supply.
> =20
> +  everest,mclk-from-sclk:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Indicates that SCLK is used as the internal clock.

[Severity: Medium]
Does this custom boolean flag bypass standard ASoC clock configuration APIs?

Statically configuring the codec to use SCLK as the internal clock via
devicetree limits machine driver flexibility. ASoC clock routing decisions
are normally handled dynamically by the machine driver using standard APIs
like snd_soc_dai_set_sysclk() and the standard devicetree clocks property.

A later commit in the series (ASoC: codecs: ES8389: Fix the issue about
mclk_src) addresses a type mismatch where the driver initially expected a u8
instead of a boolean, but the architectural bypass issue remains.

> +
> +  everest,hpfl:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description:
> +      the HPF value of ADCL.
> +    minimum: 0x00
> +    maximum: 0x0f
> +    default: 0x0a
> +
> +  everest,hpfr:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description:
> +      the HPF value of ADCR.
> +    minimum: 0x00
> +    maximum: 0x0f
> +    default: 0x0a

[Severity: Medium]
Should these properties be represented as ALSA kcontrols instead?

Devicetree is designed to describe hardware topology and physical
characteristics, not to pass raw register configurations. Audio processing
parameters like a High-Pass Filter (HPF) should be exposed to userspace as
ALSA kcontrols so they can be dynamically adjusted or bypassed.

In sound/soc/codecs/es8389.c:es8389_probe(), the driver reads these custom
raw register properties directly. Can we expose these as kcontrols instead?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611031824.4628=
-1-zhangyi@everest-semi.com?part=3D1

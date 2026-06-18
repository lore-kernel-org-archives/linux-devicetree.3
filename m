Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433133B3895
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781772241; cv=none; b=VajT1PfL7NNI2wotrJjRy7fJE0N/rdIQ2cMGWBRXmuebxYzQ98rjVhE2b3aVKxldBIeAVApmEq9LROLB2J21v2k6tQtvPXzFib+9Yw9Lywnh7V/9M1KIK8tjZmi/Xbf7NR9ohW5m+4DFjErTD805hqgjvtfZfFfINBVOWHCW8B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781772241; c=relaxed/simple;
	bh=Ol93fPRzg9FKpYNr+B/2p2u/x+/miPH8EbkA6sjBUiw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RLja2zL0aacAXbHLErqglsZRNJx052KfUlm+bNkW5REP8hBvUJT8yjQU1Vw3zlZZfZTZDAvNkSd71aEbQeXTnh42vDKsm0jO7mTyLivZ8ORFOrlhVhTqBSbueCeRdwD19MrVSUm4Hyo5uUwPNMWMgIly7cqzMWNV+tgZjTM1PD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MtLSaZuA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MtLSaZuA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58DC1F000E9;
	Thu, 18 Jun 2026 08:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781772239;
	bh=kgumC5PE5MFKFt32SyF0G1HXavcqoZX6uY3iQcH/v8A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MtLSaZuAEpoACwEDhN9SoABoKmHMpG3eQqZxAiL3cLmr8fm+uKT7RJJxxwq888qOH
	 Io2PkYaEMPBCmhUwjqcgXWbPsofgmZnQALyT9eHkZ1aoU28j6EEWuhNcMUX9BkD7dq
	 vm0v1RMKicH0jUlDDDaH2KA51nPT2PRYNdplx3sCJkdaf68sLLz/yumGlKPzHUxUkq
	 XQriqiOl9US0MXfiqu07+k1nhJRNovS9mfxWYdl4eTvfYpSQdoRHA2CPJG7Jytpvye
	 rKXDTjiw1Xx5n8WXTvojymNsNgqB7FZAoTL0/y37+yYJx5si1bYclM1esQinuWBdZu
	 1nczmRmkf6+wQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/7] ASoC: dt-bindings: ES8389: Add members about HPF
 and clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260618082842.2778-2-zhangyi@everest-semi.com>
References: <20260618082842.2778-1-zhangyi@everest-semi.com>
 <20260618082842.2778-2-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 08:43:59 +0000
Message-Id: <20260618084359.A58DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Property `everest,mclk-src` uses an unidiomatic `uint8` type to =
model a boolean flag, which is highly error-prone due to DT endianness.
- [Low] Property `everest,hpf-frq` lacks the standard `-hz` unit suffix and=
 uses an uncommon abbreviation.
--

commit 733db5a41798dd67759483d1a1aa543394f0ddf2
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: dt-bindings: ES8389: Add members about HPF and clock

Add members related to HPF and mclk_source

> diff --git a/Documentation/devicetree/bindings/sound/everest,es8389.yaml =
b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
> --- a/Documentation/devicetree/bindings/sound/everest,es8389.yaml
> +++ b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
> @@ -42,6 +42,21 @@ properties:
>      description:
>        Interface power supply.
> =20
> +  everest,mclk-src:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description:
> +      Indicates that SCLK is used as the internal clock.
> +    minimum: 0
> +    maximum: 0x01
> +    default: 0x00

[Severity: Medium]
Since this functions conceptually as a boolean toggle, should this be
defined as a standard boolean property instead of a uint8?

If a developer intuitively writes "everest,mclk-src =3D <1>;" in the Device
Tree, standard angle-bracket integer cells evaluate to 32-bit big-endian
integers (0x00 0x00 0x00 0x01).

When device_property_read_u8() reads this in the driver:
    ret =3D device_property_read_u8(component->dev, "everest,mclk-src", &es=
8389->mclk_src);

It will read the first byte (0x00) and silently misinterpret the flag as 0.
To correctly set the flag as a uint8, users would be forced to use the unwi=
eldy
syntax "/bits/ 8 <1>;". Using a boolean property (where presence indicates =
true)
would prevent this silent configuration failure.

Also, prior discussions upstream noted a bitmask mismatch (0x40) related to=
 this
property, but it was resolved in a subsequent patch in this series ("ASoC:
codecs: ES8389: Fix the issue about mclk_src").

> +
> +  everest,hpf-frq:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The frequency of HPF in Hz.
> +    maximum: 1020
> +    default: 16

[Severity: Low]
Does this property name need the standard "-hz" unit suffix?

According to Device Tree schema guidelines, properties representing frequen=
cies
should use the "-hz" suffix to be self-documenting (e.g., "everest,hpf-hz").
Additionally, "frq" is a non-standard abbreviation for frequency.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618082842.2778=
-1-zhangyi@everest-semi.com?part=3D1

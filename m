Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE8E3A7D73
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 14:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782656392; cv=none; b=HGWudKNWmKp6sNYiF8uCpF8ei489HvnYIxaKjVkqQHa2VBqLH3+TxYo6vo39C8562YQF9WCDxWMxlO2m3/mvdTgzHMoMjZ8M1YHlbxo0f2+vn2m1VYrz15GjBBBR2YtGIByaOwyDtuPZr/qSWonMWiysEcsBQHWkYK22rIOqJj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782656392; c=relaxed/simple;
	bh=BDDwk8Ti1bGtHTaHPLRX34rjtMYDxJfiAvLzh+dA4x4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UDY5X2a8W6a5ZfHUOH0AZqRJYLcmCkS8GnbwkAn8byvyBGHxWEs+5vvBhATXORK2SACzLFzbGfLnvbksD+KMjFOihbYZrHVXwnplpr3FFGf03nNjKr4pUgBLMPReLk/UPzMyj+0fYbuDZRAhuWCKtyum3/GOm+sf0q9/ceayLdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j4nzyUo3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j4nzyUo3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523B31F000E9;
	Sun, 28 Jun 2026 14:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782656391;
	bh=/65CzYlgfZ4TUYm8gsta2RD5rmRGklMtv5usskFm3y8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j4nzyUo3BkeT/q48S53MvSv/54K8Fz5BkoGRAFteAIphMhQiQaLNkjWKYRUQISeQE
	 aCZ4SwYb/AevFzl7LMvLeiSP/6WKtH6CwsVbh61AEg3UDSojwZ44A5IU0nuYuUO8IL
	 K3y5WLrqqk/gjpIKWtQMqfVZUb+RmWdGCAeMgl9HsRU5a1uZdDVoZTHQrdojvmIVK4
	 Fu6QAjGWigWR0zl1cyAqxR0jl5aatFapcD5P+4mdwUi3JULfj0fOAWLUs4mVD4c5lq
	 bFUP0nFWD5D/eE7/BG33O+te80wofj0Y95O2Bt5XQtuC3Ylne3rVxNJSdQ5aEx6OFw
	 8R7b+ymIXmr0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/12] dt-bindings: iio: dac: ad5696: rework on power
 supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260628-ad5686-new-features-v5-2-577caadbf7c0@analog.com>
References: <20260628-ad5686-new-features-v5-0-577caadbf7c0@analog.com>
 <20260628-ad5686-new-features-v5-2-577caadbf7c0@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 14:19:49 +0000
Message-Id: <20260628141950.523B31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Schema enforces `vref-supply` without allowing the deprecated `v=
cc-supply` as a fallback, breaking validation of valid older Device Trees.
--

commit d1ea0994f3199f8070f6ba7242d274388ad08f50
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

dt-bindings: iio: dac: ad5696: rework on power supplies

This commit adds vdd, vlogic, and vref supplies to the ad5696 binding,
deprecates the misleading vcc-supply in favor of vref-supply, and makes
the new supplies required.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml b/=
Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml
> index cc343cdf6085a..e10f8596f9d3f 100644
> --- a/Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5696.yaml
[ ... ]
> @@ -62,8 +75,21 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - vdd-supply
> +  - vlogic-supply

[Severity: Medium]
Does adding these directly to the global required list break dtbs_check for
existing Device Trees? Older device trees wouldn't have vdd-supply or
vlogic-supply defined, which would now fail validation.

> =20
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - adi,ad5693
> +              - adi,ad5694
> +              - adi,ad5696
> +    then:
> +      required:
> +        - vref-supply

[Severity: Medium]
Will this block reject valid legacy device trees that still use the now
deprecated vcc-supply?

When replacing a property, the schema typically needs to accept both the old
and new properties to maintain backward compatibility for existing trees,
for instance by using anyOf to allow either vref-supply or vcc-supply to
satisfy the requirement.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628-ad5686-new=
-features-v5-0-577caadbf7c0@analog.com?part=3D2

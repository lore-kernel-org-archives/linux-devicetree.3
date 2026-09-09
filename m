Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D8547A87C
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 08:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942751; cv=none; b=VM20oi+3aa4q+zrdCw8e9n16zq+viaflHkdxiKTHYJtR5RuWUcsSfycy0+fu7RpMJl6VPaZalCX2QB7CX2zpHCEHEOD1uajjGEYzqU8gEewWyfyvEOhlHjWdbxaZluHMPhdVw2gmeksR2iN2aDKuObx22u907+Z7giSzcuAtZ/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942751; c=relaxed/simple;
	bh=BEkvdLBQ9PlLzmg3fi7affGfzYDdHOc++Z9nqYIag4o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oqwH6j+v6AGggDKGRrwHgkFw6pv/czqh05Bu9gTR1k6zXCUI+/eGay/KZDNUPK2okNsQuWpFnRJpnM1YuGeyIZ9ZsQD3UF/gq+PT+Q0nXh2nm9ljoKUTng/Pa1/J9cojKmy22sJqglTZhJeeaSuaTU/jZ2jJBfui4tLx8ByYaC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKNb7qL6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKNb7qL6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D731F00AC4;
	Wed,  9 Sep 2026 08:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788942749;
	bh=afQJmY3cTMefXcUyVKS26kDkuXCepv7q2agRrLst9S4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KKNb7qL6ZwetUtlxXLIL3B7N/rZ3rtl7bleeDMH3rFE9VLyZSZzhUfnEtUy8w3TfU
	 WbooagrMVUQVgKXw+v4JE3AfL5BLDsPH+Vs1pwa/1H7H6BVUTNTg+IixWq0qoG4sko
	 6QXXu8LBOZw8WzowJ2u5+oddYM/S5l8HYpp3Og+pCRyBeTb4PKobPsMcifCGxBazl9
	 5Ud9hX9BDC8y/mi7x8IbqjQQdUeDHkggmUw9dgcJpiMlJYIt5By/Q/G6/oL2wEIILQ
	 D8/MwY8lBul6BFmkMu3Zzto2pSxfs61lln2jwtR7HNeNOkEIX1QibZiQ1vhn968LAj
	 04sa7/h1fq5Hg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: iio: adc: lltc,ltc2497: add LTC2499
 to title
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrei Stancovici" <andrei.stancovici@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260909082755.366269-2-andrei.stancovici@analog.com>
References: <20260909082755.366269-1-andrei.stancovici@analog.com>
 <20260909082755.366269-2-andrei.stancovici@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 08:32:28 +0000
Message-Id: <20260909083228.D7D731F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message claims to update the title to match the set o=
f documented devices, but it fails to include LTC2305.
--

commit ed7e1178510ad0fd945eab7467d3323be2dec391
Author: Andrei Stancovici <andrei.stancovici@analog.com>

dt-bindings: iio: adc: lltc,ltc2497: add LTC2499 to title

The LTC2499 is already listed in the compatible enum and covered by the
description, but was missing from the binding title. Add it so the title
matches the set of devices the schema documents. No schema or property
change is needed.

> diff --git a/Documentation/devicetree/bindings/iio/adc/lltc,ltc2497.yaml =
b/Documentation/devicetree/bindings/iio/adc/lltc,ltc2497.yaml
> index c884b6e037670..8aa1ba0a87284 100644
> --- a/Documentation/devicetree/bindings/iio/adc/lltc,ltc2497.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/lltc,ltc2497.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/iio/adc/lltc,ltc2497.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Linear Technology / Analog Devices LTC2497 and LTC2309 ADC
> +title: Linear Technology / Analog Devices LTC2497, LTC2499 and LTC2309 A=
DC

[Severity: Medium]
The commit message states that adding LTC2499 makes the title match the set
of devices the schema documents. However, is this update complete?

Looking at the compatible enum further down in the same file:

properties:
  compatible:
    enum:
      - lltc,ltc2305
      - lltc,ltc2309
      - lltc,ltc2497
      - lltc,ltc2499

LTC2305 is also documented by the schema but remains omitted from the title.
Should the title be updated to include LTC2305 as well to fully match the
commit message's stated goal?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909082755.3662=
69-1-andrei.stancovici@analog.com?part=3D1

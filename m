Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BD03C0A1E
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782225355; cv=none; b=nUPuR3xoXc3tYXhqter8Poaqn7un2GdZrd5rQn0xc7ouwmSBj8msvO3z4Dfl24fVG1nhpdUWkO+rMwUL1PqhBayYqLn0YR41CobV1HVuj30MmHY5ctDWBQbfAecku58WcdUbtg0hb0vCal3oFLG5y9GkqNe9fjSCRI6A21SkXFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782225355; c=relaxed/simple;
	bh=GwOipGY2HFOq5iv/WbezPYMlRKc+kahxFpV77uFHCpc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rjALIBrh6UuDuere2fYCbV6EmvNBhERIXfkLBvrprv3pWhZIjpYTymuIOe6rsUR6CJN3z0XAFYBrCR+LuFe+Uyw2Mp+SN5XsC3wBgw3jeSJg65so4KxyRsvt33pjl83N3pV1WUv0YzHxvkUuqmaAV8r+7h5Dw4XTf6RJZxwk3ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iy2dSJCz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iy2dSJCz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E0421F000E9;
	Tue, 23 Jun 2026 14:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782225352;
	bh=gX9ytgm0fqFRVjNJy55wRjIug+4ZWFTymeBZAE4ipiA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Iy2dSJCzGVvh8cuyNUu5F5/XwI7WQd92gLUyo56s9MtvtKbEDYdzWBGS+xHj4qxxl
	 0LVkwCmCXlPicMmxQk/F0rw34OLm5NCMUYQtboXaDZHDtA1wg+/2E3UN8WIkdRlyY+
	 g+9jO5ikjqeeBzT5Pc6H6IBnxZ9zTTaIYzpb+VykNet5rfTJ70+T41znuKYNu/FXYV
	 Qx4xciXhpIM/udWpB4bZyeIdsHcl9kVffnup55gANmHTjNOsN12zrNRLQ7t0sf2qIO
	 1UT1P9dzNXCDc9giD9bJJQvx0kLm4mmSuAA1ZVQD8ph7HUAuEWFIr5FqvcIDrzak8g
	 9odpFuhbQOxzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: serial: 8250: aspeed: add
 compatible string for ast2600
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?R3LDqWdvaXJlIExheWV0?= <gregoire.layet@9elements.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <80d983887dfdfc7e70a6db95f8cb95b7312f3044.1782224059.git.gregoire.layet@9elements.com>
References: <cover.1782224059.git.gregoire.layet@9elements.com>
 <80d983887dfdfc7e70a6db95f8cb95b7312f3044.1782224059.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 14:35:51 +0000
Message-Id: <20260623143552.2E0421F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly introduced compatible string `aspeed,ast2600-vuart` is mi=
ssing from the top-level `properties: compatible: oneOf:` allowed list. Whi=
le it was correctly added to the `allOf` conditional blocks, its absence fr=
om the main enumeration will cause device tree schema validation (`dt_bindi=
ng_check` and `dtbs_check`) to fail for any device tree node utilizing this=
 compatible string.
--

commit 6f7f111bc5bb5cca5a6591d60c1457c4bf00cb3e
Author: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>

dt-bindings: serial: 8250: aspeed: add compatible string for ast2600

The ast2600 was using the ast2500 vuart compatible string.
This change makes it possible to have ast2600-specific properties.

> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documen=
tation/devicetree/bindings/serial/8250.yaml
> index bb7b9c87a8072..3cbd0f532e151 100644
> --- a/Documentation/devicetree/bindings/serial/8250.yaml
> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> @@ -23,7 +23,9 @@ allOf:
>      then:
>        properties:
>          compatible:
> -          const: aspeed,ast2500-vuart
> +          anyOf:
> +            - const: aspeed,ast2500-vuart
> +            - const: aspeed,ast2600-vuart

[Severity: Low]
Does this compatible string also need to be added to the top-level properti=
es
enumeration?

While it is added here in the allOf conditional block, it appears to be mis=
sing
from the main allowed list, which currently looks like this:

properties:
  compatible:
    oneOf:
      - const: ns8250
      - const: ns16450
      - const: ns16550
      - const: ns16550a
      - const: ns16850
      - const: aspeed,ast2400-vuart
      - const: aspeed,ast2500-vuart

Will this omission cause a regression during device tree schema validation
for device trees using the new aspeed,ast2600-vuart compatible string?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782224059.gi=
t.gregoire.layet@9elements.com?part=3D1

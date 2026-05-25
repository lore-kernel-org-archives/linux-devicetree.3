Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D0837CD44
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707507; cv=none; b=NxUhDazIjQA+ljypwhyUuT3jV9WSLlcYB+wHsG+InB9/9Ef9L7DUIniEUPXCi7gPJF1Aou+dL3bE4w40eioTMT0SvE1gul3HJB0TcrGTvaoGdHu2okh4BNdj1ihsmWh7kdedk4X8WCiSCaa7a+RagX0XTJ0DHIa52cQ3IzCS/pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707507; c=relaxed/simple;
	bh=Z3ocrIMwkrgGFdFFC+JAvmq+iW+//f04us9N6o07upg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e1UB8zidvyO+fC2CGln4X8JgvbG84j0uA5m3Kg9Sk4ButJeCgP/sUMbEGHa9eqb8qPoetAb36bAqtOJwb8TGq4T9Wjm3iResGd68aEcD9lNemW89OrJ4+u1j27XdlGNFy76tbhyjIrSf0EYhBbeXVUzQJq+fVrBGKJMY1z1rKZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jaQrU/3r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jaQrU/3r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA7E71F000E9;
	Mon, 25 May 2026 11:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779707505;
	bh=6njTUs4tzpdXNQzaSiaWzdD0DeoLeJlIm5/GH6Xum0A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jaQrU/3r2fYABwlVdoizrPHKXD8AE+hn96dSNcDlRVMW8rlyzm3oW/NwtHx5dEKCm
	 516ttRBXynQ3YhDQf+JyCA40VxzdnivjRZpD6E2tKzTyTeG1ACn6nFbW9J9cR2RXki
	 hKmC5/0Z+EeCIX1FifE0hH8nKQX/3rgrB9wlhEAfRhyWuvDiXeb+N1OaF8lHUzEHL0
	 f48rCBVGlCVuKindEx2bERbzzJyNgNARN3kN4aBXYHSUl7xzHYkr9oU/9rxLPZny/Y
	 QQURDoSkVa400HDmJRo6DIpOUv8WP7ueOsTW6p06DEzEfEcYamC+y5sydxPzbsz7y3
	 QUTfj569Jphvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 04/11] dt-bindings: iio: adc: hx711: add HX710B
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Piyush Patle" <piyushpatle228@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525105127.180156-5-piyushpatle228@gmail.com>
References: <20260525105127.180156-5-piyushpatle228@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 11:11:44 +0000
Message-Id: <20260525111144.CA7E71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `dvdd-supply` property is utilized by the HX710B and mention=
ed in the commit message, but it is not enforced as a required property for=
 the new compatible or included in the example.
- [Low] The `if` condition for the `avia,hx710b` compatible incorrectly use=
s `const` instead of `contains: const`, causing schema validation to always=
 fail for HX710B nodes.
--

commit 006ef740da7a1ce47e48ea34371f93f0e9dd9a9a
Author: Piyush Patle <piyushpatle228@gmail.com>

dt-bindings: iio: adc: hx711: add HX710B support
   =20
Add the avia,hx710b compatible and document the HX710B-specific
DVDD and VREF supplies. Add constraints that forbid HX711-only
properties on HX710B nodes and require vref-supply for HX710B,
then add a separate HX710B example.

>     Add the avia,hx710b compatible and document the HX710B-specific
>     DVDD and VREF supplies.

[Severity: Medium]
The commit message mentions documenting the DVDD supply, and the binding
description notes the HX710B measures the DVDD-AVDD supply voltage differen=
ce.
However, dvdd-supply is not enforced as a required property for the new
compatible, nor is it included in the new example node.

Should dvdd-supply be added to the required properties and the example to
ensure complete schema constraints?

[ ... ]

> diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/=
Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> index 099235b5fd548..f0aeb15e9eb9e 100644
> --- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
[ ... ]
> @@ -62,6 +71,21 @@ properties:
>      maximum: 2500000
>      default: 400000
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: avia,hx710b

[Severity: Low]
Is this the correct way to match the compatible string? Since the compatible
property is evaluated as a string array, using a strict scalar comparison h=
ere
evaluates to false, causing the schema to always fall through to the else b=
lock.

Would it be better to use contains: const: avia,hx710b instead so that it
properly evaluates the array and enforces the constraints in the then block?

> +    then:
> +      properties:
> +        vsup-supply: false
> +        rate-gpios: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525105127.1801=
56-1-piyushpatle228@gmail.com?part=3D4

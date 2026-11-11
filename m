Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794388494;
	b=xDO31u2Kb/X0ifvNckuNy87Om9+d7d0CLhhiOnsLk49/8/Kio0bH6u1wqMpVCEwGdUr7
	 336wNTP9iTuY/J6IavPHXNlj3lovWxixBsIZL7REhKmVQFMDebEv9l9CrfsR1+HxhFUKR
	 i2f8KAploDUufV3L0zB6GE8pZgYnlbx7luxS9EP8uI3yQv7lzuSjQeQItrfIry2/G6UA+
	 qclEVbKy8rIMoTJDoff+U5CK7IJ1hav7mzXavDtViRRCsCuT8W4i6lscfzdQtSFdRXQpr
	 oMdTnwwR4Py5TFAf2VssnB04yjwrtZUh1sXewMvmqYAXlbzYQ2kwLTDN6yFz3MDknwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388494;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iFd4Nnjt2zQ2LmJ9Y2IUzZIp2XBVIDFFmfJCMjQtJ3M=;
	b=NdGcAUCxu9kamRyn8zuf95xuwNdivAr9IcmX1KnDRMy04NBWXZ1Zc3NEBpzOLtN9Y1Aj
	 e/DseIwudfck3vQGrUzqnecNKR0KuX4ypbO49FyYny/RvMPt8BSyjQKSwlL970B4koY5W
	 4MGQjwTycsqEhzW2xSz+SUZUW8rXhYsvIeYnPzsFdqlDL+JUBQUYnmWvZpDGsdhv2ZrEl
	 gF/7DB2HveeugVzMWIb0fGMpM4IEXy7CQB/aIOkUfjDprBmQJQWsfcU6PVy0goAOQPWrX
	 mYOYzBlpDe98+FRfG1dcJiZO7Eq2NiXzJuwhpEZC3yeNWy+RURGIJ9nNdfZIPLzDmow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tt9wDII+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B180606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 09:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tt9wDII+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B911F00A09;
	Wed, 11 Nov 2026 09:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794388493;
	bh=iFd4Nnjt2zQ2LmJ9Y2IUzZIp2XBVIDFFmfJCMjQtJ3M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tt9wDII+Xz6VSSklMo/xRVm8x2krTjPXrSPpKPZWSxppJLsEn5MngisxgPeV0F0nK
	 0m0JuHOjNCDNdltzzOaKlmoYO8VhgOq3Gsqos47/6eKangdTSgs+17ZFdT6aog3iQj
	 aAk2XciW5kKzSPDYSu69D72TkQhcdNMksRuQTXq7ZqBTTZiWSJUSf3qcp03uuvTjiP
	 fwoz7JZ5EFL9NpFJkEYTSmVMk7mMLTLxJDWoqu7Dt476S7tSjJiYHQy8s8EmCoswtN
	 8kZh6KOKcqYILVZo+Vjm/0X9FUiavTzxFWxU2+SrLqYs1dGOugMmM4pWvsZRSjcJNh
	 d9R87W2/4EheQ==
Message-ID: <sashiko-outbox-208675@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: example-schema: Show example of
 dependentRequired
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261111090449.53511-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261111090449.53511-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 09:14:53 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: example-schema: conflicting and duplicate
  dependentRequired example
--

commit a3f4513191420436a3b3975020d020b961833f59
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: example-schema: Show example of dependentRequired

This commit adds a dependentRequired example to example-schema.yaml to
document the preferred way to express conditional property requirements.

> diff --git a/Documentation/devicetree/bindings/example-schema.yaml b/Docu=
mentation/devicetree/bindings/example-schema.yaml
> index b04f3cc4312c0..0c78eda67a2e6 100644
> --- a/Documentation/devicetree/bindings/example-schema.yaml
> +++ b/Documentation/devicetree/bindings/example-schema.yaml
> @@ -217,6 +217,14 @@ required:
>    - interrupts
>    - interrupt-controller
> =20
> +# Properties might be required only if some other property is present.
> +# dependentRequired is a shorter and preferred way to express this, inst=
ead of
> +# if:then: block.
> +dependentRequired:
> +  # foo-gpios is not a required property, but if present, then foo-suppl=
y must
> +  # be provided as well.
> +  foo-gpios: [ foo-supply ]

[Severity: Low]
Does requiring foo-supply when foo-gpios is present conflict with the allOf
conditional block right below?

Documentation/devicetree/bindings/example-schema.yaml:allOf:
    then:
      required:
        - foo-supply
    else:
      # If otherwise the property is not allowed:
      properties:
        foo-supply: false

That block already makes foo-supply unconditionally required on
vendor,soc2-ip and forbids foo-supply on all other compatibles, which makes
it impossible to specify foo-gpios on any compatible other than
vendor,soc2-ip.

Also, should this replace the existing dependencies block just above
required (and the comment in allOf referring to dependencies) rather than
leaving two top-level keywords in the example schema that demonstrate the
same construct?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111090449.5351=
1-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1

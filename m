Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0893E51F8
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 10:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000569; cv=none; b=VZ8oQ7QoEyRE7fieqzF9fAVpJ6sxgmxuWurg8lwh089P7NLtAtP3hiyI7w3eyGTGh0Ii69v24WYfaEgXZOPk+9MSe8ivmc8EwjZ8J0yC/++C1UmETNhsDRsDVmb8Y7AHcGAaP03P3xwm0u9Dx3u4IghU054qzwqIkMjvKH5qpb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000569; c=relaxed/simple;
	bh=id9r5Jmxof2HEDvlJCuPp1mTrxogNb1SCF9ggZQWsds=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Bzhk3m4DpsutS5jYUu96k75+afJYQvCMUSgSoSXM+SYnndFcNNFjQslLLZL38PQcjwJw4o1otZUJU3QYHvJ9wo0/4JTNqW2eQMlRg/aee+j6qT5VpwYWI0GxD8NfXicZdMSOG4qdicdkuED0/vWk7S6jKe75lejtaUHodtsGoek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OPQxbHpf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OPQxbHpf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3384A1F00893;
	Tue,  9 Jun 2026 10:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781000568;
	bh=Gi1XRGaVFM0dKN+tST+KW/8Fq9LX6sbHFluE1vctm4I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OPQxbHpfGvLsImUR6wR8M0tL8mCt6cxsv1FnibOAwg68A9kDRSeHqCDEOXMjF70Ds
	 VTjx6stG/fasNcPyGY5JSqSDTeXIk/EokcxbK+PPp4P7dZkOCXpz9yyGggUhbOE2ms
	 89YvurqPe3IH8zy4odnhAi1NkNbeneTNjgR5aoqoHsmE8I1LmFFZTIfLOfEW+aJcpK
	 L1oA4lIUrgGQ0E3rMjGkKVNi2ItoC2OwUe724YTWfNRgo8Yw/9yd2j/RuuHZYQFwMU
	 If3CecHmmiGuJXkJSq/+ajyxTPs1+i2SVPWikydmwO2m1mcSrSRMFouKFDKskfMY9n
	 HUWmS926epCsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/12] dt-bindings: iio: dac: ad5686: rework on power
 supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260609-ad5686-new-features-v2-4-70b423f5c76d@analog.com>
References: <20260609-ad5686-new-features-v2-4-70b423f5c76d@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 10:22:47 +0000
Message-Id: <20260609102248.3384A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Device Tree binding ABI breakage due to newly required propert=
ies without fallback.
--

commit b368aecb172cba4ed369348bc821f626012fd870
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

dt-bindings: iio: dac: ad5686: rework on power supplies

This commit adds supplies for VDD, VLOGIC and VREF input voltage pins,
deprecates vcc-supply in favor of vref-supply, and updates the required
properties.

> diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5686.yaml b/=
Documentation/devicetree/bindings/iio/dac/adi,ad5686.yaml
> index 4680d4753dd4d..2abdbf325392d 100644
> --- a/Documentation/devicetree/bindings/iio/dac/adi,ad5686.yaml
> +++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5686.yaml
[ ... ]
> @@ -53,9 +64,23 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - vdd-supply
> +  - vlogic-supply

[Severity: Critical]
Does unconditionally adding vdd-supply and vlogic-supply to the global
required list break backward compatibility? Old device trees that did not
specify these supplies will now fail schema validation.

> =20
>  allOf:
>    - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            anyOf:
> +              - const: adi,ad5676
> +              - const: adi,ad5683
> +              - const: adi,ad5684
> +              - const: adi,ad5686
> +    then:
> +      required:
> +        - vref-supply

[Severity: Critical]
Does strictly mandating vref-supply break validation for older device trees
that used the now-deprecated vcc-supply?

While the driver is updated later in the series to gracefully handle missing
supplies and check both vcc and vref, the binding schema itself incorrectly
rejects existing valid DTs.

Should the schema use an anyOf block to permit either vcc-supply or
vref-supply for backward compatibility, and avoid making new supply
properties strictly required if they weren't in the original schema?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-ad5686-new=
-features-v2-0-70b423f5c76d@analog.com?part=3D4

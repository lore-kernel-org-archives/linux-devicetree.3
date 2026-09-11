Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390AD37A85A
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142527; cv=none; b=iM2wW01LVeAM0wns/7J5kgALkiiseco8lBLV83O0QyxGYWh8Dh9HIpfCb/jHutjxuMG2eDocIHiQtfO3uABxfDIgPIAVo5ZGV+NTlC+szH1/aJoVkFHqxzllD1GWSE17l+rr0/aQVEJXfriYIbHypyCXCJgFTNvQHpabjHCll9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142527; c=relaxed/simple;
	bh=5tvMb69+YUnsH6ia+zBzcMwFjddeGu6saBjWHpLwBwc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uX2OyWTuvUUjC8/bGvMPHBzsTHEUrckbUoz+FeStfX5pX7mhDmH27Nvm6h8ro7ttbxbb3yFO4nXXw5MYusZs0fVQA5ChZ78hGtpSN3wy4g96HNZ//1Q7YJmExumn9JuN0mefv0+zdkvKmTZkKIiw32OiaB4gvb8ysDvzYMsbI7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bPhWpUUL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bPhWpUUL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68DB1F000FF;
	Fri, 11 Sep 2026 16:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789142525;
	bh=mRdbdD1m5ZH79nafYZTh7fUdv9RDGkKQYKYCIBabV0c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bPhWpUULlqSkC8dms4WljL6BaX9B9qn/vvLScks5OSQxmSTHLlH4ce7/h3NA0NeKH
	 BJz+FwtVhZyL/KernfmQTMi6BF7kzdGpQNRdcS+MbGPUxf1JOkIvKHyDVU+CAL7SvF
	 MGVCAuSRi8FeIxIMzZ6UHxDz1afUcExvsIU0VfmYX5ze2axqgGVgXOiphBCVAynpLl
	 kHtvNjv4pu34III7BjGblrFoIxwskQDyXgcyxy50Fw5bUyCzVV7u18vFQ7tNqBO1ce
	 zhcktKJ8PGfsOjBOMqyfI3zwkqjGt5XguMxX9owaWBhhDBGV6dzZp/w8JiwCgyaEmW
	 iEeWCHq/YDNsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: iio: adc: stm32-adc: add support for
 stm32mp23 and stm32mp25
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260911-adc-stm32mp25-v1-v1-1-cef26eecdef2@foss.st.com>
References: <20260911-adc-stm32mp25-v1-v1-0-cef26eecdef2@foss.st.com>
 <20260911-adc-stm32mp25-v1-v1-1-cef26eecdef2@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 16:02:05 +0000
Message-Id: <20260911160205.A68DB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Low] Documentation for the deprecated `st,adc-channels` property explici=
tly lists `stm32mp23` and `stm32mp25` as supporting up to 20 channels, but =
the property is explicitly forbidden in the schema for these compatibles.
- [Low] The `st,adc-trigger-sel` property specifies `default: 0` but is als=
o strictly required for the `stm32mp23` and `stm32mp25` variants.
- [Low] The schema attempts to restrict channel 19 using `channel@19: false=
`, which fails to prevent the usage of channel 19 in `reg` or `diff-channel=
s` within other channel nodes.
--

commit 928337c3337781d9cd13fb9cf442caeafdde7db6
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

dt-bindings: iio: adc: stm32-adc: add support for stm32mp23 and stm32mp25

Add stm32mp23 and stm32mp25 compatibles. Three ADCs can be found on
these SoCs, split into two blocks:
- ADC12 are tightly coupled (common registers).
- ADC3 is managed independently.
Each ADC is a 12-bits successive approximation analog-to-digital converter,
with up to 20 multiplexed channels that can be configured as single ended
or differential.

> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml =
b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> index c4c4575d3fa96..0e0ceaa3d8d6f 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
[ ... ]
> @@ -294,8 +338,8 @@ patternProperties:
>            List of single-ended channels muxed for this ADC. It can have =
up to:
>              - 16 channels, numbered from 0 to 15 (for in0..in15) on stm3=
2f4
>              - 19 channels, numbered from 0 to 18 (for in0..in18) on stm3=
2mp13.
> -            - 20 channels, numbered from 0 to 19 (for in0..in19) on stm3=
2h7 and
> -              stm32mp1.
> +            - 20 channels, numbered from 0 to 19 (for in0..in19) on stm3=
2h7,
> +              stm32mp1, stm32mp23 and stm32mp25.
>          $ref: /schemas/types.yaml#/definitions/uint32-array
>          deprecated: true

[Severity: Low]
The description explicitly adds stm32mp23 and stm32mp25 to the list of SoCs
supporting this deprecated property, but the if-then block below enforces
st,adc-channels: false for these variants. Does the documentation need to be
updated to clarify this property is not supported on these new SoCs?

[ ... ]
> @@ -344,6 +388,12 @@ patternProperties:
>          items:
>            - const: vrefint
> =20
> +      st,adc-trigger-sel:
> +        description: Selects the HW trigger configuration available on t=
his ADC
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1]
> +        default: 0
> +

[Severity: Low]
Does declaring a default value here make sense since this property is
strictly required by the schema block below? A required property must be
explicitly present in the device tree for validation to pass, which renders
this default declaration useless.

[ ... ]
> @@ -486,6 +536,38 @@ patternProperties:
>                maxItems: 19
>                items:
>                  minimum: 40
> +
> +      - if:
> +          properties:
> +            compatible:
> +              contains:
> +                enum:
> +                  - st,stm32mp23-adc
> +                  - st,stm32mp25-adc
> +
> +        then:
> +          properties:
> +            reg:
> +              enum:
> +                - 0x0
> +                - 0x100
> +
> +            interrupts:
> +              minimum: 0
> +              maximum: 1
> +
> +            assigned-resolution-bits:
> +              enum: [6, 8, 10, 12]
> +              default: 12
> +
> +            channel@19: false

[Severity: Low]
The commit message mentions restricting the last channel (19) as it is wired
directly to ADC Vref+. However, setting channel@19: false only prevents a
node explicitly named channel@19. Could a user still bypass this restriction
by using diff-channels =3D <X 19>; or reg =3D <19> inside another channel n=
ode
name?

> +            st,adc-channels: false
> +            st,adc-diff-channels: false
> +            st,min-sample-time-nsecs: false
> +
> +          required:
> +            - st,adc-trigger-sel

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-adc-stm32m=
p25-v1-v1-0-cef26eecdef2@foss.st.com?part=3D1

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825957;
	b=tBB/x7088sUcX32+jHyuhHwpD7uORicX4sNHP+lQ4JSZzNCu1uXmunnmaZ3PC2HZyzxp
	 GN9lK4t/lQwwTvr/WT5SFePYV2+NnFroLVBCO7outORetkswxNP/ZOgtvXZw1RLhtLiw5
	 4wct2jttbQng3HksrS8QmPSPwrulqS1YXwmvXed/Oid1ifl15cnJLPEyddPj1H8V3OUrl
	 GSY00dth244uH7Hkt8+mEtmoX8WDhXh6NaYl25Qvj2D9rHR6YXdJWLGqQuCYQU8NPhMIc
	 3VaW7pY9AKV+WMp9FTiznLfkrvff3uQR1+5v3vKoI+9NCFc7zKDUt/sz+ghj3lZuGAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825957;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GppNYjuMGLvGXPN3/RYh65TqC4RU+LDI0TC17oHb5To=;
	b=NaXr5UEdzymIFGOdicX6zJf8/9Mu9ij49TBzf5vdp+0TAQ3EoHh3+/iDYXfMlmkOLAh/
	 Byd5LNTeK2sQq+RhaFzqJX/fOBKD9s+QBQhTDoy15FVbsCDq8hKw+TErYZdNk3B1/qFW/
	 KTbyue+qoFFEXJNrVas33C9KPZTNc9KzHzMJLMBijJfgbUGea7WIFuzLjWv3FO3LZLOSG
	 noxKAJsuavP2Sx5b0/ErDNgdYlgbwC9QUm/mbNON2U+Po+JN+CABvQxxheskzEGJSS2N0
	 N8K85LleXIoKu8pVwPHMNT8GJcf5HO34axI095PrhO2GRKqzpa4P724DNRAkfCGh4dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UkO3IZ4q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224D9606D15A
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 20:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UkO3IZ4q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757F21F000C1;
	Wed,  4 Nov 2026 20:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793825956;
	bh=GppNYjuMGLvGXPN3/RYh65TqC4RU+LDI0TC17oHb5To=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UkO3IZ4q79j1KDVnu1/lyZXQWoAM2UoEijety7AQZrW2zM7PIltc/eU6P4NKnN0UX
	 +N9TCXMphyixV4ZWAjx+vbG1qZVC6OvlhYJlVNp1HnsKf40DjbRhLWJxYCYmwVWzco
	 hjXVxVQ08NJHnrOjqV60fI0kdBGPGadZnVlArgnpzLqrN0eO92uLQ45gBL1WNF0fAj
	 W3GV9sd5LDV9zSpXeEnzJbXSkRUpMQ18Q6++Tstj9J2Hf0UYucLPEbVgBViW/5d9Tp
	 Ca1DwXKPXwUDXwiB62X7/bk5jkC83n/wJ6GIfJWKly/eNvupAbULbwF+D6VMULRb/5
	 9MqwjHvPqLeqQ==
Message-ID: <sashiko-outbox-198033@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: i2c: qcom-cci: Document SM8150
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Gigena" <mail@andrewgigena.dev>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261104-sm8150-v7-4-rc1-camss-v1-1-7a9534a9a22f@andrewgigena.dev>
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-1-7a9534a9a22f@andrewgigena.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 20:59:16 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: i2c: qcom-cci: missing allOf clock constraints for sm8=
150
--

commit aefd954e17156282727d64e6f6e3ba7607d36440
Author: Andrew Gigena <mail@andrewgigena.dev>

dt-bindings: i2c: qcom-cci: Document SM8150 compatible

This commit adds qcom,sm8150-cci to the list of CCI v2 compatible strings
with qcom,msm8996-cci as a fallback.

> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0ec..b545fd2378dae 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -39,6 +39,7 @@ properties:
>                - qcom,shikra-cci
>                - qcom,sm6150-cci
>                - qcom,sm6350-cci
> +              - qcom,sm8150-cci

[Severity: Low]
Should qcom,sm8150-cci also be added to the 5-clock conditional under allOf
in Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml?

At the top level, clocks and clock-names only specify minItems: 2 and
maxItems: 6 without listing the allowed clock-names items. The
qcom,msm8996-cci rule under allOf uses const: qcom,msm8996-cci rather than
contains, so it only matches when qcom,msm8996-cci is used alone and does
not apply when paired with qcom,sm8150-cci.

Without adding qcom,sm8150-cci to the allOf conditional block alongside
qcom,sc7280-cci, qcom,sm8250-cci, and qcom,sm8450-cci:

  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,sc7280-cci
              - qcom,sm8250-cci
              - qcom,sm8450-cci
    then:
      properties:
        clocks:
          minItems: 5
          maxItems: 5
        clock-names:
          items:
            - const: camnoc_axi
            - const: slow_ahb_src
            - const: cpas_ahb
            - const: cci
            - const: cci_src

dtbs_check will not constrain the clock count or clock-names list for
qcom,sm8150-cci nodes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-sm8150-v7-=
4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev?part=3D1

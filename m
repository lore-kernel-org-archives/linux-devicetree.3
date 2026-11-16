Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813735;
	b=xJ6kluaXfZd3+yRM3MgwC5YjY8sHJxxeXs76vykiy8BbYH6LNWuU3cqdv3yQQOotB8Zr
	 NyuOWNDzqRHv8wGfEyQtYjXr4RXjxXblO9s/rDgauATWCbh+cBGK2dq3zUFmOP+G3JpAj
	 atKaIG378IIIHUTeMLDvJZ3kvS4U1nLylXgKaBU8WXjLeD35rLlNv3joOWceytXUsSI72
	 D4imbQLDYR7NqO809BWeSq6tSMHCH8Vfajg7cDlxxNXqMy0qCoiecwpTdvK6Ldr4+cRag
	 973egXzxX7EpfBEHoQ7wTh3WKtHqnVUZrc3hz2O11hr4/CwI9mJ5I1PHFPiVpErTjeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813735;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YnsYeCfgaO6EuP0JlYCStruLhUqi1QlIM5TD3uEJgVo=;
	b=g57k4rDzsVew1x+HrTlznd5U67NXSppieNfd+5RfOvIziCWeOFnBdq0/AO+5WdsP34je
	 1BMQMeUnsewfEjJtdT1g73/9wxwQWa7jnHduxYx/71QWdX1wEh8cve49+7aNdxVX8OU5g
	 7qIk9XvZc+YhNoSny8SnKMtJ4ubfrDS+Elgy0BhAzcO4wXPSiQABqCNv+pETg9vfaV8ka
	 kMx5KeJdZURoq777pSlwQWvw8eZVvM0BjG3AcVxoxXj0X7oQ5x1cVXs8c76ceR1pNy6Oz
	 9wDGwsJO5u9HFbRCBhJlAwGrZluTLp9SsoAXBbjD6+YrrHXXhsRxOmusAoNCi1CjyRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jBOSL3l1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C9F606A31C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jBOSL3l1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000EF1F000C4;
	Mon, 16 Nov 2026 07:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794813735;
	bh=YnsYeCfgaO6EuP0JlYCStruLhUqi1QlIM5TD3uEJgVo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jBOSL3l1r2/zIoU2H+Z78xOKgrrvNyTAst7qsGmBr3UdrsqGqWhmyi9Ukmj09D7mi
	 9PaAAkYv5ZM09Qa5A02f8TDIFm5+5YO3AIwsV/dM5Q9ZjQx4AiRcPcu4GZfBprznb/
	 H31es+PM0ROU/LYgJo/NbxFNEFBjXESkP8pcCvuHVK6mKcgrO8D7WayQzMctpSLdSk
	 aKBYn1fswPChybcpv6kWiXqEYhyOO0N6oLNImm62v9LZRE2NIElNJMHfF0eUWnCIpe
	 xhQpCe4Ys9qSR1FI6LIY7YTwkcD+qR8vz0KZmmt9MmtAPVgwQbAJOW7hZ052VguOrg
	 WCV1Bv92T6GLw==
Message-ID: <sashiko-outbox-216406@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: pwm: qcom: add Shikra PWM controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-pwm_qcom_shikra-v1-1-67ee4553adc5@oss.qualcomm.com>
References: <20261116-pwm_qcom_shikra-v1-0-67ee4553adc5@oss.qualcomm.com>
 <20261116-pwm_qcom_shikra-v1-1-67ee4553adc5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 07:22:14 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] dt-bindings: pwm: qcom: ranges property out of canonical order
- [Low] dt-bindings: pwm: qcom: unused pwm node label in binding example
--

commit e6638c1381c339afe2578e824d79ad21eb5519c9
Author: Taniya Das <taniya.das@oss.qualcomm.com>

dt-bindings: pwm: qcom: add Shikra PWM controller

This commit adds the Device Tree binding schema for the Qualcomm Shikra
PWM controller and its per-frame channel child nodes.

> diff --git a/Documentation/devicetree/bindings/pwm/qcom,shikra-pwm.yaml b=
/Documentation/devicetree/bindings/pwm/qcom,shikra-pwm.yaml
> new file mode 100644
> index 0000000000000..d7f2bdab68f68
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/qcom,shikra-pwm.yaml

[ ... ]

> +properties:
> +  compatible:
> +    const: qcom,shikra-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: AHB bus clock for the PWM block.
> +      - description: Gate clock shared by every frame (pwm_core).
> +
> +  clock-names:
> +    items:
> +      - const: ahb
> +      - const: core
> +
> +  "#pwm-cells":
> +    const: 3
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#pwm-cells"
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,shikra-gcc.h>
> +
> +    / {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        pwm: pwm@4700000 {

[Severity: Low]
Should the unused pwm label on pwm@4700000 be dropped?  Because &pwm is
never referenced in the example, scripts/dtc/dt-check-style --mode=3Dstrict
reports an [unused-labels] warning.

> +            compatible =3D "qcom,shikra-pwm";
> +            reg =3D <0x0 0x04700000 0x0 0x10>;
> +            clocks =3D <&gcc GCC_PDM_AHB_CLK>, <&gcc GCC_PWM0_XO512_CLK>;
> +            clock-names =3D "ahb", "core";
> +            assigned-clocks =3D <&gcc GCC_PWM0_XO512_CLK>;
> +            assigned-clock-rates =3D <9600000>;
> +            #pwm-cells =3D <3>;
> +            #address-cells =3D <2>;
> +            #size-cells =3D <2>;
> +            ranges;

[Severity: Low]
Should ranges be placed immediately after reg in the pwm@4700000 example
node, properties, and required?  Putting ranges after #size-cells
deviates from the canonical DT property ordering and causes
scripts/dtc/dt-check-style --mode=3Dstrict to report a [property-order]
warning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-pwm_qcom_s=
hikra-v1-0-67ee4553adc5@oss.qualcomm.com?part=3D1

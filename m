Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5653D76
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 02:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780020071; cv=none; b=Xf2nS5U/hZoD+wwsctzWaPvrNS2vkj9fAjhOaVp3Nk/+hy07Jy8qrhiyzjYA2MUKtaFkXgI8qkU4dNi+VyOug/heKJDDIZ77pMWk24p0K4irFiyuT2hL0G7WdSHPDB8jMnXdoutbqDUyvX53eHjO5P2V9vYbkg9LcGQYVZ47po8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780020071; c=relaxed/simple;
	bh=hzUavgTsKsrv+aneszJBVCA/EfkrxVq5H9F2IMYWaWM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JaxsxIiPPjnSRDUqpWPIag8z+WvJomDs9TJxw6tMqowJ2YS+Z7eLdgnKodPrbC/71v4VqL8mT+JieFLpUhhRbeooA4aTjMVaVL9I3GaTPQkLUeRqrHK5S9chJaOEkObvRUvzIHAuwMuQD3r2j0xu+QJ0jsLOVVgvsKy0znIuiyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0uuzmE+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0uuzmE+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3AED1F000E9;
	Fri, 29 May 2026 02:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780020070;
	bh=v9A+3+qtQS8f2g10VCdbGVf2L0OfJyA6Yi93mHgXgWE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U0uuzmE+y8Mr1CWwcND4SV9OEMvnT9m4cc5FVwwGcKXkQ/fSDUVSPNXzNkheU7r94
	 +sSYOs1ERKe7PXOVVC9KxU9eBQtsS7BLMp3dCbUpjP/a8WdCt4OPRa2iG63QBlDfUc
	 iXRc97qtynnbTDxePJ1WCCBEyAE+oSvetAWfSiFoSfcTN+clpmjdKPPDj7Z1Ca9EBa
	 EkgsquHRbCcpu7GMlEHdrffwWtDx6BYBCKACwSBce/JBoV2ahAl8UuGad0HQGKp6UR
	 QGlpiL7fTOYIFeatuzM6kKXvFc5PPcGZTzY6+H3uJXq0tdX1Fi5caJ/pqiQ+MnwL0a
	 aax5fsVCf3naA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: pinctrl: qcom,pmic-gpio: Add
 level-shifter function
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fenglin Wu" <fenglin.wu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260528-pinctrl-level-shifter-v2-2-3a6a025392bf@oss.qualcomm.com>
References: <20260528-pinctrl-level-shifter-v2-2-3a6a025392bf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 02:01:09 +0000
Message-Id: <20260529020109.F3AED1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `qcom,rpmh` and `qcom,pmic-id` properties are globally permi=
tted for all PMIC compatibles instead of being restricted to variants that =
support level-shifters.
--

commit 146a2c85c7b535972af82ea257bf85404fa5bec0
Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

dt-bindings: pinctrl: qcom,pmic-gpio: Add level-shifter function

This commit adds a new level-shifter function to the pmic-gpio binding.
It introduces qcom,rpmh and qcom,pmic-id properties for the pmh0101 variant
to enable communication with the RPMh firmware, along with a custom pinconf
parameter.

> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yam=
l b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> @@ -119,6 +119,21 @@ properties:
>        The first cell will be used to define gpio number and the
>        second denotes the flags for this gpio
> =20
> +  qcom,rpmh:
> +    description:
> +      Phandle to the RPMh controller device. Required for PMICs when the
> +      bidirectional level shifters is used (e.g., pmh0101), to enable
> +      communication with RPMh firmware for level shifter control.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  qcom,pmic-id:
> +    description:
> +      The ID of the PMIC which supports bidirectional level shifter func=
tion.
> +      It is used as the RPMh resource name suffix to request control of =
the
> +      level shifter to the RPMh firmware.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    pattern: "^[A-N]_E[0-3]+$"

[ ... ]

> @@ -330,6 +345,22 @@ allOf:
>            contains:
>              enum:
>                - qcom,pmh0101-gpio
> +    then:
> +      properties:
> +        gpio-line-names:
> +          minItems: 18
> +          maxItems: 18
> +        gpio-reserved-ranges:
> +          minItems: 1
> +          maxItems: 9
> +        qcom,rpmh: true
> +        qcom,pmic-id: true

[Severity: Medium]
Does this schema actually restrict qcom,rpmh and qcom,pmic-id to the pmh0101
variant as intended?

Because these properties are defined in the top-level properties block, they
are globally permitted for all PMIC compatibles. Setting them to true in th=
is
then block is a no-op in JSON schema, as affirming a property is allowed
does not forbid it from appearing in unmatched conditionals.

Should the schema explicitly forbid these properties for unsupported varian=
ts
so they are not implicitly valid on all PMICs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528-pinctrl-le=
vel-shifter-v2-0-3a6a025392bf@oss.qualcomm.com?part=3D2

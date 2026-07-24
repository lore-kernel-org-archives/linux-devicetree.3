Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C674483A2
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917688; cv=none; b=tSZ2pfXux3Lj5zHNbSC/6sX9xa1/UQycc0X6ixCdPUVpyJ7CX0LzPkIVWTyfikPZZyvgdwvyEkvFzn/0sAEiZDbSlk5mPvBrIhpeXpC7tP0fj4xxo2OgAHO9ss1tbD2bdXYKoolcWNf8RixHM3LUd+TqAIqeG8h02m8u/Fkuuyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917688; c=relaxed/simple;
	bh=a6zi2knFaUmr4WLL5uL4yN+IxJqfcwsukCZNN0jQD/Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=twsTEEo7B0TGBLV+Np4+M9+x67xBI/CAVViWCtD1EGAub/ABIuIyhUDPnen+XZGY8VUyweHem+WUUM+m4vHvv3mtKg+lM4LNvTDLKUnrrv9GgeebskU4S2mrcwnfmYTddrPkP5nnWHStMmwVDQC4aBQCS5ErTKK+xH+W+CppEOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DpqZd3BD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DpqZd3BD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B24C1F000E9;
	Fri, 24 Jul 2026 18:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784917687;
	bh=fdQwAsXHFdYta7x8NX/UgfYqANKPW0nDRxzqDha3Psg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DpqZd3BDu9Finm7b9XRH1lojysUXuxN+DeZaqtHMbCRjhBMmbkIrYb81XHytWtqUc
	 +h4lNuuuKIWvu4dm8Ky1TJ59S505UCi7ie0M5ZjOUMha/9uMV/uu+/aujs+Uk2o44s
	 K+LW2/f0fk5kGEBHlVHJjp554NML7r4RT4UAk+mZ96x4wfRfne3Z813kF0GIAFAvEm
	 FImwDXozaFQFek3MmUNWjjS/uYkcSGsc64r2GdwFrWfdHk+7FankEzGw1tUllOoPGL
	 xL+91qfHVk1S/tgjwTDerUiZA3LZxwtfOEk9arxX3efsOUOt5AV1gUlTWQDdDaS8vf
	 D2X8EF0JDiQFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/9] dt-bindings: interrupt-controller: apple,aic2:
 Invert #interrupt-cells condition
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janne Grunau" <j@jannau.net>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260724-apple-t603x-initial-devices-v3-2-bbeba0420603@jannau.net>
References: <20260724-apple-t603x-initial-devices-v3-0-bbeba0420603@jannau.net>
 <20260724-apple-t603x-initial-devices-v3-2-bbeba0420603@jannau.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 18:28:06 +0000
Message-Id: <20260724182807.5B24C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The newly inverted conditional block fails to include the M3 gen=
eration multi-die SoCs (e.g., `apple,t6031-aic3`), incorrectly restricting =
them to 3 interrupt cells and defeating the purpose of the patch.
- [Medium] The compatible string `apple,t6031-aic3` explicitly mentioned in=
 the commit message is missing from the top-level schema definition.
--

--- Patch [2]: [PATCH v3 2/9] dt-bindings: interrupt-controller: apple,aic2=
: Invert #interrupt-cells condition ---
commit fc6ebf906f40d7b153e442ba25ef2691b2d4b00f
Author: Janne Grunau <j@jannau.net>

dt-bindings: interrupt-controller: apple,aic2: Invert #interrupt-cells cond=
ition

This commit changes the conditional logic for #interrupt-cells in the Apple
AIC2 binding. It aims to explicitly list multi-die SoC compatibles that
require 4 cells instead of defaulting to 4.

> The condition for 3 or 4 #interrupt-cells list compatibles for the 3
> cells variant (not used in SoCs consisting out of multiple dies). This
> includes the AICv3 base compatible "apple,t8122-aic3". This will match
>     compatible =3D "apple,t6031-aic3", "apple,t8122-aic3";
> shared for M3 Max and Ultra based devices which require the additional
> interrupt cell for the die number.

[Severity: Medium]
Should apple,t6031-aic3 be added to the top-level properties:compatible arr=
ay?

Any device tree using the apple,t6031-aic3 compatible string will fail
dt_binding_check validation because it is entirely undocumented in the sche=
ma.

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple=
,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,a=
ic2.yaml
> index d0d9a90e96e7b..a94787939d345 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.y=
aml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.y=
aml
> @@ -128,16 +128,16 @@ allOf:
>          compatible:
>            contains:
>              enum:
> -              - apple,t8112-aic
> -              - apple,t8122-aic3
> +              - apple,t6000-aic
> +              - apple,t6020-aic

[Severity: Medium]
Does this enum explicitly list all multi-die SoCs that require 4 cells?

The commit message mentions that the 4-cell requirement applies to=20
apple,t6031-aic3, but since it is missing from this newly added enum,=20
the schema logic will fall into the else branch and apply the const: 3=20
constraint.=20

Will this incorrectly restrict M3 Max/Ultra multi-die SoCs to 3 interrupt
cells, causing valid device trees to fail schema validation?

>      then:
>        properties:
>          '#interrupt-cells':
> -          const: 3
> +          const: 4
>      else:
>        properties:
>          '#interrupt-cells':
> -          const: 4
> +          const: 3

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-apple-t603=
x-initial-devices-v3-0-bbeba0420603@jannau.net?part=3D2

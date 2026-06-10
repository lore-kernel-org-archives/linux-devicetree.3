Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCBD3E95A9
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096030; cv=none; b=V3/+0yX3l3xArtTanc+z1Va3gN0rVUb2X+KEpHZNHq3zVpZ3DjlYQ/4fy+mWzs2G0AevBXVkwJlmFf2oAl/7FngtIDrYepuNHsW22h1FUDsPQ/c0MWUyyEWfc6J/fAaW76hDkz2Qn/soyw363oWlk366x1+SzSVf01EZfdfuvrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096030; c=relaxed/simple;
	bh=f6+2DJG6u0SrWrhExGpZqC6QVgDzQNBeRSqw4sicFdA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T4sdZdJ2O1+0O9E7oB2l6oc9twcv3Q0aBEH6jBYZtFBF/oCRXgVZHUUDugCWgAkrjDb6VCFut3jpAW8yITcbEXkTVx1WTxqBp3XZPB/aWjjrDqva0QhBLfkm0UaBYl9OdOGW5X3Ok60PDiJyCRXhDGF6xdzGfR7XMMunMow2pVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huo2y6kd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huo2y6kd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55A6D1F00893;
	Wed, 10 Jun 2026 12:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781096029;
	bh=HVwe2a9wYwQG41B4gblwJl/+g87zabfEKRR46ZciA2o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=huo2y6kdBYxrd6oQy9V2YLcE9VUKVWEH/qXMKcClbfv5l8aawECsWQlYvOqT/hE9d
	 mIbLWW1Xjxbemwwil7CI7ORbNDMiigVB5YxEo6R4wBLGG/FKQqAQBjHJ9igCevLxiP
	 iEm9bJP14UXIAes09mccJSQcO2V0xkastu+ordyAKkPN2dIyPEDF7MsSyuA7CA/3i7
	 uPYm6q8oYZddhiSpbuTZXVebTwW4w2zF5EJX9DueFHHLLZ9gV/2J8EYzade0DOwkjW
	 VuKMXbms5sAD6SBdsYdWQ603xUMzDx4WMTD5/Oxi66Lz6nfGreERoFZQtpzGn8riy0
	 djG0G+4KBrJdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm
 PMK7750
Reply-To: sashiko-reviews@lists.linux.dev
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260610124048.253162-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260610124048.253162-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 12:53:48 +0000
Message-Id: <20260610125349.55A6D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The new `qcom,pmk7750-gpio` compatible string is missing from the =
C driver's OF match table, and the binding schema prevents using a function=
al fallback, making the hardware impossible to probe.
- [Medium] The top-level MFD binding for `qcom,pmk7750` is missing, prevent=
ing full device tree node validation for the new PMIC.
- [Low] The newly added compatible string 'qcom,pmk7750-gpio' violates alph=
abetical sorting in the enum and documentation lists.
--

commit a637ed7ee2349c673140cc49df5a55b91d3fa732
Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm PMK7750

This commit documents the Qualcomm PMK7750 PMIC GPIO controller, noting
it is almost the same as the PMK8550. It updates the qcom,pmic-gpio
schema to include the new compatible string.

> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yam=
l b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> @@ -71,6 +71,7 @@ properties:
>            - qcom,pmih0108-gpio
>            - qcom,pmiv0104-gpio
>            - qcom,pmk8350-gpio
> +          - qcom,pmk7750-gpio

[Severity: Low]
Should these compatible strings remain alphabetically sorted? It looks like
qcom,pmk7750-gpio is inserted after qcom,pmk8350-gpio here.

[Severity: High]
The commit message mentions this hardware is compatible with PMK8550.
However, the schema restricts the secondary fallback compatible string
to exactly qcom,spmi-gpio or qcom,ssbi-gpio, preventing the use of
qcom,pmk8550-gpio as a fallback:

      - enum:
          - qcom,spmi-gpio
          - qcom,ssbi-gpio

Because the driver in drivers/pinctrl/qcom/pinctrl-spmi-gpio.c requires an
exact match on the primary string and does not generically match
qcom,spmi-gpio:

static const struct of_device_id pmic_gpio_of_match[] =3D {
	...
	{ .compatible =3D "qcom,pmk8350-gpio", .data =3D (void *) 4 },
	{ .compatible =3D "qcom,pmk8550-gpio", .data =3D (void *) 6 },
	...

will this device be prevented from probing? The qcom,pmk7750-gpio string
was not added to the driver's match table, and the schema restricts using
functional fallbacks.

[ ... ]

> @@ -501,6 +503,7 @@ $defs:
>                   - gpio1-gpio10 for pmi8994
>                   - gpio1-gpio18 for pmih0108
>                   - gpio1-gpio4 for pmk8350
> +                 - gpio1-gpio6 for pmk7750

[Severity: Low]
Is there an expectation to keep this documentation list alphabetically sort=
ed
as well?

[Severity: Medium]
Since a new PMIC GPIO block is being added, is there also a need to document
the top-level MFD in Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.y=
aml?
Without it, device tree nodes declaring the top-level qcom,pmk7750 PMIC mig=
ht
trigger validation errors.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610124048.2531=
62-2-krzysztof.kozlowski@oss.qualcomm.com?part=3D1

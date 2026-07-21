Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B48F377AA6
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784634433; cv=none; b=s/SP7OhEc3H8reR9pbZCIwwUM1uU433MjXu1KZEnd0nuASVGHPktSIaIhkn7GbRqRJvUJw2oISNqCfpX/4NV344gf07HU57Nu2hUNvx8r6nhsLhfgw7Y9TG2sGRbeeXZeqTTp/dnPbbUne6wCMZWDpPkhIanVyCFzoDfl9TfEUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784634433; c=relaxed/simple;
	bh=tkMDNfG0PVh0Vrs84RUEwVRmchnKvh3H3AVF6hh5YdU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j73nMhOwhuZatdJCqxjS5Dk/n7D6Z/4Er+EORyyZfHWCYK5YA1O0v3VL3qtSlX1wwGXrHH9AgpTkRWYs1KOcCqc1N/wKwEpv9/FHOdeBBMLVJzJEBk1BIE66G1aGtKbCIh6aepeftsDpBHtAI9hcgGnpJ3bqscF6OaAkVb5/yVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VqYtuoXg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VqYtuoXg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22351F000E9;
	Tue, 21 Jul 2026 11:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784634432;
	bh=aZywTbTiVLB6Dy+1G8kaqoJv7jKyGAltVum6Efvft9A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VqYtuoXg9wPxZTx4DViAaYIfpVxAADInKa7sXKlRUldxXJVES1vmEvOUPluMVhkfd
	 Ew0+uXQoXBLcSzPNCRwN7jFLNaowLF+7UAEPamnhIE59fvcMrJkbVcBiNo8bOskh0E
	 jXCCmOzpEhQSsydkh3wDJwkSPegj13AfgfTKkhUaKPZGwfLM+MhOK+MpVQXP0nCYcD
	 hmftCgjHtlVN9JL0CX92oL1LqizDppsaCxAmST8PCzKmjamBCvjkpZyFxNyT0OpPDw
	 YgZqdG7k2VaDhpJtChsfc4koxxr2BsS7djFqd5FTHR2feUM9JLp0qOkU4PGvYNjPXg
	 L5JKaxaRP9W0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,milos-pas: Move Eliza
 ADSP to SM8550 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-1-3a0b03af2ec7@oss.qualcomm.com>
References: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-0-3a0b03af2ec7@oss.qualcomm.com>
 <20260721-dts-qcom-eliza-fix-adsp-binding-v1-1-3a0b03af2ec7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 11:47:11 +0000
Message-Id: <20260721114711.D22351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Moving the compatible string to an 'items' array constraint requ=
iring a fallback breaks device tree validation for existing `qcom,eliza-ads=
p-pas` device nodes.
- [Medium] Moving `qcom,eliza-adsp-pas` to `qcom,sm8550-pas.yaml` inadverte=
ntly makes its 6th interrupt optional, whereas it was strictly required in =
its previous schema.
- [Low] Explicitly listing `qcom,eliza-adsp-pas` in the `contains` check fo=
r the `power-domains` block is redundant.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: remoteproc: qcom,milos-pas: Move El=
iza ADSP to SM8550 schema ---
commit a654472ebd2ea108ab10c5ccd22057e8aa31a94f
Author: Abel Vesa <abel.vesa@oss.qualcomm.com>

dt-bindings: remoteproc: qcom,milos-pas: Move Eliza ADSP to SM8550 schema

The ADSP PAS found on Eliza SoC looks fully compatible with SM8750, which
can fallback to SM8550 except for the extra interrupt ("shutdown-ack").
So document its bindings in the SM8550 schema instead.

> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas=
.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index 2a4c527552e69..019db91be7fd2 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -29,6 +29,7 @@ properties:
>            - qcom,x1e80100-cdsp-pas
>        - items:
>            - enum:
> +              - qcom,eliza-adsp-pas
>                - qcom,glymur-adsp-pas
>                - qcom,hawi-adsp-pas
>                - qcom,kaanapali-adsp-pas

[Severity: Medium]
Does this regression break validation for existing device trees?

By moving this into an items array that requires a fallback, a standalone
compatible string like the one used in arch/arm64/boot/dts/qcom/eliza.dtsi:

	compatible =3D "qcom,eliza-adsp-pas";

will fail validation since it doesn't specify the fallback.

[ ... ]

> @@ -134,6 +135,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,eliza-adsp-pas
>                - qcom,glymur-adsp-pas
>                - qcom,glymur-cdsp-pas
>                - qcom,hawi-adsp-pas

[Severity: Medium]
Can this inadvertently make the 6th interrupt optional for Eliza?

In the base schema, interrupts have a global minItems of 5. By adding
the compatible string to this block without an explicit minItems: 6 overrid=
e,
the maxItems becomes 6, but the minItems remains 5, allowing device trees
with a missing "shutdown-ack" interrupt to silently pass validation.

[ ... ]

> @@ -232,6 +234,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,eliza-adsp-pas
>                - qcom,sm8550-adsp-pas
>                - qcom,sm8650-adsp-pas
>                - qcom,x1e80100-adsp-pas

[Severity: Low]
Is it necessary to include the specific string here?

Since the newly updated schema enforces qcom,sm8550-adsp-pas as a fallback
for this device, a node for Eliza will already contain the fallback string
and naturally match this condition without the extra entry.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-dts-qcom-e=
liza-fix-adsp-binding-v1-0-3a0b03af2ec7@oss.qualcomm.com?part=3D1

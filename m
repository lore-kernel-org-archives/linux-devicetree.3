Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4195F4CDDE8
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165682; cv=none; b=UzlLOHpaesf3CbMAfsT3goh1ePYhZFnECBcy07ncu+KIzu8kuirADxusU+Djy8NEa6hcUBFQunkAnhTxrW3iEco3UEivFEQALlAqEkxu7u2+PWdruRnnAdN0QSLW+8PkDKd+YJs5Kmleq4R9eFSTCOP1idDbAx0l06bbCrcW+64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165682; c=relaxed/simple;
	bh=wJ0YVoBrFBSWk8tpBUc76jav9XlRWQ3lRVehj3VfXv4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j7w2hj5l4L9HvuynaXnXS1p21EABT1FeBIdJqQMrEWPxgz5qoI55kabQvDWOYBnkTpOdjlCXNSfA6gRGAjqlQwcPpvZN6JD75tqKywLv4EqGjYGkSCxVm1zmto5KDb8o1EvWe8T2Z+73YqJ1n2n9bN88M8Q3ORazWqogjT2Xrhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWHd6JPx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWHd6JPx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B50D61F0089A;
	Wed, 23 Sep 2026 12:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790165672;
	bh=H85NjB8DaikYMybNjZcd2Vc3TRprP05oIocgKOfTWXI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UWHd6JPxcHo/fDQFdkwo+vXP9YKEXJrH7gqA+VkjeJ0Fh/H/bcH2bLn4H0l8Pu4CJ
	 gaVRG7GLAMU7PBhLym50w02g/BMqC4D9bOAyOLZiFRHTdt8LuFKtpujayxD8yQNorK
	 JEr3rQRih9oaOHWw6JX0SHIztCS5EmMLF8Ewjsr/lOuToG2S9hjIdEMs914aTL2Fjo
	 LYLfROn5sK3rsRkYw1RvSRO1tjt1AX0niqNuSqUkIhX7BRqmQ43vsXHGJckddzw3bY
	 GKDWS5EZYyXGvWHGxINImFPyi6QaapQoRVWBTo7ws9/4wUiQmg6zYRKbZI3GUAjvId
	 uay5V0XTI0C5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next 02/16] dt-bindings: net: wireless: ath11k: Add
 bindings for IPQ5018
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923-ipq5018-qcn6122-mpd-v1-2-86729521a75c@outlook.com>
References: <20260923-ipq5018-qcn6122-mpd-v1-0-86729521a75c@outlook.com>
 <20260923-ipq5018-qcn6122-mpd-v1-2-86729521a75c@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 12:14:32 +0000
Message-Id: <20260923121432.B50D61F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: ath11k: invalid use of interrupts-extended as hardw=
are discriminator
- [Medium] dt-bindings: ath11k: missing required interrupt-names for ipq5018
--

commit 154ed5878ee19ca9ad768bee509f9bd7164a287a
Author: George Moussalem <george.moussalem@outlook.com>

dt-bindings: net: wireless: ath11k: Add bindings for IPQ5018

This commit adds Device Tree bindings for the IPQ5018 Wi-Fi configurations,
covering both the standalone and the multi-PD (MPD) setups with QCN6122
companion chips. It documents the necessary interrupts, shared memory
points, and memory regions for firmware loading and dumping.

> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.y=
aml b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> index a846cd704b193..621ad6d4ddadb 100644
> --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath11k.yaml
> @@ -29,8 +29,13 @@ properties:
>      minItems: 32
>      maxItems: 52
> =20
> +  interrupts-extended:
> +    minItems: 56
> +    maxItems: 56
> +

[Severity: Medium]
Does explicitly defining interrupts-extended here override the built-in
normalization provided by dt-schema? Overriding this normalization is a kno=
wn
dt-bindings anti-pattern.

[ ... ]

> +      allOf:
> +        - anyOf:
> +            - required:
> +                - interrupts
> +            - required:
> +                - interrupts-extended
> +        - if:
> +            required:
> +              - interrupts-extended

[Severity: Medium]
Does this conditional use a syntactic Device Tree property to infer the
hardware configuration (MPD vs standalone)?=20

The properties interrupts and interrupts-extended are semantically equivale=
nt
in Device Tree, and developers can use either syntax for any configuration.
Because dt-schema automatically normalizes interrupts-extended to interrupt=
s,
won't this condition always evaluate to false during validation?

This would force MPD configurations into the else block where interrupt-nam=
es
is limited to 52 items, causing valid 56-interrupt MPD device trees to fail
static validation.

> +          then:
> +            properties:
> +              interrupt-names:
> +                minItems: 56
> +            required:
> +              - interrupts-extended
> +              - memory-region
> +              - memory-region-names
> +              - qcom,smem-states
> +              - qcom,smem-state-names

[Severity: Medium]
Is interrupt-names missing from this required list for the MPD configuratio=
n?

The ath11k driver strictly relies on platform_get_irq_byname() for AHB
devices like IPQ5018. If a downstream device tree is missing interrupt-name=
s,
it appears it will pass schema validation but unconditionally fail during
driver probing.

> +          else:
> +            properties:
> +              interrupt-names:
> +                minItems: 52
> +                maxItems: 52
> +

[Severity: Medium]
Similarly, is interrupt-names also missing from the required list here for
the standalone configuration? This would cause the same disconnect between
schema validation and runtime requirements for the standalone case.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-ipq5018-qc=
n6122-mpd-v1-0-86729521a75c@outlook.com?part=3D2

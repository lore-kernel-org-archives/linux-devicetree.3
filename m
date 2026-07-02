Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F0338B7B0
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 07:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978375; cv=none; b=IqP6sRfky2d+PFc+iNpFevaxxUuKKGyxCirtYET4rXpeC7NU9zrkLZ1J1Hk31mMB64gBcE0vdcDXcxGT2zFkOkfks8VCMZof2I1iymqK7tmkJ72+1b7Z3EhyI0dSw9sfgYBP+QodlceN4fP83wSBhBmAgdFx8E5jkY4Du51f/ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978375; c=relaxed/simple;
	bh=i+DuTwbYnLH2Lr3EDa/APLl670KlNLHIIRTovR8M+dc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HFrh4FmrN9RNue2XLl7Xv0XpA+amXjMUihWop9oRFM6fgTehpcXQ1Vf+hapy/rsvHmmZfJqKB1IbK/sTSwU/EHgf0MBUWJ/XfE5jnXTU1oK/xWVTtB1KofLHhr03CKFeis72qWLjM6xSaab4kpzI/458S/2fWRG/Gys+zXPCwrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWPP/YMM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWPP/YMM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4BF1F00A3A;
	Thu,  2 Jul 2026 07:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782978373;
	bh=1zeGnvof6aSvYgHXAqPBCY/BsO9rjK+6BfrzFoJGPqo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UWPP/YMMSoe/+e6ksAl/jcVKruYXqwGo4oAymP5W2haBDGC34owGQvX27vO7xZQI9
	 qSstgtM+T8Ds1zsTc0BUUm8t5ljW5XF4wFhkGbgBDZU3+T4QxoNvTqNcM/euZ4NK/z
	 LnVunT937SXMMVlDruvGw9q2hyOl8QeQuIxAsHFR5PxYJvndxcFrYuStekUz9Rfy/s
	 6c8ySIN5YYLbPGnZBL+AiIaBQ6w3mYOWMCko3qoi7tHgwXyweYoLn5LmUpHe1zJKMn
	 Dq/ybd0Im7RX1CDNMe+dJf75pLDGJ83Ai8O7TIZjqIbNAcZJUqNux6O7ezNTWc9/2G
	 aSLW4Sw6a89bw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/7] dt-bindings: clock: qcom: Move glymur TCSR to
 own binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiang Yu" <qiang.yu@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260702-tcsr_qref_0702-v7-1-776f2811b7af@oss.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
 <20260702-tcsr_qref_0702-v7-1-776f2811b7af@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 07:46:13 +0000
Message-Id: <20260702074613.6C4BF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Provider capability properties (`#clock-cells`, `#reset-cells`) =
are missing from the `required` list.
- [Medium] Enforcing the newly introduced regulator supplies as strictly `r=
equired` breaks DT ABI backward compatibility for existing nodes.
--

commit 5e430d824fb02882cee1134048f0cc37d37b28cc
Author: Qiang Yu <qiang.yu@oss.qualcomm.com>

dt-bindings: clock: qcom: Move glymur TCSR to own binding

This patch extracts the Glymur TCSR clock controller into a dedicated
binding file. It documents the vdda supply properties required for the
QREF block, as its control interface resides in the TCSR node.

> diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yam=
l b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> new file mode 100644
> index 0000000000000..ec89feff89e4e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> @@ -0,0 +1,126 @@
[ ... ]
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,glymur-tcsr
> +    then:
> +      required:
> +        - vdda-qrefrpt0-0p9-supply
> +        - vdda-qrefrpt1-0p9-supply

[Severity: Medium]
Does enforcing these newly added regulator supplies as strictly required=20
break backward compatibility with existing device trees?

Older DTBs that already use the qcom,glymur-tcsr compatible string might=20
not have these vdda-*-supply properties, which would cause them to fail=20
schema validation during dtbs_check. Device tree bindings act as a stable=20
ABI, and converting non-existent properties into strictly required=20
properties breaks this ABI.

Could these be made optional or gracefully handled to preserve backward=20
compatibility for older device trees?

[ ... ]
> +        - vdda-refgen4-0p9-supply
> +        - vdda-refgen4-1p2-supply
> +
> +required:
> +  - compatible
> +  - clocks
> +
> +additionalProperties: false

[Severity: Medium]
Should #clock-cells and #reset-cells be included in this required block?

Since this binding documents a clock and reset provider, omitting the cell=
=20
properties from the required list might allow incomplete device tree nodes=
=20
to silently pass schema validation. This can lead to runtime failures when=
=20
dependent drivers attempt to use the undocumented provider capabilities.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-tcsr_qref_=
0702-v7-0-776f2811b7af@oss.qualcomm.com?part=3D1

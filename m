Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEA03998B1
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785399315; cv=none; b=vC/gPd9mPokyxlRpD0W4Cml2IxpWvWfMiJ5TFmPBcm5Pnmk9GCwgaqtrn00HI70WaBrsrNDI7hRPN1KJ9IW7LpoHq7S2Oj1RUpqzucNVYcDSUsrLwMesZtszJw50PNqIkeGieeT3/C0AlcqW+w5DLRnNtgx1SItC0SqL6j4IZ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785399315; c=relaxed/simple;
	bh=ZU0HW8VsC7SXpvemHPTgCWU6sh34m2UXp9XP14fgZd4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gwAvhGSFWs6wCN/IDTUqX2+y1pSQm7R83uSq4Ox8TgE7xACX599aRT4Maj/nhu/PqaipuLxg+9yIt8Qhlqc0I1YW8bThTzmNwjXQIO4Nm9oUZEu7z1I8Fk43fdPs3RT7aprBA1DxfO9uk4u0Qy43d98vSfcpyZDujxpg8lF7syY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FBpWtXC5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FBpWtXC5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F911F000E9;
	Thu, 30 Jul 2026 08:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785399308;
	bh=YaQK5n54FocYdpeO5BrLL3ZN4krx3wPENIrvX38VsXM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FBpWtXC5bJtig2kTSYFdjaaLdhQJkJypgYfMTb64aUOAa/GXlwMtiHCjL70z+TyHn
	 Shp0XwSGjRqBPWR4lvCUwskNaE+wyzkhILhYs7RdFHsbJjU1sRLCahqcrQIdHLXhVh
	 l+YH34dzcreW+qXyiD2H2o8BU8CRshBozJoetO/xW1TttV685RIWqzm1SB9j+3diqO
	 YO0Fotsl6ZgRh84tk3LXZa/PUH4a4pCNY95COdT8IVpCd67VbtFJ+KrLIX1/trpGcN
	 IPE9jWn0w+ZSL/U4EWIwLzS4BdpQkRP0cuNDlW7PdkINHlxN3Q4K9zXgTTpKd5IUFR
	 WdgtPBNGdiW6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 1/7] dt-bindings: arm: Add support for Qualcomm TGU
 trace
Reply-To: sashiko-reviews@lists.linux.dev
To: "Songwei Chai" <songwei.chai@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730080704.2903540-2-songwei.chai@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <20260730080704.2903540-2-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 08:15:07 +0000
Message-Id: <20260730081507.B1F911F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The binding schema omits the `interrupts` property despite the h=
ardware description explicitly stating it can generate interrupts.
- [Low] The schema claims `arm,primecell` compatibility but uses `additiona=
lProperties: false` without referencing the standard Primecell schema, inco=
rrectly blocking valid Primecell properties.
--

--- Patch [1]: [PATCH v16 1/7] dt-bindings: arm: Add support for Qualcomm T=
GU trace ---
commit 1cb0b1557ad8efca643aa36dee2d1b84f9c415b0
Author: Songwei Chai <songwei.chai@oss.qualcomm.com>

dt-bindings: arm: Add support for Qualcomm TGU trace

This commit introduces the device tree binding schema for the Qualcomm
Trigger Generation Unit (TGU). The TGU monitors signals to identify issues
and can generate a trigger into the CTI or interrupts to processors.

> diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml b/Docume=
ntation/devicetree/bindings/arm/qcom,tgu.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
[ ... ]
> +description: |
> +  The Trigger Generation Unit (TGU) is a Data Engine which can be utiliz=
ed
> +  to sense a plurality of signals and create a trigger into the CTI or
> +  generate interrupts to processors. The TGU is like the trigger circuit
[ ... ]
> +  preprogrammed state/sequence and then produce a trigger or interrupt.
[ ... ]
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,tgu
> +      - const: arm,primecell

[Severity: Low]
Since this device claims arm,primecell compatibility, shouldn't there be a
schema reference to /schemas/arm/primecell.yaml# included to properly
inherit standard PrimeCell properties?

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb_pclk

[Severity: Medium]
The description above mentions the hardware can "produce a trigger or
interrupt", but an interrupts property is missing from this list.

Will device trees that legitimately specify the hardware's interrupt line
fail schema validation when additionalProperties: false is enforced below?

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false

[Severity: Low]
Because arm,primecell compatibility is claimed, should this use
unevaluatedProperties: false instead?

Using additionalProperties: false without inheriting the PrimeCell schema
will block valid inherited properties like arm,primecell-periphid from
being used in the device tree without validation errors.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730080704.2903=
540-1-songwei.chai@oss.qualcomm.com?part=3D1

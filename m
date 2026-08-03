Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7514630E82B
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 03:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785727427; cv=none; b=FPanc2wXVTMKrNzcGmk+4eBBV2Jpw2z/CS+KzaXYc8ZnlKmU9lDmfxcLKGyx1yOk+BNzlwVBZcIUfKjRBvUCn6d68T/vQg8Wx3bsz6fwbLlgtUfK5CAKhtlZkwIczyzgpoEF+eTBMw6heX7NM5eUCXOprlt339iMVhgaGHIfhjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785727427; c=relaxed/simple;
	bh=/h6ylmZ8d0c8ad5oKsiaPSt0Fp0HKHfzI+NiNK8jSlk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N6App4gmjMSCvTmC1rcabMfN7xwrbG5Ro2m7GHd1m81GJ77yb6U59ySZVTDLu0OJKhQFph7fG8CkCYtfh0S3nT2I5pweP9rQJef5hfVoJ/fqWSfdhrBJ005IfyvYIcu0K2pYdPaj/03Id7/CMBdhIi9/nr2GjYHcdclFvn1V9Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWl0pxMx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWl0pxMx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6F21F000E9;
	Mon,  3 Aug 2026 03:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785727426;
	bh=5vPuhyUh0aPuxxnK9uPuPNI/4tUJXqYuWCu2wrPwiE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gWl0pxMxk+x4gqFY1P8kPivONrrNg4FkHlis6HU1I78+i1AZtzW6Nlvx3VBpHIUoO
	 v2kMJGtf8k75sP157c73t1NkoLnNQDVBwtoxj4WztQOOk5C60zt01EiDKwdDzF98KE
	 pBM6sCpqGQv4wsyl7xF7MDWA1s5WtQJZNEEucxI8yyJmon67dpr6tlqRJQciY3ap/6
	 PEdVUk+TuZA9fGi3aiUprfzEx7GuoEs6kyJ4JwutobMVIueqmzUlEWjQyJw4M4h+Jq
	 /JOWuNhYawY4jzXiW6ifBHd3Hokrfr5zXV4smecoBS6XdkRIWpd+0gT9BCX5F6tCMv
	 oER3ZGFmIDTKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260803031534.2942628-2-elson.serrao@oss.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
 <20260803031534.2942628-2-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 03:23:45 +0000
Message-Id: <20260803032345.BC6F21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `oneOf` block fails to strictly enforce mutual exclusivity a=
nd compatible-specific requirements, allowing mixed and invalid configurati=
ons.
--

--- Patch [1]: [PATCH v5 1/9] dt-bindings: soc: qcom: eud: Add per-path chi=
ld nodes for UTMI routing ---
commit d07ffdab4981374b8db10b3e58b93f23b98e8107
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing

The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
High-Speed UTMI paths depending on the SoC. For example, SC7280 supports
EUD on the primary UTMI path only, while SM8350 supports EUD on both
primary and secondary UTMI paths.

> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/D=
ocumentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> index 84218636c0d8d..6fef958487c8d 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
[ ... ]
>  required:
>    - compatible
>    - reg
> -  - ports
> +
> +oneOf:
> +  - required:
> +      - ports
> +  - allOf:
> +      - if:
> +          properties:
> +            compatible:
> +              contains:
> +                const: qcom,sc7280-eud
> +        then:
> +          required:
> +            - eud-path@0
> +          properties:
> +            eud-path@1: false
> +      - if:
> +          properties:
> +            compatible:
> +              contains:
> +                const: qcom,sm8350-eud
> +        then:
> +          required:
> +            - eud-path@0
> +            - eud-path@1

[Severity: Medium]
Does this oneOf block introduce a regression by allowing mixed or invalid
configurations to pass schema validation?

Since oneOf validates if exactly one of its branches passes, a device tree
could provide both the legacy ports property and invalid eud-path nodes
(such as eud-path@1 on qcom,sc7280-eud).

The input would satisfy the first branch (required: ports) but fail the
second branch's constraints. Because exactly one branch passes, the
validation would incorrectly succeed.

Could we restructure this to strictly enforce mutual exclusivity between the
legacy and new representations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803031534.2942=
628-1-elson.serrao@oss.qualcomm.com?part=3D1

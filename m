Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1485E39F16B
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408538; cv=none; b=fPAU0TVehOjrgbLOf+f2DO7az/ecCGYtzdBoLN2MHX7iRBluq6t1hudLPPUUyjd7W1yPdFaCarllv/c+LCk0Db81tswIBaPBJGlsZD6feZMrkmA/uDvNjvSnu93+m420OOk2HfkgZs1cpr4Jdm+Zd3urmUR7YTJMXCfW3G0Hajo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408538; c=relaxed/simple;
	bh=+VxtLkCMpVWpxg2e0TTsB7sevAJ7AN28yqm0Bjv6+T8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tX/zFzNB/wSAgCdBiIWfUcndWyYXtWlm8VshdAXnTH4fZKbHNqg8M3EZzRCxpu2O74+vQcMgij9DkfKTjBdZjhwHL0JOwmbM47Ma9OPTCEGt4gKYoQTQVCpG5Ddu8rRnNdVhz5bY7Dxrub4VrXuyTaW2s0SEsmMJhEMzyldlJyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSnqwQOi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSnqwQOi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A190E1F000E9;
	Thu, 30 Jul 2026 10:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785408537;
	bh=BNSpfg1dD65k9M27JZgfUR+wpB8oHyjCK72xBZwAGyQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kSnqwQOirOzfR/GtFM+fY1D5Z6A44QEzY0S017dyeLnejR6mgv1ztsN6J7x/IBcjc
	 XOdM3z3bYX+QdD5x1oOGSp/kyNz1jTrug0kqQS4UUGncpEzQUfFpxCcKjpvv6guPYX
	 64PEFjfarV81aKseX28LkNYE+NQSk1fQhq35VqBFUO18EV3HS0EW9GkPKFRUPvvqnJ
	 nCmQ1Z8YDcOtVrML//mi1wwLAO0TcM8MydRI1ZKtjN+wYCqE4gu2TXezXaMiTjeo86
	 4bXkQ4uoL9aFU83DBF+gnaTBsG+SY4L48krYNVG7VXto2BfHsFn6OABsFyX92vzRBK
	 VabTViAf+GgBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260730-rzg2-sr-boards-v4-1-08bc459578dc@solid-run.com>
References: <20260730-rzg2-sr-boards-v4-0-08bc459578dc@solid-run.com>
 <20260730-rzg2-sr-boards-v4-1-08bc459578dc@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 10:48:56 +0000
Message-Id: <20260730104856.A190E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The bindings for SolidRun SoMs fail schema validation when used =
standalone, as they omit the 3-item compatible string configurations.
--

--- Patch [1]: [PATCH v4 1/5] dt-bindings: soc: renesas: Add various SolidR=
un RZ/G2 based boards ---
commit 5a8377d33a57f9f7e33e7aca8fc9422f672bf72b
Author: Josua Mayer <josua@solid-run.com>

dt-bindings: soc: renesas: Add various SolidRun RZ/G2 based boards

Add bindings for various SolidRun boards and System on Module built
around Renesas RZ/G2 family of SoCs.

> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b=
/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> index eeef34e3d7d07..1673005a3d930 100644
> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -508,6 +508,14 @@ properties:

[ ... ]

> +      - description: SolidRun RZ/G2UL based boards
> +        items:
> +          - enum:
> +              - solidrun,rzg2ul-hummingboard-ripple # SolidRun RZ/G2UL H=
ummingBoard Ripple
> +          - const: solidrun,rzg2ul-sr-som
> +          - const: renesas,r9a07g043u12 # RZ/G2UL Type-2
> +          - const: renesas,r9a07g043
> +

[Severity: Medium]
Will this schema definition break validation for standalone SolidRun SoMs?

The current schema items block mandates exactly 4 compatible strings, with =
the
first string being one of the carrier board enum values.

If a standalone SoM device tree is defined with 3 compatible strings (e.g.,
"solidrun,rzg2ul-sr-som", "renesas,r9a07g043u12", "renesas,r9a07g043"), it
appears it will fail validation because there is no matching 3-item array
block for the standalone SoM.

[ ... ]

> +      - description: SolidRun RZ/G2L based boards
> +        items:
> +          - enum:
> +              - solidrun,rzg2l-hummingboard-iiot   # SolidRun RZ/G2L Hum=
mingBoard IIoT
> +              - solidrun,rzg2l-hummingboard-pro    # SolidRun RZ/G2L Hum=
mingBoard Pro
> +              - solidrun,rzg2l-hummingboard-ripple # SolidRun RZ/G2L Hum=
mingBoard Ripple
> +          - const: solidrun,rzg2l-sr-som
> +          - const: renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
> +          - const: renesas,r9a07g044
> +

[Severity: Medium]
Does the standalone RZ/G2L SoM also require its own 3-item validation block
for the same reason?

Without it, standalone SoM configurations will likely fail dt_binding_check
and dtbs_check validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-rzg2-sr-bo=
ards-v4-0-08bc459578dc@solid-run.com?part=3D1

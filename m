Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C1335950
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 00:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469790; cv=none; b=nfsp9KL46o1cjMHh7956dzpTAxGk42kcZVPrxJ1ZLDsGMtse4LeLVhNrZAPMOsepts9bFjyWfexPDYiHOd4aOK5d7ml3ejDk33cGOwvO1soOJ74DDfMLUBXxARkiQzsGZ9wQ3IwJdoKx09mTquVHdIyVgLhoYvV37U1lbUUbRC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469790; c=relaxed/simple;
	bh=KH01MC+NoGQ6e3C2NUfBFyC7f5tvEh972VGSmnL+caI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NO7V3sI9MJXQUjq97kJFRF1iHfVQAxg5piJ1alRfKol81fK5US20PLokiT9ea6MJOGndao/gCcn++iXT+tezM2iy9dkMJtxOOMCZvR3qBwzIJHWDSocvIEFEvSv/8e6G/Wqwu7Hi2OI1fjQh1S0NObMbpNtFw+gB1LBQYwGA+xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/bUuavx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/bUuavx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4A81F00A3A;
	Wed,  8 Jul 2026 00:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783469788;
	bh=hUV8/GYqfUK+Zu5vIYIUkD3pxcHBMjZMQIK/k3bQWCc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D/bUuavxA5L8KPZ9M95PL7j3t/FdqEpRIIJ7nlKRxh9f4MWRrM2Sn/KSLIjleqKeJ
	 YvTNcGn9SlAskKwdOllg7cuA7j2jvMxafVcnGQFU34EQwnbMwyfzp8IPpNwFadcDLG
	 MvvHdTApCCY3wZMjGuTW6oO4/EwAW2iWn7pi1ZHb6hr8wQwpgOkse9+2n+1b+PJ72m
	 BaGcdQL52lsLOxz7XfejrhBxgzVymWRf0C2ucfGev6LahV0IE0NHOq8897lLmysh9k
	 WLR/Rm/N73GeD+RoJAMztWWgsfDB18X8JlApUioqt1JN/jItlJfxZ8Ev8+IMmCbX4u
	 X7K8eZrztv3NQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 1/6] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QnJ5YW4gTydEb25vZ2h1ZQ==?= <bryan.odonoghue@linaro.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-1-f8588da41f16@linaro.org>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-1-f8588da41f16@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 00:16:27 +0000
Message-Id: <20260708001628.5F4A81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The binding adds a `$ref` to `qcom,x1e80100-csi2-phy.yaml`, which =
does not exist.
- [High] Overlapping MMIO region claims between parent and child nodes.
- [Medium] Removing legacy power supplies from the required list without an=
 alternative constraint allows incomplete DT definitions.
- [Medium] The patch silently adds `opp-table` to `patternProperties` witho=
ut documentation or proper schema constraints.
--

--- Patch [1]: [PATCH v12 1/6] dt-bindings: media: qcom,x1e80100-camss: Add=
 optional PHY handle definitions ---
commit a10cbc21177fae0f236d507fc2a6068204516723
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

dt-bindings: media: qcom,x1e80100-camss: Add optional PHY handle definitions

Add optional PHY handle definitions. This will allow for supporting both
legacy PHY definitions as well as supporting the optional new handle based
approach. Drops the legacy high-level 0p8 and 1p2 supplies as required.

> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.=
yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 2d1662ef522b7..c17b9757b2c86 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml

[ ... ]

> @@ -158,6 +176,14 @@ properties:
>              required:
>                - data-lanes
> =20
> +patternProperties:
> +  "^phy@[0-9a-f]+$":
> +    $ref: /schemas/phy/qcom,x1e80100-csi2-phy.yaml

[Severity: High]
Does this referenced schema exist? It appears that running make
dt_binding_check will crash with a jsonschema.exceptions.RefResolutionError
because qcom,x1e80100-csi2-phy.yaml is missing from the tree.

[Severity: High]
If the parent CAMSS node still explicitly claims the csiphy0 through csiphy4
memory regions in its reg-names array, won't adding child nodes here that
map these same MMIO regions cause overlapping request_mem_region calls in
the driver, leading to EBUSY probe failures?

> +    unevaluatedProperties: false
> +
> +  "^opp-table(-.*)?$":
> +    type: object

[Severity: Medium]
Is it intended to add opp-table without a $ref to opp-v2-base.yaml? Using
only type: object bypasses strict schema validation for OPP tables, and this
behavioral change doesn't appear to be mentioned in the commit message.

>  required:
>    - compatible
>    - reg

[ ... ]

> @@ -171,8 +197,6 @@ required:
>    - iommus
>    - power-domains
>    - power-domain-names
> -  - vdd-csiphy-0p8-supply
> -  - vdd-csiphy-1p2-supply
>    - ports
> =20
>  additionalProperties: false

[Severity: Medium]
By unconditionally dropping these global supplies without enforcing an
alternative (such as using anyOf to require either the legacy supplies or
the new phys nodes), does this allow incomplete device tree descriptions
that omit PHY configurations entirely to silently pass validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-b4-linux-n=
ext-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org?part=3D1

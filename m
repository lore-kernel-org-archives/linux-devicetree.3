Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D1E356754
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 15:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787930839; cv=none; b=OweSNU0vLP8jm2OQJzUJc5Sop+6Njj70NwN8PrfYQxXSxkDD4yBpp8Ny6+d8QW6zDvj0E5F7j2AOTA/xkWsrxsK0/tcwdCcg+9cHOt5Q4rcbd1ZYMnyLYHV1YTdVfpyILcCzE9//OwNKKH0eIucqBH+/+x8Gaud5+aC30dwq8QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787930839; c=relaxed/simple;
	bh=TyLLeIu64BUUSazxOo6thNchzolc0nnqaY8rOCzFCgM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sgJbR8GJGOiIDz+WJOHoIqMlmBoszvmH41LjTbMswN2QHh72/v8+GPs9RYfDKSPML+9c3DpwadJxsmLPXkqgxuyfJJSyPRxJGQUljbgeQJpvCZYmjiqGTDX5K0QYUGtNavOTTJCFsoquAgpyltau/5MmUqwQLUrn1yI5dy06hic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SsjyCufQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SsjyCufQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C67B1F00A3D;
	Fri, 28 Aug 2026 15:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787930837;
	bh=id+oMfMgSs1F/uj8z23l8PZe3GYu+L9wK7zc8+ssHGw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SsjyCufQfd8OE4IVE5lO2udu7FHdgt/RSbRILHumrRygnj6MSxA3YLWL9H5zstsZx
	 LO6hMc3V5uuvChJhLb0ZJDx0I5srOcfGY5tqKEYtiXb+WvbBCbULvVevJG4jgQcOuY
	 QxZtxjb9iD3eOTWp3vvnQR+jX1amaqV8xnUgF9g7OvyhB6ihnxRdGEV5ysoRccvesI
	 SSr2j7W3IVpYWr1EkEG5Q3/0j6TqQ0cXrQEjB/EC1bnvnB4QqhoYThrYbi9N9AIIMy
	 BL5g8boDvZWvmanP0Q+4ceWFQXZ+zmRmg5zlX8Qwu5Wuhp8bAJqHpp3/cMNU0oT7bp
	 MqFhBYiRrvOaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: stm32: Document
 st,stm32mp23/25-syscfg subnodes and cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260828151216.175020-1-marex@nabladev.com>
References: <20260828151216.175020-1-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 15:27:17 +0000
Message-Id: <20260828152717.6C67B1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The conditional `if` block for `st,stm32mp23-syscfg` and `st,stm32=
mp25-syscfg` uses `enum` directly instead of `contains: enum`, which fails =
to match the array-typed `compatible` property and bypasses validation.
- [Medium] The schema examples section does not include a demonstration of =
the newly required properties and subnodes, leaving the new variant unteste=
d.
--

commit 756e633a3636918c549af9224be89571f86da4e0
Author: Marek Vasut <marex@nabladev.com>
Subject: dt-bindings: arm: stm32: Document st,stm32mp23/25-syscfg subnodes =
and cells

The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
represent the USB 2.0 FEMTO-PHY. Document subnodes pattern properties and
address/size cells.

> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.=
yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index 95d2319afe235..d82afa39960b9 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml

[ ... ]

> @@ -57,10 +68,14 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          const: st,stm32mp25-syscfg
> +          enum:
> +            - st,stm32mp23-syscfg
> +            - st,stm32mp25-syscfg

[Severity: High]
Does checking the array-typed compatible property directly against enum fail
to match here?

Since the compatible property is defined globally as an array (e.g.,
["st,stm32mp25-syscfg", "syscon"]), wouldn't evaluating it against a string
enum evaluate to false and completely bypass the validation constraints?

Should this use contains: enum instead?

>      then:
>        required:
>          - "#clock-cells"
> +        - "#address-cells"
> +        - "#size-cells"

[Severity: Medium]
Do the newly authored constraints and phy subnode need to be added to the
examples section?

Currently, the examples only cover the older st,stm32mp157-syscfg variant.
Does this mean the new requirements for mp23/mp25 aren't validated when
running make dt_binding_check?

> =20
>  additionalProperties: false
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828151216.1750=
20-1-marex@nabladev.com?part=3D1

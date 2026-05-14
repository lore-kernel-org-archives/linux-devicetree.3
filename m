Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2563F4133
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 02:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778727084; cv=none; b=JIP2lZd0gzpwzphgXFm+ietgbtGU4uQ4FKbESv4tAvFZ8vA3FFvC7Xo++05Pv1CMp+XOf9dUOBnVYqGfgu6sng4ybDaEpi+5zm6B0cJD6nFYyTaFuKS1nTMuquQsEdsinMJgEBkxzcHOc5sHZ5u+emPzLzGqjdvm6giBNFY3Ddw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778727084; c=relaxed/simple;
	bh=KEtaCZr/c7+y0s/PMt3W49/TY0jULzfEc5bKQFQjRUI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GS9qEan9JbY+XUnIC10NV4GPxlS2UV4yxlbvsTsYEWeLHVyCwiCacNt88uUT69kGEuBARNE34zoVP9p7k53QptQvGN/5pwLrENXA5xwdtebx2s5nj0QW3NmT7mVPdPmwzQdU8Cz7wqAE//gHa4OV7kMJlzvVvkMfkTTBr1FefWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYFZTNEB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYFZTNEB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D758DC19425;
	Thu, 14 May 2026 02:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778727084;
	bh=KEtaCZr/c7+y0s/PMt3W49/TY0jULzfEc5bKQFQjRUI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=YYFZTNEBrSvpUvaRSEEkIXwE2pleeNeaRCea8lZFffYx9XkYW1kmFFyUysngUPFpg
	 BLWXE1r1ugLVzdcfCJTmXv9p4nDIIb88bsOF3l4aU32pPKcmJCEzrS92qyJsrotRyQ
	 +qOsa+TevJvRLYwwMKnN+EVFXBmFvFWDgRAjMu2MSe7K2DxUg/jlYE/hzLcWyqkjNy
	 Ku5E9YNoGYyKxPuClVg6TztJBV2pNEM5e+kQSTqzbXcz9m5DpgkP5XtdKD8Cs0FIaj
	 ucQiAnfDWKjlhs0sb+4N0Zm6gZfFevrguOY25O4uPbS58Iz7MOUdQGPaPABb0m3Bsr
	 Tw7VBt6F+bGPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/10] dt-bindings: display: rockchip: analogix-dp:
 Fix hclk as third clock for RK3588
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260513074414.2053435-2-damon.ding@rock-chips.com>
References: <20260513074414.2053435-2-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 02:51:23 +0000
Message-Id: <20260514025123.D758DC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The device tree schema fails to correctly enforce the required n=
umber of clocks in the conditional blocks by omitting `minItems` and `maxIt=
ems` constraints.
--

commit 1eeef10904ab6c1e09008c1f85fab2353dd23f79
Author: Damon Ding <damon.ding@rock-chips.com>

dt-bindings: display: rockchip: analogix-dp: Fix hclk as third clock for RK=
3588

This commit enforces a third clock name on a per-compatible basis for
the analogix-dp driver. It removes the implicit clock enablement from
the GRF phandle and explicitly defines the clocks required for each SoC.

> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockc=
hip,analogix-dp.yaml
> index d99b23b88cc59..8001c1facf986 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml

[ ... ]

> @@ -60,6 +57,33 @@ required:
>  allOf:
>    - $ref: /schemas/display/bridge/analogix,dp.yaml#
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3288-dp
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: dp
> +            - const: pclk

Should this block include maxItems: 2? The top-level schema defines
maxItems: 3, which might allow a device tree with an extra unvalidated=20
third clock string to silently pass validation here.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3399-edp
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: dp
> +            - const: pclk
> +            - const: grf

Does this block need minItems: 3 to ensure the grf clock is actually
enforced? Because the top-level schema allows minItems: 2, a device tree
omitting the third clock might still pass validation.

> +
>    - if:
>        properties:
>          compatible:
> @@ -68,6 +92,11 @@ allOf:
>                - rockchip,rk3588-edp
>      then:
>        properties:
> +        clock-names:
> +          items:
> +            - const: dp
> +            - const: pclk
> +            - const: hclk

Similarly, does this block also require minItems: 3? Without it, the=20
hclk requirement might not be strictly enforced if the schema validation
falls back to the top-level minItems: 2 allowance.

>          resets:
>            minItems: 2
>          reset-names:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513074414.2053=
435-1-damon.ding@rock-chips.com?part=3D1

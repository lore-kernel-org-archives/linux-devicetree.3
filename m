Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451D033F5AF
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 13:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779714345; cv=none; b=q/f02ex+uR8kg2wnU8bJkxoMXCrz81KMoUvDognAkzJq4jOmf9rc4BIAkxo0obA0JNUBveLYM1m7TT22tmfLhgYidKh5z8P7SI92QkXaLEkIuPQGLFTL8sqhCPVr50Tw+f55HiGqfrZ0kExMFfh1KYeqPTkSSjEvekaQK6SpV8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779714345; c=relaxed/simple;
	bh=lS4xE/XPSaty6+I9OB8YFTRuPd/CsQjrOtFjz8Z99aw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HcNKzipgRQtOQHF26YekXSgCJt1QCYLoI1E3K2zICAwiT+W/W4/RQulAdViaYw3W5qmBDxYFjKGW7/IhR17OqoLHTfuvYn62NvMlV0wtRaE8sBkxfVbeJK2AjvfoneDrlD2IKDVr77H7ZPoP4LDG7N2tbFH4FP3fjmH831B14F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPYnTron; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPYnTron"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2921F000E9;
	Mon, 25 May 2026 13:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779714344;
	bh=mSJrXehZ0quMstbN6VW2ZUzDT87++eydShiNIfTe3Zk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZPYnTron6dIEobNYUJOyod/MsYnWMb9dv3aVajCwRDPnA/Z8VNAOMJlVeIMssM53J
	 AnRK5sWzeguhDTCJpfY/ErGpLgWE3zyjXYDB6g/4DPa7xqxjTESO8n+V3hiDyZq3PE
	 F/qDNacfL0Kux85fODHKyn6aZ/NBErLk90jOh7/s9yZHZB/KZl+L5Cr0Gc+H4E79Sq
	 xZD7L8cexMkWpeo/OHxYx+71LT5inak2gsgsBhf8wdIeZF0kDn5Mrx0FrFRFCB4Sfp
	 t2rqdW5uqo+m939EYBcSjD6Uiw7ToRUgMnWF7bxBLgof1BLgRCUjpV2oDZrqJfIObX
	 qCR4rMUbzbVlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 01/10] dt-bindings: display: rockchip: analogix-dp:
 Fix hclk as third clock for RK3588
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260525125331.140059-2-damon.ding@rock-chips.com>
References: <20260525125331.140059-2-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 13:05:43 +0000
Message-Id: <20260525130543.BC2921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema fails to enforce the per-SoC clock names for the thir=
d clock as claimed in the commit message.
--

commit 610de2ebf53101c37f8a390596d7553b1a60ba5c
Author: Damon Ding <damon.ding@rock-chips.com>

dt-bindings: display: rockchip: analogix-dp: Fix hclk as third clock for RK=
3588

This commit changes the analogix-dp binding to require the hclk clock
for the RK3588 eDP controller to make the dependency explicit. It attempts
to define per-SoC clock requirements, specifying 2 clocks for RK3288,
and 3 clocks for RK3399 (grf) and RK3588 (hclk).

> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
analogix-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockc=
hip,analogix-dp.yaml
> index d99b23b88cc59..a1ab7a77bdd35 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,analogi=
x-dp.yaml
> @@ -26,7 +26,9 @@ properties:
>      items:
>        - const: dp
>        - const: pclk
> -      - const: grf
> +      - enum:
> +          - grf
> +          - hclk
> =20
>    power-domains:
>      maxItems: 1

[ ... ]

> @@ -60,6 +62,32 @@ required:
>  allOf:
>    - $ref: /schemas/display/bridge/analogix,dp.yaml#

[ ... ]

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3399-edp
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
> +
>    - if:
>        properties:
>          compatible:
> @@ -68,6 +96,10 @@ allOf:
>                - rockchip,rk3588-edp
>      then:
>        properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3

[Severity: Medium]
The commit message explicitly states the intent to enforce per-SoC clock-na=
mes
requirements, specifying that RK3399 requires grf as the third clock while
RK3588 requires hclk.

Does this implementation actually enforce the per-SoC clock names for the t=
hird
clock?

The conditional blocks only add minItems: 3 to the clock-names property wit=
hout
explicitly defining the sequence of allowed values. Since the top-level
clock-names definition allows an enum of grf and hclk, could an
RK3399 node successfully validate while using hclk, or an RK3588 node
validate while using grf?

Should the then clauses explicitly define clock-names: items with the exact
sequence of const strings required for each specific SoC to fully enforce
these constraints?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525125331.1400=
59-1-damon.ding@rock-chips.com?part=3D1

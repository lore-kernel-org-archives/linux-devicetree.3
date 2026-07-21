Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A80471276
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784658382; cv=none; b=JUXIFAShF8yYLLqIrp4f8GPKPp9Q9vomzFQWz+JzU3Bsg8Ea3hx72WXC2O3ralaX0L7l1lSzi7yb50LnGa/CHfZTXTpxsV3oGsUzdfdrIn+oaUSLiL5PPROTe1d0Wc+fPT5vYd4FobUp6nky1RSTrKUd236IDvA51Xo/Vwiyklk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784658382; c=relaxed/simple;
	bh=Q5L8jXZkEuKPRRH4evjY1jQ3Ssm8GlgXsz+EL+y3LWE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PdTfEymdTFvz7lQfKj+E/rkD6dqQ8hEMtzUvkl4eui7mQwMU7bUD/lV1ksZfeJdn/nvGuto1XhVm86A9OJWy0VIjiAfDMSf3ZyJKXfYKrSgFW7Podv1AueB2ZN+wvauumhr492VTfrbpmLIy3ybk9pYTRBJ7iRD3blrRoxuLhRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqc4k9xf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqc4k9xf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13DA01F00A3D;
	Tue, 21 Jul 2026 18:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784658381;
	bh=oooanRceJQzIxh5KK5RDrxpR9VKaAnVoPG4PFRbbjXM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kqc4k9xfhrUL0CTRTex5YJqGBB2hdN2HBWBn79rgBwrRCCrPS4TBh1JUCYtxJ/rv+
	 bGjnWlOTBGIcbmzWWCzTZSuIh7PjRKy148GvANZwwTjhCcV/4TURWPrYIW1xayhq2A
	 3baTWBYR/VIUNqon28oHcmpqxQf4yaDJNnJ8+q7PY2Y9RU20IDWZpmTBOglFxFxzrw
	 g1xu+gB8o5wufgzM+A+vp/z3IHbp38UmIaMoPzth03fZeEyUMnZ+M/UZ5vNaC0yLHs
	 53tnj4Y9i20jfR7LNYYMJmtevvvuaqO3WSPQ0UB4ErR9jHcHdOj4zYlb3Is9NM02lw
	 9rTm71ay5Yo9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/10] dt-bindings: display: rockchip: dw-dp: Fix
 sound DAI cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-synopsys-dw-dp-improvements-v4-9-f0f4a4ede712@collabora.com>
References: <20260721-synopsys-dw-dp-improvements-v4-0-f0f4a4ede712@collabora.com>
 <20260721-synopsys-dw-dp-improvements-v4-9-f0f4a4ede712@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 18:26:20 +0000
Message-Id: <20260721182621.13DA01F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unconditional ABI breakage of `#sound-dai-cells` in Device Tree =
binding.
--

--- Patch [9]: [PATCH v4 09/10] dt-bindings: display: rockchip: dw-dp: Fix =
sound DAI cells ---
commit 3829785f7403edd4d5c1e524c76b4c78f5cf26da
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

dt-bindings: display: rockchip: dw-dp: Fix sound DAI cells

This commit updates the rockchip dw-dp binding to change #sound-dai-cells
from 0 to 1, allowing the selection between I2S and S/PDIF. The example is
also updated to reflect this new required cell count.

> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,=
dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw=
-dp.yaml
> index 2b0d9e23e9432..c4f8959dd65da 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.y=
aml
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.y=
aml
[ ... ]
> @@ -83,7 +83,8 @@ properties:
>      maxItems: 1
> =20
>    "#sound-dai-cells":
> -    const: 0
> +    const: 1
> +    description: 0 for I2S, 1 for S/PDIF

[Severity: Medium]
Will this unconditional constraint change cause a regression by breaking
Device Tree ABI backward compatibility?

Existing in-tree device trees such as
arch/arm64/boot/dts/rockchip/rk3588-base.dtsi still define the property with
0 cells:

arch/arm64/boot/dts/rockchip/rk3588-base.dtsi:dp0 {
	...
	resets =3D <&cru SRST_DP0>;
	#sound-dai-cells =3D <0>;
	status =3D "disabled";
}

A similar definition exists in
arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi for dp1.

Could this update lead to immediate dtbs_check validation failures and break
audio initialization for users booting with older, previously valid DTBs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-synopsys-d=
w-dp-improvements-v4-0-f0f4a4ede712@collabora.com?part=3D9

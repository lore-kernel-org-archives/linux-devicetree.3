Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944366;
	b=sukUOeutA1F4l1Ay/A89E/RV+0JiugduDPU5Mo0eSiSNX4gDe/7WUgtkJvRQeyKWfRas
	 kh+gjd3qYBpjOKubtBO5apRexKIi7UrbxhxTvAaaprPEM5ygvbQFfoYTeUlinfHfmgEcD
	 tfESBNYEUk8VJ151sWWTKTS2w7DEeScH/GY2Q5VRZIIfZ2c0kZPx5GMAaOIFpJWdMaiUf
	 Wukjkh2XMlzHmwKjQ/6rjxe9NKfpjbPOIYpiFx2ayA6gf3onBPcOhmZZc1GlcfIMl39pN
	 09Kk8Bx5Cv+KWQsv8VFzpjY/YiKerMwwjASPKYBfCDpYCvHvRxRI5lDLhe974eRR2Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944366;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rj4/yU3Ef/aUBJSMi8YMnFqrbci/YNnHa0upd+SN5Z0=;
	b=utM9+lUSjmaYGQbZXP4tQYHWWxJ4W3wFTpy8xzDTvN4QE+GvsVM6Sm4mi8hFUlRFs7uf
	 iRu3tHBfwQ4EYhHo637PAExhZEK8prDSzzaZWq2uKz3wF+5CPVSTrbCjEg/lekpCpyvp8
	 2ECAdRtDu5sF++schCDs2/9Vyyyy8jIPoN5OZ37CSq7CdoBZW1uRYqc+cO5Wk3692t7p2
	 telbA4nhpGnyrHiIfOTq5vHC7p76g8VWvk6Tu9FBrV91lftClDUkTKqnu0Fop81Xfji5D
	 /kgC+rL7J7AWqhoW/bOB+rYts5pqAPQB0ayT+oIDsTT+PFR8EHXdtHsm18EbWFY9R6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hT9/RG+r";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04206606A32A
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hT9/RG+r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00CCD1F000C4;
	Tue, 17 Nov 2026 19:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794944365;
	bh=rj4/yU3Ef/aUBJSMi8YMnFqrbci/YNnHa0upd+SN5Z0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hT9/RG+rRpEkT4IozMC9bRCUWb1qS6zd0zGYzfgDt+wCgo0mUHwzwqyfDC28ATCO+
	 s8hhus94B7ztUYtOLqnNC6QczFLVS0pxPVfCA3QVyXO6V9RFdC78s5GfhDI2VWybVJ
	 qW3Xf1lVp8PJRADcEHqMnRGQ/xlcvo4MeDW5aSL0o3c2BYZyc8ki64SMrgNns/22I3
	 2T/ZQSKR4s5YgfghsicCsVGq0cpyAQZlvKzZ1yYK5Rln0mreLDZucosu6eP/SynHx+
	 pjSW3YVQRxpZN8MZXMwAr9tg6IuuU8XItLnkEafEnPz3Cs7KXMtXBEvyltcPvIqiUM
	 Qk2kc1TPV0pNw==
Message-ID: <sashiko-outbox-219508@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/10] dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl:
 Add hdmi-phy child node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20261117-meson-drm-create-hdmitx-phy-v1-3-9e0ac931381c@aliel.fr>
References: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
 <20261117-meson-drm-create-hdmitx-phy-v1-3-9e0ac931381c@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 19:39:24 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: soc: amlogic: unwieldy conditionals in
  meson-gx-hhi-sysctrl.yaml
--

commit 2922cae8c47e87d6a0fd71e91e4a07690e4d0f66
Author: Ronald Claveau <linux-kernel-dev@aliel.fr>

dt-bindings: soc: amlogic: meson-gx-hhi-sysctrl: Add hdmi-phy child node

This commit adds an optional hdmi-phy child node to the Amlogic Meson
system controller binding for amlogic,meson-gx-hhi-sysctrl and forbids it
on the other system controller variants.

> diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-=
gx-hhi-sysctrl.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic=
,meson-gx-hhi-sysctrl.yaml
> index 285edac4c0821..97e47592aff2e 100644
> --- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-=
sysctrl.yaml
> +++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-=
sysctrl.yaml
> @@ -36,6 +36,9 @@ properties:
>    phy:
>      type: object
> =20
> +  hdmi-phy:
> +    $ref: /schemas/phy/amlogic,meson-hdmi-tx-phy.yaml
> +
>  allOf:
>    - if:
>        properties:
> @@ -50,6 +53,7 @@ allOf:
> =20
>          pinctrl: false
>          phy: false
> +        hdmi-phy: false
> =20
>    - if:
>        properties:
> @@ -80,6 +84,7 @@ allOf:
> =20
>          power-controller: false
>          phy: false
> +        hdmi-phy: false
> =20
>    - if:
>        properties:
> @@ -104,6 +109,7 @@ allOf:
>            oneOf:
>              - $ref: /schemas/phy/amlogic,g12a-mipi-dphy-analog.yaml
>              - $ref: /schemas/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
> +        hdmi-phy: false

[Severity: Low]
Would it make sense to split these system controller variants into
separate schema documents instead of adding more per-compatible
exclusions here?

This schema covers five system controller compatibles across different SoC
families and register blocks (HHI and AO), where nearly every child node
property (clock-controller, power-controller, pinctrl, phy, and now
hdmi-phy) differs across variants and has to be overridden or forbidden in
overlapping allOf if-then branches.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-meson-drm-=
create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr?part=3D3

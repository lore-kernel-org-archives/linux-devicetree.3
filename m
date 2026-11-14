Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645907;
	b=saCvoUfXXgp0FIQPJ6pvaj5whuhCphz2SgsO2PqC8hGt1nK6Nxr50OHSOWyQHlfCwx0D
	 Ydtp+fghx20c1SdC3Om9k4/4t67YurQuJISXUAIpA3jPsO0i9HuxIVAyRDhxpDUhzNH7i
	 2Z1DeOd9P/j7Lc8eDAyd9FZQjFFA+CQ9A703gsTWiGyWk3mjwN9YgVkVr6RkJbLdui5CR
	 suToSLWiKdY5XvaTmgcG9vN4qzs0qsrS4NKDWkIv0lE2yd7mjzv/FITPzaFsXvnOa7tiD
	 ooPQ++sGXO8Cenla9BUa7VZuSmeDnVMNHdfzuKC8hkUvKUhjN8cNJDCrCM9HyvWJ8SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645907;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8B9my0OFzT6Ncn5bL3LLFhB3IzbJhUeIMAh6jWwaGL0=;
	b=jEh15yHU7vgnDiXNR2xnQtuRXeFqRCiM0lL264gLWmJti8fxR9kQcBPWHQoReenee3ai
	 nS6WHyIyg3sK1sAnH+mmA+/QnHNQK5YoG4dosxpVgJejyvARbEN98ixts/aRsDzIRUtHr
	 IZjT0bPyztqcHwpWdLZXrlzfY/XisX9hAVJ3x4GMoiLw9GzNJN1Mgb1nEfEr3suJk3Ho/
	 ef9hUTvBg342hR9jTL3+SKVCsY8S9WAPu9C6XoOvVmEAZNJYwlwOYAjNd40ypExysxsYg
	 uftBF5svG/SVLpVeJPG5atJDyDAGLycvYEVOvBm6ynjgbN8yu1RVFRUtMQb2uSXpJEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IHonj8FT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B9D606A323
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 08:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IHonj8FT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31CBD1F000C4;
	Sat, 14 Nov 2026 08:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794645906;
	bh=8B9my0OFzT6Ncn5bL3LLFhB3IzbJhUeIMAh6jWwaGL0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IHonj8FTjOMiU8sDaXXktfmVdbh4bxibri9GucYCIleBS9hiPwCxJCpnmWPQak2Iv
	 Qq49632v9SQVEr+wMO95ftoTXZvwuCtTgYC3auvC2CBGP9ClbJP5TIqxAbMbYMRtXH
	 m3OAscOPpRhLAUwnxa5FSa6uol5R55B39eEotWJsEswKiKlnETVgaw+lqRuPDQ7ak8
	 U46UBELUt/jcHOgXqVtbjHvrk5tszoqc4z6/7svm09K+Ej1RJ91E+1ElOtd6EatSWa
	 +LMWGO4e7HGWwXPkDx+0262uCKtck6xgMXK4Sf9xKcZQ0D7RBDDGjBUk8W6FS0QGTq
	 nTjQPSVOcJY0Q==
Message-ID: <sashiko-outbox-214291@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/4] dt-bindings: phy: Add rockchip,rk3568-edp-phy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261114083339.600986-2-damon.ding@rock-chips.com>
References: <20261114083339.600986-1-damon.ding@rock-chips.com>
 <20261114083339.600986-2-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 08:45:05 +0000
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
- [Medium] dt-bindings: soc: rockchip: leftover clocks in
  rk3568-edp-phy-grf schema
--

commit 1917cbd8f96871d64c923d3ef4f97c3ee79b14dc
Author: Damon Ding <damon.ding@rock-chips.com>

dt-bindings: phy: Add rockchip,rk3568-edp-phy

This commit adds Device Tree binding schemas for the RK3568 eDP
transmitter PHY and its parent eDP PHY GRF syscon.

> diff --git a/Documentation/devicetree/bindings/soc/rockchip/rockchip,rk35=
68-edp-phy-grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/rockch=
ip,rk3568-edp-phy-grf.yaml
> new file mode 100644
> index 0000000000000..852420798f06a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/rockchip/rockchip,rk3568-edp-=
phy-grf.yaml

[ ... ]

> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/phy/rockchip,rk3568-edp-phy.yaml#
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3568-cru.h>
> +
> +    soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      edp_phy_grf: syscon@fdcb0000 {
> +        compatible =3D "rockchip,rk3568-edp-phy-grf", "syscon", "simple-=
mfd";
> +        reg =3D <0x0 0xfdcb0000 0x0 0x8000>;
> +        clocks =3D <&cru PCLK_EDPPHY_GRF>;
> +        ranges =3D <0x0 0x0 0xfdcb0000 0x100>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +
> +        edp_phy: phy@0 {
> +          compatible =3D "rockchip,rk3568-edp-phy";
> +          reg =3D <0x0 0x100>;
> +          clocks =3D <&pmucru XIN_OSC0_EDPPHY_G>, <&cru PCLK_EDPPHY_GRF>;
> +          clock-names =3D "ref", "apb";
> +          #phy-cells =3D <0>;
> +        };
> +      };
> +    };

[Severity: Medium]
Should clocks be dropped from the parent rockchip,rk3568-edp-phy-grf
schema and example?

The PCLK_EDPPHY_GRF APB clock is now claimed by the child
rockchip,rk3568-edp-phy node, so keeping clocks required on the parent
syscon node either fails dtbs_check when PCLK_EDPPHY_GRF is placed only
on the child PHY node or forces device trees to duplicate the clock on
both nodes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114083339.6009=
86-1-damon.ding@rock-chips.com?part=3D1

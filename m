Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297672;
	b=zFSPqA8HROwzlLKiRMN9faEwn/fbybGP/4/dlwNspKMbEN+uViS8HpWRQU3m0FGPj3aU
	 FdeCrzUqhcmwSmE58BpHdM+EMO2DusfDsYjplLsZI/DGoaSHtaSy0Zpdq27M+nKPW67uv
	 p+qwoLGf8CR22os6ahkEBdjEqwo6WcWuXyTjbpHKeQAajlnbjCPqS6E+INz4CGXxjBStk
	 PW5BAkwJq5cYwi+NnCrgFBec2JBlyCNj3DyfBKpEgIViCCHbKrcUxvb9Z/2KczORdhSnO
	 mzyYAGtQtidzCTu9OzrA1YOiETvZeYggxC8ChDJsXEU/jvN+ErVD5KfXgq3QHfg065w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297672;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yddDVzwr2bKs1Uh96wp294uqm9xQ9ZvBG0Pxzm8Ku8c=;
	b=RGynTiBpZlcM453y53YcLv/WHM4pAgO+diZQYw06zOfguXduK+FxEujx0KeX6U6D9bHo
	 7uvQZPHkYn9PPHpRqVRlNzT5xzrMs6oyMXbNyGzyz+yUo5JkI2Cf6GUF4adk8OFJvgs8d
	 kKpxwQkJDlcB1lXSLIVw3jYRK3WMWEu0KWP/sYZCDt+b25Yf8JmG9CIJHzfFPh+YUMmqO
	 A9uIM8JUWGSddmcYCBtDuNSpdx4yXJhkJukuf+4jWRFzyOdG7fNJsQ+o+KBxEcnranMPW
	 jj1Qy1Q6Vl5JxM+ir+LeL5XgTS7Hg2rXC+r9C5PKgLjrs7FReWkNC4USxy9MXIVxzng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hRrphewM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97654606A735
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hRrphewM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32201F0089F;
	Tue, 10 Nov 2026 08:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794297672;
	bh=yddDVzwr2bKs1Uh96wp294uqm9xQ9ZvBG0Pxzm8Ku8c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hRrphewMQwfhuSq8Q7VejqyYpCQrIKrihU/ONP6ZLW9f65tAp9e+uGJoZh/6y7NOR
	 QWLYSkdXT5aXOKoSbwWeTAIjOOZO1+kB3AbJs34Oohp0U25r++8R4LOViAK3mvjk3+
	 wCPcXGzYw2zn4yGLejo1efe2SqH6pRHsJFg6GuOdv8UYUSag3XdlCkAFwYl8Lv1kAW
	 TD6bjwq26Hj0drL0for2/BawEoKrcxrm+0avrkadm01ZXaDS5061+SNN0tYCsYO6MU
	 M8J6qK1JdfoMqO6ZXT9swXlyBDyIwWBJ6O31qVED7/W+RqZru70MsNmujjYoK5GTu1
	 s44Ram9emNkAg==
Message-ID: <sashiko-outbox-206554@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: phy: Add rockchip,rk3568-edp-phy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261110074533.4052196-2-damon.ding@rock-chips.com>
References: <20261110074533.4052196-1-damon.ding@rock-chips.com>
 <20261110074533.4052196-2-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 08:01:11 +0000
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

commit 9b91012944140ff14ec2e2563f712e212d1da630
Author: Damon Ding <damon.ding@rock-chips.com>

dt-bindings: phy: Add rockchip,rk3568-edp-phy

This commit adds Device Tree binding schemas for the RK3568 eDP
transmitter PHY and its parent eDP PHY GRF syscon node.

> diff --git a/Documentation/devicetree/bindings/soc/rockchip/rockchip,rk35=
68-edp-phy-grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/rockch=
ip,rk3568-edp-phy-grf.yaml
> new file mode 100644
> index 0000000000000..852420798f06a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/rockchip/rockchip,rk3568-edp-=
phy-grf.yaml
> @@ -0,0 +1,80 @@

[ ... ]

> +properties:
> +  compatible:
> +    items:
> +      - const: rockchip,rk3568-edp-phy-grf
> +      - const: syscon
> +      - const: simple-mfd
> +
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
Should clocks be dropped from properties, required, and the parent
syscon@fdcb0000 example node in rockchip,rk3568-edp-phy-grf.yaml?

The child rockchip,rk3568-edp-phy schema now owns and requires the apb
clock (PCLK_EDPPHY_GRF).  Requiring clocks on the parent syscon node as
well causes dtbs_check failures unless device trees duplicate
PCLK_EDPPHY_GRF on both the parent syscon and the child PHY node.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110074533.4052=
196-1-damon.ding@rock-chips.com?part=3D1

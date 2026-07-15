Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C4441F5CC
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 19:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784142900; cv=none; b=jpP4ybHRNHrSlFR4pk5m5KQx2XynkxMmcWIlvgFSiriHROGIjAC7kDX3GO5mCgeo7GrjP6RL+8c96xYyG4wdqOUepMEA+dOt9RGLrKbFPcA8nbXd90Tb4weyYbs4GiskiIBreffzGYrDyOYL17PRgaTtevUTOokYzXM0rEXOncs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784142900; c=relaxed/simple;
	bh=v6+sPmj6j87UE5DXs/vW5i1DRgIbX3JYvBPrFx9bkWM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m+xdv+mTXAfK/FhO7E7BxcE5b6Zq2zSKFKQnhDX2DG9tG6k7tIThceqUKeyNoOR8lOwj+9vUY8X270B4DnCKm8n33KVc9Ybm5vFrX7pHWy5S3aZ4vWYmngapTJ9aJu07WFLKoPQlZmVc7HJmBO1bdzpeh47VFggRxs+5b7vY68U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4OeMkIb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4OeMkIb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515E01F00A3E;
	Wed, 15 Jul 2026 19:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784142891;
	bh=v7BF6GZmb91UEuWJ/xI+kq2WxZfvSb+FYhihjLxNaak=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B4OeMkIbry92IjkircW3Mp8m9DA8mHFZFrG7KyvYmnOCyqYwQzayx/1l+0Ym5j3cH
	 JaTDpQXbVkHZS/rfAd5f9eoYqHe+6WNJxIP48Swuvmt1gMiU8NUSTItgM3b6cs9iI1
	 4Uiu4uN4sQgOGhSEaU+UoKbChNX00zPWQTX6PVryBnanFDpCYQF9zUrMt9kY75HCC/
	 3LnK1Fp3bRzUHUf/7KJg3Puiwpxu1GeYmBWShCZldXnUcTKBFFnVU3Ki8cT26syxPZ
	 TsJvuT9Xr4BjAqaV0O05+czhs3zIvVenkvDyLdanLzSE6E0RyNrYslq7gUM3Tuwjjx
	 YvjW6wgk1v32w==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 04/10] dt-bindings: net: pcs: add
 rockchip,rk3568-xpcs binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260714191341.690906-5-coiaprant@gmail.com>
References: <20260714191341.690906-1-coiaprant@gmail.com>
 <20260714191341.690906-5-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 19:14:50 +0000
Message-Id: <20260715191451.515E01F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The device tree example uses a 64-bit `reg` format that fails `dt_b=
inding_check` validation due to a mismatch with the default `#address-cells=
`.
- [Low] The device tree example fails to include the header for `PHY_TYPE_S=
GMII`, causing a compilation error during `dt_binding_check`.
--

--- Patch [4]: [RFC PATCH 04/10] dt-bindings: net: pcs: add rockchip,rk3568=
-xpcs binding ---
commit 2d8d4cd3ced5ab201d6610a9b6b870ceb6ceaed5
Author: Coia Prant <coiaprant@gmail.com>

dt-bindings: net: pcs: add rockchip,rk3568-xpcs binding

This commit adds device tree binding documentation for the Synopsys DesignW=
are
XPCS integrated on the Rockchip RK3568 SoC, supporting 1000BASE-X, SGMII,
and QSGMII modes with four MII ports.

> diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.ya=
ml b/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
> new file mode 100644
> index 0000000000000..14fadf67c793a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml

[ ... ]

> +examples:
> +  - |
> +    #include <dt-bindings/clock/rk3568-cru.h>
> +    #include <dt-bindings/power/rk3568-power.h>
> +
> +    pcs@fda00000 {
> +      compatible =3D "rockchip,rk3568-xpcs";
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +      reg =3D <0x0 0xfda00000 0x0 0x200000>;

[Severity: Low]
Does this 64-bit register format fail dt_binding_check validation?

The example is extracted into a dummy root node with default
#address-cells =3D <1> and #size-cells =3D <1>. This means the 4 cells here=
 will
be parsed as two items, which violates the maxItems: 1 constraint defined
in the schema for the reg property.

> +      clocks =3D <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
> +      clock-names =3D "csr", "eee";
> +      phys =3D <&combphy2 PHY_TYPE_SGMII>;

[Severity: Low]
Will this fail to compile during dt_binding_check?

The example uses the PHY_TYPE_SGMII macro, but the required
<dt-bindings/phy/phy.h> header isn't included in the example.

> +      phy-names =3D "serdes";
> +      power-domains =3D <&power RK3568_PD_PIPE>;
> +
> +      pcs-mii@0 {
> +        reg =3D <0>;
> +      };
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714191341.6909=
06-1-coiaprant@gmail.com?part=3D4

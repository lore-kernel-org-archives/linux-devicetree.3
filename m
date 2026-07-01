Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA3E480DF4
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908877; cv=none; b=Cb8qhWitBAFg0yoeiVXDAB4UPYS7eO91dfS3lWBc6lnCGJX9xG6MZu+85zLnoCgGairD57dBRxb12bc85BgLVDxhzSRnQqkWvHfj8Ha+4Rn1AltT4zQ9bCINTfjnWCz6L8T601AdDqzRysLJlswpnTkIoa1z4CGV4+p3XFwcPds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908877; c=relaxed/simple;
	bh=uH+tHAu1oMsIrFclpVW6q5vgBGBh0i/iN6YPqW16YYo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pvKYjdHnFc2NIYpU85lmR8LJWFi3jkwA4UlZpZ14Ackk3y93zwyI2VZPjJU3DpaN4vFoZ2NjHGknStHH6B9hQxva25oh9A0CLwAY3MtGDvw8agCSnzoKluxenMFz54yXPW9eiqnt6O4xg41yjmAYvB0hkU2tBsOXLLbY1p1PpSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+QFUUL9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+QFUUL9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D031B1F000E9;
	Wed,  1 Jul 2026 12:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782908876;
	bh=dpF9Ah1JqyA2hm8UXbH4GPZaMqGAhXDZ4O8SylEiMng=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k+QFUUL9JXDqsqKPuAfY73B6jmndK1V70+CX+wbbOx/fnUG2a3kMHKi0/YVgv3lGc
	 kykBN5IdWMHa7DZa4vTFxUovhg82L7M8HlumInPcJJIf1AM5asCAW2UcpuP0fDr5Bp
	 prZMHpOzVi1ZrADzGutugmmu9uJTLb9HnGbfvpdhUxcaIslsyLUO8/8atK/ri18mZ8
	 AmtzHIJ1iyQGaxaeoFRJuAGmo/ZdrhFm8sDKkG6gBh12Kgj/UQRtUqQgmLex7ZYnfq
	 3YN88/QiP/Q5ar7IV7hXqqRlElX+HNXFVRi/7f5ss6UUELHgl42sN7Vug11iAgEpOW
	 UAN2HiMu9kHfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: phy: Document MT8195 and MT8196
 DisplayPort PHYs
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20260701122008.19509-2-angelogioacchino.delregno@collabora.com>
References: <20260701122008.19509-1-angelogioacchino.delregno@collabora.com>
 <20260701122008.19509-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 12:27:55 +0000
Message-Id: <20260701122755.D031B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree example will fail `make dt_binding_check` validatio=
n due to a 64-bit `reg` property at the root level without `#address-cells =
=3D <2>` and `#size-cells =3D <2>`.
--

commit c7b476cde050e045aaa56bae9dd7ecc7b3d34ced
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
dt-bindings: phy: Document MT8195 and MT8196 DisplayPort PHYs

This adds bindings for the DisplayPort and Embedded DisplayPort PHYs found =
in
the MediaTek MT8195 and MT8196 SoCs. The PHY supports varying impedance
calibrations for the signals to reach an optimal EYE signal pattern.

> diff --git a/Documentation/devicetree/bindings/phy/mediatek,mt8195-dp-phy=
.yaml b/Documentation/devicetree/bindings/phy/mediatek,mt8195-dp-phy.yaml
> new file mode 100644
> index 0000000000000..5847963a7085e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/mediatek,mt8195-dp-phy.yaml

[ ... ]

> +examples:
> +  - |
> +    phy@1c500000 {
> +        compatible =3D "mediatek,mt8195-dp-phy";
> +        reg =3D <0 0x1c500000 0 0x2000>;

[Severity: Low]
Looking at the examples section in mediatek,mt8195-dp-phy.yaml, will this
example pass make dt_binding_check validation? The reg property contains 4
cells, but since the example node is at the root level without a parent node
explicitly defining #address-cells =3D <2> and #size-cells =3D <2>, the dum=
my
root node defaults to 1 for both. This causes the 4 cells to be parsed as 2
separate items, which violates the schema's maxItems: 1 constraint.

> +        #phy-cells =3D <0>;
> +        nvmem-cells =3D <&edp_glb_bias_trim>, <&edp_clktx_impsel>,
> +                      <&edp_imp_ln0_pmos>, <&edp_imp_ln0_nmos>,
> +                      <&edp_imp_ln1_pmos>, <&edp_imp_ln1_nmos>,
> +                      <&edp_imp_ln2_pmos>, <&edp_imp_ln2_nmos>,
> +                      <&edp_imp_ln3_pmos>, <&edp_imp_ln3_nmos>;
> +        nvmem-cell-names =3D "rbias-trim", "impedance-txclk",
> +                           "impedance-lane0p", "impedance-lane0n",
> +                           "impedance-lane1p", "impedance-lane1n",
> +                           "impedance-lane2p", "impedance-lane2n",
> +                           "impedance-lane3p", "impedance-lane3n";
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701122008.1950=
9-1-angelogioacchino.delregno@collabora.com?part=3D1

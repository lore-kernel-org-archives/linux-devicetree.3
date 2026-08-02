Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D348265629
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 14:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785680741; cv=none; b=a2hFcn8D5S1NdGwBbAFtYS30cjKDyi4m8a2jSryjfg7FLmoyTOZt1J8HpzQhc0vvMa+l39rqwmDl8Kh9hHAGbUDriYGdRdHYs3DRlxzHrP1DYOr/sjsYzaiGAf8lwOeimX8kZD9f7PW229ck1Rd3wAIJEVzwa/jLCv73NmJSIgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785680741; c=relaxed/simple;
	bh=xrjnG0KS3TEU6bjQhmy9S4BHtjr8pa2scQaU6sIHcLk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hOX5jLskACAwWwCA80DlyA7YFyXuyUhaj2lAqnYXWdnvkj3nF5pjpjAQjiEqrBylYHVd+mdfhn0vhSdNE5nUOsegjrs9+OKR+3/+drx5G+AefoRI+HVHrdxSnN0WV/W9T3QJ6I3xjL5EOW6RX7+ahncIVoHaNmCZK7Tc9BoJyzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUrudIlY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUrudIlY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C9F31F00A3D;
	Sun,  2 Aug 2026 14:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785680740;
	bh=SmqZW0ePrOksqVVsyWw6+qGX0mB9t950hRwdl2vqUPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mUrudIlYhDIRI8O7+DtKWCjKoJo4/kAOy6Q1Fysx9lpBM/+yt0u/wMERTXMbv/hOO
	 RQhipTQ1ke3y+6Xac6dRWMoUf11Mg363JtqCPKLbwszX0CPivfWVwIgNpExra+DD3q
	 YfvXGVWehKJp0u3xODgN7y7j1cAYfS4mvb2iJnSaorswZUEV+6JX/qwfXYbWPKoY0Q
	 /kBcSA7ThxIRA3g7NGXZWW2UoeLI+3tVGhKlR6nWhMLJwbRV50VyAq5SC/XQuuLQEV
	 uUS8PLqXSXAYsTXqc0O8SISnyqNkbdkS50GsfYNxhkAzyLCk072EaaXe2jj0RWa75j
	 me64j7NRqYyaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/10] dt-bindings: net: pcs: add
 rockchip,rk3568-xpcs binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org
In-Reply-To: <20260801142244.679437-6-coiaprant@gmail.com>
References: <20260801142244.679437-2-coiaprant@gmail.com>
 <20260801142244.679437-6-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 14:25:38 +0000
Message-Id: <20260802142539.3C9F31F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing XPCS initialization for Rockchip DWMAC (Hardware Initializ=
ation Failure).
- [Low] Invalid use of 'minimum' and 'maximum' constraints on the 'reg' pro=
perty in the subnode.
--

--- Patch [4]: [PATCH v2 04/10] dt-bindings: net: pcs: add rockchip,rk3568-=
xpcs binding ---
commit 3427e61df71bfcc8fb661a8f120af0f4c141f21b
Author: Coia Prant <coiaprant@gmail.com>

dt-bindings: net: pcs: add rockchip,rk3568-xpcs binding

Add device tree binding documentation for the Synopsys DesignWare
XPCS integrated on the Rockchip RK3568 SoC.

> diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.ya=
ml b/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
[ ... ]
> +patternProperties:
> +  "^pcs-mii@[0-3]$":
> +    type: object
> +    description: |
> +      One of the four MII ports of the XPCS.
> +      The port number is specified by the reg property (0..3).
> +      The port is linked to an Ethernet MAC controller via the
> +      pcs-handle property in the MAC's device tree node.

[Severity: High]
How is the pcs-handle property parsed by the Rockchip driver in practice?

With the generic pcs-handle parsing logic removed from stmmac_pcs_setup() in
favor of the platform-specific pcs_init callback:

drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c:stmmac_pcs_setup() {
	if (!priv->plat->pcs_init)
		return 0;

	ret =3D priv->plat->pcs_init(priv);
}

Does the Rockchip DWMAC driver provide this callback? If not, it seems
stmmac_pcs_setup() will silently return 0 without parsing the pcs-handle,
leaving the XPCS uninitialized and breaking the SGMII/QSGMII support descri=
bed
here.

> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 3

[Severity: Low]
Does applying scalar numeric constraints like minimum and maximum directly =
to
the reg property cause a meta-schema validation error during
make dt_binding_check?

In the dtschema core, reg evaluates to an array of integers rather than a
scalar, so strict JSON schema validation typically fails with an error that
minimum is not allowed for an array.=20

Could this be constrained as an array item instead, or omitted entirely in
favor of maxItems: 1 since the node name regex (^pcs-mii@[0-3]$) already
enforces the port number?

> +        description: |
> +          MII port number of PCS.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801142244.6794=
37-2-coiaprant@gmail.com?part=3D4

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DAD5650ED
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 15:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882035; cv=none; b=gLdEQsX9QJJJvwWzxIzo2m+xsMErwJFhkka9OOa1s9ojV2HNSJZ9ErsWlvNQYjv9gFwjhwUPNZYkIT2JTuFEYp5pqCJyjqX9d3IETayG6umnbISKBc8QUVMC65opgZ8TUaHo7suRlMvUnm4BojCU1wbGG0t4fr1TvbGwrdTxKis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882035; c=relaxed/simple;
	bh=l7XTSvBajGC+xhuGMf5aYT5qRiStG03yndKvvA4FkPU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CLC5M9HSxO7VDFls9AT0MLFWbdjpi3PVBXtBlv8M7yXW1yTLWH2Jrv0AiEI/cDkGHiTSojBMLUqocOqP7nWK3L1Fp8PMF2X+oB8YiKB8Tp2ibcRaPlo0GloLfz6cGPqWHmqnEVy/z8vsFt8iYQy5eu/bJxQkWj4c5EoET5ZY3nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0711D1F00A3A;
	Tue,  8 Sep 2026 15:40:25 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 05/10] arm64: dts: rockchip: rk3568: add
 XPCS and fixed-clock nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com, vkoul@kernel.org, conor+dt@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org
In-Reply-To: <20260907153713.2572547-7-coiaprant@gmail.com>
References: <20260907153713.2572547-2-coiaprant@gmail.com>
 <20260907153713.2572547-7-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 15:39:55 +0000
Message-Id: <20260908154026.0711D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Missing 'phy-names' and 'phys' properties in the XPCS node causes d=
tbs_check failures.
- [Low] The fixed-clock nodes use a deprecated naming convention.
--

commit 44bcecc3ab36daaafbcaa0b05c41e194b9da4c06
Author: Coia Prant <coiaprant@gmail.com>

arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes

This commit adds the XPCS device node and its pcs-mii sub-nodes to the RK35=
68
SoC device tree, along with two fixed-clock nodes for the GMAC reference
clocks. The XPCS node is disabled by default and meant to be enabled at the
board level.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3568.dtsi
> index 3bc653f027f1f..989e164c0eb39 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> @@ -110,6 +110,51 @@ sata0: sata@fc000000 {
>  		status =3D "disabled";
>  	};
> =20
> +	xpcs: pcs@fda00000 {
> +		compatible =3D "rockchip,rk3568-xpcs";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		reg =3D <0x0 0xfda00000 0x0 0x200000>;
> +		clocks =3D <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
> +		clock-names =3D "csr", "eee";
> +		power-domains =3D <&power RK3568_PD_PIPE>;
> +		status =3D "disabled";

[Severity: Low]
Will this cause make dtbs_check failures during kernel builds? The dt-schema
tool unconditionally validates all nodes against rockchip-dwxpcs.yaml,
including those with status =3D "disabled".

Because phys and phy-names are strictly required by the binding, omitting
them here in rk3568.dtsi breaks DT validation for all RK3568 boards that
include this file without explicitly providing these properties.

[ ... ]

> +	xpcs_gmac0_clk: xpcs-gmac0-clock {
> +		compatible =3D "fixed-clock";

[Severity: Low]
Could this node name trigger deprecation warnings during make dtbs_check?

The fixed-clock.yaml schema restricts valid node names to the pattern
^clock-([0-9]+|[a-z0-9-]+)$. Names outside this pattern, like
xpcs-gmac0-clock, fall under a legacy definition tagged as deprecated.

> +		clock-frequency =3D <125000000>;
> +		clock-output-names =3D "clk_gmac0_xpcs_mii";
> +		#clock-cells =3D <0>;
> +	};
> +
> +	xpcs_gmac1_clk: xpcs-gmac1-clock {
> +		compatible =3D "fixed-clock";

[Severity: Low]
Does this node name also trigger a deprecation warning for the same reason?

> +		clock-frequency =3D <125000000>;
> +		clock-output-names =3D "clk_gmac1_xpcs_mii";
> +		#clock-cells =3D <0>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907153713.2572=
547-2-coiaprant@gmail.com?part=3D5

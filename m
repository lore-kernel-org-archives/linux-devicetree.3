Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BFA485CF9
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 19:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789415066; cv=none; b=UU1tXhIkt/EKzOxwV58dRKE+81KxtSsUSA7PykJJW76+HF9ZNH6w2SutQ6kY5Yeh2YLvNnAo7jK5rs6p0aaK8WJyrQ3izu2F4ZjwhX5bs626s5aeboJEqnQCUcCJFf27y3T/l684RLuEaT7k9NHNnsuFj91dmp08brM4TQVPxC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789415066; c=relaxed/simple;
	bh=Ve6Nz5gRY2/c8sLjrklvkjwr1xs56qnYT4QKjlLWKK4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R+EGnDLxZ99c7MjpUwApA6ruUu0T4+4MBx9m+XHrSNpILlmk2+XHLTSYFVnKCFqtYsTetddXz2qVnP8V59+OtkGC0ihk7q2Ay474pUzn4v3oe6HGC33SihxwcIBwV6NtOv/tlzRJvax7kSZtUBxrbvDZ1ak5757neEOE3BNIc0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+olwNv7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+olwNv7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 979E11F00898;
	Mon, 14 Sep 2026 19:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789415063;
	bh=/ir94dy3AU1OanbTxeg78bmKUnOKTcIEX4RThMQ3HbM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b+olwNv7kQk8s5ajCpO5RtdWZ8rbmLjfpf8NkBS8PoK8qFp+NzhlQxV5lYNIMmTCH
	 NdHiGAB7v2vCf1+CfhnPxsqHRAHV9R5e2CrSb5n1fi2H1gf98cvxdLJEcwScyma6EL
	 3+AMbayay5qVGdBKiNR9ducA0UOdokb5rvf4QTJdXOfO/HAQLiOzic7d/5VxAVcJsX
	 y5oAKFyzZho/zmm02AFe5Mp3kI/QQCwJlOGghYJhQoNNWzOAzWpPOKNy2M0SaEruLa
	 m2J+7huT4DI5t01t/QG3VZYa4e12pgCPz2Q3mUDOSw6VfGiuGIDGDyYmuCfIwyH4Jm
	 vZpFj/Nk6eq+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 05/11] arm64: dts: rockchip: rk3568: add
 XPCS and fixed-clock nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: olteanv@gmail.com, vkoul@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260913185849.907479-6-coiaprant@gmail.com>
References: <20260913185849.907479-1-coiaprant@gmail.com>
 <20260913185849.907479-6-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 19:44:22 +0000
Message-Id: <20260914194422.979E11F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The `xpcs` node omits the `phys` and `phy-names` properties, which =
are unconditionally required by the DT binding schema.
- [Low] The `status` property is used in the `ethernet-pcs-mii@[0-3]` child=
 nodes, but it is not permitted by the `rockchip,rk3568-xpcs.yaml` schema.
--

commit 2dc66bd193ed0eb637b2ea9fc03e4b482b419260
Author: Coia Prant <coiaprant@gmail.com>

arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes

This commit adds the XPCS device node and its pcs-mii sub-nodes to the=20
RK3568 SoC device tree to support 1000BASE-X, SGMII, and QSGMII interfaces.=
=20
It also introduces two fixed-clock nodes providing the 125 MHz reference=20
clock for the GMACs.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3568.dtsi
> --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> @@ -110,6 +110,51 @@ sata0: sata@fc000000 {
>  		status =3D "disabled";
>  	};
> =20
> +	xpcs: ethernet-pcs@fda00000 {
> +		compatible =3D "rockchip,rk3568-xpcs";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		reg =3D <0x0 0xfda00000 0x0 0x200000>;
> +		clocks =3D <&cru PCLK_XPCS>, <&cru CLK_XPCS_EEE>;
> +		clock-names =3D "csr", "eee";
> +		power-domains =3D <&power RK3568_PD_PIPE>;
> +		status =3D "disabled";

[Severity: Low]
Does this node need to include the phys and phy-names properties?
The DT binding schema for rockchip,rk3568-xpcs unconditionally requires
these properties. Omitting them here might cause make dtbs_check to fail
with validation warnings on boards that do not override and populate this
node.

> +
> +		xpcs_mii0: ethernet-pcs-mii@0 {
> +			reg =3D <0>;
> +			status =3D "disabled";

[Severity: Low]
Is the status property permitted in these child nodes?
The schema for ethernet-pcs-mii@[0-3] uses additionalProperties: false
and restricts properties to just reg. Including status here will likely
trigger validation warnings during make dtbs_check.

> +		};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913185849.9074=
79-1-coiaprant@gmail.com?part=3D5

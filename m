Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792721417;
	b=Ow1ZSl3kisPVCUm8c+yYeRtuk9dsKLDivoUynLif3ahXrPKLDzQRyRKG03Hjkv+tD00M
	 hlGlEV66mtxhMETseQQKzq9w3oEwgc9VNwx+QUbdtWbncesCpnVoQOze8SPoPdVFT+paw
	 Wh9r4yAppJ2KtAAWMNv+DcAxlPln12iV/X7tWNE8v54SfTcaCBrW874Gs6sqQWPJP8GzO
	 1sDfY3MuV4/RmOXl3QYUQxKSJFBusVM5OCxVid9cPKvWeSakS2t2Y86U6hxgm3WQDs4v1
	 oVHMdXE65HLwqU4GVOYE9nvbunPT4gUNqjRkr5MzI1riSAPA2RbgahND+gvy2FVglFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792721417;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qi2ihPYoUvPtJBuERgX+xBdHcUtYGaxGLU5D/XX4aaA=;
	b=HyxYDE5MBicGlwwXtlyZov2CD3rWSF/xgM1OpTpZcWJTG5lhFb2JGGoNcqmV27S2BUdd
	 YjIcq4+AtuQrtibQwkCRgrHFu8lbZffEhiGWz0VznSyPXmUQlVxi66tkAEzDcPjgk+MSU
	 xbQpI1q6j6xqslwVNlWtxwI9EsO3dLuHvDmpL+ltOt/5jx6Y3a9yZlTNqkBJyPgHYSp7N
	 iomaQo1lA7y68vl1SuDQLAG3Jh79uu65S0rOyoVMxSn7fsvRC65mCawuEK37gvLtHexCX
	 BXwhTJIXqo+/9jgHdIHlEpGK/KdOGmlgYSk0QN1LEXICA1A7AzawcPKL+xsJ5jyOLOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RbKYUx72;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF179606A319
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 02:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RbKYUx72
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B621F01825;
	Fri, 23 Oct 2026 02:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792721416;
	bh=qi2ihPYoUvPtJBuERgX+xBdHcUtYGaxGLU5D/XX4aaA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RbKYUx72YOdT/EhGTitbhui0yfZ850nu6EcA05lg915qXku+vtauLDVvHQhpNEF+P
	 FUtpY125tml5ZUhgXakBNqFAs422yRYGcCAeNAwS6lFQPSxCmYoGEwlZv5NtQLC2fa
	 b6Jdpsi9gXoJZNgst1P/QZQ0z/Sl6j1lVJOc3E6mNi3XcdjXn6Yh9KJF4fdTg2kln4
	 md4Iz9dujkWWMBFkC04UiJY2cX4pRzIgqZLJJVMAowU4M13SdA8fI7VWzZAUGc+RoE
	 Rb1fYAEe9knp/JhhWKEdYi0mBEvZmahq6y5bwTAGYtQE/05LLekDYqJO5uj3TV5jar
	 kbIBR8bkhtmIw==
Message-ID: <sashiko-outbox-182213@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/7] riscv: dts: ultrarisc: Add initial device tree
 for UltraRISC DP1000
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xincheng Ji" <jixincheng@ultrarisc.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261023-ultrarisc-dts-v5-5-af79dbd6ccec@ultrarisc.com>
References: <20261023-ultrarisc-dts-v5-0-af79dbd6ccec@ultrarisc.com>
 <20261023-ultrarisc-dts-v5-5-af79dbd6ccec@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 02:10:15 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] riscv: dts: ultrarisc: use interrupt-controller node name for plic
--

commit 1a3ff8774c13bffe4745b26609b00045901e6bc4
Author: Jia Wang <wangjia@ultrarisc.com>

riscv: dts: ultrarisc: Add initial device tree for UltraRISC DP1000

This commit adds the base device tree for the UltraRISC DP1000 SoC,
describing its eight CP100 CPU cores, cache topology, and core peripherals.

> diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi b/arch/riscv/boot/=
dts/ultrarisc/dp1000.dtsi
> new file mode 100644
> index 0000000000000..220e000a16989
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000.dtsi
> @@ -0,0 +1,865 @@

[ ... ]

> +	soc {
> +		compatible =3D "simple-bus";
> +		ranges;
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +
> +		clint: clint@8000000 {
> +			compatible =3D "ultrarisc,dp1000-clint", "sifive,clint0";
> +			reg =3D <0x0 0x8000000 0x0 0x100000>;
> +			interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_intc 7>,
> +					      <&cpu1_intc 3>, <&cpu1_intc 7>,
> +					      <&cpu2_intc 3>, <&cpu2_intc 7>,
> +					      <&cpu3_intc 3>, <&cpu3_intc 7>,
> +					      <&cpu4_intc 3>, <&cpu4_intc 7>,
> +					      <&cpu5_intc 3>, <&cpu5_intc 7>,
> +					      <&cpu6_intc 3>, <&cpu6_intc 7>,
> +					      <&cpu7_intc 3>, <&cpu7_intc 7>;
> +		};
> +
> +		plic: plic@9000000 {
> +			compatible =3D "ultrarisc,dp1000-plic", "ultrarisc,cp100-plic";
> +			reg =3D <0x0 0x9000000 0x0 0x4000000>;
> +			#interrupt-cells =3D <1>;
> +			#address-cells =3D <0>;
> +			interrupt-controller;

[Severity: Low]
Should the plic node in arch/riscv/boot/dts/ultrarisc/dp1000.dtsi be named
interrupt-controller@9000000 instead of plic@9000000?

Because this node has the interrupt-controller property, dtschema's
interrupt-controller.yaml and
Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.ya=
ml
require the node name to match interrupt-controller@<addr>, otherwise runni=
ng
dtbs_check on boards including dp1000.dtsi will report a nodename validation
warning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-ultrarisc-=
dts-v5-0-af79dbd6ccec@ultrarisc.com?part=3D5

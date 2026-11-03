Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730802;
	b=e8pbxfgaMaOSXMhczzC6/kSu0xm6UhXPF2FU+6C3f5kTFxiHwSEthSRbtbMqCFWaKuZ1
	 kxEnilp3lmlzOEtM/IdYh3lxQ8f5zkP49TC8o9mwOlVf8T5HbPNw1YeFyzUYUFgHEEQQG
	 4pcOPLh1OedWubsLXyfWhlFGn8Es6taM/G7dF36IYHwwljmozjCFEw9VQK2xKWBQh8/TQ
	 FGMEyufGSUqcBfY9h0yKJfDB7ytltY8OCcmI0Nxb6LiniQJxfN8nAA05qEFBKnzb7sfly
	 CdtA/alZJqQbdbQZ9VndMnUTRjh9lxFcuR7KkjTeFGTEQtuf2RcT70YcKeok48+k2Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730802;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YorWgQzOddXNglkNUEwJyWHr1EfvJH9rmUmYiPhNZzo=;
	b=yGOnzyo7UhoNz8siZ3WL/dr8sBmpH8lL1i0ngCIIMCls18mONxbk+su9wXsWDmV7lEyX
	 njvBV9Ae9qpbAN1O77sxDiOouWRlvWNX4+KuXX1YmtY2Txi7Ov5lFbCBhocGRNVgijkpJ
	 lZm6k3PnMIA66jZICaYnYnHrKKTYE2gkCQINH5t7Ww38/vtu70ggH2B6Yllcd+GcYXej+
	 pWI3UDEVIO/kxvHS3aTdiawPHzKIx+LH6TSmBuqz9ReDRXjFWAKTMMyQWkUh0KZkAZtjF
	 lyJxXjaFDiurpE2OoXpUWkdoDu7kHHlTcZZ9rIVqKLyDK+AmDwwT8Z3bw+EvzrBOvtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DqwUxl0M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7153606A31B
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 18:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DqwUxl0M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137351F000C1;
	Tue,  3 Nov 2026 18:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793730801;
	bh=YorWgQzOddXNglkNUEwJyWHr1EfvJH9rmUmYiPhNZzo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DqwUxl0Mk17H9yu4RSPjVKpis3uEpisGaMxBtFIJa6SGKo27+JuR2pnyG896c3rVh
	 TWd5+PAR5Y/MiS4ew8WaBcKneN0auUQQKbpm74fsrLZfK2Dc+0Tr3cu45rFXD/ecZI
	 6U/Hhl70dw+bmZspgl39vC32zeUksNQ/NyvVlFZFN9qa/o8oTxl4v43a8L798s18YD
	 VcdO5bw4JopKYYoLexGT3z7l/fr8VZGYcKmb2gMOkZwgmP7q5lYgfKENZhefE5H1YY
	 XWcO4Y39bE4osKSt1b63we22hbBu8nDPLAOBB7HSHRwd9/Fertu3gTajCFz8gZwFRV
	 59c+bo8ypAsqg==
Message-ID: <sashiko-outbox-195845@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: support camera module on Haikou
 Video Demo on RK3399 Puma
Reply-To: sashiko-reviews@lists.linux.dev
To: "Quentin Schulz" <foss+kernel@0leil.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-rk3399-puma-haikou-video-demo-cam-v1-1-9a49d97839b5@cherry.de>
References: <20261103-rk3399-puma-haikou-video-demo-cam-v1-1-9a49d97839b5@cherry.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 18:33:20 +0000
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
- [Low] arm64: dts: rockchip: missing #address-cells and #size-cells in &is=
p1 port@0
--

commit e8d6ac8231bd6d76f74f768d24834758e451dab4
Author: Quentin Schulz <quentin.schulz@cherry.de>

arm64: dts: rockchip: support camera module on Haikou Video Demo on RK3399 =
Puma

This commit adds Device Tree overlay support for the OV5675 camera sensor
and DW9714 focus lens driver on the Haikou Video Demo adapter for the
RK3399 Puma module.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.d=
tso b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
> index 141a921a06e47..6c28e7e60ef28 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso

[ ... ]

> @@ -122,6 +129,50 @@ pca9670: gpio@27 {

[ ... ]

> +&isp1 {
> +	status =3D "okay";
> +
> +	ports {
> +		port@0 {
> +			mipi_in_cam: endpoint@0 {
> +				reg =3D <0>;
> +				data-lanes =3D <1 2>;
> +				link-frequencies =3D /bits/ 64 <450000000>;
> +				remote-endpoint =3D <&cam_output>;
> +			};
> +		};
> +	};
> +};

[Severity: Low]
Because rk3399-puma-haikou-video-demo.dtso is compiled as a standalone
Device Tree overlay before being applied to the base DTB, dtc does not see
the #address-cells and #size-cells properties defined on isp1 in
rk3399-base.dtsi.

With reg =3D <0> present on endpoint@0 inside port@0 without #address-cells=
 =3D
<1> and #size-cells =3D <0> on port@0, check_reg_format(),
check_avoid_default_addr_size(), and check_graph_reg() in
scripts/dtc/checks.c emit dtc warnings during the overlay build (and
check_unit_address_vs_reg() warns on port@0 under W=3D1):

scripts/dtc/checks.c:check_graph_reg() {
	...
	if (node->parent->addr_cells !=3D 1)
		FAIL_PROP(c, dti, node, get_property(node, "#address-cells"),
			  "graph node '#address-cells' is %d, must be 1",
			  node->parent->addr_cells);
	if (node->parent->size_cells !=3D 0)
		FAIL_PROP(c, dti, node, get_property(node, "#size-cells"),
			  "graph node '#size-cells' is %d, must be 0",
			  node->parent->size_cells);
}

Should port@0 define #address-cells =3D <1> and #size-cells =3D <0> (or
reference the endpoint label directly, or include reg and cell sizes on
ports and port@0) so that compiling the overlay does not trigger dtc
warnings?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-rk3399-pum=
a-haikou-video-demo-cam-v1-1-9a49d97839b5@cherry.de?part=3D1

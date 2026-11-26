Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701018;
	b=gFIaF8HGsizXwODIiV+TraUZRvrNx5T3X6bd2tf8iN+cUkv1e8vawNziyt3iNpN3s+MF
	 I/yhkhlFOU0o/xbkxHMcSwhfr3Brdh7/r8NiCLexYUrM/CFdtEVqFqM4tXrafyquJF6p5
	 Asl28qqPXq/12lWatoYD1l/oYvuB4nWKCNXsiS9XGbHV5zeB/Zhw9nqMU2yv6v7mi60K1
	 Evt3YVrPmh/60P237JpDxXm49WQ3TtlAJYyF7Lc0G+wAwEhiiFbwundbXcyyROzA+5HDc
	 BfOXlhj3cbBz4MqlONuyKQ/zOmcDm7v8jAQVo4MizJs1BFgocnsi+2pBDtuxpTp/S2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701018;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=D8aaKfm/rVetnfbpXVlB4VdiR9+CF0Kz6svOuIDEK7U=;
	b=SOgbiifY/Sib6C7rteRYXZZ/5Ugis8oZc5NcQcGPsc7C70LkgfwWpgb7RMjcH8w4V2dv
	 yHIjaGp1d1RgxtSKvAMg3v0UzBR7IfZj6fyzHv8zXOoY4Y6ABhT8C+1hXZVjUfSYBup7j
	 A5SvZTsuYsxXAsD5rnBT7Ngl42BkWh5AfJKClAxqFMElkM7Y3dvE7IQPd8O3/dlktEWIY
	 nFSFtunB1fh92m2EwwdbIDY/JO3ecFXBvBdzGMtBBk0fnqYh+yEeGwwpcfjua0pdtLgpI
	 pw4v9fV+cu03nxIkh9V/gWgJzxwTyee4CVWaA4PkRErSYHkl6pGgR6mA374cwfJDWGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V4fRQh3l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CA9606A32A
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V4fRQh3l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EA91F0093E;
	Thu, 26 Nov 2026 13:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795701018;
	bh=D8aaKfm/rVetnfbpXVlB4VdiR9+CF0Kz6svOuIDEK7U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V4fRQh3l5Jx5eVbio5kiImfnYKpPfNdGKt+4/tpucNFL7F5tjEflaeT08LRFAT8dU
	 4ErZRCmrvIzjRTIAmKtzQPdDc5Mj7Wceh7ISkXk8xA6qe2+gm9v54VTDGqppdPrwEX
	 zss7Ff4hLtp70X5s0L6Iqo/FfBrSGRzpWAvqpVyCiroXHqLP3xm1VmQK5Fv/P9kR/3
	 uivDyjVWOkLVZD6o35n7T6V5G/RZY/J+zoRnOq4z5ZA84Pxx8YAJc0tfTSDDkn/Ttn
	 8pPSGqzOpZf90lpJDLTIoyHS96uY95PYDUEWElrxzUoPGObH7AprGTtJamlDY7c7he
	 Av++yQB2F8tmg==
Message-ID: <sashiko-outbox-235649@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sc8180x: add IMEM and IPA
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Ijtsma" <robertijtsma@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-sc8180x-dts-ipa-v2-2-ad57b1be7c70@gmail.com>
References: <20261126-sc8180x-dts-ipa-v2-0-ad57b1be7c70@gmail.com>
 <20261126-sc8180x-dts-ipa-v2-2-ad57b1be7c70@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 13:50:17 +0000
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
- [Medium] arm64: dts: qcom: sc8180x: undocumented compatible
  qcom,sc8180x-ipa
--

commit 98bd0896ae9b2571b22decd833221032e2e62143
Author: Robert Ijtsma <robertijtsma@gmail.com>

arm64: dts: qcom: sc8180x: add IMEM and IPA nodes

This commit adds the on-chip SRAM (IMEM) node with the IPA modem-tables
region and the disabled IPA v4.1 device node to sc8180x.dtsi.

> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/=
qcom/sc8180x.dtsi
> index a85e3211958d1..5d837346f7bee 100644
> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> @@ -2253,6 +2253,51 @@ ufs_mem_phy: phy-wrapper@1d87000 {
>  			status =3D "disabled";
>  		};
> =20
> +		ipa: ipa@1e40000 {
> +			compatible =3D "qcom,sc8180x-ipa";

[Severity: Medium]
Is "qcom,sc8180x-ipa" documented in the devicetree bindings or supported
by the IPA driver?

Documentation/devicetree/bindings/net/qcom,ipa.yaml does not list
"qcom,sc8180x-ipa" in its compatible property, which causes dtbs_check
validation to fail on SC8180X targets.  In addition, ipa_match[] in
drivers/net/ipa/ipa_main.c has no entry for "qcom,sc8180x-ipa" (and no
IPA v4.1 configuration or register tables exist in drivers/net/ipa/), so
the driver cannot bind when a board devicetree enables this node.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-sc8180x-dt=
s-ipa-v2-0-ad57b1be7c70@gmail.com?part=3D2

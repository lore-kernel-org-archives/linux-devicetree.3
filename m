Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E66833986F
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 08:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152219; cv=none; b=EP01b2UstBkdxhIeJEejnbjPc1UBOyXS0lzUPq8F8u9QNEfw/0/YrvXew/8cHf+NHBu14tvtW6Aslp7gXekyHk7DrWnRllYuWB5zXxWCe42ma0/cQbjVi+5dyRwOoMpwzKpqSHKn17nR0fIiuSZreATkMDQf+5WiEOONLxjTjRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152219; c=relaxed/simple;
	bh=FRsg0Sk2/IM+vZrxdNoXIABNA9jBeAg6txcFbuajhgw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IiTv+5rarzJUSq4cwUMwjQBX2qbESUhbNeB0YMODXHcqIwB7+zcv91j0cL9wfJ+v374qLmt7uKqF8pGtlCh13d03Pmcd+9wLy47Mkkv84dzAdyM2xBJ8qAnJl2hk/kzJfA4z6GB3pV0raRVFsrsi2r7EafwpIGeZe65FhQ7xYLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ixa4v/lp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ixa4v/lp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565C91F00893;
	Wed, 23 Sep 2026 08:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790152217;
	bh=l0v59lvZa0N7jx40dna2fxzRGDNv1hWpe46jfYJEBmo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ixa4v/lp8P9feulivNmGrnDq9Vg4oPHc5e2bebosFzhh7f7DeTeBfEvzD2IQhj8is
	 AsbLYm5mEAvzAt4jgi0NFVU1DCtvgO8atevFvA5l3+KQJofbbFhRgKdWKbZTTzy0V9
	 8ORo5u3JlFmlvcfG424beDG2h1qhajljk1Bedw8nRyEDCgWC2YUa+oeiBtrYWdLEZX
	 md8JWYAcJNDBHE4zFw+OdjddcyAKeZOYPZmo2JQAg0D3Un57mtQHpMLprH4t0CuIQZ
	 ZhDV06jDEMQG9MYSrQqQ/ffwChgyjPl/ni1ITm3PVRO/haVTVFr+aMSQ0m9FZLaMKi
	 cK41AU75nsg1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] arm64: dts: socfpga: agilex5: add DDR50 read-path
 tuning to sdmmc
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <096868737ae11bd457ec791099dcfbec775d23ad.1790151203.git.tze.yee.ng@altera.com>
References: <cover.1790151203.git.tze.yee.ng@altera.com>
 <096868737ae11bd457ec791099dcfbec775d23ad.1790151203.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 08:30:16 +0000
Message-Id: <20260923083017.565C91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt: mmc: cdns,ddr50-* properties undocumented and unused
--

commit 980c0e02eef0135ea601c44b02d3683b9aeff804
Author: Tze Yee Ng <tze.yee.ng@altera.com>

arm64: dts: socfpga: agilex5: add DDR50 read-path tuning to sdmmc

Add the Cadence SD6HC DDR50 read-path tuning properties to the shared
Agilex5 sdmmc node.

> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/=
boot/dts/intel/socfpga_agilex5.dtsi
> index 5f22e6d7ab858..dc25b7382a29f 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -322,6 +322,8 @@ sdmmc: mmc@10808000 {
>  			resets =3D <&rst SDMMC_RESET>, <&rst COMBOPHY_RESET>,
>  				 <&rst SDMMC_OCP_RESET>;
>  			reset-names =3D "sdhc-reset", "combophy", "sdmmc-ocp";
> +			cdns,ddr50-use-lpbk-dqs =3D <0>;
> +			cdns,ddr50-read-dqs-delay =3D <96>;

[Severity: Medium]
Are these cdns,ddr50-* properties documented in the device tree bindings or
supported by the driver?

Adding undocumented properties to the device tree without accompanying bind=
ing
documentation and driver support creates dead code and causes dtbs_check sc=
hema
validation errors, since the corresponding binding (cdns,sd6hc.yaml) enforc=
es
unevaluatedProperties: false.

> =20
>  			status =3D "disabled";
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790151203.gi=
t.tze.yee.ng@altera.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A15039A815
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 10:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345792; cv=none; b=S4Nkgx+Zqk13H+7n9xr6KpxV5fzhAgH8JLngbdKtWtTiA/GqwxUGv3ylPYLQA8v1fZYQzKpD4wMm7SCEoH2Okaj/xmmeFvUgU3meK/U71jkFCje4MtCtyO+LfuqmfPRq1MRsAmss3nA+danC1u8bbX4vYCpvaGWbx+Osk68kqbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345792; c=relaxed/simple;
	bh=ruEwDC3stkhAai4qdJfpH1MjER6wNyn3lMMUTfd5dMw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EysnZEVm1C8REq5nHGFgKnAIA8vzEi9p7IH3UAEnWQ6x35DZHWgij3ce/3yiFCXHt68ok1bm9m17kBIHWJQnnwoOESOYEUz0Yn/4elBn/QYEgRq7ROQnCL5QtyQLs7URLxj4hdz3ZbFGmxckm61P3yzGL1sCmi8zdIClYEi9uRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fxek2GPx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxek2GPx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6419C1F000E9;
	Wed,  2 Sep 2026 10:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788345787;
	bh=sGcL0kpa6GxdqiubwfBNUE3nWGgChEebfSm6yDr3v3I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fxek2GPxc6lnLzzrUKv+VW//F3/IGvb/74XOJ1w8bbmo/yRuIa5xTcLLVi46Kcv80
	 8YZOYLO1TBP+xRB4wOznFuYS5iSlx4Dc52i299/EXr3tdYWCtIRn0YgRI4wM6kuAVq
	 9H2uSxwGVUlmMNBVtIjeKQah3rohScC0RNJ9IearYBXds2gu91x61KlYhrSjiam1gP
	 VJ3BdbAMZEK/1TdPC/cE+OMAPTY7lUCACYdNKAYNY4Nm/1MFzMMKYVVIUJx3JxDHsq
	 +U8hX7YMjSJ7PsJu97t9bMRW1YRdXw1wFY2DlZsa4wZRg/wg/s4JVGIHrfqVqbaSnu
	 2p6A68xe3x8ZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: mediatek: mt8395-genio-1200-evk-ufs:
 Complete UFS power supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902-mediatek-ufs-cleanup-dts-v1-2-7876e7a27a9d@collabora.com>
References: <20260902-mediatek-ufs-cleanup-dts-v1-0-7876e7a27a9d@collabora.com>
 <20260902-mediatek-ufs-cleanup-dts-v1-2-7876e7a27a9d@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 10:43:07 +0000
Message-Id: <20260902104307.6419C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch introduces undocumented device tree properties (`avdd1=
2-supply`, `avdd12-ckbuf-supply`, `avdd18-supply`) which are neither define=
d in the DT bindings nor parsed by the driver.
--

commit b5065cb681ea986f66b5cbd4f119cd47dc276eab
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

arm64: dts: mediatek: mt8395-genio-1200-evk-ufs: Complete UFS power supplies

This commit adds regulators used to power the MT8395 UFS controller to the
Genio 1200-EVK board devicetree.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts b=
/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts
> index e09a3ecd87730..f3d839f319187 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts
> @@ -16,6 +16,9 @@ / {
> =20
>  &ufshci {
>  	status =3D "okay";
> +	avdd12-supply =3D <&mt6359_vrf12_ldo_reg>;
> +	avdd12-ckbuf-supply =3D <&mt6359_vbbck_ldo_reg>;
> +	avdd18-supply =3D <&mt6359_vio18_ldo_reg>;

[Severity: Medium]
Will these new properties trigger dtbs_check validation errors?

The mediatek,ufs.yaml binding specifies unevaluatedProperties: false and do=
es
not define avdd12-supply, avdd12-ckbuf-supply, or avdd18-supply. These do n=
ot
appear in ufs-common.yaml either.

Additionally, since the kernel UFS and PHY drivers do not currently parse or
request regulators by these names, will these regulators remain unmanaged by
the UFS stack and potentially be powered off at runtime?

>  	vcc-supply =3D <&mt6359_vemc_1_ldo_reg>;
>  	vccq2-supply =3D <&mt6359_vufs_ldo_reg>;
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-mediatek-u=
fs-cleanup-dts-v1-0-7876e7a27a9d@collabora.com?part=3D2

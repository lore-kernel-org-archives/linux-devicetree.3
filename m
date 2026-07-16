Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE521A8F97
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212512; cv=none; b=Mc33PXQ8OexWkbOPAd8P3/nQgOPYmaJNbYGfb27e+7Phd1PB6LZP+VON8u5O8KRO7EHcfZzBXHpngGyy9W85T38OO70Nco+vSzvfAZsl0//TmQTvgB6Bffh/PdiZ2DpNkm7Dae+1MyIqa462FhLqb9O7PwHU7KiHbd25WgpAAyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212512; c=relaxed/simple;
	bh=Nh6sfb77/o69BWY01Q6vdIUXYl64kGdEFO3zLoww4/g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iY81IeRaGhRjic+/lscR9f1j2IKZYWZQH8XWabO6HFt4SI5A1O+eOdilcbsvcpyAikTIcZwwnZSVM5vaWnpQcziK+UbAoHxAh+cqnu3a3ZWdAwfiJOJNhv2OpA5S2ktaYj9K3uJ74UIU49BuRBHfDgGDgcYUcM08xKqHGfMfz2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmvDIOyz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmvDIOyz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080B41F00A3D;
	Thu, 16 Jul 2026 14:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784212511;
	bh=B3JhsVKLKcc2UVIsAsrwJ+et4WTmGiGqcINrcGt/QL0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gmvDIOyzwqYnwvAWmAuGBrdk85fmQVvpoY304BMFsbVgo5lBMHvsDbtMYD1Z1iAvx
	 iFbYnyP2ph1DmQpvJTnvMRURT3OGbbZTMJV9edhdJKgOI6QeioeyLWHAqcHvv/8sw/
	 /apv3K6pUNigAoOL5TttOGezYSDYKirpUO6y6e24VN5mLCWWJHWxBsi96eGXnZUbs4
	 HqOOoh2sjtlvfBIrHbsdPauGweCsLzlVhfS4WmilTeJoy84ym6z4Tev78OSqnbs2+9
	 lqop+NcEVSOq9V8rvOZz0ZbbkfALP65pzDIziTL40ipNDgO/pU6U//JpXfMIcMrq80
	 VCjzy6YHmWYig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V4 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support
 from SoC to board DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Monish Chunara" <monish.chunara@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260716142445.2767955-2-monish.chunara@oss.qualcomm.com>
References: <20260716142445.2767955-1-monish.chunara@oss.qualcomm.com>
 <20260716142445.2767955-2-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 14:35:10 +0000
Message-Id: <20260716143511.080B41F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The 'supports-cqe' property was removed from the common SoC DTSI=
 but was not added to the 'monaco-evk.dts' board, silently breaking its eMM=
C CQE support.
--

--- Patch [1]: [PATCH V4 1/3] arm64: dts: qcom: monaco: Move eMMC CQE suppo=
rt from SoC to board DT ---
commit 37093e152f8a2bb5db199eff4358061ebc24561c
Author: Monish Chunara <monish.chunara@oss.qualcomm.com>

arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT

This commit removes the supports-cqe property from the common Monaco SoC
device tree to prevent conflicts with SD card operation. It explicitly adds
the property back to the qcs8300-ride and monaco-monza-som board device
trees to maintain eMMC Command Queue Engine (CQE) support.

> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index 7b1d57460f1e6..e5f316897706b 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
[ ... ]
> @@ -4828,7 +4828,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			qcom,dll-config =3D <0x000f64ee>;
>  			qcom,ddr-config =3D <0x80040868>;
>  			bus-width =3D <8>;
> -			supports-cqe;

[Severity: Medium]
By removing this property from the common SoC DTSI, does the monaco-evk
board lose CQE support?

Looking at arch/arm64/boot/dts/qcom/monaco-evk.dts, it configures &sdhc_1
in strict eMMC mode:

&sdhc_1 {
        vmmc-supply =3D <&vreg_l8a>;
        vqmmc-supply =3D <&vreg_s2s>;

        no-sd;
        no-sdio;
        non-removable;

        status =3D "okay";
};

Since the EVK relies on the base DTSI for CQE support, and supports-cqe
was not explicitly added to monaco-evk.dts in this patch, it seems the eMMC
driver will fall back to legacy single-command mode on the EVK board.

>  			dma-coherent;
> =20
>  			mmc-ddr-1_8v;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716142445.2767=
955-1-monish.chunara@oss.qualcomm.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C8B428470
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786227; cv=none; b=eBXIekZZCU1sDkYj63W6oUXoREKXs+1cbIKfNBv82qgLrpEwS7fB+aJSScfMfTI1f4uO7tK75qjIxFYjtDpAX/DFsCGmAhrqhiSJpmMq6+cW1Fxt5ZTjgnN+EnFzpJLz2xcKNRhKkP4jn38PRckZKZTFH+bh710Vyoc/+Sohx/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786227; c=relaxed/simple;
	bh=9UVR4vEBXJJ0t3S8SzGpt1epDpP147ERdQBKiqYjD8w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=osCBgRCSIFo6GxADVXhR7A+i/AD0ETNmvzJv8MrcBkRUPp4/5KksoP+r1TcUb0ldDfVm+zpVAnalETCQrzf2H4gurxibmo9QhTb7FDQOf2sumSHMHNqkxODRCCK1wSfgFkStJXrQJlKNIWPivMqbO1KHhW+SCbnwXREIUYXmiRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GnwZIGEh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GnwZIGEh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579601F00A3A;
	Mon,  3 Aug 2026 19:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785786225;
	bh=3z8eu4Q8BindoEyhKb7TyUAPyX9I+TGPNg0eNRdGNGc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GnwZIGEhvxSKQmnDARh2imbSvdMDukTyutaB9ZYuMSd9U8Ln8qlcixDgHlVyHPWQ4
	 RpX6tcLUe/jSy2uakauOtfRRthJjwFVjB4AxoWH0+UBLD7JmAUSOuhb8f0IA1SRyyb
	 xdjafSKZCtpWMZ7/6hRgqR2s/Xem3aR9Jd+dTROx2gOOZT62co+ZY1FnR0UwG0rToo
	 CyR378kcRF1R8rN9X30J1T7T5jYjFl37QQk8x+dvao64tRW9iZPF+JihTkdjm7r5Ke
	 vqdK96IHQdZLt1IW56Mwma7AQE75TLa0pA/HvMpy9ErOyfSTR38sWKhvtZ8IH516vn
	 BigjU6hmkx+fw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: lemans-ride-common: fix SerDes
 PHY regulator supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-4-c4bc688177dd@oss.qualcomm.com>
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
 <20260804-b4-sgmiieth_serdes_regulator-v2-4-c4bc688177dd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 19:43:44 +0000
Message-Id: <20260803194345.579601F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete refactoring: missing DT updates for new PHY regulator r=
equirements on Monaco and QCS8300 boards
--

--- Patch [4]: [PATCH v2 4/6] arm64: dts: qcom: lemans-ride-common: fix Ser=
Des PHY regulator supplies ---
commit defd43449ca452b489164f877878995171548517
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

arm64: dts: qcom: lemans-ride-common: fix SerDes PHY regulator supplies

This commit replaces the incorrect phy-supply property with the required
vdda-0p9-supply and vdda-1p2-supply properties for both SerDes PHY nodes in
the lemans-ride-common device tree.

> diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm6=
4/boot/dts/qcom/lemans-ride-common.dtsi
> index cefb8ff008063..923fd8736f31d 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> @@ -856,12 +856,16 @@ &qup_uart17_rx {
>  };
> =20
>  &serdes0 {
> -	phy-supply =3D <&vreg_l5a>;
> +	vdda-0p9-supply =3D <&vreg_l4a>;
> +	vdda-1p2-supply =3D <&vreg_l1c>;
> +

[Severity: High]
This is a pre-existing issue, but shouldn't other boards in the tree that
use the deprecated phy-supply for serdes0 also be updated?

For example, arch/arm64/boot/dts/qcom/monaco-evk.dts still uses:

&serdes0 {
	phy-supply =3D <&vreg_l4a>;

	status =3D "okay";
};

arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi still uses:

&serdes0 {
	phy-supply =3D <&vreg_l5a>;

	status =3D "okay";
};

And arch/arm64/boot/dts/qcom/qcs8300-ride.dts still uses:

&serdes0 {
	phy-supply =3D <&vreg_l5a>;
	status =3D "okay";
};

Without these updates, will the driver fall back to dummy regulators and fa=
il
to place the required voltage and load votes for these boards? This might
result in PHY calibration timing out or Ethernet failing when shared rails
enter runtime PM suspend.

>  	status =3D "okay";
>  };
> =20
>  &serdes1 {
> -	phy-supply =3D <&vreg_l5a>;
> +	vdda-0p9-supply =3D <&vreg_l4a>;
> +	vdda-1p2-supply =3D <&vreg_l1c>;
> +
>  	status =3D "okay";
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-b4-sgmiiet=
h_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com?part=3D4

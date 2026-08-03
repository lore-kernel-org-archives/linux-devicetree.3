Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D3227BF79
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785791; cv=none; b=c7pZnap1yLi0Ld1VXWbC2B3nQ9HBFbuSSLjJgFEvxqNBPSNghS2Q6LS1xZJvOkSSUnSnWlRoEe4a0Mem8fAIXYJrRkzyw4LaF7CxpU6C+PC9J4E1aZdN3CIQ/X4904IN5f5Uo37L+HafVC57jUNQJr9P9y5od1egzwo1Kz5js5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785791; c=relaxed/simple;
	bh=EKIk/M8H2eqy8vydoWSPqkVmQ4T3D3df9/pl/N3NDkI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z+vbMLa1hFJaVrSKrlYEnCI+1LO+2rnhmtzZxH3A4YOMSdF1oJPfepZ2TzfGCtfMufbQLoGRbBeIeiG956b7/TLPYewrx03jVL1TqhGu4IvzRaSgP6lado/PENljKGUlFiVSpwtS9RHv0ACRQEha/Wd+cgBkQwyxBkN6skxd/IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRZKxx5J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRZKxx5J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F681F000E9;
	Mon,  3 Aug 2026 19:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785785789;
	bh=//2gnWkBS2KEUjzKBY9tviOyhT6TbWVnXvuVKADN6RU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GRZKxx5JaaNy2cAW+c0CPBZR+jqRQ0YtQIBQ4x6VwquOBShRRmwzYtNcIGKm2oyij
	 otp0DnSbDSzvMisckbioHzt1dphDLO+8h+fkbdnncUoswIVdP0etRCQtqETcrDXuLT
	 cf+G5113A20qhiY/oOiiV5WXg9T9LvMQ2jK5tWOw0Zb2tWGP4WTQbulooBHPqqfiD2
	 QvQd1UH47YA7oi9OTjZNZ9fjKw9TnqyRGHCT5KDhPaAq87bVaJLKk93sjzGPVFldCe
	 9GOb5sX5ZxDFjUnnIq/Dr+ECVrFNG3FKblgw6lpqAOFP80FGLRP7n5dCDY7MJkEHSF
	 T/pu2I5gGsdRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: qcs8300-ride: fix SerDes PHY
 regulator supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-6-c4bc688177dd@oss.qualcomm.com>
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
 <20260804-b4-sgmiieth_serdes_regulator-v2-6-c4bc688177dd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 19:36:28 +0000
Message-Id: <20260803193628.E6F681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete device tree migration for SerDes PHY regulator supplies=
 breaks Ethernet on Monaco Monza SOM.
--

--- Patch [6]: [PATCH v2 6/6] arm64: dts: qcom: qcs8300-ride: fix SerDes PH=
Y regulator supplies ---
commit 8e38978ea8c058004487a19a9a664f9946b8306c
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

arm64: dts: qcom: qcs8300-ride: fix SerDes PHY regulator supplies

This commit fixes the SerDes PHY node in qcs8300-ride.dts by replacing the
single phy-supply property with the required vdda-0p9-supply and
vdda-1p2-supply properties. This ensures both the 1.2V and 0.9V rails are
properly provided to the PHY.

> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/=
dts/qcom/qcs8300-ride.dts
> index 1ff39530ea3de..76c34215dbdf0 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -702,7 +702,9 @@ &remoteproc_gpdsp {
>  };
> =20
>  &serdes0 {
> -	phy-supply =3D <&vreg_l5a>;
> +	vdda-0p9-supply =3D <&vreg_l4a>;
> +	vdda-1p2-supply =3D <&vreg_l5a>;
> +
>  	status =3D "okay";
>  };

[Severity: High]
This isn't a bug introduced by this patch, but I noticed that another file =
in
the tree, arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi, still has the exa=
ct
same configuration you are fixing here. It retains the deprecated phy-supply
property and lacks the required 0.9V rail:

&serdes0 {
	phy-supply =3D <&vreg_l5a>;

	status =3D "okay";
};

Since the PHY driver strictly expects the two named regulator supplies via
devm_regulator_bulk_get_const, won't leaving this old configuration break
Ethernet on the Monaco Monza SOM during boot by either failing to probe
or timing out on calibration?=20

Should monaco-monza-som.dtsi be updated similarly in this patch or as a
follow-up in this series?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-b4-sgmiiet=
h_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com?part=3D6

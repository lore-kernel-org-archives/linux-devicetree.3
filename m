Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BCD3BB12B
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786362007; cv=none; b=KeFT4zbimvB+zJb7NbMdi18u/xROfBrsuaX2Wf7BFVdKwu9WalOBlt5By5M2Lka8cYl6HNwoMiP+kcxEbg6vUoDVfrPTt+bVjUpfVg2jNZVFk1fek27tmbDHUyfFziX9BffGXSxFTF1DAyfTskdqF+/wpKONItQgVBOXUoSQHog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786362007; c=relaxed/simple;
	bh=4cEz5zpu9KbS4uB4xhQQjdkOMnqTd5E49OPmIu8vYuE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f1JW7Ou60QpPfJ5kSDGxGN8EsJHjImuWWYXFcP/tw+TyFVKFIPSn25DW2hUUwEs3VvNsWXJA7Ht0zik3onT5nCewrVM66JNgudvKlgQXVpF3mna+5oTp284JHd5+JAl/cdD8eo2vUO3+ZxThZ5TCT1VwvkSSUvbiM2Tcbv5cYgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDve/JcX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDve/JcX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA131F000E9;
	Mon, 10 Aug 2026 11:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786362006;
	bh=yWCtd6KZTOCiMRDJqDYqwaxkxcrA6w1WKuZjnsnwL5o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MDve/JcXYxu3FSqX6m5tr1XSzSck5nHU8k8mT3ZY2kfmuobnFXucByv9QHOnHjYrj
	 o2tuCD26N0Z03/mlSALJUNwfXJp8NYVoFNzrLX4H37vKyAQGSAaIlTnV83eo4UB033
	 mn/+ZJsD/5WpPrVG5//qZdCe7MJU9octSWNbAhEhWPxobnbmlxQTK8CrSpitQf0hr2
	 0fkX4xWJO5jHkSgmUtWePILv5Ax+tmceWFe1PslkZUs8ubfGia7vJ9Cm3fPzpmXcJ7
	 SiFMuBkfAkrZbi0FJ6PqZa76aAIoeXJuUfjgaDOiMUgja7VxGUj7JUve/DjGJVK6MK
	 E4BE03lfiSDrg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 4/4] arm64: dts: qcom: sa8775p: Add qref and refgen
 supply for PCIe PHYs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziyue Zhang" <ziyue.zhang@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org, vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260810112735.1326807-5-ziyue.zhang@oss.qualcomm.com>
References: <20260810112735.1326807-1-ziyue.zhang@oss.qualcomm.com>
 <20260810112735.1326807-5-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 11:40:04 +0000
Message-Id: <20260810114005.9DA131F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Redundant definition of `vdda-refgen-supply` in the leaf board file=
s `qcs9100-ride.dts` and `qcs9100-ride-r3.dts`.
--

--- Patch [4]: [PATCH v1 4/4] arm64: dts: qcom: sa8775p: Add qref and refge=
n supply for PCIe PHYs ---
commit 95e45f63ab1216333770f51bde0f0be981ca36f9
Author: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>

arm64: dts: qcom: sa8775p: Add qref and refgen supply for PCIe PHYs

The QMP PCIe PHYs on SA8775p require dedicated qref and refgen voltage
supplies for stable operation. This commit adds vdda-qref-supply and
vdda-refgen-supply in the board files to prevent occasional system crashes.

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm6=
4/boot/dts/qcom/lemans-ride-common.dtsi
> index 40f88498999bd..8dc4a5f461e9e 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> @@ -983,6 +983,8 @@ &pcie1 {
>  &pcie0_phy {
>  	vdda-phy-supply =3D <&vreg_l5a>;
>  	vdda-pll-supply =3D <&vreg_l1c>;
> +	vdda-qref-supply =3D <&vreg_l4a>;
> +	vdda-refgen-supply =3D <&vreg_l7a>;
> =20
>  	status =3D "okay";
>  };
> @@ -990,6 +992,8 @@ &pcie0_phy {
>  &pcie1_phy {
>  	vdda-phy-supply =3D <&vreg_l5a>;
>  	vdda-pll-supply =3D <&vreg_l1c>;
> +	vdda-qref-supply =3D <&vreg_l4a>;
> +	vdda-refgen-supply =3D <&vreg_l7a>;
> =20
>  	status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts b/arch/arm64/bo=
ot/dts/qcom/qcs9100-ride-r3.dts
> index 7fc2de0d3d5e2..1b6a4f9cb8f7e 100644
> --- a/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
> @@ -14,3 +14,11 @@ / {
>  	model =3D "Qualcomm Technologies, Inc. Lemans Ride Rev3";
>  	compatible =3D "qcom,qcs9100-ride-r3", "qcom,qcs9100", "qcom,sa8775p";
>  };
> +
> +&pcie0_phy {
> +	vdda-refgen-supply =3D <&vreg_l7a>;
> +};
> +
> +&pcie1_phy {
> +	vdda-refgen-supply =3D <&vreg_l7a>;
> +};

[Severity: Low]
This isn't a bug, but are these vdda-refgen-supply assignments necessary in
the leaf board files?

Since lemans-ride-common.dtsi already adds these exact same vreg_l7a
assignments for both pcie0_phy and pcie1_phy, redefining them in
qcs9100-ride-r3.dts seems redundant.

> diff --git a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts b/arch/arm64/boot/=
dts/qcom/qcs9100-ride.dts
> index b0c5fdde56aea..cc15025fdbc1a 100644
> --- a/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs9100-ride.dts
> @@ -14,3 +14,11 @@ / {
>  	model =3D "Qualcomm Technologies, Inc. Lemans Ride";
>  	compatible =3D "qcom,qcs9100-ride", "qcom,qcs9100", "qcom,sa8775p";
>  };
> +
> +&pcie0_phy {
> +	vdda-refgen-supply =3D <&vreg_l7a>;
> +};
> +
> +&pcie1_phy {
> +	vdda-refgen-supply =3D <&vreg_l7a>;
> +};

[Severity: Low]
This isn't a bug, but similarly here, does qcs9100-ride.dts need to duplica=
te
the vdda-refgen-supply assignments that are already inherited from
lemans-ride-common.dtsi?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810112735.1326=
807-1-ziyue.zhang@oss.qualcomm.com?part=3D4

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BED27BF79
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785823; cv=none; b=Nn22RWpZNDGKPk5V9LyDydUBj+JGLuEZ77fb9giFCXMIROhZM6P58djE3jI1IFOMyFBz5f9+BU103ZbOhOsAPUE0IyhFjPOHaYqLxDl8FenpDXYLzKOeTaPqVb89Syu1zvKxVj9xa68WKspmfAWcbMUom8EhtUha73XAX6YpPOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785823; c=relaxed/simple;
	bh=QgiD7gPwBN2cz7/cTn/9jhR5gDN1Y4b8D/MRqzdwQnE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jJc1RTU3tXhh6OXHHfdQeU+mKC1QWfk56uSbMXlnNhMeXGcuf2R1FO68iQmZvccwxnSE9PaaQ7b+evvPw913jo/lZJZM6BTnNIBjTo52rzSjmQ4E8o8SD679fxK8cgc79484fphoRWXK0Vd56Vqav4ZyQ6TttOZB+9nbtzsyta0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CgtsfD6k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CgtsfD6k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D331F000E9;
	Mon,  3 Aug 2026 19:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785785821;
	bh=eDJMn/2PLLUFui+gUcVlUtOhN2zFA1mRACkg7Evy3UY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CgtsfD6kk9/QMzW5gNW/bOjIZDycyh06FwRnYxrB6ktj06ajMRVs7FrZ20lzUQmzN
	 oZ/7E1anX17QS3mUqb+TXB6QJ+1VpWo9YFwr1/FubclEcs4oh1BsYElf+V5N6h0xEN
	 /UINkmbGLYY2YLstaFc+klwQQmNMTHTCK40KM+PBgoFu0y6REQhkL13yt7t3Sq2u2v
	 cTOxdrRD5aLVYGsBjoqE8QMexOmko8+dZ5xPkbXF1rPKdLWaE2mHj6GDXelpkVBc/u
	 ben154hnKTsBxJwPiXyn4/iDXaz8J0wVFKj7S2A1UpW1Ef0iHnABx3EYgl8JVse+G0
	 mryiigkCqIdBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: lemans-evk: fix SerDes PHY
 regulator supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: linux-phy@lists.infradead.org, olteanv@gmail.com, robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-3-c4bc688177dd@oss.qualcomm.com>
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
 <20260804-b4-sgmiieth_serdes_regulator-v2-3-c4bc688177dd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 19:37:00 +0000
Message-Id: <20260803193701.42D331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix for SGMII SerDes PHY regulator supplies leaving dow=
nstream boards broken.
--

--- Patch [3]: [PATCH v2 3/6] arm64: dts: qcom: lemans-evk: fix SerDes PHY =
regulator supplies ---
commit 06c318320f4f12178e107aa08e3b5435de261d50
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

arm64: dts: qcom: lemans-evk: fix SerDes PHY regulator supplies

This commit fixes the SerDes PHY regulator supplies for the lemans-evk board
and its IFP mezzanine overlay. It replaces the incorrect phy-supply with
vdda-0p9-supply and vdda-1p2-supply.

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dt=
s/qcom/lemans-evk.dts
> index 0c53640c42a65..5c046b9bfb3cd 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts

[ ... ]

> @@ -978,7 +978,8 @@ &sdhc {
>  };
> =20
>  &serdes0 {
> -	phy-supply =3D <&vreg_l5a>;
> +	vdda-0p9-supply =3D <&vreg_l4a>;
> +	vdda-1p2-supply =3D <&vreg_l1c>;

[Severity: High]
This isn't a bug introduced by this patch, but should this fix be applied to
other boards using this PHY?

It looks like several other device trees still define the deprecated
phy-supply property, such as in
arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi:

&serdes0 {
	phy-supply =3D <&vreg_l5a>;
	status =3D "okay";
};

And similarly in arch/arm64/boot/dts/qcom/qcs8300-ride.dts,=20
arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi, and=20
arch/arm64/boot/dts/qcom/monaco-evk.dts.

Booting these unmodified boards could result in the PHY driver either faili=
ng
to probe or falling back to dummy regulators and failing calibration, break=
ing
SGMII Ethernet connectivity.

Could the fix be extended to cover these other boards as well to ensure they
receive both required voltage supplies?

> =20
>  	status =3D "okay";
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-b4-sgmiiet=
h_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com?part=3D3

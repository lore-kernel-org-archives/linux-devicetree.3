Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040643A75A8
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 19:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786460; cv=none; b=uqnYrofLrBF7fgFvTIoU9X4q8mkPYyYgdVnhgkWohLjmo/LoXbsSENpzEdegcfHWTlvOKVboGkDMA2pnTs1aRJ/zxanE/sZvjHM7xFS6bZdllkh2YPGQUiW8X6WeyCIKCqNIckttRo96F3/n9GTJ2nFKiuYhq5hNlIjqjp5RDBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786460; c=relaxed/simple;
	bh=TprXofiE3G2gnJodeYwiqsjIT4kyOm9iU75JakkRMrk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a19NHCvFyPCnk6h8o6EzWnae2NHWll7HRMS2/wUQzrahYjdQ44TvOFc+G79pprGw/t6q5kcxrRbEIzp2LVzEnLhgxXcau2+fy5u+sreZ4MeFS3LZH/2p7wR2D2fuefu/El2fx8ccrHp9Xl1R54hYJPZEMAfesRyS1o6/TvK38K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khfQybPq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khfQybPq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0D51F000E9;
	Mon,  3 Aug 2026 19:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785786458;
	bh=dxcOY/Bwmv4BFz5N3ve8AYSlFhK1EmAyJQiHrmv3Rng=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=khfQybPqSW69GG7QF+d1UsgiGkyTqzbHa3peCNQzs8Jbz8ulOH9P9iXQdUfF0p71E
	 5KzZLIrhulbkkL5D5Vaml/6HsqXVnXRWjRSg8Ha/PEjo5bBhwFwhj7PBXZda0JcqZQ
	 l4gElG6+q1dLuGG69Q87XgJxw9Ga9yzLD7G/nU+eF2wlKInUf9pB8Y9ycwGg+mKs+M
	 OF8WGof8l+ip+FHxhJYvjA9Nt+DYduUJnOEM0FpoGnlpAZNUFjgkFKQWIehz8LIo+E
	 DaF//XwCo5QVPvEsyDAmjNatV59oc1o170PM0VIPkqJgPXIxJYkkzHsZDJUClQEDW8
	 KZHYrv8Akb0eg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: monaco-evk: fix SerDes PHY
 regulator supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohd Ayaan Anwar" <mohd.anwar@oss.qualcomm.com>
Cc: conor+dt@kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-5-c4bc688177dd@oss.qualcomm.com>
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
 <20260804-b4-sgmiieth_serdes_regulator-v2-5-c4bc688177dd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 19:47:37 +0000
Message-Id: <20260803194738.4E0D51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incomplete device tree migration causes a functional regression on=
 qcs8300-ride and monaco-monza-som boards, where the SerDes PHY will fail t=
o power up because its 0.9V regulator rail is not enabled.
--

--- Patch [5]: [PATCH v2 5/6] arm64: dts: qcom: monaco-evk: fix SerDes PHY =
regulator supplies ---
commit 77126601ae0cd79ff3e3276e8f35420b21a2d2f5
Author: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

arm64: dts: qcom: monaco-evk: fix SerDes PHY regulator supplies

The commit updates the SerDes PHY node in the monaco-evk device tree to use
explicit named regulator supplies (vdda-0p9-supply and vdda-1p2-supply)
instead of the deprecated phy-supply property. This ensures both required
rails are properly described and enabled.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dt=
s/qcom/monaco-evk.dts
> index 9d17ef7d2caf1..f787e78b35ce4 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> @@ -706,7 +706,8 @@ &sdhc_1 {
>  };
> =20
>  &serdes0 {
> -	phy-supply =3D <&vreg_l4a>;
> +	vdda-0p9-supply =3D <&vreg_l4a>;
> +	vdda-1p2-supply =3D <&vreg_l5a>;

[Severity: High]
Does this migration to vdda-0p9-supply and vdda-1p2-supply need to be appli=
ed
to other boards as well?

Looking at arch/arm64/boot/dts/qcom/qcs8300-ride.dts and
arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi, they still use the deprecat=
ed
phy-supply property for serdes0:

arch/arm64/boot/dts/qcom/qcs8300-ride.dts:serdes0 {
	phy-supply =3D <&vreg_l5a>;
	status =3D "okay";
};

If the qcom-dwmac-sgmii-phy driver was updated in this series to require
explicit vdda-0p9 and vdda-1p2 supplies, devm_regulator_bulk_get_const() wi=
ll
fall back to dummy regulators for these missing named supplies.

This would leave the 0.9V physical rail unpowered on these other boards, wh=
ich
causes the PHY calibration to time out and the Ethernet interface to fail to
initialize.

Should these device trees also be updated to ensure their SerDes PHYs do not
fail to power up?

> =20
>  	status =3D "okay";
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-b4-sgmiiet=
h_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com?part=3D5

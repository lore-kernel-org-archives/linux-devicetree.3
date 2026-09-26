Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F273A6B8F
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 10:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418628; cv=none; b=AHsmrDvBJYeT610NwHZINZ1EHSyDxCbN2PaVbEavg7Yf9whJc61ZCOBqf4eP2YhdiVn0UL3tWmbFIGY4QUYUlHtWJMDaBK24rpc6UJYRRejWs0a5uWOeyDV5LIfJjGzS2w/qVUr27TUPseSIdoKKJU1sxDhKtM2ujewBeu4jnkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418628; c=relaxed/simple;
	bh=A60m0ynbTfUUEvgh1Owuso1vQwz7SdGAFU3mo/8IINg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cm21BP0a0qV8e7l9+FpFfkBX/dHEgZ54o9DXkLpAOtvaukU0x/TSApaEQJQVdJOlv+W4/T2WbbNLvGICGmXet2q/2inMD97P/FQ77KsjWJx5SPLRFqZAqjwewBd3HrEsKBg1ymAWH68wR0sbvaGDIIEkklTmh3NruXkLXhY5G9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYGjxLr3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYGjxLr3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD8A1F000FF;
	Sat, 26 Sep 2026 10:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790418622;
	bh=xjVMkw8nqD5MrYP7pxYV+ZJ5fBIUR/d0GIbV9Mhqw+I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iYGjxLr3fgcu314Dn5G4dh8HvQFgD8knmJZtO7owi4GxGkC7WwJjOw55D3yoK9GPa
	 Lr1dMoefYYy09H2EcXdK3zcuJrM/JE+7QBSIX4tL0oYGJuPQMp9u/VAEdVS/VOOBkN
	 mEoGJBlPA1neoPbmyTXO6IByhuh6Atddho59VnwnxDxTuR2M+4DXNPhega7j+ZJtLp
	 r411ZlazbzDtFlKEpMuhBzJI9jiDek6IWKosqLfchNggKLnHXwtlvPuVBhj+TsKefw
	 IgiHBNpyI4+8oOFQjDGKyva4eJ9dUJf973T4Ui5xbMCswT+N48ocr/WM8kW/pYcadm
	 SkxUx90Pnw2dA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/8] arm64: dts: qcom: sm6350-lena: Enable PMK8350
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260926-pdx213-upstream-3-v1-8-1609c18b5c1d@erebion.eu>
References: <20260926-pdx213-upstream-3-v1-0-1609c18b5c1d@erebion.eu>
 <20260926-pdx213-upstream-3-v1-8-1609c18b5c1d@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 10:30:21 +0000
Message-Id: <20260926103021.ABD8A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: unit address vs reg mismatch in pmk8350_vadc channel
--

commit 5d60ecb2f51ba076b9f89e76eff7eec7d8346935
Author: erebion <erebion@erebion.eu>

arm64: dts: qcom: sm6350-lena: Enable PMK8350

Configure and enable nodes for PMK8350 on the Xperia 10 III.

> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 265400aa945ba..ddca3caf4a4e5 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts

[ ... ]

> @@ -436,6 +441,31 @@ &pm7250b_vbus {

[ ... ]

> +&pmk8350_vadc {
> +	channel@3100 {
> +		reg =3D <PMK8350_ADC7_AMUX_THM1_100K_PU>;

[Severity: Low]
The node name uses the unit address 3100, but because PMK8350_SID is 6
and ADC7_AMUX_THM1_100K_PU is 0x44, the reg expression (6 << 8 | 0x44)
evaluates to 0x644.

This mismatch triggers a unit_address_vs_reg warning from the device tree
compiler during the build.

Could the unit address in the pmk8350_vadc node name be updated to 644 to
match the evaluated register address?

> +		qcom,ratiometric;
> +		qcom,hw-settle-time =3D <200>;
> +		qcom,pre-scaling =3D <1 1>;
> +		label =3D "xo_therm";
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-pdx213-ups=
tream-3-v1-0-1609c18b5c1d@erebion.eu?part=3D8

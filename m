Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2D85328A2
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072874; cv=none; b=V/0ln7MwlSOWqP9RiDDDShpVLtV/SVKFqxKstOhE8PmCAzhh3DngD1g83hGMuuiF607tmUxFbaAXAMMST6HNgDkUGOO/fuLCJp12JBFCKmrWcI8a6vnqT3O2akF3FU3pH9hsXqltAzubThZuCGJG98fP2ttXnMX80qPffSDjdCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072874; c=relaxed/simple;
	bh=uX7Il6JhRXv89u+iLcy/HUea6b5uEXmGoV6EhD24B/I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bmpy1WlMBiDvo4uVNb+VM6/Xa/mOCsiqQRFHf3pTFxKMAaPrWFjL9jqtL3MDgFz4vwPQ5vLfv6EVpZOVuNIC/wWikvWwHdHFpkdV3TgQt5Su7HY5j2kehtYHGxy8/VnznxcIJGwWmH3MzeIEVCZQk2V2W/1sgpV5PyB71AtWtuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOHEJN1+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOHEJN1+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F681F000FF;
	Tue, 22 Sep 2026 10:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790072872;
	bh=jhj9+qHaEMA1YlYNhpERdUiZYynAGlEbzpGM9gLVWbg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gOHEJN1+PLq4/MYrGH2IvATqFikpJ00w2iy7izkeR2aZD+LRaiPDtBrmum87AT7VU
	 PRYTxfQZhr6rKPo3FBsSMyEY4Vww1UDeFx0KQRTJRbwWahf2DWvhyfHlvb+2zskaSQ
	 TXqhQjGUW8mnpMcE898WRLKAQ8pjv4t4boX1xDR44+Xy8tm/3tDhv3wYxrKxyG/LYy
	 o+hwrCwN7rHT9Qmolm+8u5uyFjaGLxOAU8L+AGsDQsXDwyugybAcE4vCHF9oYdwywQ
	 EyOTEMnYUBy81RwbuEZTAePOAf/Dazj1Tx/ZYxxV/aKFuo2ZBg3FRixadYxpEcuQ1z
	 Ah9dYidjA5Msw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: glymur-crd: Enable DMIC4 and DMIC5
 on CRD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260922101550.2216689-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260922101550.2216689-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 10:27:51 +0000
Message-Id: <20260922102752.23F681F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] sound: qcom: DMIC pinctrl and DAPM route mismatch leaves mics un=
clocked
--

commit acf2021d4b3109886871e1b20f566cf0a1e65f99
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

arm64: dts: qcom: glymur-crd: Enable DMIC4 and DMIC5 on CRD

Add the LPASS LPI pinctrl state for the third DMIC clock line, which
drives DMIC4 and DMIC5.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/d=
ts/qcom/glymur-crd.dtsi
> index e27c697e31702..3f600b924a31d 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -247,7 +247,9 @@ sound {
>  				"VA DMIC0", "vdd-micb",
>  				"VA DMIC1", "vdd-micb",
>  				"VA DMIC2", "vdd-micb",
> -				"VA DMIC3", "vdd-micb";
> +				"VA DMIC3", "vdd-micb",
> +				"VA DMIC4", "vdd-micb",
> +				"VA DMIC5", "vdd-micb";

[Severity: Medium]
Will this DAPM route configuration mismatch the pinctrl configuration below?

Requesting DAPM audio routes for VA DMIC4 and VA DMIC5 causes the VA Macro
codec to enable the 3rd DMIC clock line. However, the pinctrl state configu=
red
in glymur.dtsi targets the 4th clock line. As a result, the newly added
microphones might fail to capture audio, returning only silence.

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/q=
com/glymur.dtsi
> index f04058d2e0891..891377f38dcb5 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -4437,6 +4437,22 @@ data-pins {
>  				};
>  			};
> =20
> +			dmic45_default: dmic45-default-state {
> +				clk-pins {
> +					pins =3D "gpio17";
> +					function =3D "dmic4_clk";

[Severity: Medium]
Should this function be dmic3_clk instead?

The commit message states the intent is to enable the third DMIC clock line
for DMIC4 and DMIC5. Configuring dmic4_clk on gpio17 here assigns it to
the fourth DMIC clock line, which mismatches the VA Macro codec that expects
the third clock line. In other Qualcomm devicetrees, dmic45_default correct=
ly
configures the dmic3_clk function.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922101550.2216=
689-1-mohammad.rafi.shaik@oss.qualcomm.com?part=3D1

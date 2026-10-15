Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C111519929
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 11:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062171; cv=none; b=qmz+rsA6KUVREMyb6JxQisTxnl8fh7i58ZXPg9gMRpgJncJWEQlBi8gm+P4LN/Yh0CGxkF6Wha+kW2nPpwK+fs+GFCtbAbhSZq3tV46cDByq4twH4M0oRn40TogU9LbOPKtddl16HAJaYAKsSRhbo328CDPKW9kyYO0dYWj5nwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062171; c=relaxed/simple;
	bh=7RwsWEgxcX1c3kojSqUm3eKsKh4gjlQFc59EUvFf5Y4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=J+ezr72jXblsJuXtIlDcFWQ5BkRxuFApinfKMk8pGCUMMYGc20maxfFOox7/h2foO48Te5h4WKZKm2S5ZucE9WIMIajTfHMz8at7lPJ5MhO2m8UrASYBLkgY71lyo5wmfXpLDTpQfuFKI4w1BN4YaldkvLR5RQCt22KBxFFhSjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjrJV9Me; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjrJV9Me"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9A91F000C4;
	Thu, 15 Oct 2026 11:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792062170;
	bh=hK55I2jby/+UHllkRNn6bT4mQFaXOHT9ZPPqJ+4tr6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EjrJV9Me8bQx0my/SdTJusCQO9mXCNxvZc57SlFggDxtDJj9MamwwSnvUlryRVD2u
	 3AoWM9DUEVc3hC96A5nvadzdtTWTB2c1g6MgfhuEZLDJIHL69n/gzJImyLpqNcYGka
	 UECfENmRKeWHHqJn58YRExegu9Nry33ZNjGliWqrVWi3hY9u/V37/dlSUEWYtdo7C7
	 U+L9lYb3EtHpN94sbpD8znSHKJsEvB/cSGX69ASJgXXd/VE1j6hSwXWDOSe7hM+Pnl
	 0k/lib96kTRk/Byg0HvS6n/iwxVk8lcdrAxO1uxRO4xl5HWb2cVb0dhaqWb3KjuRTo
	 n8nzxhIXjBTeQ==
Message-ID: <sashiko-outbox-172707@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: glymur-crd: Add PM8010 camera
 PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nihal Kumar Gupta" <nihal.gupta@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-glymur_camss_dts-v2-4-e7b1f403146f@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
 <20261015-glymur_camss_dts-v2-4-e7b1f403146f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 11:02:49 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: qcom: undocumented compatible qcom,pm8010-i2c lacks driver =
support
--

commit b406354a7d9e1a182f11a64fe71ecec95efdafff
Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

arm64: dts: qcom: glymur-crd: Add PM8010 camera PMIC

This commit adds a PM8010 PMIC node with seven LDO regulators and pinctrl
configuration for the reset pin. The LDOs provide power to the camera senso=
rs
and associated hardware.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/d=
ts/qcom/glymur-crd.dtsi
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -671,6 +671,72 @@ ptn3222_1: redriver@47 {
> =20
>  		#phy-cells =3D <0>;
>  	};
> +
> +	pm8010: pmic@8 {
> +		compatible =3D "qcom,pm8010-i2c";

[Severity: Medium]
Is there a missing driver or dt-binding for this compatible string?=20

A search across the tree indicates that there is no documentation or driver=
=20
support for qcom,pm8010-i2c. Since the PM8010 is traditionally controlled v=
ia=20
SPMI/RPMh, and no I2C driver variant appears to have been introduced, will =
this=20
cause a regression where the PMIC device silently fails to probe?

Without the PMIC probing, its regulators will not be registered, which may =
cause=20
downstream devices (like the camera sensors) to indefinitely defer probing.=
 This=20
could also result in dtbs_check failures due to the missing binding.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-glymur_cam=
ss_dts-v2-0-e7b1f403146f@oss.qualcomm.com?part=3D4

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA0636894D
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 13:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781874340; cv=none; b=IeDSxHKXMEt5xi5xr7TMUL+i8MnSVgspdjZPX7jb/rGEFoBGQv63mFE1/9uVwu0pKWkQolmiTBgdQeIKm12oKYhcLTrBvPYWMYHoFv7ONfWsA7YbNxVcFylTJXLJdR6FeLKv7fY5fvf5Amg7Ntd5ahm0+njXoOUVQpkh/UVJlNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781874340; c=relaxed/simple;
	bh=0ZQwxPNvO8gZ0rUahUAog2a6UYkrW+8cM8n2YLVmX00=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VIaO3Sb+13UY40l6geAMrIqHvYybik1+tKtS/Zj4UmRRXHEP0k5laRcPQP/32V3LQsuZQ9IXMibSIjSpwt1YOUduheFgpUiALlJs7CW9FAQD74g/TSwm6z2kdvl0spXqukUQ5B/yyZo4pbM5WQVbprXIMcf+enRdXXVTi6eHYgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4Iao296; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4Iao296"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A3D1F000E9;
	Fri, 19 Jun 2026 13:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781874338;
	bh=Gs9y5qLiLbv3PWgEgfnGqQSM/+aTdbFR/fYUb8Ju2mc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B4Iao2961NaxyKSfTxFnJdNcVP7BNLSWlEUCaojaleEE+BuKreUGtBhvdIx/nDlIx
	 8pbiWyvH8eY4Q8wW+UtbUD9DZfr3vcXM0ucRj32oeLhatrx4+iZ7PeWo4rAPcjJBA7
	 mrIq2oHTWai1qKlivC3+8/NWZxtfPuM4ksgce6Etk6La67UobwM4SbeeKIWskvqV60
	 x+++Viwce1R7/cTTNwskMIDVLXZVm66USpFKrpReoejAyDmubZZHm6HIIeCEqJl8we
	 RMyybAr8CFSKRx8c3kx8ZoaCaJQyGBrlvuN3Uz19wL8DPZp991Lv1kmtdiEn/U5qFl
	 uFzBxQjK/S1nQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony
 IMX576 front camera support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Himanshu Bhavani" <himanshu.bhavani@siliconsignals.io>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260619125439.55311-4-himanshu.bhavani@siliconsignals.io>
References: <20260619125439.55311-1-himanshu.bhavani@siliconsignals.io>
 <20260619125439.55311-4-himanshu.bhavani@siliconsignals.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 13:05:37 +0000
Message-Id: <20260619130538.41A3D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch references an undeclared `camss` label in the device tree=
, which will cause a fatal Device Tree Compiler (DTC) error.
--

commit e341e6cf8035ff51f6898a2a0611940c2e725195
Author: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>

arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony IMX576 front camera support

This commit adds device tree support for the Sony IMX576 front camera
sensor. It connects the sensor to the CAMSS node via CSIPHY3.

> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm=
64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index 3964aae47fd4e..1cacd17e7c476 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts

[ ... ]

> @@ -547,6 +548,29 @@ vreg_bob: bob {
>  	};
>  };
> =20
> +&camss {

[Severity: Low]
Is the &camss label defined in the base device tree for this platform?

Looking at the base SoC device trees (sm6350.dtsi and sm7225.dtsi), it
doesn't appear that a camss node label has been defined yet. Extending it
here might cause a Device Tree Compiler error due to an undefined node.

Could the camss node and its label be missing from the base dtsi?

> +	vdd-csiphy0-0p9-supply =3D <&vreg_l18a>;
> +	vdd-csiphy0-1p25-supply =3D <&vreg_l22a>;
> +	vdd-csiphy1-0p9-supply =3D <&vreg_l18a>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619125439.5531=
1-1-himanshu.bhavani@siliconsignals.io?part=3D3

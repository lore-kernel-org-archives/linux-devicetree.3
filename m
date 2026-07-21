Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578053C2790
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 16:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649850; cv=none; b=WIz0BsXIIgEKsutBf2Xnynw8CDxRn6V5x5hAU/Uv0mPiPMDTyMAR2Qa109bPr46XA+qN4/zkK7yZJ0WbxuagIIE7Hr54xToKpw5ldJRuG/fGS9Nb79R2hoH3lUbJINUStDsk93uBO9qHwoquoQHikLCxBLUmQszHAM+RTgkb+5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649850; c=relaxed/simple;
	bh=qJ8mVx5+iYUul4kXIgpRBz78dQbLs/G5BH2PGZf5sqo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BXa8ABEzASnFbLAoJ21EK43AglOX8Pkv1O4kU2pYe9lkgvmAdzX4J92U2hcYIiyje4R/APPxdmwKn+m1tcZ/2BcYGxOK8KE+a9OYGRPaVth6zsUhiuXtfmQTf0aJ07IDNhWlaKL9+rDP1oU7H68zZaCO16GwB1NNGX9NKC5TEOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITGYpa16; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITGYpa16"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E81071F00A3F;
	Tue, 21 Jul 2026 16:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784649849;
	bh=IjGdkSufd4BLBy93CoEbjWEG/Sdr2PwAH2U6o7QkXbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ITGYpa16pj57oE9GaRokVWzPBmcE3izcxLwHsSKfxpHSAm79JrCxH3DE3qvXuPqtJ
	 2aTcZVsR6i2tXlZDrQns8gPBOBHIH3d4ldNNOHVSjwd26btwxhxjo8goU1HxsZ7K6g
	 /pI0vAHuB0A+hAW3CEKFwLSdyaGmb3fHpofNIi7+Vw8pgrUnLg2LimRWTbVXQv1pVV
	 mvbtgeTuKE/iX4pjy+4KR6XeeXJkgbU3fZYUjFdQ5vEIbvaGwe50R1thbNnCI7+iPe
	 UDv9kvX+Z5NRJsEPKST3N/00369LaHtpEUdM0IOWv9TGfZEzZxjWmOOJqKN3/8XZMO
	 uUHdo7cdwQtJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/5] arm64: dts: qcom: sm8550-hdk: add SPMI ADC
 channels and thermal nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260721-topic-sm8x50-adc5-gen3-v6-3-a507f4a1e537@linaro.org>
References: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
 <20260721-topic-sm8x50-adc5-gen3-v6-3-a507f4a1e537@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 16:04:08 +0000
Message-Id: <20260721160408.E81071F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch relies on a missing device tree bindings header `qcom-adc=
5-gen3.h` and its undefined parameterized macros (e.g., `ADC5_GEN3_DIE_TEMP=
(1)`), causing a fatal build error during device tree compilation.
--

--- Patch [3]: [PATCH v6 3/5] arm64: dts: qcom: sm8550-hdk: add SPMI ADC ch=
annels and thermal nodes ---
commit 2c615238ae0ec9a1d9073743da8ee2dd6a901c3b
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8550-hdk: add SPMI ADC channels and thermal nodes

This patch adds the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICs on the system. It also adds thermal nodes sorted by sensor
channel.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8550-hdk.dts
> index ee13e6136a825..b24c3d902385b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> @@ -280,6 +280,92 @@ platform {
>  		};
>  	};
> =20
> +	thermal-zones {
> +		skin-thermal {
> +			thermal-sensors =3D <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;

[Severity: Low]
Does this missing parameterized macro cause a build regression? It looks li=
ke
the required device tree bindings header for qcom-adc5-gen3 isn't included
here, which would leave these macros undefined during device tree compilati=
on.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-topic-sm8x=
50-adc5-gen3-v6-0-a507f4a1e537@linaro.org?part=3D3

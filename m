Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEF746A5FD
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 15:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648866; cv=none; b=ANUk4g1m8iHV1rdDi0Ru0lXixP9pDt5DnEdlm3C0+/FJCLXYlpDU/JL+27YcGrO2bg3GsTgYQZmdoprEAmM7qWEoZKmQPXi9Qac+xWfhbs2znpa5GU1NbdieQYzgl1mS6kfkvLcnN0uyKFGJUv285HChoqypmaNcvvxl0IbgdNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648866; c=relaxed/simple;
	bh=PPLeAVq2xPUeKRYUAATDABjGZe6Hlwz5c4cw9H4zd3Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ikumjiwd/UsdIdfKD3G2V0dycr/A1JNdikgSVH2VhD+KV0ZMLPKlZ1lXC4OC3orrdddW4i7JVLlRKPWx7+55Z331s7m5IiMEIytr45BLGoiM1MRkFV267se2UTpHCRwQEJO6U6Bgq+unDP4Gl8LPOOyTkCJz25TZxQoZbbRGaEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gX5Way/g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gX5Way/g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 057F01F000E9;
	Tue, 21 Jul 2026 15:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784648865;
	bh=pOPlFtp3nnDgQyJKKLlNzsuYFmCYtXpNFkz7b0ipxBQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gX5Way/gvRWHqLsqUR4qGqS2dKr2bzL3s97grG8NlhtgK12XUPa2IejX/DDv3EeMs
	 89nHm6gQ8I3OjGpXwDSRohpgQXWySLjbeaeV0W1gSVP2dZr5B7Bw1W11hn4zh6Liap
	 OgGhkmvlE+PUF5XlImUXBpUCjayjXC4t4zAqJht/UffJVVMBtUIB3DVHhimHphM3xQ
	 DY9TlRQhlsGcw0fg9xDcwjO01t4sqgoyGf/Oy1dtuJY0ymLppmUZSXYp8ZFvytCMai
	 Clm2cAFhhOMSuk9gEDlKhl3AXA4OjNyOql6Dpimri6nBonJ30qkTP5cyhUF6u6ZguJ
	 m3omCbBJgfiNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: sm8650-hdk: add SPMI ADC
 channels and thermal nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-topic-sm8x50-adc5-gen3-v6-5-a507f4a1e537@linaro.org>
References: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
 <20260721-topic-sm8x50-adc5-gen3-v6-5-a507f4a1e537@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 15:47:44 +0000
Message-Id: <20260721154745.057F01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The Device Tree unit-address for the PM8550VE ADC channel node does=
 not match its evaluated 'reg' property value, triggering a dtc warning.
- [Low] The patch series relies on an uncommitted header file ('qcom-adc5-g=
en3.h'), resulting in a build failure.
--

--- Patch [5]: [PATCH v6 5/5] arm64: dts: qcom: sm8650-hdk: add SPMI ADC ch=
annels and thermal nodes ---
commit 0f6771497277cdb9e2028ce4ba0b81d340cf6283
Author: Neil Armstrong <neil.armstrong@linaro.org>

arm64: dts: qcom: sm8650-hdk: add SPMI ADC channels and thermal nodes

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

The thermal nodes are sorted by the sensor channel to be
coherent with the system thermal nodes ordering.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dt=
s/qcom/sm8650-hdk.dts
> index eabc828c05b4c..2d6be57a2a80a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts

[ ... ]

> +&pm8550_temp_alarm {
> +	io-channels =3D <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(1)>;

[Severity: Low]
Is there a missing header dependency for this patch series?

It looks like ADC5_GEN3_DIE_TEMP() is being used as a function-like macro
here, which appears to rely on a qcom-adc5-gen3.h header that might not be
included in this series. Does this cause a build failure during dtbs
compilation?

> +	io-channel-names =3D "thermal";
> +};

[ ... ]

> +	/* PM8550VE Channel nodes */
> +	channel@503 {
> +		reg =3D <ADC5_GEN3_DIE_TEMP(PMK8550VE_SID)>;

[Severity: Low]
Does this unit-address match the evaluated register address?

Assuming PMK8550VE_SID is 8, ADC5_GEN3_DIE_TEMP(PMK8550VE_SID) would likely
evaluate to 0x803. If so, should the node name be updated to channel@803 to
match the reg property and avoid a Device Tree compiler warning?

> +		label =3D "pm8550ve_die_temp";
> +		qcom,pre-scaling =3D <1 1>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-topic-sm8x=
50-adc5-gen3-v6-0-a507f4a1e537@linaro.org?part=3D5

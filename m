Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754383D3321
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784654480; cv=none; b=ZSnMMr3cS2LNGsJXT9cxktigwMFpSRltQDBxZPyOKvW2bDCaP2NJrX8nf0Hb4A/B4rvGHDHU6cabS7Qz8kDJ6J4dzx+2S5nb/VJ/ScDPhG9pqaJV8SioTVaRN4fnbUufgpa7Q1rQpIGrO62Cz1ggIKa62CN/kXVvIgTNJYm4ajM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784654480; c=relaxed/simple;
	bh=zxarngOjehpK+LLePmfxBvII42tFbg+a1Qczkb8/w4I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RgDc9RMzIBL3VVY+ZdwJhQqT5TyTDiCpKayJ4zvPCktBuoQqMBd881PCq5MR+ecDbzJpa1agFD6gJHBFW9ot6hyLtfUknC36tW1HKiQJOklFUpfU/o0Z4Cm46xADXHzhz/MC5obvMMTa/vac3yJOpvrhybqShFx99kns45in6Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ba2eVvvK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ba2eVvvK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F841F00A3A;
	Tue, 21 Jul 2026 17:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784654479;
	bh=XmPPJhoqMgCrOAKq1WC7ZAhBlhHDriSGLnJ3/UN1ZP4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ba2eVvvKqFRtiD+Jk02j3xU86BKWuJ+HwYnCUa8761KpBMj3i4RWQgarzw9Ekh1Jt
	 puDxjMR0qQ8Cvqpqlc1kTspQOYj5GH255Na5g2vmFYC65EDFp4wO0OVSxRC4kmrIgd
	 qe/QNCrn2nij7IJlpKf93ZSX00wq3AaORgZQrvF0m/j5Q6HxAsyR4+NaWYgvUzJGkG
	 qQakcNqp/S45jn09ctp75QUJhzj0yGX3yjLM4tjH9niNazekt990VN1PXuq7YJmKer
	 aFH6DIhjL/nI597nCmWPMuo+4o4KKL/b67jLH6ws9h9vDbJ4xZUrYuqdQDDgZdOHbR
	 C9I2A/eAgsYFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A16
 (UX3607OA)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721-topic-a16_submission-v1-2-8ea213130d05@oss.qualcomm.com>
References: <20260721-topic-a16_submission-v1-0-8ea213130d05@oss.qualcomm.com>
 <20260721-topic-a16_submission-v1-2-8ea213130d05@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 17:21:18 +0000
Message-Id: <20260721172118.C5F841F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The touchscreen device node configures a reset pin in its pinctr=
l (`gpio48`) but fails to define a mechanism to actively drive it, leaving =
the hardware reset line unmanaged.
--

--- Patch [2]: [PATCH 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A16 (=
UX3607OA) ---
commit 368c4b6730238caef882ef682414d4f9a619d308
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

arm64: dts: qcom: glymur: Add Asus Zenbook A16 (UX3607OA)

This commit adds the device tree for the Asus Zenbook A16 (UX3607OA),
a laptop based on the Qualcomm Glymur platform. It also wires up the
system peripherals including the touchscreen, which is currently untested.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dt=
s b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
[ ... ]
> +&i2c8 {
> +	clock-frequency =3D <400000>;
> +
> +	status =3D "okay";
> +
> +	touchscreen@10 {
> +		compatible =3D "hid-over-i2c";
> +		reg =3D <0x10>;
> +
> +		hid-descr-addr =3D <0x1>;
> +		interrupts-extended =3D <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-0 =3D <&ts_default>;
> +		pinctrl-names =3D "default";
> +
> +		wakeup-source;
> +	};
> +};

[Severity: Medium]
Is the touchscreen device missing a reset-gpios property here?

Since there is no mechanism defined to actively drive the hardware reset li=
ne
(such as a reset-gpios property or a vdd-supply tied to a fixed regulator),
could this cause the touchscreen to remain in reset and fail to probe or
resume correctly from suspend?

[ ... ]
> +	ts_default: ts-default-state {
> +		reset-n-pins {
> +			pins =3D "gpio48";
> +			function =3D "gpio";
> +			bias-disable;
> +		};
> +
> +		int-pins {
> +			pins =3D "gpio51";
> +			function =3D "gpio";
> +			bias-disable;
> +		};
> +	};

[Severity: Medium]
Without an output-high property in this pinctrl state, does the kernel mere=
ly
mux the pin without actually driving the required deassertion level?

If the pin relies entirely on the bootloader's initial state, will this lea=
ve
the hardware reset line unmanaged during suspend and resume cycles?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-topic-a16_=
submission-v1-0-8ea213130d05@oss.qualcomm.com?part=3D2

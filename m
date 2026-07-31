Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057A82566F7
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785521886; cv=none; b=G2tgWFHkTHHJkze3+0IH3Z/hPLtrhuNS60KcxVu2/bQMSFV0qkOy2ZuYxM1juc06h8yLMUBGbpXKRxK/T8EDJKBc+J+RHNXykMxkY1KEAlW/n7Juq0hbSCabECid5Bk6+wSmAGZuQohQF7+82rSxrAL/f0glujA5MVilVQYdFBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785521886; c=relaxed/simple;
	bh=NVs4iHwQdAmJWjSJ1IMUJ2X440y44URVPih4imKEIIY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WSOFs44dHh1eeSB66OsBoq/VJbBzi/Vfp5uZ6WakyXQxBwZfODRxKkIla4/+hHIKOJR6LogoqvCvg5pR+c/fxUG2giMP42nFoNurwLC6ZNBKB/V6yt7SzTP0fxIxNpTl2xEkwajGlFvbbHpPqWQfM1WdvGeVBo25udyw8t6cqPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDztMzYu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDztMzYu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989321F00AC4;
	Fri, 31 Jul 2026 18:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785521884;
	bh=6ze8rm1SsGva9DUcLnPvtAERQkwYA6mo3iQMkSbA+Ac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MDztMzYuNnC88wRtF+oRjZFMo/0iIwzxiMz01QZKWW6MXVKF0bjNbQF6paZfNhi0x
	 xM8VPY9GC0ejISMiyhlRfr4149HuQZyU/A4/N3CCFHW21QddepFaxRwQwazpPXJ+lS
	 ejWzuI0apG2buWY4rRSkj19jhc3ci6RqLYMojetfEGplsvPkie9OsOXl9nHKoHqnwl
	 UHSXVi+nA7VbOU5CtPlsQ7+9vyppuagtP/+ntZVyEwKHiwuqJsJRMShuhdg2r8/ScK
	 u/X/6Mxu8cIIlfrXwPRnyzVLrcwmn+j5vxY+mlEepXud0+5WwEtUb4cDE5aJFAL56w
	 R198knP03Z0vQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: Add Glymur-based Lenovo Yoga
 Slim 7x Gen11
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260731-topic-yoga_submission-v2-2-f1887031da4f@oss.qualcomm.com>
References: <20260731-topic-yoga_submission-v2-0-f1887031da4f@oss.qualcomm.com>
 <20260731-topic-yoga_submission-v2-2-f1887031da4f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 18:18:04 +0000
Message-Id: <20260731181804.989321F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `lpass_vamacro` sound node is missing the `vdd-micb-supply` pr=
operty, which is required to bias the digital microphones.
- [High] The WCN7850 PMU is incorrectly configured with a 1.8V regulator fo=
r its 0.95V and 1.2V rails.
- [Low] Unused pinctrl state `nvme_sec_reg_en` defined in PMIC GPIOs.
--

--- Patch [2]: [PATCH v2 2/3] arm64: dts: qcom: Add Glymur-based Lenovo Yog=
a Slim 7x Gen11 ---
commit dd05ca8f0ca39458a10b38cd0e585f0cd4a934d3
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

arm64: dts: qcom: Add Glymur-based Lenovo Yoga Slim 7x Gen11

This commit introduces a new device tree for the Glymur-based Lenovo Yoga=20
Slim 7x Gen11. It mentions several working features, including audio playba=
ck
and capture, display, keyboard, touchpad, Wi-Fi, and Bluetooth.

> diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arc=
h/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
> new file mode 100644
> index 0000000000000..ecc8c34fb983b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts

[ ... ]

> +	wcn7850-pmu {
> +		compatible =3D "qcom,wcn7850-pmu";
> +
> +		vdd-supply =3D <&vreg_wcn_0p95>;
> +		vddio-supply =3D <&vreg_l15b_e0>;
> +		vddaon-supply =3D <&vreg_l15b_e0>;
> +		vdddig-supply =3D <&vreg_l15b_e0>;
> +		vddrfa1p2-supply =3D <&vreg_l15b_e0>;
> +		vddrfa1p8-supply =3D <&vreg_l15b_e0>;

[Severity: High]
Is the 1.8V regulator (vreg_l15b_e0) correctly assigned here?

The PMU's Always-On (vddaon) and Digital (vdddig) rails require ~0.95V,
and vddrfa1p2 requires 1.2V.

Connecting them to a 1.8V LDO could break power management or lead to
undefined behavior during WCN power sequencing.

[ ... ]

> +&lpass_vamacro {
> +	pinctrl-0 =3D <&dmic01_default>, <&dmic23_default>;
> +	pinctrl-names =3D "default";
> +	qcom,dmic-sample-rate =3D <4800000>;
> +};

[Severity: High]
Is the vdd-micb-supply property missing from the lpass_vamacro node?

Without the microphone bias supply configured, the VA macro driver cannot
enable the required regulator to power the digital microphones, which causes
audio capture to fail.

The commit message states "Audio playback and capture" is working, but it
seems this configuration is incomplete. The 1.8V regulator vreg_l1b_e0 is
defined in the device tree but unreferenced; was it intended for this?

[ ... ]

> +&pmh0110_f_e1_gpios {
> +	nvme_sec_reg_en: nvme-reg-en-state {
> +		pins =3D "gpio14";
> +		function =3D "normal";
> +		bias-disable;
> +	};
> +};

[Severity: Low]
Is this pinctrl state nvme_sec_reg_en used anywhere?

It appears to be completely unreferenced by any regulator or device.
The vreg_nvme regulator correctly references nvme_reg_en from
pmh0101_gpios instead.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-topic-yoga=
_submission-v2-0-f1887031da4f@oss.qualcomm.com?part=3D2

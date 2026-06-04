Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D9B1A6800
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780605055; cv=none; b=oV7UAcLDt5f4HgECa/UqnQFGU0agxjFVzTQFkUpNLcXbpH177i/3IsC9xL+GAOyyTk5aCyemwLYA3neFiD5BPmgg7M9xxxlxHQQlAKTCDNWNauTt6C8hRYMslL44sbAmea2t27oFsO4UdFQ9QdJqKnExLH7VnHsO5PfBiWZYT7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780605055; c=relaxed/simple;
	bh=tBrEaiWKFaYMJT1d8Hc7LrFnEaE28GkXLO3tnS7fca8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SJtsL40YqkqRSc4B2YngEK4YC0oCWsQ2ASFmH+I1dBCWuUIAdw6N9LnJToOTXL9a78IN/7aWXzGBsyrpQ6xodOMrI/c4cR16t7R2i8aGLwsTSRihQJ2VdqPoyQAz32+7JqrYLBlIoDnzXxJ2DU/assFkGsB5jqyQesa50nCDZ1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNs7nGVe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNs7nGVe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED4B1F00893;
	Thu,  4 Jun 2026 20:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780605053;
	bh=KkJGfuhiSJ5B53mNHgtwzsHHAF7qVFocM8B16/P4J9o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CNs7nGVea9rS0/sfu0qBKRqBIiAHRy7rTJPnwnTRH4WrLHqQPZcPdktG1By1O/FyH
	 OYToCguAONGMr0uyr46E1OtbfF545ZM/NWxF+xxaFFlgDqBXAtjyZ8hEISDa1NZb+e
	 MCTLNFm0h+jiSqw3MrbQ/UQlphDj3Vo+U917b5G8uW6wy5FLybvj10CVH5EMnRZAsA
	 4UzKWxhuQhCxeOWoi4U19X4GEJrwR2corUuDbTIhZCcM/p0vObT2wnXWlYWkNSzvSx
	 qPvBrqSMiukXmxj69PEt4muJRMIW7P/IPUTVNEsZMpHddFg22TVkwvONmtp3NOcIKZ
	 tFtMaUrBar7dQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle:
 add initial device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Erikas Bitovtas" <xerikasxx@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260604-yukon-eagle-v3-2-9e3b57d306a8@gmail.com>
References: <20260604-yukon-eagle-v3-2-9e3b57d306a8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 20:30:53 +0000
Message-Id: <20260604203053.8ED4B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] [Valid Concern] Missing pinctrl configurations for board-specifi=
c GPIO and interrupt pins.
--

commit 0d3ad64620f5f2b167411a5e45e162a58e8c3259
Author: Erikas Bitovtas <xerikasxx@gmail.com>

ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle: add initial device tree

This commit introduces the initial device tree for the Sony Xperia M2
(sony-eagle) smartphone based on the Qualcomm MSM8926 SoC. It enables
initial support for features such as the framebuffer, storage, sensors,
and GPIO buttons.

> diff --git a/arch/arm/boot/dts/qcom/msm8926-sony-xperia-yukon-eagle.dts b=
/arch/arm/boot/dts/qcom/msm8926-sony-xperia-yukon-eagle.dts
> new file mode 100644
> index 0000000000000..2c1e5755a50af
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/msm8926-sony-xperia-yukon-eagle.dts

[ ... ]

> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +
> +		button-camera-focus {
> +			label =3D "Camera Focus";
> +			gpios =3D <&tlmm 108 GPIO_ACTIVE_LOW>;

[Severity: Medium]
Are the pinctrl configurations missing for this GPIO and other external
interrupt lines in this device tree?

Nodes such as this gpio-keys button, accelerometer@f, light-sensor@48,
nfc@28, and sdhc_2 utilize GPIOs and external interrupts but lack explicit
pinctrl-names and pinctrl-0 properties.

Without explicitly defined pinctrl hardware states, the pinmux and bias
states remain strictly dependent on bootloader defaults. Could this lead to
undefined peripheral states or spurious interrupts across suspend/resume
cycles or with different bootloader versions?

> +			linux,code =3D <KEY_CAMERA_FOCUS>;
> +			debounce-interval =3D <15>;
> +		};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-yukon-eagl=
e-v3-0-9e3b57d306a8@gmail.com?part=3D2

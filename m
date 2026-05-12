Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D3F2566E9
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778548267; cv=none; b=iXILW6xYPn0Ds6us8qHb94qsSgQzQ9KMfkY4hYfVX2OiHu4+RJPUqYxVR2h4QLZ++FzHNSI8VLZrb9WFBpqrQYSy/+5qOqZMwFiL/kS5FKzCVL2aeD/n9FSPoVG0Cc1aJk4CqswUU5a4N3wDxNl9a2T60Eh/Q/h7/z/TjlbGLa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778548267; c=relaxed/simple;
	bh=0M7zHqFMTE8oEUzN1/IxVrTZQ8kO8+67/hFIkpbAiCo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XBf40E15DwZyoPmJ/bVV2cV0waxKeRU86MUZkh30iFuzfFCkXJs2zYsNfxWeftmnm8T4t7QfhpJVG1nlmYEZ2gSIYjznvlRkrPZfIFo5uCvvy8HmQcMTeNj0YICEm/287N/ezEyFTiE0xHgu8zmn09LCPkdm+VyqOvMuJGB0nKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DwN0RQAo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DwN0RQAo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7301C2BCFB;
	Tue, 12 May 2026 01:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778548267;
	bh=0M7zHqFMTE8oEUzN1/IxVrTZQ8kO8+67/hFIkpbAiCo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=DwN0RQAoGOi0QF+MloO3OCzolx3URyIzV68xwltXZZK/QwA4IgSPq2yKKVJZH1onv
	 RVu9/fJcWtYGqyAaldVIx1TyBXaQG4Qszyz4oL4ewZm/kgJNXZp87LtHbhxGjKUdkT
	 v7gL5FOBa1OLRrBpobzo95LwfwxNaTnP37G3+84a3B3swJxZLEY/Mxlyey9sfwWllb
	 xaz1GFMNrCWrF3Qb/CeFG1yX2ifkwrT2NMFQjxyrTCyyXfvhdXqmQfd18OpbpRwWBR
	 Z5C/mgTlsTLyguTDyypTtC5lE371IV9qGqKPl7gUZy8Z4H/Zy4K6XD83CBIhFFtEhg
	 +xjMgYe1km9ZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/9 RESEND] ARM: tegra: lg-x3: Set PMIC's RTC address
Reply-To: sashiko@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260511074859.24930-3-clamor95@gmail.com>
References: <20260511074859.24930-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 01:11:06 +0000
Message-Id: <20260512011106.B7301C2BCFB@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The DT patch sets a non-standard RTC address (0x48) via a secondar=
y `reg` property, but the rtc-max77686 driver ignores it and uses a hardcod=
ed address (0x68). As a result, the commit fails to fix the RTC, leaving it=
 non-functional.
--

commit 034a90db28ba53add991c38ac94042a85b474aec
Author: Svyatoslav Ryhel <clamor95@gmail.com>

ARM: tegra: lg-x3: Set PMIC's RTC address

This commit updates the device tree for LG X3 devices by adding a secondary
I2C address for the max77663 PMIC's RTC module. The intention is to
override the default RTC address because it is located at a non-standard
address on this board.

> diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/=
dts/nvidia/tegra30-lg-x3.dtsi
> --- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
> @@ -1297,7 +1297,8 @@ pwr_i2c: i2c@7000d000 {
> =20
>  		pmic: max77663@1c {
>  			compatible =3D "maxim,max77663";
> -			reg =3D <0x1c>;
> +			reg =3D <0x1c>, <0x48>;
> +			reg-names =3D "pmic", "rtc";

Does the rtc-max77686 driver actually parse this secondary reg property?

Looking at the driver, it appears to use a hardcoded address via
devm_i2c_new_dummy_device(..., info->drv_data->rtc_i2c_addr), where
rtc_i2c_addr is fixed to 0x68.

Without companion changes to the driver to read the reg property or use
i2c_new_ancillary_device(), it seems the driver will still attempt to access
the RTC at 0x68 and ignore the 0x48 address specified here.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511074859.2493=
0-1-clamor95@gmail.com?part=3D2

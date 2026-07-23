Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE973612F3
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 17:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828598; cv=none; b=lLrFX4du9ThHPmHIuBzcIR169SGp60dEPs4YCrn2RFny7E4Uq14AvMvYOZZp9AtZ03Rv9lE3CDjiubyvvWPdFbBSXihisQzRYVEws2uGoVU0FF5AyZrASpOth6td2taTzfPBwRTUQhoObszu1Ifw4MGDlq+nFA7mlp8+w3dyPg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828598; c=relaxed/simple;
	bh=xc/4iQGhRJTIjnSHfRet6HTu0ak5mNSo+b8pGgU6+kg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FMf4oq5QZN5jsowuEfzQGfpDKcObwfH2rwQMJuZ+D+6TQEPKXBOO/KfUri16h94vTYeCIeJdNn8YJGPzfouu4Zjvagt5nLsFYd/WCkEHrpNmyT051ByxJELOSELqxKXx1/4sEMmwFMm5ZFkmnDBXGvZB6c1D1/wQa4+a3fdvHP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mp9oxeR6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mp9oxeR6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B5F1F00A3A;
	Thu, 23 Jul 2026 17:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784828590;
	bh=BuOXHyt93qUrAQbcxyc0zeQQZo3uvkRGT8eZRfQ3H9o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mp9oxeR6KZNLtd+Q/TJ5roxUlUNvYDYRjPKp5cs/1nk2EBkTH+eG30TFFVO2KNcL0
	 0zVwR/RwMsRtwPaBilS0HCzify31ffw8MowUjVDOVNxE/ixyScjjBTZmgavRIVM3y+
	 t7jUMaX6q/4ljpXyndwHgH1suYFElLe+ZtmGVSpEKvRbUkPTpxAsk+fysPPOutvLp6
	 jBNWlQ/cqXyn+E86JMNiJaiggXbsL+gTz2CsGKgHtjgCB6wkNuT9UZOEAMBpldvaOV
	 8/0jdlYDVc7UdefrlIajc8IA2UdbOzlgEHHywOgJWOFNNm6HK+ATLpr4h+aUwjB9Sn
	 MbmdpDSi85fig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: exynos7870-j6lte: add Sharp GP2AP070S
 proximity sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260723-gp2ap070s-v1-3-b8ca3a4c10dd@disroot.org>
References: <20260723-gp2ap070s-v1-0-b8ca3a4c10dd@disroot.org>
 <20260723-gp2ap070s-v1-3-b8ca3a4c10dd@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 17:42:52 +0000
Message-Id: <20260723174310.58B5F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The device tree explicitly configures the pins for a bit-banged =
`i2c-gpio` bus to an alternate hardware function (`EXYNOS_PIN_FUNC_3`), whi=
ch contradicts the use of the GPIO controller.
--

--- Patch [3]: [PATCH 3/3] arm64: dts: exynos7870-j6lte: add Sharp GP2AP070=
S proximity sensor ---
commit 930975d14f401bcd9e271c568ee73bd61323dc94
Author: Kaustabh Chakraborty <kauschluss@disroot.org>

arm64: dts: exynos7870-j6lte: add Sharp GP2AP070S proximity sensor

This commit adds a devicetree node for the Sharp GP2AP070S proximity sensor
on the Exynos7870 j6lte platform. It sets up an i2c-gpio bus for the sensor
and configures a dedicated fixed regulator for the sensor's VDD supply.

> diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts b/arch/arm64=
/boot/dts/exynos/exynos7870-j6lte.dts
> index de30d0970336f..dd493138fed6e 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts

[ ... ]

> @@ -579,6 +624,12 @@ bt_enable: bt-enable-pins {
>  		samsung,pin-pud =3D <EXYNOS_PIN_PULL_DOWN>;
>  	};
> =20
> +	i2c_proxm_bus: i2c-proxm-bus-pins {
> +		samsung,pins =3D "gpf4-3", "gpf4-2";
> +		samsung,pin-function =3D <EXYNOS_PIN_FUNC_3>;

[Severity: Medium]
Does this pin configuration conflict with the i2c-gpio usage?

This node configures the pins to an alternate hardware function
(EXYNOS_PIN_FUNC_3) rather than GPIO, but it is referenced by the
bit-banged i2c-proximity node.

When the i2c-proximity device is instantiated, the pinctrl core applies
this state. Shortly after, the i2c-gpio driver probes and requests the pins
via gpiod_get(), which causes the pinctrl driver to silently overwrite the
pin function back to GPIO input/output.

While the driver ultimately recovers the pins for GPIO usage, configuring
them to an alternate hardware function initially creates a window where the
pins might be driven by an uninitialized hardware IP block. This risks
causing spurious signals or electrical contention on the I2C bus during
boot.

> +		samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
> +	};
> +
>  	wlan_enable: wlan-enable-pins {
>  		samsung,pins =3D "gpd3-6";
>  		samsung,pin-function =3D <EXYNOS_PIN_FUNC_OUTPUT>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-gp2ap070s-=
v1-0-b8ca3a4c10dd@disroot.org?part=3D3

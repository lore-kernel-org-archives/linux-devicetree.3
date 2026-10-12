Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B593C4C7522
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 18:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829261; cv=none; b=rZcn5wGwSTAraVXQnQq2jPE80XxzjvGWh33vXi3UiDryky/SlSBhSdiIwi5IULAaHT4tvQiHIWEgO3jznCPn7hbI/zVI/hWLsZFmKOl2FKssTKfmwRHXlQSGOQEGgKjuR5UrHLR/EUA92d1ooiX87cR1JnUg2DjUIO07+mSOl4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829261; c=relaxed/simple;
	bh=pOL2daYnU6q+AiS/l9dI37WfWDdUpF0+U/7dIlI/2k8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=BPqwS/UjlVNzeKFSAZKa1bKgIyPERhlktFewF8flLciF1jXZYgy3ynAhYXGC9LrNRzyseIpglnrGbZc/FzJiTLNwwp0x6afHFYAe9dPTWGLiNlp4wCnk/Hhwqc+dx1J3gawFw79mDc85KDJCERVE50+bWhuaRAXl0DiYzdJynUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AAQbReAr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AAQbReAr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DB91F008A1;
	Mon, 12 Oct 2026 18:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791829260;
	bh=UKBv/lNgMn3J+5fPLHIbgDeeo1zR5yYTK9Hoe5Hu9Bk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AAQbReAr8fpkAteotd5EJm3/uquAn+XtFpEj7lxKuWSULBBstcDfOn+7jSclTbSx5
	 RUOJeUGDQywvP2zQUQQpx7jhnRbbuEdCgzBB55PW/o1D/HxL0oYqtd1vydSMdog1j1
	 8GUuxuFCHrcQk/xI6+oZoNiWhe86SnUR0ob7FkdjiXnyBBE0RBvPQHzGTzaD4QkPls
	 ohflYOH+A/uXWRqYBy1wAr1F9it8ELXNAYfiJfBegzL/9o28v3L+fUo3vb/THMWO/u
	 x/fyABorx+WZMpzH92QTExx+beWrv5/S+vuzxqHLa/0xcNnejqXCDeii0M0MLvgnot
	 gzi7htopLvUYw==
Message-ID: <sashiko-outbox-168532@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Weiss" <luca.weiss@fairphone.com>
Cc: conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 18:20:59 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dt: qcom: swapped regulators for usb_1_qmpphy (vdda-phy vs vdda-pl=
l)
- [Medium] dt: qcom: mismatched GPIO for touchpad interrupt and pinctrl
--

commit 6783a272db1b782f7b019b76b1616193bd1640d7
Author: Jasper Korten <jja2000@gmail.com>

arm64: dts: qcom: Add Samsung Galaxy Book2 Go

Adds initial device tree support for the Samsung Galaxy Book2 Go laptop
based on the Snapdragon 7c+ Gen 3 (SC7280) SoC. This includes support for
the display, input devices, storage, networking, and standard peripherals.

> diff --git a/arch/arm64/boot/dts/qcom/sc7280-samsung-galaxy-book2-go.dts =
b/arch/arm64/boot/dts/qcom/sc7280-samsung-galaxy-book2-go.dts
> new file mode 100644
> index 0000000000000..fe1a1b01f67e8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7280-samsung-galaxy-book2-go.dts

[ ... ]

> +&i2c0 {
> +	clock-frequency =3D <400000>;
> +
> +	status =3D "okay";
> +
> +	/* SSTP0001 */
> +	touchpad@40 {
> +		compatible =3D "hid-over-i2c";
> +		reg =3D <0x40>;
> +		hid-descr-addr =3D <0x0e>;
> +
> +		interrupts-extended =3D <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
> +
> +		vdd-supply =3D <&vreg_l7c_3p0>;
> +		vddl-supply =3D <&vreg_l18b_1p8>;
> +
> +		post-power-on-delay-ms =3D <2>;
> +
> +		pinctrl-0 =3D <&hid_touchpad_default>;
> +		pinctrl-names =3D "default";
> +
> +		wakeup-source;
> +	};
> +};

[ ... ]

> +&tlmm {

[ ... ]

> +	hall_int_default: hall-int-state {
> +		pins =3D "gpio35";
> +		function =3D "gpio";
> +		bias-disable;
> +	};
> +
> +	hid_touchpad_default: hid-touchpad-default-state {
> +		pins =3D "gpio61";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-pull-up;
> +	};

[Severity: Medium]
Will this misconfigure the touchpad interrupt pin?

The touchpad@40 node defines its interrupt on GPIO 51 but specifies its
pinctrl state as hid_touchpad_default, which configures GPIO 61 instead.

Because the actual interrupt line is GPIO 51, it will not receive the
required pull-up, and an unrelated GPIO will be configured. Can this lead to
a non-functional touchpad or spurious interrupts during hardware
initialization?

[ ... ]

> +&usb_1_qmpphy {
> +	vdda-phy-supply =3D <&vreg_l6b_1p2>;
> +	vdda-pll-supply =3D <&vreg_l1b_0p8>;
> +
> +	status =3D "okay";
> +};

[Severity: High]
Are the regulators swapped for the USB QMP PHY?

The usb_1_qmpphy node binds vdda-phy-supply to vreg_l6b_1p2 (1.2V) and
vdda-pll-supply to vreg_l1b_0p8 (0.8V).

Typically, the QMP PHY core domain expects around 0.88V, and the PLL
domain expects 1.2V.

Will this overvolt the core domain to 1.2V and undervolt the PLL domain to
0.8V, breaking USB SuperSpeed functionality and potentially posing a risk
of hardware damage when the regulators are enabled on boot?

> +
> +&venus {
> +	firmware-name =3D "qcom/sc7280/Samsung/galaxy-book2-go/qcvss7280.mbn";
> +
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-book2go-v1=
-0-7188e7ea7a15@fairphone.com?part=3D3

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED1F4C8FE2
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784645402; cv=none; b=SBlVCItfI4k7hKxOHKgrtE0RWPKrrNWUclQXkgxIBkOw+UEC2IdHgUOfuOUheS6mk37n3SDhCUeApCXr2pc8wYxjDyIJ9ZQUvlqsPy0GdkcChHazJMEf5xgyjy2bc7U507lovaOri/JVriNGSPSt9ePLb6xu/JMuVQjiiLOvQnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784645402; c=relaxed/simple;
	bh=YiDB+7rUlMtZ/TwInHRgAjkchIuH7Wm9Mg6r/I92z+4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nVT+XgbJkPg2T4q+91DnbYaw6GjMtyUMre3FtXx2+3ZV96dtrgJ8SnYH6NPQYlLuir17b0ATJ+311QDPjU985FCz7Qr7AA83OANiwyu6J28uqwvkus0nZ2Fl2LFTp8kbUs7Q72zDn7/RGS6C4MFhhYaPb1rz6wETsiMwEMccnvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fo/UHsg8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fo/UHsg8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932F81F000E9;
	Tue, 21 Jul 2026 14:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784645400;
	bh=SG68+mhdJ549LMOthZyzXx/09NGI8aidp8tCRJnLiDc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fo/UHsg8dW+bHHyIIYRX+AZYDfQ/Ghc0KzkSLfnMqKkafhmdP1aJSkUHp6VJzBlzc
	 qKTwWNVuF8iMuYZodX2jbnDytxXzoFeSM41oPExKX/kJuHtxoNlUe2tv9AMoVpuNNo
	 IBrFWqGkBQyyjs8MXVsd3/SfpuUpZfFkdQJCLsl3e8/T2Cyoo2eR1WYQIo7wLK8yRm
	 Y4RNGeEN6uqvjZ2AbWCa9UTrrHgH/gxotMQGVVSyiFrbEEOPyzYeuRbe3HqSSkcfV+
	 zbpyFU7/xeQaQrVNSqHSuLpb8NtyqCd9/vIfPSVYmEHcHjPk2vrhugUeYb5t+i5kO0
	 DLH0ZjLb3S97Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro
 (sheng)
Reply-To: sashiko-reviews@lists.linux.dev
To: code_0002@163.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721142147.1618-1-code_0002@163.com>
References: <20260721142147.1618-1-code_0002@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 14:49:58 +0000
Message-Id: <20260721145000.932F81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Multiple `cs35l43` audio amplifiers share the exact same `reset-gp=
ios` without non-exclusive flags.
- [High] Specific hardcoded Bluetooth MAC address in the device tree.
- [Low] Several nodes use undocumented compatible strings that lack upstrea=
m bindings and drivers, and the backlight node violates existing bindings.
--

--- Patch [1]: [PATCH v2] arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro (=
sheng) ---
commit 60dbe1c9d61443d5cd6de8980b141b0f56a24a53
Author: map220v <map220v300@gmail.com>
arm64: dts: qcom: sm8550: add Xiaomi Pad 6S Pro (sheng)

Add device tree for Xiaomi Pad 6S Pro (sheng) based on SM8550.

> diff --git a/arch/arm64/boot/dts/qcom/sm8550-xiaomi-sheng.dts b/arch/arm6=
4/boot/dts/qcom/sm8550-xiaomi-sheng.dts
> new file mode 100644
> index 0000000000000..170a67b37b7a6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8550-xiaomi-sheng.dts

[ ... ]

> +&i2c1 {
> +	status =3D "okay";
> +
> +	backlight: backlight@11 {
> +		compatible =3D "kinetic,ktz8866a";
> +		reg =3D <0x11>;
> +		vin-supply =3D <&vph_pwr>;
> +		enable-gpios =3D <&tlmm 128 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Are the compatible strings for this node and display_panel (kinetic,ktz8866a
and novatek,nt36532e) planned to be documented upstream? Without bindings,
these out-of-tree compatible strings will generate warnings during dtbs_che=
ck
validation.

[ ... ]

> +&i2c5 {
> +	clock-frequency =3D <1000000>;
> +	status =3D "okay";
> +
> +	cs35l43_trl: cs35l43@40 {
> +		compatible =3D "cirrus,cs35l43";
> +		reg =3D <0x40>;
> +		interrupt-parent =3D <&tlmm>;
> +		interrupts =3D <98 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios =3D <&tlmm 90 GPIO_ACTIVE_HIGH>;

[Severity: High]
Since multiple cs35l43 amplifier instances all specify the exact same
reset-gpios, won't the GPIO subsystem's exclusive access guarantees grant t=
he
GPIO to the first probing instance?=20

It seems the other instances will fail to probe with -EBUSY, which would
break the other audio amplifiers on the device. Might a gpio-reset controll=
er
node be needed to share the reset GPIO correctly?

[ ... ]

> +&uart14 {
> +	status =3D "okay";
> +
> +	bluetooth {
> +		compatible =3D "qcom,wcn7850-bt";
> +
> +		local-bd-address =3D [ 24 00 00 00 5a ad ];

[Severity: High]
If the bootloader fails to dynamically overwrite this property on production
units, won't all devices running this kernel share the exact same Bluetooth
MAC address? Using [ 00 00 00 00 00 00 ] is standard practice to ensure
bootloader patch failure is obvious and doesn't lead to widespread MAC
collisions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721142147.1618=
-1-code_0002@163.com?part=3D1

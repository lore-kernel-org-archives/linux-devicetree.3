Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03AB2EEE92
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787316157; cv=none; b=N6oMvQkbwGZp9IbleMsOxJUQIkQVodBMJm5w9Wk8Doyx2BxyGwr9Faaq+tRn9u1YgyoNpnZxIFQ9N6u6nPyTltr6K3wkXHQ40VGYB1rk3juuaZAnE9AiVC47fF0ASOODTbe/WrBlQnJ9ri/IMfsTN7fTItCsem7GMYSa9J+7Mv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787316157; c=relaxed/simple;
	bh=NRPcdfqRtIkrpI4kW24OnOX4mFpe+e3T0HCobS+dYh4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QZrT7ciQyv46guJElMRqJ8/9Alsdi2W/GBBtHghOU6udRrTgSh2M9llnCfHE7gTu11cY5t43M8ermBa12g0UzqrE0YLci96Js7T7QNtzI0/3pHv6/nN1YP3XmCfYhCA2A6b7CrXrmyhh39u9oyZDvshyCqRo8veDxQB2dQzwt/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bb/DZ4Hb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bb/DZ4Hb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D5001F000E9;
	Fri, 21 Aug 2026 12:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787316154;
	bh=0+zqm44IcHgq08CLCj0YE+6sVyUOClzlzRhTg32hx+s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bb/DZ4HbX2mQ3vvNlUA+AdC2olINFTq/7mYmRiYsr73trfjXlRNHUEEf64W/QbLsj
	 ucDOq0HClSA4/HnwbMofcrTSVscJszo+/ytiSbOSxLplMwNdu3RxrlT1wpPY/WeLN9
	 OXLism+7zdR9DA6qfTD5xql1rIlOhIiheAgW6mb9wVjsYR43TKJDXSuyz/liWYxwOm
	 uU3dJzDosXOgWGQqWl8KDqZLJ6PbnUs50MQvBWLBsR+5octWAC0jj1ptB84BmpKxg0
	 HwiDzVokZ3bamFlPm/zi2A5enLBhWqCPcgqZpkCb4382r4b+ejneZw7+hSXYXbH8Z5
	 XuGOXOoGJ9O1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/7] arm64: dts: qcom: Add LeEco Le2
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Skladowski" <a39.skl@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260821-next-patches-v5-5-ec81cee63e09@gmail.com>
References: <20260821-next-patches-v5-0-ec81cee63e09@gmail.com>
 <20260821-next-patches-v5-5-ec81cee63e09@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 12:42:34 +0000
Message-Id: <20260821124234.8D5001F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] TUSB320 Type-C controller interrupt is incorrectly configured with=
 a rising edge trigger, causing missed events.
- [Medium] Incorrect touchscreen reset GPIO polarity prevents touchscreen i=
nitialization.
- [Medium] WLED node is not enabled, contradicting the commit message claim=
s.
--

--- Patch [5]: [PATCH v5 5/7] arm64: dts: qcom: Add LeEco Le2 ---
commit bf1cb1abb3fe575b45f1473fbbd547b3fb860088
Author: Adam Skladowski <a39.skl@gmail.com>

arm64: dts: qcom: Add LeEco Le2

Add a devicetree for the LeEco Le2 smartphone, which is based
on the Eldarion/MSM8976 SoC. This adds support for I2C peripherals,=20
regulators, WLED, remoteprocs, and GPU.

> diff --git a/arch/arm64/boot/dts/qcom/msm8976-leeco-s2.dts b/arch/arm64/b=
oot/dts/qcom/msm8976-leeco-s2.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8976-leeco-s2.dts

[ ... ]

> +&blsp1_i2c4 {
> +	status =3D "okay";
> +
> +	touchscreen@4b {
> +		compatible =3D "syna,rmi4-i2c";
> +		reg =3D <0x4b>;
> +		interrupts-extended =3D <&tlmm 65 IRQ_TYPE_EDGE_FALLING>;
> +
> +		pinctrl-0 =3D <&touch_default_state>;
> +		pinctrl-names =3D "default";
> +
> +		reset-gpios =3D <&tlmm 64 GPIO_ACTIVE_HIGH>;

[Severity: Medium]
Is this GPIO polarity correct for the Synaptics RMI4 controller? The hardwa=
re
typically uses an active-low reset.=20

If configured as active-high, the driver will drive the line low during nor=
mal
operation, which might hold the touchscreen controller in a perpetual reset
state and prevent initialization.

> +
> +		vdd-supply =3D <&pm8950_l17>;
> +		vio-supply =3D <&pm8950_l6>;

[ ... ]

> +&blsp2_i2c2 {
> +	status =3D "okay";
> +
> +	haptics: haptics@5a {
> +		compatible =3D "ti,drv2604";
> +		reg =3D <0x5a>;
> +		enable-gpios =3D <&tlmm 109 GPIO_ACTIVE_HIGH>;
> +		mode =3D <DRV260X_LRA_MODE>;
> +		library-sel =3D <DRV260X_LIB_LRA>;
> +	};
> +
> +	tiusb320: typec@47 {
> +		compatible =3D "ti,tusb320";
> +		reg =3D <0x47>;
> +		interrupts-extended =3D <&tlmm 21 IRQ_TYPE_EDGE_RISING>;

[Severity: High]
Will this rising edge trigger work for the TUSB320 hardware?=20

The TUSB320 uses an open-drain, active-low INT_N signal that is pulled low
when an event occurs and remains low until serviced.=20

If configured as a rising edge, the interrupt handler might not run when the
signal is asserted. This could prevent the interrupt status from being read,
which would mean the chip never releases the line, deadlocking the interrupt
mechanism and missing attach/detach events.

> +
> +		pinctrl-0 =3D <&tusb320_int_active>;
> +		pinctrl-names =3D "default";
> +	};
> +};

[ ... ]

> +&pm8950_resin {
> +	linux,code =3D <KEY_VOLUMEDOWN>;
> +
> +	status =3D "okay";
> +};
> +
> +&pmi8950_wled {
> +	qcom,current-limit-microamp =3D <20000>;
> +	qcom,enabled-strings =3D <0 1>;
> +	qcom,ovp-millivolt =3D <29500>;
> +};

[Severity: Medium]
Does this node need a status =3D "okay"; property added here?=20

The commit message mentions WLED support is included in this initial
submission, but the pmi8950_wled node is usually defined as disabled in the
base pmi8950.dtsi file. Without an explicit okay status, this hardware
functionality might remain disabled.

> +
> +&rpm_requests {

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-next-patch=
es-v5-0-ec81cee63e09@gmail.com?part=3D5

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD233347505
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 09:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528653; cv=none; b=F5LBQza+l+j3fSk21zAEGIf370g1CcYLbJ0dwB5ybp94hpJEyQLuDgTjxnZo1KATozXM10RSXvHY6aSmgc9RPh47avBcGja1Ri3N+55XY3J7sk/3HlFbYdXNvWGlgsTxmqwumRZ2eFql4d1SutqwwTcWhaz2xPHCsyKGyKDmRX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528653; c=relaxed/simple;
	bh=b6WAisBQL4lc/fw+hO3SS1g7kRrUL8HT+U9ky9Zjz9c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NP6oZBNF8ejYphjMfMJ60Mxz7f/600q1LMFKJ1574k0u1qLWboWt6AiZQgjiBvBQ9CoX/io+Dqm79wmr+uUQZaqDXlFdyUKyg2PaO+bLtfLnQqVzN+SHXVv8V8/8LQtXmXa8uzSH+Uv9ONR26Zk0eqhXX63zj1+PqWm+ecX/af8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bxsJquPi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bxsJquPi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E55F1F000E9;
	Wed, 12 Aug 2026 09:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786528651;
	bh=mCnVnYW43xYrc4Ax7r9QyaYtlrlkWSqsSs0bKqFK/kI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bxsJquPisKa03HfETDZur6KkjhneS+joClXw7lhpbrLMtGe8sqA11OrgS3aO60KfK
	 LehJpXD/KJau7PTNjANztwCKpmee3XmMMOUlKQYSUxs4J0B229qJi/G/zIfV7Z1LWf
	 Ek1AaVDw+DW06h1S+99iUBctNHm5XS1FFBvogpftO1fTUm3vMnGIPdlUJPwjGsqM1X
	 zrFYAbykuGFNzXkc/Bzcfslloj8STzjW/8Ie0P96iHEYFgOtvWKz2QWv8iiAx9kCJh
	 vJ0pPpgl+0SN97fmztkPnQA0PBh1SCJRAyQeW8AOS4N86K+Z08MgNRiFPW5AtdHZb8
	 8tcVNYu1XgmIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/14] arm64: dts: qcom: ipq5018: Enable USB
 Super-Speed PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: linux-phy@lists.infradead.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com
In-Reply-To: <20260812-ipq5018-usb3-v2-13-8f355d7ff0ef@outlook.com>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-13-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 09:57:29 +0000
Message-Id: <20260812095730.9E55F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Power Management Regression: Missing `vdd-supply` on `usbphy0` cau=
ses USB 2.0 to lose power when `usbphy1` is suspended.
- [Medium] Missing Pin Control Configuration for the 5.0V Regulator GPIO.
- [Low] Misleading Devicetree Node Name for 5.0V Regulator.
--

--- Patch [13]: [PATCH v2 13/14] arm64: dts: qcom: ipq5018: Enable USB Supe=
r-Speed PHY ---
commit 0e34c498b874a88fdd6ad0b61268476b5d10f482
Author: George Moussalem <george.moussalem@outlook.com>

arm64: dts: qcom: ipq5018: Enable USB Super-Speed PHY
   =20
Add the 5V supply regulator and enable USB Super-Speed PHY support.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/=
boot/dts/qcom/ipq5018-rdp432-c2.dts
> index fcd5a078a2b08..0b147c9529149 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> @@ -22,6 +22,14 @@ aliases {
>  	chosen {
>  		stdout-path =3D "serial0:115200n8";
>  	};
> +
> +	regulator_fixed_5p0: regulator-s0500 {

[Severity: Low]
This isn't a bug, but the node name regulator-s0500 implies a 500mV supply.

Since the regulator is explicitly configured for 5000000 microvolts, could=
=20
this cause confusion? The fixed-regulator device tree binding schema typica=
lly=20
prefers regulator-5v0 for a 5.0V regulator.

> +		compatible =3D "regulator-fixed";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-name =3D "fixed_5p0";
> +		gpios =3D <&tlmm 24 GPIO_ACTIVE_LOW>;

[Severity: Medium]
Does this rely on the bootloader to leave the pin multiplexed as a GPIO?

There are no corresponding pinctrl-0 states defined or assigned here to
guarantee that gpio24 is multiplexed as a general-purpose GPIO rather than
an alternate function.

If the bootloader leaves it in the wrong electrical state, could USB power=
=20
initialization silently fail?

> +	};
>  };

[ ... ]

> @@ -117,6 +125,12 @@ &usbphy0 {
>  	status =3D "okay";
>  };
> =20
> +&usbphy1 {
> +	vdd-supply =3D <&regulator_fixed_5p0>;

[Severity: High]
Will this cause USB 2.0 devices to lose power when usbphy1 is suspended?

The single 5V GPIO regulator provides power for the port used by both
usbphy0 (USB 2.0) and usbphy1 (USB 3.0 SS).=20

If usbphy1 is suspended by runtime PM (or inactive when only a USB 2.0=20
device is connected), the regulator core will disable regulator_fixed_5p0=20
because its only known consumer no longer requires it.=20

Should usbphy0 also explicitly declare vdd-supply =3D <&regulator_fixed_5p0>
so the regulator core keeps the power on for USB 2.0 devices?

> +
> +	status =3D "okay";
> +};
> +
>  &xo_board_clk {
>  	clock-div =3D <4>;
>  	clock-mult =3D <1>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-ipq5018-us=
b3-v2-0-8f355d7ff0ef@outlook.com?part=3D13

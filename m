Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597DA3F44FC
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 09:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184243; cv=none; b=X3tKAQ2RzbAiOs8Gpk0PN5PbYbLesgI1c8aWovZ11HHcJPQhvu9lqiota+hFkLvJI+9nyc+Uj4a/W7kXt2pAqTkln2kQHQlt1bCqAvktGmgyxrsoHJl4kS+WmJ+gH5PqBhJCSgHo6IVPKdtAHLx8qnTYbmf3WXu6dVgaMj0ONeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184243; c=relaxed/simple;
	bh=GWmnBUzW+M/5LhBx0QmMdBobblw61hO7fI5lVz5Jp2U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cDdvSKSld6OPpJCLjRZvrtVzhQfnukUfrPACiUKILDPDbAi0CvEXk3Ml7z4AaLb81ZUUSwOpmzmWB+niu6crVrUBlUiD/T4/8jXc/KfpKXkZt+B7zdEs3jDaHLyGU6ClSe4+UstSnJEZGp+pEFDdgwyt4AKLcf160Dn3PKgUu/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTgGWE8Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTgGWE8Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71A1C2BCB3;
	Tue, 19 May 2026 09:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779184243;
	bh=GWmnBUzW+M/5LhBx0QmMdBobblw61hO7fI5lVz5Jp2U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=gTgGWE8QqhFl7bfCilJzzMFDal5Zu6h58zYG9cUhAb9XDfEZ1EBF3xgtlgNgBKXkp
	 sFbfkurXwo4G867wAusM0sgEtUebRpOtV5JPPGrU196ynlWeImIN1Hf58cBPhdjgke
	 rhWPdFYRJ9/HDT3D+dxqMJBiZ7BVcs75HOPYxBgPFubY6no33bUv2OJceZXtwD8gaX
	 9WEJz/0iaDyhz8UoCMZVC71ixgPs4X3lX8OwOtcNHcx6JD+Rojpf9PpmriMAJ51M2+
	 V88s5IV9UABn4BLuQmkuiOJmZugbIklYs5d4Nh2ifuIaBxyTdrbUZ00TwX4dRzMEur
	 Zx52qPsX/021Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 8/8] ARM: dts: qcom: Add Samsung Galaxy S4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre MINETTE via B4 Relay" <devnull+contact.alex-min.fr@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260519-mainline-send-v1-sending-v3-8-3dd7aa125353@alex-min.fr>
References: <20260519-mainline-send-v1-sending-v3-8-3dd7aa125353@alex-min.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 09:50:42 +0000
Message-Id: <20260519095042.B71A1C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The 'sda-gpios' and 'scl-gpios' properties in the 'i2c-muic' node o=
mit the 'GPIO_OPEN_DRAIN' flag.
--

commit 2dc0aa912f65c9935abe21e36b8281387360daac
Author: Alexandre MINETTE <contact@alex-min.fr>

ARM: dts: qcom: Add Samsung Galaxy S4

This commit adds a device tree for the Samsung Galaxy S4 (jflte) based on t=
he
Qualcomm APQ8064 platform. It includes initial support for UART, USB periph=
eral
mode, LEDs, and physical buttons.

> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-samsung-jflte.dts b/arch=
/arm/boot/dts/qcom/qcom-apq8064-samsung-jflte.dts
> new file mode 100644
> index 0000000000000..2f10466077c7a
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064-samsung-jflte.dts

[ ... ]

> +	i2c-muic {
> +		compatible =3D "i2c-gpio";
> +		sda-gpios =3D <&tlmm_pinmux 22 GPIO_ACTIVE_HIGH>;
> +		scl-gpios =3D <&tlmm_pinmux 23 GPIO_ACTIVE_HIGH>;

Does this configuration omit the GPIO_OPEN_DRAIN flag?

The i2c-gpio driver requests the pins with GPIOD_OUT_HIGH_OPEN_DRAIN.
When the GPIO_OPEN_DRAIN flag is omitted in the device tree, the GPIO
subsystem enforces the open-drain semantics to prevent hardware issues
but emits a boot warning about the missing flag.

Could the GPIO_OPEN_DRAIN flag be added here to satisfy the i2c-gpio
bindings and silence the warning, similar to how the i2c-led node is
configured?

> +		i2c-gpio,delay-us =3D <2>;
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-mainline-s=
end-v1-sending-v3-0-3dd7aa125353@alex-min.fr?part=3D8

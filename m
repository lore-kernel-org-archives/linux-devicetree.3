Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4563A7848
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 08:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786176765; cv=none; b=X9JTHyqMnuSfJywd6ZQ7xFlxyG5+UhwRghYI3isqPvF61Z0KzlLorbEntCLZQLeQaQgZPP/it2HK+RvCuirYM+RjrSzquh+3iloEhefwQ2ePGoOV+0mkekYL52IZFtnFpc+Zs5o3SlBtLlxMnnfqL5A1SxzXqspsevZef0VwsRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786176765; c=relaxed/simple;
	bh=OhOVCZECNSN2c/U668oKAFb4r301KUyBzeh+COqmNRY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aB6+GUlKl+qO8s4i0xLu4LYH/TBUIJDllO8VGX5m0tLoY1a9MHmLmigh4odfcynVYR2oj5kqcQ/2qWTP3nzjVKuRa4wawUAzH13N3xh0LpR2dGH7Nkjzs2Ps0e8r2E1FXdmHAJl8Eex+PSMlgrjB02PIUh3G7MOxrOCxsX3v8lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eCWEWTM0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eCWEWTM0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9E81F000E9;
	Sat,  8 Aug 2026 08:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786176764;
	bh=VsGjKIOzlVQ8YIdSfXOBi0YXDxncoPLR7F1axXp0Odk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eCWEWTM0q6AZZpKojajr5Pp6qSf0SFnZsssQQ0kQfAUOBi5sfoSpUdgXJKWPVID2Z
	 XLrmVjhEgak3Xo9dHe58lgGAlyF3hzBBzszItY/z0m/pz1sNJL6R649y/JlyF7k/Dm
	 61egzyIxnU4Y+pvIfwkPBCTFOZ+sgu25Z0S2ilYtwulyd4qfdQHG3bmX36TusVFJC+
	 F0/eyJBKSoItbkfrbnehfFf3K/HIf6xjzjjafczCaBtQSaNFxcpGeEG1Ic9xKgicge
	 EXg+DcW6remf+jWwQWkCnnwY5IVTqgBWMfWm0Dac+K0aXqToY3qkD4rqhGvKg4YmHX
	 yQCrj/f7LySFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add Radxa E54C
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chukun Pan" <amadeus@jmu.edu.cn>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260808080018.1492239-3-amadeus@jmu.edu.cn>
References: <20260808080018.1492239-1-amadeus@jmu.edu.cn>
 <20260808080018.1492239-3-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 08:12:43 +0000
Message-Id: <20260808081244.0C9E81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `keyup-threshold-microvolt` property for the ADC keys is err=
oneously set to `18000` (18 mV) instead of `1800000` (1.8 V), causing the M=
askrom button to fail to register presses reliably.
--

--- Patch [2]: [PATCH 2/2] arm64: dts: rockchip: Add Radxa E54C ---
commit 7258a447ec127579f19e2447b1743c6bd29f64a2
Author: Chukun Pan <amadeus@jmu.edu.cn>

arm64: dts: rockchip: Add Radxa E54C

This commit adds device tree support for the Radxa E54C, a network computer
based on the Rockchip RK3582 SoC. It configures the hardware interfaces
including USB, HDMI, ethernet switch, keys, and various regulators.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e54c.dts b/arch/ar=
m64/boot/dts/rockchip/rk3582-radxa-e54c.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e54c.dts

[ ... ]

> +	keys-0 {
> +		compatible =3D "adc-keys";
> +		io-channels =3D <&saradc 0>;
> +		io-channel-names =3D "buttons";
> +		keyup-threshold-microvolt =3D <18000>;

[Severity: Medium]
Is this keyup threshold missing two trailing zeros?

It is currently set to 18000 (18 mV) instead of 1800000 (1.8 V). Because sw=
itch
contact resistance and minor ground bounce can easily produce >9 mV when the
Maskrom button is held down, won't the adc-keys driver incorrectly consider
the button released?

> +		poll-interval =3D <100>;
> +
> +		button-0 {
> +			label =3D "Maskrom";
> +			linux,code =3D <KEY_VENDOR>;
> +			press-threshold-microvolt =3D <0>;
> +		};
> +	};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808080018.1492=
239-1-amadeus@jmu.edu.cn?part=3D2

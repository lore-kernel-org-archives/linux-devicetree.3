Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59564DB56E
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068465; cv=none; b=R6WtmpNgqF/C2JDiNMsk3TC/OkkVdhr3I4X/aEJOQuvo9/sE2NOcr1uSb85niYToMD0VrsVpsQu19juqDytGM8kmD5CFcCd7so+qQcyGq0Ha9cQXk4DbbfWpFce2td8dT8iewNDmElaZcaBMTWyVQtyG0i4D/C7wtXWXCgCszWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068465; c=relaxed/simple;
	bh=vi4/DLkL5GqQbQUt5lRE2mOn+66tF9AnkSd0UEY/C1g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=PEnY48BV5FYbJNoB4AFdv2qEWxUkdMG7ILPeWGI+fbenxxh8TPY4FfGLHX6DoJL697yWaNS7pyJ58xlX5Pgo1P3icyGPKyNi6gO0a7QOwLvUrnkN1KshUPLExgsKGtaybLImMTdiU5I72XVdLO5ORZQ3RSWeUoOhM0WR42AGGQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Elw7Rp0R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Elw7Rp0R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B79B1F000C4;
	Thu, 15 Oct 2026 12:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792068464;
	bh=csu0cMXX/o3C3pg13RsH2v0mbZE2IYKqp/dNwyfqz5s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Elw7Rp0RFph203W9iwVJDBeSLygwax77tyvnDd77qPC5y+XIqwettDW/lNR95t8/I
	 Evzor3XZ5o8Pqx/yENjkeR87Hx+PlBa+zeZauTvAQOpiEFmWnooASc0Hr1eSB1IigK
	 anRBjPrNV1ZmNHSXbaGJ/q9KFb3S+XITmkmmF26vRt3oP+V90qOAIFUyKwwwZIXTkg
	 OCpcGBjzfovIWbgtca5Q5cEXCd04FkjbRPO9hXK/c/SWSk7GpLqJzDIBx8yrlW8+C7
	 vZ69zhtU7b5Cx+7tYSQILqaIvaDPIXsJfI+DYcYf2tS3j4s2UCkXBQTtjW1BQDM5fL
	 rwVfJz/HKTwHg==
Message-ID: <sashiko-outbox-172863@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: Add sm8250-oneplus-common.dtsi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frieder Hannenheim" <git@fhannenheim.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-kebab_dts-v2-1-e783463bffd3@fhannenheim.net>
References: <20261015-kebab_dts-v2-0-e783463bffd3@fhannenheim.net>
 <20261015-kebab_dts-v2-1-e783463bffd3@fhannenheim.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 12:47:43 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: duplicate KEY_VOLUMEDOWN input event mappings
--

commit 2f072d0e18fa18763e323b09dc9a4287c7ab0878
Author: Frieder Hannenheim <git@fhannenheim.net>

arm64: dts: qcom: Add sm8250-oneplus-common.dtsi

This commit introduces a common device tree include for OnePlus devices
utilizing the Qualcomm sm8250 chipset. It provides shared configurations
including memory mappings, regulators, and hardware button definitions.

> diff --git a/arch/arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi b/arch/a=
rm64/boot/dts/qcom/sm8250-oneplus-common.dtsi
> new file mode 100644
> index 0000000000000..931e381368d94
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi

[ ... ]

> +	gpio_keys: gpio-keys {
> +		compatible =3D "gpio-keys";
> +		label =3D "Volume keys";
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&vol_up_n &vol_down_n>;
> +
> +		key-vol-up {
> +			label =3D "Volume Up";
> +			gpios =3D <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
> +			linux,code =3D <KEY_VOLUMEUP>;
> +			debounce-interval =3D <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +
> +		key-vol-down {
> +			label =3D "Volume Down";
> +			linux,code =3D <KEY_VOLUMEDOWN>;
> +			gpios =3D <&pm8150_gpios 7 GPIO_ACTIVE_LOW>;
> +			debounce-interval =3D <15>;
> +			linux,can-disable;
> +			wakeup-source;
> +		};
> +	};

[Severity: Medium]
The Volume Down key is explicitly mapped here to PMIC GPIO 7.

[ ... ]

> +&pon_pwrkey {
> +	status =3D "okay";
> +};
> +
> +&pon_resin {
> +	linux,code =3D <KEY_VOLUMEDOWN>;
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Will mapping KEY_VOLUMEDOWN concurrently to the PMIC resin (reset-in) inter=
rupt
here lead to duplicate input events?

Since both the gpio-keys driver and the PMIC resin driver are instantiated =
and
bound to KEY_VOLUMEDOWN, won't pressing the hardware button generate two
duplicate input events to the kernel input subsystem? This would cause
userspace volume controls to jump two steps instead of one.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-kebab_dts-=
v2-0-e783463bffd3@fhannenheim.net?part=3D1

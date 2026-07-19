Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6FD31195C
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 17:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784480978; cv=none; b=N/WPF+uxjvBosex/+1RefVr+CxcD+19zfIxKKDljygChxlPIK+CqRFVzHEUoqUv9JYP3ysOHqZjViELy0ARDGVZIc8C/MD1uM57uHZzM9PRm+2C2JecURe1oNGe8d1EBIMpg6tnIeAtIddYfgwX/37yYyMTK1TB4KS8DRPlcClU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784480978; c=relaxed/simple;
	bh=f4pphVnrJuEctVBoApuZMxUSP2uGR2bYd64+lht5yEQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BHI+6LeFGdgtG/YD5amonvpCuFd2twmNLtl5kRVn4ia6lg6CfhM58lvKspitQMjMCJ5U6m80NiWeMETJTc0kQOZt3WD3u7DAZJfMInR/0gczI1yvtJIuG/6xf6xiMc8E6kT25ugttsG69jcBX0h4Gp2IFEXcAyESSRVSViMuSyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUQmUzG/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUQmUzG/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74661F000E9;
	Sun, 19 Jul 2026 17:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784480977;
	bh=cXTTAwf5GxyEp7CjqVbbco8mUlnvmpWUfYomKuNiVUs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cUQmUzG/jqeI9LL6SDLtF2bks/Ih/5lNVhIobAO253e3ZnjaLq0/jXXGbL1Zza/Wx
	 La/X87X94KgV5TGWy12SdYOFU/JNlASmp2ktsZaeWtHN0dU3VFtEvVI9pcXaBE/00B
	 dbLsX5ykTW/pDCxpUnXEj+lsOHRws2cpZG0dmYZROT97VPGl4+Ftz0w+geO51cDdSG
	 g90i4WIknuDokatYapsURQaOJ7eWxS2SB0Liyu27y242yasiLBIU5vZ3VR7StS+6m6
	 kUfbNZJJOJi7r7bvAW8IVlRYfx2Bk2ul4l84vd6Bvrfc+8fKLuWxuMBVN9DOFX2PqG
	 8+p8MTiwT8b1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260719-pixel3-camera-v4-2-48cab1236852@ixit.cz>
References: <20260719-pixel3-camera-v4-0-48cab1236852@ixit.cz>
 <20260719-pixel3-camera-v4-2-48cab1236852@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 17:09:36 +0000
Message-Id: <20260719170936.D74661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `function-enumerator` property causes LED sysfs name col=
lision, leading to non-standard fallback naming.
--

--- Patch [2]: [PATCH v4 2/2] arm64: dts: qcom: sdm845-google: Enable PMI89=
98 camera flash LEDs ---
commit b5868918114efddab825d07ade0f191b5b3123e1
Author: David Heidelberg <david@ixit.cz>

arm64: dts: qcom: sdm845-google: Enable PMI8998 camera flash LEDs

This commit enables the PMI8998 flash LED block and describes two white
flash LEDs used for the rear camera. The LEDs are configured in flash mode
with hardware limits matching the original device configuration.

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/ar=
m64/boot/dts/qcom/sdm845-google-common.dtsi
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi

[ ... ]

> +&pmi8998_flash {
> +	status =3D "okay";
> +
> +	/* upper part */
> +	led-0 {
> +		function =3D LED_FUNCTION_FLASH;
> +		color =3D <LED_COLOR_ID_WHITE>;
> +		led-sources =3D <1>;
> +		led-max-microamp =3D <500000>;
> +		flash-max-microamp =3D <1500000>;
> +		flash-max-timeout-us =3D <1280000>;
> +	};
> +
> +	/* bottom part */
> +	led-1 {
> +		function =3D LED_FUNCTION_FLASH;
> +		color =3D <LED_COLOR_ID_WHITE>;

[Severity: Medium]
Does this missing function-enumerator property cause a sysfs name
collision?

Since both led-0 and led-1 share the identical color (LED_COLOR_ID_WHITE)
and function (LED_FUNCTION_FLASH), they both evaluate to the base name
white:flash.

Without a function-enumerator, the LED core's led_classdev_register_ext()
detects a collision on the second LED and falls back to appending an
underscore and a counter. This results in the sysfs nodes white:flash and
white:flash_1 instead of the modern standard LED naming convention
(white:flash-0 and white:flash-1) which user-space managers rely on for
consistent hardware discovery.

Could we add function-enumerator =3D <0>; to led-0 and
function-enumerator =3D <1>; to led-1 to ensure standard naming?

> +		led-sources =3D <2>;
> +		led-max-microamp =3D <500000>;
> +		flash-max-microamp =3D <1500000>;
> +		flash-max-timeout-us =3D <1280000>;
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-pixel3-cam=
era-v4-0-48cab1236852@ixit.cz?part=3D2

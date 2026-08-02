Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5623A3ACA58
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 12:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785675344; cv=none; b=UF1qmeH/I8sEs6mB8QqiybPc6epDM9qOdWIuUcKFaw/Jo+ogBiYtqzdu+LLT76XJ7kgXhkSnwk2XKv3U5S2wSSjrAg/VOW43GIQQm74F0mut52+yeYh7nHAHVmc/G1aCWHZs2kulRHYC5K+d9pFPmk3oqZYsenhaf3NkU0fRPBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785675344; c=relaxed/simple;
	bh=Fsv9jBP8HBIjh0JpUbsrnqiZDgPGmBHzUb4QzTnWvqk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lLTBAK4o4Zkq6paWa7UIOOAaKR7uyySsbxSCc2qYZ0aqj0Ucw3sRN2XsYiT1qqGowdMKz80sDC5seN5Tys2PG7o/ySaQ+qqHDrv2Vf5b7fd48o1QfDNhYcoTeDYyoDgvz2yN9mpeN+88AKGKz0GchtoloZ3di6wNE0XfPjHMNmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWKQC+dU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWKQC+dU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2B71F000E9;
	Sun,  2 Aug 2026 12:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785675342;
	bh=pZ1DIV4257OaqjqXg7K7mNRgWFZVM6ORGtX9MNPl0H0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EWKQC+dUNytF1Prk9bbaFCOgAQI9+l51u+VZhdDFfwCV8qo/FcLBX/1teYbZO9toK
	 ZbXz2E2GJ+RqDUxxYOOwCTfJyDaMjKm4tYGVlvYxLW8VEPEs1EEW6nzKE76GPPRAqc
	 6uRq43KACzhzlgLjNHU+gXo7iEnvokesUuIsvftdvo/ntgLMXrR0hNDmJFoV1z7JLa
	 24W6aO9Zy6Wg6t9AdUafYg4R8TvPqdE5fJY24wEMXpe6oHWfa3BaCWwCwT8Wridie0
	 0T//Avpht+lKRRiF+jlZ81n9DBo5WUdXqKnJcXYIoPTGeXbXMxz4b5QpEApQXtlK5Y
	 lMa77gvpHEtXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: sdm845-oneplus-fajita: Enable
 speaker codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260802-tfa98xx-upstream-v1-3-4dd55cdd658a@ixit.cz>
References: <20260802-tfa98xx-upstream-v1-0-4dd55cdd658a@ixit.cz>
 <20260802-tfa98xx-upstream-v1-3-4dd55cdd658a@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 12:55:42 +0000
Message-Id: <20260802125542.9E2B71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect active polarity for the codec reset GPIO in the device t=
ree, holding the hardware in reset.
- [Medium] The commit message incorrectly identifies the target device as '=
OnePlus 6', while the patch actually modifies the 'OnePlus 6T' (Fajita) dev=
ice tree.
--

--- Patch [3]: [PATCH RFC 3/3] arm64: dts: qcom: sdm845-oneplus-fajita: Ena=
ble speaker codec ---
commit 05cefbbcdc0e5b43fbfd650af4c52fe9dfdebf01
Author: David Heidelberg <david@ixit.cz>

arm64: dts: qcom: sdm845-oneplus-fajita: Enable speaker codec

This commit enables the NXP TFA9894 audio codec on the OnePlus 6T (Fajita)
device tree by adding the required I2C node and linking it to the speaker
playback DAI.

> OnePlus 6 uses NXP TFA9894 audio codec. Enable it.

[Severity: Medium]
Is the device name correct here? The patch modifies sdm845-oneplus-fajita.d=
ts,
which corresponds to the OnePlus 6T. The OnePlus 6 (Enchilada) appears to u=
se a
completely different codec (MAX98927). Should this specify OnePlus 6T inste=
ad?

> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/ar=
m64/boot/dts/qcom/sdm845-oneplus-fajita.dts
> index 0542333a83579..cb08aab4740a4 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts

[ ... ]

> @@ -40,7 +40,16 @@ &framebuffer {
>  };
> =20
>  &i2c4 {
> -	/* nxp,tfa9894 @ 0x34 */
> +	clock-frequency =3D <400000>;
> +
> +	status =3D "okay";
> +
> +	tfa9894_codec: audio-codec@34 {
> +		compatible =3D "nxp,tfa9894";
> +		reg =3D <0x34>;
> +		reset-gpios =3D <&tlmm 69 GPIO_ACTIVE_HIGH>;

[Severity: High]
Does this GPIO polarity hold the codec in reset permanently?

Looking at tfa98xx_i2c_probe() in sound/soc/codecs/tfa98xx.c, the driver
clears the logical reset during boot:

sound/soc/codecs/tfa98xx.c:tfa98xx_i2c_probe() {
    ...
    gpiod_set_value_cansleep(reset_gpiod, 0);
    ...
}

Because the device tree specifies GPIO_ACTIVE_HIGH, deasserting the logical
reset (setting to 0) will drive the physical pin LOW. If the hardware actua=
lly
expects a physical HIGH signal to operate, this active-high configuration w=
ill
cause the subsequent I2C probe to fail.

> +		#sound-dai-cells =3D <0>;
> +	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-tfa98xx-up=
stream-v1-0-4dd55cdd658a@ixit.cz?part=3D3

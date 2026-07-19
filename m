Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1331D3B42C1
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 18:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784484746; cv=none; b=S4TG7OcncBr4pJjrL0pRW0l5dou/s9EoIeTnxVxya2LK/LbNmFv6sWKZCUdNXUGIO2XMWcT4ic3kXatBuJd7sVAWrQlKg0h8VqpALABnqGqZWg5ylH9pAhp3LotfWwQRt4zGNltDqA/TIgSLpjA2utprvayv7lTUgQfozC90mKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784484746; c=relaxed/simple;
	bh=MV3Fz8YUpNWPSNPizq2V2kgKAkmkIy3bw7O59V2Bugs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fncNVj5lheAPZrt7fsS5OrJaJ0RFdrF9XgCzfOYRPFgsIj5KZlPWH/RUJcvJDBrUIEvETkIB8/bMQ1cjPOrI9KlNV9dMB98rOmTND/G8SEtU3EdClR9jqlhdHKRp/PpNwZnanyjfED128rAOZpYNZBa1Y3xN4RXdpN7axr7dbq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCrj/kTC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCrj/kTC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F9831F000E9;
	Sun, 19 Jul 2026 18:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784484742;
	bh=5r3BORmswJqpuIvKzmzL49wbNg9bAN9U/T4apE4KN8E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UCrj/kTC3mkaum6A32t7WfsOGXgHffz+rA599rGEsjVVVnTAUyuNEhEw2EoAKUZk9
	 pvf5Fxb+Gzx0JTiBkzkaPmfZoHcrSGUcXGrHRN2k7vwkzb6ce1QOnNU+ds1w/1dpr8
	 djJ6nYlkDd5e51iQG2VzD+gekDO/ExwMi5isTJNzxFIfcoAvJNvOOhwJf6QyfV6EDl
	 QyFtPijUx6ZWLow1eMaYii6a9hituAK1mfNGltzvfTWWjh41biBCunx66Eo1ClOEpx
	 1S8As8en30jUu6w3sU6RdqcjTQ/RxWCUEjqXxAstIqbnoFIdhdvGrC/WRZ+hVrHTOX
	 Udd6vQHjS2wVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260719-pixel3-camera-v5-2-99593f1bd8ec@ixit.cz>
References: <20260719-pixel3-camera-v5-0-99593f1bd8ec@ixit.cz>
 <20260719-pixel3-camera-v5-2-99593f1bd8ec@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 18:12:21 +0000
Message-Id: <20260719181222.4F9831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A preexisting logical error in the teardown and error paths of `le=
ds-qcom-flash.c` reads out-of-bounds of the `v4l2_flash` array, causing it =
to either leak successfully initialized V4L2 flash devices or trigger a ker=
nel panic.
--

--- Patch [2]: [PATCH v5 2/2] arm64: dts: qcom: sdm845-google: Enable PMI89=
98 camera flash LEDs ---
commit 93ed1a73fa53c221bf41460abbfe7fe7c99737a0
Author: David Heidelberg <david@ixit.cz>

arm64: dts: qcom: sdm845-google: Enable PMI8998 camera flash LEDs

Enable the PMI8998 flash LED block and describe two white flash LEDs
used for the rear camera.

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
> +		function-enumerator =3D <0>;
> +	};
> +
> +	/* bottom part */
> +	led-1 {
> +		function =3D LED_FUNCTION_FLASH;
> +		color =3D <LED_COLOR_ID_WHITE>;
> +		led-sources =3D <2>;
> +		led-max-microamp =3D <500000>;
> +		flash-max-microamp =3D <1500000>;
> +		flash-max-timeout-us =3D <1280000>;
> +		function-enumerator =3D <1>;
> +	};
> +};

[Severity: High]
This is a pre-existing issue, but configuring multiple flash LEDs exposes an
out-of-bounds array access in the leds-qcom-flash driver.

During driver teardown in qcom_flash_led_remove(), the code attempts to
access the v4l2_flash array at index leds_count:

drivers/leds/flash/leds-qcom-flash.c:qcom_flash_led_remove() {
    ...
    while (flash_data->v4l2_flash[flash_data->leds_count] &&
           flash_data->leds_count)
        v4l2_flash_release(flash_data->v4l2_flash[flash_data->leds_count--]=
);
    ...
}

If the probe is successful, leds_count equals the number of LEDs. Accessing
the array at that index reads past the end of the dynamically allocated
structure, potentially causing a panic or leaking resources if the
out-of-bounds memory happens to be NULL.

The probe error path in qcom_flash_led_probe() shares this logic. If probing
fails on the second LED, v4l2_flash at that index is NULL. The loop
evaluates to false immediately and terminates without freeing the
successfully initialized first LED.

Could we fix the array bounds check and release logic in the driver before
exposing it via this multi-LED device tree configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-pixel3-cam=
era-v5-0-99593f1bd8ec@ixit.cz?part=3D2

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795384368;
	b=anRAg0ZUuTRTgs4TsqBAYpM1O8cuSwVcO3JwqEm5NR+D52zaf0/wqU6eCTXR74cxhh8X
	 ssatpHdzCOarf0kWXYfHmLIa39jncCV7NtudG4htM8Qw8ZoxMXFwW+0ze+2sU0uLjz8KE
	 rFN/9BWwGudviNrL8X5ktgxIhNDE8EYNVMAPQia49EKAttDJo9YdsC+BGIr8oCOHD0dPD
	 kVRDAxyLII95EZRL4n+0OaB6j+UIcQl3iXIqe1gpwgYD9inYJrZmQzwMw4e3xdZzSbcV3
	 2PKSv5n03iyk+A/JhaNU/tj5c/JcPjfTVYpvkwYkoogRBhjawmkpc+M938hmt2TshzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795384368;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PH0ffczuhw7e+OZlDs68h+bS69Gc2+AYwskPUs3Fedw=;
	b=NoAUPTncdU2jsuNqyszl5vUwOATDlqzom0yN3TalmMYCfH//xzyMxP6Y/6kC0KN1CoEq
	 CMWc7J19TeeWl4R9FA8eUxfpG9W1KXTM1QgYa75HF+6SHjxWwS7jhxu0N4khRoLEf4JZX
	 gQrL043ccS+v+ejMGwBfjxWfnbRgskFPgzOO0o6FbhU5V8Hh/HBlsZzqrFYI901LYm1AQ
	 kq8/0A68DDT9jRYzv6StkGOkybHIc+We8h/8/baMEIK4USK2hVIoQUftsVhW3W8VBPz2v
	 3lK5wx7xjUTe9jc+cdjvfD9D5p7IdUU58McaxyB2S9REKac5kv77JabgsmGWrOcIYcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VqMSPZr0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5D9606A31A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 21:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VqMSPZr0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020BE1F000C4;
	Sun, 22 Nov 2026 21:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795384368;
	bh=PH0ffczuhw7e+OZlDs68h+bS69Gc2+AYwskPUs3Fedw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VqMSPZr0f92PDfZpn7GaPt+SEJ9GCW1YlcUdHbhjSPJW+SqdT1309WqXetvOPHB/P
	 GrNYaCIQKJiy4+oiRAo13uCBmpi9gKjRkOv4JX2Tq732rCXhI20Qat6V6ZLZM6AMyl
	 xwzwbXaAAemQEAWM8IEq9twsvJtTh88HgEkomOe5QLQT9AE1STwPoweSW1ukV3eqVW
	 j1MOGW/S5ntmEYZo3sz37+8jpFUCFkPyfE9ezr9AkAJ6vW2gU8mdbNXCFwJ3u+G+H8
	 gtroolaIaa+X/mRj2zXgHJzprQDyletDINj9GcgKmqC+sv9oOOW8ZN4a7AIheF+40Z
	 p8vlsa0ahEUSg==
Message-ID: <sashiko-outbox-228395@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: qcs8550-retroidpocket-nova:
 Remove pwm backlight
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling" <webgeek1234@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122-rp-qcs8550-display-v1-1-d513d9819a34@gmail.com>
References: <20261122-rp-qcs8550-display-v1-0-d513d9819a34@gmail.com>
 <20261122-rp-qcs8550-display-v1-1-d513d9819a34@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 21:52:47 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] arm64: dts: qcom: unused pmk8550_pwm left enabled in
  retroidpocket-nova
- [Low] arm64: dts: qcom: missing Fixes trailer for commit d4b2991e1d19
--

commit 44003ea1a3cf923727cb35cab3ca804a9a83aed7
Author: Aaron Kling <webgeek1234@gmail.com>

> arm64: dts: qcom: qcs8550-retroidpocket-nova: Remove pwm backlight
>
> This device does not use a pwm backlight, it has a backlight controlled
> by dcs commands via the panel.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>

[Severity: Low]
Since this removes an invalid pwm-backlight node, should it include a
Fixes: tag for the commit that added the board?

  Fixes: d4b2991e1d19 ("arm64: dts: qcom: qcs8550: Add Retroid Pocket Nova")

> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts b/ar=
ch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
> index 0a0546977a026..ef1356f4c34ce 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts
> @@ -10,18 +10,6 @@
>  	model =3D "Retroid Pocket Nova";
>  	compatible =3D "retroidpocket,nova", "qcom,qcs8550", "qcom,sm8550";
> =20
> -	backlight: backlight {
> -		compatible =3D "pwm-backlight";
> -		pwms =3D <&pmk8550_pwm 0 860000>;
> -		brightness-levels =3D <1023 0>;
> -		num-interpolated-steps =3D <1023>;
> -		default-brightness-level =3D <600>;
> -		power-supply =3D <&vph_pwr>;
> -		enable-gpios =3D <&pmk8550_gpios 5 GPIO_ACTIVE_HIGH>;
> -		pinctrl-0 =3D <&pwm_backlight_default>;
> -		pinctrl-names =3D "default";
> -	};

[Severity: Low]
Should the &pmk8550_pwm node further down in this file also be removed now
that its only consumer on this board is gone?

arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-nova.dts:
&pmk8550_pwm {
	status =3D "okay";
};

Without the pwm-backlight node, neither this board nor
qcs8550-ayntec-common.dtsi (which uses pm8550_pwm for its fan and LEDs)
references pmk8550_pwm, so keeping it enabled probes an unused LPG
controller at boot.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-rp-qcs8550=
-display-v1-0-d513d9819a34@gmail.com?part=3D1

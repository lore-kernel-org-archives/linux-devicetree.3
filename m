Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795384621;
	b=WFCaDEQkitobXj4scZ/ti2DR6AGHeURkM7+zIS//NR9Ozbfam0pgfKzcoqYYaAZUXAvz
	 Roz+qQq//TDYgcKk79+VDmp8EbqL3Ow1iT6TI7ozL+Hy/0ZNvabwP6+Hf7oiS1jyfKV/3
	 SO25749OsXnrsb69OAbbegvihWQrYh1+UC07huHnr1Tgn2g/7y02moJCQGpWGPwXDffHU
	 1W8yzKYmFdoBA3Q6YS91rfV77kvNcX1gmydXPp4xR3IJNsY2DvntnbZsxqDz0Et0coBga
	 cKj+hD3sBy8uLS4MM2kSiouTQhTkaXh/1MIdsp75xEK7MMYaGCIFjhiPq1PzhE+oemA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795384621;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NAxtK0sOddzshjnMEdU0HAFa+DNxCMZbNF7GEmkz+2Y=;
	b=XFX+B6EqN10dBQdfAgnuLmn2xuuw4LdyBeKf4esyCyDEWUi/PNio1OgjVVUSM9kPvuvl
	 1zn8HVAFJYXdVRJByUl9lT3Qt9gekfy7OxV5A2+ZpXV6AyJi//qVORuB+Xd/bfFpumJCr
	 19thSMewR6/wVqWxKO/xInRoOQyzbrJiNsoOBBz43XEE6neoM9bGzptp4Z8G3NO99qOJR
	 hW8rPoxzbT7Q31bJ41Vj10tBs9vsmHyonR3/IgtpW4xcH+IWunMnVe59pteQuTeI7Yjh+
	 I9TYvl2TY0JrTZ1TOxZLQfyyxlB0OMCHoH48/KHDbMUActt/cbiXyCyHz+Ol90+X2+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m4VwXt2w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D77606A31A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 21:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m4VwXt2w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FC41F000D8;
	Sun, 22 Nov 2026 21:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795384621;
	bh=NAxtK0sOddzshjnMEdU0HAFa+DNxCMZbNF7GEmkz+2Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m4VwXt2w3ycohI+vSBpWlj6N+PKZo1aBchY3n1NZInzofI22dlJLvyq9EL5XLU/TS
	 nGoJaCBtLlnGe2HoLEfhgQHcO6lFMJ+8fL9tMFM3u/qDHg/SBxt0LgfSpO2EpQVvrk
	 Mc15yMdINbuI7PeeZJyQ4I1pj9rKvne6uezD2Hhl08z7Og1OovJifzv+8TSDGG/7wu
	 9TZ9RTBShr4ogoQDdUmug07KQt7b/bSEaN+MJDRVTNtYARF1LjH6wFTMj7Jq97aHzp
	 SVt7KAXsqEF/MszTTzc0WX5bNpAk1/VyCFuSzh800vv6MPxkHHvZxe4I5eHtGuoA/4
	 Dt+IiixX7Wfmg==
Message-ID: <sashiko-outbox-228399@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: qcs8550-retroidpocket-rp6: Remove
 pwm backlight
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aaron Kling" <webgeek1234@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122-rp-qcs8550-display-v1-3-d513d9819a34@gmail.com>
References: <20261122-rp-qcs8550-display-v1-0-d513d9819a34@gmail.com>
 <20261122-rp-qcs8550-display-v1-3-d513d9819a34@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 21:57:00 +0000
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
- [Low] arm64: dts: qcom: pmk8550_pwm left enabled without consumers on
  rp6
- [Low] arm64: dts: qcom: missing Fixes trailer for commit 9b9ac54e7eec
--

commit 4c928b402de67f834d479cbb2c2525592ba6bacd
Author: Aaron Kling <webgeek1234@gmail.com>

> arm64: dts: qcom: qcs8550-retroidpocket-rp6: Remove pwm backlight
>
> This device does not use a pwm backlight, it has a backlight controlled
> by dcs commands via the panel.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>

[Severity: Low]
Since this fixes an erroneous hardware description, should it include a
Fixes tag:

  Fixes: 9b9ac54e7eec ("arm64: dts: qcom: qcs8550: Add Retroid Pocket 6")

> diff --git a/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-rp6.dts b/arc=
h/arm64/boot/dts/qcom/qcs8550-retroidpocket-rp6.dts
> index a93fe74b83383..91fed8795d611 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-rp6.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8550-retroidpocket-rp6.dts
> @@ -13,18 +13,6 @@
>  	model =3D "Retroid Pocket 6";
>  	compatible =3D "retroidpocket,rp6", "qcom,qcs8550", "qcom,sm8550";
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
> -
>  	vdd_disp_1v8: regulator-vdd-disp-1v8 {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_disp_1v8";

[Severity: Low]
Should the &pmk8550_pwm override at the bottom of this file also be
removed?

This backlight node was the only consumer of pmk8550_pwm on the Retroid
Pocket 6 (the fan and LEDs in qcs8550-ayntec-common.dtsi use pm8550_pwm),
so leaving &pmk8550_pwm enabled probes an unused PWM controller.
Similarly, pwm_backlight_default in qcs8550-ayntec-common.dtsi appears to
have no remaining users once the pwm-backlight nodes are removed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-rp-qcs8550=
-display-v1-0-d513d9819a34@gmail.com?part=3D3

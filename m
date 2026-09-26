Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B353E3DA7
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 10:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418499; cv=none; b=nU0WD+AIBdc9p12Uxc96cK6pJOcs2EqROXsrDrK02OPiFgQey7L2KchspIhHKbG5YMw3uzTQ8OIxe7hnrqLAyUojGLtfG4GktAKtCf7XZdalow45/ENI93MxNXWbtUqlmESCZFgBYfcbjC4SI/5FJMJEHZQ8XRax+R5P7L+hZTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418499; c=relaxed/simple;
	bh=mS0uYnlkpeqs8oj4+Ji9ds/mw7TI2O/4b9h7iQwd3bA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lsjHWG4Ln3BsuqIZaHAuK+3JpjTHqG2NzjqZrqA/77PnQ7+7vDM/Bj9SoCzrhavjizcyfpGlIsfo0tsA2gHlKGpP0UOYRMlZMZjOIjp8Gflw2MeqDRD64haocbSAEcUYGjCDyUCAlihSu7UHocl8ZBFdkGc3vikmjoldNelIR7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLI0G38T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLI0G38T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F841F000FF;
	Sat, 26 Sep 2026 10:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790418490;
	bh=rFRx8yu8eFkneMCcLQ+J7rGSxzv3GgJ+nXoW+BOGvS8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iLI0G38TMNfDBQfTUC5n8Zkm1gMjwUl+98R0wyrdmh8W3EJl7Kp79xN/cHzkUUhGT
	 osz+08GWPK+OgA5ASpNtG1xq6vkRxYNCDEnlrMdytBMwZ6oYh7eJqY8Fj7BmjOd9ps
	 nkw7yKx7q+BOyMuoE03U1Hctvp/R8iX9eFZx1kjkqJhHrQ7BswVZZdl6wq49CChrKl
	 Fy6Bnz8gkNlALC3ozC6Kla7iyv4+MysDpPB/kUONvrxdL0pz/19nSwboXJKvocIKOh
	 0jj4EAnVQa7B2Vps2ApMW1AvVxcTz3WQIGHih84UEL3umweUQzaYdo+yOJwxgq5xT5
	 bhSf6OkAOOIOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/8] arm64: dts: qcom: sm6350-lena: Add flash LED
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260926-pdx213-upstream-3-v1-1-1609c18b5c1d@erebion.eu>
References: <20260926-pdx213-upstream-3-v1-0-1609c18b5c1d@erebion.eu>
 <20260926-pdx213-upstream-3-v1-1-1609c18b5c1d@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 10:28:09 +0000
Message-Id: <20260926102810.53F841F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: stray unreferenced panel_reset_pin pinctrl node
--

commit 4da03f54d76a8976b268b2576c45e0c9edee7a57
Author: erebion <erebion@erebion.eu>

arm64: dts: qcom: sm6350-lena: Add flash LED

This commit adds a node for the camera flash LED found on the Xperia 10 III.

> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 6e2bbf4f060ac..c72ccb5544589 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
[ ... ]
> @@ -302,6 +304,29 @@ touchscreen@48 {
>  	};
>  };
> =20
> +&pm6150l_flash {
> +	status =3D "okay";
> +
> +	led-0 {
> +		function =3D LED_FUNCTION_FLASH;
> +		color =3D <LED_COLOR_ID_WHITE>;
> +		led-sources =3D <1>;
> +		led-max-microamp =3D <180000>;
> +		flash-max-microamp =3D <1000000>;
> +		flash-max-timeout-us =3D <1280000>;
> +	};
> +};
> +
> +&pm6150l_gpios {
> +	panel_reset_pin: panel-reset-state {
> +		pins =3D "gpio9";
> +		function =3D "func1";
> +		power-source =3D <1>;
> +		bias-disable;
> +		output-low;
> +	};
> +};

[Severity: Low]
Is this panel_reset_pin pinctrl node intended to be part of this patch?

The commit message indicates this change is solely for adding the camera fl=
ash
LED, which makes this look like an accidental inclusion of an unreferenced
node that never gets applied to the hardware.

Additionally, does this correctly configure the panel reset state? It appea=
rs
to combine the hardware alternate function "func1" with the standard GPIO
"output-low" property.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-pdx213-ups=
tream-3-v1-0-1609c18b5c1d@erebion.eu?part=3D1

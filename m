Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D161382F28
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 07:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785308641; cv=none; b=R2ebbAlfAqsVFs+J2ZYez6k0qY9HRfbeK6OZE8IxTFjVN+jnDnuJJl91VBqPBj40Gyb9dt73dwBEMFw+GxiK1juEYMGh4jS0lXVGB8QXcun0skyym1AT1HUF8kIm9IfTl/3Xdo7vL9TaoTK/cg0q5FqTBQZApl5H9rpM1NFzwLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785308641; c=relaxed/simple;
	bh=mI1fNtuMkIuEiSNHGpoOkQAfbUsaPIOCWb+VFse8R/U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YFMcAix+CGa0SqR9LtzZ3vhKvlYkp/KpuyuofqW/chBRYL9p9+9lpHMpR6VPzYdpEI/jOzOjhzg2qaOHd4p66QgbuU9angpVyZloAw5TpEvRmkoNgPWhJShlM6ZWYQCyPURX5M1qtFX4ZDLCm2EzVCH9PvKgVWOlsBEFI5DuNG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oW0zQUoc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oW0zQUoc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18DF1F000E9;
	Wed, 29 Jul 2026 07:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785308639;
	bh=ST5PZyuHa4bPAGhOvzuNM6YH6bkQvx3pHLsfCd5wNzE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oW0zQUocemU5A4jf451VWIMTrsIaNHky4Ya2Kai4HEv9U2mvEDmoLoxbUKX5wx+Ql
	 ABJ41FbKpUD+3m4YgEjSu6flMHJRdG07d6ddjod/iE0x+bgvFgAgFyCoWVR1ldGo1I
	 dvZJL5iTWdUABsQm1HjYNm5hd1ungD3K+Km0Ty71fHNr0dxo8bPfcBXTQ4UZs+iQw4
	 g4xAMiqCBW5egP4Te3ggTPeDKyhZm4mb55Q/4X6Wq22H/FRxIBhwCqUw1Ib0/5Zfvg
	 Ad0TmrKCMhaKxyox6u4lI2WkffECTq7MkigJWQQE/H4Oiv3G0tjdfPEimNAunly//P
	 U/KHoZTWQ8zgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add support for Acer Swift Go
 Pro AI (SFA14-11)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaipeng Zeng" <kaipeng94@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729064538.19564-3-kaipeng94@gmail.com>
References: <20260729064538.19564-1-kaipeng94@gmail.com>
 <20260729064538.19564-3-kaipeng94@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 07:03:59 +0000
Message-Id: <20260729070359.A18DF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incorrect audio routing for the right speakers.
- [Medium] Missing `-el2-dtbs` build rule for the Acer Swift Go 14.
--

--- Patch [2]: [PATCH v3 2/2] arm64: dts: qcom: Add support for Acer Swift =
Go Pro AI (SFA14-11) ---
commit 7b73d33b3eeafdf356a13cef16dee5622aee6de8
Author: Kaipeng Zeng <kaipeng94@gmail.com>

arm64: dts: qcom: Add support for Acer Swift Go Pro AI (SFA14-11)

Introduce device tree for the Acer Swift Go Pro AI (SFA14-11), a laptop bas=
ed
on the Qualcomm Snapdragon X Elite (X1E78100) SoC. This adds support for ba=
sic
peripherals including display, keyboard, touchpad, Wi-Fi, and audio.

> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -422,6 +422,7 @@ talos-evk-lvds-auo,g133han01-dtbs	:=3D \
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D talos-evk-lvds-auo,g133han01.dtb
>  x1e001de-devkit-el2-dtbs	:=3D x1e001de-devkit.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+=3D x1e78100-acer-sfa14-11.dtb

[Severity: Medium]
Are we missing the -el2.dtb combination rule for this board?

Snapdragon X Elite laptops usually rely on EL2 memory reservations to boot
successfully on stock firmware. Other devices in this Makefile include a ru=
le
like x1e78100-acer-sfa14-11-el2-dtbs :=3D x1e78100-acer-sfa14-11.dtb x1-el2=
.dtbo
to generate the required overlay.

Could this omission cause boot failures on the Acer Swift Go?

>  x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:=3D x1e78100-lenovo-thinkpad-t14=
s.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+=3D x1e78100-lenovo-thinkpad-t14s.dtb x1e78100-=
lenovo-thinkpad-t14s-el2.dtb

> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts b/arch/a=
rm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts

[ ... ]

> +	sound {
> +		compatible =3D "qcom,x1e80100-sndcard";
> +		model =3D "X1E78100-ACER-Swift-Go-SFA14-11";
> +		audio-routing =3D "WooferLeft IN", "WSA WSA_SPK1 OUT",
> +				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
> +				"WooferRight IN", "WSA2 WSA_SPK2 OUT",
> +				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",

[Severity: Medium]
Does this right channel routing mix the woofer and tweeter signals into the
same output?

It looks like "WooferRight IN" and "TweeterRight IN" are both routed to
"WSA2 WSA_SPK2 OUT", leaving "WSA2 WSA_SPK1 OUT" unconnected.

Should one of these be routed to WSA_SPK1 to match the frequency separation
done for the left speakers?

> +				"IN1_HPHL", "HPHL_OUT",
> +				"IN2_HPHR", "HPHR_OUT",
> +				"AMIC2", "MIC BIAS2",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729064538.1956=
4-1-kaipeng94@gmail.com?part=3D2

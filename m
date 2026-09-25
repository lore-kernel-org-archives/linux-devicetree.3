Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D7E313547
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 18:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360291; cv=none; b=MJN4LSlc83dgDAKY5VIjWOE3ywUS1yEuy7quqAz9cWlcEPlXYLv8Rowzzx7YL9n0SU7lfuymaSwB8uEGN+BAp9UmYtguYYgmASxs5/T20nPwUNdQFK++Pn/2yt0E6AAxGmzzy7u8bS7p0uxLDqsRkhMlvn/uwR9+EyOQXQyyE+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360291; c=relaxed/simple;
	bh=ZVdQ8iJ9/viKjnfKVpRe/ltKNcfW5Li+z4474PRXTf4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jmFe964SgQqbFtfF5MPVQT44fPIrv/VT5Z0QnBiLhIeIgXu81T34QjAjA7gYyAtDaVhmvZ7Bwgs184pvWXaFb1h9he0+btsze0pBNA79urV5ozJ6d4/YAqjxlKRlDqwvzxWL82T/GdJVyzHVRKcfWoZ5EcNPKH2a788nWjHSSDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=frR+wnvw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="frR+wnvw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A862D1F000FF;
	Fri, 25 Sep 2026 18:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790360289;
	bh=faalfAFbloS6A83lPcMrxQvF8UhKQiaJ5spoURoKK+o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=frR+wnvwuuIaaoOwulVQeb8nX0jF+vMWV0QTR28OXRVvl2J2yqF1HymLv5ovHkdMk
	 YrHSXuGeP/PdlyYxqLsJxLJNhpk7tSDTh3DwnJCbB0M80LxaHWoMd0xE213ZYC20Pv
	 uBJe1JcI/RyhugcA1mm61++8xnlkuLBLCOCviilrW7xDEByxjzrusRHICB7wt3K7up
	 a20OWEZ/hMtMgVuhFtIZLLQC6EuA20QSkDJ5Mvu41BKpbmhYKJgfPasS8kiC9TKG6i
	 9HLv/b7r34S6wC6nhUQom52cs4PLm4QL1C1x31tqm4aJiZZmAp4El/yCuIg3Nai2Un
	 2A+2fkEPkeL+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: add the
 front camera
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liviu Nicoara" <lnicoara@thinkoid.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260925181024.20352-1-lnicoara@thinkoid.org>
References: <20260925181024.20352-1-lnicoara@thinkoid.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 18:18:09 +0000
Message-Id: <20260925181809.A862D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: leftover panic-indicator property in privacy_led node
--

commit 36298c1fea529d8d4721b3106200dbc232c81349
Author: Liviu Nicoara <lnicoara@thinkoid.org>

arm64: dts: qcom: x1e80100-dell-xps13-9345: add the front camera

This commit describes the OV02C10 front camera and its wiring for the Dell
XPS 13 9345. It configures the CCI1 bus, CSIPHY4, and assigns the white
camera indicator LED to serve as the sensor's privacy LED.

> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch=
/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> index ad62350ba6701..73f06fdcd1381 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
[ ... ]
> @@ -46,14 +48,13 @@ leds {
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&cam_indicator_en>;
> =20
> -		led-camera-indicator {
> +		privacy_led: led-camera-indicator {
>  			label =3D "white:camera-indicator";
>  			function =3D LED_FUNCTION_INDICATOR;
>  			color =3D <LED_COLOR_ID_WHITE>;
>  			gpios =3D <&tlmm 110 GPIO_ACTIVE_HIGH>;
>  			linux,default-trigger =3D "none";
>  			default-state =3D "off";
> -			/* Reuse as a panic indicator until we get a "camera on" trigger */
>  			panic-indicator;

[Severity: Low]
The commit message and the removed comment indicate this LED was only used =
as
a panic indicator temporarily until a "camera on" trigger was available.
However, while the comment is removed, the panic-indicator property remains.
Should this property also be removed from the privacy_led node?

>  		};
>  	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925181024.2035=
2-1-lnicoara@thinkoid.org?part=3D1

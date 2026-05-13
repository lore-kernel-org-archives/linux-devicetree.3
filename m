Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8492E39C645
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 23:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778715828; cv=none; b=VrC5OdhEqqaxyiB/+x4A+2wrmUWmH2erheTFGfwqnA6ULsZLKuJwwLP5aQAlRD7dh9cO3hCzmrXVw36YUMgepjjG4vGp6TRES7jtYEcwB9U3+aorMjmCsg9IYRbxuCIiTIjwzqvefXFw7m4ptbsbM46UHI/yDdx9la081rg/mDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778715828; c=relaxed/simple;
	bh=kjXafoNyC6xXrbwTzAWBdWNO+WjvdZh5yjzepPX80Fs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gQIdaFtsgz02lDJJde5Nfr68pYF3lqqOQBqFZy+kPtk8u4pfjHSLOr9pt/D4zXWS3Xe63Bv0hpnn8kecVjleq77gwIVvII/HCz8ZtGTK5msRLWwO34jmFU4tMh2W+Ll0IFgoIkwL2bVJSxfN8v2KVCdeQxyOFrKEaPYjRvraUfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t1klvFJS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t1klvFJS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A11C19425;
	Wed, 13 May 2026 23:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778715828;
	bh=kjXafoNyC6xXrbwTzAWBdWNO+WjvdZh5yjzepPX80Fs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=t1klvFJSc6g8Ih1n5Dw3urb9uJiT+cIaoGVE6zsc5qQf4XOws74fe8Qs6iLCRTX9l
	 XJhHyvhfSPg/+WkqXI6JzPave1U2LZgwuWv5+uHofH8jdQAHLYLmCMb8Dom0TqaXbt
	 msEbAk+2+XqXxgpWDvBJ4PKal44HSSVYFs0x3znOHOFgWrdMLPWwCdnHQ6SkAH44Bq
	 MCLW0HOSX/wTEwZg7mz8/5fU+gDQZKiRboH1jF+A468ouc0ZK45KctkzNVsHjv36RF
	 BaprgXWK2w15co5tlcDC/R4MfCFZHrCdpPnRE2CadKZ21brayDrbeTuj/T5aBe6+oG
	 x0wZhqfU/QACw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] Enable wifi on the BeagleV-Ahead
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thomas Gerner" <thomas.gerner@muenchen-mail.de>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260512173440.163179-1-thomas.gerner@muenchen-mail.de>
References: <20260512173440.163179-1-thomas.gerner@muenchen-mail.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 23:43:47 +0000
Message-Id: <20260513234347.D4A11C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing mandatory fallback compatible string `brcm,bcm4329-fmac` s=
ilently breaks driver interrupt parsing.
- [Low] Pinctrl node names violate the `thead,th1520-pinctrl` schema constr=
aints.
--

commit 36b13556394c8110c85a42dc09295453444c2a36
Author: Thomas Gerner <thomas.gerner@muenchen-mail.de>

Enable wifi on the BeagleV-Ahead
   =20
The BeagleV-Ahead board uses an AP6203BM WiFi chip from AMPAK Technology
Inc. connected to SDIO1.

> diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/ri=
scv/boot/dts/thead/th1520-beaglev-ahead.dts
> index 91f3f9b987bc3..86da4bd8ceaf9 100644
> --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
[ ... ]
> @@ -239,6 +244,28 @@ rx-pins {
>  			slew-rate =3D <0>;
>  		};
>  	};
> +
> +	wifi_pins: wifi-pins {
> +		host-wake-wl {

Does this naming follow the thead,th1520-pinctrl schema constraints?

The schema requires pad group nodes to match the regex -[0-9]+$ (for
example, wifi-0) and inner pin-mux child nodes to match -pins$ (for
example, host-wake-pins).

Using wifi-pins and host-wake-wl / reg-on-wl will trigger dtbs_check
validation errors.

> +			pins =3D "GPIO2_25";
> +			function =3D "gpio";
> +			bias-disable;
> +			drive-strength =3D <1>;
> +			input-enable;
> +			input-schmitt-disable;
> +			slew-rate =3D <0>;
> +		};
> +
> +		reg-on-wl {
[ ... ]
> +	wifi@1 {
> +		compatible =3D "cypress,cyw43012-fmac";

Does this compatible string need the brcm,bcm4329-fmac fallback?

In drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c, brcmf_of_probe()
explicitly checks for this fallback:

	if (!of_device_is_compatible(np, "brcm,bcm4329-fmac"))
		return;

Without the fallback string, the driver skips parsing the interrupts
property, which breaks the wake-on-WLAN functionality intended by
configuring the host-wake pin.

> +		reg =3D <1>;
> +		interrupt-parent =3D <&gpio2>;
> +		interrupts =3D <25 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names =3D "host-wake";
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512173440.1631=
79-1-thomas.gerner@muenchen-mail.de?part=3D1

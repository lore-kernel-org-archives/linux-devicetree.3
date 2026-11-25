Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623636;
	b=A1CUMBX61/dAprJ0VphG1yuI2+7bmAvWr0a6liioQjiQhU3QbzXNO+fCa3DFaSOyCw0L
	 NxQv+UuHpC68EbZl+rgD27O4yLI8rAjumdyPWPMjYhfEpP3Bsg2ExL4epQtMyKN0AQxOc
	 B7rWQfPvepjLpVTXWuAHq864t8jbwjgaGuoU3j6D1VNsjmMwEfDtZF16ErUzNXAH6OPUI
	 sXq4lxkD0XhCXS3jGidYLZOltADhmk4fZlImcGWMiCgh/TWyRRt3stJlYxzNAN3uMtxNM
	 LwHl78klHw483oaN8FEieDRIARCKKq/ibYZcSBuT93kREEuEhKO0CtlAWZPjJ/6XDxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623636;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+xfCQZHZ8+eZGXx+uZeYFT/bdUPj7q/BBH4cz7Nix0E=;
	b=fm5Ne46rgCglMPCVizgJbVR/w9J+cLNmLpGibqWjRBDaiuJS3P4QPNkc/BYuWi05/vwF
	 KBe6/9xBOb/x9V5pZD4lvQ3jabWwOndPgRoP6+t6ydSPMI5eYSQUWxcPbMEDatGr58To8
	 XJuHjhmQiItwRx/zOWVKzShxK3732alVoyCg8lILvIimJ30TtKfXm4XOv92xJKWd2vc5s
	 hLBkvtycF0iVS8aACx9nyrGc/3dmOungxk0eBV21Fe00WN8cdCYaCKPo2GFUU+1VllXkZ
	 F2dkuVjkXTrVRwUQmv3LdySzKyIFI31mS1XIsJPrznCW+U+FczF83wmQgS/8nEStSuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FgCqNLvM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B82606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 16:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FgCqNLvM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95541F000C0;
	Wed, 25 Nov 2026 16:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795623635;
	bh=+xfCQZHZ8+eZGXx+uZeYFT/bdUPj7q/BBH4cz7Nix0E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FgCqNLvMjixCHi+Y3OjUEiTIrEh8nB8ILAWaGU/HOkqAUIlU6PoCHfny7wvKG346e
	 baLOA9P4WdzPhl1yiQefcJc+uS3O3Gsa+fTc8ISHCVUoRwugzVWaNh5ukTnL6sNL72
	 Uk+EUNszCPY8R5Ml+qAy3IbA7yTrLgxTKNaZImfIH1MQlLh6GogWpYrEmoBZ1J+Dl2
	 YID4bHVonN3X6oQEhT8N+MpAjG3lVcsH3QL5LTt2iWw3QHtVnLzddqeey1C+vW9KwA
	 BifPfP7yNqpXTy5k8SjKIjfsBpL0Jql9d8W3W8jChpk97+zj6y2bDNWZw0ico7IjLe
	 QhnjSl7RJCZVA==
Message-ID: <sashiko-outbox-233743@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] arm64: dts: exynos: exynos7885-gta3xllte: Enable
 USB support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Umer Uddin" <umer.uddin@mentallysanemainliners.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-gta3xllte-usb-battery-v3-1-2ef962bf5423@mentallysanemainliners.org>
References: <20261125-gta3xllte-usb-battery-v3-0-2ef962bf5423@mentallysanemainliners.org>
 <20261125-gta3xllte-usb-battery-v3-1-2ef962bf5423@mentallysanemainliners.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 16:20:34 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: exynos: undefined usbdrd labels break gta3xllte DTB
  build
--

commit 39a9bd70a58ddfe9f07196470f1a374df5409b94
Author: Umer Uddin <umer.uddin@mentallysanemainliners.org>

arm64: dts: exynos: exynos7885-gta3xllte: Enable USB support

This commit adds a dummy fixed regulator and enables the USB DRD controller,
DWC3 node, and PHY in peripheral mode on the Samsung Galaxy Tab A 10.1 (201=
9).

> diff --git a/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts b/arch/a=
rm64/boot/dts/exynos/exynos7885-gta3xllte.dts
> index 03476f8b1200b..c71101ed0ba98 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos7885-gta3xllte.dts

[ ... ]

> @@ -127,3 +133,25 @@ key_volup: key-volup-pins {
>  		samsung,pin-drv =3D <EXYNOS5420_PIN_DRV_LV1>;
>  	};
>  };
> +
> +&usbdrd {
> +	vdd10-supply =3D <&reg_dummy>;
> +	vdd33-supply =3D <&reg_dummy>;
> +
> +	status =3D "okay";
> +};
> +
> +&usbdrd_dwc3 {
> +	/*
> +	 * SoC in theory supports SS but no known device (including this one)
> +	 * has it wired up.
> +	 */
> +	maximum-speed =3D "high-speed";
> +
> +	/* Force to peripheral until we have Type-C working */
> +	dr_mode =3D "peripheral";
> +};
> +
> +&usbdrd_phy {
> +	status =3D "okay";
> +};

[Severity: High]
Are the usbdrd, usbdrd_dwc3, and usbdrd_phy labels defined in
exynos7885.dtsi?  Neither exynos7885.dtsi nor the files it includes
defines these labels, so building exynos7885-gta3xllte.dtb with
CONFIG_ARCH_EXYNOS enabled fails in dtc with label-not-found errors.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-gta3xllte-=
usb-battery-v3-0-2ef962bf5423@mentallysanemainliners.org?part=3D1

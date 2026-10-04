Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18813B9DAB
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 06:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791095099; cv=none; b=RrsLZ/GZ2DJdDyEZd6wnqdyE17Dn1fBlrXM5tpybjifDOP8hYF3n29p72btzUfjpxZ9iQWOCOLTZSqkTGUvfYxrWX096+wMMxKd8WtLNOHejJGLsZ0ulaypnwnLj0+48RsvPEYF1IB3Qqb2DyGv1IRkCDPVUuOz4gt8DaZQKz2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791095099; c=relaxed/simple;
	bh=O3Stij4hqiT2Zm8izlAMkKNLPnDH2Qvz3ZJ01327JMI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RQtyLM/EfrEM+tAkEWGX+JJeOCyPPOkJ12endYm7t/tq5UqMKsOW3NZZm6hzDHxA0PjeFesJ9ro566RlyVXURcM/px1IpkPz0NHMMdpzWdudVPeass5C/NlYLyVH81xIHOWSZchlpAug/vFE0zqO5dI44x5cZB4UYli445FeMpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L213KNOv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L213KNOv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E801F000FF;
	Sun,  4 Oct 2026 06:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791095097;
	bh=HR7v39L2cbsbBOBBbRvAK1gzTDS8qB8oazyVcI1updo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L213KNOvjmTbwW+8BFrhTdE2A3Fn4LjnBlc+q6snDXiYVRicqdm5C1ZveIHl9oA/z
	 i6z4atrshrOv6alQDGg613QO0IF3RODyK7prph7h/BqbDAHs9UvGyaS+6C0meIel8t
	 /ntDNrsr93CNvgrv2VfDYKng1YoQRtQNSutRtKTpX7tV7LFIcRb0zd5IyN5EF5AYK3
	 WAXY78UWU5YxV3e+oLeDklvUGEWkSuUlJNcfvmWFsg+NNu5iSHrVeSmBogMUb3rMpf
	 vWERjgih4VWG/n91HQU0DLn2o2H3igEriSOYe1Hsxs1Sl5DxHKNZxSyp+q/W5OB8Tb
	 mPhgdRu4rvSlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 18/21] arm64: dts: apple: t600x-j31x: Add
 speaker/headset jack nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261004-macaudio-v2-18-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-18-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 06:24:56 +0000
Message-Id: <20261004062457.31E801F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: resource conflict on shared shutdown-gpios for multiple codecs
--

commit 9045c7a2c2a0f6174f098238d3400d7d5ed2d1f8
Author: James Calligeros <jcalligeros99@gmail.com>

arm64: dts: apple: t600x-j31x: Add speaker/headset jack nodes

The M1 Pro/Max MacBooks integrate Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

> diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/=
boot/dts/apple/t600x-j314-j316.dtsi
> index caded1636f3d2..1f23ae3e4e1ad 100644
> --- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
> +++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi

[ ... ]

> @@ -169,6 +169,94 @@ hpm5: usb-pd@3a {
>  	};
>  };
> =20
> +/* Audio codecs */
> +&i2c1 {
> +	status =3D "okay";
> +
> +	speaker_left_woof1: codec@38 {
> +		compatible =3D "ti,sn012776";
> +		reg =3D <0x38>;
> +		interrupts-extended =3D <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
> +		shutdown-gpios =3D <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;

[Severity: High]
Does sharing the shutdown-gpios line identically across all six codec nodes
cause a resource conflict during probe?

When probing the ti,sn012776 codecs, the tas2764 driver uses an exclusive
request for shutdown-gpios. The first codec successfully acquires the GPIO,
but the remaining five codecs will receive an -EBUSY error. They silently
ignore the error, set their GPIO descriptor to NULL, and continue.

If the system or audio card later suspends, the first probed codec will
unilaterally assert the shared shutdown-gpios line. This physically powers
down the remaining active codecs while they are still awaiting their own
suspend sequence.

Will the subsequent I2C writes during the suspend callbacks of those powered
down codecs fail due to NACK timeouts, potentially delaying or aborting the
entire system suspend process?

> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "Left Woofer 1";
> +		ti,imon-slot-no =3D <0>;
> +		ti,vmon-slot-no =3D <2>;
> +	};
> +
> +	speaker_left_woof2: codec@39 {
> +		compatible =3D "ti,sn012776";
> +		reg =3D <0x39>;
> +		interrupts-extended =3D <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
> +		shutdown-gpios =3D <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004-macaudio-v=
2-0-7b47ed6335a8@gmail.com?part=3D18

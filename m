Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6079A53E0B
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 00:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778285349; cv=none; b=P2FhTw8EEsZ8Gg3SUYRX34FPiGhyzL36p860MITIBRYzYb9QJBii5YHdmRx3x8D3cn0QAvCGueQblwCEfLZ5028n2ceMYurn6+69r7ij6DArAcqhg409S2JQzBpzI91of3r+zg+ESzNyhkqkJjCa42zg/vFg91Forqbpc0c+csw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778285349; c=relaxed/simple;
	bh=aZMk71KpE9KU5qS5YY3JjD9EGIjnFbFH4g7Ru87fgwM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fEWSOU7Co3DtyJ5OhFpc9jyvzeQ1XSR2v+F6uGEYlAbvNts15a7kZ69GSgl7htMPPQyDKBrNDfMCY2U+kUJKRC6841GJsnK8uRfwKg1Fknu+sWjvSffclnOrGX6/culVOfAOLeEPtrbgaHMbZRoOJ1n00qqDNhwjrJ2Jp/SZok4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JAN/Pr84; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JAN/Pr84"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCEE8C2BCB0;
	Sat,  9 May 2026 00:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778285349;
	bh=aZMk71KpE9KU5qS5YY3JjD9EGIjnFbFH4g7Ru87fgwM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=JAN/Pr84qr6fpqYhRCqhTd76eBkPE5AVTJlGObFODdlQayVsT54y0iHMc8BU1TzT2
	 UHQaxsR5aEEaBhl3TGKwwcX8//FtXXJXqpup476wD0MqIn+298TbTxDZs9z8P/8RtU
	 hitrW35yy/5fAA9hDDAXQdfqgGajg8zF+5G6AY/MAqRYLLofP/91E/2sA1CKOLruiR
	 X68lCjKelUgQKQaZZhJz3SGNhmSEilvxMuEOsglml0eCQADmKXHwxtYLyJ7gJIfigB
	 O0KjWyXKAfDpZUKMUy+NSfS0vkvUF2k1XWMR/XD05MBIew1Xr27T+W+rAY1+dIwzxc
	 H+B7woupKAsUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/8] arm64: dts: rockchip: add radxa camera 4k on
 rock 5b+ cam1
Reply-To: sashiko@lists.linux.dev
To: "Michael Riesch via B4 Relay" <devnull+michael.riesch.collabora.com@kernel.org>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260508-rk3588-vicap-v4-7-6a6cd6f7c90b@collabora.com>
References: <20260508-rk3588-vicap-v4-7-6a6cd6f7c90b@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 00:09:08 +0000
Message-Id: <20260509000908.CCEE8C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `ovdd-supply` for the IMX415 sensor is incorrectly assigned to=
 the 2.9V regulator (`savdd_cam1`) instead of the 1.8V regulator (`siovdd_c=
am1`), which may cause hardware damage.
--

commit e46c0d86040d3c76c24e08d7bc4d0bb3f3567d45
Author: Michael Riesch <michael.riesch@collabora.com>

arm64: dts: rockchip: add radxa camera 4k on rock 5b+ cam1

Add device tree overlay for the Radxa Camera 4K (featuring the Sony IMX415
image sensor) to applied on the Radxa ROCK 5B+ CAM1 port.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k=
-cam1.dtso b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-c=
am1.dtso
> new file mode 100644
> index 0000000000000..96b8df4ed3540
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.d=
tso
[ ... ]
> @@ -0,0 +1,99 @@
[ ... ]
> +	siovdd_cam1: regulator-siovdd-cam1 {
> +		compatible =3D "regulator-fixed";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +		regulator-name =3D "siovdd_cam1";
> +		vin-supply =3D <&vcc_3v3_s3>;
> +	};
> +};
> +
> +&i2c4 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	status =3D "okay";
> +
> +	cam1_imx415: camera-sensor@1a {
> +		compatible =3D "sony,imx415";
> +		reg =3D <0x1a>;
> +		assigned-clocks =3D <&cru CLK_MIPI_CAMARAOUT_M4>;
> +		assigned-clock-rates =3D <37125000>;
> +		avdd-supply =3D <&savdd_cam1>;
> +		clocks =3D <&cru CLK_MIPI_CAMARAOUT_M4>;
> +		dvdd-supply =3D <&sdvdd_cam1>;
> +		orientation =3D <2>; /* External */
> +		ovdd-supply =3D <&savdd_cam1>;

Does this code assign the wrong regulator to ovdd-supply?

It looks like ovdd-supply is using the 2.9V regulator (savdd_cam1) instead
of the 1.8V regulator (siovdd_cam1) defined earlier in the overlay.

Supplying 2.9V to the 1.8V digital I/O domain of the IMX415 sensor might
exceed its voltage rating and potentially cause hardware damage. Should this
property be updated to reference siovdd_cam1?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-rk3588-vic=
ap-v4-0-6a6cd6f7c90b@collabora.com?part=3D7

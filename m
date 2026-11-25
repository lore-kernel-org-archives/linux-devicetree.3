Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611833;
	b=CKmGiumhC6j36VyO1hP8t9EqvLz9tupvx5Yv4tY15De0xUK2scFRerja3b8uzvlt3Bjj
	 CwyVwL8XGIDcXRa4QQB483o3YNJqx7z4+V4/O5izHeha/QNsplIToBKNGnEdJANbvcwP9
	 PlzUfYPpEh/zX+S1zI0/HqCHaPm8/w0aYahhGisxPT0gnrnxha/tvCRJV5bBDJ8i3uXEF
	 NggpA6T+mIXfnb5RuPIu1b6SZm/oJg0bCeY0Jptc98avY7G4nRcqiBurTsmT35J6lpiR3
	 Q7tduiVVzTSC1fwGT41Qnaarjrd1mndA9UOdK3DKsAj11NcJ/aFVu7iOYBjTOKaotTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611833;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+vwn4Q9Et0uTejIyl1NKvDIcgXTCUXCDF0BYvP2DMqE=;
	b=lI7gk6Ml//vLtAk80mINmo4yaU4BvCV0zqTAAkHDiq+cXCFHyL/Mht9jQPIB/DrstM1x
	 NOh2TOxSEZny5f9IyBs2XMJy/GEhYfdE9ussRvoqCtFoRY96QhYE9giGhYRsVg7sCfeFT
	 lt4B2bjIK0zDH2Eb8RDGuIdvvkWSSqnV4IAdv8uMiOqrBZsVk0XKcWkLYIHPQYfN/Pjky
	 kQVpo4WdAG7qh6WZ3h8CaMi8zTPZ1TIP61GZzBSd+LgMPQx4hu1WUVZ8Q0JfO+6y0stG3
	 d/iJbUo0ORJ4GHrnEtKsvXZP+6Bwj+6HRVGEgvfbz82LJQi2A0vvQ47ny0N7lrg7HCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dreUXVbA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48512606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 13:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dreUXVbA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8B61F000C4;
	Wed, 25 Nov 2026 13:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611833;
	bh=+vwn4Q9Et0uTejIyl1NKvDIcgXTCUXCDF0BYvP2DMqE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dreUXVbAPEsQ545hWVsSDFiJa5GkviZ99BTTyQFpbTsgpdBYa1+twHmLSX76slY+C
	 wHrD5Bgvqb4OMNq2bb695SRQpQ33iH9+iFFGRY0pgppIK3rjNSiAIdlPP9Eiq5+d3C
	 6Jk3NZXWimqU7vw6U4a9UDT4H7n95ffVJO1vttQeEEqd1o22SQvkXth/aP82GEp4wz
	 leTvDcscBP6q3q3ELHVjzqBVcirUgtpxsUbZcGeksA6uc5dnjtPAtIJUp0LsKkM7u1
	 D1lheVEdP7O5sAjAtLQA2uuOrZDBkUvbhWn3d5ai4i6NMA52M6WDK9fIAlXv+33TZ0
	 gbBkc9pxaaF7A==
Message-ID: <sashiko-outbox-233435@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: monaco-draco-evk: Add Waveshare
 8" DSI panel overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vishnu Saini" <vishnu.saini@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-monaco_display_intf-v1-4-8a27d60b0d94@oss.qualcomm.com>
References: <20261125-monaco_display_intf-v1-0-8a27d60b0d94@oss.qualcomm.com>
 <20261125-monaco_display_intf-v1-4-8a27d60b0d94@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 13:03:52 +0000
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
- [Low] arm64: dts: qcom: non-generic node name goodix@5d in waveshare
  overlay
--

commit f24766d8aba3667b0bad8e301e475e434a1d60be
Author: Vishnu Saini <vishnu.saini@oss.qualcomm.com>

arm64: dts: qcom: monaco-draco-evk: Add Waveshare 8" DSI panel overlay

This commit adds a devicetree overlay for the Waveshare 8" DSI touch panel
connected to DSI0 on the Monaco Draco EVK.

> diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk-waveshare-dsi-8inc=
h.dtso b/arch/arm64/boot/dts/qcom/monaco-draco-evk-waveshare-dsi-8inch.dtso
> new file mode 100644
> index 0000000000000..79ce8cc4a2895
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk-waveshare-dsi-8inch.dtso
> @@ -0,0 +1,94 @@

[ ... ]

> +&i2c_mux {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	i2c@0 {
> +		reg =3D <0>;
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		wsgpio: gpio@45 {
> +			compatible =3D "waveshare,dsi-touch-gpio";
> +			reg =3D <0x45>;
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +		};
> +
> +		touch: goodix@5d {
> +			compatible =3D "goodix,gt9271";
> +			reg =3D <0x5d>;
> +			reset-gpios =3D <&wsgpio 9 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +};

[Severity: Low]
Should goodix@5d use the generic node name touchscreen@5d instead, to
follow the Devicetree specification and match
monaco-draco-evk-raspberrypi-dsi-7inch.dtso?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-monaco_dis=
play_intf-v1-0-8a27d60b0d94@oss.qualcomm.com?part=3D4

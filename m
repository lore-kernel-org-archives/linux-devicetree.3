Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814330;
	b=r9eT8/X5TLUP2yLVddQt6Hq23WqzTfiMMtFdpqfjifF7XIv6o0H15viIQSB2lXN+8TfN
	 HwVfcGJnBPAl5wVUzHlT/s0w9bSB0caixVdzaS7q0OmNrbST2LQXFwwbz3xIJNeASFcGK
	 dcxUqx/dQwimjZfB6dgx21ThYBzLBqFO6Zgvbph1txr/gwY4A3dY0QW82PxeFBnk3z+O9
	 50QBHwQMClxaD43kEeQI6RzTROnKU8vYL3SlbrTPAJkhJ5YaAGgtT7wwxGaP+QhO4IY6g
	 fx3pF9J0YBA4p1RHKeLeu3ldhT0fKUXBc0SiIS5naBf9eNJ10b2D9pSEYk/W5WUrWTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814330;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oXHDKPwoUSDTOaiRBQ2jabh2zXkESxsmhOkMMuNr4kE=;
	b=i+Z9Yy4GVBiMVE3WtR02jOtqz6cTloKEuqmtvuXzLpDWCyEXXlPcuJJPMZ2y1Fl8JRFb
	 m9ENV6xorK5zCQLEm9gTNKmkstBzXjE2L5/odCRal5IL/Xn/uB2tfF4ujtcLUg4IZhiTG
	 S62EuS4xPz+t5X0Q/hAf8vyK0JkKbcFcJHqf1IUq00kxpqE7P/4twTgnD8RN4tvBgD8N4
	 tQHbVrBPqGv97z7uB/DmbGDIM3Yg3ixkvwcv8CVB7NrnmL+YS5fRDqpbLdBzKQzB7PP6x
	 nDojtXEF0mjzHDn/3dCh/p/QsdqGGGCJz5d8wUUmkMSt6qvzmRzXURETPjbQ01OS19A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=My+89gGZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FC0606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=My+89gGZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56ECE1F000C4;
	Mon, 16 Nov 2026 07:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814330;
	bh=oXHDKPwoUSDTOaiRBQ2jabh2zXkESxsmhOkMMuNr4kE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=My+89gGZxK0whs6QumD4k2A4zzsf8Hvw1T0KCJRmT27MAh6iiMwBeo4+oHszGu7I1
	 GBZZj3u0025Ike20wsBJ2RiWpEmzuNn+tQNr1o/+mqcRnNOece8tT1qABgtzmcak1O
	 mmjpYiOMODCjxoJC8gpB6Tm+9K4hLA0hxoqTz+DGU/EoPnBfgmqGvknnUxlRVxLfT+
	 XFWZXs63xYifOdWrj2MjF0U/+LZR1aR6Mdr3ExUSvV+hQkBSp/QwimbcQTSJlhoCJL
	 nB0gSXczS5L7wFnpT8AZLAFcxOjo5usnJr6wSkBt5A4bzM8FUv+NShxfH44eoad9/h
	 DpqvvCpIAXAbw==
Message-ID: <sashiko-outbox-216434@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: add Shikra PWM controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-pwm_qcom_shikra-v1-3-67ee4553adc5@oss.qualcomm.com>
References: <20261116-pwm_qcom_shikra-v1-0-67ee4553adc5@oss.qualcomm.com>
 <20261116-pwm_qcom_shikra-v1-3-67ee4553adc5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 07:32:09 +0000
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
- [Low] arm64: dts: qcom: shikra: pwm@4700000 left enabled by default in
  SoC dtsi
--

commit eea458c9d44a72e60937665a306393bd7a4b77fd
Author: Taniya Das <taniya.das@oss.qualcomm.com>

arm64: dts: qcom: add Shikra PWM controller

This commit adds the PWM controller node and its ten frame child nodes
to the Shikra SoC DTSI.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index 0a95ad5a5582c..d8a3de38382bd 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -1303,6 +1303,69 @@ sram@4690000 {
>  			reg =3D <0x0 0x04690000 0x0 0x14000>;
>  		};
> =20
> +		pwm: pwm@4700000 {
> +			compatible =3D "qcom,shikra-pwm";
> +			reg =3D <0x0 0x04700000 0x0 0x10>;
> +			clocks =3D <&gcc GCC_PDM_AHB_CLK>, <&gcc GCC_PWM0_XO512_CLK>;
> +			clock-names =3D "ahb", "core";
> +			assigned-clocks =3D <&gcc GCC_PWM0_XO512_CLK>;
> +			assigned-clock-rates =3D <9600000>;
> +			#pwm-cells =3D <3>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			ranges;
> +
> +			pwm@4701000 {
> +				reg =3D <0x0 0x04701000 0x0 0x1c>;
> +				qcom,frame-index =3D <0>;
> +			};

[Severity: Low]
Should pwm@4700000 and its frame child nodes default to status =3D "disable=
d"
(with labels on the child nodes)?

Leaving them enabled in the SoC DTSI causes qcom_pwm_probe() to run on
every Shikra board, mapping all ten frames, enabling the PWM clocks, and
clearing all ten channel enable bits in PWM_TOPCTL0 even on boards that do
not wire up PWM.  Without labels and status =3D "disabled" on the frame chi=
ld
nodes, board files also cannot selectively enable only the frames they use,
which qcom_pwm_parse_dt() checks via for_each_available_child_of_node().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-pwm_qcom_s=
hikra-v1-0-67ee4553adc5@oss.qualcomm.com?part=3D3

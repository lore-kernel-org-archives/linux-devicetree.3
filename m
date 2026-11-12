Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458892;
	b=o5jy/KOAwvr8VK86aBeDV0VCM9OsTIf36VOswMZjPfcTwtbIO0cnmbyHOxIBuPBtYo9i
	 2okgtNQt4Y0H7ktGRRAQs0haIPfk3CwoGWh2CyRROzV8ve5oe9yR87o4Dw8F5xx2cZXtg
	 /eTgVNjVHcBVYjIXFbmJNlI+Rs2wHeONZfTIjOsJoV/lXzbCie3mpIZXc0wHxVJ/20lzb
	 +751pjm9YKio12BeEn71gSxMxq/rtcGtXpxaHBJ5snoTtKM6teRpD2NNSrJR14uGho4Hh
	 xxb2S1ybmwoZUBvgVs7PxW/aDZSRa5twxytqII9a3R1YwiXYtI1bQqLMm7wCqXlSbAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458892;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OFhqHyx/yPg/BIuICNdtPyFl44tdqNgA8wk6ps6KAfI=;
	b=KNm/CQeJbm+GZ2M0rRYKdUzImjr9S2c+iagC6mRmsZeKhDs7AJ1L7/a5+fKYk1LrYs9L
	 Ij5aLyc8z/EtgiocBghLJ4f9GaJGs5VHBzwZcANq9/Uww4Io1E8sTgg/J4PtrWont8giz
	 PBe0wL/47VIlWNevb+gyR9F3MEeTKTF5Gbo48s6qwW7OHTEsQON6+q995IBUVjjlEFEWt
	 gFRsKLpVz6Hh44D4zs1ed7AnZoLOk0LS0EWK8BrGb2aNyALyslDYBnzQGK8/L4DUuyo8s
	 shPuZ86WewuOp2NBcVhD86bt8j5ROXyG6ztAHOuchDQrYHq3KbNSX+pGgUfARO5ez3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OMUGCW84;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EB1606A324
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OMUGCW84
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F201F00A05;
	Thu, 12 Nov 2026 04:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794458892;
	bh=OFhqHyx/yPg/BIuICNdtPyFl44tdqNgA8wk6ps6KAfI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OMUGCW84iYk+q1TjU5T7xi0L0sBgAD+8YGqccbHMkUw1hZG7YCNR1TS/AOITAJCCu
	 fpiRdLzpGdickUOeoSUumc/geq/iVFxIC0Vgch7LsEGGuB+YIHU1jf0eiSDQvEvF4X
	 dYJTPuAQsxR9bp1woVPBI4UOnGFQFuwY4nIHTQVrtGlIbng4cFff/AbWO4r38grlj/
	 duOMXxasMsekAH5k+Ot5jqyOmH9oCn1Ms8iEcB0alMdmOBqSQYwTTMByBVLBfD6iuL
	 2nVy9oNlvhcQX1yp8RJoDPuwzCq/vbSQ+n34B86GZOMYSlO5583INjI7BOXZ87p6Iy
	 KZmT7ihquZu6A==
Message-ID: <sashiko-outbox-210393@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 08/11] arm64: dts: qcom: ipq5210: Enable the PWM
 block
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-08-dts-v9-8-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
 <20261112-08-dts-v9-8-c34de4f78fbb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 04:48:11 +0000
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
- [Low] arm64: dts: qcom: ipq5210: pwm node enabled in SoC DTSI instead
  of board DTSI
--

commit 2d83ac83097807a2fcd75eaf7c88a88dc70672e9
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Enable the PWM block

This commit adds the PWM controller node to the IPQ5210 SoC device tree
and configures its pinmux on the RDP504 common board file.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/a=
rm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
> index 02fb76283f7fa..87a7e625a2a41 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
> @@ -89,6 +89,11 @@ &pcie1_port0 {
>  	reset-gpios =3D <&tlmm 29 GPIO_ACTIVE_LOW>;
>  };
> =20
> +&pwm {
> +	pinctrl-0 =3D <&pwm_default_state>;
> +	pinctrl-names =3D "default";
> +};

[ ... ]

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index aa1045f20ed20..4cb9f399d4808 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -431,6 +431,16 @@ tcsr: syscon@1937000 {
>  			reg =3D <0x0 0x01937000 0x0 0x2b000>;
>  		};
> =20
> +		pwm: pwm@1941010 {
> +			compatible =3D "qcom,ipq5210-pwm", "qcom,ipq6018-pwm";
> +			reg =3D <0x0 0x01941010 0x0 0x20>;
> +			clocks =3D <&gcc GCC_ADSS_PWM_CLK>;
> +			assigned-clocks =3D <&gcc GCC_ADSS_PWM_CLK>;
> +			assigned-clock-rates =3D <100000000>;
> +			#pwm-cells =3D <3>;
> +			status =3D "okay";
> +		};

[Severity: Low]
Should pwm@1941010 have status =3D "disabled" here in ipq5210.dtsi, with
status =3D "okay" moved to the &pwm node in ipq5210-rdp504-common.dtsi?

The PWM pinmux is board-specific, and ipq_pwm_probe() calls
devm_clk_get_enabled() and devm_clk_rate_exclusive_get(), so enabling the
controller in the SoC DTSI keeps GCC_ADSS_PWM_CLK ungated and rate-locked
at 100 MHz on every IPQ5210 board even when PWM is unused.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-08-dts-v9-=
0-c34de4f78fbb@oss.qualcomm.com?part=3D8

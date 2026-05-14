Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D378C383337
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 05:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778737088; cv=none; b=PIRtiSGUpbQVZzqRyV2CuHLDE8QDQsWpZ56M1bdiMKwKNY+b8qTLPrlOpicyAwGZcKQNDyPRoRLoJLHUbhN3491eQiuvSXJlCcVpzAeb9WtySqpoggOhQNpkLNy4Bij66GpPpbYV4S/5uY8fnLw/xIrALZVwYSUqN0Ih8ZWUX3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778737088; c=relaxed/simple;
	bh=5R9UUhOPRiPCWEj4HTovT8htK4Wz7soBIDKAJ/Z4N2E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dok8yblHb8WONLs7BMKFVaPV/mECMDqN3/fUT5OsA+rC5WRx1XoamWD686SmimVOGf424x0J5537r+3etlD2bHBNCcr0fshi1RcuwOmUmyPz2ZAnsojrAaMj80NZf3qr/VROxsEbtpFPzVE584hqQJo7IntHd7pWcdIf50hTf2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o4VD1pHL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o4VD1pHL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38185C2BCB7;
	Thu, 14 May 2026 05:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778737088;
	bh=5R9UUhOPRiPCWEj4HTovT8htK4Wz7soBIDKAJ/Z4N2E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=o4VD1pHLMslla16UIyhxkeogyY5JlpShRklBnFWckY7rJD+j/liSqSRnTi5L0a6AR
	 Er93oYx1sb+9u28VS+RaqvMVnt7GwDfbZcHBzQV8tPBalnPckcH72YJ5+83FcBm7ge
	 kJ/UtLn4NHghXRj1ZPS0gUn/Opy4an818Ls2PrX5JiHlBBXFD+4c7XulTGeLG2Tpb2
	 YCB1nEpFJIAagaFufmJKtFOIx8CgsCOfv3AUj95zj5mqYign/ZHwSZDdb+15/ouriM
	 bnPXOdHcw3sAQYf53gFvmUlR0j7GcW4+Nfx1dMzlooVXAzfoBRoP9QV3bqqHnFEZq4
	 pi+8chiYZE9wQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/6] arm64: dts: qcom: sm8350: add Iris device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513-iris-sc8280xp-v6-5-0d11d90d3e26@oss.qualcomm.com>
References: <20260513-iris-sc8280xp-v6-5-0d11d90d3e26@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 05:38:07 +0000
Message-Id: <20260514053808.38185C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing power domain management for `mmcx` in the fallback driver =
leads to voltage underruns at high frequencies.
- [Medium] Device Tree schema violation: `power-domains` count mismatch for=
 `qcom,sm8250-venus` fallback.
--

commit bd1540a2aea97fb87b08697e9a713ca663a208e8
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

arm64: dts: qcom: sm8350: add Iris device

This commit adds the Iris video codec and video clock controller devices
to the SM8350 device tree, describing the Iris2 core present on this platfo=
rm.

> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/q=
com/sm8350.dtsi
> index 5c8fe213f5e4e..eedf677a7070d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
[ ... ]
> @@ -2745,6 +2747,85 @@ usb_2_dwc3: usb@a800000 {
>  			};
>  		};
> =20
> +		iris: video-codec@aa00000 {
> +			compatible =3D "qcom,sm8350-iris", "qcom,sm8250-venus";
> +			reg =3D <0x0 0x0aa00000 0x0 0x100000>;
> +			interrupts =3D <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks =3D <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>;
> +			clock-names =3D "iface",
> +				      "core",
> +				      "vcodec0_core";
> +			power-domains =3D <&videocc MVS0C_GDSC>,
> +					<&videocc MVS0_GDSC>,
> +					<&rpmhpd RPMHPD_MX>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			power-domain-names =3D "venus",
> +					     "vcodec0",
> +					     "mx",
> +					     "mmcx";

Does this configuration violate the device tree schema for the fallback
compatible?

The qcom,sm8250-venus schema limits power-domains to 3 items (venus, vcodec=
0,
mx). By adding mmcx as a fourth power domain without updating the
qcom,sm8250-venus schema, running make dtbs_check will result in validation
errors.

Furthermore, because the kernel lacks explicit driver match data for
qcom,sm8350-iris, the device will bind using the fallback qcom,sm8250-venus
compatible.

The driver configuration for sm8250 strictly requests and attaches only a
single OPP-scaled power domain (mx), completely ignoring mmcx. This means
mmcx will not be dynamically scaled by the PM OPP core and will remain at i=
ts
static initial voltage (likely low_svs, as requested by the videocc clock
controller).

[ ... ]
> +				opp-444000000 {
> +					opp-hz =3D /bits/ 64 <444000000>;
> +					required-opps =3D <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_nom>;
> +				};

Will this cause a voltage underrun when scaling to higher frequencies?

When the hardware scales to 444MHz, the opp-table mandates that mmcx
requires nom voltage. Running at 444MHz while mmcx is starved at low_svs
due to being unmanaged by the sm8250 driver configuration could lead to
hardware instability, crashes, or synchronous external aborts.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-iris-sc828=
0xp-v6-0-0d11d90d3e26@oss.qualcomm.com?part=3D5

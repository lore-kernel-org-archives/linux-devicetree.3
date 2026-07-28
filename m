Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814A13C3F5E
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 10:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234314; cv=none; b=MGy39642CdxaNNxe5saOJNCDrmV5thKE55kjk6mHcYRvbxmX3cBLYmUVJ7/OMHN5G6DgSPDnzougFQGCG+A7FPGT6tjzuamfYkVdGPBa+mqq2KgaUdk88l+5OfU1pSZsu4vTCCwAexUUnVkaHqOz+Fxle3g7/YKkE5wVrKWM4w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234314; c=relaxed/simple;
	bh=0MbK2OXS/YeRVkZa+TzZ78jS2vKN7hFZUeDHVgXpieo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LIS3/C+81gs349tBpUF2Y8gn3DEk9s91FsMlF242GF9NIreMi4O9tvap67NNNR6WzqsJuLaTWtvEXphYl83chP9uVJQOTnbSQErfEerPA9ByvqIofjK1FnrWcDnry7r+sPf9Gj8cLs5gUkheHxeEOtIGvesyGOsh2j+F4fS9I8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0l+R8as; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0l+R8as"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4679B1F000E9;
	Tue, 28 Jul 2026 10:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785234313;
	bh=Vy/L0F1ELlnN4fLe5bDsIxy6Y3LPjCz+B5u6Xqpr3vo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z0l+R8asxqLDPU9ZDfx1XGeGhM7q++N+kshw/bo1gjMAVcSbrzksLtMkLLSBKlfpO
	 TgTsLwp8qHmAn+zM96AC9tGBBlkgBZu6I5OA59WNas+v51PUzqRM09yhzh74S2iTKE
	 1N+3Yg4CbNRXET6IZvAigzBVbvFyRxoQ1vN7GDjsY9LNDozqd5OWuy094TACx+Pozq
	 maGfe4quYs/RoTbn2t++3plHuAX9tN5tdluTPzKoWfBSTuiOnuYBjF32b86l0p2mRA
	 8GrD3A+LeWqL4HpFznGwS1ZT+AsX6+xtBV4N7CUgZA+Rm4aeodUZ/5ZLr4l8azd1cX
	 RW0DCkBjsTxkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: hamoa: Extend QMPPHY
 description for USB4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: vkoul@kernel.org, olteanv@gmail.com, conor+dt@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-topic-usb4phy-v2-5-5d9dd5149ec7@oss.qualcomm.com>
References: <20260728-topic-usb4phy-v2-0-5d9dd5149ec7@oss.qualcomm.com>
 <20260728-topic-usb4phy-v2-5-5d9dd5149ec7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 10:25:11 +0000
Message-Id: <20260728102512.4679B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing cleanup on error paths in qmp_combo_usb4_init() leads to=
 a leaked clock and unbalanced PHY state.
--

--- Patch [5]: [PATCH v2 5/5] arm64: dts: qcom: hamoa: Extend QMPPHY descri=
ption for USB4 ---
commit c84965f0842bad650afeacff840775c1c5f9c6ae
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

arm64: dts: qcom: hamoa: Extend QMPPHY description for USB4

The USB4 part of the QMPPHY requires that one more GCC clock (P2RR2P -
PHY-to-Router, Router-to-PHY) is enabled for the PHY to initialize
successfully. This patch updates the device tree to describe this clock
for the PHY nodes.

> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -2825,11 +2825,13 @@ usb_1_ss0_qmpphy: phy@fd5000 {
>  			clocks =3D <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK>,
>  				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> -				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>,
> +				 <&gcc GCC_USB4_0_PHY_P2RR2P_PIPE_CLK>;
>  			clock-names =3D "aux",
>  				      "ref",
>  				      "com_aux",
> -				      "usb3_pipe";
> +				      "usb3_pipe",
> +				      "p2rr2p_pipe";

[Severity: Medium]
Does adding this clock lead to a resource leak in the driver on error paths?

In drivers/phy/qualcomm/phy-qcom-qmp-combo.c:qmp_combo_usb4_init(), if an e=
rror
occurs after enabling the p2rr2p_pipe clock, the cleanup paths don't seem to
disable it:

	ret =3D qmp_combo_com_init(qmp, false);
	if (ret)
		return ret;

Here the function returns directly, failing to disable the previously
enabled clock.

Later in the same function:

	ret =3D qmp_combo_reconfigure_phy(qmp, QMPPHY_MODE_USB4);
	if (ret)
		return ret;

If this fails, it misses both the clock disable and qmp_combo_com_exit().

And finally:

	ret =3D qmp_combo_usb_power_on(phy);
	if (ret) {
		qmp_combo_com_exit(qmp, false);
		return ret;
	}

This handles the com_exit but still misses disabling the pipe clock.

Could this cause the clock reference to be leaked on hardware initialization
or resumption error paths, preventing the associated clock and power domains
from being disabled?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-topic-usb4=
phy-v2-0-5d9dd5149ec7@oss.qualcomm.com?part=3D5

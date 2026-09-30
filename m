Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB68443A88
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790750977; cv=none; b=ekEwKbyEOKg/F08tznen2mb/z0OyLs76sKzAkxPvGOqRi7uvBmWLAeIQW4vc4D45YkoL86vqwmess3Hy4V2EohG87Xyfc2+f8WgBhoi4ssFvaYYcZddcAx+3IhEzJSD+ZdTEmKsQvwOhZowBieSImzoLeYTv1iTNwxlQro94Ch4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790750977; c=relaxed/simple;
	bh=WBiAeP/PfwxbqOjNqNJUco0Er75MU95mNIpprH0EYm0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dPDC8MNHbYavYkJqWmSXMcfSQd3OidecYqLlCj5wpI+YuiAiqw3Z9Vam9GnV6kzMqKnNoyv8aKMbIybsNm/reYnXLj4/QyklThEOfZEdyufD14u0eUZ1aO6rsJhjjKfd1P8X+lFLDR+4EQezgdCWt3UCJBiAR3u9dRuSWTFg4G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YM/kkaP0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YM/kkaP0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551261F000FF;
	Wed, 30 Sep 2026 06:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790750966;
	bh=7rIIfFgwN/cVEA1t/3bV84gwguc2f3VS7K/vgMiuqeY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YM/kkaP0NyDxy/s0V0Wzxr2j/cA98zTm+66iROa7K6N88TwO23qzedMAFt4mwACe+
	 8t3Pj/x4/mEKi8OQE7RVV+WI3J28+XLO6dp4X/7wkYBaJtXxKZdmNp5b+uq80KA73M
	 nWMBmotEBWKUt1fR1zGEsLfzc2vQ2GJYv8/RdX4TIo1x4GCYahO5ZI82nCBkh9OgjE
	 5FvjXr8R1XA9OGXkXSSiui4Wz9CzHrJSUxd/AbniK0GsIUXQ8v4FEYviGYSME7kjcI
	 GnAq8O2GphebdOr0uRE6IEyLTuvtyk0djbhwVasDZNkQbJmg0FIVAYJbKeF4/hZazT
	 SBuoTic9B+kZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: Introduce Maili SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jingyi Wang" <jingyi.wang@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260929-maili-dts-v2-3-965688646c4b@oss.qualcomm.com>
References: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
 <20260929-maili-dts-v2-3-965688646c4b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 06:49:25 +0000
Message-Id: <20260930064926.551261F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] arm64: dts: qcom: maili: pcie1_opp_table defines x2 OPPs for an =
x1 PHY
- [Medium] arm64: dts: qcom: maili: impossible QUP pinmux function definiti=
ons
- [Medium] arm64: dts: qcom: maili: gpi_dma channel masks exclude requested=
 QUPv3 channels
--

commit a14e352543affb0d0357fd40cb50b296dee6d5e7
Author: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

arm64: dts: qcom: Introduce Maili SoC

This commit introduces the Maili Snapdragon SoC device tree. It includes
various features such as CPUs with PSCI, PCIe, QUPv3 serial engines, UFS,
and GPI DMA.

> diff --git a/arch/arm64/boot/dts/qcom/maili.dtsi b/arch/arm64/boot/dts/qc=
om/maili.dtsi
> new file mode 100644
> index 0000000000000..c420b709cc7de
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/maili.dtsi
[ ... ]
> +		gpi_dma1: dma-controller@a00000 {
> +			compatible =3D "qcom,maili-gpi-dma", "qcom,sm6350-gpi-dma";
> +			reg =3D <0x0 0x00a00000 0x0 0x60000>;
[ ... ]
> +			dma-channels =3D <16>;
> +			dma-channel-mask =3D <0x7f>;

[Severity: Medium]
Does this channel mask intentionally exclude channel 7? The mask <0x7f> ena=
bles
channels 0 through 6, but later in the file i2c7 and spi7 explicitly request
channel 7 from gpi_dma1. This could cause the DMA controller to reject the
channel allocation during boot when QUP drivers probe.

[ ... ]
> +		gpi_dma3: dma-controller@1900000 {
> +			compatible =3D "qcom,maili-gpi-dma", "qcom,sm6350-gpi-dma";
> +			reg =3D <0x0 0x01900000 0x0 0x60000>;
[ ... ]
> +			dma-channels =3D <12>;
> +			dma-channel-mask =3D <0x1f>;

[Severity: Medium]
Similarly, does this dma-channel-mask exclude channel 5? The mask <0x1f>
only covers channels 0 through 4, but i2c18 and spi18 explicitly request
channel 5 from gpi_dma3. This will cause DMA initialization to fail for tho=
se
serial engines.

[ ... ]
> +		pcie1: pcie@1c18000 {
[ ... ]
> +			pcie1_opp_table: opp-table {
> +				compatible =3D "operating-points-v2";
[ ... ]
> +				/* 8.0 GT/s x2 */
> +				opp-16000000-3 {
> +					opp-hz =3D /bits/ 64 <16000000>;
> +					required-opps =3D <&rpmhpd_opp_low_svs>;
> +					opp-peak-kBps =3D <1969000 1>;
> +					opp-level =3D <3>;
> +				};

[Severity: Medium]
Is it correct to define x2 (2-lane) operating points for pcie1_opp_table?
Later in the file, the PHY is explicitly declared as a 1-lane PHY
(qcom,maili-qmp-gen4x1-pcie-phy). Attempting to scale to these impossible
states could cause mismatched bandwidth expectations or incorrect power
scaling votes in the OPP framework when parsed during runtime.

[ ... ]
> +			qup_uart12_default: qup-uart12-default-state {
> +				/* TX, RX */
> +				pins =3D "gpio208", "gpio209";
> +				function =3D "qup2_se4_23";
> +				drive-strength =3D <2>;
> +				bias-pull-up;
> +			};

[Severity: Medium]
Can these pins actually use the _23 function? These pins appear to be wired
to the _01 lanes, as qup_i2c12_data_clk uses qup2_se4_01 for the same pins.
Assigning an incorrect mux function here will cause UART initialization to
fail or silently misroute signals when the pinctrl states are applied.

[ ... ]
> +			qup_uart22_default: qup-uart22-default-state {
> +				/* TX, RX */
> +				pins =3D "gpio121", "gpio98";
> +				function =3D "qup4_se3_23";
> +				drive-strength =3D <2>;
> +				bias-pull-up;
> +			};

[Severity: Medium]
Are these the correct pins for this UART? This pairs mismatched pins
(gpio121 with gpio98) while asserting the _23 function. This directly
conflicts with the corresponding I2C node which uses gpio121 and gpio84
for qup4_se3_01. This structural misconfiguration will prevent successful
UART initialization.

[ ... ]
> +			qup_uart23_default: qup-uart23-default-state {
> +				/* TX, RX */
> +				pins =3D "gpio161", "gpio162";
> +				function =3D "qup4_se4_23";
> +				drive-strength =3D <2>;
> +				bias-pull-up;
> +			};

[Severity: Medium]
Does this function assignment match the hardware? Like qup_uart12_default,
it assigns the _23 mux function to pins used for TX/RX that are wired to
_01 lanes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-maili-dts-=
v2-0-965688646c4b@oss.qualcomm.com?part=3D3

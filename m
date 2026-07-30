Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503C442E8C9
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 14:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785421869; cv=none; b=cX7zHJlG0qTdZBqHnSgQWeF2RXL6cZanIBFc0WLbCLhodZrgnQ6RdVNvT4LLGnMxvBxQPyT3Kxhs57bYko/XjP0NX8s/XtMbdj4Kklrlj2+E+YDDloTmqjtPBEWErJoF/mk7nHjVZoCn+j8bV7pBUb8HtA9p991JjCs3ZBRrD5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785421869; c=relaxed/simple;
	bh=TTQYa4RlY/JMmNj91fVGR67qoDf7KRie8kLoOImIK/s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LYdka2V67OYGpi8CE3IcbKJg0Y1finAb5Ow2IyAPvDi6ZSCInXCbzeLN15WZglJkDpHa85u0678kk6IVQTXCdWPNnFhffEDg7iiqL01+m5sQ/mv2vqrbkjhUbhGl7ZnH5TN2ZQSRYpGRS+EZ2TlA6TD+DxBjAk5ic7StMA/4fqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKE5sBd3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKE5sBd3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E00D1F00A3A;
	Thu, 30 Jul 2026 14:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785421868;
	bh=vv12/0pZczQm/r15/TPjGBt4NvcaiXlnn8L74ZUmwZE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hKE5sBd3Mub5Nn+YYdoEdL14RJ7coV3eMiAJ1YFbzLQ/AwS06fAr9vIRWhbekb3gx
	 avn09rDv43p6zC4RTCxHGyTM90ql3y/M1138oFMSk+kXXNEJc/RnX3zcLgZrI8WutD
	 DoOdvwDG7uHeVF/arNPh6qVJnMYRsjrtxRNptqW4Z/mEHw1iRFXYw3WmZbXnn/SjSH
	 CQ2/aJjP038QLGbrI0HjH6sBoe0TQEuZgKRRp2nc7nTdp5cHUC/yNcv7El+uDnVO/k
	 jHZX0EJRoffECIflbJNHWwtiT6crcGdsP+4D2WV9d8hI3AoX+w70d1SYrwYZMBudno
	 mUd8BIHYhg/lQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: hamoa: Extend QMPPHY
 description for USB4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com, robh@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-topic-usb4phy-v3-5-ccf0f7ea98b5@oss.qualcomm.com>
References: <20260730-topic-usb4phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com>
 <20260730-topic-usb4phy-v3-5-ccf0f7ea98b5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 14:31:06 +0000
Message-Id: <20260730143107.9E00D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] A resource leak is present in `qmp_combo_usb4_init()` (introduce=
d by a previous patch in this series) and is exposed when this DT patch pro=
vides the missing `p2rr2p_pipe` clock. If `clk_prepare_enable(qmp->p2rr2p_p=
ipe_clk)` succeeds, the function may later fail during `qmp_combo_com_init(=
)`, `qmp_combo_reconfigure_phy()`, or `qmp_combo_usb_power_on()`. On these =
error paths, the function returns without calling `clk_disable_unprepare(qm=
p->p2rr2p_pipe_clk)`, leaking the clock reference.
--

--- Patch [5]: [PATCH v3 5/5] arm64: dts: qcom: hamoa: Extend QMPPHY descri=
ption for USB4 ---
commit f94fbc66a74d14588b2084c9550548446b3f5825
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

arm64: dts: qcom: hamoa: Extend QMPPHY description for USB4

This commit extends the QMPPHY description for USB4 by adding the missing=20
GCC_USB4_X_PHY_P2RR2P_PIPE_CLK clock. This additional clock is required=20
for the PHY to initialize successfully.

> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> index 09527dcf95767..2effc0319a01a 100644
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
This isn't a bug introduced by this device tree patch itself, but providing
this missing p2rr2p_pipe clock exposes a resource leak in the driver's
error path.

If the call to clk_prepare_enable(qmp->p2rr2p_pipe_clk) succeeds in
qmp_combo_usb4_init():

drivers/phy/qualcomm/phy-qcom-qmp-combo.c:qmp_combo_usb4_init() {
    ...
	ret =3D clk_prepare_enable(qmp->p2rr2p_pipe_clk);
	if (ret) {
		dev_err(qmp->dev, "p2rr2p_pipe enable failed: %d\n", ret);
		return ret;
	}

	ret =3D qmp_combo_com_init(qmp, false);
	if (ret)
		return ret;
    ...
	ret =3D qmp_combo_usb_power_on(phy);
	if (ret) {
		qmp_combo_com_exit(qmp, false);
		return ret;
	}
    ...
}

Does this code leak the p2rr2p_pipe_clk reference if qmp_combo_com_init(),
qmp_combo_reconfigure_phy(), or qmp_combo_usb_power_on() fails?=20

Should it call clk_disable_unprepare(qmp->p2rr2p_pipe_clk) on these error
paths before returning?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-topic-usb4=
phy-v3-0-ccf0f7ea98b5@oss.qualcomm.com?part=3D5

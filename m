Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F563ACF1D
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785487862; cv=none; b=lIfpicQFQ17IMZHINgJSMIcwgyYn0zBKO+28uHoB5NRqVdfpOubZ3qSLKEnOPW76Z20ROmPVXF9EzezOxo4ewLU5B/jSjM4075FFbIm3J3HEE5IoJd8fUytiirj0yx/weuGwxFfBfie0ddJETXUJWDQ7QxPaTEUkP5InDTas8LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785487862; c=relaxed/simple;
	bh=Ph50djQ70kdbwqixuS17XjVB7kBkZWeedsQN0pTIMog=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aErpokGFQbxyfNX5ItFH21Ksdx6fKJ8/gAjDPOWwaGYlQIJrvB9v6LNmWkhavg8sTsg4E9Q4CAVD6jnsms1fgmoJIh2FrfCMkuORM3Eq5cP4jofnyJTREB70kI3P60JAW8gFgFebW5Ca9wDErx3DmMO4RIYS8+m8V2EgErub+co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MCQxdFfv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MCQxdFfv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FBF1F000E9;
	Fri, 31 Jul 2026 08:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785487859;
	bh=HuwcxlmpHpLh+3Hv1tbZxosnALpO4sFpdLN2G4moF7g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MCQxdFfvnXOAsxvpAhgVe0YTSyPE5QvvW5QicGZOxbcGUF3fZG8EDrBgm5e1QSewn
	 dpUcTSvvE0F39F/hkvzNjFO50nXgsjtrdGpKyUhjw4cz9eTlZqtRCLqU6Q6eUAkfd4
	 nBnCJCExbJx0UL1IyanL4qWJgsrRxVOH3j2RfNBgqPKKNdi/ncMPQC5F3YKksinb59
	 Rrkg8kjdJxxi3WCace4moOdxxBfD1B6ZhD7whuNXrbrVpX0vAvSQAUMxt3O9o53enx
	 mU135twLF1QtMNGnPrOycmES8UoXnU9CTIMzvM6UO+0BwEcNdf+LOhTk62x/iwiek3
	 XnFjhI2Vct2PA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: eliza: Add LPASS macro and
 SoundWire support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ravi Hothi" <ravi.hothi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260731084032.3106477-2-ravi.hothi@oss.qualcomm.com>
References: <20260731084032.3106477-1-ravi.hothi@oss.qualcomm.com>
 <20260731084032.3106477-2-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 08:50:59 +0000
Message-Id: <20260731085059.96FBF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing default pin control assignments in the WSA SoundWire con=
troller node.
--

--- Patch [1]: [PATCH v4 1/2] arm64: dts: qcom: eliza: Add LPASS macro and =
SoundWire support ---
commit c45484edfd4a43a902de46310fa2b56061e83268
Author: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

arm64: dts: qcom: eliza: Add LPASS macro and SoundWire support

This commit adds SoC-level LPASS WSA macro, VA macro, SoundWire controller,
and LPASS LPI pin controller nodes for the Eliza platform. The DMIC and
WSA SoundWire pinctrl states are defined inside the LPASS LPI pin controlle=
r.

> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qc=
om/eliza.dtsi
> index 1830020f23b18..3957dae4524e1 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
[ ... ]
> @@ -2064,6 +2065,77 @@ q6prmcc: clock-controller {
[ ... ]
> +		swr0: soundwire@6b10000 {
> +			compatible =3D "qcom,soundwire-v2.1.0",
> +				     "qcom,soundwire-v2.0.0";
> +			reg =3D <0x0 0x06b10000 0x0 0x10000>;
> +			interrupts =3D <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			clocks =3D <&lpass_wsamacro>;
> +			clock-names =3D "iface";
> +
> +			label =3D "WSA";
> +

[Severity: Medium]
Is this node missing the default pin control assignments?

Without pinctrl-0 and pinctrl-names properties to bind the hardware pins
defined in the wsa_swr_active node, will the SoundWire controller pins=20
(GPIO 10 and 11) fail to be multiplexed to their SoundWire functions when=20
the controller is enabled by a board file?

> +			qcom,din-ports =3D <4>;
> +			qcom,dout-ports =3D <9>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731084032.3106=
477-1-ravi.hothi@oss.qualcomm.com?part=3D1

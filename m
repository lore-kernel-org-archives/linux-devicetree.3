Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC295383329
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 01:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778551006; cv=none; b=tZeFwKTQnbSH6Ay7IeYjhRyhXsPczzG6a03F9RstYTmBdl4pMo8mfyVBb1ow1Flh7ncHyxPwch9u7IF0qv/twn2Z1OSA5tGGguq1JiJSKNpVbeuMYyhiO0AjHmpQoq5qLfWpUJktbNgSZuSdSJGUhfOKrn2V3OE2L8SIkJ+wUYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778551006; c=relaxed/simple;
	bh=wqhu06DBSRwMRCvGCZNx54tpcBKb/bWdBVBbi2M7GM4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CgIB6UC50fvErrNHIR9W4rZVuBds1RaXS8pD9t00RttMt+9RN8QPoS3qLFau+x0FiVnJ8Wagj1UD35CeU6JU9PcGHOCLJEibmrgaH1zAWJ3cf9TEEHuooU49U7OMfB9/HuN5G9L+6BwtllxbCl67aD5pmt+z7bKNPU1CAmK4nx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QgLaatZX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgLaatZX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A36FC2BCB0;
	Tue, 12 May 2026 01:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778551006;
	bh=wqhu06DBSRwMRCvGCZNx54tpcBKb/bWdBVBbi2M7GM4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=QgLaatZXaPaNQnItnLfJmxKax0zAjnn827V6f1Ezs714Ktfhvdc+TlwlOOITAZs/Q
	 /QzbikyqGnG/E0Ww9ja7KMtaIakP6TTnQL/xo+nIOtbp0BOMwD/ykObExTomt89pqX
	 O/AxjgCmwFPSs8ibnfAcB4/yfrvIqG9KhqHcne3gyAgdl7sxLfvqgjoO88d8DFclpf
	 2TRHHzw0oqYfAf1Wdi2W/MOPEIwGQ1XEDkOnGaror5eUMk5Fnc5RicebN6mtkldg/l
	 ogSMkM6OIHXA4BZxaYIdXBTFs8mBPsrk4ObAf0V3CXa+20nURSXQ3cIx6LFHUFYeqU
	 AR/Am3DjTd9mw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq5210: add watchdog node
Reply-To: sashiko@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511-ipq5210_wdt-v1-1-870c4b7f77b6@oss.qualcomm.com>
References: <20260511-ipq5210_wdt-v1-1-870c4b7f77b6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 01:56:45 +0000
Message-Id: <20260512015646.3A36FC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The new compatible string `qcom,apss-wdt-ipq5210` is not documented=
 in the YAML device tree bindings.
--

commit b8d52e9b8c29f20f20c1b99e740ee76b20c2506c
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: add watchdog node

This commit adds the watchdog device node for the IPQ5210 SoC to the device
tree.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index 3761eb03ab246..2cdc10529c489 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
[ ... ]
> +		watchdog@b017000 {
> +			compatible =3D "qcom,apss-wdt-ipq5210", "qcom,kpss-wdt";

This isn't a bug, but is the "qcom,apss-wdt-ipq5210" compatible string
documented in the YAML bindings?=20

It doesn't appear to be added to the allowed enum list in
Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml.

Would this omission result in a warning when running make dtbs_check?

> +			reg =3D <0x0 0x0b017000 0x0 0x1000>;
> +			interrupts =3D <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>;
> +			clocks =3D <&sleep_clk>;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-ipq5210_wd=
t-v1-1-870c4b7f77b6@oss.qualcomm.com?part=3D1

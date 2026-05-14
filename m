Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BE53C1F4B
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 11:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758810; cv=none; b=p+0n8PSjjM7A2QKgZ1zJASDSJGIku7uTmbH8LEvrfapot7tucXVQZVPUe0VSjTETZvD/Uag41G9yHGpLpz2fWpmkfZM80dvz/rfw7r3u171Pi9qi5n0xRmNFRahzx+AFf6sTCG4cRqbi/OXSTlDQDzCDTPjRzynkvCfZeuEVMRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758810; c=relaxed/simple;
	bh=/hrtYZqwWGlrwIiMCldY6ma1xFklyx3a7furL3lo1sM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JEctazdtoAS+lhDk7hR6FBLZ2U84qBmv6cRFpMf26HM+q0cQ4zDWJuKpcZZNKvEkuFYwtOTsxYaEmPD68WEQtVcyGhYYYx5fl6huiKIYF2baMKXdzGUX4I2PtvCIOHypEatE9LxId8eN54BviikJKd6a7Krc4jzlTbsi7wT6pDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZF7dIVy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZF7dIVy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4977EC2BCC7;
	Thu, 14 May 2026 11:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778758810;
	bh=/hrtYZqwWGlrwIiMCldY6ma1xFklyx3a7furL3lo1sM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=HZF7dIVyiJjlhZJcqTcRfVB7FsAyrsNzdC9GAB1A5r62gDY3S8NzJQPCStl377uEQ
	 1hyhcbfPrlkWIi7Nplwe07aJX3wf2Yh3Ks34+Bx2+hOihbXdVy+BHp5jODyfzupjVm
	 gMSHITcjzJQuRgxkoEEFoY21bxHT4E8EZ9qTMQE6FwU0T0TFMbW+jtSn4yq/ZuTg96
	 AeKol0uJsFwkc6hfFPx6IEz/evSYG1b04hcvkrVHobFc9vTQ/77sGsSzcVUiOj9ZGX
	 WGMYxIV+Ozoc0bqjRtlKCshXCPsP9S97RsMrDPgnUL0h/ML52YvCj9Cx2hD9YmraZo
	 nwTh+5PyOejCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: eliza: Add support for MM
 clock controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260513-eliza_mm_cc_v2-v4-7-e61b5434e8d9@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v4-7-e61b5434e8d9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 11:40:08 +0000
Message-Id: <20260514114009.4977EC2BCC7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `#power-domain-cells =3D <1>;` property in the `camcc` dev=
ice node.
--

commit cf4de2d4ed70ac27e6c99ee7bcb3cb5ce7c09353
Author: Taniya Das <taniya.das@oss.qualcomm.com>

arm64: dts: qcom: eliza: Add support for MM clock controllers

This commit adds device tree nodes for the multimedia clock controllers
(cambistmclkcc, camcc, videocc, gpucc) on the Qualcomm Eliza SoC.

> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qc=
om/eliza.dtsi
> index 4a7a0ac40ce62..1a47eb2a86571 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi

[ ... ]

> +		camcc: clock-controller@ade0000 {
> +			compatible =3D "qcom,eliza-camcc";
> +			reg =3D <0x0 0x0ade0000 0x0 0x20000>;
> +
> +			clocks =3D <&bi_tcxo_div2>,
> +				 <&sleep_clk>,
> +				 <&gcc GCC_CAMERA_AHB_CLK>;
> +
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +		};

Should this node also include a #power-domain-cells property?

The qcom,eliza-camcc driver registers Global Distributed Sync Controllers
(GDSCs) which act as power domains for downstream camera IP blocks.

Without the #power-domain-cells =3D <1>; property, downstream consumer nodes
might be unable to parse their power-domains phandles, which could leave the
camera hardware unpowered and lead to probe or runtime-pm failures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-eliza_mm_c=
c_v2-v4-0-e61b5434e8d9@oss.qualcomm.com?part=3D7

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C5925393E
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 11:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778757512; cv=none; b=Id/1PomnyaML8La6CCvyDycNFYLo4KhzssSgaGCYY1Tw50D/KZBA6PrRRufQora0uJUxwSoSSww0+cKuJCRw7AC8ZjAcO4SJ41ThkhTkRoSbs89hFBHJtpfSiFJeES/OoA+DfTT1PScaqaIJQCTmc/ka9N3MgarVw8ebeGo4LXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778757512; c=relaxed/simple;
	bh=CtW5/wG1IXdN5SSV/mXwhPIo1yCDV4Kf3WX23Cz/TF4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jOkaHiI5BZAkXUY6LdhQzgRTKvqzDvs5Wt4Bz2C9XTxnWnan4z0a4vpVzvzbEzQLKjlGcRSvnPUkvzQWmbnFyz61r4v+EJdamCT19YZDzZZ3KhdDgYy9y//KvwqMf/VxHktShxyoP0cdergdZ9IBeNE0KobUJN7O/uS6qN36fdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tFBunFtf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tFBunFtf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B79C2BCB3;
	Thu, 14 May 2026 11:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778757511;
	bh=CtW5/wG1IXdN5SSV/mXwhPIo1yCDV4Kf3WX23Cz/TF4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=tFBunFtf9oFttLCGxHBkJ4jne4sG6iLWk8FSs8p/Lbw2vdWfaVX86IEVxoewuC1WZ
	 F3f0/zM6gKMW25T18THWxUNnG/Ksb6LyPksLDaJBI546K34AG35nPCcKmGopXIn4H1
	 JO1g0YSlhDRl/p/7aWtqP/Uql9sWljpVR2AhuuUGdmKxuFHEvWCVz9YVSaiueZr0JM
	 8eiUebQyTD7gPIncMxVFa1JrLxccZ1cZlSrcW85Xyp4kbKHpB2kHxruznR+jgrGH1Z
	 e6MWAmRujg+ej/ojYdxFAhNqPqEnck9QXCB9adErCWjTpL8wmscUB5wPsW+4O6PdfO
	 azEalovGHYdMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: eliza: Add support for MM
 clock controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513-eliza_mm_cc_v2-v3-7-b59c370dc281@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v3-7-b59c370dc281@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 11:18:30 +0000
Message-Id: <20260514111831.19B79C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] The `camcc` and `videocc` nodes are missing their parent `powe=
r-domains` property (e.g., MMCX).
- [High] The `camcc` and `cambistmclkcc` nodes specify their `clocks` in th=
e wrong order, causing a mismatch with the driver indices.
- [High] The `camcc` node is missing the `#power-domain-cells =3D <1>;` pro=
perty.
--

commit d3feefa342664dd9a93d942a18197fa1fdbbcd37
Author: Taniya Das <taniya.das@oss.qualcomm.com>

arm64: dts: qcom: eliza: Add support for MM clock controllers

This commit adds the device tree nodes for the multimedia clock
controllers (cambistmclkcc, camcc, videocc, and gpucc) on the Qualcomm
Eliza SoC.

> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qc=
om/eliza.dtsi
> index 4a7a0ac40ce62..07c871c1d4b0b 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi

[ ... ]

> @@ -709,6 +713,18 @@ aggre2_noc: interconnect@1700000 {
>  			#interconnect-cells =3D <2>;
>  		};
> =20
> +		cambistmclkcc: clock-controller@1760000 {
> +			compatible =3D "qcom,eliza-cambistmclkcc";
> +			reg =3D <0x0 0x01760000 0x0 0x6000>;
> +
> +			clocks =3D <&bi_tcxo_div2>,
> +				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
> +				 <&sleep_clk>;

Are the AHB and sleep clocks specified in the correct order?

The clock drivers for these controllers typically resolve clocks using
specific index values, where the sleep clock is at index 1 and the AHB
clock is at index 2. Providing the AHB clock at index 1 and the sleep
clock at index 2 could cause the driver to use the AHB clock as the sleep
clock source and vice versa, leading to incorrect clock configurations.

> +
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +		};

[ ... ]

> @@ -883,6 +916,32 @@ lpass_lpicx_noc: interconnect@7420000 {
>  			#interconnect-cells =3D <2>;
>  		};
> =20
> +		videocc: clock-controller@aaf0000 {
> +			compatible =3D "qcom,eliza-videocc";
> +			reg =3D <0x0 0xaaf0000 0x0 0x10000>;
> +
> +			clocks =3D <&bi_tcxo_div2>,
> +				 <&bi_tcxo_ao_div2>,
> +				 <&sleep_clk>,
> +				 <&gcc GCC_VIDEO_AHB_CLK>;

Is this node missing its parent power-domains property?

Multimedia clock controllers such as videocc typically reside within
hardware power domains (such as MMCX) which must be enabled before their
registers can be accessed. If the driver is probed without the parent power
domain enabled, accessing unpowered hardware registers can result in a
synchronous external abort and crash the system.

> +
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +			#power-domain-cells =3D <1>;
> +		};
> +
> +		camcc: clock-controller@ade0000 {
> +			compatible =3D "qcom,eliza-camcc";
> +			reg =3D <0x0 0x0ade0000 0x0 0x20000>;
> +
> +			clocks =3D <&bi_tcxo_div2>,
> +				 <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&sleep_clk>;

Similarly to cambistmclkcc, is the order of the AHB and sleep clocks
reversed here?

Also, is this node missing a power-domains property?

Like videocc, accessing this controller without its parent power domain
enabled could cause an external abort.

> +
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;

Does this node also need to be declared as a power domain provider?

The camera clock controller driver typically exports global distributed
sync controllers which serve as power domains for the rest of the camera
subsystem.

Without the #power-domain-cells =3D <1> property, dependent camera device
nodes may fail to parse their power-domains phandles, preventing the
camera subsystem from powering up and initializing.

> +		};
> +
> +		pdc: interrupt-controller@b220000 {
> +			compatible =3D "qcom,eliza-pdc", "qcom,pdc";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-eliza_mm_c=
c_v2-v3-0-b59c370dc281@oss.qualcomm.com?part=3D7

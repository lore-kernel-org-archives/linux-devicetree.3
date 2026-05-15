Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ECA3A5445
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846935; cv=none; b=lt/mvgsJBHhiG2hpIPU676A4DKbQiaO9+dNy2L5MNW4OAtLv9u1DT/A9blePZj5ZdwhYicj9o/SI5xMb0x/ZNuDg5ZMWa4n/4nNxAvXSgYluYE575harnvvYZWTXEqWN1pBNamL3Olbc0dOGBolq+D+nze4Xj6BtuF9AyvBtpUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846935; c=relaxed/simple;
	bh=h3qK8YaaOi6nfnmWenZBn3QIEQXfUOyX9ZT0SU3EIo4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XWL0BRI2g+mUh5IjmRR2XLRskxXrjfuP4aF/KksQKcZlWvsP1jkIu0EnUJ5SNlhz0dIeRt0Bu6N2t13izwHKvCXbjgn92f77Wx8lB6FGAj49dwKqxsOS1qnWMVji4zA9xZn7yKrvWOsqp9qEC03MAMX6Gbttm6HBktjiL4fLseA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F26LeNFq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F26LeNFq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FBAC2BCB0;
	Fri, 15 May 2026 12:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778846935;
	bh=h3qK8YaaOi6nfnmWenZBn3QIEQXfUOyX9ZT0SU3EIo4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=F26LeNFq/dqtaJt4HKVT1JpYpePwFeUj3TMa9yasCXLYJOsf2/tAyJ9svlaTmWCg3
	 3B82mxALNhvRzkYX8e4Sf81ffA2jiV9ny8hpTicmSECmaFMWDgDLVtDUr4EbYEgmit
	 GTnrCe/DSYLN22P8OiPKEjK60ZmdOWb/+fwmRQgIAfBpaHnCKK3TVwgzgPQeFz2mF8
	 /aEsqvw6IBnQFcUdP9NTfgbmycXHIHytKUgkw1icx/l4HPIf9spnW7kCnQUgiKNNDk
	 pTIjObbk6OasCXVGrAmPJHVga3dbJMBBFRzN0gpFmIDrM7SAsSYTVBETKfdSoK4wVO
	 zSV2El9S1LJKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/6] arm64: dts: qcom: sm8350: add Iris device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515-iris-sc8280xp-v7-5-2e21f6db1897@oss.qualcomm.com>
References: <20260515-iris-sc8280xp-v7-5-2e21f6db1897@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 12:08:54 +0000
Message-Id: <20260515120854.C2FBAC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The fallback driver `qcom,sm8250-venus` lacks support for the `mmc=
x` power domain, causing silent dynamic voltage scaling failures and hardwa=
re instability.
- [Medium] The `video-codec@aa00000` node violates the `qcom,sm8250-venus` =
DT schema constraints by defining 4 power domains.
--

commit 2b4298f622bad3f707d0f7effff3c5046a527949
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
arm64: dts: qcom: sm8350: add Iris device

This commit adds Iris and video clock controller devices, describing the
Iris2 core present on this platform.

> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/q=
com/sm8350.dtsi
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
[ ... ]
> @@ -2745,6 +2747,85 @@ usb_2_dwc3: usb@a800000 {
[ ... ]
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

The qcom,sm8250-venus schema restricts power-domains to maxItems: 3 and
power-domain-names to venus, vcodec0, and mx. Since this node uses the
qcom,sm8250-venus fallback compatible string and defines 4 power domains
including mmcx, will this cause make dtbs_check to fail with validation
errors?

> +
> +			resets =3D <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
> +			reset-names =3D "bus", "core";
> +
> +			interconnects =3D <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names =3D "cpu-cfg",
> +					     "video-mem";
> +
> +			operating-points-v2 =3D <&iris_opp_table>;
> +			iommus =3D <&apps_smmu 0x2100 0x400>;
> +			memory-region =3D <&pil_video_mem>;
> +
> +			status =3D "disabled";
> +
> +			iris_opp_table: opp-table {
> +				compatible =3D "operating-points-v2";
> +
> +				opp-240000000 {
> +					opp-hz =3D /bits/ 64 <240000000>;
> +					required-opps =3D <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-338000000 {
> +					opp-hz =3D /bits/ 64 <338000000>;
> +					required-opps =3D <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-366000000 {
> +					opp-hz =3D /bits/ 64 <366000000>;
> +					required-opps =3D <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz =3D /bits/ 64 <444000000>;
> +					required-opps =3D <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_nom>;
> +				};

The iris_opp_table specifies two required-opps for each frequency point to
dynamically scale both the mx and mmcx power domains. However, because a
specific qcom,sm8350-iris driver is not implemented, the kernel will bind
this device to the fallback qcom,sm8250-venus driver.

The qcom,sm8250-venus platform driver data explicitly requests and attaches
only the mx OPP domain, entirely omitting mmcx. During dynamic voltage
scaling, the OPP framework will silently skip casting the second required-o=
pp
vote because the mmcx index in required_devs is NULL.

Will this cause the MMCX voltage to statically remain at its baseline low_s=
vs
while the Iris core runs at high frequencies like 444MHz, potentially leadi=
ng
to hardware hangs or system crashes?

> +			};
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-iris-sc828=
0xp-v7-0-2e21f6db1897@oss.qualcomm.com?part=3D5

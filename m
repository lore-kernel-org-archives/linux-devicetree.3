Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426105;
	b=x9h54HazsFDpRqYVucGMsAFpwX9xDwqfk1RuWKvnMxIUqDzOmtKdIunD8YbcjhClR2g9
	 5vo/O3DVCv6fV3AqpAoDnNQduoqZDQaI9cP8Gv5/7+07SLJi+v49le55/uQgB6BUMRal4
	 DnF8e7XRWC0SVRufNnwmFE8NHP5ugKHOC3HE9SwAeS0X4wOuR7g1WS4ABgDJAphyTRkg7
	 6WJfB01PI4ztPdnUVbojB7jwpljHeOHPiX5w9cgy+APVHUCXRZoznX5G/I1Ybe6tTw9w5
	 Kk15zORQzEMXUPI53Jmfm1s/VhV1AspXQzAZFjCPLroXfmQ/5JVdv73iVFX4qilLDig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426105;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Lqld6kTomJJKX+k3lf5HdbhGKKvEcRDh5AI4BzcX3CU=;
	b=JArpsdc7xdMbg42WK/CNBYIePj13i3L1Zbi1yIA9YJyM+JkPkj6xFxx95eLCtMBQ7+qn
	 TgvZPpHNwlDsBDAF7UW+kPvF2frfsOVBp7iy9S6vWwBTIbPuwbJMcgH0iYX3HhDhO5vvy
	 tWboEbf/jETvwSyj0xZ0EjzmJ3lLlD1BgVdekzHx2FCYxvBdpHlcp7TQ/jjujIsP9Mxlq
	 10lTWWbA4JXz4jbPRJ9gxM6OgmShgM0xHnVVubYkrqegmLB1r/8MsABJMhqQDzUk5rCZm
	 027FW15YY6+YU7Ba8esddU6Y27qwGz+NMXaQU70zpIoEDsuC0MkdFb8Wjtp/V2jkDsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=frwTbpLu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE86606A31A
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=frwTbpLu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995131F000C4;
	Mon, 19 Oct 2026 16:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792426104;
	bh=Lqld6kTomJJKX+k3lf5HdbhGKKvEcRDh5AI4BzcX3CU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=frwTbpLuxGNNnjSJd1VCz5Ga/AUpNMEdj4iT0TWOTmO9KErEHWt3te9whJoOLtJ95
	 1jLYrdNZkvW/EGKc2xL/7o9Dq1Kj+XwqcSCWgCgfiOKioLzON9aQdxbBS5uSerdEhe
	 qJeiMzKauxPGnGvcOKszPMJHUB9Kuyt4rQUi8yZ1SJ6H3R0m8qxl6h+3EvuW4hes2X
	 3CHoE/fba+S/toAm5QUICqmBUCpARINdpJP7NSGdU+94SJj6uNoSxX5cgy4SPpKpVe
	 11ms9gI3NDzFRjo5xEvigNTwCMTpNED+dI4OviWuDbw8i4JEaH1AwOJgTVw94xZmIw
	 bFlk25bWpIjYQ==
Message-ID: <sashiko-outbox-177810@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/8] arm64: dts: qcom: msm8998: wire up interconnect
 paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019-msm8998-icc-v1-8-c2da3934b6c8@oss.qualcomm.com>
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
 <20261019-msm8998-icc-v1-8-c2da3934b6c8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 16:08:24 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: msm8998: sdhc2 interconnect unvoted without OPP =
table
- [Medium] arm64: dts: qcom: msm8998: gpu gfx-mem path unvoted without opp-=
peak-kBps
--

commit dd572379ba20bf853f70a81ced03581edf3082ef
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

arm64: dts: qcom: msm8998: wire up interconnect paths

This commit adds interconnect paths to the GPU, MDSS, Venus, UFS, USB, and
SDHC2 nodes in msm8998.dtsi so that consumer drivers can vote for NoC and D=
DR
bandwidth.

> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/=
qcom/msm8998.dtsi
> index bb004e0b74ef2..939601322cfb2 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi

[ ... ]

> @@ -1622,6 +1629,10 @@ adreno_gpu: gpu@5000000 {
>  				"rbcpr",
>  				"core";
> =20
> +			interconnects =3D <&bimc MASTER_OXILI QCOM_ICC_TAG_ALWAYS
> +					 &bimc SLAVE_EBI QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names =3D "gfx-mem";
> +
>  			interrupts =3D <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>  			iommus =3D <&adreno_smmu 0>;
>  			operating-points-v2 =3D <&gpu_opp_table>;

[Severity: Medium]
Will the gfx-mem interconnect path actually be acquired and voted on without
opp-peak-kBps entries in gpu_opp_table?

For Adreno A5xx (qcom,adreno-540.1), the driver does not call devm_of_icc_g=
et()
directly. Instead, adreno_bind() in drivers/gpu/drm/msm/adreno/adreno_devic=
e.c
uses the OPP core:

	ret =3D dev_pm_opp_of_find_icc_paths(dev, NULL);
	if (ret)
		return ret;

In drivers/opp/of.c, dev_pm_opp_of_find_icc_paths() calls
_bandwidth_supported(), which checks the first child node of gpu_opp_table =
for
opp-peak-kBps:

	prop =3D of_find_property(np, "opp-peak-kBps", NULL);
	if (!prop || !prop->length)
		return 0;

Because the OPP nodes in gpu_opp_table in arch/arm64/boot/dts/qcom/msm8998.=
dtsi
do not define opp-peak-kBps, _bandwidth_supported() returns 0 and
dev_pm_opp_of_find_icc_paths() skips parsing the gfx-mem path. Should
gpu_opp_table also be populated with opp-peak-kBps values?

[ ... ]

> @@ -2355,6 +2372,12 @@ sdhc2: mmc@c0a4900 {
>  				     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names =3D "hc_irq", "pwr_irq";
> =20
> +			interconnects =3D <&a2noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
> +					 &bimc SLAVE_EBI QCOM_ICC_TAG_ALWAYS>,
> +					<&gnoc MASTER_APSS_PROC QCOM_ICC_TAG_ALWAYS
> +					 &cnoc SLAVE_SDCC_2 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names =3D "sdhc-ddr", "cpu-sdhc";
> +
>  			clock-names =3D "iface", "core", "xo";
>  			clocks =3D <&gcc GCC_SDCC2_AHB_CLK>,
>  				 <&gcc GCC_SDCC2_APPS_CLK>,

[Severity: High]
Can adding interconnects to sdhc2 without an operating-points-v2 table cause
the A2NoC bus clock and bandwidth votes to drop to zero after icc_sync_stat=
e()?

In drivers/mmc/host/sdhci-msm.c, sdhci_msm_probe() relies on the OPP core to
acquire interconnect paths rather than calling of_icc_get() directly:

	/* Check for optional interconnect paths */
	ret =3D dev_pm_opp_of_find_icc_paths(&pdev->dev, NULL);
	if (ret)
		goto bus_clk_disable;

	ret =3D devm_pm_opp_set_clkname(&pdev->dev, "core");
	if (ret)
		goto bus_clk_disable;

	/* OPP table is optional */
	ret =3D devm_pm_opp_of_add_table(&pdev->dev);

In drivers/opp/of.c, dev_pm_opp_of_find_icc_paths() calls
_bandwidth_supported(), which returns 0 when operating-points-v2 is absent =
or
lacks opp-peak-kBps:

	/* Lets not fail in case we are parsing opp-v1 bindings */
	if (!opp_np)
		return 0;

As a result, sdhc-ddr and cpu-sdhc are never acquired or voted on. Because
sdhc2 is the only consumer referencing &a2noc in msm8998.dtsi (and
msm8998_a2noc sets keep_alive =3D false), once sdhc2 finishes probing,
icc_sync_state() runs on a2noc, clears the initial INT_MAX boot floor on
mas_sdcc_2 and slv_a2noc_snoc, and drops the A2NoC RPM bandwidth votes and
aggre2_clk to 0 even while sdhc2 is active.

Should sdhc2 include an operating-points-v2 table with opp-peak-kBps entrie=
s?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-msm8998-ic=
c-v1-0-c2da3934b6c8@oss.qualcomm.com?part=3D8

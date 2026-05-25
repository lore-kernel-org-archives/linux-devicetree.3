Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACFF305676
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779710391; cv=none; b=X/SDU8QusKiymNrVPxRFyJLV1qbrj5ZioF4ped5FBjlMqLwppidGTItSXou6Dd94zQmEkrXlSOBSrRccikr65RBQkcFn/LfhhM7/v4M08aaUNuA1DWgMcBFJDblMZZru1IOKC87O3G+9A85mvtLnUSjRlHhcR5UHL8KN4iMLtrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779710391; c=relaxed/simple;
	bh=lf1FODyXIpSOdR+Qrm3h8HrB/tg/rDpoB6/udtWzrOA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pVQrp6fgNWmSO7cBjuozyW1k+9fo92+pPDTJ4xKWwSEFM66JW+Pnfq232cHPoBLn5kH+23xLK2O77mXiQ0nUnGQi6AAHQyqwA72RuQQguzt6/pHm8b2L3TdDVGn0oAI+6v4nC116QlYweqpc7vAmSTGEHHpoOG1ZktvZs1AxMTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kzj34Buz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kzj34Buz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381FE1F000E9;
	Mon, 25 May 2026 11:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779710390;
	bh=cmirufJNEPBz9kvtsD8Dg+fAc/n5iEBdLhcx35/BqFA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kzj34BuzDn9gvfJEOwBu5CzQoMHMysl6hTjRBQsor8Lll5K+Rjcim35HqmZz0UjX9
	 tG0CXHubnNvllQaHIxexTZ9Y7p/AnrCJBsV+lDrasEhI1m7Rleq1zIaQCj6nelPfjR
	 iHKQeiYrTlxF646Kx/aZTxNzBKj0Bb4OL4iRFTweovdjVIPGze/GzAbYOod/FG8Lqe
	 P86bu8vqkvQkFYinMve7CirDElV+CsNfAiSggIibhoOBfJDGI/+qqVphmybIYopbQf
	 64geQw9IFsPPZUgYGD+es8nRzVS0Cj3CmnC8Ukvh3dIIOHG30o07BX4h35FOpQJ9N1
	 WTJ13/SMDHo8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/7] clk: qcom: videocc: Add video clock controller
 driver for Eliza
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-4-a1d125619a5a@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-4-a1d125619a5a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 11:59:49 +0000
Message-Id: <20260525115950.381FE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `video_cc_eliza_desc` structure omits the `.use_rpm =3D true` =
flag (or explicit PM runtime enablement), leading to unpowered register acc=
ess during probe.
- [Low] CLK_ELIZA_VIDEOCC sets 'default m if ARCH_QCOM', which is inconsist=
ent with Kconfig conventions for Eliza clock controllers.
- [Low] CLK_ELIZA_VIDEOCC implements GDSCs but lacks an explicit 'select QC=
OM_GDSC' dependency.
--

commit 7f851311a4cc00578bd0ab62871977440dcab6e4
Author: Taniya Das <taniya.das@oss.qualcomm.com>

clk: qcom: videocc: Add video clock controller driver for Eliza

Add support for the video clock controller for video clients to be able
to request for videocc clocks on Eliza platform.

> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
[ ... ]
> @@ -45,6 +45,16 @@ config CLK_ELIZA_TCSRCC
>  	  Support for the TCSR clock controller on Eliza devices.
>  	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
> =20
> +config CLK_ELIZA_VIDEOCC
> +	tristate "Eliza Video Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_ELIZA_GCC

[Severity: Low]
Since this driver implements GDSCs (video_cc_mvs0_gdsc and
video_cc_mvs0c_gdsc), shouldn't it explicitly select QCOM_GDSC here?

While it may compile by transitively inheriting the dependency from
CLK_ELIZA_GCC, could this cause Kconfig unmet dependency warnings if the
GCC configuration changes in the future?

> +	default m if ARCH_QCOM

[Severity: Low]
Is this default configuration intentional?

This deviates from Kconfig conventions for the rest of the Eliza clock
controllers (like CLK_ELIZA_DISPCC, CLK_ELIZA_GCC, and CLK_ELIZA_TCSRCC)
which do not set default values and instead rely on defconfig for enablemen=
t.

> +	help
> +	  Support for the video clock controller on Eliza devices.
> +	  Say Y if you want to support video devices and functionality such as
> +	  video encode and decode.
> +
[ ... ]
> diff --git a/drivers/clk/qcom/videocc-eliza.c b/drivers/clk/qcom/videocc-=
eliza.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/clk/qcom/videocc-eliza.c
[ ... ]
> +static const struct qcom_cc_desc video_cc_eliza_desc =3D {
> +	.config =3D &video_cc_eliza_regmap_config,
> +	.clks =3D video_cc_eliza_clocks,
> +	.num_clks =3D ARRAY_SIZE(video_cc_eliza_clocks),
> +	.resets =3D video_cc_eliza_resets,
> +	.num_resets =3D ARRAY_SIZE(video_cc_eliza_resets),
> +	.gdscs =3D video_cc_eliza_gdscs,
> +	.num_gdscs =3D ARRAY_SIZE(video_cc_eliza_gdscs),
> +	.driver_data =3D &video_cc_eliza_driver_data,

[Severity: High]
Will omitting the .use_rpm flag (or explicit PM runtime enablement) cause a
synchronous external abort and hang the system during boot?

Multimedia clock controllers usually require their hardware power domains
(such as MMCX) to be enabled via PM runtime before their registers can be r=
ead
or written.

Without .use_rpm =3D true, qcom_cc_really_probe() skips calling
devm_pm_runtime_enable() and pm_runtime_resume_and_get(), which would cause
the subsequent initialization of PLLs and CBCRs to attempt register access =
on
unpowered hardware.

> +};
> +
> +static const struct of_device_id video_cc_eliza_match_table[] =3D {
> +	{ .compatible =3D "qcom,eliza-videocc" },
> +	{ }
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-eliza_mm_c=
c_v2-v5-0-a1d125619a5a@oss.qualcomm.com?part=3D4

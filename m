Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7403B440F
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 11:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782904925; cv=none; b=uWz0XZifCEqzx+9xJZRzOeJegpyP+6kkSmLwkVlHlm++ATGuzdrigFRKM9tsdQp4V1+ci4acQzwZH4q2eK/HOMc/Pn7XGXzd8kz4N1jwbYS2CqqkxlwpNbcUfiq07zdWdWR/fJaiBb43etiYd5QEJdW3eXa/5Cag3NOVbv+ZYCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782904925; c=relaxed/simple;
	bh=FnQSiboyFhP9bwvbNYbKA+t7x7AsEwOc+1U5/6QQKpw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rIWjM4N8Fkq1p93Y9qgCI21JVlmzREoITQEp47xo+GiBaLdcHAIjqwAwBwsz/Yvh3oDaYB2EGrPBIDImLOoYw3vZOqCtmtt61Alj4KS0pGIMVfDGoqq7y3mnhKAv+abphhd+hGt121o3IULwf0x404l5+VBN03LBOBFKqfObrmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NM9dJxin; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NM9dJxin"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64BD1F000E9;
	Wed,  1 Jul 2026 11:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782904924;
	bh=lJ6Ki1SedjvoWMpL6p3aATp2M8whvc90X4I6ejuhrL0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NM9dJxinzh4Xg725o7nC2D5oe6NacmhB/iuiFSZyln3bL7Eu7nbu4oNXmebqQC2hU
	 2e8qx53MZR1+qIk37nLJ5TinDEK9/jDOi0h/77boOGUepE53qF08GpSQAPre6Xihrh
	 GkgSOit4B0hLQvPSiG2tjJ42KoIneZgvyHmUbDGYnAYq5OKrAAFffljR9zvi73CPfm
	 NpNh7cYqJ9Zujy5MhRnCNwlyQUGHsgSZp2lhb1Xrv7NRpmmIiGqP11qcI2YvBBWXQE
	 wI0J14Sps/QT35NDSTJ4Yk2hudESPrZG8rBZ9WZpKzdX4+Ha45oWroTNz0bAEd0UMe
	 SapRdoTlqGuVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/11] ASoC: qcom: Add Shikra QAIF support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701105757.2779738-11-harendra.gautam@oss.qualcomm.com>
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-11-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 11:22:03 +0000
Message-Id: <20260701112203.C64BD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing DAI descriptors for CDC DMA TX (capture), RX2-3, and VA_TX=
2-3 channels render hardware paths completely inaccessible.
- [Low] Monolithic module linking prevents addition of future SoC variants =
without build errors.
--

commit 8fb121461863147da2f4ca2b57d93d08f040ef59
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Subject: ASoC: qcom: Add Shikra QAIF support

This commit adds the Shikra variant data for the Qualcomm Audio Interface
driver. It introduces register field definitions, DMA mappings, DAI descrip=
tors,
and clock configuration. The new variant is hooked up to Kconfig and the qc=
om
ASoC Makefile.

> diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
> index 985ce2ae286ba..857bb2a032a2d 100644
> --- a/sound/soc/qcom/Makefile
> +++ b/sound/soc/qcom/Makefile
> @@ -31,6 +31,7 @@ snd-soc-qcom-common-y :=3D common.o
>  snd-soc-qcom-sdw-y :=3D sdw.o
>  snd-soc-x1e80100-y :=3D x1e80100.o
>  snd-soc-qcom-offload-utils-objs :=3D usb_offload_utils.o
> +snd-soc-qcom-qaif-y :=3D qaif-cpu.o qaif-platform.o qaif-shikra.o

[ ... ]

> diff --git a/sound/soc/qcom/qaif-shikra.c b/sound/soc/qcom/qaif-shikra.c
> new file mode 100644
> index 0000000000000..6bf32d155f3a1
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-shikra.c
> @@ -0,0 +1,556 @@

[ ... ]

> +static const struct qaif_dmaidx_dai_map shikra_cif_tx_dma_dai_map[] =3D {
> +		{ QAIF_CDC_DMA_TX0 },
> +		{ QAIF_CDC_DMA_TX1 },
> +		{ QAIF_CDC_DMA_TX2 },
> +		{ QAIF_CDC_DMA_TX3 }
> +};
> +
> +static const struct qaif_dmaidx_dai_map shikra_cif_va_dma_dai_map[] =3D {
> +		{ QAIF_CDC_DMA_VA_TX0 },
> +		{ QAIF_CDC_DMA_VA_TX1 },
> +		{ QAIF_CDC_DMA_VA_TX2 },
> +		{ QAIF_CDC_DMA_VA_TX3 }
> +};

[ ... ]

> +static struct snd_soc_dai_driver shikra_qaif_cpu_dai_driver[] =3D {
> +	{
> +		.id =3D QAIF_MI2S_TDM_AIF0,

[ ... ]

> +	}, {
> +		.id =3D QAIF_CDC_DMA_VA_TX1,
> +		.name =3D "CDC DMA VA1",
> +		.capture =3D {
> +			.stream_name =3D "DMIC Capture1",
> +			.formats =3D SNDRV_PCM_FMTBIT_S16,
> +			.rates =3D SNDRV_PCM_RATE_48000,
> +			.rate_min	=3D 48000,
> +			.rate_max	=3D 48000,
> +			.channels_min	=3D 1,
> +			.channels_max	=3D 4,
> +		},
> +		.ops	=3D &asoc_qcom_qaif_cif_dai_ops,
> +	},
> +};

[Severity: High]
The DMA mapping (shikra_cif_tx_dma_dai_map) specifies all 4 QAIF_CDC_DMA_TX
channels, but the shikra_qaif_cpu_dai_driver array seems to omit the WCD
capture (QAIF_CDC_DMA_TX) DAIs entirely. It also only provides 2 out of 4 f=
or
the RX and VA_TX DAIs.

Will this cause sound card registration to fail when a machine driver
attempts to instantiate a PCM capture stream routing through
QAIF_CDC_DMA_TX0 (or TX1-3)?

[ ... ]

> +static struct platform_driver shikra_qaif_cpu_platform_driver =3D {
> +	.driver =3D {
> +		.name =3D "shikra-qaif-cpu",
> +		.of_match_table =3D shikra_qaif_cpu_device_id,
> +		.pm =3D &shikra_qaif_pm_ops,
> +	},
> +	.probe =3D asoc_qcom_qaif_cpu_platform_probe,
> +	.remove =3D asoc_qcom_qaif_cpu_platform_remove,
> +	.shutdown =3D asoc_qcom_qaif_cpu_platform_shutdown,
> +};
> +module_platform_driver(shikra_qaif_cpu_platform_driver);

[Severity: Low]
Because qaif-cpu.o, qaif-platform.o, and qaif-shikra.o are linked into a
single snd-soc-qcom-qaif.ko module, does using module_platform_driver()
here inadvertently claim the entire module's init/exit entry points?

Could this lead to build failures due to multiple init_module definitions
if a future SoC variant is added to snd-soc-qcom-qaif-y and also attempts
to register a platform driver?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701105757.2779=
738-1-harendra.gautam@oss.qualcomm.com?part=3D10

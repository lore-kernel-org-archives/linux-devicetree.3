Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED322E0914
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 10:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071273; cv=none; b=oIVbWGQvz/92IryBlbotIPTaa6HFRM1ubpDrPFlb+HA9Ki+a5MC3160Jifd1atTPo1DpPRxPR/2NDRMRM77oZD6WmWCL/27LQ/z4qJtL2t0B0DkJL3Q7RYokQ2bYtEwPfio0+GtDV2TGPwKKkiNwzmnBRzR1tV1qLsZ3szXXkJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071273; c=relaxed/simple;
	bh=xkEreBk+BsGaoNQ0nbE4Df/eysbYrrT/HSyjkLUCi6A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qjeWVLwm/U+64sEjcMN8sQAmv11DGuxa3Ow+8vPv53mcNCvZVbhw+6uZnco6PLWgYOXtysAPiepscaYWpX5zIEhfV7rty8cxUA4TmjdJDn+yfppCFIcf1nKwwAo5PrJFrJSQ+Mj3O2Za6VosxRnGIN/rktb+EBl+aWQsiVIWud0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=izQZxjtR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="izQZxjtR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC651F000FF;
	Tue, 22 Sep 2026 10:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790071271;
	bh=bb3SGXAyjNsJFZ2NADqap21DxuAm+ctcjnsF6i4vs/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=izQZxjtRH37BpfgFT7cuDBiuP1YnVtepoN43M8oEr3tBMZv+XEGNO5ia05IcPPCMU
	 WzPewuh7VBYov3YReSf5YKMhgCgaEyH4l3ZW0aluWDm9YO5dP3CFoiu0mMlqNcLOtg
	 CXsub9w0O9qIMD8gqBXqf4UtlRIVNJnmCpJ8J+TNvVPDBvHBD/DzAg2fmXvrqDKlD1
	 aNIeZX+HbYW1Cy6OyMiaXMb6j+raMnqZycdl5G2v70GDK4xfeafnC4Ir3IF7ZpzL23
	 F+4rP3cco+wQ4g2Ssz3GjkMT7P/JEZsc2lxsz/OKVAWuhqVwblwZRTehmlwzjjfcPw
	 6tjLyWsl8/6hg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/8] ASoC: qcom: lpass-tx-macro: Add support for
 Bolero v4.0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260922-add_shikra_support-v1-7-6c6cb6444caf@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-7-6c6cb6444caf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 10:01:11 +0000
Message-Id: <20260922100111.7EC651F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ASoC: duplicate DAPM widget name causes probe failure
--

commit 954c8b1254dcb620c8fedc6341da23b5e08794fc
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

ASoC: qcom: lpass-tx-macro: Add support for Bolero v4.0

Hawi integrates the Bolero v4.0 TX macro, which extends the v9.x TX
macro with a port-select stage in the SWR microphone input path and an
adaptive filter (ADPT) block.

> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-t=
x-macro.c
> index 6deaaabe43afa..b1eee16e968cb 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c

[ ... ]

> +static const struct snd_soc_dapm_widget tx_macro_dapm_widgets_v15[] =3D {
> +	SND_SOC_DAPM_MUX("TX DEC0 MUX", SND_SOC_NOPM, 0, 0, &tx_dec0_mux_v9_3),
> +	SND_SOC_DAPM_MUX("TX DEC1 MUX", SND_SOC_NOPM, 0, 0, &tx_dec1_mux_v9_3),
> +	SND_SOC_DAPM_MUX("TX DEC2 MUX", SND_SOC_NOPM, 0, 0, &tx_dec2_mux_v9_3),
> +	SND_SOC_DAPM_MUX("TX DEC3 MUX", SND_SOC_NOPM, 0, 0, &tx_dec3_mux_v9_3),
> +	SND_SOC_DAPM_MUX("TX DEC4 MUX", SND_SOC_NOPM, 0, 0, &tx_dec4_mux_v9_3),
> +	SND_SOC_DAPM_MUX("TX DEC5 MUX", SND_SOC_NOPM, 0, 0, &tx_dec5_mux_v9_3),
> +	SND_SOC_DAPM_MUX("TX DEC6 MUX", SND_SOC_NOPM, 0, 0, &tx_dec6_mux_v9_3),
> +	SND_SOC_DAPM_MUX("TX DEC7 MUX", SND_SOC_NOPM, 0, 0, &tx_dec7_mux_v9_3),

[Severity: High]
Does this code inadvertently duplicate the "TX DEC0 MUX" through "TX DEC7 M=
UX"
widgets?

The base tx_macro_dapm_widgets array already defines these same widget names
unconditionally, using SND_SOC_DAPM_MUX_E:

	SND_SOC_DAPM_MUX_E("TX DEC0 MUX", SND_SOC_NOPM,
			   TX_MACRO_DEC0, 0,
			   &tx_dec0_mux, tx_macro_enable_dec,
			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),

When ASoC attempts to create kcontrols for these extra widgets defined in
tx_macro_dapm_widgets_v15, won't snd_ctl_add() encounter two controls with =
the
exact same name and return -EBUSY, causing the sound card probe to fail?

Also, by using SND_SOC_DAPM_MUX instead of SND_SOC_DAPM_MUX_E here, it drops
the tx_macro_enable_dec event callback and hardcodes wshift to 0 instead of
using TX_MACRO_DECn. Will this break decimator enabling even if the probe
succeeded?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922-add_shikra=
_support-v1-0-6c6cb6444caf@oss.qualcomm.com?part=3D7

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B464AD4AB
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 12:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784966; cv=none; b=gw9wC4U7dDltw9r7QDqjsSgNJC3nwA6jbvSPiTHUl74OE+SQ5GGrocWYwQKHrxKgJhMA42TzDuQIOkpef65+/t3Q6++I1OYnWYJPsnu+gplWt+xYMmIdKqY5DyuA300KJdu7CoYE1fTaiSNYGhKlqIGLNW9skROrzYtOTeDk1pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784966; c=relaxed/simple;
	bh=UYuChBEZPYD350CKhiIgQPOsymSbzW7r0yWq5Nj63cU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DJmr5HTbtHTtHvo4oJT0HgRXnY5nFkclpzg0zWudSJqXDFSj0TDR6mngxrV9d4sj6hMERyJ9i1+jesoWcFwA1I5Di3ahlh+hq1ygysx4jbInGdfI185UWSaWgRAxvHmhVbj5ofywLKkAvFMoL0ERAFMU9J/poKerjeci925FivE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzXFvIdz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzXFvIdz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04E11F00A3A;
	Mon,  7 Sep 2026 12:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788784960;
	bh=CztvgsdC/L1PHdYHpICUnCM528jfVLrOGaV6U5dZIVc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DzXFvIdzTCS/6gISTndWeuZ96kQjbgRwauDrGAtOmZ2Q5oXNOhablaZHpXOnRdXz1
	 TPsf4WGqGo+i8PHc7zXnNWnnczCCn0wsRA4VOPj0/PIdxBPmAFwWAdf/S9ub3nhS19
	 vhQqzggG8WudOB2LIirEzh605c9WpN7HpixUnNrrqLVt3lMCadjTURi5kSxwerRkKq
	 Tw81JBd4zvYxlEoNPhmjz9znkviUBKRaW7H0nf9s3q2A+tR9UBObk8lQNF+6MwNCei
	 mi4HP3z+BdzY9idqK9QrSsNYUL0ycYzERWnT/aADcd/Rr+9fQ6BS0PVYjx5dcOvB84
	 kK1apNXloRu7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/10] ASoC: qcom: Add Shikra QAIF support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260907-b4-qaif-shikra-audio-v5-9-6d8ad9ba5c9f@oss.qualcomm.com>
References: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com>
 <20260907-b4-qaif-shikra-audio-v5-9-6d8ad9ba5c9f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 12:42:39 +0000
Message-Id: <20260907124239.C04E11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Redundant devm_clk_get() calls for the same clock index leak dev=
res memory and keep unnecessary clock references.
--

commit 63cae5b8a9cf9b494a9486e0a0b07d1b244a6f6c
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add Shikra QAIF support

This commit adds the Shikra variant data for the Qualcomm Audio Interface
(QAIF) driver. It provides DMA-to-DAI mappings, clock names, DAI driver
data, and other parameters needed by the QAIF driver.

> diff --git a/sound/soc/qcom/qaif-shikra.c b/sound/soc/qcom/qaif-shikra.c
> new file mode 100644
> index 0000000000000..0d5c2baade28f
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-shikra.c

[ ... ]

> +static const struct qaif_variant shikra_qaif_data =3D {

[ ... ]

> +	.num_clks		=3D 3,
> +
> +	.dai_driver		=3D shikra_qaif_cpu_dai_driver,
> +	.num_dai		=3D ARRAY_SIZE(shikra_qaif_cpu_dai_driver),
> +
> +	.dai_bit_clk_names	=3D (const char * const []) {
> +					"aif_if0_ibit",
> +					"aif_if1_ibit",
> +					"aif_if2_ibit",
> +					"aif_if3_ibit",
> +				},

[Severity: Medium]
Will this configuration cause redundant devm_clk_get() calls and leak devres
memory?

Looking at asoc_qcom_qaif_cpu_platform_probe() in sound/soc/qcom/qaif-cpu.c=
, it
iterates over variant->num_dai and fetches the clock for each DAI's index:

	for (i =3D 0; i < variant->num_dai; i++) {
		...
		idx =3D variant->get_dma_idx(dai_id);
		if (idx < 0)
			continue;

		drvdata->mi2s_bit_clk[idx] =3D
			devm_clk_get(dev, variant->dai_bit_clk_names[idx]);
		...
	}

Since multiple DAIs in shikra_qaif_cpu_dai_driver (such as AIF_MI2S_RX_0 and
AIF_MI2S_TX_0) map to the same get_dma_idx() value, won't this overwrite the
same drvdata->mi2s_bit_clk[idx] pointer multiple times without checking if =
it
was already acquired?

Could this allocate redundant devres handles and keep unnecessary clock
references during probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-b4-qaif-sh=
ikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com?part=3D9

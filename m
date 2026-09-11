Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731D738CFE1
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 09:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789119546; cv=none; b=EYWbBRxEr0ztEjb1HcXR+GD5fiCgBnA2q2n0FEHauVCWnWelutXRNLHPoEZZglTd3aN1AZ940PUJq3EmFyUXl56JHYbxS4ATMGN2Ty8JzhGPdx+OqGGfSg88zGjehTtMDKYl76IfZ10IMLWzanDYvwuB4eldaq33m/F2CPDrg8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789119546; c=relaxed/simple;
	bh=nyMy6d14MeQHWXnNdEGJcDk/JqQ0YywWM4XmSmUh0f4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H/uf8c5iUmzvnl8P7HfCe4CxXAkhMNTwl9gGH9OEEeTBFSsdC0Osn1tyVAniw25q6gFLji4APKczcDI4av7RTbTiTuv9ww+7Oq6n1LmHaB1/JyMmMRdO3delpEMFMAYYfYZCR4/5kMPfMdoGrWwfIZ4/ZTVSFlxlKeA51aa6jqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PHqWBAqY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHqWBAqY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9241F000FF;
	Fri, 11 Sep 2026 09:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789119545;
	bh=kYBGOTN0XpICxtOw+jy4C7Ydxo3hDEtaJeG8pUcxtPM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PHqWBAqYeqjN4P6wYXbBn9ifCivlxosx6OdLS8kafmLJD5GDzRBQuxq4LFZN4t+I3
	 Jo7vMkfPyr862a9UNvB1ENEE5KMSMfTriU2ujokUHhuk+FbsYXsvBL8h0foCBHpcd7
	 KgypplYKEHUSjvmPORkkvEEQSdsPQecDXbjv+AwFFwtwI3lANkdW2FTsJ0SZmY+joV
	 5TnqTT17rVe6xVyKZIgg/3RO8evLPhCfMAAAMkE+fyCODMJBsbbwIZQgjj/vJOsotb
	 6WALqT2+cJmjKKOAuGXz51edT2BEvrcBksYk2rsSlwYDa+GlHw90L1zMmMgU6VDnTe
	 noVOrwyRq6cWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/10] ASoC: qcom: Add QAIF PCM operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260911-b4-qaif-shikra-audio-v6-7-e9addb358201@oss.qualcomm.com>
References: <20260911-b4-qaif-shikra-audio-v6-0-e9addb358201@oss.qualcomm.com>
 <20260911-b4-qaif-shikra-audio-v6-7-e9addb358201@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 09:39:04 +0000
Message-Id: <20260911093904.DA9241F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unchecked DMA channel counts passed to GENMASK() can evaluate to G=
ENMASK(-1, 0), leading to undefined behavior and hardware resource conflict=
s.
- [High] Hardware initialization state is permanently lost if the QAIF doma=
in is power-collapsed during system suspend.
--

commit 6bb3c2e1288c0727263b66bf59c762a0401fb99b
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
ASoC: qcom: Add QAIF PCM operations

This commit adds PCM platform callbacks for QAIF DAIs to handle playback and
capture. It allocates DMA buffers, performs hardware initialization, and
manages DMA resources across the stream lifecycle.

> diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platfor=
m.c
> new file mode 100644
> index 0000000000000..84ce3ad9a1f2d
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-platform.c
[ ... ]
> +static int qaif_map_ee_resource(struct qaif_drv_data *drvdata)
> +{
> +	const struct qaif_variant *v =3D drvdata->variant;
> +	struct regmap *map =3D drvdata->audio_qaif_map;
> +	int ret;
> +
> +	ret =3D regmap_write(map, QAIF_EE_RDDMA_MAP_REG(v), GENMASK(v->num_rddm=
a - 1, 0));

[Severity: High]
If a hardware variant has 0 channels for a specific DMA type (for example,
playback-only), will v->num_rddma evaluate to 0? Passing 0 to
GENMASK(v->num_rddma - 1, 0) results in an unsigned underflow and creates an
all-ones bitmask. Could this write corrupt the execution environment mapping
by unintentionally claiming all channels of that type?

This same underflow pattern appears below for num_wrdma, num_codec_rddma,
and num_codec_wrdma.

> +	if (ret)
> +		return ret;
> +	ret =3D regmap_write(map, QAIF_EE_WRDMA_MAP_REG(v), GENMASK(v->num_wrdm=
a - 1, 0));
> +	if (ret)
> +		return ret;
> +	if (v->num_intf > 0) {
> +		ret =3D regmap_write(map, QAIF_EE_INTF_MAP_REG(v), GENMASK(v->num_intf=
 - 1, 0));
> +		if (ret)
> +			return ret;
> +	}
> +	ret =3D regmap_write(map, QAIF_EE_CODEC_RDDMA_MAP_REG(v),
> +			   GENMASK(v->num_codec_rddma - 1, 0));
> +	if (ret)
> +		return ret;
> +	return regmap_write(map, QAIF_EE_CODEC_WRDMA_MAP_REG(v),
> +			    GENMASK(v->num_codec_wrdma - 1, 0));
> +}
[ ... ]
> +static int qaif_init(struct snd_soc_component *component)
> +{
> +	struct qaif_drv_data *drvdata =3D snd_soc_component_get_drvdata(compone=
nt);
> +	int ret;
> +
> +	if (drvdata->qaif_hw_configured)
> +		return 0;

[Severity: High]
Is the hardware initialization state permanently lost if the QAIF domain is
power-collapsed during system suspend?

If the QAIF block registers (SHRAM boundaries, EE mappings, and DMA routing)
are reset to zero when the audio power domain collapses during system sleep,
and drvdata->qaif_hw_configured is never cleared by suspend/resume callback=
s,
this early return prevents the hardware from being reprogrammed when opening
a new stream after resume.

> +
> +	ret =3D qaif_config_shram(drvdata);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-b4-qaif-sh=
ikra-audio-v6-0-e9addb358201@oss.qualcomm.com?part=3D7

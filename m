Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348AD42EED6
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 06:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786604156; cv=none; b=oTKmm0W02IzFUx/+sG7C/4jO67JGDi6J0XsIX+cAnplXt9thtxrKmC75k0ilHhhQZwpgrmXIMkjsH4Ty0SqYlOIwHdB6R49L/qVBbpher7ZEyNXgKpvJqBChqp+K87LQkLICAYDzbupVyZVvylfrONdSEOnrPmJnrERiQg1Av50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786604156; c=relaxed/simple;
	bh=AgT5uIW/YQoXXqjI9SGUvNpCsPAeTcm1cJKrvtWTTBc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EvrdshDNQR42SQtW2PdEeaMOyQDsg6mDsUli/rEuW9YnOADBL2KJx4DujZn94gDKVI+4MNcdLYRs0Th9EsViG973K961bTmbl8AAgKKczVXTzcjsxeTQ22K96dY3IgjLGFQpA7wM3NhTw7GrnaUOrNkFbd+3CL+36kW2TqX0spw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I+I8Inay; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I+I8Inay"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E626C1F000E9;
	Thu, 13 Aug 2026 06:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786604155;
	bh=aUG6QA9LBgCMJ69HqA4rvG507Kc4ory8mJn03XoFAMs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I+I8InayPxTG7Eu1JTa9jzNVQ07DwBVl3QBuSCVlVHhIpSBrvAdFXGopjAtiD22a9
	 xDGUKK+MLXg+CLBwQqfxfgB2Q9X4eDrPc2qphtAKG2xwEuMep/zVK/YzScbhRl+8j/
	 HmQBdylzlHgeEuzSrni5c53ld6tFVWkan49qtZ7I7wXHmL0pmTzku0srt9BsSjG8x2
	 kcMrJFwlSc4JgjALmtSYWauieGWgHdkJu6/VHQQRwJ8sMUwoGzgD/2as/eWZZOpVEs
	 FR+IlZHCb87lsfi3wNs9RfhdInoR7FN+c4uAet/GmmDOngn0qH7Um2ZKXyGEFKLQHu
	 3DLY2lnWhcSQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260813064327.1127236-3-YLCHANG2@nuvoton.com>
References: <20260813064327.1127236-1-YLCHANG2@nuvoton.com>
 <20260813064327.1127236-3-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 06:55:54 +0000
Message-Id: <20260813065554.E626C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Firmware memory leak on DSP setup error path.
- [High] Out-of-bounds array read in dev_dbg due to unvalidated `source` pa=
rameter.
- [High] State loss and audio breakage due to permanent disabling of TDM bi=
ts on shutdown.
- [High] API Contract Violation: Abuse of SND_SOC_CLOCK_OUT breaks generic =
machine drivers.
- [High] Uninitialized stack memory used due to ignored regmap_read return =
value.
- [Medium] TOCTOU race in ALSA control handlers allowing unsafe hardware ac=
cess during playback.
- [Medium] Lockless access to `load_fw_done` flag without memory barriers.
--

--- Patch [2]: [PATCH v8 2/2] ASoC: codecs: nau8360: Add support for NAU83G=
60 amplifier ---
commit ff5d05e48c27ea57bf7a154300926246f16f3e8f
Author: Neo Chang <YLCHANG2@nuvoton.com>
Date:   Thu Aug 13 06:43:27 2026 +0000

ASoC: codecs: nau8360: Add support for NAU83G60 amplifier

This commit adds support for the Nuvoton NAU83G60 audio codec. The driver
includes I2C initialization, ALSA DAPM configuration, TDM routing, and an
asynchronous workqueue mechanism for DSP firmware loading.

> diff --git a/sound/soc/codecs/nau8360-dsp.c b/sound/soc/codecs/nau8360-ds=
p.c
> --- /dev/null
> +++ b/sound/soc/codecs/nau8360-dsp.c
[ ... ]
> @@ -467,6 +467,46 @@ static int nau8360_dsp_chan_kcs_setup(struct snd_soc=
_component *cp,
[ ... ]
> +	ret =3D request_firmware(&fw, fw_name, cp->dev);
> +	if (ret) {
> +		dev_err(cp->dev, "failed to load firmware (%d)", ret);
> +		return ret;
> +	}
> +
> +	buf_off =3D 0;
> +	buf_len =3D nau8360->kcs_setup_size =3D fw->size;
> +	mutex_lock(&nau8360->lock);
> +	ret =3D nau8360_dsp_kcs_setup(cp, buf_off, buf_len, fw->data, dsp_addr);
> +	mutex_unlock(&nau8360->lock);
> +	if (ret) {
> +		dev_err(cp->dev, "send DSP command %s fail (%d)",
> +			dsp_cmd_table[NAU8360_DSP_CMD_SET_KCS_SETUP], ret);
> +		return ret;

[Severity: High]
Does this error path leak the firmware memory? The function returns early
here without calling release_firmware() on fw, which could lead to a leak if
the DSP initialization fails.

> +	}
> +	release_firmware(fw);
> +
> +	return 0;
> +}

[ ... ]
> diff --git a/sound/soc/codecs/nau8360.c b/sound/soc/codecs/nau8360.c
> --- /dev/null
> +++ b/sound/soc/codecs/nau8360.c
[ ... ]
> @@ -156,6 +156,15 @@ static bool nau8360_volatile_reg(struct device *dev,=
 unsigned int reg)
[ ... ]
> +static int nau8360_get_tdm_chan_len(struct nau8360 *nau8360)
> +{
> +	int val;
> +
> +	regmap_read(nau8360->regmap, NAU8360_R0C_I2S_PCM_CTRL2, &val);

[Severity: High]
Can this result in uninitialized stack memory usage? The return value of
regmap_read() is ignored here. If the underlying I2C transfer fails, val wi=
ll
remain uninitialized.

> +	val =3D (val & NAU8360_TDM_CLEN_MASK) >> NAU8360_TDM_CLEN_SFT;
> +
> +	return (val << 3) + 16;
> +}

[ ... ]
> @@ -234,6 +234,31 @@ static int nau8360_peq_coeff_put(struct snd_kcontrol=
 *kcontrol,
[ ... ]
> +static int nau8360_peq_coeff_put(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
[ ... ]
> +	if (snd_soc_dapm_get_bias_level(dapm) > SND_SOC_BIAS_STANDBY) {
> +		dev_dbg(nau8360->dev, "PEQ access is not allowed during playback");
> +		return 0;
> +	}
> +
> +	reg =3D nau8360_peq_regaddr(kcontrol->id.name);

[Severity: Medium]
Is there a race condition here between the bias level check and the
subsequent hardware access? The bias level is checked locklessly without
holding the DAPM mutex. If playback starts immediately after this check, the
hardware registers might be modified while actively streaming, bypassing the
intended safety checks.

[ ... ]
> @@ -374,6 +374,27 @@ static int nau8360_startup(struct snd_pcm_substream =
*substream, struct snd_soc_dai *dai)
[ ... ]
> +static int nau8360_startup(struct snd_pcm_substream *substream, struct s=
nd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component =3D dai->component;
> +	struct nau8360 *nau8360 =3D snd_soc_component_get_drvdata(component);
> +	unsigned int i2s_mask =3D NAU8360_FRAME_START_MASK | NAU8360_RX_OFFSET_=
MASK;
> +	unsigned int i2s_fmt =3D NAU8360_FRAME_START_H2L | NAU8360_RX_OFFSET_I2=
S;
> +	int val;
> +
> +	if (!nau8360->load_fw_done) {

[Severity: Medium]
Could this read of load_fw_done miss the completed state? It is updated by a
background workqueue and read here without memory barriers. The thread
running this function might not observe the completed firmware load due to
weak architectural ordering guarantees, leading to spurious EBUSY failures.

> +		dev_warn(nau8360->dev, "DSP firmware is not ready yet!");
> +		return -EBUSY;
> +	}
> +
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> +		regmap_read(nau8360->regmap, NAU8360_R0B_I2S_PCM_CTRL1, &val);

[Severity: High]
Can this also use uninitialized stack memory if the regmap_read() fails? The
return value is not checked before using val in the condition below.

> +		if ((val & i2s_mask) =3D=3D i2s_fmt)
> +			regmap_update_bits(nau8360->regmap, NAU8360_R0B_I2S_PCM_CTRL1,
> +				NAU8360_EN_TDM_RX, NAU8360_EN_TDM_RX);

[Severity: High]
Does this sequence permanently break TDM routing for capture streams and
non-I2S formats?

The nau8360_shutdown() function unconditionally clears NAU8360_EN_TDM_TX
or NAU8360_EN_TDM_RX. Here in startup(), NAU8360_EN_TDM_TX is never
re-enabled for capture streams. Additionally, NAU8360_EN_TDM_RX is only
restored if the format is strictly I2S. Since generic machine drivers typic=
ally
call set_tdm_slot() only once during initialization, the TDM configuration
might be lost after the first stream stops.

> +
> +		if (nau8360_dsp_active(component))
> +			snd_soc_dapm_enable_pin(nau8360->dapm, "Sense");
> +	}
> +
> +	return 0;
> +}
> +
> +static void nau8360_shutdown(struct snd_pcm_substream *substream,
> +	struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component =3D dai->component;
> +	struct nau8360 *nau8360 =3D snd_soc_component_get_drvdata(component);
> +	unsigned int tdm_mask;
> +
> +	tdm_mask =3D (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) ?
> +		NAU8360_EN_TDM_RX : NAU8360_EN_TDM_TX;
> +	regmap_update_bits(nau8360->regmap, NAU8360_R0B_I2S_PCM_CTRL1,
> +		tdm_mask, 0);

[ ... ]
> @@ -630,6 +630,42 @@ static int nau8360_set_sysclk(struct snd_soc_compone=
nt *cp,
[ ... ]
> +static int nau8360_set_sysclk(struct snd_soc_component *cp,
> +	int clk_id, int source, unsigned int freq, int dir)
> +{
> +	struct nau8360 *nau8360 =3D snd_soc_component_get_drvdata(cp);
> +	struct regmap *regmap =3D nau8360->regmap;
> +	struct device *dev =3D nau8360->dev;
> +	static const char * const idtab[] =3D { "DIG", "ANA", "Internal" };
> +	static const char * const srctab[] =3D { "MCLK", "PLL", "HIRC48M", "BCL=
K" };
> +	int ret;
> +
> +	if (dir =3D=3D SND_SOC_CLOCK_OUT) {
> +		dev_dbg(dev, "sysclk: freq %d (out)", freq);
> +		return nau8360_set_sysclk_output(nau8360, freq);

[Severity: High]
Does this break compatibility with generic ALSA machine drivers? This code
requires the machine driver to pass SND_SOC_CLOCK_OUT to configure the
internal system clock target rate. Generic machine drivers (like
simple-audio-card) only call set_sysclk() with SND_SOC_CLOCK_IN, which would
leave the internal sys_clk as 0 and cause subsequent divider calculations in
nau8360_dig_sys_clk() to fail.

> +	}
> +
> +	switch (clk_id) {
[ ... ]
> +	case NAU8360_CLK_ID_DIG:
> +		dev_dbg(dev, "sysclk: id %d (%s), src %d (%s), freq %d (in)",
> +			clk_id, idtab[clk_id], source, srctab[source], freq);

[Severity: High]
Could this result in an out-of-bounds array read? The srctab array has 4
elements, but the source parameter is provided directly by the caller and is
used as an index here without prior validation.

> +
> +		if (source =3D=3D NAU8360_CLK_SRC_BCLK)
> +			return -EINVAL;

[ ... ]
> @@ -1056,6 +1056,12 @@ static void nau8360_load_fw_work(struct work_struc=
t *work)
> +static void nau8360_load_fw_work(struct work_struct *work)
> +{
> +	struct nau8360 *nau8360 =3D container_of(work, struct nau8360, load_fw_=
work);
> +	struct snd_soc_component *cp =3D snd_soc_dapm_to_component(nau8360->dap=
m);
> +	int ret;
> +
> +	ret =3D nau8360_dsp_init(cp);
> +	if (ret) {
> +		dev_err(nau8360->dev, "Failed to initialize DSP: %d\n", ret);
> +		nau8360_dsp_enable(nau8360->regmap, false);
> +		return;
> +	}
> +	nau8360->load_fw_done =3D true;

[Severity: Medium]
Is a memory barrier needed here? This flag is written from a workqueue and
read in nau8360_startup(), so the update might not be properly synchronized
without smp_store_release() and smp_load_acquire().

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813064327.1127=
236-1-YLCHANG2@nuvoton.com?part=3D2

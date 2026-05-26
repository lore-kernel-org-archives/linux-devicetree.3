Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EFA1C862F
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 02:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779763618; cv=none; b=LsUWTOHoMrpeMToq9J5o0T5h5LNms/keqS8lKT5q/i0v83obB/fQQ8Xiaxr20eCQUkUPsdMWE3m32ZQNcvHIIZs/hAsVfssSwhvekJUvBE6cBAPr9ps1uUJwsd3NF5I1kpudqjcS6X7Flgcl53SV3L/nRSxpxuug008dxFc0YmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779763618; c=relaxed/simple;
	bh=sFZ4fjp5CJzxlLoFWVlKcpos81Wk8YyrubQWE8+l3aU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uEX5hwN2hmIBMegV/43LhTcWvQdJOfbEZH2SJ5w71+FTQnOdKzgXOirYDDjqYcKxTFas3FtTTz7Clwx6IEJn9ozS/NxHUBWBaef1yV8usQJuLF6mKJEU7lOXiq8V49us8NTkZ4OG+ejZZP+hfS2Lr0ByjMCOHVINtn1hhkxxA2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNmHP0Ui; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNmHP0Ui"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB481F000E9;
	Tue, 26 May 2026 02:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779763616;
	bh=fHqAdRBg8eOVf5d/Bh/FZuwnlIgDLe0H/IAJaJVaXDc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kNmHP0UiAaZBEiEABPbdpWTJUwSggsZl+AZUGrUGA8Wf1VXqgBuWrcS3S7qFqz+fW
	 XOnhdRU0pQWTbQZh9IzZW0QHE9+0a4yj6VovovTMrXXCmh5cn4VZzHeqdixkSWgFIl
	 AbHkl7FtyIs6XuyjrGaKo3e/53rWkM0OKDHywHPM4quqUzHnKNlie0MwoMsRXwo4rP
	 4rCDlT2CzWIzEx9c9G5uJ7BmSkNNhVwydtBkb3potqN5ostZz8nWbLXB4tkPw7hbFp
	 48C5KkltKDqhttyCHsgrBAz2aalQD1RsG8xt62CWpAgSrZStBow5WgY/GZpec3yjMK
	 w3h9IXjZ6RGOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260526015826.440769-3-YLCHANG2@nuvoton.com>
References: <20260526015826.440769-3-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 02:46:55 +0000
Message-Id: <20260526024656.4DB481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [Critical] The regmap configuration forces 16-bit truncation on 32-bit DS=
P registers.
- [High] Dynamic creation of DAPM widgets and routes within an ALSA kcontro=
l `put` handler without instantiation.
- [High] Using atomic polling with a 1000us delay on a sleepable I2C regmap.
- [High] TDM TX is permanently disabled after the first capture stream stop=
s.
- [High] Concurrent ALSA kcontrol callbacks race on shared hardware state, =
causing corrupted PEQ memory accesses.
- [High] Synchronous `request_firmware` in a kcontrol `put` handler and `re=
sume` path causes deadlocks.
- [High] PEQ coefficients are silently lost during suspend/resume due to mi=
ssing hardware memory access bit.
- [High] Stack-allocated memory buffers are passed directly to I2C transfer=
 functions.
- [Medium] `nau8360_vbat_level()` uses uninitialized stack memory if `regma=
p_read()` fails.
- [Medium] Unhandled failure in `nau8360_dsp_init` causes duplicated DAPM w=
idgets to be leaked.
- [Medium] Uninitialized stack variable `status` is used to verify DSP stat=
e if the DSP returns a 0-length or trailing-only reply.
- [Medium] TOCTOU race when checking DAPM bias level and unprotected state =
modification of `dsp_enable`.
- [Medium] Unprotected concurrent access to shared TDM slot caching arrays.
--

commit ecf4fed8f174ef2256d85d18a781234a1012265b
Author: Neo Chang <YLCHANG2@nuvoton.com>
Subject: ASoC: codecs: nau8360: Add support for NAU83G60 amplifier

This commit adds support for the Nuvoton NAU83G60 audio codec. The NAU83G60
is a stereo 30W+30W smart amplifier with an integrated low-latency Advanced
Audio DSP.

> diff --git a/sound/soc/codecs/nau8360-dsp.c b/sound/soc/codecs/nau8360-ds=
p.c
> --- a/sound/soc/codecs/nau8360-dsp.c
> +++ b/sound/soc/codecs/nau8360-dsp.c

[ ... ]

> +/* checking for DSP IDLE pattern */
> +static int nau8360_dsp_idle(struct snd_soc_component *component, unsigne=
d short dsp_addr)
> +{
> +	struct nau8360 *nau8360 =3D snd_soc_component_get_drvdata(component);
> +	unsigned int idle_pattern, timeout =3D NAU8360_DSP_IDLE_RETRY * USEC_PE=
R_MSEC;
> +	int ret;
> +
> +	ret =3D regmap_read_poll_timeout_atomic(nau8360->regmap, dsp_addr, idle=
_pattern,
> +		idle_pattern =3D=3D NAU8360_DSP_COMM_IDLE_WORD, USEC_PER_MSEC, timeout=
);

[Severity: High]
Does using the atomic variant of regmap poll timeout with a 1000 microsecond
delay cause soft lockups due to prolonged busy-waiting? Since the underlying
I2C transfer sleeps anyway, should this use the non-atomic
regmap_read_poll_timeout instead?

[ ... ]

> +static int nau8360_dsp_chan_kcs_setup(struct snd_soc_component *cp,
> +	const char *fw_name, int dsp_addr)
> +{
> +	struct nau8360 *nau8360 =3D snd_soc_component_get_drvdata(cp);
> +	const struct firmware *fw;
> +	int ret, status, buf_off, buf_len;
> +
> +	ret =3D nau8360_dsp_get_cmd_put(cp, dsp_addr,
> +			NAU8360_DSP_CMD_GET_FRAME_STATUS, &status);
> +	if (ret || !(status & NAU8360_DSP_ALGO_OK)) {

[Severity: Medium]
If the DSP returns a reply containing only a trailing fragment, does the
payload read loop in nau8360_reply_from_dsp get skipped, leaving the status
variable unmodified? Can this cause this uninitialized stack variable to be
evaluated here, leading to unpredictable behavior?

> +		dev_err(cp->dev, "DSP %x is not ready", dsp_addr);
> +		ret =3D -EIO;
> +		goto err;
> +	}
> +
> +	dev_info(cp->dev, "DSP %x is ready to load firmware %s, status %x",
> +		dsp_addr, fw_name, status);
> +
> +	ret =3D request_firmware(&fw, fw_name, cp->dev);

[Severity: High]
Can calling request_firmware synchronously from a kcontrol put handler
(via nau8360_dac_mux_put_enum) or during the resume path risk blocking the
ALSA controls rwsem or deadlocking the resume thread?

[ ... ]

> +int nau8360_dsp_init(struct snd_soc_component *component)
> +{
> +	struct nau8360 *nau8360 =3D snd_soc_component_get_drvdata(component);
> +	struct snd_soc_dapm_context *dapm =3D nau8360->dapm;
> +	int ret;
> +
> +	dev_info(component->dev, "DSP initializing...");
> +	ret =3D nau8360_dsp_set_kcs_setup(component);
> +	if (ret)
> +		goto err;
> +
> +	ret =3D snd_soc_dapm_new_controls(dapm, nau8360_dsp_dapm_widgets,
> +			ARRAY_SIZE(nau8360_dsp_dapm_widgets));
> +	if (ret) {
> +		dev_err(component->dev, "add DSP widget fail (%d)", ret);
> +		goto err;
> +	}
> +	ret =3D snd_soc_dapm_add_routes(dapm, nau8360_dsp_dapm_routes,
> +			ARRAY_SIZE(nau8360_dsp_dapm_routes));

[Severity: High]
Does adding DAPM widgets and routes dynamically from a kcontrol put handler
leave the new widgets uninstantiated without a subsequent call to
snd_soc_dapm_new_widgets()? Could this cause the DSP Clock supply to fail to
power up?

[Severity: Medium]
If snd_soc_dapm_add_routes fails here, does this return an error without
freeing the widgets created by snd_soc_dapm_new_controls? Since dsp_created
remains false, will subsequent attempts to enable the DSP allocate duplicate
widgets and leak memory?

> diff --git a/sound/soc/codecs/nau8360.c b/sound/soc/codecs/nau8360.c
> --- a/sound/soc/codecs/nau8360.c
> +++ b/sound/soc/codecs/nau8360.c

[ ... ]

> +static int nau8360_tdm_rx_slot_put(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *cp =3D snd_kcontrol_chip(kcontrol);
> +	struct nau8360 *nau8360 =3D snd_soc_component_get_drvdata(cp);
> +	struct soc_enum *e =3D (struct soc_enum *)kcontrol->private_value;
> +	unsigned int *item =3D ucontrol->value.enumerated.item;
> +	unsigned int mask =3D e->mask << e->shift_l;
> +	int ret, func_idx, val_to_cache;
> +	bool changed =3D false;
> +	bool is_none =3D (item[0] =3D=3D NAU8360_TDM_RXN);
> +
> +	func_idx =3D nau8360_get_tdm_rx_func_idx(e);
> +	if (item[0] >=3D e->items || func_idx < 0)
> +		return -EINVAL;
> +
> +	val_to_cache =3D is_none ? TDM_SLOT_NONE : item[0];
> +	if (nau8360->tdm_rx_func_slot[func_idx] =3D=3D val_to_cache) {
> +		dev_dbg(cp->dev, "RX func %s: Slot no change (%d)",
> +			nau8360_rx_func_names[func_idx], val_to_cache);
> +		goto done;
> +	}
> +
> +	nau8360->tdm_rx_func_slot[func_idx] =3D val_to_cache;

[Severity: Medium]
Are the arrays tdm_rx_func_slot and tdm_tx_func_slot updated without any
locking? Can concurrent ALSA put callbacks or overlapping hw_params calls
result in data races and inconsistent slot validation logic?

[ ... ]

> +static int nau8360_peq_coeff_put(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *cp =3D snd_kcontrol_chip(kcontrol);
> +	struct soc_bytes_ext *params =3D (void *)kcontrol->private_value;
> +	int i, ret, reg =3D nau8360_peq_regaddr(kcontrol->id.name);
> +	__be16 *data;
> +	bool changed =3D false;
> +
> +	if (reg < 0) {
> +		ret =3D -EIO;
> +		goto err;
> +	}
> +	data =3D kmemdup(ucontrol->value.bytes.data, params->max, GFP_KERNEL);
> +	if (!data) {
> +		ret =3D -ENOMEM;
> +		goto err;
> +	}
> +
> +	snd_soc_component_update_bits(cp, NAU8360_R9D_PEQ_CTL, NAU8360_HW1_MEM_=
TEST,
> +		NAU8360_HW1_MEM_TEST);

[Severity: High]
Can concurrent execution of the PEQ get and put kcontrol callbacks race on
the NAU8360_HW1_MEM_TEST bit modification? Could one thread clear the bit
while another is reading or writing, leading to corrupted PEQ memory access=
es?

[ ... ]

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

[Severity: High]
Does explicitly clearing the NAU8360_EN_TDM_TX bit during shutdown without
re-enabling it during startup or hw_params cause subsequent capture streams
to fail and yield silence?

[ ... ]

> +static int nau8360_dac_mux_put_enum(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_dapm_kcontrol_to_dapm(kco=
ntrol);
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(dapm);
> +	struct nau8360 *nau8360 =3D snd_soc_component_get_drvdata(component);
> +	struct soc_enum *e =3D (struct soc_enum *)kcontrol->private_value;
> +	unsigned int *item =3D ucontrol->value.enumerated.item;
> +	bool dsp_en =3D snd_soc_enum_item_to_val(e, item[0]);
> +	int ret =3D 0;
> +
> +	if (nau8360->dsp_enable =3D=3D dsp_en)
> +		goto done;
> +
> +	if (snd_soc_dapm_get_bias_level(dapm) > SND_SOC_BIAS_STANDBY) {

[Severity: Medium]
Is this check for the DAPM bias level vulnerable to a time-of-check to
time-of-use race since it happens outside the DAPM card mutex? Could a
concurrent stream start immediately after the check, leading to DSP path
switching while playback is active? Also, is nau8360->dsp_enable being
accessed and modified without locking here?

[ ... ]

> +static inline int nau8360_vbat_level(struct regmap *regmap)
> +{
> +	int value;
> +
> +	regmap_read(regmap, NAU8360_R21_VBAT_READOUT, &value);
> +	/* multiple 100 on value scale */
> +	return (value * 100 + NAU8360_VBAT_BASE) / NAU8360_VBAT_STEP;
> +}

[Severity: Medium]
If the I2C read fails, does this function use an uninitialized stack
variable to calculate the VBAT level? Could this lead to configuring
critical sawtooth parameters based on corrupted data if the garbage value
happens to fall within the valid range?

[ ... ]

> +static int __maybe_unused nau8360_resume(struct snd_soc_component *compo=
nent)
> +{
> +	struct nau8360 *nau8360 =3D snd_soc_component_get_drvdata(component);
> +	struct regmap *regmap =3D nau8360->regmap;
> +	int ret;
> +
> +	regcache_cache_only(regmap, false);
> +	regcache_sync(regmap);

[Severity: High]
Since regcache_sync restores registers in numerical order, will it write the
PEQ coefficients starting at 0x100 before the HW1_MEM_TEST bit is set at
0x9D, causing the hardware to silently reject the writes and lose custom
equalizer settings across suspend and resume cycles?

[ ... ]

> +static int nau8360_reg_write(void *context, unsigned int reg, unsigned i=
nt value)
> +{
> +	struct i2c_client *client =3D context;
> +	int ret, count =3D 0;
> +	u8 buf[6];
> +
> +	buf[count++] =3D reg >> 8;
> +	buf[count++] =3D reg & 0xff;
> +	if (reg !=3D NAU8360_RF000_DSP_COMM && reg !=3D NAU8360_RF002_DSP_COMM)=
 {
> +		/* format for Codec, 2 bytes value and endian big */
> +		buf[count++] =3D value >> 8;
> +		buf[count++] =3D value & 0xff;
> +		dev_dbg(&client->dev, " %x <=3D %x", reg, value);
> +	} else {
> +		/* format for DSP, 4 bytes value and native */
> +		buf[count++] =3D value & 0xff;
> +		buf[count++] =3D (value >> 8) & 0xff;
> +		buf[count++] =3D (value >> 16) & 0xff;
> +		buf[count++] =3D (value >> 24) & 0xff;
> +	}
> +
> +	ret =3D i2c_master_send(client, buf, count);

[Severity: High]
Are stack-allocated arrays being passed directly to i2c_master_send and
i2c_transfer? If the I2C adapter utilizes DMA, does mapping stack memory
violate architecture rules and risk memory corruption?

[ ... ]

> +static const struct regmap_config nau8360_regmap_config =3D {
> +	.reg_bits =3D NAU8360_REG_ADDR_LEN,
> +	.val_bits =3D NAU8360_REG_DATA_LEN,
> +
> +	.max_register =3D NAU8360_REG_MAX,
> +	.readable_reg =3D nau8360_readable_reg,
> +	.writeable_reg =3D nau8360_writeable_reg,
> +	.volatile_reg =3D nau8360_volatile_reg,
> +	.reg_read =3D nau8360_reg_read,
> +	.reg_write =3D nau8360_reg_write,

[Severity: Critical]
Since nau8360_regmap_config sets val_bits to 16, does the regmap core silen=
tly
apply a 0xFFFF mask to all read values? When reading 32-bit DSP registers
via the custom nau8360_reg_read, does this cause the upper 16 bits to be
discarded, breaking DSP firmware loading and communication?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526015826.4407=
69-1-YLCHANG2@nuvoton.com?part=3D2

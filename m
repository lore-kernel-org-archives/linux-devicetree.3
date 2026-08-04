Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7925423395C
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 03:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785815066; cv=none; b=OngAvF9m1fffRJsnBC+WVpJQAnq9FwkzdtF5+JEjP+my4xVxj01uuNkVf2hVgyQrT7mClfKD/TJhGFzwFmN1KWmcG0c5TZQBF/l181Z/eFX+vS+4IwkSL7+F85FsmrYZgwpcRQ3TqPuRWjFDgGG2zUT5xq+iIeBC7px0Ht1hXZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785815066; c=relaxed/simple;
	bh=zfDXUNu1/YmPHOXTUn5dj36KU4nexQcuJSfkmFEKDOw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nXf4jGVScDkrjzGX/if4kQ3U1hEUmgHdEX3HSE+Sgvqw9Cai+gOluyl2/F/mpLqO+/McEnxY2YnBYFELsHQAIT7vSkQiTet0QXzIYZqhDVUBVgdNj637uz8DaOdCKuog+evMcine601SOfBOB0LNnLalks9k6cT6eMUxNGTXxNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKSz7aTk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKSz7aTk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74AF91F000E9;
	Tue,  4 Aug 2026 03:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785815064;
	bh=hrmidxHlbbSWvpLyib/NfWb4OokpjS5sbAphs35mTvU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hKSz7aTkbj2HTcAlR3ipC6ICWUqGmYbLsaRpcxNqkUaAhvnbwi4CHyLrzft/guNC9
	 4Tj0p61UIPymB5hPnRTTLC+Qz/JrUoDDIPCivP8dKtHmDKXpwBVmnR7yi3hPgaQtS2
	 sx9fOA7YMuGdTI7BQX2U35h34C10BRKCwlx0zfEyKFfPwWnC1eAhZ59vQS0LjSdofB
	 BuaFZW2qR6vlt2O5DVYr1YkZHclJHFk/B7RgjgWG3j9AFgpCN7gvkiZpOpaIqBX4DK
	 pn5AHRU2c+NgNQRUSgA6zPhvvmToLNNIvoF/tQ4IzBM6zoHaC62YR58Ua/wVKZBMS4
	 7X+K8ppMo2H/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804032951.1069901-3-YLCHANG2@nuvoton.com>
References: <20260804032951.1069901-1-YLCHANG2@nuvoton.com>
 <20260804032951.1069901-3-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 03:44:22 +0000
Message-Id: <20260804034423.74AF91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [High] DSP initialization fails unconditionally during resume due to regm=
ap `cache_only` mode.
- [High] Concurrent asynchronous firmware loading requests cause a Use-Afte=
r-Free during device unbind.
- [High] Unkillable task deadlock on module unload (remove) if the device i=
s removed after a suspend/resume cycle.
- [High] Ignored `regmap_read()` return values result in uninitialized stac=
k variables driving hardware logic.
- [Medium] Silent failure when rejecting DAC mux path changes during playba=
ck.
- [Medium] Unprotected access to `nau8360->anc_enable` and hardware registe=
rs creates a data race in `nau8360_dsp_switch`.
- [Medium] Short fragments from the DSP can cause uninitialized stack memor=
y to be used in `nau8360_dsp_kcs_setup`.
- [Medium] Out-of-bounds `tdm_tx_func_slot` configurations cause undefined =
behavior via bit shifts.
- [Medium] Data race on the `dsp_created` flag between firmware callback an=
d ALSA startup.
- [Medium] Manual DAPM pin toggling of the 'Sense' widget breaks I/V captur=
e streams when the DSP is bypassed.
- [Low] Incompatible pointer type warning in `nau8360_validate_tdm_slots`.
--

--- Patch [2]: [PATCH v7 2/2] ASoC: codecs: nau8360: Add support for NAU83G=
60 amplifier ---
commit 498f738336b985a294d2d2e4f2b2064ec352e710
Author: Neo Chang <YLCHANG2@nuvoton.com>

ASoC: codecs: nau8360: Add support for NAU83G60 amplifier

Add support for the Nuvoton NAU83G60 audio codec. The NAU83G60 is a
stereo 30W+30W smart amplifier with an integrated low-latency
Advanced Audio DSP.

> diff --git a/sound/soc/codecs/nau8360-dsp.c b/sound/soc/codecs/nau8360-ds=
p.c
> index 14ff6c5705d14.....
> --- /dev/null
> +++ b/sound/soc/codecs/nau8360-dsp.c
[ ... ]
> +static int nau8360_read_data_payload(struct snd_soc_component *cp,
> +	unsigned short dsp_addr, int frag_len, bool msg_param,
> +	void *data, int data_size, int *data_count)
> +{
> +	struct nau8360 *nau8360 =3D snd_soc_component_get_drvdata(cp);
> +	struct device *dev =3D cp->dev;
> +	unsigned int payload;
> +	u32 *data_buf =3D data;
> +	int i, j, ret;
> +
> +	*data_count =3D (msg_param) ? data_size : 0;
> +	for (i =3D 0; i < frag_len - 1; i++) {

[Severity: Medium]
What happens if the DSP hardware returns a trailing fragment with a frag_len
of 1?=20

The loop extracting payload bytes wouldn't execute, leaving the data buffer=
=20
untouched without returning an error.

[ ... ]
> +static int nau8360_dsp_kcs_setup(struct snd_soc_component *cp, int offse=
t, int size,
> +	const void *data, unsigned short dsp_addr)
> +{
[ ... ]
> +		/* checking KCS result */
> +		ret =3D nau8360_dsp_exec_command(cp, NAU8360_DSP_CMD_GET_KCS_RSLTS,
> +			0, NAU8360_DSP_DATA_BYTE, NULL,
> +			NAU8360_DSP_DATA_BYTE, &kcs_rst, dsp_addr);
> +		if (ret)
> +			return ret;
> +		if (kcs_rst !=3D NAU8360_DSP_KCS_RSLTS_SUCCESS)
> +			return -EINVAL;

[Severity: Medium]
Could this evaluate uninitialized stack memory?

If nau8360_read_data_payload() encounters a frag_len of 1, kcs_rst is left=
=20
uninitialized but the reply validation still returns success. Evaluating=20
kcs_rst here could then randomly fail or pass based on whatever was on the=
=20
stack.

[ ... ]
> +static int nau8360_dsp_chan_kcs_setup(struct snd_soc_component *cp,
> +	const char *fw_name, int dsp_addr)
> +{
[ ... ]
> +	ctx =3D kmalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->cp =3D cp;
> +	ctx->dsp_addr =3D dsp_addr;
> +
> +	reinit_completion(&nau8360->fw_done[core_id]);
> +
> +	ret =3D request_firmware_nowait(THIS_MODULE, true,
> +		fw_name, dev, GFP_KERNEL, ctx, nau8360_dsp_fw_cb);

[Severity: High]
Does this create a race condition if called multiple times before the previ=
ous=20
firmware request finishes?

Reinitializing the completion and launching a duplicate request could leave=
=20
multiple asynchronous callbacks pending, which might bypass later unbind
synchronizations.

> diff --git a/sound/soc/codecs/nau8360.c b/sound/soc/codecs/nau8360.c
> index 4a5fe315850fd.....
> --- /dev/null
> +++ b/sound/soc/codecs/nau8360.c
[ ... ]
> +static int nau8360_get_tdm_chan_len(struct nau8360 *nau8360)
> +{
> +	int val;
> +
> +	regmap_read(nau8360->regmap, NAU8360_R0C_I2S_PCM_CTRL2, &val);
> +	val =3D (val & NAU8360_TDM_CLEN_MASK) >> NAU8360_TDM_CLEN_SFT;
> +
> +	return (val << 3) + 16;
> +}

[Severity: High]
Can regmap_read() fail here?

If an I2C error occurs, the return value is ignored and the uninitialized=20
stack variable val is used to compute the channel length. This garbage=20
value then propagates into the mathematical bounds for TDM slots.

[ ... ]
> +static void nau8360_dsp_switch(struct snd_soc_component *component, bool=
 enable)
> +{
> +	struct nau8360 *nau8360 =3D snd_soc_component_get_drvdata(component);
> +	struct regmap *regmap =3D nau8360->regmap;
> +	int value =3D NAU8360_PEQ_BAND_8;
> +
> +	/* If DSP is enabled, unstall HW3 engine and DSP, loading DSP firmware,
> +	 * and configure PEQ after dsp reset.
> +	 */
> +	if (enable) {
> +		value =3D nau8360->anc_enable ? NAU8360_PEQ_BAND_15 : NAU8360_PEQ_BAND=
_12;
> +		nau8360_dsp_enable(regmap, true);
> +	} else {
> +		dev_dbg(nau8360->dev, "Bypass DSP path");
> +		nau8360_dsp_enable(regmap, false);
> +	}
> +	regmap_update_bits(regmap, NAU8360_R9D_PEQ_CTL, NAU8360_PEQ_BAND_MASK,
> +		value << NAU8360_PEQ_BAND_SFT);
> +}

[Severity: Medium]
Is it safe to read nau8360->anc_enable and update the PEQ register without
holding nau8360->lock?=20

Looking at nau8360_anc_put(), it protects these variables with a mutex.
Concurrent execution from ALSA control put handlers might result in a stale
hardware state here.

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
> +	int ret =3D 0;
> +
> +	if (snd_soc_dapm_get_bias_level(dapm) > SND_SOC_BIAS_STANDBY) {
> +		dev_warn(nau8360->dev, "changing path is not allowed during playback");
> +		return ret;
> +	}

[Severity: Medium]
Should this return an error code like -EBUSY?=20

Returning 0 when rejecting the change silently fails and tricks userspace=20
into thinking the hardware path was updated.

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
> +	if (nau8360->dsp_created !=3D NAU8360_DSP_FW_ALL_DONE) {
> +		dev_warn(nau8360->dev, "DSP firmware is not ready yet!");
> +		return -EBUSY;
> +	}

[Severity: Medium]
Is a lock needed here when checking the dsp_created flag?=20

The firmware callback nau8360_dsp_fw_cb() modifies this flag under=20
nau8360->lock. Reading it unlocked might cause a torn read and spuriously=20
reject playback streams.

> +
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> +		regmap_read(nau8360->regmap, NAU8360_R0B_I2S_PCM_CTRL1, &val);
> +		if ((val & i2s_mask) =3D=3D i2s_fmt)
> +			regmap_update_bits(nau8360->regmap, NAU8360_R0B_I2S_PCM_CTRL1,
> +				NAU8360_EN_TDM_RX, NAU8360_EN_TDM_RX);

[Severity: High]
Does regmap_read() need its return value checked here?=20

Similar to nau8360_get_tdm_chan_len(), if this read fails due to bus issues=
,=20
an uninitialized stack variable will be evaluated to determine if the recei=
ver=20
should be enabled.

> +
> +		if (nau8360_dsp_active(component))
> +			snd_soc_dapm_enable_pin(nau8360->dapm, "Sense");
> +	}

[Severity: Medium]
Will this break I/V capture streams when the DSP is bypassed?=20

The Sense widget is the DAPM source for ADC_I and ADC_V. If it's never enab=
led=20
when nau8360_dsp_active() evaluates to false, DAPM won't power up the ADCs,=
=20
leaving the host recording silence over TDM.

[ ... ]
> +static int nau8360_validate_tdm_slots(struct device *dev, unsigned int m=
ask,
> +	const int *func_slots, const char * const *func_names,
> +	int num_funcs, const char *dir,
> +	unsigned int *slot_used)

[Severity: Low]
Does the func_slots parameter need its type updated?=20

The struct fields tdm_tx_func_slot and tdm_rx_func_slot were updated to u32=
,=20
which results in passing an unsigned int array to a const int pointer here.

> +{
> +	int i;
> +	unsigned int func_slot;
> +	*slot_used =3D 0;
> +
> +	if (!mask)
> +		return 0;
> +
> +	for (i =3D 0; i < num_funcs; i++) {
> +		func_slot =3D func_slots[i];
[ ... ]
> +		if (func_slot >=3D NAU8360_TDM_MAX_CHAN) {
> +			dev_warn(dev, "Invalid %s %s slot index: %d",
> +				dir, func_names[i], func_slot);
> +			continue;
> +		}

[Severity: Medium]
Should this clear the invalid slot from the array?=20

It logs a warning and continues, but leaves the out-of-bounds value intact =
in
the original array for later consumption.

[ ... ]
> +static void nau8360_enable_tdm_channels(struct snd_soc_component *cp,
> +	int rx_slot_used, int tx_slot_used)
> +{
> +	struct nau8360 *nau8360 =3D snd_soc_component_get_drvdata(cp);
> +	int i, slot;
> +	unsigned int val =3D 0;
> +	bool enable;
> +
> +	for (i =3D 0; i < NAU8360_TDM_TXN; i++) {
> +		slot =3D nau8360->tdm_tx_func_slot[i];
> +		enable =3D (slot !=3D TDM_SLOT_NONE) && (tx_slot_used & BIT(slot));

[Severity: Medium]
Can this trigger undefined behavior?=20

If the invalid slot value from earlier (e.g. >=3D 32) remains in the array,=
=20
evaluating BIT(slot) will bit-shift out of bounds.

[ ... ]
> +static int __maybe_unused nau8360_suspend(struct snd_soc_component *comp=
onent)
> +{
> +	struct nau8360 *nau8360 =3D snd_soc_component_get_drvdata(component);
> +	int i;
> +
> +	for (i =3D 0; i < NAU8360_DSP_CORE_NUM; i++)
> +		wait_for_completion(&nau8360->fw_done[i]);

[Severity: High]
Does this consume the completion token without replacing it if the resume
fails?=20

If nau8360_resume() doesn't properly replenish the token, a subsequent modu=
le=20
unload will deadlock forever when it waits on this completion.

[ ... ]
> +static int __maybe_unused nau8360_resume(struct snd_soc_component *compo=
nent)
> +{
> +	struct nau8360 *nau8360 =3D snd_soc_component_get_drvdata(component);
> +	struct regmap *regmap =3D nau8360->regmap;
> +	int ret;
> +
> +	/* disable Sense at standby */
> +	snd_soc_dapm_disable_pin(nau8360->dapm, "Sense");
> +	snd_soc_dapm_sync(nau8360->dapm);
> +
> +	ret =3D nau8360_dsp_setup(component);
> +
> +	regcache_cache_only(regmap, false);

[Severity: High]
Can the DSP initialization succeed here?=20

nau8360_dsp_setup() is called before clearing the cache_only flag. Since=20
nau8360_dsp_setup() relies on polling hardware registers over the bus, it=20
will silently fail every time during resume, skipping firmware loads and=20
leaving the hardware unprotected.

[ ... ]
> +static void nau8360_i2c_remove(struct i2c_client *client)
> +{
> +	struct nau8360 *nau8360 =3D i2c_get_clientdata(client);
> +	int i;
> +
> +	for (i =3D 0; i < NAU8360_DSP_CORE_NUM; i++)
> +		wait_for_completion(&nau8360->fw_done[i]);
> +}

[Severity: High]
If nau8360_suspend() consumed the token and nau8360_resume() failed to repl=
ace
it, won't this cause an unkillable deadlock?

Additionally, if duplicate firmware requests were launched by=20
nau8360_dsp_chan_kcs_setup(), this wait_for_completion() will only synchron=
ize=20
against the first one. The second pending callback could execute after the=
=20
device unbinds, triggering a use-after-free on the nau8360 struct.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804032951.1069=
901-1-YLCHANG2@nuvoton.com?part=3D2

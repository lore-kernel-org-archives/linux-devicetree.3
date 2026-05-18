Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786A0375F76
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 03:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779074634; cv=none; b=eT1a/HJvjuwKeOw285NmW1bqO8hPFDAryQDDTGPw8yM9q3M9bnYJ7LnK2PfOdKSC9OL4Ig5bcgEOdUY72blTCW3h3TMig1D7y0NHIqzO9YG0VsuSKBAcRLUmPWuoT//+cQ5WXA7MGK6ASBeKjbiKKWWdYVPQIxurK+j9H3dbzbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779074634; c=relaxed/simple;
	bh=Yy9Itu31EH/chJDN5T5DzK0597S0ucLI1NqwKVsm/F4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y3VxgZM1OUVQvwzO0hT+SqtNqJnJw7x1ckCCkbnAXGdGEt5vZLyrd8L8NDkda01H3BYYjeAApAkrMxoK8qwkLKuBF7lBGFWCxq0yejBH9ZKfU1aPF4oeGgpnAoNmDjipqFsnv0axZ3EFvdt6nPQJXc4Ev/2DaI35CxU1Qh0Vxjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5jL8Wot; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5jL8Wot"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24E53C2BCB0;
	Mon, 18 May 2026 03:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779074634;
	bh=Yy9Itu31EH/chJDN5T5DzK0597S0ucLI1NqwKVsm/F4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=I5jL8WotddBLI5ntexr6F3NTQabCIsUcYUiDlfP0u+ElCYjAy2zF/DEWfAlxNPLjz
	 kapaJCckmfB+7sWRZP20oPzV8iQrXdcyMC/loMW01c2jwUkH81/tfZVxNOVdXrpo6T
	 0jkP4xLnqCL4uqfNvUan87IgNBMtfrFQsW5AfFQEnDVYJKpqlmXAZav/Br5NEkKyLA
	 4xLXgynabG8nwQVuJhsc4V/fmJGRHLbtQ6S0e/dfGyfZp6rPe0o6Nj9yMPu24S2bVo
	 IeYZx6HuQvvWnpCqutMeHB1YnW4VAF1QRs0u16ee7t2mOPhRpe3D5vtEy3Mr6lIUeg
	 jfFBR/FBioIjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260518024704.118613-3-YLCHANG2@nuvoton.com>
References: <20260518024704.118613-3-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 03:23:53 +0000
Message-Id: <20260518032354.24E53C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] Regmap configuration truncates 32-bit DSP register reads to 16 bit=
s, permanently breaking DSP communication.
- [High] Error handler in `nau8360_dac_mux_put_enum` unconditionally revers=
es the DSP state, causing severe playback disruption.
- [High] TOCTOU race condition in `nau8360_dac_mux_put_enum` leads to dupli=
cate DAPM widget creation and list corruption.
- [High] Stack buffer overflow in `nau8360_reply_from_dsp` when parsing tra=
iling DSP bytes.
- [High] `nau8360_set_tdm_slot()` fails unconditionally for typical TDM con=
figurations due to zero-initialized slot arrays.
- [High] Synchronous firmware loading during system resume creates a system=
-wide deadlock hazard.
- [High] PEQ coefficients are ignored by the hardware during `regcache_sync=
()`, leading to lost EQ settings after resume.
- [High] Data race on `NAU8360_R9D_PEQ_CTL` corrupts hardware register acce=
ss during concurrent PEQ operations.
- [High] Uninitialized variable `data_count` evaluated conditionally in `na=
u8360_reply_from_dsp`.
- [Medium] Inappropriate use of `GFP_DMA` exhausts restricted physical memo=
ry zones unnecessarily.
--

commit c79b1a5383d9c9de05c582b2ab0b28a3410dbb34
Author: Neo Chang <YLCHANG2@nuvoton.com>

ASoC: codecs: nau8360: Add support for NAU83G60 amplifier

This commit adds support for the Nuvoton NAU83G60 audio codec. The NAU83G60
is a stereo 30W+30W smart amplifier with an integrated low-latency Advanced
Audio DSP.

> --- /dev/null
> +++ b/sound/soc/codecs/nau8360-dsp.c
[ ... ]
> +static int nau8360_reply_from_dsp(struct snd_soc_component *component,
> +	const struct nau8360_cmd_info *cmd_info, int data_size,
> +	void *data, unsigned short dsp_addr)
> +{
[ ... ]
> +	frag_payload_len =3D frag_len - 1;
> +	if (cmd_info->msg_param)
> +		data_count =3D data_size;
> +
> +	for (i =3D 0; i < frag_payload_len; i++) {
> +		ret =3D regmap_read(nau8360->regmap, dsp_addr, &payload);
> +		if (ret) {
> +			dev_err(dev, "failed to read payload of dsp");
> +			goto err;
> +		}
> +
> +		if (cmd_info->msg_param) {
> +			if (data_count >=3D NAU8360_DSP_DATA_BYTE) {
> +				*data_buf++ =3D payload;
> +				data_count -=3D NAU8360_DSP_DATA_BYTE;
> +				payload_read(dev, payload);
> +			} else {
> +				for (j =3D 0; j < NAU8360_DSP_DATA_BYTE; j++) {
> +					((u8 *)data_buf)[j] =3D (payload >> (j * 8)) & 0xff;
> +					data_count--;
> +					if (data_count <=3D 0)
> +						break;
> +				}

Is it possible for this loop to write past the end of the destination buffe=
r?
If the DSP hardware sends more payload words than requested, data_count cou=
ld
drop to 0 or below before entering the else block. The loop writes 1 byte o=
ut
of bounds before checking if data_count <=3D 0, potentially causing a stack
buffer overflow.

> +				payload_read(dev, payload);
> +				break;
> +			}
> +		} else {
> +			*data_buf =3D payload;
> +			payload_read(dev, payload);
> +		}
> +	}
> +
> +	/* check the reply length same as request */
> +	if (data_count && (cmd_info->cmd_id =3D=3D NAU8360_DSP_CMD_GET_KCS_RSLT=
S ||
> +			cmd_info->cmd_id =3D=3D NAU8360_DSP_CMD_GET_KCS_SETUP)) {

Could data_count be uninitialized here? If cmd_info->msg_param is false,
data_count is never assigned, yet it is evaluated in this condition. This
could result in undefined behavior and trigger panics from dynamic analysis
tools.

> --- /dev/null
> +++ b/sound/soc/codecs/nau8360.c
[ ... ]
> +static int nau8360_peq_coeff_get(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *cp =3D snd_kcontrol_chip(kcontrol);
> +	struct soc_bytes_ext *params =3D (void *)kcontrol->private_value;
> +	int i, value, reg =3D nau8360_peq_regaddr(kcontrol->id.name);
> +	u16 *val =3D (u16 *)ucontrol->value.bytes.data;
> +
> +	if (reg < 0)
> +		return -EIO;
> +
> +	snd_soc_component_update_bits(cp, NAU8360_R9D_PEQ_CTL, NAU8360_HW1_MEM_=
TEST,
> +		NAU8360_HW1_MEM_TEST);
> +	for (i =3D 0; i < params->max / sizeof(u16); i++) {
> +		value =3D snd_soc_component_read(cp, reg + i);
> +		*(val + i) =3D cpu_to_be16(value);
> +	}
> +	snd_soc_component_update_bits(cp, NAU8360_R9D_PEQ_CTL, NAU8360_HW1_MEM_=
TEST, 0);

Can concurrent access to the PEQ registers corrupt hardware state? ALSA .get
and .put callbacks for SND_SOC_BYTES_EXT controls can be executed concurren=
tly
by multiple userspace threads. Toggling NAU8360_HW1_MEM_TEST without an
internal driver lock might allow one thread to clear the bit while another =
is
still reading or writing, leading to silent data corruption.

> +
> +	return 0;
> +}
> +
> +static int nau8360_peq_coeff_put(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *cp =3D snd_kcontrol_chip(kcontrol);
> +	struct soc_bytes_ext *params =3D (void *)kcontrol->private_value;
> +	int i, ret, reg =3D nau8360_peq_regaddr(kcontrol->id.name);
> +	__be16 *data;
> +
> +	if (reg < 0) {
> +		ret =3D -EIO;
> +		goto err;
> +	}
> +	data =3D kmemdup(ucontrol->value.bytes.data, params->max, GFP_KERNEL | =
GFP_DMA);

Is the use of GFP_DMA necessary here? The allocated memory appears to be us=
ed
only sequentially by the CPU to byte-swap words before passing them to
snd_soc_component_write, and is never accessed by a hardware DMA controller.
Using GFP_DMA unnecessarily taxes the highly constrained DMA memory zone,
which can lead to spurious allocation failures.

> +	if (!data) {
> +		ret =3D -ENOMEM;
> +		goto err;
> +	}
> +
> +	snd_soc_component_update_bits(cp, NAU8360_R9D_PEQ_CTL, NAU8360_HW1_MEM_=
TEST,
> +		NAU8360_HW1_MEM_TEST);
> +	for (i =3D 0; i < params->max / sizeof(u16); i++)
> +		snd_soc_component_write(cp, reg + i, be16_to_cpu(*(data + i)));
> +	snd_soc_component_update_bits(cp, NAU8360_R9D_PEQ_CTL, NAU8360_HW1_MEM_=
TEST, 0);
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

Does this check allow a time-of-check to time-of-use race condition? This
check occurs outside of any lock before initiating the DSP switch. If two
threads write the same value concurrently, both could bypass the check and
execute nau8360_dsp_switch. This could result in duplicate execution of
snd_soc_dapm_new_controls and snd_soc_dapm_add_routes, potentially corrupti=
ng
the ALSA DAPM widget lists.

> +
> +	if (snd_soc_dapm_get_bias_level(dapm) > SND_SOC_BIAS_STANDBY) {
> +		dev_err(nau8360->dev, "changing path is not allowed during playback");
> +		ret =3D -EINVAL;
> +		goto err;
> +	}
> +
> +	ret =3D nau8360_dsp_switch(component, dsp_en);
> +	if (ret)
> +		goto err;
> +
> +	ret =3D snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
> +	if (ret < 0)
> +		goto err;
> +
> +	nau8360->dsp_enable =3D dsp_en;
> +
> +done:
> +	return ret;
> +err:
> +	nau8360_dsp_switch(component, !dsp_en);

Could this error handler cause severe playback disruption? If the component=
 is
actively playing audio, the code aborts the mux change and jumps to err, but
then unconditionally forces the DSP into the state opposite to what the user
requested, ignoring the actual current state.

> +	return ret;
> +}
[ ... ]
> +static int nau8360_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx=
_mask,
> +	unsigned int rx_mask, int slots, int slot_width)
> +{
[ ... ]
> +	if (tx_mask) {
> +		for (i =3D 0; i < NAU8360_TDM_TXN; i++) {
> +			func_slot =3D nau8360->tdm_tx_func_slot[i];
> +			if (!(tx_mask & BIT(func_slot))) {
> +				dev_warn(cp->dev, "TX %s mapped to slot %d, but disabled by tx_mask!=
",
> +					nau8360_tx_func_names[i], func_slot);
> +				continue;
> +			}
> +
> +			if (tx_slot_used & BIT(func_slot)) {
> +				dev_err(cp->dev, "TX %s slot %d collision!",
> +					nau8360_tx_func_names[i], func_slot);
> +				return -EINVAL;
> +			}

Will this logic always fail for typical TDM configurations? The
tdm_tx_func_slot array is allocated with devm_kzalloc, so all 8 TX functions
default to slot 0. When a machine driver calls snd_soc_dai_set_tdm_slot to
enable slot 0, the first function marks slot 0 as used, and the second
function immediately triggers this collision error.

> +
> +			tx_slot_used |=3D BIT(func_slot);
> +		}
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

Are the PEQ coefficients ignored by the hardware during this regcache_sync?
The hardware requires the NAU8360_HW1_MEM_TEST bit in NAU8360_R9D_PEQ_CTL to
be set before writing to the PEQ coefficient registers. Because that control
register is marked as volatile, it is excluded from the cache, so the test =
bit
remains inactive (0) while regcache_sync blindly writes the cached PEQ valu=
es,
leaving the PEQ RAM uninitialized after resume.

> +	/* disable Sense at standby */
> +	snd_soc_dapm_disable_pin(nau8360->dapm, "Sense");
> +	snd_soc_dapm_sync(nau8360->dapm);
> +
> +	regmap_update_bits(regmap, NAU8360_R90_HW2_CTL0, NAU8360_HW2_STALL, 0);
> +	nau8360_dsp_software_reset(component);
> +	if (nau8360->dsp_enable) {
> +		nau8360_dsp_enable(regmap, true);
> +		/* loading DSP firmware */
> +		ret =3D nau8360_dsp_reinit(component);

Could this create a system-wide deadlock hazard during resume? The
nau8360_dsp_reinit function synchronously calls request_firmware. If the
filesystem (or block device) is not fully resumed yet, the firmware loader
will block indefinitely, while the filesystem cannot resume because the
suspend/resume sequence is blocked by the driver.

> +		if (ret) {
> +			nau8360_dsp_enable(regmap, false);
> +			dev_err(nau8360->dev, "can't enable DSP (%d)", ret);
> +			goto err;
> +		}
> +	}
> +
> +	return 0;
> +err:
> +	return ret;
> +}
[ ... ]
> +static const struct regmap_config nau8360_regmap_config =3D {
> +	.reg_bits =3D NAU8360_REG_ADDR_LEN,
> +	.val_bits =3D NAU8360_REG_DATA_LEN,

Does this configuration truncate 32-bit DSP register reads to 16 bits?
NAU8360_REG_DATA_LEN is 16. Even though the custom nau8360_reg_read callback
successfully reads 32-bit data for DSP addresses, the regmap core will mask
the returned value using map->format.val_mask (which is 0xFFFF). This
truncates the upper 16 bits of responses like the idle pattern 0xf4f3f2f1,
causing initialization loops to always time out and fail.

> +
> +	.max_register =3D NAU8360_REG_MAX,
> +	.readable_reg =3D nau8360_readable_reg,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518024704.1186=
13-1-YLCHANG2@nuvoton.com?part=3D2

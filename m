Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BED21E5B88
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782786956; cv=none; b=jO91ANINkS1b9yRwtabxgwyWEaCOG+GMPTJio2Z/yfh/wdCYJHmHmRiEotXBEC/iDbQ8KJqUBwJ9CMvBzJw/DpGHgpdx67yNERqmfBZhQC6yYJb0axSgRaUuE5KANXNsHXpkU4hJrpTT3z24uG1RZw/7Z2hv9gXvUfLNOdPsbD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782786956; c=relaxed/simple;
	bh=JDm80PARaz8qhdcMsEM8DQ6kPwWmZTJalHdXNJIbWok=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FO+O8tiNHZPb7z7r9WepTxdwVE4wYQyKYT07lsPBFOzd9DlE1dgXa6ECyj163y0rpM1OXKuvnM3z//mv4vbrhZQMXrX21I+7jd9TS4Ra0LUcHSgkwZxexpfr52ItbY8HRZ/bOYAriqlXSYyhof9sMou/Vag48ZmPvjFHnK3FGZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=big3inVH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="big3inVH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82CB91F000E9;
	Tue, 30 Jun 2026 02:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782786954;
	bh=DN51B/0E7mV8Fc4Y4R2TuXGaqK4Y7q8R6WUEeKr+3h4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=big3inVHqqvpDToRUwpIDlGEYkQG6HUHDbcVsfQ/r8WAD/nYucqotnLy7pnyriKWZ
	 1LAHIGiTVCbPwCi6mw4grifKvC0biuPvY2SAlJQv7hNU8d9XIRwrZRrXAa4b/rj7MQ
	 YNXAcdqZNmyDQYoJwbHTjOMQheacO6Vu726uyIuwbLv2Kf61lo9l1uMnYZluOtPgv7
	 ltv/4XXJOk+Trm7zbX7+N4LtlpDD7/znj3F47D8lmZdN4eQk6/705bW0Jr8iVhxs4l
	 KX7AJnOcwv4zyy1wYMaIySCwQRgatSPA8iDYEbTTezmKHP7HJetRdh79/WWh0sc28E
	 zPGeHubZINixQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neo Chang" <YLCHANG2@nuvoton.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260630021510.821919-3-YLCHANG2@nuvoton.com>
References: <20260630021510.821919-1-YLCHANG2@nuvoton.com>
 <20260630021510.821919-3-YLCHANG2@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 02:35:54 +0000
Message-Id: <20260630023554.82CB91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Asynchronous firmware loading via request_firmware_nowait() causes=
 a Use-After-Free when the device is unbound.
- [High] Missing NULL check on strstr() result causes a kernel panic if the=
 ALSA control name is truncated by an ASoC prefix.
- [Medium] device_property_read_string() always returns the first array ele=
ment, causing all DSP cores to use identical firmware.
- [Medium] Mathematical invalidity of TDM TX byte offsets for PDM Loopback =
when changing channel length.
- [Medium] Concurrent hardware state corruption due to missing locking arou=
nd DSP protocol communication during system resume.
- [Medium] Race condition between nau8360_anc_put() and nau8360_dac_mux_put=
_enum() leads to inconsistent PEQ band configuration.
- [Low] The DSP KCS setup result is retrieved from hardware but its value i=
s completely ignored, masking configuration failures.
--

commit 90fa475e6f47a06dabf426d4caf28ef96fe5ed05
Author: Neo Chang <YLCHANG2@nuvoton.com>

ASoC: codecs: nau8360: Add support for NAU83G60 amplifier

Add support for the Nuvoton NAU83G60 audio codec. The NAU83G60 is a
stereo 30W+30W smart amplifier with an integrated low-latency
Advanced Audio DSP.

> diff --git a/sound/soc/codecs/nau8360-dsp.c b/sound/soc/codecs/nau8360-ds=
p.c
> index 0000000000000..d0483805607d4 100644
> --- /dev/null
> +++ b/sound/soc/codecs/nau8360-dsp.c
[ ... ]
> @@ -310,6 +310,23 @@ static void nau8360_dsp_fw_cb(const struct firmware =
*fw, void *context)
>  {
>  	struct nau8360_dsp_ctx *dsp_ctx =3D context;
>  	struct snd_soc_component *cp =3D dsp_ctx->cp;
>  	struct nau8360 *nau8360 =3D snd_soc_component_get_drvdata(cp);

[Severity: High]
Can this sequence allow a use-after-free if the device is unbound?

If a user unbinds the I2C device (e.g., via sysfs) while the background
firmware worker is still pending, the nau8360 struct and the component are
freed via devres. When the firmware callback eventually runs, it attempts to
dereference the freed cp pointer and acquires a lock in the freed nau8360
struct.

It looks like the I2C driver lacks a .remove callback, meaning there is no
synchronization point to wait for or cancel the asynchronous firmware worker
before device resources are reclaimed.

[ ... ]
> @@ -341,6 +358,10 @@ static int nau8360_dsp_chan_kcs_setup(struct snd_soc=
_component *cp,
>  	struct device *dev =3D cp->dev;
>  	int ret, status =3D 0;
> =20
>  	ret =3D nau8360_dsp_get_cmd_put(cp, dsp_addr,
>  			NAU8360_DSP_CMD_GET_FRAME_STATUS, &status);

[Severity: Medium]
Could this unlocked I2C command to the DSP cause hardware state corruption
during system resume?

During system resume, the PM thread resets the DSP and calls
nau8360_dsp_chan_kcs_setup(), which interacts with the DSP via
nau8360_dsp_get_cmd_put(). The PM thread executes these commands without
holding nau8360->lock.

If a background firmware loading worker from a previous request was
suspended and resumes simultaneously (or is running on another CPU), its
locked DSP communications will interleave with the unlocked ones from the
PM thread, destroying the expected DSP I2C fragment protocol.

[ ... ]
> @@ -481,6 +502,10 @@ static int nau8360_dsp_kcs_setup(struct snd_soc_comp=
onent *cp, int offset, int s
>  		addr_offset +=3D data_len;
>  		data_rem -=3D data_len;
> =20
>  		/* checking KCS result */
>  		ret =3D nau8360_dsp_exec_command(cp, NAU8360_DSP_CMD_GET_KCS_RSLTS,
>  			0, NAU8360_DSP_DATA_BYTE, NULL,
>  			NAU8360_DSP_DATA_BYTE, &kcs_rst, dsp_addr);
>  		if (ret)
>  			return ret;

[Severity: Low]
Is the DSP KCS setup result retrieved from hardware but its value completely
ignored?

While the I2C transaction success is verified via the return value, the
actual hardware response stored in kcs_rst is never checked. Does this
silently mask algorithmic configuration failures in the DSP?

> diff --git a/sound/soc/codecs/nau8360.c b/sound/soc/codecs/nau8360.c
> index 0000000000000..f4dc351a4030c 100644
> --- /dev/null
> +++ b/sound/soc/codecs/nau8360.c
[ ... ]
> @@ -288,6 +288,14 @@ static int nau8360_anc_put(struct snd_kcontrol *kcon=
trol,
>  	if (ret !=3D 1)
>  		return ret;
> =20
>  	nau8360->anc_enable =3D ucontrol->value.integer.value[0];
>  	if (nau8360_dsp_active(cp))
>  		value =3D nau8360->anc_enable ? NAU8360_PEQ_BAND_15 : NAU8360_PEQ_BAND=
_12;
>  	regmap_update_bits(nau8360->regmap, NAU8360_R9D_PEQ_CTL, NAU8360_PEQ_BA=
ND_MASK,
>  		value << NAU8360_PEQ_BAND_SFT);

[Severity: Medium]
Could a Time-Of-Check to Time-Of-Use race condition occur between
nau8360_anc_put() and nau8360_dac_mux_put_enum() that leads to an
inconsistent PEQ band configuration?

nau8360_anc_put() modifies nau8360->anc_enable and reads
nau8360_dsp_active() without holding a driver-specific lock.
Concurrently, nau8360_dac_mux_put_enum() updates the DAC path
(changing the result of nau8360_dsp_active()) and calls
nau8360_dsp_switch(), which reads nau8360->anc_enable locklessly.

Both execute under ALSA's controls_rwsem read lock, allowing concurrent
execution by two userspace threads. nau8360_anc_put() might calculate a tar=
get
register value based on the DSP being active, but before it writes to the
hardware, nau8360_dac_mux_put_enum() could disable the DSP. This leaves the
NAU8360_R9D_PEQ_CTL register with a value appropriate for an enabled DSP,
even though the DSP path is disabled.

[ ... ]
> @@ -375,6 +383,9 @@ static inline int nau8360_peq_regaddr(const char *id_=
name)
>  	int reg, band_num, dsp_addr =3D NAU8360_DSP_ADDR_BYNAME(id_name);
>  	char *band =3D strstr(id_name, "BIQ");
> =20
>  	if (kstrtoint((band + 3), 10, &band_num))

[Severity: High]
Can strstr() return NULL here and cause a kernel panic when its result is
dereferenced?

The ASoC subsystem permits machine drivers to apply a sound-name-prefix from
the device tree to control names. If a long prefix causes the control name =
to
exceed the ALSA maximum length of 44 characters, the string will be truncat=
ed.

If truncation removes the "BIQ" substring, strstr() returns NULL. The code
then unconditionally executes pointer arithmetic (band + 3) and dereference=
s it,
which crashes the kernel when unprivileged userspace accesses the affected =
PEQ
control.

[ ... ]
> @@ -439,6 +450,9 @@ static int nau8360_pdm_slot_get(struct snd_kcontrol *=
kcontrol,
>  	struct snd_soc_component *cp =3D snd_kcontrol_chip(kcontrol);
>  	struct soc_enum *e =3D (struct soc_enum *)kcontrol->private_value;
>  	int scale, slot =3D snd_soc_component_read(cp, e->reg);
> =20
>  	compute_slotx_scale(cp, &scale);
>  	slot =3D ((slot >> e->shift_l) & e->mask) / scale;

[Severity: Medium]
Will this return a mutated, invalid slot index to userspace if the TDM chan=
nel
length changes dynamically?

Because the PDM Loopback TX slots (PDM_L and PDM_R) are handled independent=
ly
and do not exist in the tdm_tx_func_slot cache array, nau8360_tdm_apply()
fails to update their hardware offsets. When nau8360_pdm_slot_get() divides
the stale byte offset by the new channel scale, it calculates an invalid va=
lue.

[ ... ]
> @@ -660,6 +674,13 @@ static void nau8360_tdm_apply(struct snd_soc_compone=
nt *cp, int slot_scale)
>  	struct nau8360 *nau8360 =3D snd_soc_component_get_drvdata(cp);
>  	int i, chan_tx;
> =20
>  	for (i =3D 0; i < NAU8360_TDM_TXN; i++) {
>  		if (nau8360->tdm_tx_func_slot[i] =3D=3D TDM_SLOT_NONE)
>  			continue;
> =20
>  		/* compute the slot location in bytes according to slot/chan width */
>  		chan_tx =3D slot_scale * nau8360->tdm_tx_func_slot[i];
>  		nau8360_set_tdm_tx_slot(cp, i, chan_tx);
>  	}

[Severity: Medium]
Does this code incorrectly ignore PDM slots when recalculating byte offsets
for TDM TX slots?

The loop iterates over standard TX slots but omits PDM slots because they a=
re
absent from the iteration. The PDM slots are left with stale byte offsets t=
hat
no longer align with the new width boundaries, which corrupts the TDM strea=
m.

[ ... ]
> @@ -2404,6 +2425,10 @@ static int nau8360_read_device_properties(struct n=
au8360 *nau8360)
>  		return -EINVAL;
>  	}
> =20
>  	for (i =3D 0; i < NAU8360_DSP_FW_NUM; i++) {
>  		ret =3D device_property_read_string(dev, "firmware-name",
>  			&firmware);

[Severity: Medium]
Does device_property_read_string() always return the first array element
in this loop?

During device initialization, the loop uses device_property_read_string()
instead of device_property_read_string_array() to extract strings from an
array property. Since it simply fetches the first string of the array
regardless of the loop index, all iterations process the exact same firmware
name, causing both DSP cores to be loaded with the firmware intended only
for the first core.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630021510.8219=
19-1-YLCHANG2@nuvoton.com?part=3D2

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EEA346A02
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 19:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366709; cv=none; b=sDA0vW5zn+lBRJ2J6zHFwvCXLdRT8vHD5uOCtp/m+XqedSzZwO1hWWjIbQP5Xs9kksySjH2fNyIWiWzLsPKVAqsCyQedMt/0FPrMGKfin9eAPbHmgWsfFO530nrT7BvMAT/vAniYvLRKk3yAzMi6UGD0zlMC4bvaausJyXM0xi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366709; c=relaxed/simple;
	bh=cfijCjbCqmM2tQGwnopCikQ43DXn4YBVUJp8mRFtTrA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y0qE40+MKdi+wKyO+Tc/mpO06TFO5kQRCp+LHI+y/gqPh2RQLhqsL5fxoCMAIkucpXIZ1MO+e4l8ouJZy3W9NYTwMfJwwoHavv+7IKHVxxtvEOsMF1+ztxpFKvO6AD586V1XjSLLius3QSRCU7UUEcIjOtvCD8XUfsAx0zEVeno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kEFmno+P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kEFmno+P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90641F000E9;
	Mon,  6 Jul 2026 19:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783366708;
	bh=FAK5qfkwpxxOOW4AvMtMf5cGWvXiBMhNgdLVrOs/jXs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kEFmno+PIMcUlrlnLMwJJzoK7FZNIEr8tpsLXl/RrlIP5u6XIf7OeIKqZqOH+t1Ub
	 4F+eVNUGzAawT7sCrPkEqLhtn2/zb9nVZqBavUkbStMW1jAoQkOBRiW1cRav44dcy5
	 55YzLs0KdB5mwa+yNJc89DkGYXhWp/8sksfXq0yA6iiwhiAUhDOV6PxSRKMN5XN2Xs
	 r7l3h9Gd3HRBqhJR6nzwiLDL0IfGK+Fh0hhGXpKONxscqKHAczn3hFdYVieVNydVE5
	 ioWvlny3moltT94t5f+J/tTJcbM8o38iKREKa6VKlMaU23WMC2QQ6HVipIm2xXy2jB
	 vPJipq4YdeGCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] ASoC: codecs: wcd9378: add TX/capture codec driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260706192229.144137-4-jorijnvdgraaf@catcrafts.net>
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
 <20260706192229.144137-4-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 19:38:26 +0000
Message-Id: <20260706193827.D90641F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Modifying a static global array during probe prevents multiple dev=
ice instances from working correctly.
- [High] `pm_runtime_enable()` is called after `component_master_add_with_m=
atch()`, causing component probe to fail synchronously.
- [High] Missing bounds check in `wcd9378_tx_mode_put()` allows out-of-boun=
ds enum values to be written and retrieved.
- [High] Inconsistent SoundWire bus clock scaling calculation between `wcd9=
378_bus_config()` and `wcd9378_swr_clk_indicate()`.
- [High] Destroying `micb_lock` in the component unbind callback leads to a=
 use-after-destroy upon component re-bind.
- [Medium] Off-by-one error when calculating the SoundWire channel count ca=
uses incorrect bandwidth allocation.
- [Medium] Missing High-Pass Filter (HPF) init pulse configuration for ADC2=
 when routed via SmartJACK.
- [Medium] Concurrent ALSA control puts cause read-modify-write data races =
on shared driver channel maps.
- [Medium] Using asynchronous `pm_runtime_put()` in `wcd9378_unbind()` caus=
es a race condition where the TX SoundWire slave device may not be properly=
 suspended before removal.
--

commit 336c5ad4fab99f2ac788ce17fc541b077bfc53c9
Author: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Subject: ASoC: codecs: wcd9378: add TX/capture codec driver

This patch adds the TX/capture driver for the Qualcomm WCD9378 audio codec
over SoundWire. It introduces analog core configuration and SDCA-style=20
function blocks for SmartMIC and SmartJACK sequencers.

> diff --git a/sound/soc/codecs/wcd9378-sdw.c b/sound/soc/codecs/wcd9378-sd=
w.c
> --- a/sound/soc/codecs/wcd9378-sdw.c
> +++ b/sound/soc/codecs/wcd9378-sdw.c
[ ... ]
> +int wcd9378_sdw_hw_params(struct wcd9378_sdw_priv *wcd,
> +			  struct snd_pcm_substream *substream,
> +			  struct snd_pcm_hw_params *params,
> +			  struct snd_soc_dai *dai)
> +{
> +	struct sdw_port_config port_config[WCD9378_MAX_SWR_PORTS];
> +	unsigned long ch_mask;
> +	int i, j;
> +
> +	wcd->sconfig.ch_count =3D 1;

[Severity: Medium]
Does initializing the channel count to 1 here cause an off-by-one error?
It looks like if there are two active channels, the count will become 3,
which might lead to overallocating SoundWire bus bandwidth.

[ ... ]
> +static int wcd9378_bus_config(struct sdw_slave *slave,
> +			      struct sdw_bus_params *params)
> +{
> +	u8 scale;
> +
> +	switch (params->curr_dr_freq) {
> +	case 4800000:
> +		scale =3D WCD9378_SWRS_CLK_SCALE_DIV4;
> +		break;
> +	case 9600000:
> +	default:
> +		scale =3D WCD9378_SWRS_CLK_SCALE_DIV2;
> +		break;
> +	}

[Severity: High]
Is there a calculation mismatch between wcd9378_bus_config() and=20
wcd9378_swr_clk_indicate()?

Here, a 9.6MHz double-rate frequency gets WCD9378_SWRS_CLK_SCALE_DIV2.
However, in wcd9378_swr_clk_indicate() in wcd9378.c, the bus clock is=20
calculated by dividing the DR frequency by 2, resulting in 4.8MHz. That=20
function then evaluates 4800000 < 9600000 and assigns=20
WCD9378_SWRS_CLK_SCALE_DIV4 instead.=20

Could this stall the sequencer if the configurations conflict?

[ ... ]
> +static int wcd9378_sdw_probe(struct sdw_slave *pdev,
> +			     const struct sdw_device_id *id)
> +{
[ ... ]
> +	if (wcd->is_tx) {
> +		pdev->prop.source_ports =3D GENMASK(WCD9378_MAX_TX_SWR_PORTS, 1);
> +		pdev->prop.src_dpn_prop =3D wcd9378_dpn_prop;
> +		wcd->ch_info =3D &wcd9378_sdw_tx_ch_info[0];
> +
> +		for (i =3D 0; i < master_ch_mask_size; i++)
> +			wcd->ch_info[i].master_ch_mask =3D WCD9378_SWRM_CH_MASK(master_ch_mas=
k[i]);

[Severity: High]
Will this loop permanently modify the global static array wcd9378_sdw_tx_ch=
_info?
Since the master_ch_mask is written directly to the shared array, probing a=
=20
second instance of this codec could overwrite the configuration for all act=
ive
devices.

> diff --git a/sound/soc/codecs/wcd9378.c b/sound/soc/codecs/wcd9378.c
> --- a/sound/soc/codecs/wcd9378.c
> +++ b/sound/soc/codecs/wcd9378.c
[ ... ]
> +static const struct wcd9378_smp_fn wcd9378_smp_jack_adc2 =3D {
> +	.usage_reg =3D WCD9378_SMP_JACK_IT31_USAGE,
> +	.micb_reg =3D WCD9378_SMP_JACK_IT31_MICB,
> +	.req_reg =3D WCD9378_SMP_JACK_PDE34_REQ_PS,
> +	.act_reg =3D WCD9378_SMP_JACK_PDE34_ACT_PS,
> +};

[Severity: Medium]
Should this struct also include the hpf_reg and hpf_mask fields?
When ADC2 is fed from AMIC2 via SmartJACK, the missing filter configuration
means the sequencer enable path will read zeroes, skipping the
WCD9378_ANA_TX_CH2_HPF2_INIT pulse and potentially leaving a DC offset.

[ ... ]
> +static int wcd9378_connect_port(struct wcd9378_sdw_priv *wcd, u8 port_id=
x,
> +				u8 ch_id, bool enable)
> +{
[ ... ]
> +	if (enable) {
> +		port_config->ch_mask |=3D ch_mask;
> +		wcd->master_channel_map[mstr_port_num] |=3D mstr_ch_mask;
> +	} else {
> +		port_config->ch_mask &=3D ~ch_mask;
> +		wcd->master_channel_map[mstr_port_num] &=3D ~mstr_ch_mask;
> +	}

[Severity: Medium]
Can concurrent ALSA control operations corrupt the channel masks?
Since wcd9378_set_swr_port() is reachable via ALSA put callbacks, multiple
userspace threads toggling switches might cause a read-modify-write data
race on port_config->ch_mask and wcd->master_channel_map.

[ ... ]
> +static int wcd9378_tx_mode_put(struct snd_kcontrol *kcontrol,
> +			       struct snd_ctl_elem_value *ucontrol)
> +{
[ ... ]
> +	u32 mode_val =3D ucontrol->value.enumerated.item[0];
> +
> +	if (mode_val =3D=3D wcd9378->tx_mode[adc])
> +		return 0;
> +
> +	wcd9378->tx_mode[adc] =3D mode_val;

[Severity: High]
Could this store an out-of-bounds enum value?
Without a check verifying that mode_val is less than ARRAY_SIZE(tx_mode_mux=
_text),
userspace can write an invalid integer here. This value is later exposed via
wcd9378_tx_mode_get(), which might crash userspace audio servers when used =
as
an array index.

[ ... ]
> +static int wcd9378_soc_codec_probe(struct snd_soc_component *component)
> +{
[ ... ]
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret < 0)
> +		return ret;

[Severity: High]
Will this pm_runtime_resume_and_get() call fail with -EACCES?
It looks like component_master_add_with_match() in wcd9378_probe() triggers
the component bind synchronously if all slaves are present, which in turn
calls wcd9378_soc_codec_probe() here. Because pm_runtime_enable() hasn't
been called yet in the master probe, the disable depth is still > 0,
causing the resume to abort audio initialization.

[ ... ]
> +static void wcd9378_unbind(struct device *dev)
> +{
> +	struct wcd9378_priv *wcd9378 =3D dev_get_drvdata(dev);
> +
> +	snd_soc_unregister_component(dev);
> +	pm_runtime_put(wcd9378->txdev);

[Severity: Medium]
Should this be pm_runtime_put_sync() instead?
Using the asynchronous pm_runtime_put() queues a suspend operation that mig=
ht
be cancelled immediately when the driver core calls pm_runtime_disable() up=
on
device removal, leaving the TX SoundWire slave device powered on.

> +	device_link_remove(dev, wcd9378->txdev);
> +	device_link_remove(dev, wcd9378->rxdev);
> +	device_link_remove(wcd9378->rxdev, wcd9378->txdev);
> +	component_unbind_all(dev, wcd9378);
> +	mutex_destroy(&wcd9378->micb_lock);

[Severity: High]
Does destroying micb_lock here prevent a successful re-bind?
The component framework allows unbinding and rebinding without fully removi=
ng
the master platform device. Since mutex_init() is only called in wcd9378_pr=
obe(),
a subsequent wcd9378_bind() will leave the destroyed mutex uninitialized, l=
eading
to undefined behavior or a crash when wcd9378_micbias_control() tries to lo=
ck it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706192229.1441=
37-1-jorijnvdgraaf@catcrafts.net?part=3D3

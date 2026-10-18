Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F253F58DC
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 06:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304594; cv=none; b=W6AxenlqF9oGhie6ErdpXDFm2h1JDbfsz1NdZQ4swT3EJqvpkMSRZNE+x8adaRcXdkvDaKjcrBFFf9cnVGf4pR550FjFon1Cmf14djdg+CEaNMujw3EPOLfNr91br+atm/Oe4uArPKmC9Wsgy7GB2bZnJ6Ru/Q+SaetaXVrOiG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304594; c=relaxed/simple;
	bh=VIB0jsDsA4pes9xbX9J0M2u+l9ve4Zv6qmy0CwHMxvc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=FTM527/of1Cz7bgfBOawzd4GgXlbvZExN0GsUwb2MdxV2FEuNL5FQiUqvpy8kQ6LRekqxb7FZC7Ck97po/wOi4ZbF2zqmi3HqUu5I9lTpPIw5mOiHNSfPHhVGn59k62L7Rneb1bE8CTyX2791G6XyBLmKlhhTtbiE7TIPQ5nbD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hD9uWPzw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hD9uWPzw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40EA1F000C4;
	Sun, 18 Oct 2026 06:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792304592;
	bh=2cUVikTx0oc+WGNepxIF0Mi9mTleGM16CKoi2IT/HBQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hD9uWPzw0mfN3LGVUgWPQr5s6kKcIyO6tMW1bGlDZtEBQJBjasQYegHM9u6W4LtRF
	 1R3KlalqRbSXlVdHcdqhINfVmbYUEXR5U8GL1iQrQVBLp2ARF0SEe35DDsT9Ld0mAN
	 SAd1BKT97OJsaLxAc3zrdJRsIHjpvpEnxuS90gFbzwINhTW2sD4S/mmQt0LwIDZT2L
	 QbgT/g9KRZHcYOhGWhr1sTsgd2bWQp8ikgH/m1wOceMIl0tm57MKldX9bhDhUUsEgu
	 yrelPLwpmat5ZD+NHjRTBvyTRq+8bEESfv1iLHgnc3tQg9aT1dfR3sAvQjnEyHRXTZ
	 RfAokNxPd+Rhg==
Message-ID: <sashiko-outbox-175986@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/21] ASoC: apple: Add macaudio machine driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261018-macaudio-v3-8-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
 <20261018-macaudio-v3-8-abdff7741dea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 06:23:12 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [Critical] ASoC: apple: macaudio: wrong drvdata and teardown order in rem=
ove()
- [High] ASoC: apple: macaudio: ABBA deadlock in macaudio_vlimit_update()
- [High] ASoC: apple: macaudio: static macaudio_card mutated across probes
- [High] ASoC: apple: macaudio: atomic Primary FE fails with nonatomic spea=
ker BE
- [Medium] ASoC: apple: macaudio: OF node reference leaks in macaudio_parse=
_of()
- [Medium] ASoC: apple: macaudio: TDM idle mode skipped in macaudio_be_assi=
gn_tdm()
- [Medium] ASoC: apple: macaudio: race with cancel_delayed_work() on timeou=
t work
--

commit 56eeabc9bf8ef8e9b2a3eb1ec213300f3ed1ab23
Author: Martin Povi=C5=A1er <povik+lin@cutebit.org>

ASoC: apple: Add macaudio machine driver

This commit adds an ASoC machine driver for Apple Silicon Macs to manage
DPCM routing between MCA I2S frontends/backends, speaker arrays, speaker
sense capture, and headset jack codecs.

> diff --git a/sound/soc/apple/macaudio.c b/sound/soc/apple/macaudio.c
> new file mode 100644
> index 0000000000000..b8e58c9a676f8
> --- /dev/null
> +++ b/sound/soc/apple/macaudio.c
> @@ -0,0 +1,1715 @@

[ ... ]

> +static struct snd_soc_dai_link macaudio_fe_links[] =3D {
> +	{
> +		.name =3D "Primary",
> +		.stream_name =3D "Primary",
> +		.dynamic =3D 1,
> +		.dpcm_merged_rate =3D 1,
> +		.dpcm_merged_chan =3D 1,
> +		.dpcm_merged_format =3D 1,
> +		.dai_fmt =3D MACAUDIO_DAI_FMT,
> +		SND_SOC_DAILINK_REG(primary),
> +	},
> +	{
> +		.name =3D "Secondary",
> +		.stream_name =3D "Secondary",
> +		.dynamic =3D 1,
> +		.dpcm_merged_rate =3D 1,
> +		.dpcm_merged_chan =3D 1,
> +		.dpcm_merged_format =3D 1,
> +		.dai_fmt =3D MACAUDIO_DAI_FMT,
> +		.playback_only =3D 1,
> +		.nonatomic =3D 1,
> +		SND_SOC_DAILINK_REG(secondary),
> +	},

[Severity: High]
Should the Primary frontend link in macaudio_fe_links[] (and the headphone
backend links in macaudio_parse_of()) also set .nonatomic =3D 1?

In macaudio_dapm_routes[], both Primary and Secondary are routed to both
Speaker Playback Mux (where Primary is the default selection at index 0)
and Headphone Playback Mux. In macaudio_parse_of(), speaker backend links
set link->nonatomic =3D 1, while headphone backend links have
link->nonatomic =3D 0.

When Primary (atomic) is routed to a speaker backend (nonatomic),
dpcm_be_connect() in sound/soc/soc-pcm.c rejects the connection with
-EINVAL because an atomic frontend cannot connect to a nonatomic backend:

sound/soc/soc-pcm.c:dpcm_be_connect() {
	...
	if (be_substream->pcm->nonatomic && !fe_substream->pcm->nonatomic) {
		dev_err(be->dev, "FE is atomic but BE is nonatomic, invalid configuration=
\n");
		return -EINVAL;
	}
	if (!be_substream->pcm->nonatomic && fe_substream->pcm->nonatomic) {
		be_substream->pcm->nonatomic =3D 1;
	}
	...
}

Furthermore, if Secondary (nonatomic) is ever routed to Headphone Playback
Mux, dpcm_be_connect() mutates the headphone backend PCM to nonatomic =3D 1,
causing subsequent attempts to route Primary to headphones to also fail
with -EINVAL.

[ ... ]

> +static void macaudio_vlimit_update(struct macaudio_snd_data *ma, bool ta=
ke_rwsem)
> +{
> +	bool unlock =3D true;
> +	const char *reason;
> +
> +	/* Do nothing if there is no safety configured */
> +	if (!ma->has_safety)
> +		return;
> +
> +	/* Check that the control has been pinged within the timeout */
> +	if (ma->speaker_lock_remain <=3D 0) {
> +		reason =3D "Lock timeout";
> +		unlock =3D false;
> +	}
> +
> +	/*
> +	 * If this has been called from either of the safety interlock
> +	 * workqueues, the core API has not taken controls_rwsem for us.
> +	 * Take the write semaphore since macaudio_vlimit_unlock writes
> +	 * to the kcontrols.
> +	 */
> +	if (take_rwsem)
> +		down_write(&ma->card->snd_card->controls_rwsem);

[Severity: High]
Can taking controls_rwsem here while holding ma->volume_lock_mutex cause an
AB-BA deadlock with macaudio_slk_put()?

When lock_update_work or lock_timeout_work runs,
macaudio_vlimit_enable_timeout(), macaudio_vlimit_disable_timeout(), and
macaudio_vlimit_timeout_work() first acquire ma->volume_lock_mutex via
guard(mutex)(&ma->volume_lock_mutex) and then call
macaudio_vlimit_update(ma, true), which calls
down_write(&ma->card->snd_card->controls_rwsem):

  volume_lock_mutex -> controls_rwsem

Conversely, when userspace writes to the Speaker Volume Unlock control,
snd_ctl_elem_write() in sound/core/control.c acquires
down_write(&card->controls_rwsem) before invoking macaudio_slk_put(), which
then acquires guard(mutex)(&ma->volume_lock_mutex):

  controls_rwsem -> volume_lock_mutex

If a userspace control write races with either work item, will the two
threads deadlock against each other?

> +
> +	if (unlock !=3D ma->speaker_volume_unlocked) {
> +		if (unlock) {
> +			dev_info(ma->card->dev, "Speaker volumes unlocked\n");
> +		} else  {
> +			dev_info(ma->card->dev, "Speaker volumes locked: %s\n", reason);
> +			ma->speaker_volume_was_locked =3D true;
> +		}
> +
> +		macaudio_vlimit_unlock(ma, unlock);
> +		ma->speaker_volume_unlocked =3D unlock;
> +		snd_ctl_notify(ma->card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE,
> +			       &ma->speaker_lock_kctl->id);
> +	}
> +
> +	if (take_rwsem)
> +		up_write(&ma->card->snd_card->controls_rwsem);
> +}
> +
> +static void macaudio_vlimit_enable_timeout(struct macaudio_snd_data *ma)
> +{
> +	guard(mutex)(&ma->volume_lock_mutex);
> +
> +	if (ma->speaker_lock_timeout_enabled) {
> +		return;
> +	}
> +
> +	if (ma->speaker_lock_remain > 0) {
> +		ma->speaker_lock_timeout =3D ktime_add(ktime_get(), ma->speaker_lock_r=
emain);
> +		schedule_delayed_work(&ma->lock_timeout_work,
> +				      usecs_to_jiffies(ktime_to_us(ma->speaker_lock_remain)));
> +		dev_dbg(ma->card->dev, "Enabling volume limit timeout: %ld us left\n",
> +			(long)ktime_to_us(ma->speaker_lock_remain));
> +	}
> +
> +	macaudio_vlimit_update(ma, true);
> +
> +	ma->speaker_lock_timeout_enabled =3D true;
> +}
> +
> +static void macaudio_vlimit_disable_timeout(struct macaudio_snd_data *ma)
> +{
> +	ktime_t now;
> +
> +	guard(mutex)(&ma->volume_lock_mutex);
> +
> +	if (!ma->speaker_lock_timeout_enabled) {
> +		return;
> +	}
> +
> +	now =3D ktime_get();
> +
> +	cancel_delayed_work(&ma->lock_timeout_work);
> +
> +	if (ktime_after(now, ma->speaker_lock_timeout))
> +		ma->speaker_lock_remain =3D 0;
> +	else if (ma->speaker_lock_remain > 0)
> +		ma->speaker_lock_remain =3D ktime_sub(ma->speaker_lock_timeout, now);
> +
> +	dev_dbg(ma->card->dev, "Disabling volume limit timeout: %ld us left\n",
> +		(long)ktime_to_us(ma->speaker_lock_remain));
> +
> +	macaudio_vlimit_update(ma, true);
> +
> +	ma->speaker_lock_timeout_enabled =3D false;
> +}
> +
> +static void macaudio_vlimit_timeout_work(struct work_struct *wrk)
> +{
> +	struct macaudio_snd_data *ma =3D container_of(to_delayed_work(wrk),
> +						    struct macaudio_snd_data, lock_timeout_work);
> +
> +	guard(mutex)(&ma->volume_lock_mutex);
> +	ma->speaker_lock_remain =3D 0;
> +	macaudio_vlimit_update(ma, true);
> +}

[Severity: Medium]
What happens if lock_timeout_work fires and macaudio_vlimit_timeout_work()
blocks on ma->volume_lock_mutex just after macaudio_slk_put() or
macaudio_vlimit_disable_timeout() acquires ma->volume_lock_mutex?

Because macaudio_slk_put() and macaudio_vlimit_disable_timeout() use
non-synchronous cancel_delayed_work(&ma->lock_timeout_work) while holding
ma->volume_lock_mutex, cancel_delayed_work() cannot stop a
macaudio_vlimit_timeout_work() instance that has already been dispatched
and is waiting on ma->volume_lock_mutex.

Once macaudio_slk_put() refreshes ma->speaker_lock_remain to
ms_to_ktime(SPEAKER_LOCK_TIMEOUT), reschedules lock_timeout_work, and
releases ma->volume_lock_mutex (or macaudio_vlimit_disable_timeout()
disables the timeout and releases the mutex), the waiting
macaudio_vlimit_timeout_work() will acquire ma->volume_lock_mutex and
unconditionally zero ma->speaker_lock_remain and lock the speaker volumes.

Should macaudio_vlimit_timeout_work() verify that
ma->speaker_lock_timeout_enabled is still true and
ktime_after(ktime_get(), ma->speaker_lock_timeout) before zeroing
ma->speaker_lock_remain?

[ ... ]

> +static int macaudio_parse_of_component(struct device_node *node, int ind=
ex,
> +				struct snd_soc_dai_link_component *comp)
> +{
> +	struct of_phandle_args args;
> +	int ret;
> +
> +	ret =3D of_parse_phandle_with_args(node, "sound-dai", "#sound-dai-cells=
",
> +						index, &args);
> +	if (ret)
> +		return ret;
> +	comp->of_node =3D args.np;
> +	return snd_soc_get_dai_name(&args, &comp->dai_name);
> +}

[ ... ]

> +static int macaudio_parse_of(struct macaudio_snd_data *ma, struct snd_so=
c_card *card)
> +{
> +	struct device_node *codec =3D NULL;
> +	struct device_node *cpu =3D NULL;
> +	struct device_node *np =3D NULL;
> +	struct device_node *platform =3D NULL;
> +	struct snd_soc_dai_link *link =3D NULL;
> +	struct device *dev =3D card->dev;
> +	struct macaudio_link_props *link_props;
> +	int ret, num_links, i;

[ ... ]

> +		for (be_index =3D 0; be_index < num_bes; be_index++) {
> +			/*
> +			 * Set initial link name to be overwritten by a BE-specific
> +			 * name later so that we can use at least use the provisional
> +			 * name in error messages.
> +			 */
> +			link->name =3D link_name;
> +
> +			ret =3D macaudio_parse_of_be_dai_link(card, link, be_index,
> +							    ncodecs_per_cpu, cpu, codec);
> +			if (ret)
> +				goto err_free;
> +
> +			link->nonatomic =3D link_props->is_speakers =3D speakers;
> +			link_props->is_headphones =3D !speakers;
> +
> +			link_props->codecs =3D devm_kcalloc(dev, ncodecs_per_cpu,
> +							  sizeof(struct ma_codec_idle), GFP_KERNEL);
> +			if (!link_props->codecs)
> +				return -ENOMEM;

[ ... ]

> +			/* Steal platform OF reference for use in FE links later */
> +			platform =3D link->cpus->of_node;
> +
> +			link++; link_props++;
> +		}
> +
> +		of_node_put(codec);
> +		of_node_put(cpu);
> +		cpu =3D codec =3D NULL;
> +
> +		num_links +=3D num_bes;
> +	}

[ ... ]

> +err_free:
> +	of_node_put(codec);
> +	of_node_put(cpu);
> +	of_node_put(np);
> +
> +	if (!card->dai_link)
> +		return ret;
> +
> +	for (i =3D 0; i < num_links; i++) {
> +		/*
> +		 * TODO: If we don't go through this path are the references
> +		 * freed inside ASoC?
> +		 */
> +		snd_soc_of_put_dai_link_codecs(&card->dai_link[i]);
> +		snd_soc_of_put_dai_link_cpus(&card->dai_link[i]);
> +	}
> +
> +	return ret;
> +}

[Severity: Medium]
Does macaudio_parse_of() leak device_node references in several paths?

1. If devm_kcalloc() for link_props->codecs fails, macaudio_parse_of()
returns -ENOMEM directly from inside the for_each_available_child_of_node()
loop instead of jumping to err_free, leaking np, cpu, codec, and all
previously acquired DAI link component of_node references.

2. In macaudio_parse_of_component(), comp->of_node =3D args.np is assigned
before calling snd_soc_get_dai_name(&args, &comp->dai_name). In
macaudio_parse_of(), num_links is only incremented by num_bes after the
entire inner for (be_index =3D 0; be_index < num_bes; be_index++) loop
completes. If macaudio_parse_of_be_dai_link() fails (for example when
snd_soc_get_dai_name() returns -EPROBE_DEFER), execution jumps to err_free,
where the cleanup loop only iterates up to num_links and misses any
comp->of_node references already populated in the current child node's BE
links.

3. Regarding the TODO comment in err_free: ASoC core does not release
dai_link->codecs[].of_node or dai_link->cpus[].of_node. If
devm_snd_soc_register_card() fails or when the driver is removed, those
device_node references are never released.

[ ... ]

> +static int macaudio_be_assign_tdm(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_card *card =3D rtd->card;
> +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(card);
> +	struct macaudio_link_props *props =3D &ma->link_props[rtd->dai_link->id=
];
> +	struct snd_soc_dai *dai;
> +	unsigned int mask;
> +	int nslots, ret, i;
> +
> +	if (!props->tdm_mask)
> +		return 0;
> +
> +	mask =3D props->tdm_mask;
> +	nslots =3D __fls(mask) + 1;
> +
> +	if (rtd->dai_link->num_codecs =3D=3D 1) {
> +		ret =3D snd_soc_dai_set_tdm_slot(snd_soc_rtd_to_codec(rtd, 0), mask,
> +					       0, nslots, MACAUDIO_SLOTWIDTH);
> +
> +		/*
> +		 * Headphones get a pass on -ENOTSUPP (see the comment
> +		 * around bclk_ratio value for primary FE).
> +		 */
> +		if (ret =3D=3D -ENOTSUPP && props->is_headphones)
> +			return 0;
> +
> +		return ret;
> +	}
> +
> +	for_each_rtd_codec_dais(rtd, i, dai) {
> +		int slot =3D __ffs(mask);
> +
> +		mask &=3D ~(1 << slot);
> +		ret =3D snd_soc_dai_set_tdm_slot(dai, 1 << slot, 0, nslots,
> +					       MACAUDIO_SLOTWIDTH);
> +		if (ret)
> +			return ret;
> +
> +		if (props->codecs[i].idle_mode) {
> +			ret =3D snd_soc_dai_set_tdm_idle(dai, props->codecs[i].idle_mask,
> +						       0, props->codecs[i].idle_mode, 0);
> +			if (ret) {
> +				dev_err(card->dev, "Failed to set idle props for codec %d\n", i);
> +				return ret;
> +			}
> +
> +		}
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
When rtd->dai_link->num_codecs =3D=3D 1, macaudio_be_assign_tdm() returns e=
arly
after calling snd_soc_dai_set_tdm_slot() without checking
props->codecs[0].idle_mode or calling snd_soc_dai_set_tdm_idle().

On machines where each speaker backend DAI link has a single codec (such as
2 speaker codecs split across 2 CPU BEs), won't this skip applying the
dai-tdm-idle-mode-* and dai-tdm-slot-tx-idle-mask-* properties parsed by
macaudio_get_codec_idle_props()?

[ ... ]

> +static struct snd_soc_card macaudio_card =3D {
> +	.owner =3D THIS_MODULE,
> +	.driver_name =3D "macaudio",
> +	.dapm_widgets =3D macaudio_snd_widgets,
> +	.num_dapm_widgets =3D ARRAY_SIZE(macaudio_snd_widgets),
> +	.dapm_routes =3D macaudio_dapm_routes,
> +	.num_dapm_routes =3D ARRAY_SIZE(macaudio_dapm_routes),
> +	.controls =3D macaudio_controls,
> +	.num_controls =3D ARRAY_SIZE(macaudio_controls),
> +	.probe =3D macaudio_probe,
> +	.late_probe =3D macaudio_late_probe,
> +	.component_chaining =3D true,
> +	.fully_routed =3D true,
> +	.fixup_controls =3D macaudio_fixup_controls,
> +};

[ ... ]

> +static int macaudio_snd_platform_probe(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card;
> +	struct macaudio_snd_data *data;
> +	struct device *dev =3D &pdev->dev;
> +	struct snd_soc_dai_link *link;
> +	const struct of_device_id *of_id;
> +	int ret;
> +	int i;
> +
> +	of_id =3D of_match_device(macaudio_snd_device_id, dev);
> +	if (!of_id)
> +		return -EINVAL;
> +
> +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	card =3D &macaudio_card;
> +	data->card =3D card;
> +
> +	snd_soc_card_set_drvdata(card, data);
> +	dev_set_drvdata(&pdev->dev, data);
> +	mutex_init(&data->volume_lock_mutex);
> +	mutex_init(&data->be_link_mutex);
> +
> +	card->dev =3D dev;
> +
> +	if (of_id->data)
> +		data->cfg =3D of_id->data;
> +	else
> +		data->cfg =3D &macaudio_fallback_cfg;
> +
> +	ret =3D macaudio_parse_of(data, card);
> +	if (ret)
> +		return ret;
> +
> +	/* Remove useless controls */
> +	if (!data->has_speakers) /* No speakers, remove both */
> +		card->num_controls -=3D MACAUDIO_NUM_SPEAKER_CONTROLS;
> +	else if (!data->cfg->safe_vol) /* No safety, remove unlock */
> +		card->num_controls -=3D MACAUDIO_NUM_SPEAKER_LIMIT_CONTROLS;
> +	else /* Speakers with safety, mark us as such */
> +		data->has_safety =3D true;

[Severity: High]
Since macaudio_card is a static struct shared across probe attempts, what
happens if devm_snd_soc_register_card() defers probe (-EPROBE_DEFER) or the
device is unbound and re-probed?

In macaudio_snd_platform_probe(), card->num_controls is decremented in-place
with -=3D without being reset to ARRAY_SIZE(macaudio_controls). Across
repeated deferred probes, card->num_controls will be decremented multiple
times, dropping valid controls or underflowing. For example, on a machine
with speakers and !safe_vol, a second probe attempt will drop the Speaker
Sample Rate control, causing snd_soc_card_get_kcontrol(card, "Speaker Sample
Rate") in macaudio_late_probe() to return NULL and triggering a NULL pointer
dereference when macaudio_dpcm_hw_params() or macaudio_be_hw_free() accesses
&ma->speaker_sample_rate_kctl->id.

Similarly, macaudio_parse_of() assigns a devm-allocated array to
macaudio_card.dai_link; if probe fails after that allocation, devres frees
the array while leaving macaudio_card.dai_link pointing to freed memory if a
subsequent probe jumps to err_free before reallocating card->dai_link.
Embedding struct snd_soc_card inside struct macaudio_snd_data (and
initializing it from a const template on probe) would avoid mutating global
state across probes.

> +
> +	for_each_card_prelinks(card, i, link) {
> +		if (link->no_pcm) {
> +			link->ops =3D &macaudio_be_ops;
> +			link->init =3D macaudio_be_init;
> +			link->exit =3D macaudio_be_exit;
> +		} else {
> +			link->ops =3D &macaudio_fe_ops;
> +			link->init =3D macaudio_fe_init;
> +		}
> +	}
> +
> +	INIT_WORK(&data->lock_update_work, macaudio_vlimit_update_work);
> +	INIT_DELAYED_WORK(&data->lock_timeout_work, macaudio_vlimit_timeout_wor=
k);
> +
> +	return devm_snd_soc_register_card(dev, card);
> +}
> +
> +static void macaudio_snd_platform_remove(struct platform_device *pdev)
> +{
> +	struct macaudio_snd_data *ma =3D dev_get_drvdata(&pdev->dev);
> +
> +	cancel_work_sync(&ma->lock_update_work);
> +	cancel_delayed_work_sync(&ma->lock_timeout_work);
> +}

[Severity: Critical]
Does macaudio_snd_platform_remove() retrieve the wrong pointer from
dev_get_drvdata(&pdev->dev) and cancel the work items in the wrong order
relative to card unregistration?

1. In macaudio_snd_platform_probe(), dev_set_drvdata(&pdev->dev, data) sets
the platform device's drvdata to struct macaudio_snd_data *data, and then
calls devm_snd_soc_register_card(dev, card). Inside snd_soc_register_card()
in sound/soc/soc-core.c, ASoC unconditionally overwrites card->dev's drvdata
with card:

sound/soc/soc-core.c:snd_soc_register_card() {
	...
	dev_set_drvdata(card->dev, card);
	...
}

When macaudio_snd_platform_remove() later calls dev_get_drvdata(&pdev->dev),
it receives struct snd_soc_card * (instead of struct macaudio_snd_data *)
and passes offsets inside macaudio_card to cancel_work_sync() and
cancel_delayed_work_sync().

2. Because the card is registered with devm_snd_soc_register_card(), the
devres release callback that unregisters the card runs after
macaudio_snd_platform_remove() returns. While the card is still registered
(and during PCM teardown in snd_soc_unregister_card()), macaudio_be_trigger=
()
or macaudio_slk_put() can schedule lock_update_work and lock_timeout_work
again after macaudio_snd_platform_remove() has completed, leading to
use-after-free when devres frees struct macaudio_snd_data.

|}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018-macaudio-v=
3-0-abdff7741dea@gmail.com?part=3D8

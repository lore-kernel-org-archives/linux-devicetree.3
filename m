Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D82B1A6822
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 06:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791095067; cv=none; b=WR2GlJq32gEYyH5tCV6Yy8pdvZMhJdT4oQATcnIlFC7xOYOZZhPP7mwBc7Nfo0ByQEG1RnB2nwDQFkDFISpCaTbvEJuNjcXRVJeW0uBvHRbxhzW0icg9w8L11YAJOimrbZ5Q5JvVjrUttix/CB9BuqFyB50v1jAwpDAe8bY+RAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791095067; c=relaxed/simple;
	bh=0M3QdDzasznzU7vzWxRkJNB+1UKySViVcLZibWJipCI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NHmhdYHGMcW4Cfyhd7JkqRdStGolv1ib91I/c1PPUtnaukLaEFg9kG/JNeJ0t5eJYpGbX7v0hO9CsX4o+AOcJtgymbKkqOxU3bNkRCdeWf8PR2rDZyljYwOzIcpnCg2l5RsQS7EDJHdYl04RsE1aZu13f0otjhLknY+BQq4dvhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MA4ZIct9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MA4ZIct9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A460A1F000FF;
	Sun,  4 Oct 2026 06:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791095065;
	bh=qR/n/0ai838kJDtuRnyUoKdvbLQhf72GFKdLjsvItdE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MA4ZIct9VRDGGwntzS8440IwDq1zTzVehtOCWanLzeMoAtIaVBaAXiW9HI13oL9i1
	 LCfcVL4ZXds6m1It1pxkASbWmTHagUmsuCO9OXSMEj6++pByW6+9Q7sEQiXHnMOiZ5
	 dGWE2p+Bo6CfxRxu0Y8P1AR3dpWbe2UUF2en+E/IUMYdwTaw5obonyCg+Mdn17qmY5
	 1Pnd1oDgvnc/Vsuvh2VViL8qAgsaA1O30CNy3Qiyp2PKsWYkcOAxL8qpTZU6ispLQ7
	 OMWSj82UOL20ib3RU4bUMbn1B9SP2+KfhZS8Jur+FqJlaTo0dH55u66ZhJeIhAxfiL
	 FkKDBNEME6FJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/21] ASoC: apple: Add macaudio machine driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261004-macaudio-v2-9-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-9-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 06:24:25 +0000
Message-Id: <20261004062425.A460A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] ALSA: macaudio: UAF in workqueues due to devres and remove cleanup=
 ordering
- [High] ALSA: macaudio: OOB memory read in macaudio_vlimit_unlock due to p=
ointer underflow
- [High] ALSA: macaudio: ABBA deadlock between controls_rwsem and volume_lo=
ck_mutex
- [High] ALSA: macaudio: sleeping in atomic context in macaudio_be_trigger
- [High] ALSA: macaudio: invalid hardware state from mutating params in mac=
audio_dpcm_hw_params
- [Medium] ALSA: macaudio: spurious speaker volume lock due to race conditi=
on in macaudio_slk_put
- [Medium] ALSA: macaudio: OF node reference leak in probe error paths and =
driver unbind
- [Medium] ALSA: macaudio: NULL pointer dereference of DAI widget streams o=
n malformed DT
- [Low] ALSA: macaudio: missing NULL check before pointer dereference in ma=
caudio_vlimit_unlock
- [Low] ALSA: macaudio: data race on ma->bes_active read
--

commit 5727989ecaf382b9e8427180fda0eb828623fffb
Author: Martin Povi=C5=A1er <povik+lin@cutebit.org>

ASoC: apple: Add macaudio machine driver

Apple Silicon Macs have a complex audio subsystem consisting
of an I2S peripheral (MCA) and multiple codecs of various
models and capabilities. Some machines have a basic mono
speaker with hardware downmix, while others have a very
intricate stereo system consisting of multiple codecs and
drivers per L/R channel. Some machines report voice coil
voltage and current information back to the SoC, and others
do not. All machines have a headset jack.

> diff --git a/sound/soc/apple/macaudio.c b/sound/soc/apple/macaudio.c
> index 0000000000000..36a62d88bb18b
> --- /dev/null
> +++ b/sound/soc/apple/macaudio.c
> @@ -0,0 +1,1699 @@
[ ... ]
> +static void macaudio_vlimit_unlock(struct macaudio_snd_data *ma, bool un=
lock)
> +{
> +	int ret, max;
> +	struct snd_kcontrol *kctl;
> +	const char *name =3D volume_control_names[ma->cfg->amp];
> +	int namelen =3D strlen(name);
> +
> +	if (!name) {
> +		WARN_ON_ONCE(1);
> +		return;
> +	}

[Severity: Low]
Does this code dereference name before checking if it is NULL? The call
to strlen(name) happens just before if (!name).

[ ... ]
> +	/* The caller has already taken the rw semaphore as necessary */
> +	list_for_each_entry(kctl, &ma->card.snd_card->controls, list) {
> +		const char *suffix =3D kctl->id.name + strlen(kctl->id.name) - namelen;
> +
> +		if (strncmp(suffix, name, namelen))
> +			continue;

[Severity: High]
Can this arithmetic underflow if the kcontrol name is shorter than
namelen? Since strlen() returns an unsigned size_t, subtracting a
larger namelen would result in a very large positive offset, leading
to an out-of-bounds memory read in strncmp().

[ ... ]
> +static void macaudio_vlimit_update(struct macaudio_snd_data *ma, bool ta=
ke_rwsem)
> +{
[ ... ]
> +	/*
> +	 * If this has been called from either of the safety interlock
> +	 * workqueues, the core API has not taken controls_rwsem for us.
> +	 * Take the write semaphore since macaudio_vlimit_unlock writes
> +	 * to the kcontrols.
> +	 */
> +	if (take_rwsem)
> +		down_write(&ma->card.snd_card->controls_rwsem);

[Severity: High]
Could this lead to an ABBA deadlock? When a user interacts with the
"Speaker Volume Unlock" kcontrol, the ALSA core takes controls_rwsem
before calling macaudio_slk_put(), which then acquires
volume_lock_mutex.

Here, the worker thread macaudio_vlimit_timeout_work acquires
volume_lock_mutex first and then attempts to acquire controls_rwsem
via macaudio_vlimit_update().

[ ... ]
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
Will this blindly zeroize the timeout if it executes concurrently with a
userspace ping? If macaudio_slk_put() is actively updating the timeout
but the worker has already fired and is waiting on volume_lock_mutex,
the non-synchronous cancel_delayed_work() in macaudio_slk_put()
won't stop it. The worker will then wake up, set
ma->speaker_lock_remain =3D 0, and lock the volume.

[ ... ]
> +static void macaudio_vlimit_update_work(struct work_struct *wrk)
> +{
> +	struct macaudio_snd_data *ma =3D container_of(wrk,
> +						    struct macaudio_snd_data, lock_update_work);
> +
> +	if (ma->bes_active)

[Severity: Low]
Is this a data race? ma->bes_active is read here without any locking or
READ_ONCE(), while macaudio_be_trigger() concurrently modifies it.

[ ... ]
> +static int macaudio_parse_of(struct macaudio_snd_data *ma)
> +{
[ ... ]
> +		for (be_index =3D 0; be_index < num_bes; be_index++) {
> +			/*
> +			 * Set initial link name to be overwritten by a BE-specific
> +			 * name later so that we can use at least use the provisional
> +			 * name in error messages.
> +			 */
> +			link->name =3D link_name;
> +
> +			ret =3D macaudio_parse_of_be_dai_link(ma, link, be_index,
> +							    ncodecs_per_cpu, cpu, codec);
> +			if (ret)
> +				goto err_free;
> +
> +			link_props->is_speakers =3D speakers;
> +			link_props->is_headphones =3D !speakers;
> +
> +			link_props->codecs =3D devm_kcalloc(dev, ncodecs_per_cpu,
> +							  sizeof(struct ma_codec_idle), GFP_KERNEL);
> +			if (!link_props->codecs)
> +				return -ENOMEM;

[Severity: Medium]
Does this directly return without cleaning up the OF node references?
Bypassing the err_free label here skips the cleanup logic, leaving the
references acquired in macaudio_parse_of_component() leaked.

Additionally, when taking the err_free path from within this loop,
num_links hasn't been incremented yet for the current iteration, so the
nodes for the currently failing link might not be released.

[ ... ]
> +static int macaudio_dpcm_hw_params(struct snd_pcm_substream *substream,
> +				   struct snd_pcm_hw_params *params)
> +{
[ ... ]
> +	if (props->is_sense) {
> +		/*
> +		 * The sense FE is opened exclusively by speakersafetyd in blocking
> +		 * mode. At the time of opening, this sample rate may be 0 if the
> +		 * speaker BE is not running. This does not matter, as speakersafetyd
> +		 * only cares about the active sample rate exported to the virtual
> +		 * sample rate kcontrol below.
> +		 */
> +		rate->min =3D rate->max =3D cpu_dai->symmetric_rate;
> +		return 0;
> +	}
> +
> +	/* Speakers BE */
> +	if (props->is_speakers) {
> +		if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE) {
> +			/* Sense PCM: keep the existing BE rate (0 if not already running) */
> +			rate->min =3D rate->max =3D cpu_dai->symmetric_rate;
> +
> +			return 0;
> +		}

[Severity: High]
Does setting rate->min =3D rate->max =3D cpu_dai->symmetric_rate mutate
the hardware parameters structure directly during the hw_params phase?
If the speaker BE is not running and symmetric_rate is 0, this forces
the rate to 0 Hz, which may cause downstream hardware drivers to reject
it with -EINVAL and break the stream initialization. Should constraints
like this be applied in the startup callback instead?

[ ... ]
> +static int macaudio_be_trigger(struct snd_pcm_substream *substream, int =
cmd)
> +{
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
> +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(rtd->card);
> +	struct macaudio_link_props *props =3D &ma->link_props[rtd->dai_link->id=
];
> +
> +	guard(mutex)(&ma->be_link_mutex);

[Severity: High]
Can this attempt to acquire a sleeping lock while in an atomic context?
Because these DAI links are not marked with nonatomic =3D 1, the ASoC and
ALSA cores invoke the .trigger callback with the PCM substream spinlock
held and IRQs disabled.

[ ... ]
> +static int macaudio_add_backend_dai_route(struct snd_soc_card *card, str=
uct snd_soc_dai *dai,
> +					  bool is_speakers)
> +{
> +	struct snd_soc_dapm_route routes[2];
> +	struct snd_soc_dapm_route *r;
> +	int nroutes =3D 0;
> +	int ret;
> +
> +	memset(routes, 0, sizeof(routes));
> +
> +	dev_dbg(card->dev, "adding routes for '%s'\n", dai->name);
> +
> +	r =3D &routes[nroutes++];
> +	if (is_speakers)
> +		r->source =3D "Speaker Playback";
> +	else
> +		r->source =3D "Headphone Playback";
> +	r->sink =3D dai->stream[SNDRV_PCM_STREAM_PLAYBACK].widget->name;

[Severity: Medium]
What happens if the configured device tree specifies a capture-only DAI?
Without verifying that the playback stream widget is non-NULL before
dereferencing its name, a malformed device tree could trigger a kernel
panic during device probe.

[ ... ]
> +static int macaudio_slk_put(struct snd_kcontrol *kcontrol, struct snd_ct=
l_elem_value *uvalue)
> +{
> +	struct snd_soc_card *card =3D snd_kcontrol_chip(kcontrol);
> +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(card);
> +
> +	guard(mutex)(&ma->volume_lock_mutex);

[Severity: High]
Could this result in an ABBA deadlock? As mentioned earlier, this function
is called with controls_rwsem held by the core, and takes
volume_lock_mutex. The background worker acquires volume_lock_mutex
first and then attempts to acquire controls_rwsem.

[ ... ]
> +	cancel_delayed_work(&ma->lock_timeout_work);
> +
> +	ma->speaker_lock_remain =3D ms_to_ktime(SPEAKER_LOCK_TIMEOUT);
> +	ma->speaker_lock_timeout =3D ktime_add(ktime_get(), ma->speaker_lock_re=
main);
> +	macaudio_vlimit_update(ma, false);

[Severity: Medium]
Will this non-synchronous cancel_delayed_work() fail to stop the worker
if it is already running and waiting on volume_lock_mutex? This ties into
the race condition discussed in macaudio_vlimit_timeout_work().

[ ... ]
> +static int macaudio_snd_platform_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	INIT_WORK(&data->lock_update_work, macaudio_vlimit_update_work);
> +	INIT_DELAYED_WORK(&data->lock_timeout_work, macaudio_vlimit_timeout_wor=
k);
> +
> +	return devm_snd_soc_register_card(dev, card);
> +}

[Severity: High]
Does registering the card via devres create a use-after-free window
during unbind? The devres cleanup (including unregistering the card)
runs after macaudio_snd_platform_remove() completes. This leaves a
window where ALSA callbacks can still fire and re-queue workitems on
the workqueues that were cancelled during remove.

[ ... ]
> +static void macaudio_snd_platform_remove(struct platform_device *pdev)
> +{
> +	struct macaudio_snd_data *ma =3D dev_get_drvdata(&pdev->dev);
> +
> +	cancel_work_sync(&ma->lock_update_work);
> +	cancel_delayed_work_sync(&ma->lock_timeout_work);
> +}

[Severity: High]
Since the sound card is still fully active here (due to devres), can the
work items get re-queued by ongoing ALSA callbacks right after these sync
cancels? When devres later frees macaudio_snd_data, any re-queued work
would execute on freed memory.

[Severity: Medium]
Does this remove handler also leak the OF node references acquired during
probe? It appears to omit the necessary calls to
snd_soc_of_put_dai_link_codecs() and snd_soc_of_put_dai_link_cpus().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004-macaudio-v=
2-0-7b47ed6335a8@gmail.com?part=3D9

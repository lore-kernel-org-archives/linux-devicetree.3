Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32BA2CCC6
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 05:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881273; cv=none; b=KSCVIpuHACnoU5VE9LfoYTGkKHDM7x5YkhPeA6rzbHuz8EE8ntAvfJOw3dsHG2zK5U5ReNdUo2usxnC4+3ttJHCAcBo2yPzTK866dFh+4s+O/ApV71WNUzkGVDlhsGXYih0jVOYHYXDlpeQhreQHW7WeZ3YDlcZeaY3B+cc26NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881273; c=relaxed/simple;
	bh=dUcbBfWgBmFHjxCyDpJXty6mzOtGNYIWMPVt1T0xVc0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WA4xuFC946XJJgKat4gpgezDH4WkHKa021JBeWaiXgFQ5VtJ7j6ePnSYWhySetE6Fx+zOPFFgVP3+j6ZR0Axi2ar4DFE0cvLLlqec4TgpzbjMb2DOPHv69DAtQuJUt1/cFIZp5zgSknfzReEo9Lf1+lRmkKCXXC1qHNgPqbfvYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LDHXIyu9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LDHXIyu9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 214F01F000FF;
	Sun, 20 Sep 2026 05:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789881271;
	bh=zKhgyvgvT8Hj92ZwJHpjyhLJDJnziZ97YB50fOcPUAg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LDHXIyu9TQCmiXs8a8cUgAAOvP90uK3WvAdEt70hV8Qv4hJx/iWOeLpx8ajFt7fG5
	 rq94KJarEJvd6gm0R7b6IlJEzrd/dFUDmLCKv3idxPef9RiNDCDhk31JNJ2ac7yjOC
	 cS9WPyXKvwScWn5pB6vxxctm6tyIOOr0JldKYmAn8RbZRfYR5urMVWzK8Tnxr1WDM9
	 bIp6Qw/BOV+OmnAL58QpLXV+YlVOjPLtBAMLL1kpt86M20Uy3RUbu9nN/OqkqpbOkD
	 xSTOSV4MRdi3y8YnnSp+jkNifTI1/n+UTBRxcTcD1yRtZYnq4+Il6OyW5UW3N/93o2
	 OOBJfBgRopRvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 16/28] ASoC: apple: Add macaudio machine driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260920-macaudio-v1-16-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-16-741cc20a74e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 05:14:30 +0000
Message-Id: <20260920051431.214F01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] macaudio: UAF due to missing lock_update_work cancellation on driv=
er unbind
- [High] macaudio: list corruption traversing snd_card->controls without co=
ntrols_rwsem
- [Medium] macaudio: spurious volume lock due to timeout workqueue race
- [Medium] macaudio: missing mutex lock in macaudio_slk_unlock causes data =
race
- [Medium] macaudio: non-atomic bitwise operations on bes_active causes los=
t triggers
- [Medium] macaudio: OF node reference leaks on error paths and driver unbi=
nd
- [Medium] macaudio: TOCTOU race on speaker_volume_was_locked outside mutex
- [Low] macaudio: bitwise truncation of u64 bes_active on 32-bit COMPILE_TE=
ST
--

commit c31fe439d1e39b1d15e314167ccc57d6863e8d4b
Author: Martin Povi=C5=A1er <povik+lin@cutebit.org>

    ASoC: apple: Add macaudio machine driver
   =20
    Apple Silicon Macs have a complex audio subsystem consisting
    of an I2S peripheral (MCA) and multiple codecs of various
    models and capabilities. Some machines have a basic mono
    speaker with hardware downmix, while others have a very
    intricate stereo system consisting of multiple codecs and
    drivers per L/R channel. Some machines report voice coil
    voltage and current information back to the SoC, and others
    do not. All machines have a headset jack.

> diff --git a/sound/soc/apple/macaudio.c b/sound/soc/apple/macaudio.c
> new file mode 100644
> --- /dev/null
> +++ b/sound/soc/apple/macaudio.c
[ ... ]
> +static void macaudio_vlimit_update(struct macaudio_snd_data *ma)
> +{
> +	int i;
> +	bool unlock =3D true;
> +	struct snd_kcontrol *kctl;
> +	const char *reason;
[ ... ]
> +	/* Check that *every* limited control is locked by the same owner */
> +	list_for_each_entry(kctl, &ma->card.snd_card->controls, list) {

[Severity: High]
Can this list traversal be corrupted by concurrent modifications?

The ALSA sound card controls list (&ma->card.snd_card->controls) is iterated
here, but neither this driver nor snd_soc_limit_volume() acquire the ALSA
controls_rwsem lock.

Since macaudio_vlimit_update() is called asynchronously from background
workqueues, unprivileged userspace could concurrently add or remove controls
(e.g., via SNDRV_CTL_IOCTL_ELEM_ADD) under a write lock, mutating the list
while it is being traversed here.

> +		if (!snd_soc_control_matches(kctl, volume_control_names[ma->cfg->amp]))
> +			continue;
[ ... ]
> +static void macaudio_vlimit_timeout_work(struct work_struct *wrk)
> +{
> +	struct macaudio_snd_data *ma =3D container_of(to_delayed_work(wrk),
> +						    struct macaudio_snd_data, lock_timeout_work);
> +
> +	mutex_lock(&ma->volume_lock_mutex);
> +
> +	ma->speaker_lock_remain =3D 0;
> +	macaudio_vlimit_update(ma);

[Severity: Medium]
Could this worker blindly override a valid ping from userspace?

If macaudio_slk_put() executes concurrently, it calls cancel_delayed_work()
while holding ma->volume_lock_mutex. If the timeout worker is already waiti=
ng
for the mutex, cancel_delayed_work() returns false.

Once macaudio_slk_put() extends the timeout and releases the mutex, the blo=
cked
worker thread will immediately acquire it and blindly zero the timeout here,
overriding the extension and locking the volume prematurely.

> +
> +	mutex_unlock(&ma->volume_lock_mutex);
> +}
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

[Severity: Medium]
Does this cleanup path skip partially populated links?

If macaudio_parse_of_be_dai_link() fails, the code jumps to err_free.
However, num_links is only incremented after the be_index loop finishes.
This means the cleanup loop below will fail to drop references for the
codecs and cpus that were already parsed in the current, incomplete batch.

Additionally, macaudio_snd_platform_remove() doesn't seem to release any
of these OF node references when the driver is unbound.

> +
> +			link_props->is_speakers =3D speakers;
[ ... ]
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
[ ... ]
> +static int macaudio_be_trigger(struct snd_pcm_substream *substream, int =
cmd)
> +{
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
> +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(rtd->card);
> +	struct macaudio_link_props *props =3D &ma->link_props[rtd->dai_link->id=
];
> +
> +	if (props->is_speakers && substream->stream =3D=3D SNDRV_PCM_STREAM_PLA=
YBACK) {
> +		switch (cmd) {
> +		case SNDRV_PCM_TRIGGER_START:
> +		case SNDRV_PCM_TRIGGER_RESUME:
> +		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +			ma->bes_active |=3D BIT(rtd->dai_link->id);

[Severity: Medium]
Will these non-atomic bitwise operators drop updates to ma->bes_active?

ALSA DPCM allows different frontend PCMs to concurrently trigger their
respective backend DAI links on different CPUs. Using standard bitwise=20
assignment (|=3D and &=3D ~) creates a read-modify-write data race between=
=20
concurrent triggers, which could cause lost updates.

> +			break;
> +		case SNDRV_PCM_TRIGGER_SUSPEND:
> +		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		case SNDRV_PCM_TRIGGER_STOP:
> +			ma->bes_active &=3D ~BIT(rtd->dai_link->id);

[Severity: Low]
Does this bitwise NOT clear the upper 32 bits of ma->bes_active?

On 32-bit architectures, BIT() evaluates to a 32-bit unsigned long, making
the inverted mask also 32-bit. When implicitly zero-extended to u64 for the
assignment, it would effectively clear bits 32-63 of ma->bes_active.

While this platform is 64-bit, this truncation could still happen when the
driver is built under COMPILE_TEST. Using BIT_ULL() would prevent this.

> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +
> +		schedule_work(&ma->lock_update_work);

[Severity: High]
Does this code leave ma->lock_update_work unmanaged before devres teardown?

During card unregistration, any running PCM streams are stopped, which invo=
kes
macaudio_be_trigger() with SNDRV_PCM_TRIGGER_STOP. That trigger forcefully
queues the lock_update_work.

If we don't call cancel_work_sync(&ma->lock_update_work) in the device remo=
ve
hook, the queued work might execute after the devres-managed ma structure h=
as
already been freed, which would lead to a use-after-free.

> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static int macaudio_slk_put(struct snd_kcontrol *kcontrol, struct snd_ct=
l_elem_value *uvalue)
> +{
> +	struct snd_soc_card *card =3D snd_kcontrol_chip(kcontrol);
> +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(card);
> +
> +	if (!ma->speaker_lock_owner)
> +		return -EPERM;
> +
> +	if (uvalue->value.integer.value[0] !=3D SPEAKER_MAGIC_VALUE)
> +		return -EINVAL;
> +
> +	/* Serves as a notification that the lock was lost at some point */
> +	if (ma->speaker_volume_was_locked) {

[Severity: Medium]
Can this check race with the timeout worker?

Since ma->speaker_volume_was_locked is checked and reset before acquiring
the volume_lock_mutex, a background worker could lock the volume and set
this flag to true just after this lockless check finishes.

If that happens, this function will bypass returning -ETIMEDOUT and proceed
to blindly reset the timeout, hiding the timeout event from userspace.

> +		ma->speaker_volume_was_locked =3D false;
> +		return -ETIMEDOUT;
> +	}
> +
> +	mutex_lock(&ma->volume_lock_mutex);
> +
> +	cancel_delayed_work(&ma->lock_timeout_work);
> +
> +	ma->speaker_lock_remain =3D ms_to_ktime(SPEAKER_LOCK_TIMEOUT);
> +	ma->speaker_lock_timeout =3D ktime_add(ktime_get(), ma->speaker_lock_re=
main);
> +	macaudio_vlimit_update(ma);
[ ... ]
> +static void macaudio_slk_unlock(struct snd_kcontrol *kcontrol)
> +{
> +	struct snd_soc_card *card =3D snd_kcontrol_chip(kcontrol);
> +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(card);
> +
> +	ma->speaker_lock_owner =3D NULL;
> +	ma->speaker_lock_timeout =3D 0;
> +	macaudio_vlimit_update(ma);

[Severity: Medium]
Should this block be protected by ma->volume_lock_mutex?

This function modifies shared state (ma->speaker_lock_owner and
ma->speaker_lock_timeout) and calls macaudio_vlimit_update() without
acquiring the mutex. All other functions interacting with this state
(such as macaudio_slk_lock or macaudio_vlimit_timeout_work) rely on this
mutex for synchronization.

> +}
[ ... ]
> +static void macaudio_snd_platform_remove(struct platform_device *pdev)
> +{
> +	struct macaudio_snd_data *ma =3D dev_get_drvdata(&pdev->dev);
> +
> +	cancel_delayed_work_sync(&ma->lock_timeout_work);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920-macaudio-v=
1-0-741cc20a74e5@gmail.com?part=3D16

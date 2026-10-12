Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0926A3F5BEC
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807164; cv=none; b=VDDcrm4VQdvSNyFAkD2lB5S9MTay/fmx0KHBFtOGccDg/IJgF/CqLl/RDrMA271cR0OyQjwJq90kogM6lw1cBj5oguwBHe5/oq7utCbHhRqoDl6EvzxXF0ZKnZ4CPy+XF8OuMfS9TkCphd+zEBiCkYUGNi57ORd/UM6oCdh/W68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807164; c=relaxed/simple;
	bh=eDyzk9UeQucf1cHlCa+ux/ijH7RN3+2SFMt+Q70+b/Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QAfmo4SFPq8d6NbCkjObrr3q5Ek3KJnp6QjyMf6zTJHQcU2iXna/4WDMXh/+uojt4ygrCos0DkVx0WZ83QBFjkO3dalMUCSP2/Izu1t4EBld9+5iKbwLSE6thpIRLAIR3AKLQZmoOkaucXOc723ccXeQzvTl6kUdt2xt3/jfvN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7b7xb7u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7b7xb7u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A301E1F0089B;
	Mon, 12 Oct 2026 12:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791807162;
	bh=2dlAb5l89uG1HTOugjSWcjAVpoIQqO6ZOutgdhkUbOc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H7b7xb7uHZClYQp+fqKCvTw3edb2DDKe742n9Q8SZkmN+TsbL9DkDq47wyfd6Ws/P
	 gxy5rpUzdt3Ad8plb8SzX+RmjcHa4oZSi2QoxNI5gttwqTKGop/EUsLRvANQzzzZT8
	 WjGoLJxf99vS/8VkvXbpEfv1m+wwVsmBe16LrBp7Rg0he/ccgpYgATIOkK092W8wai
	 yUme3VEm6r716EYTeiqmNAXmUADdLFy/RBdX33ZiWWAV0IsnmCrhzqIG6Wf+dWw8GZ
	 o5msLRSSqQ0fJzgr2J1ZYhecNnGbRcpyxRWUPPK04qbwKCkfo7AsDes+IduqJd+Ix0
	 1UjtZMd9qQIPA==
Message-ID: <sashiko-outbox-168071@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] ASoC: airoha: Add support for AN7581 PCM driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261012115408.87066-3-ansuelsmth@gmail.com>
References: <20261012115408.87066-1-ansuelsmth@gmail.com>
 <20261012115408.87066-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 12:12:42 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [High] ASoC: airoha: an7581_pcm_fe_hw_params logic error permanently reje=
cts first stream
- [High] ASoC: airoha: probe unconditionally fails due to IRQF_ONESHOT with=
out thread_fn
- [High] ASoC: airoha: unbounded tx_pos/rx_pos accumulation breaks ALSA poi=
nter tracking
- [High] ASoC: airoha: missing return on constraint failure in startup corr=
upts state
- [High] ASoC: airoha: Use-After-Free of DMA descriptors on driver unbind d=
ue to devres ordering
- [High] ASoC: airoha: Use-After-Free of ALSA runtime due to missing IRQ sy=
nchronization in shutdown
- [High] sound: airoha: missing interrupt status acknowledgment causes IRQ =
storm
- [High] sound: soc: airoha: inverted users check in hw_params breaks all s=
treams
- [High] sound: soc: airoha: early exit in IRQ handler stalls stream
- [Medium] ASoC: airoha: premature return in IRQ handler stalls DMA on unde=
rrun
- [Medium] ALSA: airoha: missing endianness conversion for hardware DMA des=
criptors
- [Medium] ASoC: airoha: incorrect PCM interleaved format advertised for no=
n-interleaved hardware
--

commit d46acbcb8f477a3db86ab3f295bc95f3a191a323
Author: Christian Marangi <ansuelsmth@gmail.com>

ASoC: airoha: Add support for AN7581 PCM driver
   =20
The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
Add an ASoC platform driver for the AN7581 PCM controller configured for
ZSI attached voice chip.

diff --git a/sound/soc/airoha/an7581-pcm.c b/sound/soc/airoha/an7581-pcm.c
new file mode 100644
index 0000000000000..568c11dc7e6b9
--- /dev/null
+++ b/sound/soc/airoha/an7581-pcm.c
@@ -0,0 +1,904 @@
+[ ... ]
> +struct an7581_pcm_desc {
> +	u32 status;
> +	u32 channel_mask;
> +	u32 dma_addr;
> +} __packed;

[Severity: Medium]
Will this work correctly on big-endian architectures? Since the descriptors=
 are
shared with the hardware DMA, using native u32 instead of explicit __le32 m=
eans
the data will be written and read backwards if the kernel is compiled for a
Big Endian target. Should we use __le32 and explicit cpu_to_le32() conversi=
ons?

> +
> +struct an7581_pcm_priv {
[ ... ]
> +static const struct snd_pcm_hardware an7581_pcm_hardware =3D {
> +	.info			=3D SNDRV_PCM_INFO_MMAP |
> +				  SNDRV_PCM_INFO_MMAP_VALID |
> +				  SNDRV_PCM_INFO_INTERLEAVED,
> +	.formats		=3D SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_U16_LE,

[Severity: Medium]
Is it correct to advertise SNDRV_PCM_INFO_INTERLEAVED here?
Later in an7581_pcm_fe_hw_params(), the hardware is configured with a
per-channel memory offset, indicating that the hardware expects a
non-interleaved layout:

	regmap_update_bits(priv->map, AN7581_PCM_CHBFOSR,
			   AN7581_PCM_DESC_CHBF_OFFSET,
			   FIELD_PREP(AN7581_PCM_DESC_CHBF_OFFSET,
				      AN7581_PCM_FRAMES_PER_DESC * bit_width / 8));

If userspace writes interleaved samples as advertised, might the hardware
misinterpret the audio data?

[ ... ]
> +static int an7581_pcm_fe_startup(struct snd_pcm_substream *substream,
> +				 struct snd_soc_dai *dai)
> +{
[ ... ]
> +	ret =3D snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIO=
DS);
> +	if (ret < 0)
> +		dev_err(rtd->card->dev, "snd_pcm_hw_constraint_integer failed\n");
> +
> +	/* Cache stream substream for IRQ handling */
> +	priv->stream[substream->stream] =3D substream;

[Severity: High]
Does this code inadvertently continue execution and modify driver state when
snd_pcm_hw_constraint_integer() fails? By missing a return statement, the
function proceeds to cache the substream pointer and increment priv->users
before returning the error code. Because the startup failed, ALSA will abort
and never call shutdown, permanently leaking the users count and leaving a
dangling substream pointer in priv->stream that could cause a Use-After-Free
during the next interrupt.

[ ... ]
> +static void an7581_pcm_fe_shutdown(struct snd_pcm_substream *substream,
> +				   struct snd_soc_dai *dai)
> +{
[ ... ]
> +	priv->stream[substream->stream] =3D NULL;
> +
> +	usleep_range(10000, 20000);

[Severity: High]
Is it possible for a concurrent interrupt handler to execute here?
By clearing the stream pointer without calling synchronize_irq(), an already
executing handler on another CPU might have already passed the NULL check. =
Once
this function returns, ALSA will free the substream runtime. If the delayed=
 IRQ
handler then resumes, could it dereference the freed runtime pointer?

[ ... ]
> +static int an7581_pcm_fe_hw_params(struct snd_pcm_substream *substream,
> +				   struct snd_pcm_hw_params *params,
> +				   struct snd_soc_dai *dai)
> +{
[ ... ]
> +	mutex_lock(&priv->user_lock);
> +	if (priv->users <=3D 1 &&
> +	    (priv->current_rate !=3D rate ||
> +	     priv->current_channels !=3D channels)) {
> +		dev_err(rtd->card->dev, "playback/capture rates/channels must match in=
 full-duplex mode\n");
> +		mutex_unlock(&priv->user_lock);
> +		return -EBUSY;
> +	}

[Severity: High]
Does this inverted logic unconditionally reject the first stream?
Since an7581_pcm_fe_startup() increments priv->users, it will be exactly 1 =
for
the first stream. The condition priv->users <=3D 1 evaluates to true, and s=
ince
the uninitialized priv->current_rate is 0, it will mismatch the requested r=
ate.
This causes the driver to return -EBUSY immediately, preventing hardware se=
tup.
Should this check be for priv->users > 1 instead?

[ ... ]
> +static snd_pcm_uframes_t an7581_pcm_pointer(struct snd_soc_component *co=
mponent,
> +					    struct snd_pcm_substream *substream)
> +{
[ ... ]
> +	spin_lock_irqsave(&priv->desc_lock, flags);
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		pos =3D bytes_to_frames(runtime, priv->tx_pos);
> +	else
> +		pos =3D bytes_to_frames(runtime, priv->rx_pos);
> +	spin_unlock_irqrestore(&priv->desc_lock, flags);
> +
> +	return pos % runtime->buffer_size;
> +}

[Severity: High]
Could the continuously accumulating tx_pos and rx_pos cause a discontinuous=
 jump
when the 32-bit integers wrap? After accumulating 4GB (which wraps to 0), t=
he
value is almost certainly not an exact multiple of the ALSA buffer_size.
Applying modulo here will cause the ALSA frame pointer to jump backwards
unexpectedly, triggering an XRUN and halting the audio stream. Should
the byte counters be bounded or wrapped explicitly at the buffer boundary
instead?

[ ... ]
> +static irqreturn_t an7581_pcm_irq_handler(int irq, void *data)
> +{
> +	struct snd_pcm_substream *substream;
> +	struct an7581_pcm_priv *priv =3D data;
> +	unsigned long flags;
> +	u32 status, isr =3D 0;
> +
> +	regmap_read(priv->map, AN7581_PCM_ISR, &isr);

[Severity: High]
Does this handler leave the interrupt asserted? After reading the
AN7581_PCM_ISR register, there is no corresponding regmap_write() to clear =
the
asserted status bits. Without a write-1-to-clear acknowledgment, the interr=
upt
line may remain asserted, potentially leading to an unrecoverable interrupt
storm.

> +
> +	/* Scan descriptor on receiving RX desc update interrupt */
> +	if (isr & AN7581_PCM_IMR_RDESC_UPDATE_INT) {
[ ... ]
> +			desc->status |=3D AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA;
> +
> +			if (snd_pcm_capture_hw_avail(runtime) < runtime->period_size)
> +				goto handle_tx;
> +
> +			rx_poll =3D true;
> +		}
> +
> +		if (rx_poll)
> +			regmap_write(priv->map, AN7581_PCM_RPDR, AN7581_PCM_RX_POLLING);
> +	}
> +
> +handle_tx:
> +	/* Scan descriptor on receiving TX desc update interrupt */
> +	if (isr & AN7581_PCM_IMR_TDESC_UPDATE_INT) {
[ ... ]
> +			desc->status |=3D AN7581_PCM_DESC_STATUS_OWNERSHIP_DMA;
> +
> +			if (snd_pcm_playback_hw_avail(runtime) < runtime->period_size)
> +				return IRQ_HANDLED;
> +
> +			tx_poll =3D true;
> +		}

[Severity: High]
Could these early exits abandon completed descriptors and stall the stream?
The loop iterates over descriptors that the hardware has already completed.
If the driver returns early here (or jumps to handle_tx) due to an ALSA
underrun, it breaks out of the loop and skips processing the rest of the
completed descriptors. This leaves them permanently owned by the CPU, stalls
the DMA, and misses the wakeup write to the polling register. Because ALSA
core already handles overruns and underruns safely, shouldn't the driver
always process all completed descriptors without aborting the loop?

[ ... ]
> +static int an7581_pcm_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D devm_request_threaded_irq(dev, irq, an7581_pcm_irq_handler,
> +					NULL, IRQF_ONESHOT, dev_name(dev), priv);
> +	if (ret)
> +		return ret;

[Severity: High]
Is it valid to pass IRQF_ONESHOT with a NULL thread_fn? The core IRQ subsys=
tem
rejects this combination because it doesn't make sense to keep the interrupt
masked for a thread that doesn't exist. This will cause
devm_request_threaded_irq() to unconditionally return -EINVAL, causing probe
to fail every time.

> +
> +	spin_lock_init(&priv->desc_lock);
> +	mutex_init(&priv->user_lock);
> +
[ ... ]
> +	priv->tx_descs =3D dmam_alloc_coherent(dev, sizeof(struct an7581_pcm_de=
sc) *
> +					     AN7581_PCM_TX_DESCRIPTORS, &priv->tx_dma,
> +					     GFP_KERNEL);

[Severity: High]
Could this allocation order lead to a Use-After-Free during driver unbind?
Since devres frees resources in reverse order (LIFO), priv->tx_descs and
priv->rx_descs will be freed before the IRQ is released. Because
an7581_pcm_remove() doesn't call synchronize_irq(), an executing interrupt
handler might access the DMA descriptors after devres has already freed the=
m.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012115408.8706=
6-1-ansuelsmth@gmail.com?part=3D2

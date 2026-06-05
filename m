Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CED40242E
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 11:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658030; cv=none; b=sYi13yWWC4Sr01pBgte2tIMpE/qQpzaQnWpMSH4oSPaIMS3U4kTCN71Ca/xA+c/XLGaOpDGEGGRSjuEKdxyVswzF/36cjAw94D0P8kkXxKYbUje7jLDgjzwfBGJw+r7jwXmbZgqOpQDiewmBzwTU4tpNZtjZZOYJ7XsjniTFfZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658030; c=relaxed/simple;
	bh=2sS2u0QXr1Q7rWajILMNHKgHGPZ7vxseM8nuZyZqOQQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SwkhWMKfqpOfcVGAN9YsUKjYW7620Ypl1h/BBAMFCIh6/339s4HB7Mz3Q3nnSGF9GEyJg8mYRCFRZ73MwR7t4bn2whus51WCE+h3B+kmmckZn/EHupsEn+Clw5QeBKxHYUBog2Qf+6+vWxxFs+OIGu3aMA8eGlqCYbKDkmAiz40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2SU712J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2SU712J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0951E1F00893;
	Fri,  5 Jun 2026 11:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780658027;
	bh=qDeyRIz1D5vmfbVsVMM/TBsIht23Vtk3OkKIuTWrB+E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d2SU712JXm2Cji2XN5CKqkZeY9n6vGPCtlaGn2NAPF09Eu6g4O7vX/6GqXiOtk3OG
	 Xfc5C2uv4Lhgizaw7QaG/BaXLNg7V7Ttpe7jASXqCns6cjKGR0u56y8GOFai2hE7Fk
	 aMLJTlAakkKsv/2WMMg/SLrJOnNbeOfqHRTXzqBWtDAXUxjNQXokqo+Eg93Myl2aYr
	 sQys59KMApu2T8bbH1awhrmozZIlcbaWszxdVHf02x8bAt7utOdLy6mBGbhQiwpFn3
	 adcQb4UqU4cfiHr1CQk9nmfOFWt3WRFRdNdHMal4aQtO4PVw1VuaMd96E/UmGAMJqm
	 VTmOE/WhwxnmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/13] ASoC: qcom: Add QAIF IRQ handling, suspend/resume
 and platform register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harendra Gautam" <harendra.gautam@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260605103739.3557573-13-harendra.gautam@oss.qualcomm.com>
References: <20260605103739.3557573-13-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 11:13:46 +0000
Message-Id: <20260605111347.0951E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:

New issues:
- [Critical] The IRQ handler accesses memory-mapped registers without ensur=
ing that the required device clocks are enabled.
- [Critical] `qaif_platform_pcmops_resume` unconditionally attempts to writ=
e to hardware registers via `regcache_sync` while clocks are disabled.
- [High] Hardcoded DT parsing of the 'iommus' property makes the driver bri=
ttle and violates standard bindings.
- [High] Masking the interrupt clear register write leaves unhandled bits s=
et, causing an infinite IRQ storm.
- [High] The DMA clocks are not properly balanced during system suspend/res=
ume if multiple streams are open.
- [High] `snd_pcm_stop()` is called from the IRQ handler without holding th=
e required ALSA stream lock.
- [High] Unprotected double-read of `substream[stream_dma_idx]` can lead to=
 dereferencing a NULL pointer in the IRQ handler.
- [Medium] Clock enables are leaked if `regcache_sync()` fails during syste=
m resume.

Pre-existing issues:
- [High] The DMA memory is mapped to userspace with a different device poin=
ter than the one used to allocate it.
- [High] Concurrent `.open` and `.close` operations lack locking, leading t=
o data races on `qaif_init_ref_cnt`.
--

commit 79f7f868b0ea8024295676f54c8ca826ce51828f
Author: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

ASoC: qcom: Add QAIF IRQ handling, suspend/resume and platform register

Complete the QAIF PCM platform support by registering the component,
requesting the QAIF interrupt, and handling DMA interrupt events.

> diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platfor=
m.c
> index beebec55222a5..8cf4d68f72b1c 100644
> --- a/sound/soc/qcom/qaif-platform.c
> +++ b/sound/soc/qcom/qaif-platform.c
> @@ -847,3 +847,323 @@ static int qaif_platform_pcmops_mmap(struct snd_soc=
_component *component,
> =20
>  	return snd_pcm_lib_default_mmap(substream, vma);
>  }

[Severity: High]
This is a pre-existing issue, but does qaif_platform_cdc_dma_mmap map the
DMA buffer using the correct device pointer?

The buffer appears to be allocated using dma_alloc_coherent() with the
component device pointer, but qaif_platform_cdc_dma_mmap() maps it using:

return dma_mmap_coherent(substream->pcm->card->dev, vma, ...);

Could passing a different device pointer for mapping violate the DMA API
and cause IOMMU faults on platforms where only the component device is
attached to the SMMU domain?

> +
> +static irqreturn_t qaif_process_dma_irq(struct qaif_drv_data *drvdata,
[ ... ]
> +	mask =3D GENMASK(num_dma-1, 0);
> +	rv =3D regmap_read(drvdata->audio_qaif_map, stat_reg_addr, &reg);
> +	if (rv) {
> +		dev_err(regmap_get_device(drvdata->audio_qaif_map),
> +			"error reading stat reg 0x%x: %d\n", stat_reg_addr, rv);
> +		return IRQ_NONE;
> +	}
> +
> +	regmap_write(drvdata->audio_qaif_map, clr_reg_addr, reg & mask);

[Severity: High]
If the hardware asserts bits outside of the computed mask, will those bits
remain uncleared?

Because the IRQ is level-triggered (IRQF_TRIGGER_HIGH), could failing to
clear all asserted bits cause the interrupt controller to immediately
re-invoke the handler, leading to an interrupt storm and CPU lockup?

> +
> +	for (dma_idx =3D 0; dma_idx < num_dma; dma_idx++) {
> +		stream_dma_idx =3D dma_idx + stream_offset;
> +		if ((reg & BIT(dma_idx)) && substream[stream_dma_idx]) {
> +			stream =3D substream[stream_dma_idx];

[Severity: High]
Is there a risk of a null pointer dereference here due to a time-of-check
to time-of-use race?

If a concurrent close operation locklessly nullifies the substream array
entry between checking substream[stream_dma_idx] and assigning it to stream:

CPU1 (close)
drvdata->aif_substream[data->stream_dma_idx] =3D NULL;

CPU2 (qaif_process_dma_irq)
if ((reg & BIT(dma_idx)) && substream[stream_dma_idx]) {
    stream =3D substream[stream_dma_idx];

Would the handler then pass a NULL stream pointer to snd_pcm_stop()?
Should this use READ_ONCE() or be protected by a lock?

> +			switch (irq) {
> +			case QAIF_IRQ_PERIOD:
> +				snd_pcm_period_elapsed(stream);
> +				ret =3D IRQ_HANDLED;
> +				break;
> +
> +			case QAIF_IRQ_OVERFLOW:
> +			case QAIF_IRQ_UNDERFLOW:
> +				dev_warn_ratelimited(regmap_get_device(drvdata->audio_qaif_map),
> +						     "QAIF DMA xRun\n");
> +				ret =3D IRQ_HANDLED;
> +				break;
> +
> +			case QAIF_IRQ_ERROR:
> +				snd_pcm_stop(stream, SNDRV_PCM_STATE_DISCONNECTED);

[Severity: High]
Can this call to snd_pcm_stop() corrupt the PCM state?

The ALSA core API snd_pcm_stop() manipulates the substream's runtime state
and expects the caller to hold the PCM stream lock.  Could calling it
locklessly from this interrupt handler introduce a data race with
concurrent userspace or ALSA core operations?

Would using the IRQ-safe snd_pcm_stop_xrun() or manually acquiring the lock
be more appropriate here?

[ ... ]
> +static irqreturn_t asoc_platform_qaif_irq(int irq, void *data)
> +{
> +	struct qaif_drv_data *drvdata =3D data;
> +	const struct qaif_variant *v =3D drvdata->variant;
> +	u32 summary_irq_status;
> +	int rv, client;
> +	irqreturn_t ret =3D IRQ_NONE;
> +
> +	rv =3D regmap_read(drvdata->audio_qaif_map,
> +			QAIF_SUMMARY_IRQSTAT_REG(v), &summary_irq_status);

[Severity: Critical]
Is it possible for this MMIO read to trigger a synchronous external abort?

If an interrupt fires (e.g. spurious or shared line activity) while no PCM
streams are active (qaif_init_ref_cnt =3D=3D 0), the hardware clocks might =
be
physically disabled.

Since the handler unconditionally executes regmap_read() on
QAIF_SUMMARY_IRQSTAT_REG, could this unclocked access cause a bus stall
and kernel panic?

[ ... ]
> +static int qaif_platform_pcmops_suspend(struct snd_soc_component *compon=
ent)
> +{
> +	struct qaif_drv_data *drvdata =3D snd_soc_component_get_drvdata(compone=
nt);
> +	struct regmap *map;
> +
> +	map =3D drvdata->audio_qaif_map;
> +
> +	regcache_cache_only(map, true);
> +	regcache_mark_dirty(map);
> +	if (drvdata->qaif_init_ref_cnt > 0) {
> +		clk_disable(drvdata->aud_dma_clk);
> +		clk_disable(drvdata->aud_dma_mem_clk);
> +	}

[Severity: High]
Does this leave the hardware clocks running if multiple streams are active?

If clk_prepare_enable() is called for every new stream, the clock's
reference count is incremented N times for N active streams.

However, qaif_platform_pcmops_suspend() only calls clk_disable() once if
qaif_init_ref_cnt > 0.  If more than one stream was active, wouldn't the
enable count remain at N - 1, keeping the physical hardware clocks running
throughout system suspend?

> +	return 0;
> +}
> +
> +static int qaif_platform_pcmops_resume(struct snd_soc_component *compone=
nt)
> +{
> +	struct qaif_drv_data *drvdata =3D snd_soc_component_get_drvdata(compone=
nt);
> +	struct regmap *map =3D drvdata->audio_qaif_map;
> +	int ret;
> +
> +	if (drvdata->qaif_init_ref_cnt > 0) {
> +		ret =3D clk_enable(drvdata->aud_dma_clk);
> +		if (ret)
> +			return ret;
> +		ret =3D clk_enable(drvdata->aud_dma_mem_clk);
> +		if (ret) {
> +			clk_disable(drvdata->aud_dma_clk);
> +			return ret;
> +		}
> +	}
> +	regcache_cache_only(map, false);
> +	return regcache_sync(map);

[Severity: Critical]
Can this regcache_sync() call cause an unclocked access exception?

If no streams were active before suspend (qaif_init_ref_cnt =3D=3D 0), the
driver skips enabling the clocks.

Because the system suspend callback executed regcache_mark_dirty(map), this
unconditional regcache_sync() attempt will write to the hardware registers.
Could writing to the MMIO registers of a clock-gated IP block cause an
SError and system crash?

[Severity: Medium]
Does this leak the clock enables if regcache_sync() fails?

If regcache_sync(map) returns an error, it fails to call clk_disable() on
the previously enabled aud_dma_clk and aud_dma_mem_clk.

Could transient regmap failures during successive suspend/resume cycles
continuously increment the clock reference counts and prevent the clocks
from ever being turned off?

[ ... ]
> +static const struct snd_soc_component_driver qaif_component_driver =3D {
> +	.name		=3D DRV_NAME,
> +	.open		=3D qaif_platform_pcmops_open,

[Severity: High]
This is a pre-existing issue, but are concurrent calls to
qaif_platform_pcmops_open() and qaif_platform_pcmops_close() safe?

The global drvdata->qaif_init_ref_cnt is modified locklessly in these
functions. Since a single component can expose multiple DAIs and
independent PCMs, could concurrent open and close calls for different PCMs
race on the read-modify-write operations and corrupt the counter?

Could this lead to premature clock disablement during active playback?

[ ... ]
> +static int qaif_parse_smmu_sid(struct platform_device *pdev,
> +				struct qaif_drv_data *drvdata)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	int ret;
> +	u32 sid;
> +
> +	ret =3D of_property_read_u32_index(np, "iommus", 1, &sid);

[Severity: High]
Does hardcoding the DT parsing of the "iommus" property break probe on
platforms with different IOMMU bindings?

By bypassing standard OF parsing APIs (like of_parse_phandle_with_args)
and fetching the SMMU SID at index 1 directly, this assumes a specific
layout.

What happens on platforms where #iommu-cells =3D <2> (where index 1 might be
the ID and index 2 the mask, or index 0 is phandle), or on platforms
without an IOMMU? Will this return a fatal error and completely prevent
audio initialization?

> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to read SMMU SID from iommus property: %d\=
n", ret);
> +		return ret;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605103739.3557=
573-1-harendra.gautam@oss.qualcomm.com?part=3D12

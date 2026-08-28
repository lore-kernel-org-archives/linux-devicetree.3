Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934AB472533
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 15:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787930032; cv=none; b=EgcRdmklyL0gv2JI1F9SJlB9qZp4zLxniDLOxHkVyv2b9nHnlO+Uj8wqqh/an/0P7giKqNkZEoL1asDMR0gLLcPLN9Y5NRSf2FacxGNjGb14NA55chHjL+7fiY+ll/t6hb8nEsOcwHY9emTFsyi7xEs5h2qeZg/ku4kgy+NAlfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787930032; c=relaxed/simple;
	bh=NGvNWwVDiGLX95W+iCcT7aDFsqV1+ZTKlYik7z2PG0U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=awF7TDMLWF0eKUiSXZeDZwqOzlgITh1nP/y/AO8NWn2wsoUqcksuCs1BabuBtJqM5eAcnZHafSEzWEx4yqKazJY64vUttUWJeKYSMvZ0B/rM+2Na7liUu/ecbDaDgWQC236BkZhCg9L6PSTyeFYVs9C32PHq3T2Kfo7lAgw/eJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RbjUKhxh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RbjUKhxh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47AF1F000E9;
	Fri, 28 Aug 2026 15:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787930031;
	bh=DMHj2Kf6poQWbYQ9gH3jGFBDTATpS/stjwW6AsP+yHE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RbjUKhxhf/ywxYduRMeC/kk/K3rrahN1cGcVlNAH9tk/hFs0YXKge+8/H75gZVLje
	 rHfhzMs9UdRuK9HakyL/zn2sTscVZTmzY/U6KmRNOSO7fDDDVgF6Vf07CsIkf6u4SM
	 I4MfoAgH5bzPzabLgh6zpn4cypEPahtl8NrUsgRmddWWaRsrOKzvi2Y9jflDVdnKjd
	 OSldbSLV0dX9LpGDdkbfkDF9s9aC8F/cGoVgA5PSA1VPeaL5QTAKxucVXJHVHOrjPA
	 3Bk6gQJMMu61QPSvDNIpnIvDUCglQ4YpMjGL3aji+XbhFS0TDh9LQPWqdOH4bvfJRw
	 SAEtCYNB6wwuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/9] iio: adc: rzt2h: implement DMA buffer support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmin Tanislav" <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260828145943.2077589-6-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260828145943.2077589-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260828145943.2077589-6-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 15:13:50 +0000
Message-Id: <20260828151350.B47AF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The cyclic DMA buffer read pointer (`period_index`) permanently lo=
ses synchronization with the hardware write pointer if the consumer loop ab=
orts early.
- [Medium] Missing dma_sync_single_for_device() call after CPU accesses non=
-coherent DMA memory.
- [Medium] Kthread will enter a 100% CPU infinite loop if it receives a sig=
nal.
--

commit 39a43c5f71d2917000960d73a8ad0233a9d65f07
Author: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
   =20
    iio: adc: rzt2h: implement DMA buffer support

This commit implements buffered capture using a cyclic DMA transfer into
a kfifo buffer for the RZ/T2H ADC. It allocates a non-coherent DMA buffer
and handles periodic data pushes via a kthread.

> diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
> index 95bcebdc02cb3..d76226375f220 100644
> --- a/drivers/iio/adc/rzt2h_adc.c
> +++ b/drivers/iio/adc/rzt2h_adc.c

[ ... ]

> @@ -151,6 +186,253 @@ static int rzt2h_adc_calibrate(struct rzt2h_adc *ad=
c)
>  	return 0;
>  }
> =20
> +static void rzt2h_adc_push_period(struct iio_dev *indio_dev, u16 *period,
> +				  dma_addr_t addr)
> +{
> +	struct rzt2h_adc *adc =3D iio_priv(indio_dev);
> +	u16 *dst =3D adc->buf;
> +	u16 *src =3D period;
> +
> +	dma_sync_single_for_cpu(adc->dev, addr, adc->dma.period_bytes,
> +				DMA_FROM_DEVICE);
> +
> +	for (unsigned int sample =3D 0; sample < RZT2H_ADC_DMA_PERIOD_SAMPLES; =
sample++) {
> +		for (unsigned int i =3D 0; i < adc->dma.gather_len; i++)
> +			dst[i] =3D src[adc->dma.gather[i]];
> +
> +		src +=3D adc->dma.sample_chans;
> +
> +		iio_push_to_buffers(indio_dev, adc->buf);
> +	}

[Severity: Medium]
Does this code miss a call to dma_sync_single_for_device()?

The DMA API strictly requires that ownership of non-coherent mapped memory
be transferred back to the device after CPU access. Failing to do so
violates the API contract and can lead to the CPU reading stale data due
to speculative prefetches that overwrite the device's DMA data later.

> +}
> +
> +static void rzt2h_adc_advance_period_index(struct rzt2h_adc *adc, unsign=
ed int i)
> +{
> +	adc->dma.period_index +=3D i;
> +	adc->dma.period_index %=3D RZT2H_ADC_DMA_PERIODS;
> +}
> +
> +static void rzt2h_adc_dma_thread_loop(struct iio_dev *indio_dev)
> +{
> +	struct rzt2h_adc *adc =3D iio_priv(indio_dev);
> +	int pending, drop;
> +	dma_addr_t addr;
> +	u16 *period;
> +
> +	pending =3D atomic_xchg(&adc->dma.pending_periods, 0);
> +
> +	if (pending >=3D RZT2H_ADC_DMA_PERIODS) {
> +		drop =3D pending - RZT2H_ADC_DMA_PERIODS + 1;
> +
> +		rzt2h_adc_advance_period_index(adc, drop);
> +		pending -=3D drop;
> +	}
> +
> +	for (unsigned int i =3D 0; i < pending; i++) {
> +		unsigned int backlog =3D atomic_read(&adc->dma.pending_periods) +
> +				       pending - i;
> +
> +		/*
> +		 * Bail if enough new periods have completed since reading the
> +		 * pending_periods that the next period about to be read is at
> +		 * risk of being overwritten.
> +		 */
> +		if (backlog >=3D RZT2H_ADC_DMA_PERIODS)
> +			break;

[Severity: High]
Does breaking early here cause the read and write pointers to permanently
lose synchronization?

Since all pending periods were extracted using atomic_xchg() at the start
of this loop, breaking out without advancing period_index for the skipped
periods or restoring the pending count permanently discards those periods.
The cyclic DMA buffer read pointer (period_index) will permanently lose
synchronization with the hardware write pointer. The consumer kthread will
then continuously read from the wrong offsets in the DMA cyclic buffer,
pushing stale or corrupted data to userspace without recovering.

> +
> +		period =3D adc->dma.buf + adc->dma.period_index *
> +			 RZT2H_ADC_DMA_PERIOD_SAMPLES * adc->dma.sample_chans;
> +		addr =3D adc->dma.addr + adc->dma.period_index *
> +		       adc->dma.period_bytes;
> +
> +		rzt2h_adc_push_period(indio_dev, period, addr);
> +		rzt2h_adc_advance_period_index(adc, 1);
> +	}
> +}
> +
> +static int rzt2h_adc_dma_thread(void *data)
> +{
> +	struct iio_dev *indio_dev =3D data;
> +	struct rzt2h_adc *adc =3D iio_priv(indio_dev);
> +
> +	while (!kthread_should_stop()) {
> +		wait_event_interruptible(adc->dma.wq,
> +					 atomic_read(&adc->dma.pending_periods) ||
> +					 kthread_should_stop());

[Severity: Medium]
Can this kthread spin in an infinite loop consuming 100% CPU if it receives
a signal?

By using wait_event_interruptible(), if a signal is delivered to the
kthread (such as SIGKILL), it will return immediately with -ERESTARTSYS.
Since the thread does not check signal_pending() or clear the signal,
and kthread_should_stop() remains false, the loop will instantly restart,
returning immediately again and spinning forever.

> +
> +		if (kthread_should_stop())
> +			break;
> +
> +		rzt2h_adc_dma_thread_loop(indio_dev);
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828145943.2077=
589-1-cosmin-gabriel.tanislav.xa@renesas.com?part=3D5

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573026;
	b=fEUi4tqpZG6O/VbPuz0zxvaoSu3z+HN2JQWG3Sz7w6u6D669TkjOOp/RkWIGl628PEyy
	 kuIM6mAtd+AKpne67nOyJKOC51ALtOWXPArdwe1uWaKbCwgbBhdpbi63lHzULrTaGdZWy
	 wzeTJzDP0BsIagEhvE4lWkB+3MLX3LX83xAHyHNOag6RdnP1dcYZe+9kK5gZ34JpNaPUL
	 3vO0HBlE7slJ6MA6bhVsKQUIebddvEyJm4rwGfH4Z/Ls93oPpWpHGFaABK64jBQ1aief1
	 nljmMtttv60A4fIggVMSdsSy4vmX9pHRlGX0btTjXQfCFnb4T1BQjniHGr49KARDmwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573026;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JGIdOGckPHfzPo8zvqeRVofg7IdnaeDcECYqZI6o4t8=;
	b=hAiQQssO2c59qqb3rkje8xIpi0L4i/WlS13JmbePE9G92Y/3ESg12/B9WaAepJIGMpov
	 HMCnzTBpynhID+vYpfAOyOFLvxUxiKsHJ8z7UWTvK+h3/6E2ldIMm+r/2CqB0o+9tFEOV
	 BUByGjhRJWmyGcnmU2xyvEPFMl5E+n+eC0hQaZ0nspaBSnha1HdUv2T2PcW3ex2XmGwDG
	 Gw7REEly5Nfuf4RLlZviKPI/SLqtMWnh9L15trYjfhKeyx7+IQM/OGHP2Iq+Ce9cDtfKq
	 MOddofIEvo1kpkKf5eV98NOOIMKi0+npRRyWPr/26y5vXPQbplh/er50uVemq89roXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="COv/iAac";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84072606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=COv/iAac
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA591F000C9;
	Wed, 21 Oct 2026 08:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792573026;
	bh=JGIdOGckPHfzPo8zvqeRVofg7IdnaeDcECYqZI6o4t8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=COv/iAacEZ4+Wpf255JattJm9vSVj9S/Dr11Z1ngYZTe5uf2Yy/OiP95y7kCgnnhK
	 yn3GjJ7XWVPcAbb2DGFoeIw9zHnFlwoXBpMEoEP9hyryDaWKGZK0FsgoJbRm6C4Gay
	 1bPsrSteOsXadqBi2ai3ZweFYYdHEyErH1QB9gOi4o3u+/3kwM64ZDK2HMUOIDEXD9
	 IGtcwA/zdGvYhWZitC29n2ollEIBxQWoPdegSHK+hicqFs4WPzbVzaRmW5v5ByADbw
	 jGZoV3rcIunVJ6rHLAF/LXzhtmISgb7Y17d7YQCNaSOGgi/xGNlj4ErY0efVG/iouJ
	 ep8kzdFG2sxLw==
Message-ID: <sashiko-outbox-179994@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] hwrng: starfive: rework clk/reset teardown order
 for JHB100
Reply-To: sashiko-reviews@lists.linux.dev
To: lianfeng.ouyang <lianfeng.ouyang@starfivetech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261021083712.3032-3-lianfeng.ouyang@starfivetech.com>
References: <20261021083712.3032-1-lianfeng.ouyang@starfivetech.com>
 <20261021083712.3032-3-lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 08:57:05 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] hwrng: starfive: unqueued need_reseed stalls non-blocking starfi=
ve_trng_read()
- [Medium] hwrng: starfive: unbalanced enable_irq() in starfive_trng_init()
--

commit a998deb7a1356bd18fe1c15b59933eacef0ded76
Author: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>

hwrng: starfive: rework clk/reset teardown order for JHB100

This commit reworks clock and reset power-down ordering in the StarFive TRNG
driver to support the JHB100 SoC alongside JH7110. It also updates runtime =
PM
handling, moves SEU-triggered reseeding to a workqueue, and serializes
command execution with a mutex.

> diff --git a/drivers/char/hw_random/jh7110-trng.c b/drivers/char/hw_rando=
m/jh7110-trng.c
> index aee12caab5780..8678b35ecd4a5 100644
> --- a/drivers/char/hw_random/jh7110-trng.c
> +++ b/drivers/char/hw_random/jh7110-trng.c

[ ... ]

> @@ -120,276 +157,496 @@ MODULE_PARM_DESC(autoage, "Auto-reseeding after s=
pecified timer countdowns to 0:
>  				" 0 - disable timer\n"
>  				" other - reload value for internal timer");
> =20
> -static inline int starfive_trng_wait_idle(struct starfive_trng *trng)
> +static bool starfive_trng_idle(struct starfive_trng *trng, bool wait)
>  {
> -	u32 stat;
> +	u32 stat, busy =3D STARFIVE_STAT_RAND_GENERATING | STARFIVE_STAT_RAND_S=
EEDING;
> =20
> -	return readl_relaxed_poll_timeout(trng->base + STARFIVE_STAT, stat,
> -					  !(stat & (STARFIVE_STAT_RAND_GENERATING |
> -						    STARFIVE_STAT_RAND_SEEDING)),
> -					  10, 100000);
> +	if (!wait)
> +		return !(readl_relaxed(trng->base + STARFIVE_STAT) & busy);
> +
> +	return !readl_relaxed_poll_timeout(trng->base + STARFIVE_STAT, stat,
> +					   !(stat & busy),
> +					   10, 100000);
>  }
> =20
> -static inline void starfive_trng_irq_mask_clear(struct starfive_trng *tr=
ng)
> +static void starfive_trng_irq_clear(struct starfive_trng *trng)
>  {
> -	/* clear register: ISTAT */
> -	u32 data =3D readl(trng->base + STARFIVE_ISTAT);
> +	u32 istat =3D readl(trng->base + STARFIVE_ISTAT);
> +
> +	/* Do not lose an LFSR lockup that has not been serviced yet. */
> +	if (istat & STARFIVE_ISTAT_LFSR_LOCKUP)
> +		WRITE_ONCE(trng->need_reseed, true);
> =20
> -	writel(data, trng->base + STARFIVE_ISTAT);
> +	writel(istat, trng->base + STARFIVE_ISTAT);
>  }

[ ... ]

> +static int starfive_trng_init(struct hwrng *rng)
> +{
> +	struct starfive_trng *trng =3D to_trng(rng);
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(trng->dev);
> +	if (ret < 0) {
> +		dev_err(trng->dev, "Failed to wake device for init: %d\n", ret);
> +		return ret;
> +	}
> +
> +	mutex_lock(&trng->lock);
> +
> +	starfive_trng_irq_clear(trng);
> +	starfive_trng_hw_setup(trng);
> +
> +	enable_irq(trng->irq);
> +	writel(STARFIVE_IE_ALL, trng->base + STARFIVE_IE);
> +
> +	ret =3D starfive_trng_reseed(trng);
> +	if (ret) {
> +		writel(0, trng->base + STARFIVE_IE);
> +		disable_irq(trng->irq);
> +		starfive_trng_irq_clear(trng);
> +	} else {
> +		trng->initialized =3D true;
> +	}

[Severity: Medium]
Can starfive_trng_init() in drivers/char/hw_random/jh7110-trng.c cause an
unbalanced enable_irq(trng->irq) call when the RNG is deselected and quickly
reselected via /sys/class/misc/hw_random/rng_current?

In drivers/char/hw_random/core.c, deselecting the current RNG in
drop_current_rng() drops rng->ref to 0 and schedules rng->cleanup_work
asynchronously via cleanup_rng() -> schedule_work(&rng->cleanup_work).

If the RNG is selected again via rng_current_store() -> set_current_rng() ->
hwrng_init() before cleanup_rng_work() acquires rng_mutex, hwrng_init() sees
rng->ref =3D=3D 0, invokes starfive_trng_init(), and sets rng->ref back to =
1.
When cleanup_rng_work() subsequently runs, it skips starfive_trng_cleanup():

drivers/char/hw_random/core.c:cleanup_rng_work() {
	...
	/* Skip if rng has been reinitialized. */
	if (kref_read(&rng->ref)) {
		mutex_unlock(&rng_mutex);
		return;
	}

	if (rng->cleanup)
		rng->cleanup(rng);
	...
}

In that case, starfive_trng_init() runs while trng->initialized is still tr=
ue
and trng->irq is already enabled, so calling enable_irq(trng->irq)
unconditionally triggers an unbalanced IRQ enable warning in __enable_irq().

Furthermore, if starfive_trng_reseed() fails during that re-initialization,
the error path disables trng->irq without clearing trng->initialized, and
when cleanup_rng_work() later runs for the failed init,
starfive_trng_cleanup() will call disable_irq(trng->irq) a second time and
leave TRNG interrupts permanently disabled.

Should starfive_trng_init() check trng->initialized before enabling trng->i=
rq
(and clear trng->initialized on the error path)?

[ ... ]

>  static int starfive_trng_read(struct hwrng *rng, void *buf, size_t max, =
bool wait)
>  {
>  	struct starfive_trng *trng =3D to_trng(rng);
> -	int ret;
> -
> -	pm_runtime_get_sync(trng->dev);
> +	unsigned long timeout;
> +	int ret, retry =3D 1;
> =20
> -	if (trng->mode =3D=3D PRNG_256BIT)
> -		max =3D min_t(size_t, max, (STARFIVE_RAND_LEN * 8));
> -	else
> -		max =3D min_t(size_t, max, (STARFIVE_RAND_LEN * 4));
> +	ret =3D pm_runtime_resume_and_get(trng->dev);
> +	if (ret < 0) {
> +		dev_warn_ratelimited(trng->dev, "Failed to wake device for read: %d\n"=
, ret);
> +		return ret;
> +	}
> =20
>  	if (wait) {
> -		ret =3D starfive_trng_wait_idle(trng);
> -		if (ret) {
> -			ret =3D -ETIMEDOUT;
> +		mutex_lock(&trng->lock);
> +		timeout =3D msecs_to_jiffies(STARFIVE_RANDGEN_TIMEOUT_MS);
> +	} else {
> +		/* allow up to 1 jiffy for wait =3D=3D 0 */
> +		if (!mutex_trylock(&trng->lock)) {
> +			ret =3D 0;
>  			goto out_put;
>  		}
> +		timeout =3D STARFIVE_RANDGEN_NOWAIT_TIMEOUT;
>  	}
> =20
> -	ret =3D starfive_trng_cmd(trng, STARFIVE_CTRL_GENE_RANDNUM, wait);
> -	if (ret)
> -		goto out_put;
> +	for (;;) {
> +		/*
> +		 * A pending LFSR lockup taints the next sample. Blocking
> +		 * callers reseed here; non-blocking callers return no data,
> +		 * the reseed work is already queued.
> +		 */
> +		if (READ_ONCE(trng->need_reseed)) {
> +			if (!wait) {
> +				ret =3D 0;
> +				goto out_unlock;
> +			}
> +			ret =3D starfive_trng_reseed(trng);
> +			if (ret)
> +				goto out_unlock;
> +		}

[Severity: Medium]
Could non-blocking calls to starfive_trng_read() (wait =3D=3D false) in
drivers/char/hw_random/jh7110-trng.c stall indefinitely if trng->need_reseed
is set without trng->work being queued?

In starfive_trng_irq_clear(), if STARFIVE_ISTAT_LFSR_LOCKUP is set in
STARFIVE_ISTAT, trng->need_reseed is set to true and the hardware interrupt
status bit is cleared without queuing trng->work:

drivers/char/hw_random/jh7110-trng.c:starfive_trng_irq_clear() {
	u32 istat =3D readl(trng->base + STARFIVE_ISTAT);

	/* Do not lose an LFSR lockup that has not been serviced yet. */
	if (istat & STARFIVE_ISTAT_LFSR_LOCKUP)
		WRITE_ONCE(trng->need_reseed, true);

	writel(istat, trng->base + STARFIVE_ISTAT);
}

During runtime suspend and resume, starfive_trng_suspend() masks STARFIVE_IE
before calling starfive_trng_irq_clear(), and starfive_trng_resume() calls
starfive_trng_irq_clear() before re-enabling STARFIVE_IE_ALL:

drivers/char/hw_random/jh7110-trng.c:starfive_trng_suspend() {
	...
	writel(0, trng->base + STARFIVE_IE);
	starfive_trng_irq_clear(trng);
	...
}

drivers/char/hw_random/jh7110-trng.c:starfive_trng_resume() {
	...
	if (trng->initialized) {
		starfive_trng_irq_clear(trng);
		writel(STARFIVE_IE_ALL, trng->base + STARFIVE_IE);
	}
	...
}

If STARFIVE_ISTAT_LFSR_LOCKUP is observed and cleared in either path,
starfive_trng_irq() will not fire for that event and trng->work is never
queued. Similarly, if a previous reseed attempt in starfive_trng_reseed_wor=
k()
or starfive_trng_read() failed, trng->need_reseed remains true after
trng->work is no longer pending.

Because the !wait path in starfive_trng_read() assumes trng->work is already
queued and returns 0 immediately, wouldn't subsequent non-blocking reads ke=
ep
returning 0 until a blocking read occurs? Should the !wait path (or
starfive_trng_irq_clear() / starfive_trng_resume()) queue trng->work when
trng->need_reseed is true?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021083712.3032=
-1-lianfeng.ouyang@starfivetech.com?part=3D2

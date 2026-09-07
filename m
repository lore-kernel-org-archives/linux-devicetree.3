Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C147352C3C
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 05:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788757462; cv=none; b=FN8DZf2MGx2rdquSUO2JAHZDHX1tEpaZpw6uPovnk82F4yMRNs2cE7u7dGSsqDzQi/tuufiVhIFol887a/E3kGX0sZ/1GUbG6dDloYDbabgEUYHF2k2DnGq9GP7CIEQCoRT/YD3jUxmVc/eH6yCOoApRgnil7sfNW86knki/qUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788757462; c=relaxed/simple;
	bh=MEKc8crTW/gxty5j9A9/i0xz+CKL7fBSSTeBpuFuUHg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l2JM8NdYcgTeispe8dI/GB/YS8o7fAieFZs6HPdslZjm/oaFBsWUQe5EJ62vRoAbv1Ch08Jf2Gpvr/jUL6Vj3V6s4UECnXPgbSD27mLLcWvM6QQY2tz1yo4mTLN57GSuoqeIobWQKZm3c0C9m44D32ISd2cfjDQPrhxyG20N+hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XAkKRawh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAkKRawh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82DA1F00A3A;
	Mon,  7 Sep 2026 05:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788757461;
	bh=AfkouRwLwqHJsuSY001L06C5UF+XT0zJ7vI2gyGBP5U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XAkKRawhETY+C2n+lt304tZ1813jftHK33vJPahktqfP3M3RZYpodfggRLk4CYPNB
	 +bc3ZeOgH/T2tktueAdwQ0RwjC4B65ej9SIAbPiIMs2NHZRtd43W+nbmOTJY8NouRQ
	 QgMW9OyiFaiUutfTLH0v/VTD2TaAG/wsYAXgVZTnmsO5Jp5mWkKpifQjSxZjIOjh4v
	 lhIqYtktwwCs7+WkqReVbcBbK5DHtLjE0QdG62qfnG/nRK6BppuBS/RuNdNgS9aHQC
	 9xO2aaqoE6nx2zDd910gJQcusy1kXjSl/Om9B+0IgXpcjggnrwsOvw+tWAPhyXHo3i
	 R+6oY6edl59yQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] hwrng: starfive: rework clk/reset teardown order
 for JHB100
Reply-To: sashiko-reviews@lists.linux.dev
To: lianfeng.ouyang <lianfeng.ouyang@starfivetech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907031603.188483-3-lianfeng.ouyang@starfivetech.com>
References: <20260907031603.188483-1-lianfeng.ouyang@starfivetech.com>
 <20260907031603.188483-3-lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 05:04:20 +0000
Message-Id: <20260907050420.B82DA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] PM runtime reference leak in starfive_trng_read() on lock contenti=
on.
- [High] TOCTOU race in starfive_trng_release leading to double clock disab=
le or bus error.
- [High] Prematurely dropping PM runtime reference during asynchronous hard=
ware reseed.
- [High] Pending workqueue task is not cancelled on module teardown or prob=
e error path, leading to Use-After-Free.
- [High] Shared reset control is left permanently deasserted if unbound whi=
le runtime-suspended and uninitialized.
- [High] Missing interrupt mask in starfive_trng_suspend causes an interrup=
t storm.
--

commit 7c6643a978a103f1c37f18a5471c5dac7b74eeb6
Author: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: hwrng: starfive: rework clk/reset teardown order for JHB100

This commit reworks the clock and reset teardown sequence to address
hardware-specific requirements for the JHB100 SoC. It introduces a per-comp=
atible
match data structure to dictate reset ordering and migrates the SEU-trigger=
ed
hardware reseed path to a workqueue. The driver also switches to devm actio=
ns
for teardown management.

> diff --git a/drivers/char/hw_random/jh7110-trng.c b/drivers/char/hw_rando=
m/jh7110-trng.c
> index aee12caab5780..ecc7d5bd7bf51 100644
> --- a/drivers/char/hw_random/jh7110-trng.c
> +++ b/drivers/char/hw_random/jh7110-trng.c
[ ... ]
> @@ -138,6 +160,28 @@ static inline void starfive_trng_irq_mask_clear(stru=
ct starfive_trng *trng)
>  	writel(data, trng->base + STARFIVE_ISTAT);
>  }
> =20
> +static void starfive_trng_release(void *data)
> +{
> +	struct starfive_trng *trng =3D data;
> +

[Severity: High]
Could this lead to a use-after-free if probe fails?=20

The trng->work is not cancelled in this release action. If=20
starfive_trng_probe() fails after registering the IRQ, an SEU interrupt cou=
ld
schedule trng->work right before the trng structure is freed, leaving a
pending workqueue item pointing to freed memory.

> +	if (!pm_runtime_status_suspended(trng->dev)) {

[Severity: High]
Is there a race condition here with asynchronous autosuspend?=20

The PM status is checked without ensuring PM transitions are halted. If the
device is active, this proceeds to manually disable clocks.=20

If a pending autosuspend timer fires concurrently, starfive_trng_suspend()
might execute on another CPU and also attempt to disable clocks, potentially
leading to clock reference underflows or bus errors.

[Severity: High]
Does skipping this block when suspended cause the shared reset control to
remain permanently deasserted?=20

If probe fails after deasserting the reset, and the device autosuspends bef=
ore
starfive_trng_release() executes, the reset won't be re-asserted here.
starfive_trng_suspend() also skips asserting the reset if trng->cleanup is =
0.

> +		writel(0, trng->base + STARFIVE_IE);
> +		starfive_trng_irq_clear(trng);
> +
> +		if (trng->irq >=3D 0)
> +			synchronize_irq(trng->irq);
> +
[ ... ]
> +static void starfive_trng_randreseed_work(struct work_struct *work)
> +{
> +	struct starfive_trng *trng =3D work_to_trng(work);
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(trng->dev);
> +	if (ret < 0) {
> +		dev_warn(trng->dev, "Failed to wake device for reseed: %d\n", ret);
> +		return;
> +	}
> +
> +	mutex_lock(&trng->lock);
> +
> +	if (READ_ONCE(trng->cleanup))
> +		goto unlock;
> +
> +	reinit_completion(&trng->reseed_done);
> +	writel(STARFIVE_CTRL_EXEC_RANDRESEED, trng->base + STARFIVE_CTRL);
> +
> +unlock:
> +	mutex_unlock(&trng->lock);
> +
> +	pm_runtime_put_autosuspend(trng->dev);
> +}

[Severity: High]
Does this prematurely drop the PM runtime reference while the hardware is
still operating?=20

Writing STARFIVE_CTRL_EXEC_RANDRESEED initiates a hardware reseed. Unlike
starfive_trng_cmd() which waits for completion, this workqueue function does
not wait for the reseed_done completion.=20

Dropping the reference immediately could allow the device to suspend and
clocks to gate while the TRNG is actively reseeding, potentially corrupting
the IP state.

[ ... ]
> @@ -247,7 +358,18 @@ static int starfive_trng_read(struct hwrng *rng, voi=
d *buf, size_t max, bool wai
>  	struct starfive_trng *trng =3D to_trng(rng);
>  	int ret;
> =20
> -	pm_runtime_get_sync(trng->dev);
> +	ret =3D pm_runtime_resume_and_get(trng->dev);
> +	if (ret < 0) {
> +		dev_warn(trng->dev, "Failed to wake device for read: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (wait) {
> +		mutex_lock(&trng->lock);
> +	} else {
> +		if (!mutex_trylock(&trng->lock))
> +			return -EAGAIN;
> +	}

[Severity: High]
Does this early return leak the PM usage counter?=20

The counter is incremented via pm_runtime_resume_and_get() at the top of
starfive_trng_read().=20

Returning -EAGAIN here completely bypasses the pm_runtime_put_autosuspend()
cleanup call at the bottom of the function. If called repeatedly by the hwr=
ng
core, could this overflow the usage counter?

[ ... ]
>  static int __maybe_unused starfive_trng_suspend(struct device *dev)
>  {
>  	struct starfive_trng *trng =3D dev_get_drvdata(dev);
> +	bool cleanup =3D READ_ONCE(trng->cleanup);
> +
> +	if (cleanup && trng->data->seq_rst_clk =3D=3D SEQ_RST_FIRST)
> +		reset_control_assert(trng->rst);
> =20
> -	clk_disable_unprepare(trng->hclk);
>  	clk_disable_unprepare(trng->ahb);
> +	clk_disable_unprepare(trng->hclk);

[Severity: High]
Could this cause an interrupt storm when background auto-reseeding is activ=
e?

The clocks are disabled here without writing 0 to STARFIVE_IE to mask the
interrupt source. If an interrupt like SEED_DONE fires right as the clocks =
are
gated, the IRQ line might remain latched high.=20

When starfive_trng_irq() runs, it checks pm_runtime_get_if_active() and
returns IRQ_NONE without clearing the hardware interrupt, causing the IRQ to
fire repeatedly and hang the CPU.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907031603.1884=
83-1-lianfeng.ouyang@starfivetech.com?part=3D2

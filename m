Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011D73F39C6
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 10:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000766; cv=none; b=H+SROh8qEOKKwTpNVXBJ+w7SZiiMQBsQ3/kheQSA/og1kgRS8Mj7nkvZ63hCB/uNZEjzX7tIwkpItp/1f08eTypw/NinHLeRI3X33BcHrf/ajxvpn/ODgxC+dPqeBY2CDGhmncAg3/TyQxkeQLlNXdnzaBatjNHAQvpT6D+okCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000766; c=relaxed/simple;
	bh=CdXHyxQvFPIUJNXU2cuqXO6083LufiGLuN6c7FtCCO0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c2Az2Oho6tniQ0wcNDM57N7l4SV0rK+Es036/bmnzBYGekZ4aNmTQPE6z89OSgzU6nT2H+CI8w1PmWuOac+nN1eV3yr4jPsGwyG/K9bFafElSKCGbqXp//4yW3BUHf9Y3D9xK7IYStzgiGQzO5Rf/ofLZw5kBG2+v/vfxpvfBW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxltIbHT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxltIbHT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C56C1F00893;
	Tue,  9 Jun 2026 10:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781000764;
	bh=3EPhalWQWvD5pUwAVudqfBTL3lq1b/m0ZuLczKZCINc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TxltIbHTfjs4dqEHXu+swtPaX7+1NgcFsostss9jQz7L8pDze+uCMW3FNUh9wNHN/
	 AB+SHMl4eUzBoxsrnRKrLOq3KzQY4XoQGFuxoyWsaLUelAmKNQq8hjVNIbeALUAUsD
	 mmL6eQoKrVLyWON7fHBUtwDCmr1My2PBHc/pHpsY877Z85UdVz9iMD2ilad+EyPjhv
	 sa7UG6cW9jrmYryB4q8DXLkXU6yY+qH5gdN1fMy+mQB4bBzFG4PmG1AVRvVrexX2a+
	 Cah0FfFe5JZaX+TbSqIx37frhZHXDyXnceKCqJFVRGWRYMu+y9uZqYIGrp6SwBmE7o
	 69k8bASDHvLyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] hwrng: starfive: rework clk/reset teardown order
 for JHB100
Reply-To: sashiko-reviews@lists.linux.dev
To: lianfeng.ouyang <lianfeng.ouyang@starfivetech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609095726.160559-3-lianfeng.ouyang@starfivetech.com>
References: <20260609095726.160559-3-lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 10:26:03 +0000
Message-Id: <20260609102604.2C56C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The devm release action skips hardware reset assertion due to a sy=
nchronous suspend in the cleanup path.
- [High] Failing to mask interrupts during runtime suspend leads to an unha=
ndled interrupt storm during device resume.

Pre-existing issues:
- [High] The device IRQ is requested before hardware and PM are initialized=
, risking an immediate IRQ storm during boot.
- [High] Non-blocking reads invariably fail with -ETIMEDOUT due to a 0-jiff=
y timeout calculation.
--

commit d88dd84c5abe42f5a9e074b3a3e4819cbff1fcc8
Author: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>

hwrng: starfive: rework clk/reset teardown order for JHB100

Reworks the StarFive TRNG driver to handle JHB100 hardware-specific
requirements for clk/reset teardown. Adds Runtime PM integration to manage
device power state and includes a devm action for cleanup.

> diff --git a/drivers/char/hw_random/jh7110-trng.c b/drivers/char/hw_rando=
m/jh7110-trng.c
> index 9776f4daa0445..cafc873b9ebf8 100644
> --- a/drivers/char/hw_random/jh7110-trng.c
> +++ b/drivers/char/hw_random/jh7110-trng.c
> @@ -138,6 +154,31 @@ static inline void starfive_trng_irq_mask_clear(stru=
ct starfive_trng *trng)
>  	writel(data, trng->base + STARFIVE_ISTAT);
>  }
> =20
> +static void starfive_trng_release(void *data)
> +{
> +	struct starfive_trng *trng =3D data;
> +
> +	if (!pm_runtime_status_suspended(trng->dev)) {

[Severity: High]
Does this PM state check accidentally skip hardware reset assertion during
driver unbind?

The HWRNG unregisters first during teardown, which calls
starfive_trng_cleanup() where pm_runtime_put_sync() synchronously suspends
the device. When this devm action executes immediately after, the device is
already suspended, making this condition false and completely bypassing the
reset_control_assert(trng->rst) logic.

Could checking pm_runtime_status_suspended() outside a lock also leave a
race window where autosuspend might trigger and cause double clock disables?

> +		writel(0, trng->base + STARFIVE_IE);
> +		starfive_trng_irq_clear(trng);
> +
> +		if (trng->irq >=3D 0)
> +			synchronize_irq(trng->irq);
> +
> +		if (trng->data->seq_rst_clk =3D=3D SEQ_RST_FIRST)
> +			reset_control_assert(trng->rst);
> +
> +		clk_disable_unprepare(trng->ahb);
> +		clk_disable_unprepare(trng->hclk);
> +
> +		if (trng->data->seq_rst_clk =3D=3D SEQ_CLK_FIRST)
> +			reset_control_assert(trng->rst);
> +	}
> +
> +	pm_runtime_dont_use_autosuspend(trng->dev);
> +	pm_runtime_disable(trng->dev);
> +}
> +

[ ... ]

> @@ -201,24 +251,33 @@ static int starfive_trng_init(struct hwrng *rng)
> =20
>  static irqreturn_t starfive_trng_irq(int irq, void *priv)
>  {
> +	int ret;
>  	u32 status;
>  	struct starfive_trng *trng =3D (struct starfive_trng *)priv;
> =20
> +	ret =3D pm_runtime_get_if_active(trng->dev);
> +	if (ret <=3D 0) {
> +		dev_err_ratelimited(trng->dev, "pm is inactive in irq\n");
> +		return IRQ_NONE;
> +	}

[Severity: High]
Will this return cause an infinite interrupt storm if an interrupt fires
during device resume?

If starfive_trng_suspend() doesn't mask device interrupts via STARFIVE_IE,
an interrupt could trigger while suspended or when clocks are re-enabled in
starfive_trng_resume().

Because the PM core transitions the device through RPM_RESUMING,
pm_runtime_get_if_active() returns 0. Returning IRQ_NONE without clearing
the interrupt leaves the level-triggered IRQ asserted, locking up the CPU.

> =20
>  	status =3D readl(trng->base + STARFIVE_ISTAT);
> -	if (status & STARFIVE_ISTAT_RAND_RDY) {

[ ... ]

> @@ -247,7 +325,13 @@ static int starfive_trng_read(struct hwrng *rng, voi=
d *buf, size_t max, bool wai
>  	if (wait) {
>  		ret =3D starfive_trng_wait_idle(trng);
>  		if (ret)
> -			return -ETIMEDOUT;
> +			goto end;
>  	}
> =20
>  	ret =3D starfive_trng_cmd(trng, STARFIVE_CTRL_GENE_RANDNUM, wait);
>  	if (ret)
> -		return ret;
> +		goto end;

[Severity: High]
This isn't a bug introduced by this patch, but will non-blocking reads
invariably fail with -ETIMEDOUT due to a 0-jiffy timeout calculation?

In starfive_trng_cmd(), when wait is false, wait_time is 40. This evaluates
as usecs_to_jiffies(40). On systems with standard HZ=3D1000 or lower, this
results in 0 jiffies.=20

Calling wait_for_completion_timeout() with 0 causes an immediate failure if
the completion is not already signaled, guaranteeing that non-blocking reads
always time out.

> =20
>  	memcpy_fromio(buf, trng->base + STARFIVE_RAND0, max);
> =20
> -	pm_runtime_put_sync_autosuspend(trng->dev);
> +	ret =3D max;
> +
> +end:
> +	mutex_unlock(&trng->lock);

[ ... ]

> @@ -282,22 +370,32 @@ static int starfive_trng_probe(struct platform_devi=
ce *pdev)
>  	trng->irq =3D platform_get_irq(pdev, 0);
>  	if (trng->irq < 0)
>  		return trng->irq;
> =20
>  	init_completion(&trng->random_done);
>  	init_completion(&trng->reseed_done);
> +	mutex_init(&trng->lock);
>  	spin_lock_init(&trng->write_lock);
> =20
> -	ret =3D devm_request_irq(&pdev->dev, irq, starfive_trng_irq, 0, pdev->n=
ame,
> +	ret =3D devm_request_irq(&pdev->dev, trng->irq, starfive_trng_irq, 0, p=
dev->name,
>  			       (void *)trng);

[Severity: High]
This is a pre-existing issue, but does requesting the IRQ here before
hardware and Runtime PM are initialized risk an immediate IRQ storm?

If the bootloader leaves the TRNG with a pending interrupt, the IRQ can fire
immediately. The newly added PM checks change this from a potential crash
into an interrupt storm, since starfive_trng_irq() will see
pm_runtime_get_if_active() return 0 and bail with IRQ_NONE before
acknowledging the hardware interrupt.

>  	if (ret)
>  		return dev_err_probe(&pdev->dev, ret,
>  				     "Failed to register interrupt handler\n");
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609095726.1605=
59-1-lianfeng.ouyang@starfivetech.com?part=3D2

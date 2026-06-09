Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5543B3BF3
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 12:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007027; cv=none; b=iocZFmU3XcLCLdmeEHyy+8FGYYVw2h6ab6uhZ1VloBBEa9oVko5LNfh5GI8cOZsoC1ZFLhdQs3WHlHdBjUIEmRP5fceU043rZLYchJ8A46S7+d3o7EaUOX1KnPqjraX7iwygIt4PVe4TgzYQY7dWaMHNnr7SAPnB3PjrA0nbZYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007027; c=relaxed/simple;
	bh=SgsenhZ6gDZfw12KKv3wVM8YD+L7aOXqcxVlhgBGhro=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XNwPjuEcJ9bpjHCFWnJzsORd/4DRAEOX/kCr438nbs7FipgbHpAex8VI+Hwk4XPGO74Cav5JXfoVQDKEBi9vzw4DEgI6CiCPjHpX52LPdfRvIAR/GX8LDMbBzGQNCeG7iW7Kru/FWVL3afUyNyKx7J9xram5JQUVu9nCcesqyDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UdlOjIuV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UdlOjIuV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87B71F00893;
	Tue,  9 Jun 2026 12:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781007026;
	bh=EM1wjryx/fAhI/VTJ9JZqVA9OIXmpmf+Jc72EPkQfaI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UdlOjIuVlKL4h1tqU+q1vavpJ8Qh3dbuFxzWMJf1H9CcHPPUPugl4AjEWXiw2o7pV
	 P6tv++KCs3KFFSxvTggSgO5bAnOVL3qW/ro6zNloXYEWVRblaxyeiyp0oyun9T/nAO
	 vKnaQYZPC4Sz4edE4fJb8gQBIegGvUKx80BhpOqe/lix6CGnT80AfLXWZWcwm00lSG
	 Rp9y7KVWVV99mpec2v66e+W64fXvjTiXjNNZWOvibsCpo7m+FYwDHWZ7mFw+5k8EHe
	 QXRBv3LSjN71PFa1PpjgoQpg+tGljd26VLFjuEqcKV/fX2f9LcZ0bvufSewgxd3lHu
	 Ikm2uQj6B8Lqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 11/11] ASoC: renesas: fsi: Add SPU clock control in
 hw_startup/shutdown
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260609113836.45079-12-phucduc.bui@gmail.com>
References: <20260609113836.45079-12-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 12:10:25 +0000
Message-Id: <20260609121025.C87B71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Double disable of the SPU clock on the error path.

Pre-existing issues:
- [High] `fsi_clk_enable()` unconditionally fails subsequent streams (break=
s full-duplex).
- [High] Sleeping in atomic context during trigger.
- [High] Concurrent triggers race on shared hardware registers.
--

commit f5cfbced3eb2033737642bc08abc86f7381ec9a6
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown

This commit enables and disables the SPU clock in fsi_hw_startup() and
fsi_hw_shutdown(). This ensures the clock is active while the driver
accesses hardware registers.

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index e26f39dfe0598..b72396b5de7dc 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -1560,6 +1560,11 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
>  			  struct device *dev)
>  {
>  	u32 data =3D 0;
> +	int ret;
> +	/* enable spu bus bridge clock */
> +	ret =3D clk_enable(fsi->master->clk_spu);
> +	if (ret)
> +		return ret;

[Severity: High]
This is a pre-existing issue, but does this code have a race condition when
triggered concurrently?

Playback and capture streams use the same fsi_priv instance and share
hardware registers like CKG1. Since they are separate substreams with
separate ALSA locks, starting or stopping them concurrently on different
CPUs could cause fsi_hw_startup() and fsi_hw_shutdown() to run in parallel.

This could lead to unprotected read-modify-write operations on shared
registers:

    fsi_reg_mask_set(fsi, CKG1, (DIMD | DOMD), data);

and on the shared clock count:

    fsi_clk_enable() {
        ...
        clock->count++;
    }

Could this corrupt the clock reference count and hardware register states?

> [ ... ]
> @@ -1605,8 +1610,13 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
>  	fsi_fifo_init(fsi, io, dev);
> =20
>  	/* start master clock */
> -	if (fsi_is_clk_master(fsi))
> -		return fsi_clk_enable(dev, fsi);
> +	if (fsi_is_clk_master(fsi)) {
> +		ret =3D fsi_clk_enable(dev, fsi);

[Severity: High]
This is a pre-existing issue, but does fsi_clk_enable() break full-duplex
operation?

If a stream is already running, clock->count is 1. When a second stream
starts, the condition if (0 =3D=3D clock->count) is false, but the function
does not set ret =3D 0.

    fsi_clk_enable() {
        int ret =3D -EINVAL;
        if (!fsi_clk_is_valid(fsi))
            return ret;
           =20
        if (0 =3D=3D clock->count) {
            ...
        }
        return ret;
    }

Won't this unconditionally return -EINVAL for the second stream, causing
fsi_hw_startup() to fail and preventing simultaneous playback and capture?

[Severity: High]
This is also a pre-existing issue, but could calling fsi_clk_enable() here
cause a sleep in atomic context?

The ALSA trigger callback runs in atomic context with the PCM substream
spinlock held. fsi_clk_enable() calls clock->set_rate(), which routes to
fsi_clk_set_rate_cpg():

    fsi_clk_set_rate_cpg() {
        ...
        ret =3D clk_set_rate(ick, best_cout);
    }

Since the Common Clock Framework's clk_set_rate() acquires a mutex and
sleeps, won't this cause a scheduling while atomic panic?

> +		if (ret) {
> +			clk_disable(fsi->master->clk_spu);
> +			return ret;
> +		}
> +	}
> =20
>  	return 0;
>  }
> @@ -1614,9 +1624,15 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
>  static int fsi_hw_shutdown(struct fsi_priv *fsi,
>  			    struct device *dev)
>  {
> +	int ret;
>  	/* stop master clock */
> -	if (fsi_is_clk_master(fsi))
> -		return fsi_clk_disable(dev, fsi);
> +	if (fsi_is_clk_master(fsi)) {
> +		ret =3D fsi_clk_disable(dev, fsi);
> +		if (ret)
> +			return ret;
> +	}
> +	/* stop spu bus bridge clock */
> +	clk_disable(fsi->master->clk_spu);
> =20
>  	return 0;
>  }

[Severity: High]
Is there a risk of double-disabling the SPU clock if fsi_clk_enable() fails?

If fsi_clk_enable() fails during startup, it disables the SPU clock before
returning the error:

    fsi_hw_startup() {
        ...
        if (ret) {
            clk_disable(fsi->master->clk_spu);
            return ret;
        }
    }

ALSA intercepts this error in snd_pcm_action_single() and invokes
snd_pcm_undo_start(), which calls the driver's trigger callback with
SNDRV_PCM_TRIGGER_STOP.

This triggers fsi_hw_shutdown(), which unconditionally calls clk_disable()
on the SPU clock again, since fsi_clk_disable() returns 0 for a zero clock
count.

Could this result in an unbalanced clock disable, potentially triggering
warnings and preventing the clock from being re-enabled later?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609113836.4507=
9-1-phucduc.bui@gmail.com?part=3D11

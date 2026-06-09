Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD498413615
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 12:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006926; cv=none; b=ti3SQfJmHAM4GQ70BPckPfAFB+aSY4mRrhIntwOByXGS7p3y1/xINAKfJ0F1/DkSmZFiP5x7zNZjRFlRdlZIHqRpnXdmgI354rhIVJ3L7VY4iPkNbXRSaodODa9eme8JkNw2Rmb/LLHN99bNFVe6KtnB/W1fyrPUcH4MQtGfyGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006926; c=relaxed/simple;
	bh=riQ1teTOZjwPO0CjpwFqbzynAv3BESSlKhbdSE+eTNg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WoCvUo8DMHhxLICZ6cNjQjhpmpuIl5tYOWe2uP6dQCeKNudwd0eKFOlJmQg3FAMnDu+ak1zJT8hiAnnt02iFmP2DGQu9YhkmpQ6te8JVcpM67XeiQnF1qmlHYH0EZ0p65lODyHnwdLwhY6Xg8iSw8xbOLG3jbkOTN3QsIkzXVy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VXFKpx8x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VXFKpx8x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0C31F00893;
	Tue,  9 Jun 2026 12:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781006923;
	bh=j8+3YbF8AjLKUXw5ID/UnyOEaU+hCLLeaxXsu8P7UyU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VXFKpx8x2j0m8S6Y1cnl9A8eA6cT4R4rMHQ1N9rz3hJtlfILNXv2TX4i7AcSSUFW+
	 FLQoFttZ2o2XW/J+tbJfLH22NzlQ17hhyXGsFAeJ2YcZ1ULK/zRn4w8OcipBGNer1N
	 bnh+UovjnFWSw6y7fhpxOFkTLF+pJbNbg3y6+ilcwYfSyqYWiWmKkm4SsSIJEqhXaQ
	 dDcnZiiHXGAIxUekEO2pN8kHay3WSfjRwYh7fBCeHrI/JYZjS5CG9pNNhaDo6NorKQ
	 hDmJ2di0hBFzmJ+7fLRZLCsmpeK64VLCjm9x6Rk5FJ+l7NLiwe1GA7RQCOeUZ3kW4N
	 IqaGCmEYYY1gA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/11] ASoC: renesas: fsi: add
 fsi_clk_prepare/unprepare()
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260609113836.45079-11-phucduc.bui@gmail.com>
References: <20260609113836.45079-11-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 12:08:42 +0000
Message-Id: <20260609120842.9D0C31F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but fsi_clk_enable()=
 incorrectly handles reference counting and returns -EINVAL for subsequent =
streams, breaking concurrent playback and capture (full-duplex).
- [High] This problem wasn't introduced by this patch, but fsi_clk_enable()=
 triggers sleepable mutex acquisitions (clk_set_rate) from inside an atomic=
 trigger context, potentially causing a deadlock or kernel panic.
- [High] This problem wasn't introduced by this patch, but opening or closi=
ng an audio stream unconditionally invalidates the shared clock state, brea=
king any other active stream on the same DAI.
--

commit 2ca0d4af70026409e881ce4021390b9ef2e6dfa9
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()

This commit adds fsi_clk_prepare() and fsi_clk_unprepare() helpers and calls
them from the startup and shutdown routines. This ensures clocks are prepar=
ed
from sleepable contexts.

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 716ecf0401fe3..e26f39dfe0598 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
[ ... ]
> @@ -730,6 +730,54 @@ static int fsi_clk_is_valid(struct fsi_priv *fsi)
>  		fsi->clock.rate;
>  }
> =20
> +static int fsi_clk_prepare(struct fsi_priv *fsi)
> +{
[ ... ]
> +static void fsi_clk_unprepare(struct fsi_priv *fsi)
> +{
[ ... ]
> +	clk_unprepare(spu);
> +}

[Severity: High]
This isn't a bug introduced by this patch, but does fsi_clk_enable() correc=
tly
handle reference counting for subsequent streams?

Looking at fsi_clk_enable() in the same file:

static int fsi_clk_enable(struct device *dev, struct fsi_priv *fsi)
{
        struct fsi_clk *clock =3D &fsi->clock;
        int ret =3D -EINVAL;
        ...
        if (0 =3D=3D clock->count) {
                ...
                clock->count++;
        }

        return ret;
}

If clock->count is greater than 0 (such as during a second stream start for
concurrent playback and capture), the if block is skipped and the function
directly returns the initialized ret value of -EINVAL. Does this break
full-duplex audio by failing the ALSA trigger operation for the second stre=
am?

Additionally, if the second stream fails to start but later triggers an
unbalanced shutdown during cleanup, fsi_clk_disable() underflows clock->cou=
nt
via the post-decrement:

static int fsi_clk_disable(struct device *dev, struct fsi_priv *fsi)
{
        ...
        if (1 =3D=3D clock->count--) {
                clk_disable(clock->xck);
                ...
        }
        ...
}

Could this underflow cause further clock enablement to fail?

[Severity: High]
This is also a pre-existing issue, but does fsi_dai_trigger() call sleepable
functions while in an atomic context?

The ALSA ASoC trigger callback runs in an atomic context under a spinlock
since the DAI and PCM do not have the nonatomic flag set. However, the
call chain leads to clk_set_rate() which acquires the global CCF prepare_lo=
ck
mutex and can sleep:

fsi_dai_trigger()
  fsi_hw_startup()
    fsi_clk_enable()
      clock->set_rate()
        clk_set_rate()

Could this attempt to acquire a mutex while holding a spinlock result in a
scheduling while atomic panic or deadlock?

>  static int fsi_clk_enable(struct device *dev,
>  			  struct fsi_priv *fsi)
>  {
[ ... ]
> @@ -1580,7 +1628,7 @@ static int fsi_dai_startup(struct snd_pcm_substream=
 *substream,
> =20
>  	fsi_clk_invalid(fsi);
> =20
> -	return 0;
> +	return fsi_clk_prepare(fsi);
>  }
> =20
>  static void fsi_dai_shutdown(struct snd_pcm_substream *substream,
> @@ -1588,6 +1636,7 @@ static void fsi_dai_shutdown(struct snd_pcm_substre=
am *substream,
>  {
>  	struct fsi_priv *fsi =3D fsi_get_priv(substream);
> =20
> +	fsi_clk_unprepare(fsi);
>  	fsi_clk_invalid(fsi);

[Severity: High]
This is a pre-existing issue, but does calling fsi_clk_invalid()
unconditionally here and in fsi_dai_startup() break other active streams
on the same DAI?

Because playback and capture streams share a single fsi_clk structure,
if one stream is already running and a second stream is opened or closed,
fsi_clk_invalid() zeroes out fsi->clock.rate.

Later, when the running stream is closed via fsi_dai_trigger(),
fsi_hw_shutdown() will call fsi_clk_disable(). Because the rate was wiped,
fsi_clk_is_valid() evaluates to false:

static int fsi_clk_disable(struct device *dev, struct fsi_priv *fsi)
{
        if (!fsi_clk_is_valid(fsi))
                return -EINVAL;
        ...
}

This causes fsi_clk_disable() to return early without decrementing
clock->count or disabling the hardware clocks. Does this leak the clocks
indefinitely and break the reference count for future stream startups?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609113836.4507=
9-1-phucduc.bui@gmail.com?part=3D10

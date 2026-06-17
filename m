Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007B619D065
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 12:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697689; cv=none; b=j0Qmezr2N/cV1b6tJHBMa/8nS6U38kz0C/MPDpRkyRoNjjG/ObuFFFJB9JEoGxTgmlHX8vi1u9PZKhcx1w8a0ewD2NcEhIvZ9Tc3uuPm4vRRdQz7TFaN0UU3kfvcGwYe05iC81RqMWy/FmIpjdAf6ghUlEEDaAovXPq1Hy0izJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697689; c=relaxed/simple;
	bh=h2dn4oGQBUdD/CvYdl2u6vyKIG6JSbz/o7Q/QGKu8GU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JxJI6rIek9I1QksqU+q30vP7M3H45gks07C0gOgTHADOG0a8tlug1swfTk6KLZSIitAT0Nv672w/d+PnEMbLRk0l36qEPzPdbpozW0BxUKc/PyyHkMyS5oiX9gI6cXKBKR8a2WEL9gcXky30yhCRFX7XfPSBfngVUWoaZ8DqG7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJhdIObZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJhdIObZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D461F000E9;
	Wed, 17 Jun 2026 12:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781697687;
	bh=lBpi/Y5FOb6d28kRBSSQ3XqMrA9Xsa7HoR+/1dZkMdE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EJhdIObZVtZXga8IjWyDCM5RbuOru53gW3NgTrlgMbI0AANZHuR4ep4BBzjjb4IuM
	 q39RUt+HoPx7b6KvnP/VpOmmUdnSICbqmyA0CEGbQBIg8srzm6FW/O+nyCo2Ecp/WA
	 vtGDZJB4eRiKBHH8a+qtKRwzOiePzqoXVuvyI846h92qt0tj3nwFpxrrY/3Wpbs9LD
	 rvISj1/pfqmdnKR7Mub1dFg5/w8EQ0JV3MG6bY0eYR/Ztri5kXFKqmfUNsyGHY+p1r
	 ICNTKKyXIMJAIGa9Fk0GEa7jkhzLRHO66D+3od2UyAX2uLn5/qkuVCZGFIb0HdsJvP
	 r6GD7feTtWN3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] hw_random: timeriomem-rng: add configurable read
 width and data mask
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jad Keskes" <inasj268@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260617114642.1911191-1-inasj268@gmail.com>
References: <20260617114436.1909659-1-inasj268@gmail.com>
 <20260617114642.1911191-1-inasj268@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 12:01:26 +0000
Message-Id: <20260617120127.69D461F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect teardown order between manual `hrtimer_cancel()` in `rem=
ove()` and devres-managed hwrng unregistration leads to deadlocks or Use-Af=
ter-Free vulnerabilities.
--

commit f289257a12dc14631ae0271bb9c7ffff6c6a8c94
Author: Jad Keskes <inasj268@gmail.com>

hw_random: timeriomem-rng: add configurable read width and data mask

This commit implements configurable read sizes (1, 2, or 4 bytes) and data
masking for the timeriomem-rng driver. It updates the read loop to dispatch
on the configured width and updates the alignment checks in the probe funct=
ion.

> diff --git a/drivers/char/hw_random/timeriomem-rng.c b/drivers/char/hw_ra=
ndom/timeriomem-rng.c
> --- a/drivers/char/hw_random/timeriomem-rng.c
> +++ b/drivers/char/hw_random/timeriomem-rng.c
> @@ -71,11 +76,28 @@ static int timeriomem_rng_read(struct hwrng *hwrng, v=
oid *data,
>  			usleep_range(period_us,
>  					period_us + max(1, period_us / 100));
> =20
> -		*(u32 *)data =3D readl(priv->io_base);
> -		retval +=3D sizeof(u32);
> -		data +=3D sizeof(u32);
> -		max -=3D sizeof(u32);
> -	} while (wait && max > sizeof(u32));
> +		switch (priv->reg_io_width) {
[ ... ]
> +		}
> +
> +		retval +=3D chunk;
> +		data +=3D chunk;
> +		max -=3D chunk;
> +	} while (wait && max > chunk);

[Severity: High]
This isn't a bug introduced by this patch, but looking at the driver's
teardown sequence, is there a race condition between devres unregistration
and the hrtimer?

The driver registers the RNG via devm_hwrng_register(), meaning devres hand=
les
unregistration after timeriomem_rng_remove() returns. In
timeriomem_rng_remove(), the driver manually calls hrtimer_cancel().

Since the device remains exposed to userspace during this window, can this
lead to a deadlock? If a reader is waiting in timeriomem_rng_read() on
wait_for_completion(), cancelling the timer ensures it never wakes up. The
reader holds a reference to the hwrng, causing devres unregistration to blo=
ck
indefinitely in hwrng_unregister().

Additionally, can this lead to a use-after-free? If a read occurs after
hrtimer_cancel() completes but before devres unregisters the RNG,
timeriomem_rng_read() will unconditionally execute hrtimer_restart():

timeriomem_rng_read() {
    ...
    priv->present =3D 0;
    reinit_completion(&priv->completion);
    hrtimer_forward_now(&priv->timer, priv->period);
    hrtimer_restart(&priv->timer);

    return retval;
}

If devres then frees the timeriomem_rng_private structure, wouldn't the tim=
er
fire and cause timeriomem_rng_trigger() to dereference freed memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617114436.1909=
659-1-inasj268@gmail.com?part=3D2

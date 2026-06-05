Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FC11DA62E
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 14:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780669977; cv=none; b=F/U3hlquu3gVVeCz+rC6Qkd+pGh+UTgXWb+p7krbgFrmDO6hCKDbod8bjImVxex0Zx+qGoJKNSTa00Zp8K2AqCf0eMjE6QkKVBYDiG6tqwuF9mPsdtIsQEeFJVhgWsNznH0wwgophKwKKogKiPQtXXkP7nk7P5UxdFWq2UiSh7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780669977; c=relaxed/simple;
	bh=v5XS3kJZrsUJ6HkLgu3eFjvP/VQmPAzJraSpxxHLTS8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GPj8LC33ZRWnJQvk3erRe2RO0NTeq+W3U835qGVQmV5BoAKwU0AEBcFG7nJxAMFy2kBx4hSv9SeVSmip8m+ZBQPnMhiLjbeekOxlWpMUlaC9NA0u5xqCYA6zIVLY0Spl69Q9oeyYVzq285bPF+zBrDisdDgspR4yF3Zwgks1YSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fv86dJmA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fv86dJmA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7EA71F00893;
	Fri,  5 Jun 2026 14:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780669976;
	bh=rsCCr2Cd8eoILECoaPPBMuJIb4qDsL10k/bqUTMjOLk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fv86dJmAuwUpt+63H3ikkLq7guEiWnd18y61m7gbugrWfQDNEfa3ezVLpxeIXKWQF
	 DUF7yggPhegLSryr+ELhl+LMwFOJV8cnGotIZepnw2juuCxQKZcBryGdOvGUXXAZyv
	 31/bdQwHqMyA0IANMOjfMukKMx6b8EckrAqTijeb9o+smXRLbszBZ2FXqFOYwFsJg/
	 x5NskX8ltTA344PiawNEiZGUCPgPp1L7cIaRq257U2lGXa3OIWT4cJw1l2dRDTnGBw
	 HcYYhG0Ho16cBF0TJgGOtu5Dzl7csogkpAuuVsrn72edz8hY3Cnc86P833PRr8MA42
	 8DElzOoMx6OeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/10] ASoC: renesas: fsi: Add SPU clock control in
 hw_startup/shutdown
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260605121955.105661-11-phucduc.bui@gmail.com>
References: <20260605121955.105661-11-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 14:32:55 +0000
Message-Id: <20260605143255.D7EA71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The SPU clock is never disabled, and spu_count is leaked, when the=
 FSI operates as a clock master due to an early return in fsi_hw_shutdown().
- [High] Missing rollback of SPU clock and spu_count on fsi_clk_enable() fa=
ilure during fsi_hw_startup().
- [High] Overloading spu_count breaks the clock prepare/unprepare lifecycle=
 logic, leading to clk_enable() on an unprepared clock.
- [Medium] Data race on fsi->master->spu_count in fsi_clk_prepare() and fsi=
_clk_unprepare().
--

commit ce2afa5bc93fefd1e8f98233a0baba78b987617d
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown

This commit enables and disables the spu clock within fsi_hw_startup() and
fsi_hw_shutdown() to keep the clock active during hardware register accesse=
s.
It tracks the clock state using fsi->master->spu_count.

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 6537321242c04..d7cc5a14a0998 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -1585,6 +1585,19 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
>                            struct device *dev)
>  {
>          u32 data =3D 0;
> +       int ret;
> +
> +       /* enable spu clock */
> +       if (fsi->master->clk_spu) {
> +               scoped_guard(spinlock_irqsave, &fsi->master->lock) {
> +                       if (fsi->master->spu_count =3D=3D 0) {
> +                               ret =3D clk_enable(fsi->master->clk_spu);
> +                               if (ret < 0)
> +                                       return ret;
> +                       }
> +                               fsi->master->spu_count++;

[Severity: High]
Does tracking active stream starts with spu_count interfere with the existi=
ng
clock prepare logic?

Before this patch, fsi_clk_prepare() and fsi_clk_unprepare() checked if
spu_count =3D=3D 0 before calling clk_prepare() and clk_unprepare().

By modifying spu_count during trigger start and stop, a second stream openi=
ng
while the first is running might observe spu_count > 0 and skip clk_prepare=
().

Could this lead to calling clk_enable() on an unprepared clock?

[Severity: Medium]
Since spu_count is now dynamically modified here under the fsi->master->loc=
k,
is it safe that fsi_clk_prepare() and fsi_clk_unprepare() read spu_count
without acquiring this lock?

Could alsa pcm open and close operations running concurrently with trigger
operations result in a data race?

> +               }
> +       }

[ ... ]

>          /* fifo init */
>          fsi_fifo_init(fsi, io, dev);
> =20
>          /* start master clock */
>          if (fsi_is_clk_master(fsi))
>                  return fsi_clk_enable(dev, fsi);

[Severity: High]
If fsi_clk_enable() fails here, the function returns the error immediately.

Because the audio core does not execute a stop trigger rollback if the
start trigger fails, fsi_hw_shutdown() will not be called.

Does this regression leave the spu clock erroneously enabled and spu_count
incremented forever?

> =20
>          return 0;
>  }
> =20
>  static int fsi_hw_shutdown(struct fsi_priv *fsi,
>                             struct device *dev)
>  {
>          /* stop master clock */
>          if (fsi_is_clk_master(fsi))
>                  return fsi_clk_disable(dev, fsi);

[Severity: High]
If the fsi operates as a clock master, this early return bypasses the newly
added spu clock disable logic.

Does this regression permanently leak the spu_count and leave the spu clock
enabled whenever a clock master stream is stopped?

> +       if (fsi->master->clk_spu) {
> +               scoped_guard(spinlock_irqsave, &fsi->master->lock) {
> +                       if (--fsi->master->spu_count =3D=3D 0)
> +                               clk_disable(fsi->master->clk_spu);
> +               }
> +       }
> =20
>          return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605121955.1056=
61-1-phucduc.bui@gmail.com?part=3D10

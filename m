Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE063B14C2
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 13:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780664701; cv=none; b=inZs+Vt+WXeZRio0q1l2ioX4iY69nBEe8hIX3UyDU0xWwOjopikP+JUPp8OhTeD4QV5conJOlHQjibOPNHUh/6h35NPjqGX26mrNzpwpjIi6zztBcpTDiN/1aDflopNycNbezP3C4x58Emhccy8XK7Ern8+NhqufX1NMHLs5fqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780664701; c=relaxed/simple;
	bh=K0FEm4R8kmiDdX61jNdR/21EBJ40qCFoptKLikkE2fk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DSMtfa0CpbxdVKkBX7KnfTglOZMoaQUdLKaOyyWYoac4ZnibSmKWHVzTt3VdKP1VNmEvgcTn3IQctivm2K2ISF2c4DQ93qtGEv/vxJNI5gvJJbALQ760PaCXoGE2Ys+2rXw/QXWTBLRxRczmSKjoFwVmo5RbaxImKnXPiPX/k0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i7OAxivN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i7OAxivN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46DB11F00893;
	Fri,  5 Jun 2026 13:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780664700;
	bh=/GodnUQQx7uUtG2VDyFkzePowyjR7EJVUWg7jyx9itU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i7OAxivNwpYyMnpUJUWmZzbH48/PE4+N89guXEcAQcSozMdsMew6Av9BBocSGhuHK
	 zKeuqjxzVlR0hXToPA347Q4trfco/d5gWWFl3QLPV+pDeL3s1S5RyWqU/pEynNhLg4
	 CIp2D/9tkuYbIQ2l6gxpn082w2zqhEv90YH+vsgEhBOzDXxghUm4krg3Y/lURRnW+j
	 kzZjbNcpFcSMWcqYWjg8aVs2+7HmNbqq0BEE1M2q7kpDujZlMO7INyPcvBh5bvwz6i
	 aWlbmWUBI6xU5v84GMThDMIQ3iWppQcEYLJSeX+3HFI2QihoE3mUXM4R+N5NqZuFJK
	 wzl2z+wxXRjlg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/10] ASoC: renesas: fsi: Move
 fsi_stream_is_working()
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260605121955.105661-5-phucduc.bui@gmail.com>
References: <20260605121955.105661-5-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 13:04:59 +0000
Message-Id: <20260605130500.46DB11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Time-of-check to time-of-use (TOCTOU) race condition in `fsi_strea=
m_is_working()` leading to a potential NULL pointer dereference or disabled=
-clock hardware access.
- [High] Asynchronous DMA callbacks (`fsi_dma_complete()`) can execute afte=
r hardware clocks are disabled or the stream is stopped, leading to a syste=
m hang or NULL pointer dereference.
--

commit 4ad703aa1dde6474675b4563473c933ef82894b5
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: renesas: fsi: Move fsi_stream_is_working()

Move fsi_stream_is_working() before fsi_count_fifo_err().

> This prepares for a subsequent patch that needs to check stream status
> when handling in-flight IRQ handlers. No functional changwqes intended.

[Severity: Low]
This isn't a bug, but there is a typo (changwqes) in the commit message.

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 94ab2e4908108..429c3c9b6ede4 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
[ ... ]
> @@ -442,6 +442,16 @@ static int fsi_sample2frame(struct fsi_priv *fsi, in=
t samples)
>  	return samples / fsi->chan_num;
>  }
> =20
> +static int fsi_stream_is_working(struct fsi_priv *fsi,
> +				 struct fsi_stream *io)
> +{
> +	struct fsi_master *master =3D fsi_get_master(fsi);
> +
> +	guard(spinlock_irqsave)(&master->lock);
> +
> +	return !!(io->substream && io->substream->runtime);
> +}
> +

[Severity: High]
This isn't a bug introduced by this patch, but is a pre-existing flaw that
invalidates logic added later in the series.

Can this Time-of-Check to Time-of-Use (TOCTOU) race condition lead to a
NULL pointer dereference?

fsi_stream_is_working() acquires master->lock, checks if io->substream is
valid, and then releases the lock. In callers like fsi_pio_transfer(), this
boolean result allows the code to proceed and unconditionally dereference
io->substream via fsi_pio_get_area():

    if (!fsi_stream_is_working(fsi, io))
        return -EINVAL;
    buf =3D fsi_pio_get_area(fsi, io);

If fsi_stream_quit() runs concurrently on another CPU during
SNDRV_PCM_TRIGGER_STOP, it sets io->substream =3D NULL under the lock. Since
the FSI IRQ handler does not hold any stream locks during this path, could
an in-flight fsi_pio_transfer() pass the working check, get preempted while
another CPU clears the pointer, and then dereference NULL?

Additionally, does this invalidate the fix added later in the series for
register access from in-flight IRQs? Since fsi_stream_quit() is called after
fsi_hw_shutdown() in the trigger sequence, io->substream is still non-NULL
when the clocks are disabled. Will this cause fsi_stream_is_working() to
erroneously return true and allow fatal clock-disabled register reads?


[Severity: High]
This is also a pre-existing issue, but involves the broader shutdown sequen=
ce
that this series modifies.

Can asynchronous DMA callbacks execute after hardware clocks are disabled or
the stream is stopped, leading to a system hang or NULL pointer dereference?

During SNDRV_PCM_TRIGGER_STOP, fsi_dma_push_start_stop() uses
dmaengine_terminate_all(), which does not synchronously wait for in-flight
DMA callbacks to finish. Immediately after, the driver calls
fsi_hw_shutdown() (disabling the SPU clock) and fsi_stream_quit() (clearing
io->substream).

If a pending fsi_dma_complete() callback executes after fsi_hw_shutdown(),
it unconditionally calls fsi_pointer_update(), which dereferences
io->substream:

    fsi_pointer_update(io, io->period_samples);
    fsi_count_fifo_err(fsi);

If fsi_stream_quit() has already executed, does this cause a NULL pointer
panic?

If the callback executes between shutdown and quit, it continues to
fsi_count_fifo_err() which reads DOFF_ST and DIFF_ST registers. Because
the SPU clock has already been disabled by fsi_hw_shutdown(), will accessing
these registers cause a synchronous external abort and hang the system?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605121955.1056=
61-1-phucduc.bui@gmail.com?part=3D4

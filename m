Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A2A390212
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 11:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006147; cv=none; b=lCtRNmfiw4TOPPlrTbNy2xwCoBeuuLkikXTgxfWXDOqNz4nG5UP3Czn4mf7Cnjkw/abwEer65jaaP8FW4xz0rDFyNubJDQ2y2Q3NEJZqN+ya4GdL8HrrV4/NnbmocFJQASCk8LuR/R9Ssr1yLFJ0C9tU9qnEUfg4pVsksOcbInI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006147; c=relaxed/simple;
	bh=zmskRAQPtHdPD9Ei/DZhlIC/7scs+vjNLxYuZugSBMU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uX4dMQkV8RoDkOV8rLdoQlY8uIFwGrvySRolBb9QUhjT1YD4MiG4Lqy/pX72mM9U3fseblTPQtNdA2O3CkkFGOMXZxuUiqrbKutbhspUffQbC+VsFHCciw4mcgQ4bbUjVMclkT6D/Crka31gjxG2qS+2BVHlDynT316vje5IuAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NmHV6Wqv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NmHV6Wqv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E64D11F00893;
	Tue,  9 Jun 2026 11:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781006146;
	bh=ZywsTAa571kmD5dL+wK0VSl89P03woGjfiKJedy1K7w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NmHV6WqvXHSBajhzIxuANUhwVkJvK8NUoRPTWwBffS8A51wbGoXAGNc6nKdItf4EB
	 qXVKLhIhVUIpDG27Vo5HgX4aFR+zVjFarD/LD+OHfUYzjlLRNiWOP0M7yn5HsMdUJd
	 R1juC5PImr/T2oHve9L+7i2Dv6kmGF0tK4nO/SlIe6942QyLldZfQWc7YC0A44kksw
	 2QlI4oUWKxj54zZEpYnz7k9PxFdaLWxhkwhMBZlSa8RVd7mHmF6hGRcAvFxwngQKEN
	 n9OBgAAl3Mc6FimVJbalmIHTRjuvPYDU4ZG4bJmYUe5kSf55UrG9MlWqXj7KN0crpd
	 h1ihcLsubgqTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 06/11] ASoC: renesas: fsi: Move fsi_clk_init()
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260609113836.45079-7-phucduc.bui@gmail.com>
References: <20260609113836.45079-7-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 11:55:45 +0000
Message-Id: <20260609115545.E64D11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver releases DMA channels in `fsi_remove` before the devm-m=
anaged ALSA component is unregistered, leading to a NULL pointer dereferenc=
e.
- [High] TOCTOU race condition in `fsi_pio_transfer` leads to a NULL pointe=
r dereference on `io->substream->runtime`.
- [High] Concurrency bug and logic error in `fsi_clk_enable` breaks full-du=
plex audio and corrupts the shared clock refcount.
- [High] Unintended clearing of shared interrupt status causes dropped inte=
rrupts and audio dropouts for concurrent streams.
- [High] Missing cleanup on hardware startup failure leaves a dangling subs=
tream pointer, leading to a Use-After-Free.
- [High] Recursive fallback to PIO mode in `fsi_dma_probe` causes a permane=
nt DMA channel leak.
- [Medium] Data race on hardware error registers and error counters causes =
dropped interrupt events.
- [Medium] PIO transfer functions perform raw 16-bit memory accesses withou=
t endianness conversion, corrupting audio on Big-Endian systems.
--

commit 143abdd60b62ddb2bbcd91ac88b1dcc0e574a4ad
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: renesas: fsi: Move fsi_clk_init()

Move fsi_clk_init() after set_rate() functions to prepare for subsequent
refactoring.

> diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> index 3e3c6fd7c56b8..1df7dc0143630 100644
> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but I wanted to ask about the cleanup
sequence in fsi_remove().

It appears fsi_remove() calls fsi_stream_remove(), which eventually
calls fsi_dma_remove() and sets io->chan to NULL:

fsi_remove()
   fsi_stream_remove()
      fsi_dma_remove()
         io->chan =3D NULL;

Since the ALSA component is registered with devres, it is unregistered
after fsi_remove() completes. During this devres cleanup, ALSA stops active
streams by invoking fsi_dai_trigger() with SNDRV_PCM_TRIGGER_STOP, which
calls into fsi_dma_push_start_stop():

fsi_dma_push_start_stop() {
        ...
        dmaengine_terminate_all(io->chan);
        ...
}

Does this cause a NULL pointer dereference on unbind if a stream is running?

[Severity: High]
This is a pre-existing issue, but does fsi_pio_transfer() have a race
condition during stream stop?

In fsi_pio_transfer(), the code briefly takes a lock inside
fsi_stream_is_working() to ensure io->substream is valid, but then
locklessly calls fsi_pio_get_area():

fsi_pio_transfer() {
        if (!fsi_stream_is_working(fsi, io))
                return -EINVAL;

        buf =3D fsi_pio_get_area(fsi, io);
}

fsi_pio_get_area() dereferences the substream:

fsi_pio_get_area() {
        struct snd_pcm_runtime *runtime =3D io->substream->runtime;
        ...
}

If the ALSA core concurrently triggers SNDRV_PCM_TRIGGER_STOP on another CP=
U,
it calls fsi_stream_quit() which sets io->substream =3D NULL. Could this
cause a NULL pointer dereference in fsi_pio_get_area()?

[Severity: High]
This is a pre-existing issue, but I have a question about the logic
in fsi_clk_enable().

fsi_clk_enable() {
        int ret =3D -EINVAL;
        ...
        if (0 =3D=3D clock->count) {
                ...
                clock->count++;
        }

        return ret;
}

If one stream is already running (so clock->count is 1) and the opposite
stream starts, this skips the initialization block and returns the
uninitialized -EINVAL. Does this break full-duplex audio by failing the
startup of the second stream?

Additionally, fsi_clk_enable() and fsi_clk_disable() increment and
decrement clock->count locklessly. Since playback and capture can be
triggered concurrently, could this corrupt the shared clock refcount?

[Severity: Medium]
This is a pre-existing issue, but is it safe to read and modify these
hardware registers locklessly?

In fsi_count_fifo_err():

fsi_count_fifo_err() {
        u32 ostatus =3D fsi_reg_read(fsi, DOFF_ST);
        ...
        fsi->playback.oerr_num++;
        ...
        fsi_reg_write(fsi, DOFF_ST, 0);
}

Since this function can be invoked locklessly from both fsi_interrupt()
and fsi_dma_complete(), could concurrent execution cause lost hardware error
bits or corrupt the error counters?

[Severity: High]
This is a pre-existing issue, but I wanted to ask about the interrupt
clearing logic during stream startup.

During stream initialization in fsi_hw_startup(), fsi_irq_clear_status()
is unconditionally called. It constructs a mask that includes both playback
and capture ports:

fsi_irq_clear_status() {
        data |=3D AB_IO(1, fsi_get_port_shift(fsi, &fsi->playback));
        data |=3D AB_IO(1, fsi_get_port_shift(fsi, &fsi->capture));

        /* clear interrupt factor */
        fsi_core_mask_set(master, int_st, data, 0);
}

If one stream is already actively running and the second stream is started,
will this unconditionally clear any pending interrupts for the active
stream, potentially causing dropped frames?

[Severity: High]
This is a pre-existing issue, but does fsi_dai_trigger() leave a dangling
pointer if hardware startup fails?

In fsi_dai_trigger():

fsi_dai_trigger() {
        ...
        fsi_stream_init(fsi, io, substream);
        if (!ret)
                ret =3D fsi_hw_startup(fsi, io, dai->dev);
        if (!ret)
                ret =3D fsi_stream_start(fsi, io);
        ...
}

fsi_stream_init() unconditionally assigns io->substream =3D substream.
If fsi_hw_startup() fails, it returns an error but does not call
fsi_stream_quit() to clear io->substream.

Since the ALSA core will destroy the failed substream runtime, could a
subsequent interrupt trigger fsi_count_fifo_err(), which invokes
fsi_stream_is_working() and evaluates the dangling io->substream->runtime?

[Severity: High]
This is a pre-existing issue, but I wanted to ask about the fallback
logic in fsi_dma_probe().

If the DMA probe fails for capture, it switches the handler to PIO and
calls fsi_stream_probe() recursively:

fsi_dma_probe() {
        io->chan =3D dma_request_chan(dev, is_play ? "tx" : "rx");
        ...
        /* fallback to PIO */
        ...
        return fsi_stream_probe(fsi, dev);
}

The recursive call to fsi_stream_probe() will loop over both streams and
probe playback again. Since playback's handler is still DMA, it executes
fsi_dma_probe() a second time.

Will this unconditionally call dma_request_chan() for playback and
overwrite the existing io->chan without freeing it, causing a DMA
channel leak?

[Severity: Medium]
This is a pre-existing issue, but does fsi_pio_push16() handle endianness
correctly on big-endian architectures?

ALSA formats S16_LE and S24_LE define audio data as little-endian.
However, the function casts the buffer directly to a native u16 pointer
and reads it:

fsi_pio_push16() {
        u16 *buf =3D (u16 *)_buf;

        for (i =3D 0; i < samples; i++)
                fsi_reg_write(fsi, DODT, ((u32)*(buf + i) << 8));
}

Similarly, fsi_pio_pop16() directly casts and writes into the buffer:

fsi_pio_pop16() {
        u16 *buf =3D (u16 *)_buf;
        ...
        *(buf + i) =3D (u16)(fsi_reg_read(fsi, DIDT) >> 8);
}

On big-endian systems, wouldn't this yield byte-swapped data before
writing to the hardware registers or into the ALSA buffer? Should it
use little-endian conversion helpers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609113836.4507=
9-1-phucduc.bui@gmail.com?part=3D6

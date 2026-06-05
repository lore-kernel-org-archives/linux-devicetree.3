Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D4E30568D
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662423; cv=pass; b=k5NXOXKJpRfmmfd5cmq7jK/i6MdHJexOX1dwJbOaF13bdNPMApzueh/NvHbswmcVI3toPukcO+fJwzEkvmZZwE6H/eSWcgJPGsRdeH5/Nr46JqF0DPPKeIraaZ574KscBd+YPgLVMv7AkDJa9HEk/o9pMwx8h856ZUfBiCEBohs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662423; c=relaxed/simple;
	bh=xRyIoJkiWmYFBusBGMqgFvQtAqkYAb4bTRPHKxP1J5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2NSOVSRzRvB06gxEyt+pDX0cndgg+nhO+IVHC8ntAV4oBBlY1BjNTJPufvDlkVhH3u4AgV4zUCtu/aoY3MirWE8ewQBp8uV2xsYsX+h1+jEJn4ldStW1TGcEzg1G1/m2DPC+op7HMUZmtymRQQwzJvpHyqnA4xquMG5CBRqIa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVbOLJN9; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVbOLJN9"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bf36a6905cso12807605ad.3
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 05:26:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780662418; cv=none;
        d=google.com; s=arc-20240605;
        b=KKp5iPMzd1EwFMiw+uBkCcmf2/Ycu5SWTEn3y0R/XJ8dmqFBzN+7zIKvWsTo05+14e
         Qc4cOtUTafXjCJbueYi28zcR9zd+bR4aEr6A2KZWu965u7TUbCxgi8TUZ6puYADpBC1N
         Olw2rpP7nJNRgbr/aG22wgLjppwlZiEaah2rUqAy45JXfa4+DdSWqKG/DG+T1+TL88aX
         3S4htfYsOp1MvnGu8aC78cTqIS9edNkmu3tPg8rB90Ko6DPzxk9xAXW4ImNuoV/HbYGs
         ZjLrjAIVINrCF55GqPxX785PzlnGvcXiQnB+CH4+OUPEn1/V8ec+xXTKA5xx9eg8d3OA
         e3Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ssGNGVnOiVxBL6C23hP126AB3gXcNT/8fTpeLJ+MunY=;
        fh=SEkX80ucuogthtlspW1/riM7D+rSRJBbP0gPhb2dGm0=;
        b=OV1CETLa0wCBJxZaAsZhmgBa2+mgpMujnO/e3pd64XgVORXnsCS5ej9g+AreTFrvBs
         G3QEZy/Q7HOAF5pSpLxEFLoaqvv/CzAVm6DYTcxL0oLJzTD8PGVirbRHC5l+Eyv9e115
         Q2aMDzteiaT33WTj7AsUSDwGzS6Tp6TzSb9vBkmSBlrIw6LCwZwu7ydG266RyrrblXoz
         LTf2FSLN33fueJT9dmc4JYdMvLNDNbhDNI+amkwadsHoO5S08t2ehtwb3+0YtEYRpjlO
         8c9E023pTRi05uI7MJS85aIvAqIzQKj5+J3MXlhvjRpY78bH0jzcV9keVIm6DIersjs2
         RHeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662418; x=1781267218; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssGNGVnOiVxBL6C23hP126AB3gXcNT/8fTpeLJ+MunY=;
        b=GVbOLJN949vdwxDiD7mOkptJeQme7Dk8EQnV+roEPTEC6zJ9mtXdFT7xPfZaTZYHdp
         0x80ICgiZRGUKoB6szAFOo9Irqz+RrUkrQykIRrKrqh6RLiBcEfNIf0UXyLxK6+7ZV7X
         VCgApO2fp9ySiiGlexhevUuRM3F50T806b+gFK68NFim7+1iDRBdJodYXxuOMGru0OQn
         8SZrnk46x1y9517ueeEVNSKkuaseA7nBOF2BGwpCkLR3TH83hFPrW9+RgYN6tsapl2fx
         8lFS/EbAAR55TAYjISLu3hmoomeWa+Zgv/1E7s9/s30iIr/H/jr+YC0OPp9kDG/xa5jz
         903A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662418; x=1781267218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ssGNGVnOiVxBL6C23hP126AB3gXcNT/8fTpeLJ+MunY=;
        b=CqEmu1IhQP3uoVkJWbUJaGn3smKqQwsZLPgTgvMwIIaUVNtZ4W49fxMGVLQsSG0n6S
         VMl2mCC62LlTtK8B9sSd0+entYFCjy3l1AsCRE/8DpxrmAx3gZYpBNM+K3OJ2XWeZiDC
         3cUMC+VKmF0495vcXMeY69RJCOlY17vX6eccDeyWRnDtHcNnRCWaCFBhoE8oF7UZU+Dk
         mpUdlh/YqcoUsoN8PTPvx2l7izPPhRhyrgpBWrrlWXloTt2ZiHnEG9Iy/INDH2PPeIbu
         fYbfN4m7XJ2XSe51U4M7zUNV/HQkEwnYjoMsu5jA8+F0H0r7MwjrW9Ux3lREaFrRo42N
         1bBA==
X-Forwarded-Encrypted: i=1; AFNElJ9dDeigTHdH8bXCkw+R8asnb3ZyXz1UgsbGcfP6qQ/SQr8VR1sifNUVOVOXerkEFurtHh1jCv12ti2Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyavK+XXkVMmnyQXq2T9UNeuXcHqtumRhFk+ovJkY3yQfe2PDKQ
	A0R7fTh3ripZAhAYvPc5ZMZ6hJEKYT/LiDfZ4km/CSlLxpwiOG+0eKdE3gnjsMvsFG8IMmcYuGv
	wqCD7v+QEWprcRJeBAtPH8R+kQl/AX1c=
X-Gm-Gg: Acq92OFtCGUG7ByHCOueFTEZ1LF3IXPKBvkJ7VEmyCnTGhBAPmce4DWe25novoT/1dt
	LJC3EfDN+wc3OYKAmGFF9Q6674Dd+JTCEC4/2fQp0ODJeU/AGKURokOJSWgf3b4CoZ7tWLxaQhj
	HmJDOJLxNpyJfv2/SOaDPdQdzHB5FV+60tDe1+eC2doROjbWk3fW0N4FrbScqpQivqFCx8wKA3C
	T3yG0L7BB3n5IWweG6QPdjq0PCHqQ9OZJ2D2QeZ3OQJ6kZFptI03BhcJBEXRqHBDp3SrBN0Be2G
	9T/GjcD8USXVPmTnwyJbATu6z+0iLdrnuqGmmFdQBhVHZt4x
X-Received: by 2002:a17:902:f711:b0:2c0:f807:9bf3 with SMTP id
 d9443c01a7336-2c1e7e619afmr36032955ad.10.1780662418276; Fri, 05 Jun 2026
 05:26:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510084303.122426-4-phucduc.bui@gmail.com> <20260511224436.A0B19C2BCB0@smtp.kernel.org>
In-Reply-To: <20260511224436.A0B19C2BCB0@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 5 Jun 2026 19:26:46 +0700
X-Gm-Features: AVHnY4KlForSbJj-T4sYhoMos5-qD93OAeW7Ky_lKkfAhDdxYrZzSVLpgVzlQsQ
Message-ID: <CAABR9nHfTtnUxLoq6rHJVmkjWjrAqqU1tawvAKQi-06_XXsKAw@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] ASoC: renesas: fsi: Fix trigger stop ordering
To: sashiko@lists.linux.dev
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The points raised may be valid.
However, this patch series is currently focused on fixing the system hang i=
ssue.
The other concerns will be addressed in a separate follow-up series.

On Tue, May 12, 2026 at 5:44=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] TOCTOU race and lack of synchronization in stream stopping leads=
 to NULL pointer dereference.
> - [High] Teardown asymmetry in `fsi_remove` leads to use-after-free and N=
ULL pointer dereference.
> - [High] Lockless read-modify-write on shared FSI port registers causes h=
ardware corruption.
> - [High] Lockless modifications to shared `clock->count` cause reference =
count corruption.
> --
>
> commit 7ce4e3deeaefe8e811044e7b0472a2e9a2ae1d64
> Author: bui duc phuc <phucduc.bui@gmail.com>
>
> ASoC: renesas: fsi: Fix trigger stop ordering
>
> This commit reorders calls in the stop trigger to execute fsi_stream_stop=
()
> before fsi_hw_shutdown(). It ensures register accesses complete before th=
e
> clock is disabled to prevent a system hang.
>
> > diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> > index 8cbd7acc26f49..94ab2e4908108 100644
> > --- a/sound/soc/renesas/fsi.c
> > +++ b/sound/soc/renesas/fsi.c
> > @@ -1586,9 +1586,9 @@ static int fsi_dai_trigger(struct snd_pcm_substre=
am *substream, int cmd,
> >                       ret =3D fsi_stream_transfer(io);
> >               break;
> >       case SNDRV_PCM_TRIGGER_STOP:
>
> Playback and capture substreams on the same FSI port share port-level
> configuration registers like CKG1, CKG2, and OUT_SEL.
>
> Since the ALSA core serializes triggers at the substream level using
> the self_group.lock, playback and capture triggers for the same DAI
> can execute concurrently on different CPUs.
>
> Does fsi_hw_startup() perform lockless read-modify-write operations on th=
ese
> shared registers, and can this lack of exclusion lead to lost writes and
> corrupted hardware state?
>
> > +             fsi_stream_stop(fsi, io);
>
> During a stream stop, fsi_stream_stop() disables DMA via
> dmaengine_terminate_all() and masks device interrupts, but it does not ap=
pear
> to wait for in-flight DMA callbacks or IRQ handlers to finish.
>
> Concurrently, an executing IRQ handler calling fsi_pio_transfer() will
> temporarily take master->lock in fsi_stream_is_working(), drop it, and th=
en
> locklessly access io->substream->runtime inside fsi_pio_get_area().
>
> Similarly, an asynchronous fsi_dma_complete() callback unconditionally
> dereferences io->substream in fsi_pointer_update().
>
> Since there is no dmaengine_terminate_sync() or synchronize_irq(), could
> fsi_stream_quit() race with these callbacks and clear io->substream,
> resulting in a NULL pointer dereference?
>
> The driver uses managed resources during fsi_probe(), meaning the IRQ han=
dler
> and ALSA component are unregistered after fsi_remove() returns. However,
> fsi_remove() explicitly tears down the DMA streams via fsi_stream_remove(=
),
> which calls dma_release_channel(io->chan) and sets io->chan to NULL.
>
> Because the ALSA component is still fully registered and active while
> fsi_remove() completes, userspace can still trigger ALSA operations.
>
> If a STOP trigger occurs during this window, would calling
> dmaengine_terminate_all(io->chan) here cause a NULL pointer dereference?
>
> >               if (!ret)
> >                       ret =3D fsi_hw_shutdown(fsi, dai->dev);
>
> The shared clock state for an FSI port is tracked using clock->count insi=
de
> fsi_priv.
>
> Since playback and capture triggers for the same port can execute
> concurrently on different CPUs, do fsi_clk_enable() and fsi_clk_disable()
> manually modify this counter without holding any lock?
>
> Could concurrent updates to clock->count corrupt the counter, potentially
> leaving the peripheral clocks enabled permanently or disabling them while=
 a
> stream is still active?
>
> > -             fsi_stream_stop(fsi, io);
> >               fsi_stream_quit(fsi, io);
> >               break;
> >       }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510084303.12=
2426-1-phucduc.bui@gmail.com?part=3D3

Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC30431E83C
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784097754; cv=pass; b=l7sM+LRUbtj3Gg8zm3Lr9fvNYdVohMZ/2CceG8J2wCkfM0poCXKRrQeuAOm5HGl8O1vyMi6VTd5xSI24iOkdeQvcUUY3ZdOLdV6y0jt3vt/8tJws8oMg+qSAmn9dMpMvK6rnndm8oy6kNZoYGthnUxiFal91KtGf4uJbLtSOXt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784097754; c=relaxed/simple;
	bh=2lATJlO+d4dX1ZGzZ6Ij2Thcx3Vi5FaF9agRcuMNiUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qef9DJxxwdHeZLpSPVKMDl6P1W1rHwAGTfSubCnXMcPWVqn6Z0Air8NiUD9bu1zCIMwGE+qq/b5Whw34kL83RrJFjMv6VxfEifhzjFXy5eYbRJvaPDXVSA91/PIz14bI3+Igbl53wGu4TVQuniRxOuIJ3bOIgWnypu3zDslJvio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l797vVjg; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l797vVjg"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-662d984bedeso781846d50.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 23:42:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784097752; cv=none;
        d=google.com; s=arc-20260327;
        b=o7Y49T7vKw+vME9oa/rxKN0hUbuKDx45yQaZuiFjW2S3ckgZbZ2MulBP4L5ZdaxGaQ
         k9HA2v5ptdntgNQ067tKfvTZer7Dnoy1gUI/f0kEu3v2bpLVKg073AmDhxZ/A3KvbEcE
         FRofMfs7v3WwFASuPd0xtnouPYg6XVtoYdaJgJXlikmE/kia0W5tWpRfsgqxh/XTc1db
         uALTNleNVnHoAdFp2t//BCbXpoL+GrDs6N+aX4CFLrG9SHG/8QHHkIFc3PdZNUzAtQ2P
         r7IbxAYiWUuJBfKSjTT8wYTBzfRuUn74uRePf9Dfhn5ie+65K7RbIXa5Xyv/v7kNk98G
         cvaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IC2NFXdk1sBeNCjIzes4BsGyhl+tCtt5hT8/Hup8Wto=;
        fh=x0bPAVX9WiIV1EKTf0EZ397ICilfV3uoNhph4hP3cgs=;
        b=mGDTHVI3tshcry0vp+su3RnkKAJ6ceHrh0UPKymg6py3CSNeRqzTsal/XVwzg6jCgv
         OtxfhmxsOS49cJGSa7jTJ9qw66l4KqU23+7/jLnnME33J3wsADALHbtoigY6TvVfq8br
         Qt6lurftzCVafskOkJyjb3395dXBXxVtWnZHlRo+58x9aov4lM6cx/8E82NB8KwOqn+Q
         AzitYS8N77GrFE1gh2ZqhPxm53tSgDdmUK2PZkdRv/5oj6/Lu9UTqjp39It6KhW5v4Ih
         dhRDudUFEYxXvHBagQ57cwHpTZ19zPcvkn6Y4PINidYoXqnu/sd+Wm5sXROC06OEmRcT
         uScg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784097752; x=1784702552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IC2NFXdk1sBeNCjIzes4BsGyhl+tCtt5hT8/Hup8Wto=;
        b=l797vVjgtB7xMulmmmx2Gp6jFggBW8+/CJeVOxVaUvdl7kUtXEDz1GoaQTQfFzQpOc
         W1kQ6Ds1H0+XUMkOiAXbmIhYZF/rh9tVVG269SiY4OolColIC93SHUeg1lB87JeuQ+kJ
         bbt3e2sRanGIPDprOQWHQFhUZ5iZF1xIGIu3n3lr409kKBKQ0uPSzEnSMBROZHeiArr7
         E/fj0Tgo4HPq5m0LMv9BNE5TtutWj8yj30yEk02SWCe/7DDojduwOIqtdp3FyKKvX8lr
         ySLpAL9YbXbPmomOag6r94ZbqHVEQO8fM+plRR03qO0D+rk/swredMmwIkwXgnsWScKe
         du1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784097752; x=1784702552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IC2NFXdk1sBeNCjIzes4BsGyhl+tCtt5hT8/Hup8Wto=;
        b=nZRikl52DnEPEmmnoH2tbmxS27gjYNz8ah1Y+be+Scl7KxXvL80nLBcPBuxhiDyiq0
         hC+G7ek1urRQvGkEvp4o7HKUQ7kB8PUc2UyKZsQ1gTIBbSpQZmUREU6AvB++aJUQ5JyD
         ev1PX/Owr/sFlVNQfSTaTCBcQ/6NoOzurnXYsSsNHTYYbKqHXOsZ7qC+pnCcbL62QdNO
         fmGG7KbtTaM3rMxygdxKSphtBqoFPq56U6IvOrY+2b51BM/cAp+1MhwC53p5NlbS4C/z
         beaXRepvHEEUuQvZIGpa+nCsOtriv9Lit6O7nsyolkYJO/j5PUi2POAbfP3Zu9Bkqra/
         wpZg==
X-Forwarded-Encrypted: i=1; AHgh+RrBZbH6DyVwjQcMUb1g9Keb8U9q/QAsiM5lIQu/x0WZCI/r4PedhMLUt/fPnzlpyAbee3wkVWyUrHHD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/e63ehZqXQ4t4rhYxdDv/9Zd1LnC8/jXATjTQHyWjiauOzoI4
	TWjPg76YOQ8Lh73sR9meQ2lemoDtYkTM75x+IfMBg7jyuj5gIkntLdQIOhJDM69tewi1GtHwkrg
	RPeiH14rjzlqYF1VJyV+2EN/TSbFwS7qzy95uCAc=
X-Gm-Gg: AfdE7cmeiBbwqbGUQOjvL45/4EAq34CjkB2cklqQZQEviswrohiVNqEMoVuvmerByJk
	CUiJfcKesGr0+dGGY7oWg+awV39v9cOhRJT86Zb5g6xsyPc/SOqovMC9AD/s5Bkdvt0K4rjZSA0
	Em8vmNce948fY0KnAXH8PgUIMc3ZIjqndaAm13RKWojQDP1kCsB3OHHOd6Rq09wjUXgxNPR/1zj
	9Xj4PQaUvqqMOlXM6QnI0jL1ua0wxEFvyADCgYVFtG8Cm27uOGTw2ntdaEyD0gLQnQlTDkpTvCL
	TAemH2m36mCElosT0Jtxd/Z1KYP1k3Ldvsz5SODoJw==
X-Received: by 2002:a05:690e:450c:20b0:664:aa85:a7c0 with SMTP id
 956f58d0204a3-667d7f18d23mr8030795d50.7.1784097751826; Tue, 14 Jul 2026
 23:42:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715051939.64652-1-royalnet026@gmail.com> <20260715051939.64652-3-royalnet026@gmail.com>
 <20260715054820.E992E1F000E9@smtp.kernel.org>
In-Reply-To: <20260715054820.E992E1F000E9@smtp.kernel.org>
From: Royal Net <royalnet026@gmail.com>
Date: Wed, 15 Jul 2026 08:42:19 +0200
X-Gm-Features: AUfX_myD8dUZJn8UTdwbwOxs0r4AyRD-gaAa80tNslmI0JKUudkW6-nC1ipiUy0
Message-ID: <CAEWPSH6FTku9cY2i=R=v6saVP+uFJrNmb0dGFvTB9rPuata+EQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] media: synopsys: hdmirx: add HDMI audio capture support
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the thorough pass -- all five are in the new code, so all
five are mine to fix. Ack on each:

> - [High] Passing an ERR_PTR to platform_device_unregister() causes
> a kernel panic during module removal.

Confirmed. hdmirx_register_audio_device() leaves the ERR_PTR in
audio_pdev when registration fails (probe intentionally only warns),
and the NULL check in hdmirx_remove() doesn't catch an ERR_PTR. Will
store NULL on failure so the existing check works.

> - [High] Flawed teardown ordering and failure to clear the
> audio_streaming flag in hdmirx_remove() allows the delayed work
> to re-arm, leading to a Use-After-Free.

Confirmed. The self-rearm guard was added for audio_shutdown() but
remove() never clears audio_streaming, so a worker instance running
at removal time can re-arm after cancel_delayed_work_sync() returns.
Will clear the flag first, unregister the codec device (tearing down
the stream), and cancel the work last.

> - [High] Concurrent unprotected access to shared audio state
> variables between ALSA `hw_params` and the background worker.

Confirmed. A repeated hw_params without an intervening shutdown can
race the worker over audio_fs/audio_clkrate/audio_pre_state. Plan is
to stop the worker (clear the flag + cancel_delayed_work_sync) at the
top of hw_params before touching shared state, which keeps the worker
the only writer while it is armed and avoids introducing a lock.
> - [Medium] Unconditional access to `clks[1]` causes an
> out-of-bounds read if the Device Tree specifies only one clock.

Agreed -- index-based access is fragile even though the binding lists
the audio clock. Will resolve the "audio" clock by name from the bulk
clock data once at probe time and cache the pointer.
> - [Low] The audio worker item silently migrates from an unbound
> workqueue to the default CPU-bound workqueue after its first
> execution.

Confirmed; the re-arm path uses schedule_delayed_work() while the
initial queueing uses system_unbound_wq. Will use
queue_delayed_work(system_unbound_wq, ...) consistently.

All five will be addressed in the next revision, together with any
design-level feedback on the RFC itself.

Igor

On Wed, Jul 15, 2026 at 7:48=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
> - [High] Passing an ERR_PTR to platform_device_unregister() causes a kern=
el panic during module removal.
> - [High] Flawed teardown ordering and failure to clear the audio_streamin=
g flag in hdmirx_remove() allows the delayed work to re-arm, leading to a U=
se-After-Free.
> - [High] Concurrent unprotected access to shared audio state variables be=
tween ALSA `hw_params` and the background worker.
> - [Medium] Unconditional access to `clks[1]` causes an out-of-bounds read=
 if the Device Tree specifies only one clock.
> - [Low] The audio worker item silently migrates from an unbound workqueue=
 to the default CPU-bound workqueue after its first execution.
> --
>
> --- Patch [2]: [RFC PATCH 2/2] media: synopsys: hdmirx: add HDMI audio ca=
pture support ---
> commit a0cbe815be5692f1b4e770ef5f613ff1fa0b7862
> Author: Igor Paunovic <royalnet026@gmail.com>
>
> media: synopsys: hdmirx: add HDMI audio capture support
>
> The Synopsys DesignWare HDMI RX controller extracts the audio stream
> embedded in the incoming HDMI signal and feeds it to an on-SoC I2S
> controller. Expose it as an ALSA capture device by registering the
> generic hdmi-codec as a child of the controller.
>
> > diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/dri=
vers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> > --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> > +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>
> [ ... ]
>
> > +static void hdmirx_audio_clk_ppm_inc(struct snps_hdmirx_dev *hdmirx_de=
v, int ppm)
> > +{
> > +     int delta, inc;
> > +     long rate =3D hdmirx_dev->audio_clkrate;
> > +
> > +     if (ppm < 0) {
> > +             ppm =3D -ppm;
> > +             inc =3D -1;
> > +     } else {
> > +             inc =3D 1;
> > +     }
> > +     delta =3D (int)div64_u64((u64)rate * ppm + 500000, 1000000);
> > +     delta *=3D inc;
> > +     rate =3D hdmirx_dev->audio_clkrate + delta;
> > +     clk_set_rate(hdmirx_dev->clks[1].clk, rate);
>
> [Severity: Medium]
> Does this code access the clock array out of bounds if the device tree on=
ly
> provides one clock?
>
> The probe function uses devm_clk_bulk_get_all() which only guarantees
> num_clks >=3D 1, but this unconditionally accesses index 1.
>
> > +     hdmirx_dev->audio_clkrate =3D rate;
> > +}
>
> [ ... ]
>
> > +static void hdmirx_audio_work(struct work_struct *work)
> > +{
>
> [ ... ]
>
> > +     /* Only re-arm while streaming; avoids a self-reschedule race wit=
h
> > +      * cancel_delayed_work_sync() in audio_shutdown().
> > +      */
> > +     if (READ_ONCE(hdmirx_dev->audio_streaming))
> > +             schedule_delayed_work(&hdmirx_dev->audio_work,
> > +                                   msecs_to_jiffies(delay));
>
> [Severity: Low]
> Does this cause the worker to silently migrate to the default system_wq?
>
> The worker is initially queued on system_unbound_wq using mod_delayed_wor=
k(),
> but schedule_delayed_work() implicitly targets the default CPU-bound
> workqueue.
>
> > +}
> > +
> > +static int hdmirx_audio_hw_params(struct device *dev, void *data,
> > +                               struct hdmi_codec_daifmt *fmt,
> > +                               struct hdmi_codec_params *hparms)
> > +{
> > +     struct snps_hdmirx_dev *hdmirx_dev =3D dev_get_drvdata(dev);
> > +     u32 fs;
> > +
> > +     fs =3D hdmirx_audio_fs(hdmirx_dev);
> > +     if (!fs)
> > +             fs =3D hparms ? hparms->sample_rate : 48000;
> > +     if (!fs)
> > +             fs =3D 48000;
> > +
> > +     hdmirx_dev->audio_fs =3D fs;
> > +     hdmirx_dev->audio_clkrate =3D fs * 128;
>
> [Severity: High]
> Can concurrent ALSA hw_params ioctl calls race with the background worker=
 here?
>
> ALSA allows consecutive hw_params calls, which could modify audio_fs,
> audio_clkrate, and audio_pre_state locklessly while the worker is already
> executing on another CPU.
>
> Could this concurrent access result in an invalid clock frequency calcula=
tion?
>
> > +     clk_set_rate(hdmirx_dev->clks[1].clk, fs * 128);
> > +
> > +     hdmirx_audio_fifo_reinit(hdmirx_dev);
> > +     hdmirx_writel(hdmirx_dev, AUDIO_FIFO_THR_PASS, HDMIRX_AUDIO_INIT_=
FIFO_STATE);
> > +     hdmirx_writel(hdmirx_dev, AUDIO_FIFO_THR,
> > +                   AFIFO_THR_LOW_QST(0x20) | AFIFO_THR_HIGH_QST(0x160)=
);
> > +     hdmirx_writel(hdmirx_dev, AUDIO_FIFO_MUTE_THR,
> > +                   AFIFO_THR_MUTE_LOW_QST(0x8) | AFIFO_THR_MUTE_HIGH_Q=
ST(0x178));
> > +
> > +     hdmirx_update_bits(hdmirx_dev, AUDIO_PROC_CONFIG0, I2S_EN, I2S_EN=
);
> > +     hdmirx_update_bits(hdmirx_dev, GLOBAL_SWENABLE, AUDIO_ENABLE, AUD=
IO_ENABLE);
> > +
> > +     hdmirx_dev->audio_pre_state =3D 0;
> > +     WRITE_ONCE(hdmirx_dev->audio_streaming, true);
> > +     mod_delayed_work(system_unbound_wq, &hdmirx_dev->audio_work,
> > +                      msecs_to_jiffies(200));
> > +
> > +     dev_dbg(dev, "audio hw_params: fs=3D%u\n", fs);
> > +     return 0;
> > +}
>
> [ ... ]
>
> > @@ -2765,6 +3001,10 @@ static int hdmirx_probe(struct platform_device *=
pdev)
> >                                                      V4L2_DEBUGFS_IF_AV=
I, hdmirx_dev,
> >                                                      hdmirx_debugfs_if_=
read);
> >
> > +     ret =3D hdmirx_register_audio_device(hdmirx_dev);
> > +     if (ret)
> > +             dev_warn(dev, "failed to register HDMI audio codec: %d\n"=
, ret);
> > +
>
> [Severity: High]
> If platform_device_register_full() fails in hdmirx_register_audio_device(=
),
> it returns an ERR_PTR which is stored in hdmirx_dev->audio_pdev.
>
> Since this failure only logs a warning and allows the probe to succeed, w=
on't
> the check in hdmirx_remove() evaluate to true?
>
> if (hdmirx_dev->audio_pdev)
>     platform_device_unregister(hdmirx_dev->audio_pdev);
>
> Will this cause a kernel panic when platform_device_unregister() attempts=
 to
> dereference the ERR_PTR?
>
> >       return 0;
> >
> >  err_unreg_video_dev:
> > @@ -2784,6 +3024,10 @@ static void hdmirx_remove(struct platform_device=
 *pdev)
> >       struct device *dev =3D &pdev->dev;
> >       struct snps_hdmirx_dev *hdmirx_dev =3D dev_get_drvdata(dev);
> >
> > +     cancel_delayed_work_sync(&hdmirx_dev->audio_work);
> > +     if (hdmirx_dev->audio_pdev)
> > +             platform_device_unregister(hdmirx_dev->audio_pdev);
> > +
>
> [Severity: High]
> Could the worker re-arm itself after this cancelation?
>
> If the worker is running during removal, cancel_delayed_work_sync() waits=
 for
> it to finish. However, because audio_streaming is not set to false prior =
to
> this call, the worker will see audio_streaming =3D=3D true and re-arm its=
elf.
>
> Additionally, since platform_device_unregister() is called after the time=
r
> cancelation, could userspace trigger a concurrent hw_params ioctl and re-=
arm
> the timer through that path?
>
> Will the re-armed timer execute on freed memory after the device is remov=
ed?
>
> >       v4l2_debugfs_if_free(hdmirx_dev->infoframes);
> >       debugfs_remove_recursive(hdmirx_dev->debugfs_dir);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715051939.64=
652-1-royalnet026@gmail.com?part=3D2

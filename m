Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B853DD530
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786971086; cv=pass; b=TiSpm15cHy34owK0kITE1UTzloOmK87vskgPDiM66Q3Epa3zjt0wUy1tr9Ma4zzwk+XFXIYhjVTIOIplntN2w1RWYqKyE9QyUw9qAzkwjMlqlxUeXP0mkNr8j8yMkC8g1L6MfjrBdDWblxoW6CUW3KhcPz4OKo+Diezx6ZcsLas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786971086; c=relaxed/simple;
	bh=tyz9EcqboelxA3psXnq/gGKah+H4IaeTuowTMl/uuqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KmAVg5cM2i//OX6a33BOsDCEzHitnxG4QhtenyGR4FJ6T2UnXzHrndFtfbt2QiGJ6xHy9cPwc1Rf+Bpae6s67ymEgBoB8qK3Kskf6CoPU/70w0RZMpcV37g5JnIcaI3yAEyqO6dDbsKwY6XM6q6cLv560281iCQb7anEiYNWMuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVamGXzG; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVamGXzG"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-81e8c68c0cdso2061017b3.2
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 05:51:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786971084; cv=none;
        d=google.com; s=arc-20260327;
        b=iOyAmMiD8dOvPQQg7c+M0kU0fqOClX7mqe1+z1vwvlSXGlVe8NY7rughiBleNoaoTx
         i+/NFYeTLjxynTsgpSnl6FXoX5VoGDLDwyS4ifhb9R9z6KhFSeBLMG1Nrw9Z0TdUqEX8
         tY+eiqorW4fup5ctGP9ii6frGkvzdjxPi10GCWRsP75I1xGjclGGFlNkhvXluJQf4mof
         mzJSCoayT8h5mPvhlPTbE1DPzjfbJudFDLcwA9ygLlqumZrSuTkHp4vNmCVkd8Ve9LFL
         fxj503kjkyNLKGQpZZZfuRL8JPfkE78Tyyu4Q0yrB7Bz9MSFF/R9K8qDFL9makxD0al7
         uzew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IsoFeL55aXnoSLzM6IlQSU+HvX9Cmm12pl1T+E59Rcg=;
        fh=epW61VrrvI3LUaaDgroSO3c876fE5iA/2fnhHgv0d1E=;
        b=BWvOxaG9qt2jcdibckmpHmlHmWImb0S34e+VEJq50RPJdLo14D9D5h7d+pIpiTX+Yj
         fd19UJ4OXAQFeSWLW0YVmtMK8Du8kz5Sbcu0z5ahjXZVcgegr+Vo2RJS5c/ebFrJnNfv
         V80sEJBd+ShNMejiNf8NcGqxB7psOBMzxqqMTxXr1LcnvVFYyaDrsCBLXijqems3J2GS
         ObIGZPk99VDWKfGewtyRJU1Ow0KLW9R0cykCqReu8kYIzaPvRmq4H9IeJc+XSRZc7/TM
         Y24M1K6QEjQdds6aJYs7XiiysO8IWV9StQMTVhEZaKIi8hO5oiHHMNmGtsxtzHn15mQa
         LoDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786971084; x=1787575884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IsoFeL55aXnoSLzM6IlQSU+HvX9Cmm12pl1T+E59Rcg=;
        b=RVamGXzGTBQe4nUqxk8JcQV4dzF6Iuqg/A3aq93CT0XlWqjrArO3RG8bkShRxiADXI
         Xb+2O1a8cRVVG4X1aJq+3g1Gdr0X3iAAKaOuf0v9lVGUPpoWMXkG06LucFFwDFGIwOkB
         mbxiuwiqk4k9EZOCzrFB/yfduyd76b47u5OVt/kZzHjJldOKqiNoiY1UaHyTvrte3E61
         5hQMZaP/rgZ/DHgQdBgxhlADB1tiX18zRXeFQG2Mql1W1WC6HYgzQWBbtaHNmLsoN59y
         UiDVq0caD8ofvF/l2YIpB7oHIvfxVDFjm/4PCiOewO8Bk3sTxPloM6HX1eLIJas6qDKK
         bEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786971084; x=1787575884;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IsoFeL55aXnoSLzM6IlQSU+HvX9Cmm12pl1T+E59Rcg=;
        b=EKv4xcya3NpT75Mlj8+oyV8K7TfqhcRS/6JJ0VqDYvf9e0cm96muX9NteSm/Ibo8jN
         8kUnDvhXpVPKl1yscAIrChEo/4+9ATNBSSt8VGHUbDkI4Jz7+Ee69CYeIJC3cc/37uCY
         oBiwdHckMUddd/+wWTvkg9G1feHzzR0S7WPqktRdC4AZQXRW2ZRy5yl+rMQGk07Hpdt5
         kH0RjK/2xv8epOt7i+IzwySXkexjYOBJbd8x1tpd22PW3JeL3c1POEIIEYYz8a+rErSw
         VEtZnTPgbEb5GGhmvlHRti3aS4JLWwKFJKWjZDFPNVgK5FPccTcpGOgpIhfhoBATXxDW
         zvuA==
X-Forwarded-Encrypted: i=1; AHgh+RpAJKKJGWk+zCxo1eX7+7Qpi0FTNxyapE1qqk4DfTXL2DlH4bFqtwCG2eqq+aOgZJopHh1sdpWn8kT9@vger.kernel.org
X-Gm-Message-State: AOJu0YyMA69k1QFvlzlwyIKXtf5mKDhCLUrz+RjukKNcb0VZDVSNiWhj
	9JrJXe/BjhEsenik70T80Jio9q4jleEdh3Y4mPcQx32YrpzR+FFOQFnfDojM9uqAcffJt5oxzES
	T7y+Gl/I502kEbnskVPiA74jCLXepapw=
X-Gm-Gg: AR+sD12cbhSqnoVPOg97gucWzghE4QxnxcfhiaAw8bB3n+DXMysQB+FrmEQ1UDYZZg6
	GvAzynssJn+1EaG/5uOj5upK08pkl73pnlAnaa0EbMYtfaeeO8IgRXnWaqxHDr6W6+9vCRCNaKS
	1JdKBHjmFVlREs8RQHI8afB/QXv5nH5HwZs14ewbRxq/N1kOGKT0by748vIJzDRihjBBTpd9iUb
	IcsX9NglBjDIFz4i7zxJ+jw6ygqYBTMXdKd72/A6L0Qki26Yyz4Gu6hmLOZvMRWrevEzlq55Rgn
	yJ0QZiRNfsIzyg1EewgsSJwjYNa9PAk/lLIDOVvptFBoNYe1KubvAwDd/RMi2gMBjOmlzuVstYD
	9ySE=
X-Received: by 2002:a05:690c:b0f:b0:80d:5c71:d08c with SMTP id
 00721157ae682-8371308c88amr90606897b3.3.1786971083604; Mon, 17 Aug 2026
 05:51:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817113603.1436067-1-gahing@gahingwoo.com> <20260817113603.1436067-4-gahing@gahingwoo.com>
In-Reply-To: <20260817113603.1436067-4-gahing@gahingwoo.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Mon, 17 Aug 2026 14:51:12 +0200
X-Gm-Features: AcwNN1W5X2wGC2Q1I1TaTBqzvN2kUY3psEQZvOBiX0NX6cHaLHwnhi2fG-mcjGs
Message-ID: <CAEWPSH4VAR5VTJUW4PdJczrtueQzPzzo6og8PzWaupwd-t=BFQ@mail.gmail.com>
Subject: Re: [PATCH v8 03/12] accel/rocket: factor the completion tail out of
 the IRQ handler
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, ulfh@kernel.org, p.zabel@pengutronix.de, 
	ogabbay@kernel.org, zhangqing@rock-chips.com, chaoyi.chen@rock-chips.com, 
	diederik@cknow-tech.com, alchark@flipper.net, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiaxing,

You asked for a look at this one, so I checked it as a no functional
change refactor rather than only reading it. It holds.

I reconstructed the three source states from the posted diffs and built
the before and after with the driver's own kernel flags for arm64.
rocket_job_handle_irq() is static and inlines into
rocket_job_irq_handler_thread(); at -O2 both states emit the same calls
and the same stack frame, and differ only in which side of the branch
the rocket_job_hw_submit() call is laid out on.

The load bearing sentence in your message is the early return, and that
checks out too. At -O1 the pre-3/12 code emits mutex_unlock twice, once
on the path straight after rocket_job_hw_submit() and once at the guard
exit. That is the scoped_guard cleanup firing on the early return. After
3/12 there is one, because the return leaves the helper and all three
paths converge on the guard exit. Both versions unlock exactly once on
every path.

"Nothing follows it" also holds through the rest of the series, not only
here. 10/12 is the only later patch that touches rocket_job.c, and its
two hunks are the defines at the top and the PC_TASK_CON write inside
rocket_job_hw_submit(). Nothing is added after the scoped_guard in the
handler anywhere in v8.

While reconstructing the base I checked where the series sits.
drivers/accel/rocket/rocket_job.c in next-20260814 hashes to 3141f210f,
which is exactly 1/12's pre-image, and applying 1, 2 and 3 in order
reproduces 5f0f9682e, d484a3a6f and 0bb11c718 byte for byte. So these
three apply to an unmodified linux-next rocket_job.c and need neither
the RK3576 patches nor my clocks-by-name patch. Tomeu, that is meant as
information in case you want to pick them up independently, not as a
request for a re-cut.

Reviewed-by: Igor Paunovic <royalnet026@gmail.com>

Regards,
Igor


On Mon, Aug 17, 2026 at 1:36=E2=80=AFPM Jiaxing Hu <gahing@gahingwoo.com> w=
rote:
>
> rocket_job_handle_irq() stops the block and then either starts the job's
> next task or retires the job. The second half is a step of its own and
> reads better with a name, now that taking the register writes under
> job_lock has moved it a level deeper inside the scoped guard.
>
> Move it to rocket_job_next_locked(). The early return that used to leave
> the handler now leaves the helper, which is the same thing here: the
> scoped guard drops job_lock either way and nothing follows it.
>
> Doing it as its own patch keeps the locking fix at the head of the
> series minimal, so a bisect that stops before this one gets that fix and
> nothing else. There is one caller, and no functional change.
>
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---
>  drivers/accel/rocket/rocket_job.c | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index d484a3a6f..0bb11c718 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -341,6 +341,25 @@ static struct dma_fence *rocket_job_run(struct drm_s=
ched_job *sched_job)
>         return ERR_PTR(ret);
>  }
>
> +/* Start the job's next task, or retire it. Caller holds job_lock. */
> +static void rocket_job_next_locked(struct rocket_core *core)
> +{
> +       lockdep_assert_held(&core->job_lock);
> +
> +       if (!core->in_flight_job)
> +               return;
> +
> +       if (core->in_flight_job->next_task_idx < core->in_flight_job->tas=
k_count) {
> +               rocket_job_hw_submit(core, core->in_flight_job);
> +               return;
> +       }
> +
> +       iommu_detach_group(NULL, iommu_group_get(core->dev));
> +       dma_fence_signal(core->in_flight_job->done_fence);
> +       pm_runtime_put_autosuspend(core->dev);
> +       core->in_flight_job =3D NULL;
> +}
> +
>  static void rocket_job_handle_irq(struct rocket_core *core)
>  {
>         pm_runtime_mark_last_busy(core->dev);
> @@ -354,17 +373,7 @@ static void rocket_job_handle_irq(struct rocket_core=
 *core)
>                 rocket_pc_writel(core, OPERATION_ENABLE, 0x0);
>                 rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
>
> -               if (core->in_flight_job) {
> -                       if (core->in_flight_job->next_task_idx < core->in=
_flight_job->task_count) {
> -                               rocket_job_hw_submit(core, core->in_fligh=
t_job);
> -                               return;
> -                       }
> -
> -                       iommu_detach_group(NULL, iommu_group_get(core->de=
v));
> -                       dma_fence_signal(core->in_flight_job->done_fence)=
;
> -                       pm_runtime_put_autosuspend(core->dev);
> -                       core->in_flight_job =3D NULL;
> -               }
> +               rocket_job_next_locked(core);
>         }
>  }
>
> --
> 2.43.0
>

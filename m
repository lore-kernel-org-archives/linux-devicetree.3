Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D7D33F5B3
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 13:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784638974; cv=pass; b=EnCzPEW+DwieMJNAfAkYBAo7OBywiCQX7+im3LO3odYNcxek2drxwoB9CqxDtWxEOjp5gwIVvqNyGcM1NxSSOEiogw093RkuA0P36xzKgMMKaxLPtXIy6l5i2SLcuuFqtldkb43dkU68pnXoxB/9wZ7Fj+DVaoUTDZx2JZ10N7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784638974; c=relaxed/simple;
	bh=/Oh0ypFHF/MeCKdDZKZv3m+0QRpoUmuQ3pwi6V0uN70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u+DEUHGZT83I5WESoGZIABJZegScMdpJvT8dNMvsQh9k3otrZ2rsZVH1mZaYsK0QkkL50l4mOdoajHY9m8Picdh5R2AM6sbD/799gS0n/j1BUqUxk7a1kfMtCNlX5JzeXg+hyLReypD5MNGAI2vJMEgIEAc7rB2V0keA0hS3Hxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=uOGRjR3v; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="uOGRjR3v"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c197e7e4e94so328732766b.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:02:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784638971; cv=none;
        d=google.com; s=arc-20260327;
        b=E7b4vstk3C9G2wFL8X8eDGS0biEL9ot1fbN39zSxdw1zTXMBrSmHI1ZUl4BViWcOR0
         2svUnzQ4kfeBsdDDJboDzrkpseBZ+9oHECuSIFVx6Xm5R0iT4vc4D4Gmfs2bVajpRt6u
         pLHB1k0rbInD+DDFRv/wQ+Qdc9aaNfzuOx4w1FymOGzdvuGycTa/2OsUsYDEWnTuymod
         /tek6yqn62k2K2rOZJXpmGqH2XspKE0BwjJAasmJujFiJjJDixp2XCteOYhDEY2SwZID
         igPfOPxx4blux0JPlENO+PNSLJE/S0Et20UVO27bz5RpnRHxYF5lTUi+mKkjW5cW/7F+
         wwJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PLoRxgeU4eLbTE5cBel+nzCrJ1tx2QkUTBvlydG2Zzg=;
        fh=pN14ctzlQCmZeKTmlsUoc+aoY7dOWB2HgmJrcvjlcBI=;
        b=eJNUcdjztwfymrvPPmrM1j3EC0Q9F0jHADML32Rz729QgefmXhLFjo8QNgpO7NnWKp
         40pK1cLlKFSWGCANV3ieHgwWJ5bbVTpPsEYeFneyQnuTMGKCoXHJvvHPvXywT4UHb1XD
         o8M+xjlbTAiGkN9EdkEWbncDAh3RAX7JNCctjvvYZOrocq4RIia5DOfLKPdIzTGT/4Lm
         Eh+KBX7S4Sl+b3lYSf+eJIUvhPXVVtb5l+vSemeLlzYuOrDlUG7k45najirJWxkx8HRB
         q/J9e6Hl/rpxcbhrIvZgYxKykzGsIwlg21GseI+IfxoCrnqf7IMT6nl30cz8MoaFwFSF
         9h8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1784638971; x=1785243771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PLoRxgeU4eLbTE5cBel+nzCrJ1tx2QkUTBvlydG2Zzg=;
        b=uOGRjR3v6G2FNbZhIFQo4W9KhBJvhJKHOusSE6cl/gulQf9Je4P5e5FUa+qtW1nWV0
         xwZ8tXkI+Kw82+9vJAWJmwBboQOuQtyFUjggfO8R1tRiewhCgkt05rynkVClvPLpl4yk
         S/Sn1Bo87gq0EVCdptpMYzBD4gSKc6y6x5zGT6tUoEFPTouLM5vblHP8Q2QHayrotDd3
         8PuBQ7Hcq1L6Q3Vvox0vvMs7QCy2Iq4NBvpc8652Y6IBahpkiqtPgVNRkCjkArl6RyRE
         5uD5PVKozwsRqyGr9fSnaBmI9qWqhEoBhCdcJaHbSHW6Fh89OpoPCs4afgUwLIMZeWlV
         ZMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784638971; x=1785243771;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PLoRxgeU4eLbTE5cBel+nzCrJ1tx2QkUTBvlydG2Zzg=;
        b=I1YBY09tPYPd6ulVTGIYc37xytSWVI58lhRfUBeTZ6IoM2wqlFFBTY6fXfJKRL+Zlx
         bMH2sSAaKD9mUfLAXebjskYiDFmWel1kMS/hrhXoTcorhZZnNU509lYmgzvv6SZiub1J
         /HTMBZklb0ksmSrqoDyDHRnjVH7IxwDZUsoRmdZ3BqlpKIhAhqoqAxK5a1dfErqTVMKo
         5PiI8cKeZ9NaatHWubrH9/YW1AyKmT/Z4kTGEIZi9jkihlz2S5mpdCHC00uZ4HA2voaf
         66uiBi42xOWSjvxDsTzONnIbbAvyad/zjQuc3aKm6pk+Du4cmfV38UB5OKaF0cEjPwDi
         ZVWg==
X-Forwarded-Encrypted: i=1; AHgh+Rpq9Jn5u0gBvWiFJHLZsO1h4m1g5H79sjD1dufxBSQnNQxT1xJUPRvyjqRMD+XzNpjFkH/kDdO8RqXS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Mnk4006Vs/Ld/tsCoHbO/jvXRUhwKnSlfrOws0Gas+EXpB7i
	sqmTcdjrx/VecYa4LgFGcexLMmrFuLioZ2TftoZRQG8+INRBvdtt4CpGitld5jBkd3P8j3vX0kS
	eTO32MLdOGvQRDmdhoklmf668sUTaCF8Xa6PgMdzgGw==
X-Gm-Gg: AR+sD12HeNKvAnb3VEvyAnCD4DpZ+m88McVQiDdidDQio/wSkgVYdgIOfBTvHIYBYmb
	tgfDLnAcrfg/aDzaQH3qx5Bs19fHfpAX2kbNlkrNkBtP323b0Kn/dlLLTH7l7QPkCSv9/shp0bv
	NlzNuR8rG56oaitI/BNrkV69l/FecGFNo0UvqQFIr8BfXUnt1AGnMhVW6eVJ0aElLbYRnH0h61w
	ICdsLJprJHZP0zUQKgXFQ1S+w3iSDZA6oKEHRaZjXEUcUW9U3I4zHQYbKLn2z4Iw+ODz6IYua++
	DeaTD6bMb8Ydxo2SRg==
X-Received: by 2002:a17:906:ee81:b0:c12:34ed:e0fe with SMTP id
 a640c23a62f3a-c16b486b059mr764236766b.60.1784638970824; Tue, 21 Jul 2026
 06:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718031146.3368811-1-gahing@gahingwoo.com> <20260718031146.3368811-7-gahing@gahingwoo.com>
In-Reply-To: <20260718031146.3368811-7-gahing@gahingwoo.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 21 Jul 2026 17:02:36 +0400
X-Gm-Features: AUfX_mybR4TJcD7UtKT7vkslJHd83avKACirSY-Al4DoJE_V_nYHHDDfXmU2CdM
Message-ID: <CAKTNdwHL2Z3h-FN7LLPshz5B0duiMw_pyfe=VG4UDhfm8igZ6Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 6/8] accel/rocket: add RK3576 NPU (RKNN) support
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, ulfh@kernel.org, p.zabel@pengutronix.de, 
	ogabbay@kernel.org, chaoyi.chen@rock-chips.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	iommu@lists.linux.dev, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiaxing,

On Sat, Jul 18, 2026 at 7:11=E2=80=AFAM Jiaxing Hu <gahing@gahingwoo.com> w=
rote:
>
> Add RK3576 support to the rocket DRM accelerator driver (used with the
> Mesa Teflon TFLite delegate).  Per-SoC differences are selected by new
> of_device_id match data (struct rocket_soc_data) so the RK3588 path stays
> unchanged:
>
>   - match rockchip,rk3576-rknn-core; iterate its nodes at probe
>   - RK3576 takes six clocks (adds the CBUF domain ACLK/HCLK_RKNN_CBUF):
>     the CNA fills the CBUF and CORE reads from it, so the compute path
>     stalls without them.  RK3588 keeps its four clocks.
>   - RK3576 requests one reset (srst_a); its BIU reset (srst_h) is driven
>     from the power domain.  RK3588 keeps both.
>   - RK3576 spans two power domains (PD_NPU0 + PD_NPU1) and attaches the
>     list explicitly; RK3588 is single-domain and keeps the driver-core
>     auto-attach.
>   - RK3576 has no maskable completion interrupt (PC_DONE is read-only in
>     INTERRUPT_MASK), so it polls PC_DONE via an hrtimer; RK3588 keeps the
>     DPU completion IRQ.
>   - guard rocket_job_timedout() MMIO behind pm_runtime_active()
>
> Tested on a Radxa ROCK 4D: the NPU probes, powers on, brings up its
> IOMMUs and runs submitted jobs to completion.  Full multi-layer inference
> is not yet correct on this SoC (only the first operation per power sessio=
n
> produces valid output); see the cover letter.
>
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---
>  drivers/accel/rocket/rocket_core.c   |  39 +++++++-
>  drivers/accel/rocket/rocket_core.h   |  22 ++++-
>  drivers/accel/rocket/rocket_device.c |   4 +
>  drivers/accel/rocket/rocket_drv.c    |  22 ++++-
>  drivers/accel/rocket/rocket_job.c    | 127 +++++++++++++++++++++++++--
>  5 files changed, 200 insertions(+), 14 deletions(-)

[...]

> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index 2f1861f96..ce3f7c92e 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -7,6 +7,7 @@
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem.h>
>  #include <drm/rocket_accel.h>
> +#include <linux/hrtimer.h>
>  #include <linux/interrupt.h>
>  #include <linux/iommu.h>
>  #include <linux/platform_device.h>
> @@ -20,6 +21,16 @@
>
>  #define JOB_TIMEOUT_MS 500
>
> +/*
> + * RK3576: INTERRUPT_MASK bits 28-29 are read-only (hardware rejects the=
 write),
> + * so the PC_DONE completion signal cannot be routed to the GIC via the =
normal
> + * interrupt-mask path.  We poll OPERATION_ENABLE every RK3576_POLL_INTE=
RVAL_NS
> + * instead of waiting for a completion IRQ.
> + */
> +#define PC_INTERRUPT_MASK_RK3576_PC_DONE_0  0x10000000u
> +#define PC_INTERRUPT_MASK_RK3576_PC_DONE_1  0x20000000u
> +#define RK3576_POLL_INTERVAL_NS  1000000LL  /* 1 ms */
> +
>  static struct rocket_job *
>  to_rocket_job(struct drm_sched_job *sched_job)
>  {
> @@ -137,8 +148,24 @@ static void rocket_job_hw_submit(struct rocket_core =
*core, struct rocket_job *jo
>         rocket_pc_writel(core, REGISTER_AMOUNTS,
>                          PC_REGISTER_AMOUNTS_PC_DATA_AMOUNT((task->regcmd=
_count + 1) / 2 - 1));
>
> -       rocket_pc_writel(core, INTERRUPT_MASK, PC_INTERRUPT_MASK_DPU_0 | =
PC_INTERRUPT_MASK_DPU_1);
> -       rocket_pc_writel(core, INTERRUPT_CLEAR, PC_INTERRUPT_CLEAR_DPU_0 =
| PC_INTERRUPT_CLEAR_DPU_1);
> +       if (core->soc->poll_completion) {
> +               /*
> +                * RK3576: PC_DONE (bits 28-29) is read-only in INTERRUPT=
_MASK, so
> +                * it cannot be routed to the GIC; enable the DMA-error i=
nterrupts
> +                * and poll PC_DONE via the hrtimer started below.
> +                */
> +               rocket_pc_writel(core, INTERRUPT_MASK,
> +                                PC_INTERRUPT_MASK_DMA_READ_ERROR |
> +                                PC_INTERRUPT_MASK_DMA_WRITE_ERROR);
> +               rocket_pc_writel(core, INTERRUPT_CLEAR,
> +                                PC_INTERRUPT_MASK_RK3576_PC_DONE_0 |
> +                                PC_INTERRUPT_MASK_RK3576_PC_DONE_1);
> +       } else {
> +               rocket_pc_writel(core, INTERRUPT_MASK,
> +                                PC_INTERRUPT_MASK_DPU_0 | PC_INTERRUPT_M=
ASK_DPU_1);
> +               rocket_pc_writel(core, INTERRUPT_CLEAR,
> +                                PC_INTERRUPT_CLEAR_DPU_0 | PC_INTERRUPT_=
CLEAR_DPU_1);
> +       }

This whole polled-interrupt part looks very suspicious. Does the
vendor stack do the same thing?

It's hard to believe Rockchip would release performance-critical and
hype-heavy silicon which can't properly raise the most often triggered
interrupt in its critical path, so there must be something else going
on here.

One theory could be that the interrupt bits are not "read-only" per
se, but rather gated inactive by some internal hardware state which
must be cleared before jobs are submitted (e.g. some buffers not
drained, or init sequence not completed, or voltages/frequencies not
set, or memory mappings not written out, ...). If so, this same
hardware state (or something related to it) may well be the cause of
your observed "first (forced) job completes, others don't".

Best regards,
Alexey

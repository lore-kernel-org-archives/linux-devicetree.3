Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96E23FE645
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787661143; cv=pass; b=Ek4R5TfdcRKBlL03AIsD51t6gIlvVL9xePxECZdcDJEvglcvJHyi36uQqOEJb0xodhzHZqK9LWyCEyATw/ygTl6alLZJOO1RAAuI+IuxLZRXsn8zjX5h1PD+D92SIdt2Rs4J3G2UxEjogAZu7UZAUNB3u2xnEQfcJPGEih8YWUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787661143; c=relaxed/simple;
	bh=YnBg80Q6tdwJGKBmxQ6+aA3hP7hvRLocxQztM7gBv+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VV/PPBZNPavSkxyfEss7wWzvalprqqzTOTQ7JOnjiklF87IegjRqOxHVmOZY8bT8gDgxYxPUs4hCM6OW/rwuvwdgb6s6tI3kj70T0frp6697DHvH4UJ9tNayN4n8TG5kw35c6atvhon5NSqXsJTT6R+zqmmgVUxb2notqqnn+Xk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJqBq0wO; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJqBq0wO"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-836c4d3fa28so2596467b3.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787661138; cv=none;
        d=google.com; s=arc-20260327;
        b=jPsTb7GosenY+Z12Y+5FWyyeDCHbdICroEEx1gmxxURBk8uxmslAW3b7huXkD/tg8b
         34sjxFSUZ72uZxv3ovosm8327R36WG3zjRM1Xem34R9OM8FJGGanRwMfxp9jnXDl3CEH
         +axXJNVn3DjGFaI+8mqYVVxbK+ge3O70Y66lvXL5k6Hq03fyeTK6qqzd/IWBw0Rh/bM/
         WP6HExLvE8/KNbu5bS/fu5QFGPYPkf8S0mVmv2h0T+CUFPTjMBPrd3aoU32Wnoi6BqZu
         nBp45p63sZ1flvYJRcghPWsil559HpBZsJSAdw5q2i9GxSYLX1J20v+zzsPt93LXqLDs
         kouA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yC0ABnqL3afPD/T9bA9JOpYrNE4Kd3K+0Xw3e1dg3hQ=;
        fh=lZNEct9hCnlU72x+03v6I/DMJNJ4Ennec+XQMaBO/Zg=;
        b=bJ/GR/emyOb+jNfml5NsSuHyusfg93rGQG721MUOhIVyY6gF69Dq5BVuEaNGUl7icm
         H5zPpW5x9eyFROM8q2LU6BLTJzOWyEEH0/1yUUr1jnX1+UhaR5+fE1N2n8Nnee352Ki3
         fkK2x5jdVug8FQZxWeV+BS3KyTOpa0zFbWHSfHJffhBcl4UVQ6uvo60XY3C/kUX95ReS
         LetbhQ+CokRUU7YfrSn8pC/Hm+W3VpgFZac00IzEDTvez87ET92Tc+HK+HFTazmtNIic
         bMEPWIYesBHgC5PpJwEhb9bAjAEVwIRn5htoMoaALCBSvbvcMcIkwhfcHv+2mUIB7kbr
         Mgaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787661138; x=1788265938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yC0ABnqL3afPD/T9bA9JOpYrNE4Kd3K+0Xw3e1dg3hQ=;
        b=XJqBq0wOVN97+04oYTaj3PoCQQFgRzxobReTf4J/5lJevqYijRb6X/xCu/QfR44m+z
         cfLoi81VOI3ug9VG+J7Z2CPcl8kHHTjzH/IeHHFCl2OOkbc5XDpS4clc2xKAqj6Omomu
         CmBlzqnPhFAE+SASzUkjxXbkKz/mHBcM5Qjm+kCWfgP/ZlnvK+Dnhgorz1gGUx8OG9pK
         3wSTTgIHvInqiwNjABECFq7cbaEGEH9VVg0zeMaSpqpbumsb2tNf3HhYlqzzWvNi/Bcz
         X9meBPpY2fD2r6M0uCE7J4foarQH380FQJuGQMhmu8dq0kA7axViTUyTFYYbBm6mxTnb
         LmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787661138; x=1788265938;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yC0ABnqL3afPD/T9bA9JOpYrNE4Kd3K+0Xw3e1dg3hQ=;
        b=Kq8aQofShikqt3qj7MD3EExPF1y0cvTVULK9qrUxcVpHAnqFv4jHuJQFLvtoeiFDmt
         pskCAXz0xCdyBZn0k/jncj80nFAd1BT2vBFVoYrsClzQ6vi0SRkvVOFkYViqSFXrlYY0
         mj3kXBFzyT+ol7pz9zuHW9bGvpV4znlPzT961Fyldw1RqhxyS7Lk1+5jfsuKu2j68bxQ
         wTCpyz74wm5LHsTMIatfPIzkr2Mdwgx9vlYM1ZgJU3no27spcusrzT16wj6+Ez83T6IU
         doeKNBGnh3R3Mdtq9RNigbIPF0h1MDXmhxg3UClqsJ4FQT4MblB+ZGGiXadqtKlF5tdQ
         dabg==
X-Forwarded-Encrypted: i=1; AHgh+RododUsF2K/PB1dGsJMy4NVN7LTqbjr1Q1tw0hA2dZ4n8Dl4wAk8Y/aqpUwrOWbUnkeZirnGcPjHR6I@vger.kernel.org
X-Gm-Message-State: AFuF++mgb35PhTL9Ug+s5BZDbQSRP68VduJ7ep+kWIRCiTmj5Kitkxa1
	hmXuFiaffQETV+wBQxlLXL7y3KPGkPgna/uItJOWyh+XlnWhs14SIRS+Ihen1Ic6SZsRwW7EeLi
	lVTcAJwAp09jrBUvCrmbjxqf+7MrsHSQ=
X-Gm-Gg: AR+sD12i/FH4u2FwQ5pEQfY0bojCIjH4V7YpbCLmrRcyxYD1RASRNvNkTsN8HdrMVJZ
	0Xzldc9Iz9871rxhzBvafX94CM930xg8loEIcEk08j+oODi6AAUMlMQg0ZsC1zCRqSsuwsiIB4m
	0vzvQtpNcyhtfSNC/h7wwdXrC3+mtiPKJlZSIuOctXJ5u+LQRUJ1n+PC8u7j2DSuM8XlnKp4FQV
	l2EMIibx3M+6jRGRVwUz4yRQXpyBMn5BxAQ6sR/YDqgsDuqU6YGeBqSEjM9aIVgOhv5T2kyrFB9
	M4qdY/Fi6ngGP0Ov/ypAdDoX+cA1fJQWdnpfItQtbmVu5k5/VS7XZQV3
X-Received: by 2002:a05:690c:6e01:b0:80b:d006:6436 with SMTP id
 00721157ae682-854c6f01138mr19294437b3.4.1787661138041; Tue, 25 Aug 2026
 05:32:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f1805c2bce56c89d8ace35f67c665b24bab90965.1787568944.git.gahing@gahingwoo.com>
 <b5265e47492897d0ada844c2ff7f477bb715cd07.1787568944.git.gahing@gahingwoo.com>
In-Reply-To: <b5265e47492897d0ada844c2ff7f477bb715cd07.1787568944.git.gahing@gahingwoo.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Tue, 25 Aug 2026 14:32:06 +0200
X-Gm-Features: AcwNN1V1tG9pfMaEZxfyNcf1kB3QFf3O-ye-4Ztbjbyn2rv0eJ21NSEcDStkJdA
Message-ID: <CAEWPSH5MVzoQMaFOEQ93+1pOPmcXCDNfuXsv5j-X8Lb1fy_hrg@mail.gmail.com>
Subject: Re: [PATCH v9 03/13] accel/rocket: let the core suspend after a reset
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, ulfh@kernel.org, p.zabel@pengutronix.de, 
	ogabbay@kernel.org, zhangqing@rock-chips.com, u.kleine-koenig@baylibre.com, 
	chaoyi.chen@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	iommu@lists.linux.dev, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiaxing,

On top of the as-is protocol re-run I reported on 2/13, I ran
one more arm with this patch added on top of 1/13 and 2/13,
same machine, same tree, same config, same JOB_TIMEOUT_MS=3D2.

Two passes (console_loglevel 8 and 4), 13 and 13 induced
resets, all recovered, oracle 48/48 throughout, including after
a forced autosuspend and resume.

The behavioural change is visible on RK3588. On the 1+2 arm, a
round that ends in a timeout leaves the affected core
runtime-active even through a forced autosuspend - the leak
from my earlier report. With this patch applied the same
sequence leaves all three cores suspended, and the next
inference still scores 48/48.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588, three
cores, induced reset, JOB_TIMEOUT_MS=3D2

Regards,
Igor

On Mon, Aug 24, 2026 at 1:09=E2=80=AFPM Jiaxing Hu <gahing@gahingwoo.com> w=
rote:
>
> rocket_reset() drops the in-flight job's runtime PM reference with
> pm_runtime_put_noidle(), a bare decrement that requests nothing. The core
> is left at usage_count 0 but still runtime-active with no idle request
> pending, so it does not suspend until something else asks, and on a
> platform whose power domain does work on power-on that work never happens=
.
>
> On RK3576 that work is a bus interface reset the domain cycles when it
> comes up. Without it the NPU's IOMMU stops answering, and the job after a
> timeout returns a surface of the output zero point with rk_iommu reportin=
g
> that MMU_DTE_ADDR is not functioning.
>
> Measured on a ROCK 4D in one boot, three runs, one variable between them.
> With the bare put the core reads runtime-active with its rail still up
> after the reset, the IOMMU reports the failure on the next attach and the
> inference returns 0 of 128 channels. With the reference put back through
> pm_runtime_put_autosuspend() the core reads suspended with the rail down,
> there is no IOMMU message, and the same inference returns 128 of 128. A
> third run repeating the first failed the same way.
>
> It also matches the put in the completion path a few lines away, so the
> reset path no longer leaves the device in a state the rest of the driver
> never produces. The remaining put, on the error path in rocket_job_run(),
> is a plain pm_runtime_put() and is left alone here: it unwinds a
> get_sync() that never reached the hardware, and changing it belongs in
> its own patch.
>
> Igor Paunovic ran the differential on RK3588: 45 induced resets across
> three cores, with and without the two preceding patches, and the domain
> dropped every single time with no MMU message on either kernel. So this
> is not rocket-wide. His conditions cross a healthy block with a lowered
> timeout rather than a hung one, which he was careful to say his protocol
> cannot settle, but it is what scopes the change to RK3576.
>
> Link: https://lore.kernel.org/all/20260819073530.6087-1-royalnet026@gmail=
.com/
> Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---
>  drivers/accel/rocket/rocket_job.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index 3c0ed4605..a89ab49e1 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -406,12 +406,12 @@ rocket_reset(struct rocket_core *core, struct drm_s=
ched_job *bad)
>
>         /*
>          * No handler is running now, but we might still have stuck jobs.=
 Let's
> -        * make sure the PM counters stay balanced by manually calling
> -        * pm_runtime_put_noidle().
> +        * make sure the PM counters stay balanced by putting the referen=
ce the
> +        * job took, and request idle while doing it so the core can susp=
end.
>          */
>         scoped_guard(mutex, &core->job_lock) {
>                 if (core->in_flight_job)
> -                       pm_runtime_put_noidle(core->dev);
> +                       pm_runtime_put_autosuspend(core->dev);
>
>                 iommu_detach_group(NULL, core->iommu_group);
>
> --
> 2.43.0
>

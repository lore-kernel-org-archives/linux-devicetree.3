Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794174317;
	b=HJ7kT9340J+1v4yLQiWD/I1KwujbOuYluyEEmZCMG6AdQ6iNWlbM67B4yaQVc43LwR/B
	 fB4C2VerdQhBEshg2uZdKwdOZVxE4eUOKsv2HlUudfhb8lQzKgg2K86yQkEE2f9FBZTi9
	 sBhu32bcXjiuo4Vlz5g+D9QU8KQlUuxK1YRHDkTQdg0IDAEJiqUfogdCyhmn7hw6kRRhY
	 AWn7TXtZK1UfFYUpbMZsdI7psaWD/YVsjOUZfwbFf0AlbNhkDURAY7AeXcS6baaOsSum2
	 1fsJDYq6BEC6uDvExPnakGAvrtPXHxiGOoteV7n0+afxNubty2Jn0d7l2oKolS74VnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yP+R+yf5xY4dHL5c8agyL0IxXu0xVt/tENjfyE274v8=;
	b=Y1RUoamRKNh6O4EajN7ckGismDo7iByH5I6I9JCbs7Dx0buTEpEB5nUiAOlGRKgGwVDc
	 GDeJ06+MJCQOKMrXCwnipofTKbpqBlFSw2KcxIe9qKt5h1fvVUbFG/Apri8i7cICZOmJe
	 jbClNn3gkTIrRQfFZ4lRI5Z5+GedxbMq+oNZZoUSZVqL/YxBPrQYaf2ktHsrbunSj1wbI
	 rpc3AeDARR90JMK2gkSOYLj17emVNKcPlefNryfQKUND9BJnQj2JWt2rTYscoikyMCooc
	 ETkXU40LOeMeHYocgx8qka9nHDsjuxOAPrIfvWq1v2pt9M5mcdXlGWGEPzTkeQx8jQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=I7bKQwoM;
	arc=fail smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A431606D80A
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A431606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=I7bKQwoM
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67c2c2ac1c3so392637d50.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:45:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794174315; cv=none;
        d=google.com; s=arc-20260327;
        b=R3Oe+K65wlCIFTUKNxvju5jVQa5UBhwFIbpg0owV79CrL1/IPS6I4kgCV/V4V1toHB
         KVqagq8Ur5P6ZdsYZSqiIe3lDpsqqtJNgwSPlE6KNVvo7jpd13C0/jA3wQJUsvgLXpaJ
         MMLfOEEdtFxluppetTSDCwfYw94+kLM/LFfK5r51NyA/v3fFlhVbapek571PUaEwJFmD
         qOuBfZ+kgwL4WD6axc2J7RcpAf2EhxTvKWuaUKrAEj1b79IeLzMzZpFoY20ReFZA+d4Z
         fOTRvJesZ+rb0ih2O/3Tjqj9K/6AFtpNqk7iXdRKWYDYKrLg9+chsbgQ2O8zz2dHkXkC
         oCkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yP+R+yf5xY4dHL5c8agyL0IxXu0xVt/tENjfyE274v8=;
        fh=6zs4hKN1tnfpNIw5OLvjboQ32dX5xwIn96IjqXwbuuY=;
        b=HUm18bmUcJbqOzHBvuJbdd2WeJokblT4x0tOHMLQq8JNjlKUVvrZMNQZp7C3s+Wkj9
         /crV0ICj5KbM1uIwe1OxVTJAtBinY3H0vhGnFHbcEkGGUIM6n+9SZe7bjUVzU81SqHBD
         cLnablMDRsnFOdN6rRwtXcsZj+NlUjSLPmC/h2yCiq93nZ7Gk2TNAvxY6Ilo2TfMAnoO
         vSKoEMMmoZBkiQKIsEp8XlhoI5cLaEi/f/e+PKWviheX06Y1zMQJrf2TlrpwX5ubp1FD
         /nFNOudW68hGaHgmm3agXKIe5ZqJhKles4SQj//0ysEi1GaYQQUucwGRj1k82Z0RGCb+
         QnDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794174315; x=1794779115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yP+R+yf5xY4dHL5c8agyL0IxXu0xVt/tENjfyE274v8=;
        b=I7bKQwoM9NWBQhf/Z2M9xaKE9MTHjD5dWnIDH+Adr4H9RUTtmKRZOsxmHeKofyz7Ny
         5CvujknEZ2FdsKIfyVT1R/rHukzSbfqfbeZUoQ+mq5SSuAh7eETCg3UZ2Yzhcc390cJc
         Zt5++zvN/LBhhOI0WX2rUMsM3vl7LlqS8cWL0xnNAo3zoyfEoHzc6QOlQAADgd8Huoz9
         b9/JNUX5sv6svQjd9bfDrqaDY9Qwcig38CZz0q48zwybotVFcalNJBzlnbMyDvaoWmMd
         guEyM0VcxBpgZ4weamoFg+D7LcqcGJE0rbwmFiVSs7DrY6WzveUPYpQmqAAdKIwmNcub
         bL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174315; x=1794779115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yP+R+yf5xY4dHL5c8agyL0IxXu0xVt/tENjfyE274v8=;
        b=STEqZCUv4I/JrRNrS6WZpcZBtlJmIK3IXL1NkIvpZCle10ogwQQajQLw+5Onu64Ouh
         H4gaaUiyyGlZmcwFE1923ucOAmJ/ECzCUq5g1f2Ruf3p3pOjUB7qsfxFmrITG94/2p9E
         t3dpGi1/rsZJZOViYp0H361MRHnczVoEM2x6UQoLQ7AfCxmysGC3VmmxjbrKOUwhk+Ay
         Zxe8ttlYYL7Phfp6iyKZH9+w0aNQZ54ADsu2p4CTdKUfbpPa1g28g+2WkXDvYBMPEsnQ
         TcHB03nJgNKVZmasapQNTbLFapMxGbfpuzeLmoFnYUpi44N6h36AcLEoVaDyGvThjk+S
         0uPQ==
X-Forwarded-Encrypted: i=1; AL+hErF9r+ZNRuFzVFd2UfS1OTpwUME2wRYz48CR6O9Na4c8zEsPgTK5WzC0Q0I6YavGhmhHmI4VovgNnZdo@vger.kernel.org
X-Gm-Message-State: APuU4Z+qTNYqDkwWBoXrqV4B8Imu4UezJVQ3mB6cj6bqE+k0NU8dXkkD
	b4jGpmEbIlI1z98gYCEsSmPsxYdQRAIcyWUnlhLXLn9qTqlj9uMTRZLNivdvL3x7HU1YFwjkteU
	gcDZIv/c1xxEuDDyjSUthoWnUpGWA4QU=
X-Gm-Gg: AYBFou11fThHdwjP2ERlLOgnWj82BimnqSyQ+m1KCTTy4s6sNWuLd9hF2O2hqmLYtvZ
	uIPJihwq8jMPrNYo1djpYmj29LJO8720WYlxrE2KvPkKn5Eqx7nwb3+23LZc1la9iDNrCYSbEiV
	I2yBn/S7uwGPdvdbJEZOlPEP3sJxPnZMJnYy+jHL9aEVNhU2kzmRSlhGa6h0VIFX4DWamoUl5HY
	HnncZrkOVEnrEynnEIPbpVGkmKMhANncenuqIUztVayPkN+gfkfDAZ80mG5OYmWvIrzKSK1Z1OJ
	2fvZxLn8FfXsz1k26klGfW4Y1TO3Jp7aytw239GIERI8IpIo2et1ppoPpPq0uAarbYEqlC/81W0
	EGLpYkhNrGvSeOQhZp1t372RCsGb5BVfo8w7GW6xYghYhMzI63k+UDB2H6ONuPi97dWIeuQ==
X-Received: by 2002:a05:690e:bca:b0:67c:1dca:7f9 with SMTP id
 956f58d0204a3-67c3d9bb63cmr1402384d50.48.1794174315509; Sun, 08 Nov 2026
 13:45:15 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H> <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H> <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com> <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
 <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com> <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
In-Reply-To: <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Nov 2026 22:45:04 +0100
X-Gm-Features: AclHuK-tzL5nxnrCwLMP_029tOJZYuTko3n3lDgTKGXJ3pWmAcdiBipcjDbfc6k
Message-ID: <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Christian Hewitt <christianshewitt@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, christian.koever-draxl@student.uibk.ac.at, 
	neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
	khilman@baylibre.com, rafael@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:46=E2=80=AFAM Chuan Liu <chuan.liu@amlogic.com> w=
rote:
>
> Hi Martin,
>      Thank you for joining this discussion. :)
>
> I have re-examined the capabilities provided by pm_opp and cpufreq-dt,
> and it seems that we may also be able to adapt A9 fairly well based on
> the amlogic-cpufreq.c here. So we have no objections to the driver
> implementation in amlogic-cpufreq.c here.
>
> I was most worried about before was that cpufreq-dt might not fully
> handle the complicated clock and supply adjustment logic between
> multiple clusters, which would have required adding a separate
> cpufreq_driver. But it now looks like this can be solved by adding the
> corresponding config_clks() and config_regulators() callbacks in
> dev_pm_opp_set_config().
That's great news, indeed!

[...]
> > - Meson8/8b/8m2 (32-bit ARM Cortex-A5/A9) where we need to reparent
> > the CPU clock to XTAL for stable operating during clock changes (which
> > should go into a cpufreq driver that implements target_intermediate).
> > There's no secure monitor or firmware involved for CPU clocks.
>
> BTW, could we put the CPU clock handling logic in the clock driver like
> G12A does (though, of course, handling it in the cpufreq driver might
> minimize the coupling between the clock and cpufreq drivers)? That way
> we could fully reuse the existing cpufreq-dt?
Common clock framework maintainers don't want muxes to be programmed
magically in clock notifiers (which is what G12A and Meson8* do).
So there's a chance that for new drivers they would just NACK that approach=
.
I don't recall the exact reason anymore - but from my perspective
using a cpufreq driver for this is the cleanest approach (although a
few lines of code extra).

Additionally: I believe the udelay(100) in the G12A and Meson8*
implementation is not even clock related but a delay to wait for the
regulator to become stable.

> > - GXBB/GXL/GXM use SCPI firmware CPU clock control so to my knowledge
> > we're good with what we have (meaning: no custom cpufreq driver
> > needed)
> > - G12A single cluster, no DSU: needs a cpufreq driver that implements
> > target_intermediate (currently it's managed on clock driver side in
> > kernel space, no firmware involved)
> > - G12B multi cluster, no DSU: needs a cpufreq driver that implements
> > target_intermediate (currently it's managed on clock driver side in
> > kernel space, no firmware involved)
>
> The cpufreq-related resources on the SoCs mentioned above are relatively
> clean: each cluster has only one independent clock and supply of its
> own, and these SoCs also do not support voltage selection based on chip
> binning.
That makes things simple, indeed: each cluster follows the same logic
using it's own resources.

> > - SM1 single cluster and DSU: needs a cpufreq driver that implements
> > target_intermediate (currently it's managed on clock driver side in
> > kernel space, no firmware involved)
>
> Compared with the SoCs above, the difference for SM1 is that it needs to
> additionally manage a DSU clock. In this case, the clock-related
> handling can be added in dev_pm_opp_set_config() in amlogic-cpufreq.c
> (by implementing clk_names and config_clks in struct dev_pm_opp_config).
I think so far mainline is not touching the DSU clock at all.

[...]
> All in all, it looks like we can currently support all Amlogic SoCs in a
> single amlogic-cpufreq.c? Then, for the specific characteristics of
> different SoCs, we can differentiate them through the "compatible"
> property and add the corresponding drvdata for each.
>
> I'll also try to support S7/A9 with representative differences based on
> this patch.
Great, let's look at some code rather than discussing theory on how to
write code :-)

There's one last detail that we have to manage in case we also want to
include the Meson8* code into the same file:
config MESON_SM depends on ARM64_4K_PAGES
32-bit kernel builds can't satisfy this (meaning: we end up with
linker errors). I think a simple way to get around this is to add stub
functions to include/linux/firmware/meson/meson_sm.h.
I'll take care of that once I can submit Meson8 support patches for
your upcoming amlogic-cpufreq.c!


Best regards,
Martin

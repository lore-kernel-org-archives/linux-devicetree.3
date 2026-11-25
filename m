Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795584591;
	b=tf8fjOlYHcq0UHTsDKGrSi3+JGIv1SKVKY9wBc8t+k7T491dNXJtU7fhV3fJfr2WwA9Y
	 4T7HzGx5accNJEPAPCP9k51Wqrj8cp204deOLtCDA+H6scuVrudW3EVTSmtwzyLo+cXOU
	 q6TrrHjSGmb0ciXTDcGmRT/nfNVQs/MwZzQZFwc6VZq6b4MsepI6DerxhCZFN501/NWHu
	 4SSBPZzWOyciZfjcQclKU5wz72gChhKFaB7GEPvLk9/g8twjiQXpUbD9tAP+CT20JjYe/
	 3nvjdUXw1Fv9RjXlcIFXvlhaATXCqJelomPPOcwP9v+9t0nFkOPCJU2NbhiSSMKKNJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795584591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=z31507qutrSHsDuMlMYuZrOSlqTz0X7hfxnmDVf3XDU=;
	b=GHtDYQfPaOpkcdjNbmNIF73SHTLizw0RALIr1wR1pLDEgO1XdtbIJ/QB3BA5TNJV2Q/y
	 KjKhEEDwBFuJxVB8K6rihl4cyJ6pTrk/ZiMoesRIXGiWQL6c4mTHJvlQtsMTYZygtrLI/
	 dy2XdRhvZxVQZR8piZrVcYwUTpJYxAjA6obr6PpJmL3zAcU5tko6KkSBMjQ8O10H6ICDy
	 yqb1fwb2MJpY6wBDiSOOUKYvYemr3c1o1c4PGaz+/kieHdiKctEL1xxiC3qqfzkFxjrHA
	 xUwYft5xBFpgYxDYRmIvOG+Vv31uS6tML6RGcOKizExpG/+Es+nM4uFpJeTQALDawkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vu1ZMuzN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FA8606A31E
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 05:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42FA8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Vu1ZMuzN
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7d2d95c5d81so3704993137.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 21:29:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795584590; cv=none;
        d=google.com; s=arc-20260327;
        b=m+Jx9sG8AbHRpmiD+FQklkrbyChqvFpbI/K2smQoZMJ1JV/R6YGa6mm+ALpTTjsaDT
         PSe0MxJ9Bi/Qmcx8igZd9gfgimXlTuzCmOg18OWUD7Q/nqcrAwbEq4Y5whFRFuI60Ano
         i9qcIG1hv5XyqbC4rIvX7j7vBZqxdm/Q7MxlpIuny27rUPkYkWwpmJQnWK5Xw288bmq9
         h8uUIvpCzGFL+Qr1jEnD8U3vyxEoNHI/DJkCavr2ysXA2m4eQavidlK1SdngwWxdVVUe
         QX1BSG8Xl78L0jimNa8LWDi4v/tkDYg7VlEMTgzzQkfE3ZMegfN0yhGiLQLSWfYD6JyX
         9MJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z31507qutrSHsDuMlMYuZrOSlqTz0X7hfxnmDVf3XDU=;
        fh=KdVYSIUw7d/hgoT9Wr/xCuVVBwL3R/5cKXm+QogWzI8=;
        b=T4bisvyPI6MjMU8+hfJOOV5W52jGy+vbZAEK4s+4gGeACU+BCBBvSCqA8D0f/lg4Y9
         tFOXXqswNMZQ991KU91EEVnjfc9294SA5c16xRC+B3PMxmjPCY7q3nlfwvDXYv2rFst3
         Viqwaxfij5MB+nEiHnIBkR0W9MKjIMfySiFQ4AO8WVidQgPLPf6fjjcBg1ZJwbiWoXPi
         w1NmX+SEgmr0H84K4k0limFEGUKSvMAaHMtu+iXa7C0p7rpp+Qqwj/gyxwWWIlOBEQ2e
         k84tYO3cV54eEdze6WS99Dz5BooLUWz69FobEkJqfgzPtVEWlLr9E4h5S5Q3e58GYjY1
         7I9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795584590; x=1796189390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z31507qutrSHsDuMlMYuZrOSlqTz0X7hfxnmDVf3XDU=;
        b=Vu1ZMuzNjD/jmZHcDQuYuXLVaA8JKz5bT+Q+Iv6B/Wj/gNGG5S7G3BAFrKYj/DbVvw
         u41eU3ziEv0qrdbe6M7e3glHTKrvbxBUhEXkALZ1rmakvwJ1zzwmhqJvXx2jCLpwki3H
         /5UWWQVCCk5ssGKumQYeB0XhMpG2D8V76OdhjE42DUT00b8d0y49pp078JtqUgC49+RE
         50PuIRhnGNmQphEph6bhlRGClu7Uy2H04a7FtgxS7P3iBs9FzLLPKJ/rTpYN8nPGogtl
         6ZeVyILHiUVnvZC8obTw3Txg0JJcbUfVRAIWhYJ7B6071xn3f169NY4lN3RS/8J3vPxU
         /46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795584590; x=1796189390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z31507qutrSHsDuMlMYuZrOSlqTz0X7hfxnmDVf3XDU=;
        b=FuuMNS6pGo6J0XmvONWWU0iikr0DNCtUvm2ddxqnjETPKF64EJkDFpwiCqQrrLS67T
         fdFWXNbsXYYQXaV6P960hjIceaaa8NA7lSDDlJqnHfSG1oSrsfQcnRssnGS6x2JT8QZZ
         HtCL9C14I/24lZ32s5MQ0okqT8T2UROg91/0zDurbdfvZp2EfletqIMA7ilrP/7TK1l5
         VRaHlc/lOshZZxd7YAD4wAT+sgEvqZV0husaaavS9YWZm8ev4SdMeXcV5XfQ1CK9USiS
         ezVexExOWjn7LDEw0u2nhjbVGv/GMkqAxksv12kdqp4sZgbsSsOqfEE/RF++BP4O3s+z
         SAug==
X-Forwarded-Encrypted: i=1; AL+hErFYGJqxzVNFBGgpOPIVPgpHXauhKF/6HSJRPSg6rDRzM+wK2mS4Mr1lHIWGdjMr//Ei8vg6tL+D3Ev9@vger.kernel.org
X-Gm-Message-State: APuU4Z93ZqCdXyOq2RLpZdF+KY36GPTo5yjRQCMiKcoPZDqPbNRjy2Ow
	7rDaNmme3jfW2qotW/kkMvl1nHx1C6/MpnRtXjkDknWAabO/MJTv20HcxxdOcfhwROfK0JloA/2
	UfCjpVjTxFJoWvmDvveukJzEZCaXCWGqsI1KKZd5L
X-Gm-Gg: AZFdTZetzp/UbMAEBxzlsnuOLY6qL78SgH9q3MfJ/5a/Kcn8dGFa6BZlTqE4UJI2+g+
	M7B8WGk0IG47O9agRdqeLDpdCoKJ1dR+fQ0ZlGGSZCY3fxlXc0/XaVumu9KGnfraNCt2zThudDb
	EPmVlmC/c5aQtqqDCuE97pFMNPoBzBvEBb2HhMcsSs0N88IozQONcvUcT7aCKt60j/yljMf9mm6
	23fj2QRkXK+OhPVVnQciEIpcxvYwXtBL4RFKKHYDjs4bFFsPSuYTYp2+F481XUYa0iDro1WxlhP
	zptTYE+ADxQ/BrXsOa5mSo6Mc7v+gzOfJSCvrb1T3vmO/8LhiF83E6zzmk+5wCnvZCPtO/tiSHT
	Nu6+4A4WCZveWjYH70EM1geOH0VdO9MrsrNJtJ57HUdxYitBib+0SkQlaa32XqyGxpFLt57adZF
	IpWw9Qk0jhrAL7HtI4kH49HVT7OkPWFJy77E0EzmMvs/LdLsSqqVJDkeGq9vZub9V4CiuAOqLA
X-Received: by 2002:a05:6102:4488:b0:7cb:bb7b:77e4 with SMTP id
 ada2fe7eead31-7d7393b30c6mr5630777137.3.1795584589058; Tue, 24 Nov 2026
 21:29:49 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118101913.3135869-3-amitamishra@google.com> <20261123154945.3083888-1-praan@google.com>
In-Reply-To: <20261123154945.3083888-1-praan@google.com>
From: Amita Mishra <amitamishra@google.com>
Date: Wed, 25 Nov 2026 10:59:36 +0530
X-Gm-Features: Aa3M54pSWQSSH-CwFoe9S0jqnWcBEelhF7YQ6aGMTLjqJveDGr8T5HV3QQARPWM
Message-ID: <CANLJkh0O=_hYhjv1QJKVfoLFp75RCgKRGHuKh2ubDA8EUExGsw@mail.gmail.com>
Subject: Re: [PATCH 2/2] perf/smmuv3: Add runtime PM support
To: Pranjal Shrivastava <praan@google.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mark.rutland@arm.com, robh@kernel.org, 
	robin.murphy@arm.com, will@kernel.org, iommu@lists.linux.dev, 
	smostafa@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pranjal,

Thanks for the thorough review and for adding iommu@lists.linux.dev -- I'll
make sure to include it on v2.

On Mon, Nov 23, 2026 at 03:49:45PM +0000, Pranjal Shrivastava wrote:
> On Wed, Nov 18, 2026 at 10:19:13AM +0000, Amita Mishra wrote:
> > On SoCs where an SMMUv3 PMCG resides in a switchable power domain,
> > probing the PMCG attaches and powers on the domain, but without runtime
> > PM support the domain remains permanently powered on even when no perf
> > events are active.
>
> I'm interested to know which PMCGs are these? Upstream arm-smmu-v3
> doesn't have runtime PM yet, thus, a PMCG that shares its SMMU's power
> domain gains nothing from this today: the SMMU keeps the domain on anyway
>
> With my arm-smmu-v3 runtime PM series [1], the SMMU lets go of the domain
> once it has no active clients, and then a PMCG without runtime PM would b=
e
> the one keeping it on, the two series seem to fit together. For TBU PMCGs
> in a subsystem's domain this matters either way.
>
> I'm wondering if you have PMCGs in power-domains that are neither tied to
> the SMMU power-domain and nor it's clients' power-domain?
> (That'd be a bit odd but possible).

They are the two cases you mentioned -- TBU PMCGs residing in switchable
subsystem/client power domains (which already use runtime PM today), and
TCU PMCGs sharing the SMMU power domain (which pair with your arm-smmu-v3
runtime PM series). There isn't a separate third power domain.

> Which makes me question whether the PMCG needs runtime PM at all. It's
> a profiling tool, and I'd be surprised if production devices that use
> runtime PM keep PMCG events open. Without events nothing needs the PMCG
> powered, so all this buys is not pinning the domain while the driver is
> probed but unused..
>
> Do you probe the PMCGs on production devices? If they're only used for
> profiling and not in-field, not loading the driver there (or leaving the
> node disabled) avoids the problem without runtime PM in the driver.

Yes -- the same SoC DT and kernel image are used across production and
profiling/debug builds, and we want PMCGs available on demand for profiling
without maintaining separate DTs or manually toggling drivers/nodes. Today,
simply having the node enabled and probed pins the attached subsystem/SMMU
power domain on permanently even when no perf events are ever opened, which
causes power regressions on idle devices.

On holding the runtime PM reference for the lifetime of an event
(event_init -> destroy): fair point about disabled events and the observer
effect on TBU TLB/config-cache misses while profiling. Because perf's
->add()/->start()/->pmu_enable() callbacks run in atomic context, taking th=
e
reference in ->event_init() and dropping it in ->destroy() (similar to
drivers/gpu/drm/xe/xe_pmu.c) was the cleanest way to keep the PMCG powered
whenever events exist while allowing idle systems with no open events to
power-gate.

> > @@ -975,15 +1040,45 @@ static void smmu_pmu_remove(struct platform_devi=
ce *pdev)
> >
> >      perf_pmu_unregister(&smmu_pmu->pmu);
> >      cpuhp_state_remove_instance_nocalls(cpuhp_state_num, &smmu_pmu->no=
de);
> > +    if (pdev->dev.pm_domain)
> > +        pm_runtime_disable(&pdev->dev);
> >  }
>
> Events hold a module reference and bind/unbind is suppressed, so this
> only runs with no events, i.e. normally with the PMCG runtime-suspended.
> devres then frees the IRQ: free_irq() -> msi_domain_deactivate() ->
> smmu_pmu_write_msi_msg() writes to the unpowered PMCG, since the PM
> domain is only detached after devres in device_unbind_cleanup().
[...]
> > +static int smmu_pmu_runtime_resume(struct device *dev)
> > +{
> > +    struct smmu_pmu *smmu_pmu =3D dev_get_drvdata(dev);
> > +
> > +    smmu_pmu_reset(smmu_pmu);
> > +    return 0;
> > +}
>
> Sashiko flagged this too: after a power-off the IRQ configuration is
> gone, and smmu_pmu_reset() doesn't put it back.
[...]
> This is the same problem I had to solve for the SMMU in [1]: patches
> 7-8 make the genirq/msi core cache the message in
> irq_chip_write_msi_msg() and add msi_device_domain_restore_msi_msgs(),
> and arm_smmu_resume_msis() in patch 9 clears the IRQ_CFG0 registers and
> then calls it (a no-op for wired IRQs).

Agreed on both MSI issues -- I'll fix them in v2. Since
msi_device_domain_restore_msi_msgs() isn't in mainline yet, would you
prefer that v2 stays standalone by caching the single msi_msg locally in
struct smmu_pmu (clearing SMMU_PMCG_IRQ_CFG0 and restoring on resume, and
skipping MMIO in smmu_pmu_write_msi_msg() while suspended), or should this
wait/build on top of your genirq/msi patches from [1]?

> Minor: an autosuspend delay would avoid powering the domain on and off
> for every event open/close.

Sounds good, I can add autosuspend support in v2 as well.

Regards,
Amita


On Mon, Nov 23, 2026 at 9:19=E2=80=AFPM Pranjal Shrivastava <praan@google.c=
om> wrote:
>
> On Wed, Nov 18, 2026 at 10:19:13AM +0000, Amita Mishra wrote:
>
> Hi Amita,
>
> +iommu@lists.linux.dev
> Please CC the iommu list as well.
>
> > On SoCs where an SMMUv3 PMCG resides in a switchable power domain,
> > probing the PMCG attaches and powers on the domain, but without runtime
> > PM support the domain remains permanently powered on even when no perf
> > events are active.
>
> I'm interested to know which PMCGs are these? Upstream arm-smmu-v3
> doesn't have runtime PM yet, thus, a PMCG that shares its SMMU's power
> domain gains nothing from this today: the SMMU keeps the domain on anyway
>
> With my arm-smmu-v3 runtime PM series [1], the SMMU lets go of the domain
> once it has no active clients, and then a PMCG without runtime PM would b=
e
> the one keeping it on, the two series seem to fit together. For TBU PMCGs
> in a subsystem's domain this matters either way.
>
> I'm wondering if you have PMCGs in power-domains that are neither tied to
> the SMMU power-domain and nor it's clients' power-domain?
> (That'd be a bit odd but possible).
>
> [...]
>
> > +    /* The same condition smmu_pmu_probe() enables runtime PM on. */
> > +    if (dev->pm_domain) {
> > +        int ret =3D pm_runtime_resume_and_get(dev);
> > +
> > +        if (ret < 0)
> > +            return ret;
> > +        event->destroy =3D smmu_pmu_event_destroy;
> >      }
>
> This keeps the domain powered for as long as the event exists, even
> while it is disabled or not scheduled. I'd be surprised if the
> production devices that use runtime PM keep a PMCG event open requiring
> this?
>
> For a PMCG in the SMMU's domain, with [1] that means a perf event keeps
> the domain on while the SMMU itself is suspended (SMMUEN=3D0, GBPA=3DAbor=
t).
> The SMMU only suspends once all its clients are idle, so apart from
> cycles there's nothing meaningful to count.
>
> For a TBU PMCG, it keeps the subsystem's domain powered, which changes
> what's being measured: the TBU's TLBs and config caches survive what
> would otherwise be power-offs, so tlb_miss and config_cache_miss can
> under-report compared to the unmonitored system.
>
> Which makes me question whether the PMCG needs runtime PM at all. It's
> a profiling tool, and I'd be surprised if production devices that use
> runtime PM keep PMCG events open. Without events nothing needs the PMCG
> powered, so all this buys is not pinning the domain while the driver is
> probed but unused..
>
> Do you probe the PMCGs on production devices? If they're only used for
> profiling and not in-field, not loading the driver there (or leaving the
> node disabled) avoids the problem without runtime PM in the driver.
>
> If we do need it, a couple of issues with the implementation below:
>
> [...]
>
> > @@ -975,15 +1040,45 @@ static void smmu_pmu_remove(struct platform_devi=
ce *pdev)
> >
> >      perf_pmu_unregister(&smmu_pmu->pmu);
> >      cpuhp_state_remove_instance_nocalls(cpuhp_state_num, &smmu_pmu->no=
de);
> > +    if (pdev->dev.pm_domain)
> > +        pm_runtime_disable(&pdev->dev);
> >  }
>
> Events hold a module reference and bind/unbind is suppressed, so this
> only runs with no events, i.e. normally with the PMCG runtime-suspended.
> devres then frees the IRQ: free_irq() -> msi_domain_deactivate() ->
> smmu_pmu_write_msi_msg() writes to the unpowered PMCG, since the PM
> domain is only detached after devres in device_unbind_cleanup(). Wired
> interrupts are fine, and the CPU hotplug path Sashiko mentioned
> shouldn't rewrite the message with a GICv3 ITS parent, so in practice
> this is MSIs plus module unload.
>
> With the MSI message cached by the core (see below),
> smmu_pmu_write_msi_msg() could simply skip the MMIO while the PMCG is
> suspended and leave it to resume. Note it would have to check
> pm_runtime_status_suspended(), since runtime PM is already disabled by
> the time devres runs. Alternatively, keep the PMCG resumed across the
> devres teardown.
>
> [...]
>
> > +static int smmu_pmu_runtime_resume(struct device *dev)
> > +{
> > +    struct smmu_pmu *smmu_pmu =3D dev_get_drvdata(dev);
> > +
> > +    smmu_pmu_reset(smmu_pmu);
> > +    return 0;
> > +}
>
> Sashiko flagged this too: after a power-off the IRQ configuration is
> gone, and smmu_pmu_reset() doesn't put it back. With MSIs, overflow
> interrupts stop arriving and counters wrap unnoticed. With a wired
> interrupt on an MSI-capable PMCG, IRQ_CFG0 comes back UNKNOWN, so an
> overflow can send an MSI write to a garbage address, which is exactly
> why probe clears it.
>
> This is the same problem I had to solve for the SMMU in [1]: patches
> 7-8 make the genirq/msi core cache the message in
> irq_chip_write_msi_msg() and add msi_device_domain_restore_msi_msgs(),
> and arm_smmu_resume_msis() in patch 9 clears the IRQ_CFG0 registers and
> then calls it (a no-op for wired IRQs). The PMCG resume needs the same:
>
>     writeq_relaxed(0, smmu_pmu->reg_base + SMMU_PMCG_IRQ_CFG0);
>     msi_device_domain_restore_msi_msgs(dev, MSI_DEFAULT_DOMAIN);
>
> Minor: an autosuspend delay would avoid powering the domain on and off
> for every event open/close.
>
> Thanks,
> Praan
>
> [1] https://lore.kernel.org/all/20260929034510.2023173-1-praan@google.com=
/

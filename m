Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3023264E7
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781772822; cv=pass; b=VJCUOd8N1EdR72/3LypYKuqUSE6gtxVi5XtFy0EqTngT9yfidrJ3BGHm9a0g9a9mQSNv9zkNIBX84mkrxy165aNDNTfNtDLJKy6EKzW2jQwfJZfo68KPdFR4HRNh/xHzlcvv0dqibEK4noztO/T233OrcrKraAoF1yAOzMOFXCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781772822; c=relaxed/simple;
	bh=Z1YJp/HqfQ6hf6uFiAiDrxi+ZDsMGhSZke+8x869FEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iysQyb6vCFlZDBON7+GPqt9Wmpk3KXtQzqBKzijwLO6OnlYEPLXVVsWaAXtbve2GO+rL1cPOPK7BQGJ0g93AWLsOw6hWjtrpHxne1o+paIfEMb9y8NdaMUi5DGGu7BirvCiQffFJ8z940eHmmcdvFyl50yw5bVWenHAZMhqc5Fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=FxMedHHx; arc=pass smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="FxMedHHx"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-44192448b56so243030fac.2
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 01:53:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781772819; cv=none;
        d=google.com; s=arc-20240605;
        b=Q5HuiljtExHUVpDePQ7dLTAp0mjv4ReSwNKbtvgy+oMbvekS8TmXWBfYsWmSVQa2hl
         mvAP1stVu3MGEgR5Py3ciDFqYVm0LCY8S7bXLEIsavQo4ooEk1UcbHSKg2Hu5v/29V9N
         5LYfvTajV95k7GVsSr5TgXsJpYNXh9Z7An6vWS5CeucFyQVTRpnZEr+iBX310a4Ezooj
         4EJEDqQ0fF4uYtFPPPVU4qEbRZGFn4jp2w5QewPePM1Gj3Av/yJ5Epa18f1a1z7tLBxM
         OIXrycnNhZD4R75LwhtQt51towkMKNoi1k/nS47DYi31aHKn4U4GZ0oR8ldBEIHoHlPA
         T8SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oUQ+0xSBpfvF1Od2o3ssM+WJLtkna5s39YaO37zuJWQ=;
        fh=53qvJawqK0TJTsq+MaD47KBMEtgXQmC582XHmZ7TrbI=;
        b=JJAD5Sw4E8Me5czXuQ7iqkSJkaPbUN0HGZAafa4dO05duON3X/62jZAT862a63iOSv
         XWZ6kFnrSW3opWI1lt+CYOL/VQ0CAGtPKshxPO0dVKR21KJd00UKd9wQP9qsYLoWFsaE
         24PA5QhY8alI4TygI4tBfBMOCPyz/Tl9cYwQgA14f+4tm+CVQNzOiEZHiM6CDHoZVtBO
         /DOHYPYTgiHSCGoda84kItIZnzFhVYhOwcNnjYOiEa2vz35E+N1PTJHmv7QIzI4011xa
         9x3HM7FOXh16+6c/QMxSaOtyDC7Vv0FMC+8gVWspnlgo7euRHTLC5GLBMlJvw0y0gkeP
         qT4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1781772819; x=1782377619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUQ+0xSBpfvF1Od2o3ssM+WJLtkna5s39YaO37zuJWQ=;
        b=FxMedHHxm5tEJPmfZGFoY1kvZanHDK58HYQDJciHDkoHDQDyRt6vYO9wlmm5pvK273
         iKWO5sniisYpe18t8wdoZznuw8DDjYvCzlsH4uuQ2Z/RHyKG4QR0/PFBhsHcEp7WBtwC
         NCUjATdgiGMCcopEtxVnYC1TSl5tJYQwzs3wT10g2F7MqPpprmdfJr2Zweiu0BrGb6ra
         VACfOrjLCtQbQnleoOoqE0W0M1JggA6yJvbOFxhC8h4rXAINnqgTwg3jJ6p28QjjxuvK
         QPoNKLv87wFjqad88Dhb4EzZO2qeHyfmXmCNQA0md13h5dHCJTMFr2THqDKAAXB9L8ws
         mkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781772819; x=1782377619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oUQ+0xSBpfvF1Od2o3ssM+WJLtkna5s39YaO37zuJWQ=;
        b=k+4xFllrsbzqL0/T2Wt4y8RY3UOVBIVhc5uwVD2534KoukrRenOY0xiCpCCf9Pfz13
         mAqJMLX8FlnN9o3HTqe/SMlsAXYM8ys/Q9/7UzqxZ/p6ur3i4s8VWCtdeUQYv+f2lOE6
         x/pcHXup/z4sIi/1ygDdlhfcgM0B8q5qT5cgBAKraDGEFAQpU1Pe0Jo99Zz+hCLtA37e
         Di7zergVgNVBY8cLZv+BI0HtSzUPOcW33AmSh5/9J0NcLVKSpIMnkUiNkHKstG0gWBy2
         MmEo7FOftNq17lBlchIqF9evcCjRF9QSGgM9+oT4jqYYdS3v+M9l/G0LvrR+9uqCBigP
         zerg==
X-Gm-Message-State: AOJu0YylHyLgztefIvp9zra+mrnayXQitpIqDtdL1M/JbPCVi1E6AcU4
	T5Yax0v0jVFrimWlPcWf2CIdKFHYAMD4eVCi/vefy6/dziLWeztvFfelkKmKb/84lLvfQPpjny0
	xDVVNqEvQUr+f6IOuHaYkcHR22p/v/TUJn4/Xw1y8dQ==
X-Gm-Gg: Acq92OFm1Yas6UKV8nnGqF7K7Eqr+hadlJ/3BJYgfU9nH0yaEFLFZ4MRBK3zeeWX/hU
	W8+BHr17GwXka3IYQrJYEDyYIontk+PDWnSOKkVWILLacubCZGQ0Hg5APZwJoGc6blA8alKpjaw
	eRmk2qdornEL4UQG31m5GpTn+ux/Ev+9VhnrZSyt6qryOSzkb8IcXvGTDgnF68t/+xfqK/1TS3o
	6kMlqzUhKHp5iBufUadYL6yFSC73uf0KZwZ2LmqpQJ7bVkSzCP0hnHoLH69ABWlNTcENtFDOPTL
	vmo=
X-Received: by 2002:a05:6870:48f:b0:43c:3678:1541 with SMTP id
 586e51a60fabf-4469045cf99mr5249080fac.28.1781772818570; Thu, 18 Jun 2026
 01:53:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618064406.14508-1-cuiyunhui@bytedance.com>
 <20260618064406.14508-3-cuiyunhui@bytedance.com> <20260618070215.268ED1F000E9@smtp.kernel.org>
In-Reply-To: <20260618070215.268ED1F000E9@smtp.kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 18 Jun 2026 16:53:27 +0800
X-Gm-Features: AVVi8Cc1wsk8OHCml6nVyEvFINMaXLaYsBrkjDDvdX7s6ie08eRbA-euJM6qaHA
Message-ID: <CAEEQ3wkD+qYWSzZ=5VGCzvHDmeiaaeJexNokGgbv7zAqccD5sg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 2/3] riscv: track effective hardware PTE
 A/D updating
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi sashiko,

On Thu, Jun 18, 2026 at 3:03=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] A hotplugged CPU lacking the Svadu extension is incorrectly allo=
wed to come online when hardware PTE A/D updating is globally enabled but F=
WFT is not required, leading to silent data corruption.
> --
>
> commit e238566a69f2ecd235872518a759dd75d54f71af
> Author: Yunhui Cui <cuiyunhui@bytedance.com>
>
> riscv: track effective hardware PTE A/D updating
>
> This commit tracks the runtime state of hardware PTE A/D updating using a
> static key. It attempts to enable FWFT for all online harts, falling back
> to software A/D if that fails, and ensures hotplugged CPUs match the glob=
al
> state before coming online.
>
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
>
> [ ... ]
>
> > +int riscv_enable_hw_pte_ad_updating(void)
> > +{
> > +     unsigned int cpu;
> > +     int ret;
> > +
> > +     if (!riscv_has_hw_pte_ad_updating() ||
> > +         !riscv_hw_pte_ad_updating_requires_fwft)
> > +             return 0;
>
> [Severity: High]
> Does this code allow a hotplugged CPU to come online without the Svadu
> extension when hardware A/D updating is globally enabled?
>
> If the boot CPUs have Svadu but lack Svade, the flag
> riscv_hw_pte_ad_updating_requires_fwft is set to false and the global
> static key riscv_hw_pte_ad_updating is enabled.

No, a hotplugged CPU should not be able to bypass this in the normal
RISC-V hotplug path. A CPU reaching smp_callin() must already be in
cpu_possible_mask, and the
global Svadu state is computed from the ISA intersection of all
possible CPUs. Therefore, if any possible hotplug CPU lacks Svadu,
riscv_has_extension_unlikely(SVADU)
is false and the HW A/D static key is never enabled.

>
> When a new CPU is later hotplugged, it calls this function via
> smp_callin(). Since riscv_hw_pte_ad_updating_requires_fwft is false, it
> returns 0 and bypasses any capability checks for the local CPU.
>
> If the hotplugged CPU does not actually support Svadu (e.g., in an
> asymmetric SoC or due to firmware misconfiguration), it successfully
> comes online. Because the kernel globally assumes hardware A/D updating
> is active, it skips software A/D fault handling.
>
> Could this lead to the hotplugged CPU silently failing to update
> accessed/dirty bits, causing data corruption when dirty data is dropped
> during reclaim?
>
> > +
> > +     cpu =3D smp_processor_id();
> > +     ret =3D riscv_enable_local_hw_pte_ad_updating();
> > +     if (ret)
> > +             pr_err("CPU%u failed to enable hardware PTE A/D updating:=
 %d\n",
> > +                    cpu, ret);
> > +
> > +     return ret;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618064406.14=
508-1-cuiyunhui@bytedance.com?part=3D2

Thanks,
Yunhui

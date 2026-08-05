Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ABCEEA8
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 04:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785903580; cv=none; b=H+MZ6l6Q0WDyHlAKljWNYph6cJXYFy3as+gXtaWwxEq7fHX7mydB1HXeYM//EBSdxUXxznoyncAdASa5I5C21UsT3Ypd0Z7n2iGHN81YOm4ewECQywgoJiNUj7Ihj7ODGtw6mwGqVuykRkgTyrBgdTiP32NRWFvoGgCnzZ4LGXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785903580; c=relaxed/simple;
	bh=DRwaDH8iXJjotMYKVJBLOYnVJgA2X5Wvi2i/SStygII=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X2Mx9w0xJXCjHOAXyjhNEl+69jHwgI9crvvQSgj00Z01Yzma8ESLNAiRe1aIYLIwW5I1xU3aOySqiWX2N/wmTfKmRdrrrxroWSD2GsvjRz8W/EOFVWyEfD+SOuqE6IcS5Z2hYXMjqlkmjIewhljbAgHCBNgb9QibwXF85p4jhfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KK0OBiug; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KK0OBiug"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573F41F000E9;
	Wed,  5 Aug 2026 04:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785903578;
	bh=DOnGoN2Pz8SmwH090ycoTvhGLSYB9iAv9CEUAK2IWr8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KK0OBiugO1GjshU8uM1Z8t1229fvQK/ylzfSupFPnlVT4uNbhV1wlyrsOdlmutUSN
	 sYl8pnHFgRG44oB0ZjQPk6lFtBET84su/WWbu9a74BKRY9MAmzak6dSHQyat92RRCf
	 PYHHVkUoGzY6wlpf5BqBeZSNsr13Ya8fv7StluhjIS0eH7uVSgmyvXDgOTHikOnuJk
	 hhv4ZN8oaYQZkpsL/vkt0TwoJQzeq4BHaHCNgZFdlcyQySadsQj5jf8ZZMCg7pPryA
	 szhtv/aGdTSzqeWmJEhRr8pfDpgQI/EmLIKNqNkxUBbjgjVCNF2wO9GRocttFEPIx1
	 lF4onC7xBZvyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] kexec: add CRASH_ZEROIZE to wipe secrets before
 kdump
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmFuIFNlYmFzdGlhbiBHw7Z0dGU=?= <linux@jaseg.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260731154608.153258-3-linux@jaseg.de>
References: <20260731154608.153258-1-linux@jaseg.de>
 <20260731154608.153258-3-linux@jaseg.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 04:19:37 +0000
Message-Id: <20260805041938.573F41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Calling ktime_get() in the panic path after machine_crash_shutdown=
() can permanently hang the crash transition, preventing kdump from working.
- [Low] Conditionally exposing a raw notifier list without an API wrapper f=
orces subsystems to use #ifdef and risks build breaks.

Pre-existing issues:
- [High] ktime_get_real_seconds() in crash_save_vmcoreinfo() deadlocks on 3=
2-bit systems if the local CPU interrupted a timekeeping update.
--

--- Patch [2]: [PATCH 2/4] kexec: add CRASH_ZEROIZE to wipe secrets before =
kdump ---
commit e20f9219f7505b929366dca07a7894f6b666a4b5
Author: Jan Sebastian G=C3=B6tte <linux@jaseg.de>
Subject: kexec: add CRASH_ZEROIZE to wipe secrets before kdump

This patch adds a new CRASH_ZEROIZE opt-in atomic notifier chain to scrub
sensitive secrets before launching a kdump kernel. The zeroization runs late
in __crash_kexec() after other CPUs are shut down.

> diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
> index c1dee3f971a91..685ed8926966d 100644
> --- a/include/linux/crash_core.h
> +++ b/include/linux/crash_core.h

[ ... ]

> @@ -34,6 +35,10 @@ static inline void arch_kexec_protect_crashkres(void) =
{ }
>  static inline void arch_kexec_unprotect_crashkres(void) { }
>  #endif
> =20
> +#ifdef CONFIG_CRASH_ZEROIZE
> +extern struct atomic_notifier_head crash_zeroize_notifier_list;
> +#endif
> +

[Severity: Low]
Does exposing this raw notifier list conditionally force subsystems to use
ifdefs when registering callbacks?

Usually, kernel APIs provide a wrapper (like
register_crash_zeroize_notifier()) with a static inline no-op for disabled
configurations to avoid breaking the build.

>  #ifndef arch_crash_handle_hotplug_event
>  static inline void arch_crash_handle_hotplug_event(struct kimage *image,=
 void *arg) { }
>  #endif

[ ... ]

> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 4f21fc3b108b8..49192b20dc9f6 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c

[ ... ]

> @@ -33,6 +34,22 @@
>  /* Per cpu memory for storing cpu states in case of system crash. */
>  note_buf_t __percpu *crash_notes;
> =20
> +#ifdef CONFIG_CRASH_ZEROIZE
> +ATOMIC_NOTIFIER_HEAD(crash_zeroize_notifier_list);
> +EXPORT_SYMBOL_GPL(crash_zeroize_notifier_list);
> +
> +static void crash_zeroize(void)
> +{
> +	ktime_t zeroize_start =3D ktime_get();

[Severity: High]
Can calling ktime_get() cause a deadlock here and on completion?

Since crash_zeroize() runs after machine_crash_shutdown() has forcefully
halted all other CPUs, if any of those halted CPUs were in the middle of a
timekeeping update and held the tk_core.seq write lock, this loop in
ktime_get():

kernel/time/timekeeping.c:ktime_get() {
    ...
    do {
        seq =3D read_seqcount_begin(&tk_core.seq);
        ...
    } while (read_seqcount_retry(&tk_core.seq, seq));
    ...
}

would spin indefinitely, preventing the kdump kernel from booting. Should t=
his
use a lockless accessor like ktime_get_mono_fast_ns() instead?

> +
> +	pr_info("Wiping sensitive secrets...\n");
> +	atomic_notifier_call_chain(&crash_zeroize_notifier_list, 0, NULL);
> +	pr_info("Done in %lld us\n", ktime_us_delta(ktime_get(), zeroize_start)=
);
> +}
> +#else
> +static inline void crash_zeroize(void) { }
> +#endif /* CONFIG_CRASH_ZEROIZE */
> +

[ ... ]

> @@ -142,6 +159,7 @@ void __noclone __crash_kexec(struct pt_regs *regs)
>  			crash_save_vmcoreinfo();

[Severity: High]
This is a pre-existing issue, but can crash_save_vmcoreinfo() also deadlock
during a panic?

If a local CPU interrupts a timekeeping update (holding the timekeeper write
seqcount) via an NMI or hardirq, and then triggers a panic, it will call
crash_save_vmcoreinfo() which eventually calls ktime_get_real_seconds():

kernel/vmcore_info.c:crash_save_vmcoreinfo() {
    ...
    vmcoreinfo_append_str("CRASHTIME=3D%lld\n", ktime_get_real_seconds());
    ...
}

On 32-bit platforms, this falls back to reading tk_core.seq, which the local
CPU already holds for write, leading to an infinite spin and preventing the
crash dump.

>  			machine_crash_shutdown(&fixed_regs);
>  			crash_cma_clear_pending_dma();
>  			crash_zeroize();
>  			machine_kexec(kexec_crash_image);
>  		}
>  		kexec_unlock();

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731154608.1532=
58-1-linux@jaseg.de?part=3D2

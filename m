Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98956473C9F
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 16:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515709; cv=none; b=lQpKnhOP3kwBkankX0aFEYFs3OehttQ0KS1mefjZNiicCnCVuE8Kf3QYakG544WCF9tiSbFDIiIvDm23v/xYH7+kWwmuNW5Dg1a3hZbFhXO20xnYZDpGeJgKVqP6ZvOU2ot3E05poGzMmX08g+HX8rA/yFSCxDnLMtCE5MtjshE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515709; c=relaxed/simple;
	bh=sLY9QtTFmjdWnbDJY+V57QCyAY272NXTrQK8lg4QgtA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nz3d6VOPad+/eQO3HadX90CLUAiLEgCkRBe95DlZU0S0mafb00IXePDrfutbVnwLStb9Qp0t8fUJrZ0Eg7GMFB0QO3oF6THvobc3Mi/gQrctn6UOA5GymZM0tTNATJ1gdlLA0eYhH9OzmvtT3IjXwHgDwESh4YOK2khhj3ZEpCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=auP6JJea; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="auP6JJea"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AC31F00ACA;
	Fri, 31 Jul 2026 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785515707;
	bh=a5ovXw79ggC5An12m+nghpdczW1y4nKfM4lgu7CjUms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=auP6JJeaYmKFBjcrFNC8QM7jx44VOcMo4SAkhfI1vIStfpWedCz/tSkwZ8AIM7qva
	 x/NUVrPZZRPRxjiDrqPwxSCMZiV2m60ovHZARhjzlZI5fKgiJf4f6paCP4OV4PCmY5
	 rcdYTO2obXKPfXjwpGmZyguwI/bxjOQXZ3u/RcYw1qMPLFqDQ5HFzfS+t2owDEoz96
	 H3P3UI21VHaMBFtzt2dSUPEDmzmhByGeFqwzgvlM+98jrPFhmzRRoM8nsRxIinbTid
	 SDsrWbk7gJvXkLPO2r8AhVJFdca5KipGKzGEhKdqRKbICrvT2t4TAS0EumOFPvzbSx
	 Qapc56rdo5VLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] kexec: add CRASH_ZEROIZE to wipe secrets before
 kdump
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmFuIFNlYmFzdGlhbiBHw7Z0dGU=?= <linux@jaseg.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260731162739.158320-3-linux@jaseg.de>
References: <20260731162739.158320-1-linux@jaseg.de>
 <20260731162739.158320-3-linux@jaseg.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 16:35:06 +0000
Message-Id: <20260731163507.24AC31F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Deadlock in `crash_zeroize()` due to `ktime_get()` during kdump pa=
nic path
- [Low] Missing registration wrapper for conditionally compiled `crash_zero=
ize_notifier_list`

Pre-existing issues:
- [High] Pre-existing deadlock risk in `crash_save_vmcoreinfo` on 32-bit pl=
atforms
--

--- Patch [2]: [PATCH 2/4] kexec: add CRASH_ZEROIZE to wipe secrets before =
kdump ---
commit 3005bf8ed21843217c4ae3efeb7db1241b960e62
Author: Jan Sebastian G=C3=B6tte <linux@jaseg.de>

kexec: add CRASH_ZEROIZE to wipe secrets before kdump

When kdump is used to capture system memory after a panic(), any secret
keys currently in RAM end up in the dump. Add an opt-in atomic notifier
chain, crash_zeroize_notifier_list, invoked late into __crash_kexec().
Subsystems holding secrets can register a callback to scrub them.

> diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
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

[Severity: Low]
Is it possible to provide a registration wrapper instead of exporting the
list directly?=20

If developers try to register a callback using=20
atomic_notifier_chain_register() when CONFIG_CRASH_ZEROIZE is disabled, they
will encounter a build failure unless they wrap the call in #ifdef guards.
Adding a wrapper like register_crash_zeroize_notifier() with a static inline
stub for the !CONFIG case would avoid this.

> +
>  #ifndef arch_crash_handle_hotplug_event
>  static inline void arch_crash_handle_hotplug_event(struct kimage *image,=
 void *arg) { }
>  #endif

[ ... ]

> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
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
Can this ktime_get() call cause a deadlock?=20

When panic() triggers kdump, it calls machine_crash_shutdown() to stop all
other CPUs. Since crash_zeroize() executes immediately after this shutdown
step, if any other CPU was executing a timekeeping update and holding
tk_core.seq for writing when it was permanently stopped by an NMI/IPI, the
panicking CPU will spin forever in read_seqcount_begin().

This would entirely prevent the crash dump from being collected. Should this
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
This is a pre-existing issue, but does crash_save_vmcoreinfo() carry a
similar deadlock risk on 32-bit platforms?

Looking at crash_save_vmcoreinfo(), it calls ktime_get_real_seconds(), which
relies on the tk_core.seq sequence lock on 32-bit architectures.=20

If the panicking CPU interrupted a timekeeping update, or if another CPU was
stopped while holding the lock, this call will spin forever and block kdump.
Using __ktime_get_real_seconds() would bypass the sequence lock.

>  			machine_crash_shutdown(&fixed_regs);
>  			crash_cma_clear_pending_dma();
> +			crash_zeroize();
>  			machine_kexec(kexec_crash_image);
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731162739.1583=
20-1-linux@jaseg.de?part=3D2

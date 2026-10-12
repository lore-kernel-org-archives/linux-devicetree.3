Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29083C3F76
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 21:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841448; cv=pass; b=lPgtZ/v8PbughKHHvVEGmnyTNN5qVU/FuexRjeGTWsEvIOD6tJx5og5FS8ctwdPAsT8Aad8Y7ckS8YxbpOgEKFi/k0Fp9ydMrGO/eEdX+uz3JMPmzzDqXPPnJMib0TD2RDLMfNu774ss91sw79twQnTmK5d+yaQgq8IP2zQ5fBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841448; c=relaxed/simple;
	bh=4rQCMA0YD118aHw+hhFF9+PsdILXF6N9UmQsk1sUyMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EqgaKh2WVIfHYWiZtJ0KT7Gz1o2rCmuA8RTtdoIHHhJ1We9R2YKVTUitx48D5oQewkxxReklCLII9f1RiFmCzLjkGCH3Zn8vGuUZNdNFKOVf4a/DjbonjZa5PqyTJIekO0jkhRxek5+zVgY59a6ec0oNY3K+CdVSlwYoLl+o364=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVoETAZL; arc=pass smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVoETAZL"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-78fb9d46f0aso1235848137.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 14:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791841446; cv=none;
        d=google.com; s=arc-20260327;
        b=jbOizegj9WXRzjXFBi/o2OLlvAhjRPqy7uPTzalTapbyhyRQoTVY6DzyCgUQuAfrfr
         3p9Ptfui8qPJQ/mwzKQivEMSDWjSPVs/kZN89i+qPc6wS9pKGjHGJGgOk/zCTUevZXV9
         QpdmTAXoB+5+0DGxU34HcIlazhAkVQMHp27NtxltoBx33BPSmJditudZDmriE03M0kCL
         6FLF0mTaJ3b4vCMKM92pTL5xXALcozIRNT4ThXFPnvmUHj1n3Id1DFjR2EBkheBp2ve8
         17BYZkvacoLRIIgX7J8se6TlEmyRt6FwXWTOd3wNSBkNji1HklG5QqDv9FVx8BWwYbuf
         0dQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IgcW+mBezfmaVemco2WC7GasvmmjoylpddtvtSsj0OQ=;
        fh=aHnVTowznmsqnXZiyK3VFFjA5ewxWlSJQE/lAKElx6s=;
        b=BidzM3pLI6R55ixpsIUxkAU5haHUTqd5cBn+uir9HBsUuPmJ1J7b3lgaILNLuPFySH
         7ysp9lVPJKmNuvwRUWezvMYK2+2sqgkrLlpDQ4kaaMO5bjlXhQPpYMFkDcbJCiuKJzFt
         IgGPyUKae/7L1WHPlal3yetnyKGHAPThg/Kacarq0QGdy9B1YbVpryfg7zjDLPkXyptA
         kc5Z10isvLHa4XfC0OL/dP+av1rxMgKrvEBGXCsF8HTuipgMgNLvuAFNWfr17paNpoHc
         SH5lLsaPiXYkmHOeamYUrvFynoPAswB1obQDT3pO4AcW6DipdPFoL8LTE+4lIhGra3NR
         H56A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791841446; x=1792446246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IgcW+mBezfmaVemco2WC7GasvmmjoylpddtvtSsj0OQ=;
        b=AVoETAZL7gSCTxtLGecnwJyb3IdeC7SraxprdR3BUyxzyt9spcJBsDt5JLT0dHOkzW
         DnFiaNpT4XSvB0YxXB0ScjDmdDXr23wwVNzSvLQwnD0nsxE+vVm1ZNln5Wggxn9I5QP3
         U9IuWRMQuOZlLBcy8wNhPW2etLpkFm1mrAkivIqf07M0GYrVIKkcs5OwXDMfhbngeZ68
         o8sqIYLMfA3ypYrM15eSRdGZQSFEcTZUp+6ud3JkDxjoDsS0yLi1bWjBqw30dnvvaMLf
         nch/z5dalphBEsKHcs7E0G1RPX/pIyYwyy0EjFfOFyz5u1ROTfOrw9IzIS/RwkFVE0zo
         qsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841446; x=1792446246;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgcW+mBezfmaVemco2WC7GasvmmjoylpddtvtSsj0OQ=;
        b=Hhka+j8Sp1TWYR7QjsBR2D/MPgU0zFfEYvkT4IQeXOXtd56PiJfB2iY8UUWLCuJIIU
         Wokwsc7uZs3qS+3vw5zPQ+4v21AfNTK6VIICJILC3CuYMJhFpSDzzIDtQ/CmLMlMAFbz
         yrVBdQDEGJS/5VxmZoC1EJVvx4WU/ds6HHYAjeNus+6ftKCMgoJIgmhzYjDAEqvKKuXC
         tAt1o1SpKROKVjXtian99SdcEZl4bodw//vHW7+WqUkgwE4nacOvRz5zRLDjTzdhMHPh
         lN/X48SHTZ1EMz3/8F+XEuTsewwksjrPc16n+it0cuE95XvLYAf571xyNd7JFlJ8Jqr5
         k2fQ==
X-Forwarded-Encrypted: i=1; AKwUvBxq3olf6x0G8CuulWWodhXf+mngFUlwPQJ6kCMqsOxyUjvSc8EJe2cR/m+Xa06loQyAGcfbO1IAzrFO@vger.kernel.org
X-Gm-Message-State: AFq9FYIiQCOcLzVWhOnvuZKFbZbuLDVjG7ugcvwMI15FRDEi4co6s8eT
	kAHZvuFfN/0q2pLcz1qB7VNMMKsEDp65trSUuWVppOJq7cmtgydPWMfLEZLUwNnwTykFuno04QC
	/XRBm7OSOjbHl0UHnOil2MGWpF2IA3BM=
X-Gm-Gg: AYBFou3ZgD/G8V8pLYlZlqTi8MVMJSbtSYxFrVX05EtcmvOEh7+q37CoeFaBvL2udHq
	R82AiNVSVs/T+8CNLvaFmH4zU7JOTGo9dL/opdbdUV9Z+Hv9LeEYyz7kG+psmJs8Q8l7gX4yBUg
	fZhKgQuTr/50DWw5m1KBaQSCHwwt0BnMMpmgCKY9iuQPAyLbzrndW4QVn7YsO6e5VDYS1ITuYo1
	CsBAKFLDHR/uHa623o5Tcb70rk6NDdIcYx5HAS3p71vH8tVs6OpoD2jGfxXd3TXwxis4ZxO0Hv1
	3n4A4RW3hcNSEJufBH7HCWqUSQOm6qATRTCo88Rw4tNcXVI23Z7/VyfF7giAPk1gyHgmHygqScR
	2U4pQW6IQZ88aRGT4OunUd+7Ly/CgtjNbdIEyNjH0ef8XRDGGIZSQSgg3UAypWjW8mtKJW1oR2a
	Q9n/gV+EIao23dHT89bOZ0a1SF1pF1XgISBvHPCMJk4WvmEA4vHxioAxc=
X-Received: by 2002:a05:6102:5814:b0:79e:2b00:b4da with SMTP id
 ada2fe7eead31-7cb3a0059admr2967326137.6.1791841445569; Mon, 12 Oct 2026
 14:44:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-1-2fb084fe0751@gmail.com>
 <8733ua23xs.fsf@bootlin.com> <CADvTj4pmtGZ4c04q+5AE3trrfshToD7BPtF-8kPxPRZ25hOTRw@mail.gmail.com>
 <877bjmzqkr.fsf@bootlin.com> <CADvTj4ppQannShF+dkLreST94g_vSAg4QdMqxhNORzkvci3O1A@mail.gmail.com>
 <87pkxey725.fsf@bootlin.com>
In-Reply-To: <87pkxey725.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Oct 2026 15:43:54 -0600
X-Gm-Features: AclHuK9S8X-EJbG6Jz0l1nDWbI3paRApUkydjtgW5vHKMROEOTWMTqhZBvuvO68
Message-ID: <CADvTj4p-o=EQMq-6E1q2=NOmQbscAVGMUbwX+Wh4R0v5kbXe_w@mail.gmail.com>
Subject: Re: [PATCH v6 01/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 2:53=E2=80=AFPM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
>
> >> >> commit log, I now disagree with the first part of:
> >> >>
> >> >> >The old handler can also complete the new wait or restore an obsol=
ete interrupt mask.
> >> >>
> >> >> "complete the new wait"? I don't see how a stale handler completes =
the
> >> >> next wait given the handler is a hard IRQ and the interrupt enable
> >> >> register is cleared on timeout.
> >> >
> >> > The case I had in mind is an already-running handler on another CPU:
> >> >
> >> > CPU 0: Read st and ien for operation A.
> >> > CPU 1: Time out operation A, mask/acknowledge its interrupts,
> >> >        then eventually reinitialize the completion for operation B.
> >> > CPU 0: Call complete() based on the saved st and ien from operation =
A.
> >>
> >> For this to fire, the hard IRQ handler on CPU0 would have to be stoppe=
d
> >> between reading st/ien and calling complete() long enough to span:
> >> - A's timeout
> >> - A's cleanup
> >> - B's wait being rearmed
> >> On this hardware, how is this reachable?
> >
> > CONFIG_PREEMPT_RT provides a concrete mechanism. The driver requests th=
is
> > IRQ with flags =3D 0, without IRQF_NO_THREAD, so the handler is
> > forced-threaded. A higher-priority task can preempt that IRQ thread
> > after it reads st/ien:
>
> That argument only appears in this reply. It is not in the commit log
> nor in the diff, both of which reason about a hard IRQ, no? I'll happily
> take the PREEMPT_RT case into account: in that configuration the case is
> reachable, but it reads as a justification added after the fact.

Yes, PREEMPT_RT was a later concrete explanation of how the race
could occur. I should have made that distinction explicit.

The original rationale for disable_irq() was to establish a clear
boundary between the old handler and timeout cleanup.

Simply masking the controller interrupts does not stop an already
running handler. A partial-event handler can subsequently restore
an obsolete remaining-event mask. A handler whose saved status
satisfies the wait can instead signal the completion after the
waiter has moved on.

disable_irq() prevents further IRQ dispatch and waits for existing
handling to finish. Cleanup can then mask and acknowledge the controller
events without the old handler modifying that state afterwards. The
register readback flushes those writes before re-enabling the IRQ.

This also keeps the additional synchronization on the timeout path,
without introducing a driver lock into every successful interrupt and
wait setup. The checks at the time established that the caller could
sleep, the handler did not require the NAND controller mutex held by
the caller, and the IRQ was not registered as shared.

Sashiko's report[0] was the starting point and mentioned both
synchronize_irq() and disable_irq(). The ordering above was the
reasoning for the implementation, rather than the suggestion alone.
It was not based on an RT priority-inheritance analysis or a measured
performance comparison with a spinlock.

[0] https://lore.kernel.org/all/20260909085434.C8F201F00A3A@smtp.kernel.org=
/

> Then, I'm curious to know how the AI justifies the use of disable_irq()
> as the RT-appropriate choice: doesn't it block without a timeout on the
> very IRQ thread the scenario relies on being starved (and gives no
> priority inheritance)?

Yes, it waits without a timeout and does not provide priority
inheritance. I would not present it as the better choice for bounded
RT recovery latency.

A spinlock_t-based implementation can provide priority inheritance on
RT, provided the handler holds it from the status/enable reads through
the register updates and complete(), with corresponding protection in
the waiter. That improves recovery under priority inversion, but adds
locking to normal interrupt handling and wait setup/cleanup.

There is a real limitation: if the IRQ thread remains starved, recovery
cannot finish, and other NAND operations can remain blocked behind the
controller lock. So the operation timeout does not bound the entire
cleanup. The argument for this implementation is the straightforward
handler-lifetime boundary and absence of additional normal-path
locking, not that error-path latency can never matter.

>
> Thanks,
> Miqu=C3=A8l

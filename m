Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C4F2264A7
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 11:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791200157; cv=none; b=qhSjmZHOwfeM3MFO/ikFLAXYzyy4txfC6liaF3tXhG9Y6LlOp4AH+GTQ9DH64pgC1e/eujVbbKGF8EzUuBWff593Sqq7Ddtfs9QZmTHyg8lEK4v8KEOl4fZt+Xbi7CFZoXr7p/dQKM3+Eog2x4s3VdiLXpQ9yzxSOVV9LW76eQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791200157; c=relaxed/simple;
	bh=TiNOeBmlc6jzsdImhyFTVM4dUnDAF1ZqeoBuR7eGKtU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EWMfnc4svI6sz1Guf8/LTCjlgOaHTgyabajFZWf/GXJ7JtFvnmDADJabSTAfOnbxK9mLkexldPqp6JUdH4RzpsHy8iG15gtC6LW+fBu2109RoXpUuf8laLT7AZcQyiKqrnwouXybC+zW767kl4FhwKBOLJ96eO5ib7MmU5A32+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cl1ocp3A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cl1ocp3A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA381F000FF;
	Mon,  5 Oct 2026 11:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791200156;
	bh=TiNOeBmlc6jzsdImhyFTVM4dUnDAF1ZqeoBuR7eGKtU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cl1ocp3AayuEPh/PjXPWSwcxA3YkdW4i5PuN5C75eS2f2/SUTr2ekmqR6dQv7PJGO
	 WFpyQHmII3PqG8CPxdt9qVFaHRMecarUamd8kSBAWB/bBV5yuLITUnyqhub0b7Ek5y
	 7BcNtN540/2GGCFrJhCvZk0DH/kV8f7J4MSxRnz48QV8WZ01wIPS1MjMa+XmPUiM00
	 UYNBaeTChnUNcToDEOr0naxfLWbRA0xN1IhOXR7pm8wzpr07iEJIvwbO1g9ilPC3D/
	 R/rzu1SzEB8go6KWlUkWb1pmIhmjL/yrFftAdGnEmpEXL3ODWTCDGIsTbccP2YxSAI
	 sFtHe+3BRV/yQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/8] irqchip/al-fic: switch to shared parent
 interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eliav Farber" <farbere@amazon.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261005112458.22291-5-farbere@amazon.com>
References: <20261005112458.22291-1-farbere@amazon.com>
 <20261005112458.22291-5-farbere@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 11:35:55 +0000
Message-Id: <20261005113556.2CA381F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] irqchip: al-fic: uninitialized mask_cache causes false IRQ_HANDLED=
 in shared handler
--

commit cfdc04eba40afdf67fb8743fd9c337f5dc214952
Author: Eliav Farber <farbere@amazon.com>
Subject: irqchip/al-fic: switch to shared parent interrupt

This commit modifies the AL-FIC driver to request its parent interrupt as a
shared interrupt instead of using a chained handler. This change allows
multiple FIC controllers to share a single output line toward the parent GI=
C.

[Severity: High]
In drivers/irqchip/irq-al-fic.c, at line 169 within al_fic_register(), the
parent IRQ is now requested with IRQF_SHARED. Because the generic chip is
allocated with IRQ_GC_INIT_MASK_CACHE, gc->mask_cache is initialized to 0
and hardware sync is deferred until the first child IRQ is mapped.

Does requesting the shared IRQ at this stage expose the handler to early
execution if another device sharing the line raises an interrupt before any
child IRQs are mapped?

If this occurs, when al_fic_irq_handler() is called around line 105,
the bitwise NOT of gc->mask_cache evaluates to 0xFFFFFFFF. Any latched but
masked events in the AL_FIC_CAUSE register would then bypass the software
mask, resulting in a non-zero pending value.

Could this cause the handler to loop over unmapped bits and falsely return
IRQ_HANDLED? Falsely returning IRQ_HANDLED defeats the kernel's spurious
interrupt detector, which might lead to system hard lockups if the shared
line experiences a spurious storm or becomes stuck.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005112458.2229=
1-1-farbere@amazon.com?part=3D4

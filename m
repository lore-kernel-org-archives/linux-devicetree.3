Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733638;
	b=BEV4oDauf4Dr5xjc8lgqpPflQ0tPYR3GHVR+jO9/HFfLzqv+9pHUZ4H5T2jyI+I1Sx3C
	 baEhQCP/o1qB73oPlnGYZqplXydtIy5GYNRd2uFGinzJ+H64SocBxYpkgZ+b9yli/1ET/
	 rEZ8olxAKwFAO1K+0niidF9V1XBW0GPrhprq/e2B1tOe1miW8s4F+iKov6fit8tlSeOM1
	 y6Qs5BxCPHoN6F70oSyxXw3wBfJSHwuGZEgO8VtpRg/LLzOK2Ww0zCUZNaZVI5eyB900a
	 ftQEYde90fuWzJt6UFu8x3Vk9046I1p4D1SiYcPMJ/U9INhdOpCkxdmSXIMi9KtT8uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733638;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fFrb3dCqPXx/d8YMBfqqDiWfu/Ydv7jjLOnJXL4bbGs=;
	b=lhf7Hxgaux9eh8gm4fkJSAIBB7syJaURZXGZqK+s4ruGSCI++CX4uxbJcZtT8ldC7H76
	 H5ifGDEw72/dl+c1ojOzBdK0djcMGq8RMSV8PHgcRIm+UNzOrYvxYPBdP9TLagyN5Z2G2
	 5Hk1HAxYHiDn0md0QTyiNEBDIHLAN5N2jqk56SDXpDJ4QZYCzF3D6ougxtGhB5Ig6L9up
	 diXV0kpRcgjqctwN78MCA0Yn6Ur1abM6vxV09yAVO5w1GW/DLjlsCvOB7tEW9NuLcrFua
	 3cYqGQs3cZtqf3QXaFbawm9utniSHUCZGlhLTLEafal3FON4wxqwDqe9S9l/qB7FeQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lu3PIb1G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090CF606A31A
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lu3PIb1G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E2A1F000C4;
	Sun, 15 Nov 2026 09:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794733637;
	bh=fFrb3dCqPXx/d8YMBfqqDiWfu/Ydv7jjLOnJXL4bbGs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lu3PIb1GnPQXPGCRUL5WWamkSfW9IjuBfWUtxmOdp1efiLc840m2yEX+cKETpMvvl
	 S2799M5VHaBRmd2KWLHDoJ9c5zbXe00UugxEFakMOcGQvOj5aryANdah6S98x4yhvt
	 qBksZAQaT2BxT835821PlqFdn2/Qw9ttIuQJAOdbrM3KlHCeVN7sXF1qZAEOK/3hbK
	 f1Hq8iODMwsMwvJ3RABOXV3wvdTUXCpGNocd1mcPQaH2vrfpQopjznob9xjjVIuCFo
	 TbPX5Pigqqv4q/ZHGdXgPus3T+Rlx5puGX8H17Ecetck7YJRZza62g/yPay9cwIRZO
	 IMhbnczzwG+oA==
Message-ID: <sashiko-outbox-215326@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] media: rockchip: Add IEP2 deinterlacer driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261115-iep2-v2-2-3d8798cd9a55@gmail.com>
References: <20261115-iep2-v2-0-3d8798cd9a55@gmail.com>
 <20261115-iep2-v2-2-3d8798cd9a55@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 09:07:16 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] media: rockchip: iep2: race in iep_device_run() releasing
  irq_lock early
--

commit c53068d9410d9d69d9ff5d8e23bf87ad9adb3c8e
Author: Arun Iyengar <aiyengar1990@gmail.com>

media: rockchip: Add IEP2 deinterlacer driver

This commit adds a V4L2 mem2mem driver for the Rockchip IEP2 deinterlacer
found on the RK3568 and RK3588 SoCs.

> diff --git a/drivers/media/platform/rockchip/iep2/iep2.c b/drivers/media/=
platform/rockchip/iep2/iep2.c
> new file mode 100644
> index 0000000000000..709c16f3c7fd5
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/iep2/iep2.c

[ ... ]

> +static void iep_device_run(void *priv)
> +{

[ ... ]

> +	spin_lock_irqsave(&iep->irq_lock, flags);
> +	iep->busy =3D true;
> +	iep->irq_status =3D 0;
> +	iep->foreign_irqs =3D 0;
> +	spin_unlock_irqrestore(&iep->irq_lock, flags);
> +
> +	schedule_delayed_work(&iep->watchdog_work,
> +			      msecs_to_jiffies(IEP_WATCHDOG_MS));
> +
> +	writel(IEP2_FRM_EN, iep->regs + IEP2_FRM_START);
> +}

[Severity: Medium]
Can releasing iep->irq_lock before scheduling iep->watchdog_work and
writing IEP2_FRM_EN race with iep_watchdog() or shared interrupts?

CPU0                                  CPU1
iep_device_run()
  spin_lock_irqsave(&iep->irq_lock)
  iep->busy =3D true
  spin_unlock_irqrestore(&iep->irq_lock)
  schedule_delayed_work(&iep->watchdog_work, ...)
  <preempted>
                                      iep_watchdog()
                                        iep->busy =3D false
                                        iep_reset(iep)
                                        iep_job_done(ctx, ...)
                                          v4l2_m2m_buf_done(...)
                                          pm_runtime_put_autosuspend(...)
  writel(IEP2_FRM_EN, ...)  <-- starts DMA on returned buffers / unclocked =
regs

Similarly, if IEP_MAX_FOREIGN_IRQS shared interrupts arrive on the shared
IRQ line right after spin_unlock_irqrestore(), iep_irq() sees iep->busy
and wakes iep_irq_thread(), which finishes the job before iep_device_run()
queues iep->watchdog_work and writes IEP2_FRM_START.

Keeping schedule_delayed_work() and writel(IEP2_FRM_EN, ...) inside the
iep->irq_lock critical section would make publishing iep->busy atomic with
starting the hardware and watchdog timer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115-iep2-v2-0-=
3d8798cd9a55@gmail.com?part=3D2

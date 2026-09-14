Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654513438BE
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379899; cv=none; b=pGeT8Jsjm3aGZXWa+Nvts8GAGZFjCQmHdEiH292kntPvUzXabmO2hMUhFqMiTRx18dCTGDqzXUnvC3sxchwkcrJl+X/1j7llvnYaqWQr46/+hOgpscUbdAxkqGr1qkQK/fYwRD5on4r1DysAFIE2mqgQXH6ai2Cm7To0DJgSnn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379899; c=relaxed/simple;
	bh=HilxZZk8eR2h9DSshuAFtI2+y3AuwC09GktdgBd/scA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rrrjYdi6ysvpUKN7oLDblo1+aIDoAWzsfOvs+PJWOTBj16gc7Al+Bkwek7b/cUi3mvc6HSzClC7wqmfOocymskipfCCHoRDPJmrOrIN/ZA7MMCupKHrClbOCR6VzYGj5J2Rdwmtp2+7HcR4MPZZhi8K6xGZxSuU8dGZPMMstt9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QG/kCyJL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QG/kCyJL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A272F1F000FF;
	Mon, 14 Sep 2026 09:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789379897;
	bh=II3WHko20zRsvUlhPeKvFvo/tq3LGZY5r0bNpCMCK9A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QG/kCyJLEKM7Lu/xuz32nkosR/p79RSxJ5K/hvhWaZv00469rmsFmgPDahr89ymvK
	 C+B0ULaO7YCZD91bhpVaBjuqfmfpbknNondSP8UwKbEs6S15TFoCwnfvW9Iv16F3uS
	 IsDn0ncz0s2WR/nRjJyiKoyzA7SQTPHhG33wEzBXGfsCZfj0xS+6i+nyN1VRWzSeu6
	 u00hz0Z+Ea36RPMGz9CgQGxdN8aLz75JgqZ6KLcsvulB8g1mmldmGbYafhwxVE3JC6
	 ssNezVgnviUYsdVL1zPIUUAr6GjDwqUTBzKUsmFcbotdzkPoIBU7/eSkH2qGp8+jC5
	 +X7a7vyLlxDmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 02/10] arm_mpam: Fix MSC MMIO window size
 off-by-one with resource_size()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yin Li" <yin.li@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-2-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
 <20260914-mpam-resctrl-dt-knp-support-v2-2-bf6645bb2f65@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 09:58:17 +0000
Message-Id: <20260914095817.A272F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The per-cpu memory allocated for msc->error_dev_id is never freed,=
 resulting in a memory leak.
- [High] Premature devm_kfree of the msc structure leads to a Use-After-Fre=
e during devres cleanup.
- [High] Virtual memory leak in the NVIDIA T241 quirk due to unconditional =
ioremap.
- [High] Hardware NRDY wait delay loop may be skipped entirely due to usecs=
_to_jiffies truncation.
--

commit 730cddf02b20e6f247fdb58e9bc95501ec54e318
Author: Yin Li <yin.li@oss.qualcomm.com>

    arm_mpam: Fix MSC MMIO window size off-by-one with resource_size()

    struct resource uses an inclusive end address, so the window size is
    end - start + 1. do_mpam_msc_drv_probe() computed it as end - start,
    which is one byte too small.

Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@int=
el.com/

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_device=
s.c
> index 6da217abf6894..c68135ee0ffcb 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2095,7 +2095,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struc=
t platform_device *pdev)
>  			dev_err_once(dev, "Failed to map MSC base address\n");
>  			return ERR_CAST(io);
>  		}
> -		msc->mapped_hwpage_sz =3D msc_res->end - msc_res->start;
> +		msc->mapped_hwpage_sz =3D resource_size(msc_res);
>  		msc->mapped_hwpage =3D io;
>  	} else {
>  		return ERR_PTR(-EINVAL);

[Severity: High]
This is a pre-existing issue, but does do_mpam_msc_drv_probe() leak
the per-cpu memory allocated for msc->error_dev_id?

When setting up the MSC, __setup_ppi() allocates per-cpu memory:

__setup_ppi()
	msc->error_dev_id =3D alloc_percpu(struct mpam_msc *);

If the probe later fails, or during normal device teardown via
mpam_msc_destroy(), is free_percpu() ever called to release this memory?

[Severity: High]
This isn't a bug introduced by this patch, but does the devres cleanup
for msc->probe_lock lead to a use-after-free?

In do_mpam_msc_drv_probe(), the msc structure is allocated via devm_kzalloc=
(),
and then several mutexes embedded within it are registered with
devm_mutex_init():

do_mpam_msc_drv_probe()
	msc =3D devm_kzalloc(&pdev->dev, sizeof(*msc), GFP_KERNEL);
	err =3D devm_mutex_init(dev, &msc->probe_lock);

During removal, the driver manually deletes the allocation:

mpam_free_garbage()
	devm_kfree(&iter->pdev->dev, iter->to_free);

This frees the msc memory immediately, but the devm_mutex_release actions
remain on the devres list.

When the driver core cleans up the remaining devres actions, will it call
mutex_destroy(&msc->probe_lock) on the already-freed msc structure?

[Severity: High]
This is a pre-existing issue, but does mpam_enable_quirk_nvidia_t241_1()
leak the virtual memory mapping for the scratch registers?

mpam_enable_quirk_nvidia_t241_1()
	t241_scratch_regs[msc->t241_id] =3D ioremap(phys, SZ_8M);

This maps an 8MB physical region and stores the pointer unconditionally.

If multiple MSCs exist on the same chip, or if the driver is unbound and
rebound, will this overwrite the pointer and permanently leak the previous
VMA, since there is no corresponding iounmap() during device removal?

[Severity: High]
This is a pre-existing issue, but can the hardware NRDY wait delay loop
be skipped entirely due to truncation?

In mpam_msmon_read(), the back-off wait is calculated as:

mpam_msmon_read()
	wait_jiffies =3D usecs_to_jiffies(class->nrdy_usec);

	while (wait_jiffies)
		wait_jiffies =3D schedule_timeout_uninterruptible(wait_jiffies);

If nrdy_usec is smaller than one jiffy tick, usecs_to_jiffies() truncates
to 0.

Does this cause the while loop to be skipped entirely, forcing the code to
immediately retry without giving the hardware the required physical time to
exit the NRDY state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-mpam-resct=
rl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com?part=3D2

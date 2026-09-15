Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593E92F290A
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469920; cv=none; b=gZSpByvOlB2vNLguAYCcRagLYyiY1AQ2RT+Wj9nWMHc/JcTNiszyDIGlOw1dooEwO57e8bB+O7ZPvY9FumduOnPfjOZHC1e3MM9auXSaTh2g7LOakVfwgUWtmFq8jyGAZRIj8u9FGcA5sWM929LZg6miUnzM30nL+3HM3yWV16Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469920; c=relaxed/simple;
	bh=Dg2XO+lMNkoT8sRYl9QF0gbJboGL9REfP/VbUEuJ5Oo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FaiV+gTJJeVKE0hINikFzHCpkiVcjjv2sGqLDLTM0cjh7oA3ukfMbpSwYa5G7PrOOkcHg13GZM5kAPvXCyLDQHm+wu3Yuvpdri294+TFiamUS66e5z3xBWdR4Q4vySAhBTnVFNWsPEEF7y3To6NTR5s+HRvExp5y61q8f/RXZnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzuQ9D2x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzuQ9D2x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95CFD1F000FF;
	Tue, 15 Sep 2026 10:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789469918;
	bh=4+2JuIf1m5Sq29ZoqN5yO88CtDicReaSY65+x4n/l3M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lzuQ9D2xIusQxEpsAT34Ir+FzGPwOtrErZz+Accb9r+ieTP7DZYkNNOpoihKd9Qn2
	 wK2gaAz05t7mVjpbV9urcIV8BuyKzlZXjIJpTT/YHD6eeNul0UbkgcSOH2+iOy011Z
	 W3a3hc/hQcrRlQPsvmn5jbFUo7Ozjr38q1MBtWYNaEO8kSMMj8oUqbQmJYZwjJyNRd
	 1iYE4aQ3vkfS9PBKifj7YLMorq35YWkeN1bKAAou6sCBhQ0oNin5TYA35iBvYeedzJ
	 B9Ee4waIfYOEepaF9Q12vDjZmvHOoUNd6o9bMdIcSqjIEdOZadDvCp/jcZmT49xvRI
	 sm1EFvjW0/JZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 04/14] accel/rocket: let the core suspend after a
 reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260915104328.45901-5-gahing@gahingwoo.com>
References: <20260915104328.45901-1-gahing@gahingwoo.com>
 <20260915104328.45901-5-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 10:58:38 +0000
Message-Id: <20260915105838.95CFD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Race condition in reset path prevents required IOMMU hardware reco=
very
--

commit b227f4b369396fb45d834eeade730dbc33623b84
Author: Jiaxing Hu <gahing@gahingwoo.com>

    accel/rocket: let the core suspend after a reset

This commit replaces pm_runtime_put_noidle() with pm_runtime_put_autosuspen=
d()
in the rocket_reset() path to allow the core to suspend. Cycling the power
domain issues a bus interface reset that is needed to recover the IOMMU.

Link: https://lore.kernel.org/all/20260819073530.6087-1-royalnet026@gmail.c=
om/

> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index dfe9135d86af5..2a0b8af6f67da 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -437,12 +437,12 @@ rocket_reset(struct rocket_core *core, struct drm_s=
ched_job *bad)
> =20
>  	/*
>  	 * No handler is running now, but we might still have stuck jobs. Let's
> -	 * make sure the PM counters stay balanced by manually calling
> -	 * pm_runtime_put_noidle().
> +	 * make sure the PM counters stay balanced by putting the reference the
> +	 * job took, and request idle while doing it so the core can suspend.
>  	 */
>  	scoped_guard(mutex, &core->job_lock) {
>  		if (core->in_flight_job)
> -			pm_runtime_put_noidle(core->dev);
> +			pm_runtime_put_autosuspend(core->dev);

[Severity: High]
Does using pm_runtime_put_autosuspend() here guarantee the synchronous hard=
ware
power cycle required to recover the IOMMU?

Since pm_runtime_put_autosuspend() is asynchronous, it merely queues a susp=
end
with a delay. A few lines below, rocket_reset() calls drm_sched_start():

drivers/accel/rocket/rocket_job.c:rocket_reset() {
	...
	/* Restart the scheduler */
	drm_sched_start(&core->sched, 0);
}

If the scheduler has jobs queued, it will immediately dequeue the next job =
and
execute rocket_job_run(). This function calls pm_runtime_resume_and_get(),
which increments the usage count and cancels the pending autosuspend before=
 the
timer can expire.

Could this race condition prevent the power domain from cycling under conti=
nuous
load, leaving the NPU's IOMMU unresponsive and causing subsequent jobs to f=
ail?

Would it be safer to use a synchronous put like pm_runtime_put_sync() when
hardware ordering constraints require the device to be powered down before =
the
next operation?

> =20
>  		iommu_detach_group(NULL, core->iommu_group);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915104328.4590=
1-1-gahing@gahingwoo.com?part=3D4

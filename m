Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286FD368D45
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 03:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785382868; cv=none; b=X7jK7RN9+wW3/H0GuvUbgbXGEUoVflxSy9sao0R8l4Qyq5333zumRn4FP7ARFRy2bzGLrjC5MKph4VSeI1XP9+2nJao1NrQ2vW7+hV67Rl+0GDL+VBRbc9HfMFUHbx/dRBLQJXSbavoG4Y2fYhncJsSGGP5niIgnEjzMgNDt7wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785382868; c=relaxed/simple;
	bh=CBXoKg2an+wMcUzIIblUysY/mQ9XY3zlUmr/meWNodU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GvcevgBqT8VTIqJ4HTU+TtNAqrIbsclAsXHGMaQwjZi+rq3g5DNWdFCao7n8ZhPaNL+35JaGyAG3soE7CaT/PeLnKbodhFhwREcSTU6EON3Rz2R7hkVn97ZEQl9fLqCtYj/YyCkWEveplVGyTE73jal0d8K0Iv3cmWwSgIuJ5uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sk4ltDFS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sk4ltDFS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77B791F000E9;
	Thu, 30 Jul 2026 03:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785382866;
	bh=gcQf7LfCfRL4b+LBF7AnlRQQkloeBoFjV5OUSn68EYY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sk4ltDFS+gIakGg6h7nt1JhE/LuDHjL+YYLZO2MMPi1TvR9sprQhyrWTgaggI90Lg
	 7djSIfULEVp3h7usXDM+QqUTcmeQ+lAdeqRrGpt8Vmzdj8mbA0U8rF6JpSAmq1h1T3
	 nnihlfEql14fwn37eXyfTTOJ2DoYXuBtfYXaiS+NQjyjeRsbY0KG7/MwCes1CfzD/G
	 dXox7FQCDgHyerjRu19sJQfyJZxfFn8HKp3hnf15QVliyXHra3kZXv6Bogtlw/yxOj
	 HcIJC7GmDS/+hSGgLeAhg9oLENgQIzhqSOB/1VPjNYGGa+YzDDYvxr3Hcik+1ARBSQ
	 1/T8BsKVY9h0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/7] drm/bridge: analogix_dp: Return bitmask from
 analogix_dp_get_irq_type()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730032744.381566-3-damon.ding@rock-chips.com>
References: <20260730032744.381566-1-damon.ding@rock-chips.com>
 <20260730032744.381566-3-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 03:41:06 +0000
Message-Id: <20260730034106.77B791F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditional DP register access in hardirq/thread handlers causes=
 bus faults when using GPIO HPD with PM runtime suspended.
--

--- Patch [2]: [PATCH v1 2/7] drm/bridge: analogix_dp: Return bitmask from =
analogix_dp_get_irq_type() ---
commit 23b7b1cae6716042fa037a50c31f18ad40263d93
Author: Damon Ding <damon.ding@rock-chips.com>

drm/bridge: analogix_dp: Return bitmask from analogix_dp_get_irq_type()

This commit converts analogix_dp_get_irq_type() to return a bitmask of pend=
ing
interrupt flags instead of just the first matched flag. It also updates the
handlers to check for a non-zero return value instead of DP_IRQ_TYPE_UNKNOW=
N.

> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 1c98f92e001d8..ccb8a374b40b7 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -708,10 +708,10 @@ static irqreturn_t analogix_dp_hardirq(int irq, voi=
d *arg)
>  {
[ ... ]
>  	irq_type =3D analogix_dp_get_irq_type(dp);
> -	if (irq_type !=3D DP_IRQ_TYPE_UNKNOWN) {
> +	if (irq_type) {
>  		analogix_dp_mute_hpd_interrupt(dp);

[Severity: High]
Could this unconditional call to analogix_dp_mute_hpd_interrupt() cause a
regression (bus fault) when using GPIO HPD while the device is PM runtime
suspended?

Since an earlier patch in this series moved enable_irq() to
analogix_dp_bind() without keeping the device PM resumed for GPIO HPD
configurations, a GPIO interrupt can fire while the DP controller is suspen=
ded.

If that happens, analogix_dp_mute_hpd_interrupt() will directly read/write
MMIO registers (like ANALOGIX_DP_COMMON_INT_MASK_4) on an unclocked or
powered-off hardware block.

>  		ret =3D IRQ_WAKE_THREAD;
>  	}
[ ... ]
> @@ -722,7 +722,7 @@ static irqreturn_t analogix_dp_hardirq(int irq, void =
*arg)
>  static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
>  {
[ ... ]
> -	if (irq_type !=3D DP_IRQ_TYPE_UNKNOWN) {
> +	if (irq_type) {
>  		analogix_dp_clear_hotplug_interrupts(dp);
>  		analogix_dp_unmute_hpd_interrupt(dp);

[Severity: High]
Similarly, could these function calls cause a regression for the same reason
if called during a GPIO HPD event while PM runtime suspended?

>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730032744.3815=
66-1-damon.ding@rock-chips.com?part=3D2

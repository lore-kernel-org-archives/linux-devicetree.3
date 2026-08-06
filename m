Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61CE3446CB
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 17:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786037378; cv=none; b=qnXfh5BfQ8h79bKfa8s2gMyUB8iq24PjUtexOHxhuKn928RbfHIGpn8L3/eeITuD/8HaDPphFz4jNnJMbBIi48YmCZwZEjZRvJ8xIKOvvws4rS3jDf06Jhi3Ghw2h5la7fmuPWYdzhXRdkoyzlyBJ1XG2uZ3HscrRSxdASjhmyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786037378; c=relaxed/simple;
	bh=W9v4Dk+Ir58pak6oEx16lbQlknkvzn+p1KEffksHyFs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G9xUvOYjEm8CPRWgnSKzsRy7eXzBHejdpuKlK/1sN6uEWIGQnRc22NxMp0rEDU6vxO6NECqjaX1HibgXkI8Nhwmbg2zfSzwCtqxbYbcylq0urHkiXogSXdgu3TQLXQUYtvOD6tOTJNt2pdQ/kDf8nXvcwrOR7dachLeizXGcoJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBFaCwN2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBFaCwN2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A261F000E9;
	Thu,  6 Aug 2026 17:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786037377;
	bh=NfIGvapZmrNP5/iFxVjJchGfYLISDrBmxSv5TDZiUqw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EBFaCwN2NahknnlTfkKKxUCn1AnoU7tVr9/IRR0uYm617vpen6cqdR0rx0Vy/gzy3
	 pupT5FrrN4lo3L0Z0rD6ksBySS2qaSmPmjkczuHRKtyrWIAGsuw1AMLW6hagMMgGmN
	 Fv9kkWCeEY8lLnGAr2PWLyi8rooKDzsle+pPWj1gLD5yOTfTwdoumG4R3WCNh5hFtz
	 hEtBdmnJtLMfuXsst3Zb9yeW7LH1QkeJ/a/Eh5716bwhVHxY/WybTbrkQNVhHvJCsB
	 GuQFD8/rfDSSyMKp8g1+3Fpsz5nEJ/q8MOcjsymfAauPBc0JoBgeYh9WWQuibZKPKK
	 7fHOuJ3me7xew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 03/21] drm/bridge: synopsys: dw-dp: Fix error
 handling for DP link enablement
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-3-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v11-3-0d508505f383@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 17:29:35 +0000
Message-Id: <20260806172936.D0A261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Unconditional call to `drm_dp_link_power_down()` on error path cau=
ses severe stalls when unplugged.

Pre-existing issues:
- [High] Missing `reinit_completion()` in `dw_dp_aux_transfer()` leads to s=
purious AUX timeouts and data corruption.
- [High] TOCTOU race condition between asynchronous HPD worker and non-bloc=
king atomic disable.
--

--- Patch [3]: [PATCH v11 03/21] drm/bridge: synopsys: dw-dp: Fix error han=
dling for DP link enablement ---
commit a255c1363edf851c03c63d0e1832fe5878093ca6
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
drm/bridge: synopsys: dw-dp: Fix error handling for DP link enablement

This commit introduces an enabled state variable in the link structure to
ensure that the link is only disabled if it was properly enabled, preventing
PHY power state mismatches. It also adds missing error handling to
dw_dp_link_enable() to ensure the link enablement is an atomic operation.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index d7945f7fe9f05..21d60e89126f0 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c

[ ... ]

> @@ -1636,10 +1641,22 @@ static int dw_dp_link_enable(struct dw_dp *dp)
> =20
>  	ret =3D drm_dp_link_power_up(&dp->aux, dp->link.revision);
>  	if (ret < 0)
> -		return ret;
> +		goto err_phy_power_off;
> =20
>  	ret =3D dw_dp_link_train(dp);
> +	if (ret < 0)
> +		goto err_link_power_down;
> +
> +	dp->link.enabled =3D true;
> =20
> +	return 0;
> +
> +err_link_power_down:
> +	drm_dp_link_power_down(&dp->aux, dp->link.revision);

[Severity: High]
Can this unconditionally stall the DRM commit worker during a hot-unplug ev=
ent?

If dw_dp_link_enable() fails link training due to the display being unplugg=
ed,
this error path unconditionally executes drm_dp_link_power_down() without
verifying if the hardware is still plugged in.

Because the sink is disconnected, DPCD writes over the AUX channel will
repeatedly time out, stalling the DRM commit worker for hundreds of
milliseconds. The existing cleanup code safely guards this with
if (dw_dp_hpd_detect(dp)), but this new inline error path omits the check.

> +	dw_dp_phy_xmit_enable(dp, 0);
> +
> +err_phy_power_off:
> +	phy_power_off(dp->phy);
>  	return ret;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does dw_dp_aux_transfer() ha=
ve
a missing completion re-initialization that could cause data corruption?

Looking at dw_dp_aux_transfer():

drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_aux_transfer() {
    ...
    status =3D wait_for_completion_timeout(&dp->complete, timeout);
    ...
}

The wait relies on the completion state being clean, but because it is not
re-initialized, a late interrupt from a previous timeout will prematurely
satisfy this wait. This could cause the next transfer to immediately return
without waiting for actual completion, returning stale data or falsely
reporting timeouts.

Should reinit_completion() be called before starting a transfer?

[Severity: High]
This is a pre-existing issue, but is there a TOCTOU race condition between =
the
asynchronous HPD worker and non-blocking atomic disable?

Looking at dw_dp_link_retrain():

drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_link_retrain() {
    ...
    if (!ret)
        ret =3D dw_dp_link_train(dp);
    ...
}

And dw_dp_bridge_atomic_disable():

drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_bridge_atomic_disable() {
    ...
    dw_dp_link_disable(dp);
    ...
}

dw_dp_hpd_work() can trigger a link retrain asynchronously. It checks
dw_dp_needs_link_retrain() without the connection_mutex, then acquires the =
lock
and unconditionally calls dw_dp_link_train().

Since non-blocking atomic commits drop connection_mutex before
dw_dp_bridge_atomic_disable() executes, the HPD worker can run concurrently
with bridge teardown. If atomic_disable powers off the PHY, the HPD worker
could blindly access the powered-down hardware, potentially causing a locku=
p or
crash.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-synopsys-d=
w-dp-improvements-v11-0-0d508505f383@collabora.com?part=3D3

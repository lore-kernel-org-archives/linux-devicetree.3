Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A920A3A9DB6
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 12:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788438228; cv=none; b=peNULepZvCP0vwIKfwnpADxBCfNe+dXCcFjefOoFe7kCzI0AESltntVs4B1HzGySZ6oDAJNMQhRjuJ8JCSYGzXaHxF9clIqPlxRgYDXz0rawnko3T3ltUf/K0NoEMmMJSpxT1Wm0NwBcZ11z2CQpEShu1SNim2w4cwEBn2BQArU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788438228; c=relaxed/simple;
	bh=VwAMRNKdF3xIzlmSmk/IcqcVEhXS3B1a1BjOmjLZEgk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=De414VPbUTqHOaoqkh//QTbxGDNLBDN9FmgjCkfi9SpHrkHVinz7v1nuBOtebVcFP464q1v1QFhrhmjfSNZxyabnBP+gJO5osPrzFZjXXCUyZg2s4CJNBV3/zJP7ItSRWJCDrKqtnwProCvqUPI2nhjchq8Nyu4TzdjEYJ4Ktm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nH+d2edJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nH+d2edJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82EE1F000E9;
	Thu,  3 Sep 2026 12:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788438227;
	bh=NWL31Msd0YqDKWDdkpCgpi42HHmO0U1ISisE6Q3qITc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nH+d2edJOJ+2efzXS9tBlKmcpCx7fpfR16DYSL0w+7VvhF7faSVAypcrBuK5mddHJ
	 xpB6C8nnUE+BOvN6vFqf6YVbtliU06TUsxWcgRUJbylhJQhNPUeeLE7NmQXB/wTzpk
	 Cz7KWWOepONLisaCiT2Tx85z6Fjl3bwxVm+6LtHpnfW5ZLRMC8ADDGBQNZQ97dHmV5
	 Rnf/y6TPFb8r+e3F6FeKJA7w4MI/TdY02lP/Gbmtn3oKo9Z8mQuWYHyWDqP+GutjZp
	 lVQ8hMIGZ1crwBvOJhYb+4mPwZg58AQIh5l6p52hZae875DBPDu/gceXrEAYJPRTJp
	 kIphZ7drlh2Qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/10] drm/tidss: Drop WARN_ON() from
 tidss_runtime_put()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260903-tidss-pre-beagley-v1-9-93928baa8b12@ideasonboard.com>
References: <20260903-tidss-pre-beagley-v1-0-93928baa8b12@ideasonboard.com>
 <20260903-tidss-pre-beagley-v1-9-93928baa8b12@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 12:23:46 +0000
Message-Id: <20260903122346.E82EE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Callers of `tidss_runtime_get()` ignore its return value, proceedi=
ng to access hardware even if the device fails to resume.
- [High] Pending asynchronous suspend is cancelled by `pm_runtime_disable()=
` during device removal, leaving hardware powered on.
--

commit 1177f415f04c015bad856d54b014b7b1a387e7b9
Author: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

drm/tidss: Drop WARN_ON() from tidss_runtime_put()

This commit removes the WARN_ON() check for the return value of
pm_runtime_put_autosuspend() in tidss_runtime_put(). The change is made to
avoid spurious warnings when an OLDI auxiliary device is active, which
legitimately causes the autosuspend to return -EBUSY due to a non-zero
child count.

> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/ti=
dss_drv.c
> index 5cb3e746aeb37..44b0b009c29a9 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -40,10 +40,7 @@ int tidss_runtime_get(struct tidss_device *tidss)
> =20
>  void tidss_runtime_put(struct tidss_device *tidss)
>  {

[Severity: High]
This isn't a bug introduced by this patch, but since we are modifying the PM
handling here, is it safe for callers of tidss_runtime_get() to ignore its
return value?

If pm_runtime_resume_and_get() fails (e.g., due to power domain or clock
issues), the error is ignored, and the driver immediately accesses display
hardware registers which could cause a kernel panic (synchronous external
abort).

For example, in tidss_crtc_atomic_enable():

drivers/gpu/drm/tidss/tidss_crtc.c:tidss_crtc_atomic_enable() {
    ...
    tidss_runtime_get(tidss);

    r =3D dispc_vp_set_clk_rate(tidss->dispc, tcrtc->hw_videoport,
                              mode->crtc_clock * 1000);
    ...
}

The same happens in tidss_atomic_commit_tail() and tidss_crtc_enable_vblank=
().
Should these callers check the return value of tidss_runtime_get() before
proceeding to access hardware?

> -	int r;
> -
> -	r =3D pm_runtime_put_autosuspend(tidss->dev);
> -	WARN_ON(r < 0);
> +	pm_runtime_put_autosuspend(tidss->dev);
>  }

[Severity: High]
This is a pre-existing issue, but does tidss_remove() safely handle the
asynchronous suspend scheduled here?

During module unload, tidss_remove() calls drm_atomic_helper_shutdown(),
which queues an async suspend via tidss_runtime_put(). Immediately after,
it calls pm_runtime_disable():

drivers/gpu/drm/tidss/tidss_drv.c:tidss_remove() {
    ...
    drm_atomic_helper_shutdown(ddev);
    ...
    pm_runtime_dont_use_autosuspend(dev);
    pm_runtime_disable(dev);
    ...
}

Calling pm_runtime_disable() cancels the pending autosuspend timer. Does th=
is
leave the hardware powered on after driver removal, causing a power leak and
leaving the PM core state machine in RPM_ACTIVE?

If the device is left in RPM_ACTIVE, could its parent power domain be pinned
active forever, preventing the entire SoC from entering deep sleep states?

Should this teardown sequence ensure the device is synchronously suspended
before disabling runtime PM?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-tidss-pre-=
beagley-v1-0-93928baa8b12@ideasonboard.com?part=3D9

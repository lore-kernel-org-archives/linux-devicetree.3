Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794633958;
	b=CCFpmLUHqMlJQSnMFB0HfxF5ao1osdk/NzgzUJ5MPfoWv8POTzUciPus4J4EC21ICkwF
	 cQZFVpzL2iPiPrV8yozvNkfm07voxJsc4J42vvpo14yoTvFEiK22orG1OQRR8JE0xiGcN
	 dTxS4EUq1cLeI4bxncXdmX5NJMCjyfpko2WSrdku++fsYohCMV/qK/+slWt8DroddkRFf
	 9Er8BAHRTAuFmOmyWFMUYJv0NCXMYsRKFsarrXH4EhORgWrM7/d4aXWUEQ3Yr52CKB8uc
	 vVlHVVqdiZ79rTCGjKXdtRWBpOYvL4f5a0ZhR5GiQgfB+UeOM+in+W/nO7wz0OLGgCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794633958;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=luTjNUmmW3tuVeZr3g+JBk8K6v1ke+HbANcumBiXx00=;
	b=sLBChgn275j+8Lyb5OJfjKJKJyA/WinQ59sufMgTQ78x34tpx1tUEqxgiFdd+emc3sJU
	 5YMB+ZhsNfEFy6pupEhaF8qT8bOiuexldvPpr08mdgnFhmoNPB+RCO6CS08DZDRYn7Bm9
	 ZoRxkr1ujaWaXgTOkiUBknuqvEkEqukBkpweQ0JvIIYzOYRDOoaVWFF4Jfxds2/i8bIKP
	 Pm4dgxxGhSg7T+hvDkMqnvHoLKkDkFMYgOJ0fvaN1QxvXFq7h3bs2VatcVpGoQcBB5ZkG
	 J/xU7iNYBMwRqyi25D7BtzQGYGxic9EoMpmpY2lCp0strfibjw0uNBArQ09R1DrVZeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=STRTzdeU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DB1606A323
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 05:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=STRTzdeU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D6E1F000C4;
	Sat, 14 Nov 2026 05:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794633958;
	bh=luTjNUmmW3tuVeZr3g+JBk8K6v1ke+HbANcumBiXx00=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=STRTzdeUG2CxWVONaXrYoR7XqfYbNrHAJctjheXSHVBmPCZSQMWy0A0E8dUjtbQOi
	 ryKJlHMnZ8ikwD8JAWw2ebgFBUJ0ASQGmApwWrEBILkvl764bll14PJg+P0fGAPegx
	 ZZqKHgW66y1rKyXJE3aW74PZEqLTfCRzHmFaSzZsZPn60fnsn+q2Eig1nAaMqgUFxk
	 dpkhQCB+Do2RHrDxLrcbGIOayT3hiO1HTiFwq7sAoZJFplFbtgy84nYqyvIYjMYk5d
	 /js110otxNparE/PF8Ll46D+n48OYFRMmNdKs9oTRVI2ZGuuXT65PUqri0To12J408
	 goY4lmLH1Bvhw==
Message-ID: <sashiko-outbox-214174@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 23/23] drm/bridge: synopsys: dw-dp: Retrain on
 hotplug with pre-enabled link
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114-synopsys-dw-dp-improvements-v12-23-d42d3dc5bdd4@collabora.com>
References: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
 <20261114-synopsys-dw-dp-improvements-v12-23-d42d3dc5bdd4@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 05:25:57 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] drm/bridge: dw-dp: dw_dp_hpd_work() retrains link before
  parsing sink DPCD
- [Medium] drm/bridge: dw-dp: unlocked link state check and TOCTOU in
  dw_dp_link_retrain()
--

commit ecb979561e6b36e93516c81e2368f1af68040e73
Author: Yury Smirnov <yurymonzon@gmail.com>

drm/bridge: synopsys: dw-dp: Retrain on hotplug with pre-enabled link

This commit retrains an already-enabled DisplayPort link on a long HPD
pulse when a sink is detected before sending the DRM hotplug event.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index bf3a53463394f..b245d62009139 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -2394,6 +2394,12 @@ static void dw_dp_hpd_work(struct work_struct *wor=
k)
>  				dev_warn(dp->dev, "Retrain link failed\n");
>  		}
>  	} else {
> +		if (dp->link.enabled && dw_dp_hpd_detect(dp)) {
> +			ret =3D dw_dp_link_retrain(dp);
> +			if (ret)
> +				dev_warn(dp->dev, "Retrain link failed\n");
> +		}
> +
>  		drm_helper_hpd_irq_event(dp->bridge.dev);
>  	}
>  }

[Severity: High]
Should dw_dp_link_retrain() run after drm_helper_hpd_irq_event() rather
than before it?

Connector detection in drm_helper_hpd_irq_event() invokes
dw_dp_bridge_detect() -> dw_dp_hpd_detect_link() -> dw_dp_link_parse(),
which calls dw_dp_link_reset() (zeroing link->rate, link->lanes, and
link->caps) and then reads the sink's DPCD capabilities.

If a previous unplug detection failed after dw_dp_link_reset() (for
example, on a DP branch device or USB-C adapter when sink_count dropped to
0 and dw_dp_link_parse() returned -ENODEV), dp->link.rate and
dp->link.lanes are still 0 when the sink is replugged.  Calling
dw_dp_link_retrain() first then runs dw_dp_phy_configure(dp, 0, 0, false),
putting the PHY into P3 powerdown with all lanes disabled and failing link
training before dw_dp_link_parse() has re-read the DPCD.

Even when dp->link was not zeroed, retraining before
drm_helper_hpd_irq_event() trains against stale DPCD capabilities without
transitioning the replugged sink to DP_SET_POWER_D0 via
drm_dp_link_power_up(), and the subsequent dw_dp_link_parse() call in
drm_helper_hpd_irq_event() immediately resets dp->link and overwrites any
downgraded link->rate.

[Severity: Medium]
Can dw_dp_link_retrain() race with a concurrent atomic disable and train a
link whose PHY has already been powered off?

dw_dp_hpd_work() checks dp->link.enabled and dw_dp_link_retrain() checks
dw_dp_needs_link_retrain() before acquiring
dev->mode_config.connection_mutex, and neither is rechecked after acquiring
the lock:

CPU0 (kworker)                    CPU1 (modeset)
dw_dp_hpd_work()
  if (dp->link.enabled && ...)
  dw_dp_link_retrain()
    dw_dp_needs_link_retrain()
                                  dw_dp_bridge_atomic_disable()
                                    dw_dp_link_disable()
                                      dw_dp_phy_xmit_enable(dp, 0)
                                      phy_power_off(dp->phy)
                                      link->enabled =3D false
    drm_modeset_lock(&connection_mutex)
    dw_dp_link_train()
      dw_dp_phy_configure()       <-- configures powered-off PHY

Rechecking dp->link.enabled and dw_dp_needs_link_retrain() after locking
connection_mutex would close this window.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-synopsys-d=
w-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com?part=3D23

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482BA518131
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165856; cv=none; b=SnKjkgEaeBqtJhSTs8rMmpbOI9oYB69SKPPkynufjCWBLvrvFCPZykj8DZ/JPp58fbdyTtbXIZucAwSVH0eKku2jfJQnKzRhlmb/Ffp+qeLEmp7ieopyx7LPOexXQ68YKxVL2cOiDDuGEypkhR43XYlAqwTA95cnEP/38MQUvO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165856; c=relaxed/simple;
	bh=zGIZZVGPBU2YLJRhXTWe0H9hOz0ckgx23kytrXdfZsQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X6OhmlW1V3QUcVkrQX9h6qtpYzzCLd5G4F9md36EzW0Hy/hR5wFZr/MUlHOHi7RzKZ8th8f1QOjWjdlfCf4AbcSuX17aUeJ1tSMxN+mBYNMmvlKWlC6vuAd1qUtqJPVup+rR/zwP9Htod4sGlSAcSfqboym4+9fWurkxOzEkhaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLQzeA/A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mLQzeA/A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C951F00893;
	Wed, 23 Sep 2026 12:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790165846;
	bh=g7VBGEx39WKvW3jzIEaIN3oEndDPWSFC5/+C/Rhqkjk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mLQzeA/AvmJlrW9muM8qcCOllt4izZtC/VHkFp2b3Ov173fGgghbMxjlQLcznN2lo
	 N/1GDWPjwY3hkdT9vuyUMEy725vJr/wJqPOklkheP1tigfp7beJTf1S5enRjaM/wDs
	 r3cK+q7xttcWrultfTk1g2l976B58YHonleDvnTAX+25oLhPtwumo85K9VaaoqeJIf
	 9CSpiwl0AglFGB1mXmIowYSr57qD467mctN5dx1yIonvU0+Z8uHaFq62KLc+u+CIX7
	 LCPXfxcS7/xIsuOEjt3dGQJSl2aIqegd3rI3qWtMH+bDwMIHk4+H8lDYL2YW55xYDw
	 LCDBfupNHrCmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next 03/16] wifi: ath11k: Register root PD rproc
 notifier
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923-ipq5018-qcn6122-mpd-v1-3-86729521a75c@outlook.com>
References: <20260923-ipq5018-qcn6122-mpd-v1-0-86729521a75c@outlook.com>
 <20260923-ipq5018-qcn6122-mpd-v1-3-86729521a75c@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 12:17:26 +0000
Message-Id: <20260923121726.97C951F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ath11k: firmware reset and recovery broken for non-MPD targets
- [High] ath11k: NULL pointer dereference in root PD notifier debug log
--

commit cebde61194c39a9cdbfb9178d0b280c99923a9c0
Author: George Moussalem <george.moussalem@outlook.com>

wifi: ath11k: Register root PD rproc notifier

This commit prepares for multi-PD support by registering the rproc notifier
for the Q6 rootPD. It handles booting the root PD and waiting for power-up
notification before proceeding, adding driver-level locking to avoid races.

> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless=
/ath/ath11k/ahb.c
> index 27d01411b6e9c..86723a2eb3d26 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c

[ ... ]

> @@ -408,21 +415,12 @@ static void ath11k_ahb_stop(struct ath11k_base *ab)
> =20
>  static int ath11k_ahb_power_up(struct ath11k_base *ab)
>  {
> -	struct ath11k_ahb *ab_ahb =3D ath11k_ahb_priv(ab);
> -	int ret;
> -
> -	ret =3D rproc_boot(ab_ahb->tgt_rproc);
> -	if (ret)
> -		ath11k_err(ab, "failed to boot the remote processor Q6\n");
> -
> -	return ret;
> +	return 0;
>  }
> =20
>  static void ath11k_ahb_power_down(struct ath11k_base *ab, bool is_suspen=
d)
>  {
> -	struct ath11k_ahb *ab_ahb =3D ath11k_ahb_priv(ab);
> -
> -	rproc_shutdown(ab_ahb->tgt_rproc);
> +	return;
>  }

[Severity: High]
Does making ath11k_ahb_power_up() and ath11k_ahb_power_down() empty stubs
break the firmware recovery mechanisms for non-MPD targets like IPQ8074?

When ath11k_qmi_fwreset_from_cold_boot() or ath11k_core_reset() are called,
they invoke ath11k_hif_power_down() and ath11k_hif_power_up(). If these
hardware operations do nothing, wouldn't the hardware fail to restart
during firmware crash recovery or cold boot calibration, leaving the WiFi
subsystem broken?

[ ... ]

> @@ -832,24 +830,200 @@ static const struct ath11k_hif_ops ath11k_ahb_hif_=
ops_wcn6750 =3D {
>  	.ce_irq_disable =3D ath11k_pci_disable_ce_irqs_except_wake_irq,
>  };
> =20
> +static int ath11k_ahb_root_pd_state_notifier(struct notifier_block *nb,
> +					     const unsigned long event, void *data)
> +{
> +	struct ath11k_ahb_rproc_info *rproc_info =3D
> +		container_of(nb, struct ath11k_ahb_rproc_info, root_pd_nb);
> +
> +	if (event =3D=3D ATH11K_RPROC_AFTER_POWERUP) {
> +		ath11k_dbg(NULL, ATH11K_DBG_AHB, "Root PD is UP\n");

[Severity: High]
Will passing a NULL pointer as the struct ath11k_base *ab argument to
ath11k_dbg() cause a kernel panic?

If debug logging or tracepoints are enabled, it looks like __ath11k_dbg()
will unconditionally dereference ab->dev, which would be triggered
automatically when the root PD powers up.

> +		complete(&rproc_info->rootpd_ready);
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-ipq5018-qc=
n6122-mpd-v1-0-86729521a75c@outlook.com?part=3D3

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA23D49DBA0
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165960; cv=none; b=goiZiCM4iD4mzVJKNvUVIDBzue+7jTRjbWxk+midHMEqHVZA0WJe4+KqRrt3LrGUilBgskz/Py1mWQ9dKAE8VjAursqCdjKZ988sgGXX6n+nT4ZCCL7rknLuVb2hWBEcA5Lh88ROpVOPJvYvfD/2gc0yaJfs9pF8Q0kv1LyIQgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165960; c=relaxed/simple;
	bh=JTHxqkNS9oWH+qaQPiHaURACeLqtW5/iSGcM79LccGk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QJXOeBOviVINSIKG+Ta/RUVXyd6Et6BcAYXJdrr99QY9tkn5u5UHcvKdGwn69KY7eF6jzHaV63u091MFtq/1BLjqJ6ogwMK5JSf7FawhQPB43X6LDdsSyXOmHipmM0j4oZgdJE7T/c7jhwh17HuVufZ01oZAcruLTRtTc91K7qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGpGdDfk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGpGdDfk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0951F000FF;
	Wed, 23 Sep 2026 12:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790165958;
	bh=yjR/SfM9xIPDsJAHoUybd9jYq8x5+rcN2Q8ZfZ/qurw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oGpGdDfkVpFKCA6KjSr8LObjPriHaN02GoOPEOdofpJp9a7j1hCqvAQzMo2mf9H+Q
	 0i2dPxC1kLrraT3cUs12ZKGsPRXqf0xB7eaadYXQ/e5aOp9p1GJZOHzQTuNy5pX12s
	 Fr1xUEmpxAEawNmyX8NT8tSKDuQrHgCzXfir7OPCeAfWraS0X1rimeG9TYR6AhSsdH
	 JerrrQDU19FWs5vvcnX55Z+yFaBsAEx0SikIjhzi5GU10f0XG6Rr8ktophMMCB3xTX
	 vBTE93Zw9aYz5VAQXreySMNW/+7t8apXCHu/k/CNtbJDAXHAW3/vuT/h6BmJcaWyw+
	 lX7gEYg2AY53Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next 07/16] wifi: ath11k: Register userPD interrupts
 and SMEM entries
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923-ipq5018-qcn6122-mpd-v1-7-86729521a75c@outlook.com>
References: <20260923-ipq5018-qcn6122-mpd-v1-0-86729521a75c@outlook.com>
 <20260923-ipq5018-qcn6122-mpd-v1-7-86729521a75c@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 12:19:17 +0000
Message-Id: <20260923121918.2A0951F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] ath11k: resource leak and global state UAF on rproc configure error
- [High] ath11k: uninitialized completion usage and kernel panic when ignor=
ing -ENXIO
- [High] ath11k: Use-After-Free of `ab` due to devm-managed IRQ lifecycle
- [High] ath11k: unbalanced remoteproc power refcounting due to RPROC_RUNNI=
NG bypass
- [Medium] ath11k: race condition accessing uninitialized completions in IR=
Q handler
- [Low] ath11k: spurious error messages printed on non-MPD platforms
--

commit 5d140036183a0669ee53fb034ef758801c8d354d
Author: George Moussalem <george.moussalem@outlook.com>

wifi: ath11k: Register userPD interrupts and SMEM entries

The patch sets up communication between the Q6 and the ath11k driver using
SMEM and IRQs. It manages UserPDs spawning and stopping, introducing
interrupts for spawn, ready, and stop-ack events, and moves RootPD
boot/shutdown to probe/remove.

> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless=
/ath/ath11k/ahb.c
> index 9fe2e112dfb81..25f9a992a7d2f 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
[ ... ]
> @@ -831,6 +847,126 @@ static const struct ath11k_hif_ops ath11k_ahb_hif_o=
ps_wcn6750 =3D {
[ ... ]
> +static int ath11k_ahb_config_userpd_irq(struct ath11k_base *ab)
> +{
> +	struct ath11k_ahb *ab_ahb =3D ath11k_ahb_priv(ab);
> +	char *upd_irq_name;
> +	int userpd_id;
> +	int i, ret;
> +
> +	ab_ahb->spawn_state =3D devm_qcom_smem_state_get(&ab->pdev->dev, "spawn=
",
> +						       &ab_ahb->spawn_bit);
> +	if (IS_ERR(ab_ahb->spawn_state))
> +		return dev_err_probe(&ab->pdev->dev, PTR_ERR(ab_ahb->spawn_state),
> +				     "Failed to acquire spawn state\n");

[Severity: Low]
For standard non-MPD platforms that intentionally lack "spawn" in smem
states, devm_qcom_smem_state_get() will return -EINVAL. Will
dev_err_probe() needlessly print an error message to the system log on
every boot for these hardware configurations?

> +
> +	ab_ahb->stop_state =3D devm_qcom_smem_state_get(&ab->pdev->dev, "stop",
> +						      &ab_ahb->stop_bit);
> +	if (IS_ERR(ab_ahb->stop_state))
> +		return dev_err_probe(&ab->pdev->dev, PTR_ERR(ab_ahb->stop_state),
> +				     "Failed to acquire stop state\n");
> +
> +	mutex_lock(&ath11k_rproc_info_lock);
> +
> +	userpd_id =3D ab_ahb->spawn_bit / 8;
> +	ret =3D ath11k_ahb_init_userpd(ab, userpd_id);
> +	if (ret) {
> +		mutex_unlock(&ath11k_rproc_info_lock);
> +		return ret;
> +	}
> +
> +	mutex_unlock(&ath11k_rproc_info_lock);
> +
> +	for (i =3D 0; i < ATH11K_USERPD_MAX_IRQ; i++) {
> +		ab_ahb->userpd_irq_num[i] =3D platform_get_irq_byname_optional(ab->pde=
v,
> +									     ath11k_userpd_irq[i]);
> +		if (ab_ahb->userpd_irq_num[i] < 0)
> +			return ab_ahb->userpd_irq_num[i];

[Severity: High]
If an IRQ is missing, this returns -ENXIO early. The caller
ath11k_ahb_configure_rproc() explicitly ignores -ENXIO to support non-MPD
platforms, but ath11k_ahb_init_userpd() has already set ab_ahb->userpd_id.
Because we exit early, the completions below are never initialized.

Will this cause a kernel panic when ath11k_ahb_power_up() checks
userpd_id > 0 and attempts to wait on these uninitialized completions?

> +
> +		upd_irq_name =3D devm_kzalloc(&ab->pdev->dev, ATH11K_UPD_IRQ_WRD_LEN,
> +					    GFP_KERNEL);
> +		if (!upd_irq_name)
> +			return -ENOMEM;
> +
> +		scnprintf(upd_irq_name, ATH11K_UPD_IRQ_WRD_LEN, "UserPD%u-%s",
> +			  ab_ahb->userpd_id, ath11k_userpd_irq[i]);
> +		ret =3D devm_request_threaded_irq(&ab->pdev->dev, ab_ahb->userpd_irq_n=
um[i],
> +						NULL, ath11k_userpd_irq_handler,
> +						IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +						upd_irq_name, ab);

[Severity: High]
The IRQs are requested using devm_request_threaded_irq() with 'ab' passed
as the context. Devres IRQ cleanup runs after the remove function finishes.
If probe fails later or the driver is removed, ath11k_ahb_probe()
explicitly frees 'ab' using ath11k_core_free(ab). Does this create a
window where the IRQs are still active while the 'ab' context has been
freed, leading to a use-after-free if an interrupt fires?

[Severity: Medium]
Since the interrupts are enabled in this loop before the completions
(userpd_spawned, etc.) are initialized below, could a pending interrupt
fire immediately and cause the IRQ handler to access uninitialized
completions?

> +		if (ret)
> +			return dev_err_probe(&ab->pdev->dev, ret,
> +					     "Request %s irq failed: %d\n",
> +					     ath11k_userpd_irq[i], ret);
> +	}
> +
> +	init_completion(&ab_ahb->userpd_spawned);
> +	init_completion(&ab_ahb->userpd_ready);
> +	init_completion(&ab_ahb->userpd_stopped);
> +
> +	return 0;
> +}
[ ... ]
> @@ -1032,7 +1168,7 @@ static int ath11k_ahb_configure_rproc(struct ath11k=
_base *ab)
[ ... ]
>  	if (g_rproc_info->tgt_rproc->state !=3D RPROC_RUNNING) {
>  		ret =3D ath11k_ahb_boot_root_pd(ab);
>  		if (ret) {
>  			ath11k_err(ab, "failed to boot the remote processor Q6\n");
>  			goto err_unreg_notifier;
>  		}
>  	}
>  	g_rproc_info->root_pd_booted =3D true;
> =20
>  	mutex_unlock(&ath11k_rproc_info_lock);
> =20
> +	/*
> +	 * UserPD interrupts are specific to multi-PD configs/firmware only.
> +	 * If interrupts aren't found, continue execution for non-MPD platforms.
> +	 */
> +	ret =3D ath11k_ahb_config_userpd_irq(ab);
> +	if (ret && ret !=3D -EINVAL && ret !=3D -ENXIO)
> +		return dev_err_probe(&ab->pdev->dev, ret,
> +				     "failed to configure userpd interrupts\n");

[Severity: High]
If ath11k_ahb_config_userpd_irq() returns an error such as -ENOMEM, this
direct return bypasses the err_cleanup_userpd label. Since
ath11k_ahb_init_userpd() already saved the 'ab' pointer into the global
g_rproc_info->userpd[] array, does this leave a dangling pointer in the
global state after the probe fails and 'ab' is explicitly freed?

> +
>  	return 0;
> =20
>  err_unreg_notifier:
>  	ath11k_ahb_unregister_rproc_notifier();
> =20
> -err_put_rproc:
> -	rproc_put(g_rproc_info->tgt_rproc);
> +err_cleanup_userpd:
> +	ath11k_ahb_cleanup_userpd(ab);
> +	if (g_rproc_info && !g_rproc_info->num_userpd) {
> +		rproc_put(g_rproc_info->tgt_rproc);
> +		kfree(g_rproc_info);
> +		g_rproc_info =3D NULL;
> +	}
> +
>  	mutex_unlock(&ath11k_rproc_info_lock);
>  	return ret;
>  }
> @@ -1078,15 +1229,19 @@ static void ath11k_ahb_deconfigure_rproc(struct a=
th11k_base *ab)
> =20
>  	mutex_lock(&ath11k_rproc_info_lock);
> =20
> -	ath11k_ahb_unregister_rproc_notifier();
> +	ath11k_ahb_cleanup_userpd(ab);
> =20
> -	if (g_rproc_info->root_pd_booted &&
> -	    g_rproc_info->tgt_rproc->state =3D=3D RPROC_RUNNING)
> -		rproc_shutdown(g_rproc_info->tgt_rproc);
> +	if (!g_rproc_info->num_userpd) {
> +		ath11k_ahb_unregister_rproc_notifier();
> =20
> -	rproc_put(g_rproc_info->tgt_rproc);
> -	kfree(g_rproc_info);
> -	g_rproc_info =3D NULL;
> +		if (g_rproc_info->root_pd_booted &&
> +		    g_rproc_info->tgt_rproc->state =3D=3D RPROC_RUNNING)
> +			rproc_shutdown(g_rproc_info->tgt_rproc);

[Severity: High]
In ath11k_ahb_configure_rproc(), we bypass calling rproc_boot() if the
remote processor is already running, which means the power refcount is not
incremented. However, during teardown here, we unconditionally call
rproc_shutdown() since root_pd_booted is true. Does this steal a power
reference and prematurely shut down the remote processor for whoever
originally booted it?

> +
> +		rproc_put(g_rproc_info->tgt_rproc);
> +		kfree(g_rproc_info);
> +		g_rproc_info =3D NULL;
> +	}
> =20
>  	mutex_unlock(&ath11k_rproc_info_lock);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-ipq5018-qc=
n6122-mpd-v1-0-86729521a75c@outlook.com?part=3D7

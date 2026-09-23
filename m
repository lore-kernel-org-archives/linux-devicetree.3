Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B4151AEF4
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165847; cv=none; b=n/wscFk7WFMQMOWgYebZZalajfeakajYCfXMLte5sBL/NbNSLTMyIObbDU1yXpzHj2Ftgg5fVp1DBTxZoYKHMjQmc0z78l6YqbYZ76YCDRSYk+2ZJKl4Uv+Tkq6RAEn+Iq8uauPHE7mToAyVMPRer4Ww/VwTP8jOSTxHA6AKInY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165847; c=relaxed/simple;
	bh=ee6oT0KxAilYZ3lmY1RmZg4+d4W3UEQ1OKF6ucFiTZo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oer4/taT8cpBX82or4emjYMa/MHgc6YhTyRgszOZfZ2v5KROPcs2QkWHKw6au+djeQuzmMtwzfXS2PquPFqG3g70VZHBGRXvG3rLhKElTowtyyhmQYHW41YQbDGWJFOPi8yRrbDWEMqfx6ugd8Odx5vcyFqvb6CPDZScQNcGmic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DeLcUH+G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DeLcUH+G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A811F000FF;
	Wed, 23 Sep 2026 12:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790165841;
	bh=fldAq98WeN07WV5IH0AUXVojgXllPbaytsf0PdM4lmY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DeLcUH+GQxggV3ISob1Dwg8UkuSkbXP+rVQUwyOn5HhBEc5KVSK0Q+wdaO12wXh/x
	 9b/w8KVOLDIi/Yrg+L01m2P6O6ox39s4ENpv4zsIw4uEml0Hl2Whcmr1A8Shb0NIwa
	 fAjY49sVCKoFvwqnLfi/AztbgoAZfy6U/k+BeqW43cNWI5gVadqepMoVtJWoXbmPh3
	 LDME0SvlSj0j+6G5qCJWPVDS0bDBYAFfAPkgfFZ6n1TTL/m8c3uiBoBxeZo1o8bxue
	 TBlDCyzTMs8rchXNX2K1v+8by03S2pPGUV3whs9NW/eCcvinKsT94UdMwzWPJ9+P9x
	 jwZdFCIzuT6dw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next 08/16] wifi: ath11k: Power up userPD
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923-ipq5018-qcn6122-mpd-v1-8-86729521a75c@outlook.com>
References: <20260923-ipq5018-qcn6122-mpd-v1-0-86729521a75c@outlook.com>
 <20260923-ipq5018-qcn6122-mpd-v1-8-86729521a75c@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 12:17:20 +0000
Message-Id: <20260923121721.09A811F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] ath11k: hardware power and SMEM state leak on error paths in ath11=
k_ahb_boot_user_pd
- [High] ath11k: missing reinit_completion() in ath11k_ahb_boot_user_pd
- [High] ath11k: NULL pointer dereference in userPD IRQ handler due to late=
 completion init
--

commit 6b777a3c2abf7cc48a88c29957b57c461963887f
Author: George Moussalem <george.moussalem@outlook.com>

wifi: ath11k: Power up userPD
   =20
Set the spawn bit to instruct Q6 to spawn the userPD thread.
Wait for userPD to spawn which is indicated by spawn interrupt. The
ready interrupt is triggered once the userPD is powered up completely.

> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless=
/ath/ath11k/ahb.c
> index 25f9a992a7d2f..2c41cf585d001 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -430,8 +431,63 @@ static void ath11k_ahb_stop(struct ath11k_base *ab)
>  	ath11k_ce_cleanup_pipes(ab);
>  }
> =20
> +static int ath11k_ahb_boot_user_pd(struct ath11k_base *ab)
> +{
> +	struct ath11k_ahb *ab_ahb =3D ath11k_ahb_priv(ab);
> +	unsigned long time_left;
> +	int ret;
> +
> +	if (ab->hw_rev =3D=3D ATH11K_HW_IPQ5018_HW10) {
> +		ret =3D qcom_scm_pas_set_wifi_power_mode(MPD_WCNSS_PAS_ID, true);
> +		if (ret) {
> +			ath11k_err(ab, "failed to power up wifi: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	ret =3D qcom_smem_state_update_bits(ab_ahb->spawn_state, BIT(ab_ahb->sp=
awn_bit),
> +					  BIT(ab_ahb->spawn_bit));
> +	if (ret) {
> +		ath11k_err(ab, "Failed to update spawn state %d\n", ret);
> +		return ret;
> +	}
> +
> +	time_left =3D wait_for_completion_timeout(&ab_ahb->userpd_spawned,
> +						ATH11K_USERPD_SPAWN_TIMEOUT);

[Severity: High]
Does this wait rely on a completion state that might carry over between dri=
ver
recoveries?

If a previous cycle timed out but the interrupt fired later, the completion=
's
done count might be > 0. Should reinit_completion() be called before settin=
g the
SMEM state to prevent false positives?

> +	if (!time_left) {
> +		ath11k_err(ab, "UserPD spawn wait timed out\n");
> +		return -ETIMEDOUT;
> +	}

[Severity: High]
If this times out, should the SMEM spawn bit and Wi-Fi power mode be revert=
ed?

Returning -ETIMEDOUT here without clearing ab_ahb->spawn_bit or calling
qcom_scm_pas_set_wifi_power_mode(MPD_WCNSS_PAS_ID, false) leaves the device
powered on and prevents subsequent recovery attempts from triggering the
edge-based spawn interrupt.

> +
> +	time_left =3D wait_for_completion_timeout(&ab_ahb->userpd_ready,
> +						ATH11K_USERPD_READY_TIMEOUT);
> +	if (!time_left) {
> +		ath11k_err(ab, "UserPD ready wait timed out\n");
> +		return -ETIMEDOUT;
> +	}

[Severity: High]
Similarly, if waiting for userpd_ready times out, should the SMEM spawn bit=
 and
Wi-Fi power mode be cleaned up before returning -ETIMEDOUT?

> +
> +	qcom_smem_state_update_bits(ab_ahb->spawn_state, BIT(ab_ahb->spawn_bit)=
, 0);
> +
> +	ath11k_dbg(ab, ATH11K_DBG_AHB, "UserPD%d is now UP\n", ab_ahb->userpd_i=
d);
> +
> +	return 0;
> +}

[Severity: High]
This isn't a bug introduced by this patch, but does the following pre-exist=
ing
code risk a NULL pointer dereference?

drivers/net/wireless/ath/ath11k/ahb.c:ath11k_ahb_config_userpd_irq() {
	...
	for (i =3D 0; i < ATH11K_USERPD_MAX_IRQ; i++) {
		...
		ret =3D devm_request_threaded_irq(&ab->pdev->dev, ab_ahb->userpd_irq_num[=
i],
						NULL, ath11k_userpd_irq_handler,
						IRQF_TRIGGER_RISING | IRQF_ONESHOT,
						upd_irq_name, ab);
		...
	}

	init_completion(&ab_ahb->userpd_spawned);
	init_completion(&ab_ahb->userpd_ready);
	...
}

If the interrupt fires immediately after registration and before
init_completion() is called, ath11k_userpd_irq_handler() would call complet=
e()
on an uninitialized completion. Since ath11k_ahb is zero-allocated, the
completion's waitqueue list head is NULL, which will crash when complete() =
calls
list_empty().

Should init_completion() be called before registering the IRQ handlers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-ipq5018-qc=
n6122-mpd-v1-0-86729521a75c@outlook.com?part=3D8

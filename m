Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A03414438
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 12:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165716; cv=none; b=d0kBe+IBdiuiW6My2mYMdLJICvL5ZcVsMARauFyZekwXc85r45rTkjAQCGZQP0+ByP5kIBq6WFaVSWTC9qxC3GHZNGs0avU3Az5Vm2m33QTmWyAsyAYOVb3PLq1DssGwCcY/AZt1d8vGbV0RPwilehlom5SOFLJBSIhgUT/txok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165716; c=relaxed/simple;
	bh=eD1qgSiyIv4hLa18RDfqJcAY2LiI/i0b1xjTLOnhlYE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ou4E5pf8HrPmV/mx8SrR1+Tc6jWPGgef4bgDJbxzQ7xayQuKbFg5Dlw9NYEDFjZxc/WJpmoP8jXTECmLFYQbiq6Ogj7vPw814QKOZzTEnVRG6PY3SXYR8juUMt3pwLr3tMngkgZeDMJPyz2XFZ8WkHKMZi68aPNTjkT2N47QO1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FOOC48Ow; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOOC48Ow"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B151F00893;
	Wed, 23 Sep 2026 12:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790165714;
	bh=hN+ZEVVfwH5nWE7NdODRw98Ie7u+A5XHpj5NPW/BmJk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FOOC48Ow+KoJqL/1yQb0I69g2nUgRWiUR4mwhAuox/HzJOKTWm0Oc2P4Z49Ei+rPC
	 vbZpSVELkde2RIznxHS2C0FZ8H6UrxU5U94YWTfasiyooJwHozVRih8VBqTnPOo+fA
	 4kATlxr5+z13eypLnjmpGYCGjcb+pK2qW0R+znG6jViKlBu5mv9SUXEdFq6v1WMN+B
	 idY/jv3H9Y+sVYxuDd4/Lr7wDJwQsKQb6LstLU8DSsywP0n8vIX33N72qAPi4uOdEZ
	 btAwAWeIv6g63Qb9xzd0g0MhU9NtANoOBw8VTIdQbx9tK1qyclvPwREpBi0gpUvxPw
	 E2rLIpnbvcO1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH ath-next 09/16] wifi: ath11k: Power down userPD
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260923-ipq5018-qcn6122-mpd-v1-9-86729521a75c@outlook.com>
References: <20260923-ipq5018-qcn6122-mpd-v1-0-86729521a75c@outlook.com>
 <20260923-ipq5018-qcn6122-mpd-v1-9-86729521a75c@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 12:15:14 +0000
Message-Id: <20260923121514.79B151F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ath11k: missing reinit_completion() in userPD stop path causes w=
ait bypass
--

commit 73c477b3cddbf3388f54a41a69e207ac4f7c0235
Author: George Moussalem <george.moussalem@outlook.com>

wifi: ath11k: Power down userPD

This commit adds logic to stop the userPD by setting a stop bit in SMEM and
waiting for a completion. It also handles an IPQ5018-specific SCM call to
power down the radio.

> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless=
/ath/ath11k/ahb.c
> index 2c41cf585d001..1b9115311beda 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c

[ ... ]

> @@ -491,9 +491,32 @@ static int ath11k_ahb_power_up(struct ath11k_base *a=
b)
>  	return 0;
>  }
> =20
> +static void ath11k_ahb_stop_user_pd(struct ath11k_base *ab)
> +{
> +	struct ath11k_ahb *ab_ahb =3D ath11k_ahb_priv(ab);
> +	unsigned long time_left;
> +
> +	qcom_smem_state_update_bits(ab_ahb->stop_state, BIT(ab_ahb->stop_bit),
> +				    BIT(ab_ahb->stop_bit));
> +
> +	time_left =3D wait_for_completion_timeout(&ab_ahb->userpd_stopped,
> +						ATH11K_USERPD_STOP_TIMEOUT);

[Severity: Medium]
Should ab_ahb->userpd_stopped be reinitialized with reinit_completion()
before setting the stop bit in SMEM?

If a previous firmware stop attempt times out (for example, during a crash
recovery) and a late or spurious stop-ack interrupt arrives afterwards, the
userpd_stopped completion could be left in a signaled state.

On the next power down cycle, wait_for_completion_timeout() would
immediately consume the stale completion and return without actually waiting
for the firmware. This bypass could clear the stop bit prematurely and disr=
upt
the firmware state machine during subsequent error recovery cycles.

> +	if (!time_left)
> +		ath11k_warn(ab, "UserPD stop wait timed out\n");
> +
> +	qcom_smem_state_update_bits(ab_ahb->stop_state, BIT(ab_ahb->stop_bit), =
0);
> +
> +	if (ab->hw_rev =3D=3D ATH11K_HW_IPQ5018_HW10)
> +		qcom_scm_pas_set_wifi_power_mode(MPD_WCNSS_PAS_ID, false);
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-ipq5018-qc=
n6122-mpd-v1-0-86729521a75c@outlook.com?part=3D9

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434399;
	b=NOLVO4Cy9sEuo6FMKsGk8zAjPuPnBGdac4Rfl8qggvSaQE29s236mr0QdVdAlsaHvUNR
	 MH88H57nSc69lK6SDe/rbW2HO0UdWmPpBb7UW62Qy1OBlXwsRGuUUivoUffoS4swKOfPL
	 t3sP61foaRyKbhLcoCkyod4XM+pJauzsvQSmW7wn+glPvHQWMcCVOgF2gzG2R+6XHSMVe
	 ubx/03HI/QoouC/Aon+pxydweVYpgo/P+GAbL8Jx2dmF9W092TekXUFldi03IHbwRg3PG
	 43Mj0gUQL+g6JOR/v9bCzt07QZEFYq3wygkOAWtbeg+QS2Yqv1Z+hTBu3rRXqlv7zQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434399;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cx5LMUurgFb3oAJyDdLOdTXtc0B5hodYupxm7KNfdO0=;
	b=gDYB4u7PcuSxwMRAFLYCxXYnePF6q4+CUtdULdKaQtRASB+wqcuFp1bZy+fwOXut7Vfi
	 SYRISnxaItJAoLXqQqoabqF1xL2yYy1UtvISHtOoyz1z7Y/vuLZSKMIraiGq4d26CjkCH
	 XUQi+l6jIRDtJkBxUfcIJNxqjiob/fIQPSjdBNmDSraNY8nV7JYjXWkFBUww56zRN4KXr
	 Aze3npwa651T3KgkbqlCs1AVUazZPoXS4i+zbJreARDjm2mndm5q94U2Ln9pI8VjGLK8Y
	 2xuo8McftOoCjjIy2PQ0zcz7JkPAAlbnKlU80XgYvsmsKZdsnuwvG0kqqExcC7TkmEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZvW/EZcC";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07A8606A8A5
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 21:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZvW/EZcC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13F951F00A06;
	Wed, 11 Nov 2026 21:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794434399;
	bh=cx5LMUurgFb3oAJyDdLOdTXtc0B5hodYupxm7KNfdO0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZvW/EZcCHBlQtO/sSHzSE3adEOH/Bj741kgiQUuJxHgvJxXgmW4fjDXc8IJZ3kJAm
	 vswQyfCVfEwTGx39RtEx9qskPkPM2nNcaXuLz8PDW7ahuW0LavQlDm7HViDspbN404
	 5apd8ARr9nZGGXXPP6N7TH2RxeMQOIxAFZy2rKjL5oJgGVyAB2uMTkI3gPbEc66ehI
	 hREKG1O5K8eTq4JNds/JX/bpkIswHjAmEeMnhbhU05WPbAI5UJXiO/pxS9kDXfut8D
	 93lhoN2RYGJum6dvHmGkbhVLID2gv+iHQxCAfDHPeTlvCP+hy23P22N9s4ftI/fsuV
	 RaU7yEgvAebCw==
Message-ID: <sashiko-outbox-209729@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 3/6] mmc: core: Add option to keep an eMMC powered
 on at system suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kamal Dasu" <kamal.dasu@broadcom.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261111194426.1652644-4-kamal.dasu@broadcom.com>
References: <20261111194426.1652644-1-kamal.dasu@broadcom.com>
 <20261111194426.1652644-4-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 21:59:58 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] mmc: core: CQE left active in _mmc_suspend() on
  MMC_NO_POWEROFF_SUSPEND
--

commit 719eca51e9b0da2d046fb99b21cbf5ff86d8cbfe
Author: Ulf Hansson <ulf.hansson@oss.qualcomm.com>

mmc: core: Add option to keep an eMMC powered on at system suspend

This commit adds support for keeping an eMMC powered on during system
suspend when MMC_PM_KEEP_POWER is set, introducing MMC_NO_POWEROFF_SUSPEND
to skip power-off and keep the card active on resume.

> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index a02b04938e1a0..c936272bcd813 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
[ ... ]
> @@ -2157,6 +2158,15 @@ static int _mmc_suspend(struct mmc_host *host, enu=
m mmc_poweroff_type pm_type)
>  			goto out;
>  	}
> =20
> +	if (pm_type =3D=3D MMC_NO_POWEROFF_SUSPEND) {
> +		if (host->retune_period) {
> +			mmc_retune_timer_stop(host);
> +			mmc_retune_needed(host);
> +		}
> +		mmc_card_set_suspended(host->card);
> +		goto out;
> +	}

[Severity: Medium]
Can this leave CQE active across suspend when _mmc_flush_cache() returns
without sending a command (for example, when the eMMC cache is disabled)?

The existing _mmc_suspend() paths turn off CQE either by issuing a legacy
command via __mmc_start_request() or by calling mmc_power_off() ->
mmc_set_initial_state().  With MMC_NO_POWEROFF_SUSPEND, if
_mmc_flush_cache() is a no-op, _mmc_suspend() returns with host->cqe_on
still true and CQHCI unhalted.  When the host driver later runs
cqhci_suspend() -> cqhci_deactivate() -> __cqhci_disable(), CQHCI_ENABLE
and host->cqe_on are cleared without calling cqhci_off() or
cq_host->ops->disable(), so later legacy commands and resume paths also
skip host->cqe_ops->cqe_off(host), leaving CQE controller state active and
breaking non-CQE commands after resume.

Should this path call host->cqe_ops->cqe_off(host) when host->cqe_on is
set?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111194426.1652=
644-1-kamal.dasu@broadcom.com?part=3D3

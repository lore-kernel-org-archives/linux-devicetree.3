Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB1A357CEA
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 09:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791536808; cv=none; b=F1iv9jsxNuceNRf+xRGzE5FdufVGRgmAp0JKi4GPKSJmKkjbMOilZ4ksaB7lKWi1o9D2IXJsCfwZnTE4NqYJWYHdh3uqyQ4nmo5IhejSzLnjK8g9oziMHOkt/HQbBqpUDreuoQr/g6CHMUXBVHwl5oxehgeiOgS+kHqa7VJ71g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791536808; c=relaxed/simple;
	bh=HKpXVpszDTaONVATFR40+3E2LVcP8oKE7zWDTK7+j2I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=TUvnxr8ztreM+oRgR+fJyIK5CEtn+YIIUF/HqT28CKyEUgwZbe9lTGF2H7/T9XAny2g+/3ezEsh7HKNZ8IgT7SXvQPMiRAOrCjqVWPydtEamzpZZl09vxU42Yu06FVsJSdnV+cPEopGiQWscQOctmKgKpO/8cvB7J6KjIjzhOgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dSAMb4MS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dSAMb4MS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06B61F00893;
	Fri,  9 Oct 2026 09:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791536795;
	bh=kT65nsPoLJ42ZhCQnQIjtlPcww8t3WU8dDo8b4sMrbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dSAMb4MSvMmUjUHJITN8MSXh20Qm41xmLWneo2ik33PcxnXbiyGy361mt71TQNrSI
	 kGy2ZZglI6IQyrc+YUWrNdSO0OyNpTrZ/VyVa57SrenYmLv8AeP3QiLIgavNbZg1l5
	 Ag60Cs3NFDdfvCDlTSrra4SAUjnIXw/mDuy1nhZYNzJLhGqPoZjfc52+ysodmh9f0a
	 evRyvMDSecwXrteUoLMfu9+zl1bKtRJecN8Dof19g77hPH1Jp3S4jpuyiaIQ2EzAjD
	 /u0xVaLWYPdQGlOGBCjgLjohHsCLbmFdo+PHFoRkt2HhJUDWDVVb4bSEqb/t+uJPqR
	 TvDqecWOPjCZw==
Message-ID: <sashiko-outbox-165129@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v14 9/9] net: dsa: lan9645x: add port
 statistics
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org
In-Reply-To: <20261008-dsa_lan9645x_switch_driver_base-v14-9-3d2a72661213@microchip.com>
References: <20261008-dsa_lan9645x_switch_driver_base-v14-0-3d2a72661213@microchip.com>
 <20261008-dsa_lan9645x_switch_driver_base-v14-9-3d2a72661213@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 09:06:34 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: dsa: lan9645x: spin_lock deadlock between process context and=
 ndo_get_stats64
--

commit eaa26add9ac1e5f091f43891f8f2f615b10f01f1
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>

net: dsa: lan9645x: add port statistics

This commit adds support for port statistics counters. It handles overflows
in 32-bit hardware registers by maintaining a 64-bit software cache.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_stats.c b/driver=
s/net/dsa/microchip/lan9645x/lan9645x_stats.c
> --- /dev/null
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_stats.c

[ ... ]

> @@ -321,11 +321,11 @@ static void __lan9645x_stats_view_idx_update(struct=
 lan9645x *lan9645x,
>  					     enum lan9645x_view_stat_type vtype,
>  					     int idx)
>  {
>  	struct lan9645x_stats *s =3D lan9645x->stats;
> =20
>  	lockdep_assert_held(&s->hw_lock);
> =20
>  	if (!__lan9645x_stats_view_idx_hw_read(lan9645x, vtype, idx)) {
>  		spin_lock(&s->sw_lock);

[Severity: High]
Can this cause a deadlock? The periodic stats update workqueue and ethtool
queries run in process context and acquire s->sw_lock here without disabling
softirqs. Process-context lock acquisitions must use spin_lock_bh() to
prevent a deadlock if a softirq tries to take the lock on the same CPU.

>  		__lan9645x_stats_view_idx_transfer(lan9645x, vtype, idx);
>  		spin_unlock(&s->sw_lock);
>  	}
>  }

[ ... ]

> @@ -536,11 +536,11 @@ void lan9645x_stats_get_stats64(struct lan9645x *la=
n9645x, int port,
>  				struct rtnl_link_stats64 *stats)
>  {
>  	struct lan9645x_stats *s =3D lan9645x->stats;
>  	u64 *c;
> =20
>  	c =3D lan9645x_stat_counters(lan9645x, LAN9645X_STAT_PORTS, port);
> =20
>  	/* ndo_get_stats64 may run in non-sleepable context (under
>  	 * rcu_read_lock, or with a callers spinlock held as in bonding), so
>  	 * unlike the ethtool paths we must not take the hw_lock mutex or touch
>  	 * hardware here.
>  	 * sw_lock is never taken from softirq/IRQ context by any path, so a
>  	 * plain spin_lock is sufficient, as in ocelot and ksz.
>  	 */
>  	spin_lock(&s->sw_lock);

[Severity: High]
Could this lead to a deadlock on s->sw_lock?

The comment indicates the lock is never taken from softirq/IRQ context, but
ndo_get_stats64 can be called from atomic/softirq context (for example, when
queried by bonding or netfilter).=20

If a softirq fires on the same CPU while the preempted process-context thre=
ad
holds the lock (from __lan9645x_stats_view_idx_update), it will spin forever
trying to acquire s->sw_lock.

> =20
>  	stats->rx_bytes =3D c[SCNT_RX_OCT] + c[SCNT_RX_PMAC_OCT];

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-dsa_lan964=
5x_switch_driver_base-v14-0-3d2a72661213@microchip.com?part=3D9

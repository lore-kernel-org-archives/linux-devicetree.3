Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33312DE70D
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102217; cv=none; b=D4eb2YZFRBGXJ79PSSmzmNIT7nGe3Kh/ioiBefpNX+EGM8w+f6aMX9iepjYYsImrhL62Ac13vT9Kx8G+QBMkoh0oZFqs2IcypEq5zjD7ox07Exf+dcEVA2m4cauf4W0mFIDDsoG+tyEgtJfrAA2MzYCGDZ1QZQjbuW21X4jjuE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102217; c=relaxed/simple;
	bh=BVLwjKQa/u1bYh9jGT9GOzOBvhrL2GVNd6SDnKdhLvA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KrjhZOWQpyY8cwJT44+B4njxkCmHrnSFHQ8v3kIVkK8g1+KZzDkCEK0K595UKkvVmR23oOusJ3he408R+6/y+pGKRfq7Ww8UZNgDDDG/Oia0Sc40ouGHcH7E+746yC3AlUVTjV7eP69EosIwF09wQj8yrTahTbyhlwxkfPceaik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8nGzlUr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8nGzlUr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621571F00899;
	Sat, 30 May 2026 00:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102216;
	bh=hkxBPDvYYRDY0mO11C9rB4GNcNfpuJtKbdU2JiI5A64=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W8nGzlUrHJHYeD3bRR/X6Qb/bXdxmeyqGW1mG9t0rR2ZTEFkPZce66vfgs1yLGxmJ
	 uCMLJy7DFSAoScMeTvBEQhguezAb4nZh0NAGZRijV3+lWztlzaVSfyDwYeSZC0GQAt
	 DtexBpGDX+Zqzo5XVg7Ek4j2uFQeAyrvh46xQg0gQbM3Zu7W7LfpCvtMPKZFv8BW1+
	 aYcJ1ICUnanbd4rTTShOwodh4HtyNVVp1DxwxA4mB2fnGszWCoIl09mjbZJ9EouUSm
	 1agYPWcl9mluvHXu3C8L8mbVLnxQuYVm/o0NvTxy2rSsC/iLYOVKCag+lqG3rDO9Ev
	 d6RKa6K/9kAYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 9/9] net: dsa: lan9645x: add port statistics
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527-dsa_lan9645x_switch_driver_base-v6-9-4d409ae64f3c@microchip.com>
References: <20260527-dsa_lan9645x_switch_driver_base-v6-9-4d409ae64f3c@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:50:16 +0000
Message-Id: <20260530005016.621571F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Update process context `sw_lock` acquisitions to use `spin_lock_bh=
()` to resolve a softirq deadlock.
- [Medium] Remove `tx_drop` from `lan9645x_port_ethtool_stats` to fix stand=
ard uAPI duplication.
--

commit 1372a97790e46033dbc8d913e95a8b88e1650d02
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>
Subject: net: dsa: lan9645x: add port statistics

This commit adds statistics support for port counters on the lan9645x switc=
h.
It introduces a 64-bit software cache to handle 32-bit hardware register
overflows, updating them periodically from a workqueue, and implements both
standard and ethtool statistics callbacks.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_stats.c b/driver=
s/net/dsa/microchip/lan9645x/lan9645x_stats.c
> new file mode 100644
> index 0000000000000..e38f510eb8f66
> --- /dev/null
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_stats.c
[ ... ]
> +static const struct lan9645x_ethtool_stat lan9645x_port_ethtool_stats[] =
=3D {
> +	{ "rx_cat_drop",        SCNT_RX_CAT_DROP },
> +	{ "rx_red_prio_0",      SCNT_RX_RED_PRIO_0 },
[ ... ]
> +	{ "rx_green_prio_6",    SCNT_RX_GREEN_PRIO_6 },
> +	{ "rx_green_prio_7",    SCNT_RX_GREEN_PRIO_7 },
> +	{ "tx_drop",            SCNT_TX_DROP },

[Severity: Medium]
Is this statistic duplicating a standard kernel uAPI?=20

It looks like tx_drop maps to SCNT_TX_DROP, which is already reported via
tx_dropped in the rtnl_link_stats64 struct provided by=20
lan9645x_stats_get_stats64(). The networking guidelines recommend only using
the ethtool -S interface for driver-private statistics that have no standard
representation, to avoid duplicating counters and adding maintenance burden.

> +	{ "tx_yellow_prio_0",   SCNT_TX_YELLOW_PRIO_0 },
> +	{ "tx_yellow_prio_1",   SCNT_TX_YELLOW_PRIO_1 },
[ ... ]
> +void lan9645x_stats_get_ethtool_stats(struct lan9645x *lan9645x, int por=
t,
> +				      u64 *data)
> +{
> +	struct lan9645x_stats *stats =3D lan9645x->stats;
> +	u64 *c;
> +	int i;
> +
> +	c =3D lan9645x_stats_view_idx_update(lan9645x, LAN9645X_STAT_PORTS, por=
t);
> +
> +	spin_lock(&stats->sw_lock);

[Severity: High]
Does this lock acquisition need to disable bottom halves?

Since lan9645x_stats_get_stats64() can be called in softirq context by the
networking core and acquires sw_lock, taking sw_lock here in process context
using a plain spin_lock() could lead to a deadlock. If a softirq interrupts
this thread while the lock is held and attempts to take the same lock, the
system will hang.

Could spin_lock_bh() be used for all process-context sw_lock acquisitions
(such as in the ethtool callbacks and workqueue contexts) to prevent this?

> +	for (i =3D 0; i < ARRAY_SIZE(lan9645x_port_ethtool_stats); i++)
> +		*data++ =3D c[lan9645x_port_ethtool_stats[i].idx];
> +	spin_unlock(&stats->sw_lock);
> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-dsa_lan964=
5x_switch_driver_base-v6-0-4d409ae64f3c@microchip.com?part=3D9

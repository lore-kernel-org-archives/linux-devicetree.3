Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B5F1BD00C
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754617; cv=none; b=pkntGqV/8jOp4E+MtzIzYBfBU+vvjlRz7Q6pkQqfhA2RA0HbJRJ+ploLSThm+M00RaLv/tZbK7V93G6uQ54X+QqxBQi27C0ECJsF3UmssbDOWJAm5whCGgqcIeryfOqFfHkUZ/36KmJ06rsZiDhAXMwLQGbPkBr7cgOkpCaySiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754617; c=relaxed/simple;
	bh=Q5D2qZQI6FML2WjX+fFXrHmuBHbGwmtBKG1RHd3917U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Pg4Av27mKPrZHjwdybM4jubE20QqY5qkWANm5cREmMghHie3MBeiFSrJMjIFV1j+KKFfXTqpOcqhZU9Bjj3glHWk4+ei5Zyeg0cKJFZgd5Lcdvtlzx3UR7ImPB6SCgSxnAme9e1sN+lz/ZzaTLZ1qeJjjUCUHb46hwsJ3B97uIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZQ4zVyB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZQ4zVyB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0CF91F00898;
	Wed, 30 Sep 2026 07:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790754610;
	bh=E5UHGy1dLllCEWn3ECzEBZnl5DUMKLNvdR2pSwWnFnw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YZQ4zVyBMtR5QXUBiEBA+UZB0JR4WF63RYdDR6/o9IhY8/3c7zH189dz1+Pc0kypu
	 pM0f9JZD8xVMCEPOd1JwVcTwRevfG7DAKWEWZeotUjGEjg/MTglpT5108YH4JNUb3z
	 XT6ucGilhW24fdoTlXQOvO3nxti1ury9FOfxvjO1PQa9WbvJzFGivcAJWpMTBbk00O
	 xy/0+nZX+4b7YZfYlqqbF1JwfoetOkWkyvJuNzgS+mmoVRUrGpCxN/ZyyOyHfKV/Db
	 ysyxHWrndPkwyjlRO545DyeHiRbfs0koU36RpQYnIN9hD7t9yOCGD9sCc+G+igjYSN
	 D23BYCKJNNtIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v13 9/9] net: dsa: lan9645x: add port
 statistics
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260929-dsa_lan9645x_switch_driver_base-v13-9-827c2d3617f2@microchip.com>
References: <20260929-dsa_lan9645x_switch_driver_base-v13-0-827c2d3617f2@microchip.com>
 <20260929-dsa_lan9645x_switch_driver_base-v13-9-827c2d3617f2@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 07:50:10 +0000
Message-Id: <20260930075010.A0CF91F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] net: dsa: lan9645x: deadlock due to sw_lock taken in process and s=
oftirq contexts
- [Medium] net: dsa: lan9645x: duplication of queue and standard stats in p=
rivate ethtool -S
--

commit 49afb622c4cdbf51f9a151db3a2117596b256a9a
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>

net: dsa: lan9645x: add port statistics

This commit adds port statistics support for the LAN9645x switch. It
introduces a 64-bit software cache to handle 32-bit hardware counter
overflows via a periodic polling workqueue. It also implements callbacks
for ethtool and netdev statistics to expose these counters to userspace.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_stats.c b/driver=
s/net/dsa/microchip/lan9645x/lan9645x_stats.c
> --- /dev/null
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_stats.c

[ ... ]

> +static const struct lan9645x_ethtool_stat lan9645x_port_ethtool_stats[] =
=3D {
> +	{ "rx_cat_drop",        SCNT_RX_CAT_DROP },
> +	{ "rx_red_prio_0",      SCNT_RX_RED_PRIO_0 },
> +	{ "rx_red_prio_1",      SCNT_RX_RED_PRIO_1 },
> +	{ "rx_red_prio_2",      SCNT_RX_RED_PRIO_2 },

[Severity: Medium]
Should these priority queue counters be exposed through the standard netdev
per-queue statistics interface instead?

Adding hardware counters to the private ethtool -S list when a standard uAPI
already exists (like struct netdev_queue_stats_rx and netdev_queue_stats_tx)
duplicates effort and creates confusion. The tx_drop counter listed further
down in this array also appears to map directly to the standard
rtnl_link_stats64.tx_dropped counter.

[ ... ]

> +static void __lan9645x_stats_view_idx_update(struct lan9645x *lan9645x,
> +					     enum lan9645x_view_stat_type vtype,
> +					     int idx)
> +{
> +	struct lan9645x_stats *s =3D lan9645x->stats;
> +
> +	lockdep_assert_held(&s->hw_lock);
> +
> +	if (!__lan9645x_stats_view_idx_hw_read(lan9645x, vtype, idx)) {
> +		spin_lock(&s->sw_lock);
> +		__lan9645x_stats_view_idx_transfer(lan9645x, vtype, idx);
> +		spin_unlock(&s->sw_lock);
> +	}
> +}

[Severity: High]
Since __lan9645x_stats_view_idx_update is called from a workqueue running in
process context, can this cause a deadlock?

If a softirq interrupts the CPU while this lock is held, and the softirq
attempts to read network statistics via dev_get_stats() to ndo_get_stats64(=
),
it will attempt to acquire sw_lock in lan9645x_stats_get_stats64() and spin
forever. Do these process-context paths need to use spin_lock_bh() instead?

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
> +	for (i =3D 0; i < ARRAY_SIZE(lan9645x_port_ethtool_stats); i++)
> +		*data++ =3D c[lan9645x_port_ethtool_stats[i].idx];
> +	spin_unlock(&stats->sw_lock);
> +}

[Severity: High]
Similarly, since ethtool queries run in process context, does this need
to be spin_lock_bh() to protect against preemption by softirqs that call
lan9645x_stats_get_stats64()?

[ ... ]

> +void lan9645x_stats_get_stats64(struct lan9645x *lan9645x, int port,
> +				struct rtnl_link_stats64 *stats)
> +{
> +	struct lan9645x_stats *s =3D lan9645x->stats;
> +	u64 *c;
> +
> +	c =3D lan9645x_stat_counters(lan9645x, LAN9645X_STAT_PORTS, port);
> +
> +	/* ndo_get_stats64 may run in non-sleepable context (under
> +	 * rcu_read_lock, or with a callers spinlock held as in bonding), so
> +	 * unlike the ethtool paths we must not take the hw_lock mutex or touch
> +	 * hardware here.
> +	 * sw_lock is never taken from softirq/IRQ context by any path, so a
> +	 * plain spin_lock is sufficient, as in ocelot and ksz.
> +	 */
> +	spin_lock(&s->sw_lock);

[Severity: High]
The comment notes that sw_lock is never taken from softirq/IRQ context,
but lan9645x_stats_get_stats64() itself can be called from softirq context.
For example, when traffic control qdiscs or bonding query network statistic=
s.

Is it possible for this to deadlock against the plain spin_lock() calls in
the ethtool and workqueue paths mentioned above?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-dsa_lan964=
5x_switch_driver_base-v13-0-827c2d3617f2@microchip.com?part=3D9

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A133D6CAB
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 07:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780558006; cv=none; b=gm/mBxPBbcWzdk0PoeR4cdcRdjlovjrbcKygGcyX1zU82ldhfQ7OGbIjeQ2iC9KOAWh5VOZNGB1zejGGPxYZokHB1mgfrL0MKl2I188auSnhGe+c90dfKm0qKvxMXliNmijNBwI3yW9NvxHmXUPn10FP0Jqnn+MpX+HjNNSlcM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780558006; c=relaxed/simple;
	bh=wLmKl4PP77ejeaYz1wRwlFr2xWuoFQcB/q6HThgM1X0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bZQbDH7RBS4ZQQkITE/9fAR02Ll6AY/2UtR9QaZTJUYw9pvq54LVnUajw9eJdUOsZOxfWCzRHaT5iUpJXIUdW1HlGUGm2SQW5JT27D0zReF+35g6mKL3KXCbPltuQjr97WZJy1851bxDVkz9EE7N9zFKWsqwPP0CGHzHFuSxmpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FlhGageW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FlhGageW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B771F00893;
	Thu,  4 Jun 2026 07:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780558005;
	bh=9CnImL2c17SmVeaI0fZrLs8/BzS4vLxXmpaRGxHEiaM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FlhGageWRp6EFP/WXrsVXxKWYAVs7QTS1yLiZ0KU1aUoXrH5Esms4RmgFvFfjTyLr
	 Jx/FqmvEfKp06pkfkbxHRAuaxGzlNZqxnlsX17Dkakm4WmUG0N0ksDYmwTckAQTPTt
	 vktikNWXadHpzWmoSsOUXjmFIBiPiZmhpBTNAjQl1tpHtZpfpRkabL+DEN2HtdDxS+
	 B+b1Xe7k5HVuimIuAoejLYjzguTW7bBXrjzx3B6ujh9b1D1NmT4tTthjn+KuAx9Su3
	 B4iWYPWhceTcw+i8nZUsAAE2SycPmJSr54fWHACeEc/0hz/YmscEwBC4XPc9HfK6f1
	 IREKdpbkZrhnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 9/9] net: dsa: lan9645x: add port statistics
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260603-dsa_lan9645x_switch_driver_base-v7-9-b2f90e676707@microchip.com>
References: <20260603-dsa_lan9645x_switch_driver_base-v7-9-b2f90e676707@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 07:26:45 +0000
Message-Id: <20260604072645.88B771F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Deadlock risk due to using plain `spin_lock()` on `sw_lock` in bot=
h process and softirq contexts.
--

commit cc6b09f42ef1f85f9c4a542f2826c373a91c2f46
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>

net: dsa: lan9645x: add port statistics

Add statistics support for the port counters. Chip registers are 32 bit,
so this unit is responsible maintaining a 64bit software cache, and
updating it frequently to handle overflows in hardware.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_stats.c b/driver=
s/net/dsa/microchip/lan9645x/lan9645x_stats.c
> new file mode 100644
> index 0000000000000..e38f510eb8f66
> --- /dev/null
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_stats.c
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

[Severity: High]
Does this code risk a deadlock? This lock is acquired here in process conte=
xt
(the delayed workqueue worker) using a plain spin_lock().

However, lan9645x_stats_get_stats64() is called in atomic context (such as
softirq) and also acquires sw_lock. If a softirq preempts the process-conte=
xt
thread while it holds sw_lock, and the softirq then attempts to read
statistics, the softirq could spin forever trying to acquire the same sw_lo=
ck.

Should the process-context paths use spin_lock_bh() instead to disable
bottom halves and prevent this race?

> +		__lan9645x_stats_view_idx_transfer(lan9645x, vtype, idx);
> +		spin_unlock(&s->sw_lock);
> +	}
> +}
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
Is it possible for a softirq to preempt here as well? Like the update funct=
ion
above, this is in process context and uses a plain spin_lock(), which carri=
es
the same deadlock risk with the atomic context in lan9645x_stats_get_stats6=
4().

The same pattern is repeated across all the other ethtool callbacks in this
file.

> +	for (i =3D 0; i < ARRAY_SIZE(lan9645x_port_ethtool_stats); i++)
> +		*data++ =3D c[lan9645x_port_ethtool_stats[i].idx];
> +	spin_unlock(&stats->sw_lock);
> +}
[ ... ]
> +/* Called in atomic context */
> +void lan9645x_stats_get_stats64(struct lan9645x *lan9645x, int port,
> +				struct rtnl_link_stats64 *stats)
> +{
> +	struct lan9645x_stats *s =3D lan9645x->stats;
> +	u64 *c;
> +
> +	c =3D STAT_COUNTERS(lan9645x, LAN9645X_STAT_PORTS, port);
> +
> +	spin_lock(&s->sw_lock);

[Severity: High]
Could the deadlock mentioned above occur here if the lock is acquired by a
preempting softirq, since this is explicitly called in atomic context?

> +
> +	stats->rx_bytes =3D c[SCNT_RX_OCT] + c[SCNT_RX_PMAC_OCT];

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-dsa_lan964=
5x_switch_driver_base-v7-0-b2f90e676707@microchip.com?part=3D9

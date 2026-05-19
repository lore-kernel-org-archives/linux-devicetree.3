Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A0E4DA537
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 12:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193648; cv=none; b=qbFbIgFKeUhBby7JZ6ZBB2xoF/CvHHkVDjhGmgjxjtjuWgfMLC6XmTEL7E3zAF64NdOxBJyYQG8TOHVPtH+TZmyYkOnvkNL/HzJ839qgJX+AfGjOaJG2PggY3plp/C6rcL7JM+s3L/SulHqLKX3OZNuxaDkl8L6+1RsqfmjJ4CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193648; c=relaxed/simple;
	bh=euMBiIE/55KtTuXxyv1/vYth8GxBlVAV01Guu9xaA3Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EbC6G4Vo79OpgYLhHukAEWbBsPoHY27mG9n2ZrpsCQhbpeHIC7gYSvf+728o/C2hNqY57ZWDRt3Dtxg8xQGiRaaPSOksbNLm+24p4VcUtUkNgDT9eXQBEmqWRebRqh9mBFA9ak7KVtV+PAppbHsQZyGYqWq8+cq2Ck9u/AMsjeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lnAOCEFQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lnAOCEFQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABC98C2BCB3;
	Tue, 19 May 2026 12:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779193647;
	bh=euMBiIE/55KtTuXxyv1/vYth8GxBlVAV01Guu9xaA3Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=lnAOCEFQXR8XDzyaQBNzIFYjGwqwp57NG8yZUvjbtwr8G9lYwEJDhKM6dP4w6xauL
	 jUaFmnTGIe5+qHbNVeEGC2TPs+qj9vwXFdfZwzH0JkGU0+Ko1/Gicijg9vTcdoKKRV
	 7oUVF9+it+x74eKuz/UndiPO1DyN9wMhKeXIGiytAlbPOh93ZZnZtwHn4GcOKgglHw
	 yJt2h1JQPuW24MpLuZ6QZdlbJ5TdnuIambmuE85TU8N9Ng3QPc1Ulh5yG12g9sKcU0
	 o88Gm87kjzfjaRofq8f36rGXxDbn/U2p8WCE6ijxRPunRbTjLp3TDThty7Fxb/HY7O
	 bbDc/a6vkcsEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 9/9] net: dsa: lan9645x: add port statistics
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260518-dsa_lan9645x_switch_driver_base-v5-9-968fbf34ffa3@microchip.com>
References: <20260518-dsa_lan9645x_switch_driver_base-v5-9-968fbf34ffa3@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 12:27:27 +0000
Message-Id: <20260519122727.ABC98C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Deadlock due to `spin_lock()` being used in both process and softi=
rq contexts without disabling bottom halves.
- [Medium] Duplication of standard kernel statistics in the driver-private =
`ethtool -S` interface.
--

commit 59f4819b8342d3e4580ddccbc972e0d8f002441f
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>
Date:   Mon May 18 12:25:04 2026 +0000

net: dsa: lan9645x: add port statistics

This commit adds support for maintaining and updating a 64-bit software
cache of 32-bit hardware port counters. It introduces multiple ethtool
and netlink statistics callbacks to expose these counters.

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
[ ... ]
> +	{ "rx_green_prio_7",    SCNT_RX_GREEN_PRIO_7 },
> +	{ "tx_drop",            SCNT_TX_DROP },

Is it necessary to include tx_drop in the private ethtool strings?

The networking subsystem guidelines indicate that counters with a standard
uAPI should use that standard interface instead of the driver-private ethto=
ol
output. Since tx_drop is already aggregated and exposed via the standard
netlink interface in lan9645x_stats_get_stats64(), could this be removed
from the private stats?

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

Can a deadlock occur here if the CPU is interrupted by a softirq?

The sw_lock is acquired with spin_lock() in process-context functions like
this one (which is called via a periodic workqueue), but it is also acquired
in lan9645x_stats_get_stats64() below:

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

Since lan9645x_stats_get_stats64() can be called from atomic or softirq
context during packet processing, if a softirq interrupts a process holding
the lock on the same CPU, it seems it would spin forever.

Should the process-context paths use spin_lock_bh() instead to prevent this?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518-dsa_lan964=
5x_switch_driver_base-v5-0-968fbf34ffa3@microchip.com?part=3D9

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BCC481FC0
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784040236; cv=none; b=b9t7OaRgv/r0lHbrBOd1LWjbWNbGF+qzIEBlhr3JK/YydX5kf49zZgnVGR4lYHv+uGsRbdBHjutqpSfwINQk9q0gEq18YHEt/91RD5JmGk3xjDoehedIg6OSGSapA/unmQfRvGtZebWeOQuD1eNhLZzXpjbkrQoOJd/VFzd5zac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784040236; c=relaxed/simple;
	bh=dJ+E4oEGf/g0QD73SSPojVhNr3r2wAlJPTLS4v75NO0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=roRbGQeAgawmjGsEnY6hCF5VNNzzUYptCn/yU/p0xHP1xE9PnDmIE/N3h3Y5CokY/mWJBkIFDHS5rba+ijDhLEkQkk+zgnRuLwwdB/pL+XPiBNdGfRDIYLgozlSBW0WUljzZqXdhccx8bt5uvCu4PK0/wuLEZArHV/hiDsAQzZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpJv/DzJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpJv/DzJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55C71F00A3E;
	Tue, 14 Jul 2026 14:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784040227;
	bh=9I+u20s5IjaO8OklKtX9oOw7VV4UFSk7YTAUWXLauZU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mpJv/DzJAZ1/esUeVVqFrCvb5H0Y0lover9VvGISMnk3r9tyMZWeFGoeoueC+MxDj
	 wiNBQOPSZGxOPQMpBwaCt3xDGiPkD2n3wOln9K7mM97hJRp3sNEKfW9yfs3F5Muv4N
	 vhzDnP8o6RYoAKBPpIbdsoSlEkNAoZi+SIoVhZii0oBzVLppWPeZ9nNKJv/d+a8Q8O
	 KMdvIzKuAijMT+ZJwUGHyVmDLgRphsJDqlmJGzkqugJ2mVbKXuZkzfzTzEtbZ5El8M
	 Xb2pbICjp6E3AZOY8QlZWwq2kMhfzHyxCcUrsmssr1WWWSDnTmhpx+qfmA842mke5J
	 HLr6t8FwQleSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v10 9/9] net: dsa: lan9645x: add port
 statistics
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260713-dsa_lan9645x_switch_driver_base-v10-9-a4886a08fb15@microchip.com>
References: <20260713-dsa_lan9645x_switch_driver_base-v10-0-a4886a08fb15@microchip.com>
 <20260713-dsa_lan9645x_switch_driver_base-v10-9-a4886a08fb15@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 14:43:46 +0000
Message-Id: <20260714144346.E55C71F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Process-context functions acquire `sw_lock` using `spin_lock()` in=
stead of `spin_lock_bh()`, risking a deadlock with softirq contexts.
--

--- Patch [9]: [PATCH net-next v10 9/9] net: dsa: lan9645x: add port statis=
tics ---
commit e9223f3e66d6e1a49c762c181b787e9d1d5b11fa
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>

net: dsa: lan9645x: add port statistics

This commit adds support for port statistics counters. It introduces a 64-b=
it
software cache to handle 32-bit hardware register overflows and exposes sta=
ndard
as well as private ethtool statistics.

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
Can a softirq preempt this process context and cause a deadlock?

Since this is called from a delayed workqueue context, it runs with softirqs
enabled. If a network receive softirq fires on the same CPU while this lock
is held, it will call lan9645x_stats_get_stats64(), which attempts to
acquire this same spin_lock, leading to a permanent hang.

Should this and other process-context lock acquisitions use spin_lock_bh()
to prevent softirq preemption?

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
Is this another location where the lock should be taken with spin_lock_bh()?

Ethtool callbacks run in process context and are also vulnerable to the same
softirq preemption race as the workqueue.

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
> +
> +	stats->rx_bytes =3D c[SCNT_RX_OCT] + c[SCNT_RX_PMAC_OCT];

[Severity: High]
This is the softirq-callable path mentioned above that completes the deadlo=
ck
scenario if it preempts the workqueue or ethtool operations holding sw_lock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-dsa_lan964=
5x_switch_driver_base-v10-0-a4886a08fb15@microchip.com?part=3D9

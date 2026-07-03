Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1917388393
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 06:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061203; cv=none; b=GTZ78cuReODC5YXBDmk7y6k48nJAdPUEmM20mUTKgl9peAL5edX0W5C/exfGXocndYZp8LlJrWKMiGDNHMUIauD6tGjbd0QDwkbTDtm4FIZovKl2yBs6qW0jZCrKTjmGVB/XZSbtDtnlGjO924FbW9aCZB+YP4ZBeGMZJGY0Hx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061203; c=relaxed/simple;
	bh=l/RoFV6tiBGBQvdegP1gU8yoo8NcGZVo6iR2wntNxsM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tI0Bh1gBD364aFAVsDJKl5Rgg1Uxb8K6Bx6tv2j2INSOXR37HkqUGvNo09+t0tfeQEskG3xVR0PTSs+BthZMqpuJERHzVKKxRc019DDXsv6Fd8c0eB/dFTzAcRt4s436gwwyWQPqV7f3MADFVzg1CiyuZXYY/d3N7KbVvJ4KolI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nliXxKvq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nliXxKvq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1091F000E9;
	Fri,  3 Jul 2026 06:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783061200;
	bh=JS67qwNWmyeaADcNPb7efkVRJ8FQVYcDdjFDCyR45Mw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nliXxKvqKfSUd+hsAbwSVnUF3y595yHyh1ZKGW9g0xnGChVcs8slZ2xsKYbJg6r2b
	 B0ga2j11xoeRNtIzB5dhy4mu6nukNymNLj08fYZix3Yqn+g0UJYIqI53TA6alVs2p+
	 wWpIIZUYX4b8g2MOpmfjF147e37/aM1QIjlA4dE0O6kIwqwoNSH8AivH1XPcNhGRFe
	 65F3EZIKJPaqukPjpNJjgueZbupEVfzt8tJ1bCN3Ou0xNhZByApgGc9KIsLjiOolLV
	 ivRqot2BtjJ8g02DCo2m3OekslQtZ3BQ7A6E2yYhqcNbTEukTl8esSpOwMtThokx/3
	 jJK7NmfZqBklw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 9/9] net: dsa: lan9645x: add port statistics
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260702-dsa_lan9645x_switch_driver_base-v8-9-90228d8bba58@microchip.com>
References: <20260702-dsa_lan9645x_switch_driver_base-v8-0-90228d8bba58@microchip.com>
 <20260702-dsa_lan9645x_switch_driver_base-v8-9-90228d8bba58@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 06:46:40 +0000
Message-Id: <20260703064640.6D1091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Potential spinlock deadlock due to using `spin_lock()` instead of =
`spin_lock_bh()` in process context, while the same lock is acquired in ato=
mic (softirq) context.
--

commit 38990de22bba61840a039693f5868e79590d8503
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
Can this deadlock if a softirq interrupts the process-context lock holder?

The periodic workqueue (which calls __lan9645x_stats_view_idx_update) and
ethtool callbacks acquire sw_lock using plain spin_lock(). Since plain
spin_lock() does not disable softirqs, the process can be preempted while
holding the lock.

> +		__lan9645x_stats_view_idx_transfer(lan9645x, vtype, idx);
> +		spin_unlock(&s->sw_lock);
> +	}
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
If lan9645x_stats_get_stats64() runs in softirq context as the comment
implies, would it spin forever attempting to acquire sw_lock if it
interrupted the process-context thread holding the same lock?

Should the process-context accessors use spin_lock_bh() instead to prevent
this?

> +
> +	stats->rx_bytes =3D c[SCNT_RX_OCT] + c[SCNT_RX_PMAC_OCT];

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-dsa_lan964=
5x_switch_driver_base-v8-0-90228d8bba58@microchip.com?part=3D9

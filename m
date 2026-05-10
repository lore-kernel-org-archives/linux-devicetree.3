Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99443175A95
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778404258; cv=none; b=Np0xKeBElTo6k9PJlhZj872IyzfFIlRCkjZ3MqQANEGEOar3agIHcHQ/Clpd8qlCJQA3XaG6S4cbViWnXUr74WWqIK3ZzDV6rAbkf8QBBDaKCGMIf9mj/lAjZIiQwZnP2j1YRQ0LZZfnzmu908k+OUaNJLku2OBg7Q1vQpThb/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778404258; c=relaxed/simple;
	bh=z3Oi3IQsvBWthRbv2Hmln74to7IRd5XStLa/H0pFmBU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nXmcPoq1Uj/6VmefrASNCIB5YKloIEunBfjkvBqF/FEhLufOsuDHtPv1c1GjxVeJkbde2cMHAAkEaW6XPz7thhkD+0gPLRSsQVVl8Fjo5eO+F1LvhIjP7ppjvd3kZQCoALSw6zvteR/+QKuzTxl6f8bhDAm2Nr31WxYLKR32+fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezW3gcY+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezW3gcY+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C9DC2BCB8;
	Sun, 10 May 2026 09:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778404258;
	bh=z3Oi3IQsvBWthRbv2Hmln74to7IRd5XStLa/H0pFmBU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ezW3gcY+eooOf/uyMNoYQDVNLRBCX/A37X1Us4gPeYeVTA5f/XFqtndFkFRS7rdhD
	 gCejJy2BNoxgbHLrMggtewm/RfwdUtSxMUnvJh/tTGQ/2iKOzADF7Eei5IjNiEriYU
	 GNrH2KPR+a8B3IpV7+IZsR0xR9K2UKDbvp6vvgVzYmg/oRzcKO1Ub9LcDBNclT7Tvz
	 c+oiXVmeIl5TasKnI1ZliAOd2M6AVinzpD++VNW23+eYNnO08lh164gzcJMOfUT13l
	 SGjYodX2M79HsAnMbUsxPfBtOluVHK2BHkUhB+zNPV3LWsQsLAbEdhlUG17O5hPWtB
	 3Py/MYoBLEyIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 4/4] net: dsa: hms: Add ethtool statistics
 support
Reply-To: sashiko@lists.linux.dev
To: "Minghuan Lian" <minghuan.lian@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260509090632.2959553-5-minghuan.lian@nxp.com>
References: <20260509090632.2959553-5-minghuan.lian@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 May 2026 09:10:57 +0000
Message-Id: <20260510091058.35C9DC2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Stack-allocated buffers are passed directly to SPI transfer functi=
ons, violating DMA memory safety rules.
- [High] 64-bit statistic values and 32-bit SPI command headers are exchang=
ed with the hardware without byte-order conversion.
- [Medium] The driver adds driver-private ethtool -S strings for standard d=
evice statistics, violating networking subsystem guidelines.
--

commit 61954301ddb9081ce56697d8d4fd8e465791f9ac
Author: Minghuan Lian <minghuan.lian@nxp.com>

net: dsa: hms: Add ethtool statistics support
   =20
Add ethtool statistics support for the HMS switch. This provides
per-port statistics including RX/TX counters, error counters, and
per-queue statistics retrieved from the RT1180 MCU via SPI.

> diff --git a/drivers/net/dsa/hms/hms_ethtool.c b/drivers/net/dsa/hms/hms_=
ethtool.c
> new file mode 100644
> index 0000000000000..00c8406b12862
> --- /dev/null
> +++ b/drivers/net/dsa/hms/hms_ethtool.c

[ ... ]

> +static const char hms_stat_name[][ETH_GSTRING_LEN] =3D {
> +	/* RX stats */
> +	[HMS_STAT_RX_BYTES] =3D "in-bytes",
> +	[HMS_STAT_RX_VALID_BYTES] =3D "in-valid-bytes",
> +	[HMS_STAT_RX_PAUSE_FRAMES] =3D "in-pause-frames",
> +	[HMS_STAT_RX_VALID_FRAMES] =3D "in-valid-frames",

[ ... ]

Does this add driver-private ethtool strings for standard device statistics=
?=20

The networking subsystem guidelines specify that driver patches must not add
new counters to ethtool -S for values that have a standard uapi. Standard
statistics like in-bytes, in-pause-frames, and per-queue frames should be
exposed using standardized interfaces such as ndo_get_stats64, the ethtool
pause api, or standard netlink per-queue statistics. Duplicating these in
private string lists bypasses standard tooling.

Could these standard metrics be migrated to the appropriate uapi?

[ ... ]

> +void hms_get_ethtool_stats(struct dsa_switch *ds, int port, u64 *data)
> +{
> +	struct hms_private *priv =3D ds->priv;
> +	struct hms_cmd_port_ethtool_stats stats;
> +	int rc;
> +	enum hms_stat_index i;
> +
> +	rc =3D hms_xfer_get_cmd(priv, HMS_CMD_PORT_ETHTOOL_STATS_GET,
> +			      port, &stats, sizeof(stats));

Is it safe to pass a stack-allocated buffer (stats) to the spi transfer
functions?=20

If the underlying spi layer maps this buffer for dma and vmap stacks
are enabled, stack addresses are not physically contiguous and will cause
the underlying dma_map_single() to fail or panic. Even without vmap stacks,
unaligned stack buffers risk memory corruption of adjacent variables due to
dma cache invalidation.

Should this buffer be dynamically allocated using kzalloc() instead?

> +
> +	if (rc) {
> +		memset(data, 0, sizeof(u64) * HMS_STAT_NUM);
> +		dev_err(ds->dev, "Failed to get port %d stats\n", port);
> +		return;
> +	}
> +
> +	for (i =3D 0; i < HMS_STAT_NUM; i++)
> +		data[i] =3D stats.values[i];
> +}

Does this code need byte-order conversion?

Since the statistics are retrieved from the hardware over a spi byte stream,
reading directly into host-order u64 values means the transmission byte
order depends on the cpu architecture's endianness. If the host cpu has a
different endianness than the switch mcu, the multi-byte values will be
mangled.

Could this struct use explicit __le64 or __be64 types and apply the
corresponding conversions like le64_to_cpu()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509090632.2959=
553-1-minghuan.lian@nxp.com?part=3D4

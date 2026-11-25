Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795605153;
	b=ABY+8bnqlY1fBi83ag03z3gnaCTLkGrImoEHx6PXDHzvz44iwcC+4NQlC7b/hPs8N51H
	 KV/W4Qpg+NoBv60Y2NZ5qZFSNlyWwT8/eyOurGdRkhTJoE0DOulJi2pKhvf0TwWFwZhrx
	 sdrluRprLsdP39JS+3PHVPjEpqfi7D6WXJGDzq89ooQlO+vthIYhqfJ60pqPA9IePal0h
	 Io/QM0H+CcaKSraPcT7MP/6B2RZe/Cvsg+sXM6WI6jI+wbTS/0ISrAiqEByWvF/1LchIX
	 bnYXjYzxIoDop56MsRbQFfSpNruj6HTRRCSBrsVAKc8pj6Bogbpt97Bu+FUeXlAEeoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605153;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=LVAsmRwZ6M2malgzEx4DCiTdzZMSawSt/82vnilVuWM=;
	b=Q80zvXdOB6Nr2LrA4S9BUV0IFX1ensAKQHYBF/k4aH2lwsAXG2L1J/JM88IomSkiqb93
	 J3eD7Otf3upghopVzsVghaDr/5gSxz/vIs1ho0ixKipy+dfvyMmKaxBW01SuGlPcEdbHq
	 fjGwiQyWYVkPR10Ipj67M93PJ4TCwaENrbXF/eIa/9Cikxt05W8R8kqi8E2+avrfHFLGY
	 fBm25qfQDO6YqBBghvtzFmoEtT0yM8L+FhI5IN+Yp0J8DZY79f899hHIqqJPmGGSvLLgw
	 pAi3Vy7khesqcBnzKsf/1wHnOsVZyzVY/XRIw30xuYYZh8Ubf3gQEoZfFvhszkGxI3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=IVSV43UG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDB5606A31E;
	Wed, 25 Nov 2026 11:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FDB5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=IVSV43UG
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 63C1F200509;
	Wed, 25 Nov 2026 12:12:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795605150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LVAsmRwZ6M2malgzEx4DCiTdzZMSawSt/82vnilVuWM=;
	b=IVSV43UGI43urhjyuTUPZILDFAkhJdQQTe8xTQZeNyWb86462fCd/1DQPqdtCxsVgrykqE
	jcupCQSZEWUcf4FDzG+36JUn9lAWpqON7ThtHtXyqUwWAkEKebjLRZIESkgyrmG7T0HOxu
	EoCf8ynpcRcrNLPJ8qnXbYQTkIxKDsnAOFijAaLqJwXdISCQXBXHPHIMtQ1z7khDobAsKq
	uEKY8Gv27RPjpf54eKos9mdw6780ShMex7O7NGbC+4A+x/1NUMwkJORniofjmORAEEyYk6
	CEElvQ7zULeYFgZ/mxW0bjcBJ1dQ01ulvTx94XDQuZu8j6EispmrfHc5mzKAhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795605150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LVAsmRwZ6M2malgzEx4DCiTdzZMSawSt/82vnilVuWM=;
	b=cwQ3ZXqKVqMRGDf5AI5VB2edG/PbtnX1G+ez5N/VZVViI6MCdkoXrEU6ru8clCHiQwKHcm
	IWaKQg/p1ZjXOQVRMWGtsPm+nkMc9KkEZVW7eJnRbRiXb6Rv6+0G2AFrIH5ZoL9oZvYS8w
	ktXkPzPF0Rhx3WKl6t/xXAehZy/Fj2woPk1RD8fmj245EJFGK9SoevG3c4AT9cYih1b3LT
	tuY5u9+B4NA/5DcseS23sGk8Mjm/whx+YAxeKQxK+vQ3wZ7aW+dnkxO6XEZRZeKZCOjK3g
	sYPgyANYGCWV17j2L/Emr9+A3SiHK4Z93bZS2W4xby7G7uAnZB0w/rNY4/LAtQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795605150; a=rsa-sha256;
	cv=none;
	b=SJqm0oVCCoKkqeYc7gi9o2x0oaj6U1nGssZFvRdyrvqMnEs0HVj6JBaBVkq0Fp+SsEGinC
	sRxqW6AOyZq4+ue5pAFZoVQ3bCr3KpCYaH7/GNcb+Q+o96fAd4u7EpBqgT+X8qrHeeK26T
	1JjfZcVG0yUR4jaQcaitbDMxUEY9g2A50Yft2wvOwgLLs9RKACZHIZwhAIm+9+Q39cwAOF
	YAv3/qEMuFfD3Qi8hMvb1xLe0flLtaQ6kj+Y9ylxTAc0zjaEq0exep2KbN0wL/1hc65530
	HMKO9NonIXHLOIMEMXPUxaCz8pQ6n1vSnXIx2P8Gmb5N6eaZObqLFzBVUBNMNg==
Message-ID: <ef5dea6e69e0947489f4825540d0f77903960f78.camel@pengutronix.de>
Subject: Re: [PATCH net-next v2 2/3] net: cortina: Add CS7542 CPU network
 datapath
From: Philipp Zabel <p.zabel@pengutronix.de>
To: filipp.dunsky@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, Russell King
	 <linux@armlinux.org.uk>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 25 Nov 2026 12:12:30 +0100
In-Reply-To: <20261125-b4-cs7542-ethernet-v2-2-d0ea3c6eb375@gmail.com>
References: <20261125-b4-cs7542-ethernet-v2-0-d0ea3c6eb375@gmail.com>
	 <20261125-b4-cs7542-ethernet-v2-2-d0ea3c6eb375@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mi, 2026-11-25 at 13:36 +0300, Fil Dunsky via B4 Relay wrote:
> From: Fil Dunsky <filipp.dunsky@gmail.com>
>=20
> Add the three-GMAC CS7542 CPU network datapath with phylink, per-port
> NAPI RX and a shared coherent TX ring. Support scatter-gather TX and
> multi-buffer RX while validating DMA addresses and ring ownership.
> Use the normal NAPI weight and the supported external-DDR QM/TM setup.
>=20
> Bound indirect initialization and require confirmed complete-domain
> reset before freeing active DMA mappings. Pin mappings and context when
> reset fails. Keep resource publication and shared-ring timer cancellation
> under the TX lock so completions cannot wake a closing or failed port.
> Use shared ndo_open cleanup labels and let the compiler inline MMIO
> helpers when appropriate.
>=20
> Acquire NI, FE, TM, SCH, QM, DMA and NI-XRAM controls exclusively from
> the global provider. Assert and verify all seven without rolling back
> protective assertions; preserve the first error and retain all active
> DMA allocations on any failure. Deassert in reverse order. The shared
> DMA control covers both LSO and SSP. Require the verified 64 MiB no-map
> queue-manager reservation on the supported DDR layout.
>=20
> Serialize read-modify-write accesses to NI registers shared by the MACs.
> Abort initialization on the first scheduler command error before the
> network engine can publish DMA buffers.
>=20
> Resolve NVMEM MAC deferral before installing hardware cleanup, when no
> reset or DMA state needs unwinding. Register the plain managed cleanup
> action immediately before the first reset attempt, preserving protective
> cleanup for that attempt and all later failures. Propagate a later
> -EPROBE_DEFER instead of silently generating a random address.
>=20
> Count RX fragments independently of whether the frame is deliverable.
> Start with a masked NAPI poll to service previously queued RX descriptors=
.
> Keep TX completion reaping available while closed ports still own queued
> mappings; never release descriptors whose hardware ownership remains set.
>=20
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
> ---
>  drivers/net/ethernet/cortina/Kconfig         |   14 +
>  drivers/net/ethernet/cortina/Makefile        |    3 +
>  drivers/net/ethernet/cortina/cs752x_fe.c     |  477 +++++++
>  drivers/net/ethernet/cortina/cs752x_ne.c     | 1869 ++++++++++++++++++++=
++++++
>  drivers/net/ethernet/cortina/cs752x_ne.h     |   13 +
>  drivers/net/ethernet/cortina/cs752x_sch_tm.c |  687 ++++++++++
>  6 files changed, 3063 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/cortina/Kconfig b/drivers/net/ethernet/=
cortina/Kconfig
> index aaf9e294b..52c0683be 100644
> --- a/drivers/net/ethernet/cortina/Kconfig
> +++ b/drivers/net/ethernet/cortina/Kconfig
> @@ -20,4 +20,18 @@ config GEMINI_ETHERNET
>  	help
>  	  This driver supports StorLink SL351x (Gemini) dual Gigabit Ethernet.
> =20
> +config CS7542_ETHERNET
> +	tristate "Cortina CS7542 network engine"
> +	depends on OF && OF_RESERVED_MEM && HAS_IOMEM
> +	select PHYLINK
> +	select MFD_SYSCON
> +	select RESET_CONTROLLER

Drop, this driver does not register a reset controller.

[...]
> diff --git a/drivers/net/ethernet/cortina/cs752x_ne.c b/drivers/net/ether=
net/cortina/cs752x_ne.c
> new file mode 100644
> index 000000000..081b42079
> --- /dev/null
> +++ b/drivers/net/ethernet/cortina/cs752x_ne.c
> @@ -0,0 +1,1869 @@
[...]
> +#define CS_NE_NUM_RESETS 7
> +static const char * const cs_ne_reset_names[CS_NE_NUM_RESETS] =3D {
> +	"ni", "fe", "tm", "sch", "qm", "dma", "xram",
> +};
> +
> +struct cs_ne {
> +	struct device *dev;
> +	/* Shared NI registers contain fields belonging to several MACs. */
> +	spinlock_t ni_lock;
> +	struct regmap *global;
> +	struct reset_control_bulk_data resets[CS_NE_NUM_RESETS];
[...]
> +/*
> + * Try every protective assert and check every line, retaining the first=
 error.
> + * Bulk assert must not be used here: its rollback deasserts earlier lin=
es.

Why is this an issue?

> + */
> +static int cs_ne_assert_resets(struct cs_ne *ne)
> +{
> +	int first =3D 0, ret, i;
> +
> +	for (i =3D 0; i < CS_NE_NUM_RESETS; i++) {
> +		ret =3D reset_control_assert(ne->resets[i].rstc);
> +		if (ret && !first)
> +			first =3D ret;
> +	}
> +	for (i =3D 0; i < CS_NE_NUM_RESETS; i++) {
> +		ret =3D reset_control_status(ne->resets[i].rstc);

Why is this needed?

The reset controller driver already polls the global reset register for
the "asserted" state in cs7542_reset_update(). If this returns 0, the
corresponding assert above should already have returned -ETIMEDOUT.

> +		if (ret !=3D 1 && !first)
> +			first =3D ret < 0 ? ret : -EIO;
> +	}
> +	return first;
> +}
> +
> +static int cs_ne_deassert_resets(struct cs_ne *ne)
> +{
> +	int ret, i;
> +
> +	/* Reverse the consumer's assert order, as the bulk API would. */
> +	for (i =3D CS_NE_NUM_RESETS - 1; i >=3D 0; i--) {
> +		ret =3D reset_control_deassert(ne->resets[i].rstc);
> +		if (ret)
> +			return ret;
> +	}
> +	for (i =3D 0; i < CS_NE_NUM_RESETS; i++) {
> +		ret =3D reset_control_status(ne->resets[i].rstc);

Same as above. The reset controller driver should guarantee that the
deasserted resets are actually deasserted at this point.

[...]
> +static int cs_ne_probe(struct platform_device *pdev)
> +{
[...]
> +	for (i =3D 0; i < CS_NE_NUM_RESETS; i++)
> +		ne->resets[i].id =3D cs_ne_reset_names[i];
> +	ret =3D devm_reset_control_bulk_get_exclusive(dev, CS_NE_NUM_RESETS, ne=
->resets);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "exclusive engine resets\n");
[...]
> +
> +	ret =3D cs_ne_assert_resets(ne);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "assert engine reset\n");
> +	/* Reset pulse width, not an inferred DMA idle condition. */

What does this mean?

> +	usleep_range(100, 200);
> +	ret =3D cs_ne_deassert_resets(ne);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "release engine reset\n");

regards
Philipp

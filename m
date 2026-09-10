Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537E6499F34
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 17:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061517; cv=none; b=j544f06NOQaHx9RpZtgMb1y1rOidnp+msv9FxXcuqzoh5XtaLfOIQYm1p0Hskg4xE7OtMZSi/HHygY5t7Ja4ea16keGGpWWdgDDBB08gMuNQPXeNDAK2obwLsKENZvjPz+9EbPHwVwJL9Cr9Sm8Rj0MY/rH6wN5IhTkHYbwnJhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061517; c=relaxed/simple;
	bh=oN4nBF0rp9EwyB6m4JP7sVx0M9wrmqgNR1yXMabiahY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WNpWPFr6z5feuSq4NPihFwqy09dN5LZHh0TQ3cNCe6oWY07I893EwTVcHjgip00/kcKF/VkpOVwEf+vk0KgztFwmF5Ei1VbZE0I6riEI99NYXwMExsVqKx24VQx8VJrbgI/XnSsT4HKPzFrv08908hwJJ+vAX5FV/vb+/Hodj5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nPQgPwNq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nPQgPwNq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51DD01F0089B;
	Thu, 10 Sep 2026 17:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789061505;
	bh=UDdU26dlv5IB0ELFFaM0jSGMHjFD5bDBPKKCWwUB6wo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nPQgPwNq6ULP9NGRrOEaYFkbVT22FGAzoHVcz8psmNjop3RbIWmRyiLx9w1ozCr9o
	 R9KikAIvsOCEFh46sQKlyVJiHbo/nNDM0NXa1F53P/i3aZGYu8qjNr2OuQOLN18rWX
	 i8S5J18ziPilBWYoqL35lCDSClRXC4R/tc3p6wKd2DEtNz+Vvx276yzXxqJl9B8J+t
	 gsfMfuLlkkBKfl1JynVaBp769njxfBckUhKBcnHWtZAB6bJkI0fP1hVF6CznlAO2BZ
	 SEgfYFWvfWYE9rdEDXMWzkDB3LuCkxvg8JhNFYF1V3ubiBo51uMihIZ8UevpNVEGVw
	 arS0396cFzjDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 07/10] net: ethernet: ravb: Add callback for
 gPTP probe
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260909173027.2201560-8-niklas.soderlund+renesas@ragnatech.se>
References: <20260909173027.2201560-1-niklas.soderlund+renesas@ragnatech.se>
 <20260909173027.2201560-8-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 17:31:44 +0000
Message-Id: <20260910173145.51DD01F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] PTP clock leak on ravb_open error path for Gen3/Gen4 hardware.
--

commit 934b0b048427cb972701430838997a53612ec30f
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

net: ethernet: ravb: Add callback for gPTP probe

This commit introduces a new probe callback for gPTP to handle differing
hardware generation requirements. It migrates the GTI computation into these
callbacks and prepares the driver for Gen4 support.

> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ether=
net/renesas/ravb_main.c
> index 9e9b1c4fbe956..1092e8ada188b 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c

[ ... ]

> @@ -2704,6 +2705,7 @@ static int ravb_gen3_ptp_set_config_mode(struct net=
_device *ndev)
>  }
> =20
>  static const struct ravb_gptp_info ravb_gen3_ptp_info =3D {
> +	.probe =3D ravb_gen2_ptp_probe,
>  	.set_config_mode =3D ravb_gen3_ptp_set_config_mode,
>  	.ndev_open =3D ravb_ptp_init,
>  	.ndev_close =3D ravb_ptp_stop,

[Severity: Medium]
Does this setup leak the PTP clock struct on the ravb_open() error path for
Gen3/Gen4 hardware?

If a failure occurs during ravb_open() (for example, if ravb_phy_start()
fails), the error path calls ravb_stop_dma(ndev):

drivers/net/ethernet/renesas/ravb_main.c:ravb_open() {
    ...
out_ptp_stop:
    ravb_stop_dma(ndev);
out_free_irq:
    ...
}

Since ravb_stop_dma() relies on info->ptp->dmac_stop being set to stop the
PTP clock, it skips the teardown for Gen3 because ravb_gen3_ptp_info uses
.ndev_close instead of .dmac_stop.

Because .ndev_close is never invoked on this error path, is the ptp_clock
registered via ravb_ptp_init() left dangling when the interface fails to
open?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909173027.2201=
560-1-niklas.soderlund+renesas@ragnatech.se?part=3D7

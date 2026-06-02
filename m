Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D903191D0
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 16:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780416463; cv=none; b=RSweD/7RPjtdHoxBN+fV93s1AoVqGJJVg6FSm8sSqwSz5Ply2GPW3C1bncTQ2TfW3estcPAn1OXceatev1PYnbsYp86o/mQn5asm5m2Bv0bY/xF2qnOUkcgDVQU+wQK7UADiYtCyRGDMc3y3m9/0W/S9oGc02ALS7q2ynJRf4OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780416463; c=relaxed/simple;
	bh=ntAhRvG3Gp4tV4huVVbtnkxfG+aJzqzjFTuasyDAsZc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FpiRIL6bDmeP9vSF487yoTcoFE/UbO1gBo5dSG2WhVk6nD4K2fkAkLtbni+ep6ArzfJfJ/EKXp0CrhO2YWHfqxHskwLcxV8TNyAr/64N9ixvxPuA6xQlF0JuxC93PsrRuMXCuM7AhncE/WqPg17icfs4GusCHs2O3JlILDLjOyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBgPckQF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBgPckQF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E27D1F00893;
	Tue,  2 Jun 2026 16:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780416461;
	bh=fePFFKqlKEgOnoKoBdx5c03ySeO9cFptckODkOOynww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jBgPckQFAaqy9leZoMjaEZdR37tW8Rp5fOvnAx2KkOv6BXS4ZunLILqu5labC51ze
	 ra1tk7lQQ5NCxaJSVOSHXF5+ugf1LpGn2XFs03wvTCSVgy0CMReTbnmL/yEyujAXEc
	 yJmhltOKTr/LMxAjmJbxkNqh+U8p6h9I2gd0zcJhqCI6rn2ENb7pTRFGMLpA1cny+y
	 PnMlALAGQISgk6xS3eTvxgQ3iqC2gtk0UqFcZ6bOdYlNATkj/OqH5t7xK6KMe6o5au
	 d/eE3LEYCqbIDRDYa4HNKeo/EG++P5q+/xc2nObfkeyXPg8BcC6nCktEY2FIPs5spe
	 6x/xtYnSrn8rw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v3 1/2] net: ethernet: oa_tc6: Interrupt is active
 low, level triggered.
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal via B4 Relay" <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260601-level-trigger-v3-1-da73e7010532@onsemi.com>
References: <20260601-level-trigger-v3-1-da73e7010532@onsemi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 16:07:41 +0000
Message-Id: <20260602160741.7E27D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] IRQ storm and starvation caused by level-triggered interrupt witho=
ut IRQF_ONESHOT or manual masking.
--

commit 3908a29ac2b1392995dbf0f4228af86bbddb0261
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

net: ethernet: oa_tc6: Interrupt is active low, level triggered.

According OPEN Alliance 10BASET1x MAC-PHY Serial Interface
specification, interrupt is active low, level triggered.

> diff --git a/drivers/net/ethernet/oa_tc6.c b/drivers/net/ethernet/oa_tc6.c
> index 91a906a7918a2..667faf1554053 100644
> --- a/drivers/net/ethernet/oa_tc6.c
> +++ b/drivers/net/ethernet/oa_tc6.c
> @@ -1323,7 +1323,7 @@ struct oa_tc6 *oa_tc6_init(struct spi_device *spi, =
struct net_device *netdev)
>  	sched_set_fifo(tc6->spi_thread);
> =20
>  	ret =3D devm_request_irq(&tc6->spi->dev, tc6->spi->irq, oa_tc6_macphy_i=
sr,
> -			       IRQF_TRIGGER_FALLING, dev_name(&tc6->spi->dev),
> +			       IRQF_TRIGGER_LOW, dev_name(&tc6->spi->dev),
>  			       tc6);

[Severity: High]
Does changing this to a level-triggered interrupt cause an IRQ storm?

Looking at the primary hardirq handler:

drivers/net/ethernet/oa_tc6.c:oa_tc6_macphy_isr() {
    ...
    tc6->int_flag =3D true;
    wake_up_interruptible(&tc6->spi_wq);
    return IRQ_HANDLED;
}

Since the handler returns IRQ_HANDLED without clearing the hardware conditi=
on
on the device, the IRQ core will immediately unmask the line. Because the
MAC-PHY is still holding the line low (waiting for the SPI kthread to run a=
nd
clear it), the interrupt will instantly re-trigger.

Could this starve the awakened spi_wq kthread and lead to a CPU lockup or t=
he
kernel permanently disabling the interrupt line? Should this use a threaded
IRQ with IRQF_ONESHOT, or explicitly disable the IRQ in the handler until t=
he
kthread completes the SPI transfer?

>  	if (ret) {
>  		dev_err(&tc6->spi->dev, "Failed to request macphy isr %d\n",

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-level-trig=
ger-v3-0-da73e7010532@onsemi.com?part=3D1

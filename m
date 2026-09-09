Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004E73D667F
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 07:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938997; cv=none; b=jy/T2hHPyGhybD9Elk0/RC3R+f5CJxb5AwtjfoZqZYi2dDhAGa0pXXyV3M+HCwugroRlJCeH4MI4aHphYauakMdYM3It+3CV75LFy0xIUL6iCARdSgnDczyO+bkwjhz1HptbBfwfr1QkMNbawpi0+W0q6PdUCcNWr8YckJ+axbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938997; c=relaxed/simple;
	bh=dtAx6caQBTbN8etd0VWb3meyZwZTd9UnP0nrnqplqTg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pYU+Ze2hchD9Hwer+8AlmXLxsXhKGaSo8w+f6XMn3nzt8kOaGPiDThXH/RTzPuJ5T1dVSLCeh1ADC/s5arxCj5MbwZn4sBc9sN+PMGZuy9JmC25nuVFerG3uXt2y5/xzVRXBgWXsbghDSfBYz0UBgbynrD8fCsfO30U93DwiE/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9+5bWTs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9+5bWTs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8AA1F00A3E;
	Wed,  9 Sep 2026 07:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788938995;
	bh=45POvm/xGmY6HmQV7NWUMyX9lspv7lDIZNtcY3R3jzU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b9+5bWTs4ZSnnCINgeTJmWW4qVU+vXyzDr+83nJ5Br7/IV/lSSb4JZe/c9PeuI65Q
	 wO+mMHXsANCy7RpEvPMAZbThvSyXIWjs0EkUOddautU2skbLCUdbYL4Nx0RsM6PGmL
	 HuA0LfqYpCN8YvjCyj5SWXpWGysI8bGRoai+sUqpg0xz54ZuoNi2vmjziMMLZF9YTC
	 ci9DHR3kKk2e+iGehEbkJbbBCf0QYAMtPKlTh5a50siUxsT4+fm3jcK6UmTst24GWM
	 J3bVmOJzd/8OfkkUdtpngvYi56USf/CK30N5v0iv5GNtOf4jaZJF8TcOWMUlu6Y9mM
	 O7sPdef0fTQtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] i3c: master: amd: Add hot-join support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shubham Patil" <shubhamsanjay.patil@amd.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260909071340.3649271-4-shubhamsanjay.patil@amd.com>
References: <20260909071340.3649271-1-shubhamsanjay.patil@amd.com>
 <20260909071340.3649271-4-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 07:29:54 +0000
Message-Id: <20260909072955.3D8AA1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver fails to clear `XI3C_CR_HJ_MASK` and `XI3C_CR_IBI_MASK`=
 from the Core Control Register (`XI3C_CR_OFFSET`) during controller initia=
lization. When the controller is subsequently enabled, any previously set b=
its (e.g., from a warm boot, kexec, or bootloader) remain active. This caus=
es the controller to silently ACK hot-join or IBI requests on the bus witho=
ut generating interrupts (since `XI3C_INTR_RE_OFFSET` is zeroed), irrevocab=
ly stalling bus enumeration.
--

commit 2fc8cea47a914e1d8d7312826561a084f785d035
Author: Shubham Patil <shubhamsanjay.patil@amd.com>
Subject: i3c: master: amd: Add hot-join support

This commit adds hot-join support for the AMD AXI I3C master controller.
It introduces sysfs-based configuration and handles events via the i3c core
hot-join queue to run DAA for enumerating new devices.

> diff --git a/drivers/i3c/master/amd-i3c-master.c b/drivers/i3c/master/amd=
-i3c-master.c
> index a50445530a430..400bf15e02992 100644
> --- a/drivers/i3c/master/amd-i3c-master.c
> +++ b/drivers/i3c/master/amd-i3c-master.c

[ ... ]

> @@ -1244,13 +1250,14 @@ static void xi3c_master_bus_cleanup(struct i3c_ma=
ster_controller *m)
>  	struct xi3c_master *master =3D to_xi3c_master(m);
> =20
>  	/*
> -	 * Disarm all interrupt sources and the IBI ACK so the controller can't
> -	 * assert once disabled; reset the refcount that tracks them.
> +	 * Disarm the interrupts and the IBI/Hot-Join ACKs so nothing is left
> +	 * armed for a later bus_init(); reset the refcount that tracks them.
>  	 */
>  	scoped_guard(spinlock_irqsave, &master->reg_lock) {
>  		iowrite32(0, master->membase + XI3C_INTR_RE_OFFSET);
>  		iowrite32(ioread32(master->membase + XI3C_CR_OFFSET) &
> -			  ~XI3C_CR_IBI_MASK, master->membase + XI3C_CR_OFFSET);
> +			  ~(XI3C_CR_IBI_MASK | XI3C_CR_HJ_MASK),
> +			  master->membase + XI3C_CR_OFFSET);
>  		master->ibi.enabled_count =3D 0;
>  	}

[Severity: High]
Does xi3c_master_init() also need to clear these masks from XI3C_CR_OFFSET =
to
guarantee a clean state before enabling the controller?

If the controller is enabled after a warm boot or kexec where a bootloader
left the Hot-Join bit active, the driver currently fails to clear it in
xi3c_master_init():

drivers/i3c/master/amd-i3c-master.c:xi3c_master_init() {
	/* Mask all interrupt sources and clear any stale latched events. */
	iowrite32(0, master->membase + XI3C_INTR_RE_OFFSET);
	iowrite32(ioread32(master->membase + XI3C_INTR_STATUS_OFFSET),
		  master->membase + XI3C_INTR_STATUS_OFFSET);

	/* Reset fifos */
	xi3c_master_reset_fifos(master);

	/* Enable controller */
	xi3c_master_enable(master);
}

Since XI3C_INTR_RE_OFFSET is zeroed but the Hot-Join ACK bit might remain
active in XI3C_CR_OFFSET, could the controller silently ACK hot-join reques=
ts
without generating CPU interrupts, permanently stalling bus enumeration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909071340.3649=
271-1-shubhamsanjay.patil@amd.com?part=3D3

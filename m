Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9434C3D994
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102130; cv=none; b=s+TPf3tloDpQKz4dHMs12q2Jb+rFyXtj+zsr4auYD+jHC5eRBi9sR4Aoq14iiYr89jw2pf+h/iPyV8LwljaO8EFFr45z11NZvtzJD6UPuG6YTiYuP6CZgi6ol9JayDWyW4SBoRo/6ElSQpJSKfKuqNiVAwK2WGeIVwI9811BZeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102130; c=relaxed/simple;
	bh=/G7nLaPUTUpynImrFIvMfvefWE7FUeHQHvCZEPuvbck=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LCeAvnrGJpTwnnyKmGWg9FTkaoIdqjxoiM4ZKsecIefJxlOQPwmIyQZuziYgF5GCVeY941pb2JiP9iy2dOYXT5e7aTJxkXWJMKtopgrm3j+OQ82KSoupEFvzVooE85wKMUV43ICrsA48CB7HPVzeVdU8icWb24Ljstk73KTOxWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5h9JE9q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5h9JE9q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4317A1F00898;
	Sat, 30 May 2026 00:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102129;
	bh=dcrtoJz/DW+5bb4+NZ+5BogZ5j5ZHzA5VRYWhGINCK0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m5h9JE9qTptUBrN2MDX6Vtn/cT2Jup5zLXqxf4VZMd+K8Kua0aC5LNqLF7NjuN30G
	 IzHOiBlyx7oVF242C9WChB7hCVvyaRQNE2zsC5bRoMymiKpmhfWV3f4R2itdeVInQX
	 C+oZ170e4OE+X2wFNxYwO08nZDcnVgDts+6gZtxVuS8OsC8QaWZNH1ho9bpcAUN3Jr
	 RcNkNrAu96pp3ocSH9GFcnW/uFwYdyl0ehqHqVMHJeE1SV36PxLFBWHYKtY8LDM0T7
	 sa+B9aozPQ3n+nhbwU7cKs4Jg1QrtmzqOw2Ii+vGo84jj0w3Fggzntb5E7EfcgrGwa
	 +ZUbI6v+IAzlA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 5/6] net: phy: Introduce Airoha AN8801R
 Gigabit Ethernet PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260526-add-airoha-an8801-support-v5-5-01aea8dee69b@collabora.com>
References: <20260526-add-airoha-an8801-support-v5-5-01aea8dee69b@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:48:48 +0000
Message-Id: <20260530004849.4317A1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The PHY interrupt handler unconditionally acknowledges all interru=
pts, leading to lost events and breaking shared IRQ lines.
- [Medium] LED blink duration logic incorrectly caps the period without sca=
ling the ON duration, breaking duty cycles for large periods.
--

commit 32eee39b7254042921bcc2f3287430a78ed383c7
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

net: phy: Introduce Airoha AN8801R Gigabit Ethernet PHY driver

This commit introduces a new PHY driver for the Airoha AN8801R Series Gigab=
it
Ethernet PHY. It adds support for configuring PHY LEDs, link speeds (10/100M
and 1000M), Wake on LAN capabilities, and PHY interrupts.

> diff --git a/drivers/net/phy/air_an8801.c b/drivers/net/phy/air_an8801.c
> new file mode 100644
> index 0000000000000..aa24bb182d645
> --- /dev/null
> +++ b/drivers/net/phy/air_an8801.c
[ ... ]
> +static int an8801r_led_blink_set(struct phy_device *phydev, u8 index,
> +				 unsigned long *delay_on,
> +				 unsigned long *delay_off)
> +{
[ ... ]
> +	if (blink) {
> +		blink_dur =3D (u16)min(hw_delay_on + hw_delay_off,
> +				     LED_BLINK_DUR_MASK);

[Severity: Medium]
Will this distort the duty cycle for large delay values?

If the requested delays are large (e.g., 2000ms ON and 2000ms OFF), both
hw_delay_on and hw_delay_off will evaluate to 61035. The total blink_dur wi=
ll
be capped to 65535, while LED_ON_DUR is programmed with the unscaled
hw_delay_on (61035) below.

This results in the hardware remaining ON for 61035 units and OFF for the
remaining 4500 units, skewing a 50/50 duty cycle into a ~93% ON duty cycle.
When capping the maximum duration, should the ON and OFF periods be scaled
proportionally?

> +		ret =3D phy_write_mmd(phydev, MDIO_MMD_VEND2, LED_BLINK_DUR,
> +				    blink_dur);
> +		if (ret)
> +			goto error;
> +
> +		ret =3D phy_write_mmd(phydev, MDIO_MMD_VEND2, LED_ON_DUR,
> +				    hw_delay_on);
> +		if (ret)
> +			goto error;
> +	}
[ ... ]
> +static irqreturn_t an8801r_handle_interrupt(struct phy_device *phydev)
> +{
> +	u32 irq_status =3D 0;
> +	bool irq_handled =3D false;
> +	int ret;
> +
> +	ret =3D an8801_buckpbus_reg_read(phydev, AN8801_BPBUS_REG_WAKE_IRQ_STS,
> +				       &irq_status);
> +	if (ret)
> +		return IRQ_NONE;
> +
> +	ret =3D an8801r_ack_interrupt(phydev);

[Severity: High]
Is it safe to unconditionally acknowledge interrupts here even if irq_statu=
s is
0?

This unconditionally writes AN8801_IRQ_WAKE_ALL to the status register, whi=
ch
could clear and permanently lose any interrupt that fires between the status
read and this write.

Additionally, if the PHY shares an IRQ line with another device, every
interrupt generated by the other device will cause the PHY to execute a ser=
ies
of expensive MDIO/PBUS writes to reset its wakeup configuration, adding lat=
ency
to the shared IRQ line and momentarily disabling PHY interrupts.

Should this return IRQ_NONE early if irq_status is 0, and only acknowledge =
the
specific bits that were actually read?

> +	if (ret)
> +		return IRQ_NONE;
> +
> +	if (irq_status & AN8801_IRQ_WAKE_MAGICPKT) {
> +		pm_wakeup_event(&phydev->mdio.dev, 0);
> +		irq_handled =3D true;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-add-airoha=
-an8801-support-v5-0-01aea8dee69b@collabora.com?part=3D5

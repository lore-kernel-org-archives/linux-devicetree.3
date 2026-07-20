Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4728E33120A
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784536328; cv=none; b=eR6fss0JDLcgNich7a0+FIH4LCZMIBhdsTXlME6KucL/vZHQ+NyngZntOfkSE5hKSthhUUD9HfDav3dndfkdOi3VSD2RuQbN/ubDSBf0uRqs6od6FBBeCXKk5nNXO7bqO7H18gOZYORehqINqgFjTFD35SDPXX3ux1yx0NWzr7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784536328; c=relaxed/simple;
	bh=r3lum0lvfWZDYJ+jLPVQ96BjFZNoaJ7Mo/VZxPObR4I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rEcf3MHYMRdnYfaNKIs7HPLv/aD95ocMuaNBk4tys+UadeMg37QHoodEFMqd+jPKJOtSoV/ObHDoURqw/lJiE37MJz9rovgkJ5HiD0PwOAgLrsHvfUq7UIcMZPE0YJKjUWEYHKoVkEuqgak/1dnkEW6qxwokjEK29VmZzNo7Zp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7YFk2Dn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7YFk2Dn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC781F000E9;
	Mon, 20 Jul 2026 08:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784536326;
	bh=f1aBns5thNQDzlzgYDmQ38xnRdzsJs4L6/zGxOjXd+Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I7YFk2Dn/wfmIRQvJ91z3nyVcbXiFGHORrrAFnvD8H/+88k3XLhH749qyz4stfO65
	 VIX3+0b76HcO4KQQtnGgzDTP+CfyQRYIw6ci6IRN1BGlvV1ZyqsgFdxh0r29ORc+J1
	 6ib1pcT478DVqyscrKlu+EDHw5TKdN6lzTh0DKNlo6z8DBhwi6ILBACV3NIGFhjQVt
	 VfZxPJ4EITQms3g7+d78Eqhd/d3+XACMW0SaptwADi8trJpnH6Ett8K7b03TMA7udP
	 AwWuFAZ0AQmZMvbAotCp6Rk/7ecHzvhwgKkRAbprQVfzlqbBJ5s+GH5w99BRH39fA/
	 /0j+OreKvgsAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] usb: typec: Add Hynetek HUSB320 Type-C controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyang Zhao" <hongyang.zhao@163.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720-husb320-v1-2-4a1e259d7dc8@163.com>
References: <20260720-husb320-v1-0-4a1e259d7dc8@163.com>
 <20260720-husb320-v1-2-4a1e259d7dc8@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 08:32:05 +0000
Message-Id: <20260720083206.8AC781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Masking interrupt status bits before Write-1-to-Clear (W1C) cleari=
ng causes unhandled or reserved interrupts to remain asserted, leading to a=
n interrupt storm.
- [Medium] The driver incorrectly reports the power role as TYPEC_SOURCE wh=
en connected to a Charge-Through Audio Accessory.
--

--- Patch [2]: [PATCH 2/3] usb: typec: Add Hynetek HUSB320 Type-C controlle=
r driver ---
commit e0d1ae316e83fd4e771770397178a91c9673d5ac
Author: Hongyang Zhao <hongyang.zhao@163.com>

usb: typec: Add Hynetek HUSB320 Type-C controller driver

This commit adds a new USB Type-C controller driver for the Hynetek HUSB320.
The driver implements autonomous Configuration Channel handling, supporting
attach/detach detection, role switching, and accessory modes.

> diff --git a/drivers/usb/typec/husb320.c b/drivers/usb/typec/husb320.c
> new file mode 100644
> index 0000000000000..fd9f949d9b522
> --- /dev/null
> +++ b/drivers/usb/typec/husb320.c

[ ... ]

> +static enum husb320_state husb320_get_state(unsigned int status,
> +					    unsigned int type)
> +{
> +	if (!(status & HUSB320_STATUS_ATTACHED))
> +		return HUSB320_STATE_UNATTACHED;
> +
> +	if (type & HUSB320_TYPE_DEBUG_SOURCE)
> +		return HUSB320_STATE_DEBUG_SOURCE;
> +	if (type & HUSB320_TYPE_DEBUG_SINK)
> +		return HUSB320_STATE_DEBUG_SINK;
> +	if (type & HUSB320_TYPE_SINK)
> +		return HUSB320_STATE_SINK;
> +	if (type & HUSB320_TYPE_SOURCE)
> +		return HUSB320_STATE_SOURCE;
> +	if (type & (HUSB320_TYPE_AUDIO_VBUS | HUSB320_TYPE_AUDIO))
> +		return HUSB320_STATE_AUDIO;

[Severity: Medium]
Does mapping HUSB320_TYPE_AUDIO_VBUS to HUSB320_STATE_AUDIO cause
charge-through accessories to be treated exactly the same as standard audio
accessories?

Since husb320_state_power_role() forces TYPEC_SOURCE for HUSB320_STATE_AUDI=
O,
would this result in incorrectly reporting the host as providing power when
it is actually receiving it?

> +
> +	return HUSB320_STATE_UNATTACHED;
> +}

[ ... ]

> +static irqreturn_t husb320_irq_thread(int irq, void *data)
> +{
> +	struct husb320 *husb =3D data;
> +	unsigned int interrupt;
> +	unsigned int interrupt1;
> +	int disable_ret;
> +	int ret;
> +
> +	mutex_lock(&husb->lock);
> +	if (husb->shutting_down) {
> +		disable_irq_nosync(irq);
> +		mutex_unlock(&husb->lock);
> +		return IRQ_HANDLED;
> +	}
> +
> +	ret =3D regmap_read(husb->regmap, HUSB320_REG_INTERRUPT, &interrupt);
> +	if (ret)
> +		goto err;
> +
> +	ret =3D regmap_read(husb->regmap, HUSB320_REG_INTERRUPT1, &interrupt1);
> +	if (ret)
> +		goto err;
> +
> +	interrupt &=3D HUSB320_INT_VALID;
> +	interrupt1 &=3D HUSB320_INT1_VALID;
> +	if (!interrupt && !interrupt1) {
> +		mutex_unlock(&husb->lock);
> +		return IRQ_NONE;
> +	}
> +
> +	if (interrupt) {
> +		ret =3D regmap_write(husb->regmap, HUSB320_REG_INTERRUPT,
> +				   interrupt);

[Severity: High]
If the hardware asserts a reserved or undocumented interrupt bit, will
masking the interrupt variable against HUSB320_INT_VALID prevent that bit
from being cleared when written back?

Could this cause an unhandled hardware interrupt to remain asserted,
leading to an interrupt storm that eventually forces the kernel to disable
the IRQ line?

> +		if (ret)
> +			goto err;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-husb320-v1=
-0-4a1e259d7dc8@163.com?part=3D2

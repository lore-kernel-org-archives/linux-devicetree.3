Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8538E3C1D48
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787211563; cv=none; b=AGTeR1F0QHq39hBMQKGNwIKhiODKxQlHDXmxamdt7JKuURE4ICwfVEIGCO/VyEtQDBOuIOonFYSLKKl/v8vw0s2XYWN73m8BG3feo+lIAdtnZfzcoGXZcdLHK2Z/SN2L3Pp+h/4J1+ulhyeKYvfROHout8Qoy+4dNyj8eQ5ATzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787211563; c=relaxed/simple;
	bh=1LW3AxEh+quO4cREn1bpVVlDGhj29ten1c6TXknEArc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dhNnYJ11OTbVnoFjpbdfGoga4+M/sCDa9ocqfVwofyhAR0ZhrP8XWmD6CCiwBLjNIWhMmol7TigxrSF7aF3iWsV7TlDFtDuNLrB/r/KBxF0U6pAWUIMlzRgxSvgi3gzjl1WKvj0inMrrlYIGSM8oUod76lPbE4LuyfCBbLGC+GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y37T5bpQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y37T5bpQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909F71F000E9;
	Thu, 20 Aug 2026 07:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787211560;
	bh=RvoEzKoLUx5OLI85rmKNNtmfhWAIgIHybkgd2o1hiW0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y37T5bpQ4CHWdgxnMt8CP8775cZLuf2HrlVvRrr+YSTgUH/UOB12r9xvkI9z6L5kW
	 9MTSvE7myiFJ6rlcc+g8zXDG7PLPLzm3uenAEJN3J5iSI1HvKO1YnzqPVGFHHAb6Hq
	 Omd1ezJ1nC11bKSCuqy9k7E9aBdvkR8gPFywRdt/Kj4XZy/MSkOPsehUtP+7e5Hq7n
	 BtwyjJnqnbj+7W5WuSW2ImuE2Q00YUE5KC7UccTxm8SPUXvkN2UlC5BNV1BEcq9/Wb
	 A0YLtf76hL+1ArRZisXAtWe7Nf0sJ4lZI19fMLyo1y4YeMVfky7OzKFJUrkJuHxxrR
	 Z4R5b1/3XCYaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] gpio: realtek-otto: add pinctrl support
Reply-To: sashiko-reviews@lists.linux.dev
To: misha.zavertkin@mail.ru
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <adce57b3797cae6f6a3486eb1d21c33be61f14dc.1787209558.git.misha.zavertkin@mail.ru>
References: <cover.1787209558.git.misha.zavertkin@mail.ru>
 <adce57b3797cae6f6a3486eb1d21c33be61f14dc.1787209558.git.misha.zavertkin@mail.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 07:39:20 +0000
Message-Id: <20260820073920.909F71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Critical] Unconditionally enabling GPIO_GENERIC_PINCTRL_BACKEND breaks G=
PIO direction configuration on SoCs that do not yet have a pinctrl driver.

Pre-existing issues:
- [High] Silent failure when optional IRQ probe defers.
--

--- Patch [2]: [PATCH v3 2/2] gpio: realtek-otto: add pinctrl support ---
commit c33b7f5187bd7fe916fbf0c1df13da9be88e7f72
Author: misha.zavertkin@mail.ru <misha.zavertkin@mail.ru>

gpio: realtek-otto: add pinctrl support

This patch adds pinctrl backend support to the Realtek Otto GPIO driver.
It utilizes pinctrl to request pins for GPIO on the RTL9607C SoC.

> diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek=
-otto.c
> index 37ef56f453187..b53c2a9a04c76 100644
> --- a/drivers/gpio/gpio-realtek-otto.c
> +++ b/drivers/gpio/gpio-realtek-otto.c
> @@ -394,13 +394,14 @@ static int realtek_gpio_probe(struct platform_devic=
e *pdev)
> =20
>  	raw_spin_lock_init(&ctrl->lock);
> =20
> +	gen_gc_flags =3D GPIO_GENERIC_PINCTRL_BACKEND;
> +

[Severity: Critical]
Does setting GPIO_GENERIC_PINCTRL_BACKEND unconditionally break GPIO
direction configuration on SoCs lacking a pinctrl driver?

Because pinctrl drivers for other SoCs are not yet implemented, setting
this flag forces gpio_mmio_dir_in() and gpio_mmio_dir_out() to route via
pinctrl_gpio_direction_*(). Since no pinctrl driver is registered for those
devices, won't this fail with -EPROBE_DEFER and completely break GPIO
output/input functionality?

>  	if (dev_flags & GPIO_PORTS_REVERSED) {
> -		gen_gc_flags =3D 0;

[ ... ]

[Severity: High]
This is a pre-existing issue, but does the optional irq check silently
discard probe deferrals?

drivers/gpio/gpio-realtek-otto.c:realtek_gpio_probe() {
	...
	irq =3D platform_get_irq_optional(pdev, 0);
	if (!(dev_flags & GPIO_INTERRUPTS_DISABLED) && irq > 0) {
		girq =3D &ctrl->chip.gc.irq;
	...
}

When platform_get_irq_optional() returns -EPROBE_DEFER because the parent
interrupt controller is not yet ready, the irq > 0 check silently discards
the error code. This can lead to the device permanently losing GPIO
interrupt support depending on boot timing.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787209558.gi=
t.misha.zavertkin@mail.ru?part=3D2

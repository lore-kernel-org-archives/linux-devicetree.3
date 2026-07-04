Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53E9357D09
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783151362; cv=none; b=p5VnpM61RNQrR35jgNKypYiCDo0k1i8KV3Tj/hP7BM1GFwAPgqx/4M8+jFklz+aCU6n59U/l2KkgrJTS7OnmVxEQeXKdfDDqp80c/9M7IxZ5u8KKJMaJZtvjiXA7OT32jq9I/MMxUnD62rlt1mS5V7ZSLWyvozURdQIuhiXsl94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783151362; c=relaxed/simple;
	bh=eeAJQtgaqEdc9Yh0apNy5SUm86DKu3J9K38HjtipU6c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kW0/AeVAfp0XKGPvdEy72H8UjnHeLJqwGCLXqiHmOCQJugKiS8CjMgpiq9sMTSvk6rByHH1FJj2ZSLVTjbXGunkbDK1u20uBmbOv+yWithqJOOe48y5wtDZnGF0EIoocRTm9l6bCxXW5kVTO+XSOVH7IRRxLenKLzeYgFggF6Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UiH2Ht1F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UiH2Ht1F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D0471F00A3A;
	Sat,  4 Jul 2026 07:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783151348;
	bh=3xjteroih40a3MfOMXhUMF5dbo99yBBa1fmVNc6A6go=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UiH2Ht1FuWLciuKlQGUrZNotQ7JUh85tgwL5nYQFoK2d8nq28Kt2WWFQ9nLsnHglq
	 nS5jM6vQ9iP6LyTz3T+uwAcbSoS16H0nl9BSlSv6+p7K/msMpeGUFvQV7S8m1puE87
	 4dHI08eHGNGTk0CIkGhJp6rzdJjl8AzDhmJyaI0xIgd8XKJyB46ddLsqTW0Um7359/
	 mPHcbojv7TcAh79WmZsnTUmjf4atWnm+GMTDgmBL0PCZBjPAAosav0re0TF0WPjqF2
	 CP9nEC+ybhAuB5kdfLAjLca0Ssmh9bqYiMVgPsghWxKohElvjGYn1pEKarN5Pd3MJN
	 DOBizT0qvW5+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] phy: cpcap-usb: Prevent line glitches from
 triggering sysrq
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ivaylo Dimitrov" <ivo.g.dimitrov.75@gmail.com>
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org
In-Reply-To: <20260704073843.1750458-2-ivo.g.dimitrov.75@gmail.com>
References: <20260704073843.1750458-1-ivo.g.dimitrov.75@gmail.com>
 <20260704073843.1750458-2-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 07:49:07 +0000
Message-Id: <20260704074908.3D0471F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] The global SysRq support mask is permanently altered if an error o=
ccurs during UART mode configuration.
- [High] Flawed bitwise logic fails to effectively disable SysRq in system =
configurations that use specific feature masks, leaving the system vulnerab=
le to glitches.
- [High] The driver modifies global system configuration to mask a local ha=
rdware glitch, introducing system-wide side effects and race conditions.

Pre-existing issues:
- [High] A Use-After-Free vulnerability exists because devres-managed IRQs =
can queue delayed work on freed memory after `remove()` completes.
- [High] Hardware teardown in `remove()` races with the background worker, =
leading to undefined hardware state.
--

commit d89e10225f70bc2771f7d996decb42920d32fe88
Author: Tony Lindgren <tony@atomide.com>

phy: cpcap-usb: Prevent line glitches from triggering sysrq

This commit attempts to prevent random sysrq events when switching from USB
to debug serial port mode. It temporarily disables sysrq during mode changes
to mask line glitches.

> diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/=
phy-cpcap-usb.c
> --- a/drivers/phy/motorola/phy-cpcap-usb.c
> +++ b/drivers/phy/motorola/phy-cpcap-usb.c

[ ... ]

> @@ -413,7 +414,12 @@ static int cpcap_usb_gpio_set_mode(struct cpcap_phy_=
ddata *ddata,
> =20
>  static int cpcap_usb_set_uart_mode(struct cpcap_phy_ddata *ddata)
>  {
> -	int error;
> +	int sysrq, error;
> +
> +	/* Disable sysrq to prevent random sysrq events on line glitches */
> +	sysrq =3D sysrq_mask();
> +	if (sysrq & 1)
> +		sysrq_toggle_support(sysrq & ~1);

[Severity: High]
Does modifying the global sysrq state here create a race condition?

If an administrator concurrently modifies the sysrq settings via
/proc/sys/kernel/sysrq, will the restoration call at the end of this
function blindly overwrite their new state?

[Severity: High]
Will this correctly disable sysrq if the system is configured with a
specific feature mask?

If the administrator clears the SYSRQ_ENABLE_ALL bit (bit 0) but leaves
other features enabled, sysrq & 1 evaluates to 0, bypassing the disablement.

If bit 0 and other bits are set, sysrq & ~1 disables the 'enable all' flag
but leaves the specific logging/dumping features actively enabled.

[ ... ]

> @@ -448,6 +454,9 @@ static int cpcap_usb_set_uart_mode(struct cpcap_phy_d=
data *ddata)
>  	if (error)
>  		goto out_err;
> =20
> +	if (sysrq & 1)
> +		sysrq_toggle_support(sysrq);
> +
>  	return 0;
> =20
>  out_err:

[Severity: High]
Does this error path permanently alter the sysrq support mask?

If a failure occurs during the GPIO or pinctrl mode configuration, the
function jumps to out_err and bypasses the restoration of the sysrq state.
Could this permanently disable sysrq features system-wide?


[Severity: High]
This is a pre-existing issue, but is there a use-after-free vulnerability
during device teardown?

Looking at cpcap_phy_irq_thread():

drivers/phy/motorola/phy-cpcap-usb.c:cpcap_phy_irq_thread() {
    if (!atomic_read(&ddata->active))
        return IRQ_NONE;
   =20
    schedule_delayed_work(&ddata->detect_work, msecs_to_jiffies(1));
}

And in cpcap_usb_phy_remove(), cancel_delayed_work_sync() is called, but
because devm_request_threaded_irq() is used, the IRQ is freed after
remove() finishes.

If the IRQ thread is preempted immediately after reading ddata->active,
can it resume during free_irq(), and queue detect_work on freed memory
after devres frees ddata?


[Severity: High]
This is a pre-existing issue, but does the hardware teardown in
cpcap_usb_phy_remove() race with the background worker?

Looking at cpcap_usb_phy_remove():

drivers/phy/motorola/phy-cpcap-usb.c:cpcap_usb_phy_remove() {
    cpcap_usb_set_idle_mode(ddata);
    cpcap_usb_try_musb_mailbox(ddata, MUSB_VBUS_OFF);
   =20
    usb_remove_phy(&ddata->phy);
    cancel_delayed_work_sync(&ddata->detect_work);
}

The driver attempts to force an idle state before stopping the background
worker cpcap_usb_detect().

Since the worker thread doesn't check ddata->active, could it concurrently
modify the same regmap registers and pinctrl states, leaving the hardware
in an undefined state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260704073843.1750=
458-1-ivo.g.dimitrov.75@gmail.com?part=3D1

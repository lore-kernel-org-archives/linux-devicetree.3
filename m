Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E536D3CAA52
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 17:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783790074; cv=none; b=sbxdZRV87ekjzIErVtcZsfXKEoI/QLV4M8Yr8NQcVtl4iwHUAKmh6vprbLT98Nce5zWAKHHcdmyrR4ZE4Q64vfyGbPo+Hj7pY3DGmCco/+tss9YXPlniDsTBfo6ezLMV3gpXc7rfz4ImRDM4R/Elop34nsm99O4vdemvEDC9P84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783790074; c=relaxed/simple;
	bh=fV/n2Djoj48Pj22BodXIAAYSOy8lEdhA+K6p4gtHoHc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Sh3/k6etCSy5Nz33DHWmAIqaoymnlIIOK6cv8qVUMJ6OZ68EiqmuBxe+NYkLmrJMhIkQtOfcA/xVQKl+bC5eRdepQZKqkIRsxoPdSNQRXcpuXuiHMJV5gOfQW6tKgKz2ih+xfCkt+i3ZSyWM7UXen4hPx3GwMZt/KZokNoGtE2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxKJN5qB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxKJN5qB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670041F000E9;
	Sat, 11 Jul 2026 17:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783790072;
	bh=hvnalrBrz7i25/1/ePJ4MowKK0ECNIieiQuBXigipO8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cxKJN5qB9qc0seAXVGKftyhVjq8t9PchyYuu4c/VnQ7TEXm6aGqfMbh4l4ef7ve5X
	 wb5XFVgk3HCCu39hRDBgdgdayj9G7t+aLFJuN1kEVcLef0xWo35oNozoAMLt4wRISo
	 tKn4AbTuCwU/6UfJWA7ZvfHrb/WfpHt9VZM99QNCu/3cn63XiRSo721hNYTvFEoDam
	 /ch1f7HlE7Qy1fu8qIXxFSSZeLnSqewlP+duz3DKNfHJ2rTPGiAh9wjYhnRKz/Nmps
	 ygwVR/zfUjc2Zf7laECH3yYUpgdZKg4CstK9a4bxrqeeKWBQssmTkIqBr0sJpJgrRV
	 lqgdsvHo/D6Pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/6] phy: cpcap-usb: add extcon support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ivaylo Dimitrov" <ivo.g.dimitrov.75@gmail.com>
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org, vkoul@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260711164754.185565-5-ivo.g.dimitrov.75@gmail.com>
References: <20260711164754.185565-1-ivo.g.dimitrov.75@gmail.com>
 <20260711164754.185565-5-ivo.g.dimitrov.75@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 17:14:31 +0000
Message-Id: <20260711171432.670041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The ordering of extcon state updates exposes invalid intermediat=
e cable states to userspace.

Pre-existing issues:
- [High] Pre-existing UAF: Delayed work can be re-armed after cancel_delaye=
d_work_sync() during driver removal due to an IRQ thread race.
--

--- Patch [4]: [PATCH v4 4/6] phy: cpcap-usb: add extcon support ---
commit 5fa6aab542d92a2c79fbe5195a861859976507b6
Author: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>

phy: cpcap-usb: add extcon support

This commit registers an Extcon device and reports the detected USB cable
state. It exports this state through the Extcon framework so other drivers
can consume it using standard kernel interfaces.

> diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/=
phy-cpcap-usb.c
> index d4eb8086b6000..8f9bea1d8a212 100644
> --- a/drivers/phy/motorola/phy-cpcap-usb.c
> +++ b/drivers/phy/motorola/phy-cpcap-usb.c
[ ... ]
> @@ -226,6 +239,46 @@ static void cpcap_usb_try_musb_mailbox(struct cpcap_=
phy_ddata *ddata,
>  		__func__, error);
>  }
> =20
> +static void cpcap_usb_set_extcon(struct cpcap_phy_ddata *ddata)
> +{
> +	int cable;
> +
> +	switch (ddata->mode) {
[ ... ]
> +	if (cable =3D=3D ddata->cable)
> +		return;
> +
> +	if (ddata->cable =3D=3D EXTCON_CHG_USB_SDP)
> +		extcon_set_state_sync(ddata->edev, EXTCON_USB, false);
> +	else if (cable =3D=3D EXTCON_CHG_USB_SDP)
> +		extcon_set_state_sync(ddata->edev, EXTCON_USB, true);
> +
> +	if (ddata->cable !=3D EXTCON_NONE)
> +		extcon_set_state_sync(ddata->edev, ddata->cable, false);

[Severity: Medium]
Could this ordering expose invalid intermediate cable states to userspace?

When transitioning to a new cable state (specifically EXTCON_CHG_USB_SDP),
the new state's associated EXTCON_USB state is enabled before the old
ddata->cable state is cleared.

Because extcon_set_state_sync() immediately notifies consumers and emits a
uevent, consumers might briefly observe overlapping, mutually exclusive
states (such as both DCP and SDP active simultaneously).

Would it be safer to completely clear the old states before asserting any
new states?

> +
> +	if (cable !=3D EXTCON_NONE)
> +		extcon_set_state_sync(ddata->edev, cable, true);
> +
> +	ddata->cable =3D cable;
> +}
[ ... ]


[Severity: High]
This is a pre-existing issue, but I noticed a potential use-after-free race
involving the delayed work during driver unbind. Does this execution sequen=
ce
leave the work queued after removal?

If the IRQ thread checks ddata->active and gets preempted before calling
schedule_delayed_work():

cpcap_phy_irq_thread() {
    ...
    if (atomic_read(&ddata->active))
        ... <preempted here> ...

cpcap_usb_phy_remove() can concurrently set active to 0 and call
cancel_delayed_work_sync(). Since the work isn't queued yet, the
cancellation completes immediately:

cpcap_usb_phy_remove() {
    ...
    atomic_set(&ddata->active, 0);
    cancel_delayed_work_sync(&ddata->detect_work);
    ...

During devres cleanup, free_irq() waits for the IRQ thread to finish.
The thread then resumes, unconditionally calls schedule_delayed_work(),
and exits:

        schedule_delayed_work(&ddata->detect_work, msecs_to_jiffies(1));
}

After free_irq() completes, devres frees ddata. The delayed work will
subsequently execute and access the freed memory.

Could this be prevented by disabling IRQs prior to cancelling the work?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711164754.1855=
65-1-ivo.g.dimitrov.75@gmail.com?part=3D4

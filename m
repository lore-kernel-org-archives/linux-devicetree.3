Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8183E121B
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 09:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181510; cv=none; b=hvPGi5UHA/btbovtkMS+3I2EOFT7WSGZwZ9S16M+BmMQKRrCwGg/QDFIt++j1rYjsNCOQnJozTmvy+9D+jfKCrsDlKsrlwElTsPiddH5cI2AYK+ZX/Tm2QyRiqvRL2zQ2Qe0WnG7+1IUSvispK8e+uflf0FOhVy/PmxIpifrYU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181510; c=relaxed/simple;
	bh=XjLALvY9x05Ozo3csRy1Q9YZ9i+/00CZWE0BkpX+jio=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uKwDT4ZT0mPvPeCBPsfvy+1JWzN6yiEVFoxIl6fTDuWi8jNOcRl0+DgD2Nl4fLP/0iGk318+0OoqmNYepSsKAPGHrm05JCuWaco5YXimGtgj9ofIdrA4hkQKNFoMBmHMLoC+su9emUVhzW7sVyVsvXZYEsHTH8ir+zSrX1NVI0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqqDwmD8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hqqDwmD8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE4DC2BCB3;
	Tue, 19 May 2026 09:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779181509;
	bh=XjLALvY9x05Ozo3csRy1Q9YZ9i+/00CZWE0BkpX+jio=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=hqqDwmD8PDfvX9UStu138PWVMuZQXuFXSH91WjthF5SJFyJE7u5JayoBgo/bPYZZ9
	 zQ0cxrAViKKJZMmScx+DVHPXQaO2bb+TsKRLWfPa7Otxewb5fsjP84TeZTDB6S2bZf
	 xYCWuvZThI9MpwjKCMrKOYlVinIiXMsLVaeIx24XoEemAxuz/lXdot7Zwo/B7UoIeu
	 MC0cMh2sgykWZPsOzs4Lau/+heAEkw9Tq4+wcc7QO1/az9vIZsyndVxHAl+ntGg192
	 ZjIDP8Pe1+hJ05IGx/HlfYwO1Htjxyl+eeHi8xBVhFxa5JqQjP/eFZtlkru33gNyNM
	 EXdnMcvIksSHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/8] extcon: qcom-spmi-misc: Add PM8921 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre MINETTE via B4 Relay" <devnull+contact.alex-min.fr@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260519-mainline-send-v1-sending-v3-5-3dd7aa125353@alex-min.fr>
References: <20260519-mainline-send-v1-sending-v3-5-3dd7aa125353@alex-min.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 09:05:08 +0000
Message-Id: <20260519090509.BEE4DC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The driver incorrectly handles negative error codes from platform_=
get_irq_byname_optional(), breaking -EPROBE_DEFER for the IRQs.
- [High] An early return during ID IRQ state reading causes VBUS state chan=
ges to be permanently lost.
--

commit 6e0b86ed0580b2ce5f0ed399603c0e9bc321f55d
Author: Alexandre MINETTE <contact@alex-min.fr>

extcon: qcom-spmi-misc: Add PM8921 compatible

This commit adds the PM8921 compatible to the qcom-spmi-misc extcon driver.
It allows APQ8064 boards to describe the PM8921 USB ID interrupt as an
extcon provider for USB role detection.

> diff --git a/drivers/extcon/extcon-qcom-spmi-misc.c b/drivers/extcon/extc=
on-qcom-spmi-misc.c
> index afaba5685c3dc..6811d3383254f 100644
> --- a/drivers/extcon/extcon-qcom-spmi-misc.c
> +++ b/drivers/extcon/extcon-qcom-spmi-misc.c
> @@ -199,6 +199,7 @@ static SIMPLE_DEV_PM_OPS(qcom_usb_extcon_pm_ops,
>  			 qcom_usb_extcon_suspend, qcom_usb_extcon_resume);
> =20
>  static const struct of_device_id qcom_usb_extcon_dt_match[] =3D {
> +	{ .compatible =3D "qcom,pm8921-misc", },

While this isn't a bug introduced by this patch, there are some pre-existing
issues in the driver that might affect platforms using this compatible.

Does the driver correctly handle -EPROBE_DEFER for the IRQs?

drivers/extcon/extcon-qcom-spmi-misc.c:qcom_usb_extcon_probe() {
    ...
	info->id_irq =3D platform_get_irq_byname_optional(pdev, "usb_id");
	if (info->id_irq > 0) {
    ...
	info->vbus_irq =3D platform_get_irq_byname_optional(pdev, "usb_vbus");
	if (info->vbus_irq > 0) {
    ...
	if (info->id_irq < 0 && info->vbus_irq < 0) {
		dev_err(dev, "ID and VBUS IRQ not found\n");
		return -EINVAL;
	}
    ...
}

When platform_get_irq_byname_optional() returns -EPROBE_DEFER, the checks
if (info->id_irq > 0) and if (info->vbus_irq > 0) fail, bypassing the IRQ
requests.

If both IRQs return -EPROBE_DEFER, or if one is missing and the other defer=
s,
if (info->id_irq < 0 && info->vbus_irq < 0) evaluates to true. The driver
logs an error and returns -EINVAL. This converts a deferred probe into a
permanent failure, preventing the driver from ever successfully probing.

If one IRQ is successfully found (> 0) and the other returns -EPROBE_DEFER,
the probe succeeds and returns 0. The deferred IRQ is silently dropped and
the driver loads with permanently broken hardware capability.


Can an early return during ID IRQ state reading cause VBUS state changes to=
 be
permanently lost?

drivers/extcon/extcon-qcom-spmi-misc.c:qcom_usb_extcon_detect_cable() {
    ...
	if (info->id_irq > 0) {
		/* check ID and update cable state */
		ret =3D irq_get_irqchip_state(info->id_irq,
				IRQCHIP_STATE_LINE_LEVEL, &state);
		if (ret)
			return;
    ...
	if (info->vbus_irq > 0) {
    ...
}

In the qcom_usb_extcon_detect_cable() workqueue handler, the driver checks
both ID and VBUS states sequentially.

It first reads the ID IRQ line level via irq_get_irqchip_state(). If this
call fails, the handler executes if (ret) return; and exits immediately.

This completely skips the subsequent block that checks info->vbus_irq.

If the handler was scheduled to process a VBUS interrupt, and the ID IRQ re=
ad
fails, the VBUS state change will be dropped entirely. Since edge-triggered
interrupts are used, the extcon state will remain permanently out of sync
until the next physical cable plug/unplug event.

>  	{ .compatible =3D "qcom,pm8941-misc", },
>  	{ }
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-mainline-s=
end-v1-sending-v3-0-3dd7aa125353@alex-min.fr?part=3D5

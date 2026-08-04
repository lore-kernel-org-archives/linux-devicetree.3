Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1003331ED1
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 07:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785826891; cv=none; b=qriu8ixiX7vBuLtM4HI0+kooEx+HuSgr32+YmIDH95MvrkgTeI1ku3Ax+aGc/Px3dfsPm4wg5uR+DqPkGQWslEM/ohW6DZfVgQ22ltj2NEY0M04GFzilpEKHyZYgnczKlp6D8g4MJN+XG3TJWaBWN63WZ8GNPNnQK7Q1sVanCsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785826891; c=relaxed/simple;
	bh=E40TWyP8g+5swBjtV7nKurth8qtxcOC91kEX7DQiYcU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YJpCPPWpaqZyF0GcbT52vWOTzoCouFhcdKP53TiAXC686Lx3/QEK9srhTnSLLi/+Ao2LXkoNaUmcr0eSBEpRF7y/Egz22x8MnIH7JcKNdP4xD2+1oE6wKNVoiILC+2vntvd6vIBZ0ST609BBjQrAPNPB/YOjWijD/l6NarwmCHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7AMk10Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7AMk10Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5313C1F000E9;
	Tue,  4 Aug 2026 07:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785826889;
	bh=Bw7Nkje76KVUciro0+irHsxOGcJcZn4SbiJHeSsE1Vo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H7AMk10ZNe5j1DGJP1UvyA5uImpTP4ffeZPEiUCZRknsS3pKc7r64tiERWmm1MnJR
	 QJ2HVKB8ZP1A4pGPQ5mE2DqFoIsMhVSiLUrYwbEw08MmqTskshwrbruNG90J6Q3hNm
	 O/sk9f7ArVeuIlTYOEeqkTWo9JA6tW4RLgIta0KWr7CEq+P4aZSDAveP1Oq44whNJN
	 Djd+Te3NsZFl1/mKnYABS5EOII49E436CltpdUvYKZeiEfm9aU033NmWU5OoeFe60F
	 rIQ2yzFZcj24wr3t0+qgu87JS8u34o3lX8mhy+E/TXAnUPn2gWLIyRoy2ZWh2uyfLT
	 xFWRVdOC+vtgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/6] extcon: qcom-spmi-misc: match PM8xxx USB ID
 platform device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre MINETTE" <contact@alex-min.fr>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804-mainline-send-v1-sending-v5-5-149dd4372ac8@alex-min.fr>
References: <20260804-mainline-send-v1-sending-v5-0-149dd4372ac8@alex-min.fr>
 <20260804-mainline-send-v1-sending-v5-5-149dd4372ac8@alex-min.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 07:01:28 +0000
Message-Id: <20260804070129.5313C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unbalanced IRQ wake state and lost error codes in suspend/resume d=
ue to overwritten return value.
- [High] Failure to read ID IRQ line state aborts VBUS detection entirely.
--

--- Patch [5]: [PATCH v5 5/6] extcon: qcom-spmi-misc: match PM8xxx USB ID p=
latform device ---
commit b4c56e1cb1867cf0c94f9ba05c18446ffacc8bd5
Author: Alexandre MINETTE <contact@alex-min.fr>

extcon: qcom-spmi-misc: match PM8xxx USB ID platform device

The PM8xxx MFD registers the PM8921 USB ID detector as a platform device
named "qcom-pm8xxx-usb-id". Its reused firmware node remains compatible
with "qcom,pm8921", so it does not match the extcon driver's OF table.

Add a platform device ID so the existing extcon driver binds to this
device and consumes its named USB ID interrupt.

> diff --git a/drivers/extcon/extcon-qcom-spmi-misc.c b/drivers/extcon/extc=
on-qcom-spmi-misc.c
> index afaba5685c3dc..e16c109b553e2 100644
> --- a/drivers/extcon/extcon-qcom-spmi-misc.c
> +++ b/drivers/extcon/extcon-qcom-spmi-misc.c
> @@ -204,8 +204,15 @@ static const struct of_device_id qcom_usb_extcon_dt_=
match[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, qcom_usb_extcon_dt_match);
> =20
> +static const struct platform_device_id qcom_usb_extcon_id[] =3D {
> +	{ "qcom-pm8xxx-usb-id" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(platform, qcom_usb_extcon_id);
> +
>  static struct platform_driver qcom_usb_extcon_driver =3D {
>  	.probe		=3D qcom_usb_extcon_probe,
> +	.id_table	=3D qcom_usb_extcon_id,
>  	.driver		=3D {
>  		.name	=3D "extcon-pm8941-misc",
>  		.pm	=3D &qcom_usb_extcon_pm_ops,

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in the=20
suspend/resume path that might cause unbalanced IRQ wake disables or leaked=
=20
wake_depth refcounts:

drivers/extcon/extcon-qcom-spmi-misc.c:qcom_usb_extcon_suspend() {
    ...
	if (device_may_wakeup(dev)) {
		if (info->id_irq > 0)
			ret =3D enable_irq_wake(info->id_irq);
		if (info->vbus_irq > 0)
			ret =3D enable_irq_wake(info->vbus_irq);
	}

	return ret;
}

If enable_irq_wake(info->id_irq) fails, the error code is stored in ret.
However, if enable_irq_wake(info->vbus_irq) succeeds, it returns 0 and
overwrites the previous error code in ret.

If this happens, the system will suspend and eventually call
qcom_usb_extcon_resume(). In the resume path, disable_irq_wake(info->id_irq)
will be called on an IRQ that was never successfully enabled for wake, which
triggers a kernel WARN for an unbalanced IRQ wake disable.=20

Conversely, if id_irq succeeds but vbus_irq fails, ret returns an error to
the PM core. The suspend is aborted, meaning qcom_usb_extcon_resume() is
skipped for this device. This prevents disable_irq_wake(info->id_irq) from
being called, permanently leaking the IRQ's wake_depth refcount.

Should the return codes for these two wake IRQs be handled independently?


[Severity: High]
This isn't a bug introduced by this patch, but I also noticed a potential
logic issue in how cable detection is handled:

drivers/extcon/extcon-qcom-spmi-misc.c:qcom_usb_extcon_detect_cable() {
    ...
	if (info->id_irq > 0) {
		/* check ID and update cable state */
		ret =3D irq_get_irqchip_state(info->id_irq,
				IRQCHIP_STATE_LINE_LEVEL, &state);
		if (ret)
			return;
    ...
}

If reading the ID IRQ line state fails (for instance, due to an SPMI bus
transaction error), the function returns immediately.=20

Since the VBUS state detection happens after this in the same function,
returning early completely aborts the independent VBUS detection logic. This
means USB insertions and removals could be completely missed by the extcon
driver just because of a read failure on the ID pin line.

Would it be better to let the VBUS detection proceed even if the ID line
state read fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-mainline-s=
end-v1-sending-v5-0-149dd4372ac8@alex-min.fr?part=3D5

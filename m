Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E723F86FC
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 11:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781003023; cv=none; b=eEryGsCunWGgIJ1Y3xq7YR7lY3+VPa4hBemsrTZJbUV0YD8O5N6isNZnGRtmYdL5mhJ/em+Nw8N2su08bhgMhMkWKhNRBI5CaqhimXHTPNoeZlnO6doUgVctUdY+wnfYHEvMHczHCENMu5ka0qiT5x4nwluIYSLgERj4oXZXpwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781003023; c=relaxed/simple;
	bh=exMkcugip7BrZbcZwEt658GokfbbxY6Pc6TGDhPyA3M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tdu3kwhxDb5WDdXZ8jYYTlM1ltBZL0fKi5NC1zZQQRlD0U87aHrz4zhlP+ziCXBS9pE2QEIiej0xWYQ06dRr41iWjnZmMEzLt36npisUFQira7MVd+n87+GPnzASmrcLkydUYE2G+9r4ILz1xsC/P1+bqzMr32chpgi6wSvneUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfLqBAG/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfLqBAG/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8111F00893;
	Tue,  9 Jun 2026 11:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781003022;
	bh=Gx7CvUMhTZl6eYpVJbwb7iPmxYGobvU7pfm1+sL3zrk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VfLqBAG/fHf1rOPPHBkzjZ00LbmkGO1olYKqpSj2re3zxZrb57LMFymKghMrCidpV
	 ILpDQ9Ok3RMc6PsrGEK5CVEnwzAaoksggc+DliUCTA/nyeor1+j9L7T8TdGFf9Hz+Z
	 5lS3mAU1BTdzmcIJxmP9jyWJHZO08ornraqCNbTL6+BkSjp4s1BPfXjd0ZITbmH5Mt
	 yP5NxLR8Os0fmMPisej0bE6yoqW5mU3kd6vP4qIcQjurUHVv/gfREGu5tVEjAtbF5f
	 2SMJQui9K+B1y5yavbFTmTGjl4aAqxfTCLN6o/yKkh+4+Ue/ai6yzLumd53UNhl1h/
	 Kgl84ciOI4Pmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/6] extcon: qcom-spmi-misc: match PM8xxx USB ID
 platform device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre MINETTE via B4 Relay" <devnull+contact.alex-min.fr@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260609-mainline-send-v1-sending-v4-5-83768fbf404d@alex-min.fr>
References: <20260609-mainline-send-v1-sending-v4-5-83768fbf404d@alex-min.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 11:03:41 +0000
Message-Id: <20260609110342.2C8111F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The probe function silently squashes -EPROBE_DEFER and other error=
 codes from platform_get_irq_byname_optional(), permanently breaking device=
 initialization.
--

commit 1e93c1501595aa2edcd9a08fd1d48d4373aaf0ca
Author: Alexandre MINETTE <contact@alex-min.fr>

extcon: qcom-spmi-misc: match PM8xxx USB ID platform device

The PM8xxx MFD registers the PM8921 USB ID detector as a platform device
named "qcom-pm8xxx-usb-id". This commit adds a platform device ID so the
existing extcon driver can bind to this device.

> diff --git a/drivers/extcon/extcon-qcom-spmi-misc.c b/drivers/extcon/extc=
on-qcom-spmi-misc.c
> index afaba5685c3dc..e16c109b553e2 100644
> --- a/drivers/extcon/extcon-qcom-spmi-misc.c
> +++ b/drivers/extcon/extcon-qcom-spmi-misc.c
[ ... ]
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

[Severity: High]
This is a pre-existing issue, but does qcom_usb_extcon_probe() mishandle
deferred probing?

Looking at qcom_usb_extcon_probe(), if platform_get_irq_byname_optional()
returns -EPROBE_DEFER for the IRQs:

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

If both IRQs defer, the code falls through and returns -EINVAL instead of
propagating -EPROBE_DEFER, which could permanently prevent the device from
initializing.

Additionally, if one IRQ defers while the other is found, the driver simply
skips requesting it.  Could this cause the probe to succeed in a degraded
state without the deferred IRQ?

> +	.id_table	=3D qcom_usb_extcon_id,
>  	.driver		=3D {
>  		.name	=3D "extcon-pm8941-misc",
>  		.pm	=3D &qcom_usb_extcon_pm_ops,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-mainline-s=
end-v1-sending-v4-0-83768fbf404d@alex-min.fr?part=3D5

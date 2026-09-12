Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF302AD37
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 23:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789254135; cv=none; b=frJAiGUzUYn7vf5zLOxSkMhQKYfIOkGm+FFgfWJl7C045lniKgXlEpjgu83VwRgAdOPy+83jH4Dp5mHbi+tkNeIxrLmNQ1iOBg1+UJh6Yu6YTC5/460N4zESGAkcqxD37k/Bj3+SLt6HIy8G7MQNpjn6yVc30zo+IveShD3VnwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789254135; c=relaxed/simple;
	bh=Kekkb2WOFr9VJp3rlDUKGdpzyVnTc4K9PL54SF4QrOk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=flxRaR5LayyOTSkpsNk4Kw/YAnd0Qn2ju+kVS+C6HsFc9hsqvo0UuKAVtvEptZj6/Uz4I2Z0jY4yrP0hEAaGqhd0iGTq24MtGHOlnR7deXkdan19DtSAQpSshu4ev9MpJ5QN32Aq92JZQ+9euXSYUlwlneu2BVFCP2S7PxyimxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nnInPMog; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nnInPMog"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934201F000FF;
	Sat, 12 Sep 2026 23:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789254133;
	bh=4vBSy1CQYFGu3K9vPU7Y0DA0gY5Gkyqm/fDaXxu2ue0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nnInPMogTy87f6GPYRVhSQcXUOdDAQMvzE+ogB7oylHmgLsQcWueY8+cXQKpDmRgs
	 rHpMnUsnWQviE83RqHZOrheM4LPxrcDWehRBgKdVgVs9k/pIw2Lx23CQcIOJnwOuNz
	 BWWAU7Plw/Srasqx0CQrS1gEvCQUg6VBXDkj1TrKZdqzOPxjuGGh4rF+gVGPa7/peS
	 c+qwEC4NQHy1jruAt8bQkJvA7vGuyczMTi54gagOFmECvHgab3Wtdu16sufGJcYK0N
	 aqY3HOtWYj4PV5e8CvXklp0r62SF9pgOZ0QCNiDXsbfiQaTGxZ82F9ERjRfwpBDNtf
	 cgOIPIqBNF9/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/8] usb: misc: qcom_eud: add sysfs attribute for
 port selection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elson Serrao" <elson.serrao@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260912225301.3396556-3-elson.serrao@oss.qualcomm.com>
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
 <20260912225301.3396556-3-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 23:02:13 +0000
Message-Id: <20260912230213.934201F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `chip->port_idx` state variable is not initialized from the =
hardware register on probe, potentially desynchronizing from the actual har=
dware state.
--

commit ff68b261929b924c0854c25143a07864641e767b
Author: Elson Serrao <elson.serrao@oss.qualcomm.com>

usb: misc: qcom_eud: add sysfs attribute for port selection

EUD can be mapped to either the primary USB port or the secondary USB port
depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
attribute to allow userspace to select which port EUD should operate on
and update the ABI documentation.

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 926419ca560fc..25a6a8f110ec8 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c

[ ... ]

> @@ -104,8 +113,38 @@ static ssize_t enable_store(struct device *dev,
> =20
>  static DEVICE_ATTR_RW(enable);
> =20
> +static ssize_t port_show(struct device *dev, struct device_attribute *at=
tr, char *buf)
> +{
> +	struct eud_chip *chip =3D dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%s\n", eud_port_names[chip->port_idx]);

[Severity: Medium]
Will this report a stale default value ("primary") instead of the true hard=
ware
state if the EUD_REG_PORT_SEL register was modified prior to driver probe?

Because chip->port_idx defaults to 0 and isn't synchronized with the hardwa=
re
register in eud_probe() (either by reading it or resetting it to 0), the dr=
iver
could report the primary port while the hardware is actually routing EUD to=
 the
secondary port.

This can happen if the user switches to the secondary port and the driver m=
odule
is unloaded and reloaded, or if the bootloader left the hardware operating =
on
the secondary port.

When EUD is subsequently enabled, the driver would then power on the PHY for
the primary port instead of the secondary port, breaking the connection.

> +}
> +
> +static ssize_t port_store(struct device *dev, struct device_attribute *a=
ttr,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912225301.3396=
556-1-elson.serrao@oss.qualcomm.com?part=3D2

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7F74E66A9
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 17:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788803170; cv=none; b=Z6zXLDF2NRAFt/2J0ftZlPKwj+v9yezFWWr0VYTlVbdVPT2XPV6B3KJ/7WbWEv7GShy+o7Vz7TkxXuhYgPNpkk1vdfKsOOIV+uhgB6mWr0X8CpBOAquHG9yeh4Nn+zjqW67nuxboaAck/omrSLYf9eLv3b+QG+v9jk13LQDvuG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788803170; c=relaxed/simple;
	bh=hjiL+jvpnZSleNt4sLsOU3gXhiYCfLcpIwa5WOzUxk8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cxB9OGEGKV5nmZrgVRBku3/6LZKek/YTK6+yQrR+gR1MxPAsaJGvqTeh3pbCxuIyKaBabW4wmTwrKWPQACgrq6OpPmCQR3rkNGE6ESZuPwfbfDtJ3wXtDMGziPaOibthsUQOTRvGRH/LW/hYoHUc/jwYXLKp1IZBIf45adIfLSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJsKYIxM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJsKYIxM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182561F00A3D;
	Mon,  7 Sep 2026 17:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788803165;
	bh=JvTYLQCJoUKJbri2ibOWTfPnDGcRyFvRzsrYMFE5sC0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aJsKYIxMN0oLETNczl8t/6PUiPTQs28wTlSMdYWmhyYxicxtP4K27rGUANnD6dPN0
	 2u1sQe0872ISqtclyWv6yXehDYsJg7jO37vnRq97lRkO2lqqD7n8T2nATZdJNiQVgc
	 2iL1qnmZd3PWJR9bimLCeQvpsebRp4hh6fVtlQ1vicabgLmnGOztlDwZl3sbKoRq8q
	 U/7QojFwgCMf2+cw+uTrr2+Oq+DzpJif21g8wfIJtdzdiKGZ2fIER37XdwKPo1FAgd
	 Xh3ofWWStpHoICMA/FQcDClOApT53kTMAZWKIK1V9yIN4apko3Yr3n96wH8GqK74eD
	 2PImpqZsvPe2w==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH net-next 6/7] net: mdio: add Airoha EN8811H MDIO
 device driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksei Sviridkin" <f@lex.la>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260906174548.4106801-6-f@lex.la>
References: <cover.1788711797.git.f@lex.la>
 <20260906174548.4106801-6-f@lex.la>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 17:46:04 +0000
Message-Id: <20260907174605.182561F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect PM wrapper used for dev_pm_ops structure pointer.
--

commit 23bfd1bd681c899f8cb9185a35af023d5e062675
Author: Aleksei Sviridkin <f@lex.la>

net: mdio: add Airoha EN8811H MDIO device driver

This commit introduces the EN8811H MDIO device driver. The driver polls for
and downloads firmware to the MD32 microcontroller before it functions as an
Ethernet PHY.

> diff --git a/drivers/net/mdio/mdio-airoha-en8811h.c b/drivers/net/mdio/md=
io-airoha-en8811h.c
> new file mode 100644
> index 0000000000000..d94d74d85f10d
> --- /dev/null
> +++ b/drivers/net/mdio/mdio-airoha-en8811h.c

[ ... ]

> +static DEFINE_SIMPLE_DEV_PM_OPS(en8811h_mcu_pm_ops, NULL, en8811h_mcu_re=
sume);
> +
> +static const struct of_device_id en8811h_mcu_of_match[] =3D {
> +	{ .compatible =3D "airoha,en8811h-mcu" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, en8811h_mcu_of_match);
> +
> +static struct mdio_driver en8811h_mcu_driver =3D {
> +	.probe =3D en8811h_mcu_probe,
> +	.remove =3D en8811h_mcu_remove,
> +	.mdiodrv.driver =3D {
> +		.name =3D "airoha-en8811h-mcu",
> +		.of_match_table =3D en8811h_mcu_of_match,
> +		.pm =3D pm_sleep_ptr(&en8811h_mcu_pm_ops),

[Severity: Low]
Should this use pm_ptr() instead of pm_sleep_ptr() for the dev_pm_ops
structure pointer?

The power management subsystem guidelines indicate that pm_sleep_ptr()
is reserved for individual sleep callbacks inside the dev_pm_ops
structure itself, while pm_ptr() must be used when assigning the structure
pointer to the driver declaration in en8811h_mcu_driver.

> +	},
> +};
> +
> +mdio_module_driver(en8811h_mcu_driver);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788711797.gi=
t.f@lex.la?part=3D6

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1DD410D32
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 09:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527696; cv=none; b=KaSdMwh8dvFuP0SA8wqXd3SDYYasBPp+/PCAxH78PfDOOOPXpruhDh6FAh/Aagf5c411vtcWyu/G1kBz5xMkg5hvwdCz2Q8cZzhgv0uYo57dXpFKtlsgvE5PRsvSCK4tET5mJb4wyo2cf65RPHCbkcgKwpcfcFRC2aYCKDlXOBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527696; c=relaxed/simple;
	bh=WTYVmeBog83E9Isp5YYXMfivZO37sLQBWsf+IPjsSw8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QRMbpzVjLYDiRcXLiCA4gjn1Nw5gXWXOMIO3UEohyImimEeo32/cs2kyA+RzRylisE0bT4m1TVtwybxUzTAHfB3yip/r0pV10Qpqfh6PIe/ib4rrmp6HmCD5ij3LXCSqDhkDoOnF9aXL5DHBiY+Ks+Gn/vhExJmoQPU6fRlWFgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mI2hY+v7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mI2hY+v7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDCF91F000E9;
	Wed, 12 Aug 2026 09:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786527695;
	bh=QziUwD5RA58k/A+E2boK5z0dZYlZTevFVR5aHT7KQ0Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mI2hY+v7Fqeo+6Yq7Wg5mdukNo5+WY6VmYdXV46IBnYnS/KCRuZjZHViyGGMVkzp5
	 AlM4h8dSY+JdfR5MW+urd1hf+raG+1LJVqby8d7UrLDXQwgssHmU48K0z1OZ23/3Ov
	 ntpOtJUb55ZQp431gKn98nKHr+HzuQu1nhI0yT0bLbZo6AXDYCAMjftu3xeJHHDpoR
	 NZ530mdZvStUCTxmkbBlL9pUoWF1McCth+MHuGqkJEn/XsRmnujlHbDaEpNUDHMXkD
	 Gwgt52JWj2VIbxoYiQ+P8SlKSUektPPshuL5OQTow810a6AspPC50qv0XH1LKxQvwG
	 SogyN1GACg09Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] usb: chipidea: usb2: add optional reset support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260812-b4-spacemit-k1-usb2-v1-2-f28cf29e522b@linux.spacemit.com>
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
 <20260812-b4-spacemit-k1-usb2-v1-2-f28cf29e522b@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 09:41:34 +0000
Message-Id: <20260812094134.CDCF91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Teardown order inversion between manual clock disable and devm-man=
aged reset assertion.
--

--- Patch [2]: [PATCH 2/6] usb: chipidea: usb2: add optional reset support =
---
commit 5129acb0e56d5e6166124800f0bd1996cf88389b
Author: Junzhong Pan <panjunzhong@linux.spacemit.com>

usb: chipidea: usb2: add optional reset support

This commit adds optional reset control support for the USB2 controller
found on the SpacemiT K1 SoC.

> diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/c=
i_hdrc_usb2.c
> index 8ffa1e95d8e86..00d575cd29557 100644
> --- a/drivers/usb/chipidea/ci_hdrc_usb2.c
> +++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
[ ... ]
> @@ -80,6 +82,12 @@ static int ci_hdrc_usb2_probe(struct platform_device *=
pdev)
>  		return ret;
>  	}
> =20
> +	priv->reset =3D devm_reset_control_get_optional_exclusive_deasserted(de=
v, NULL);
> +	if (IS_ERR(priv->reset)) {
> +		ret =3D PTR_ERR(priv->reset);
> +		goto clk_err;
> +	}
> +

[Severity: High]
Does this create a teardown order inversion later in ci_hdrc_usb2_probe()
or ci_hdrc_usb2_remove()?

Because the reset is acquired using
devm_reset_control_get_optional_exclusive_deasserted(), the devres cleanup
will automatically assert the reset after probe failure or device removal.

However, looking at the rest of ci_hdrc_usb2_probe(), if ci_hdrc_add_device=
()
fails, the code jumps to clk_err and manually calls clk_disable_unprepare()
before the devres cleanup runs:

ci_hdrc_usb2_probe() {
	...
	priv->ci_pdev =3D ci_hdrc_add_device(...);
	if (IS_ERR(priv->ci_pdev)) {
		...
		goto clk_err;
	}
	...
clk_err:
	clk_disable_unprepare(priv->clk);
	return ret;
}

This means the reset will be asserted after the clock is disabled. On many
architectures, asserting a peripheral reset while its clock is disabled can
cause bus lockups or system hangs.

This same inversion appears to affect device unbind as well, since
ci_hdrc_usb2_remove() manually disables the clock before devres runs.

Would using devres for the clock enablement ensure standard LIFO teardown
ordering?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812-b4-spacemi=
t-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com?part=3D2

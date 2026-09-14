Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0B12FE057
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789356435; cv=none; b=eMqWN+jJRm75VixRqSNOmP0SHh/XP3zLJGx5b4jcMmMvtcdK+qAoG4AsChJBAzyapVCKvnSxUuwCJl1wD3Fa370NT00pZCWMhBNKB6nqgUmNoAwKxtuV1d0xVDTQ6g1CisoUnCgJ258WtpQjkO5qiWmh++BA+ndZYPwgAtFv/MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789356435; c=relaxed/simple;
	bh=3/A+4dPU3J603LbeUPSkflM2alok6YgNtGUjNgkyjCg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OD/4mEOy9X+fBv37ArKFcwNMDq++TX5mtEb8NJGnhVmWbhzqagj5fNyK58hIw2KdqYQ/07nuPv8TmFrAdcLmsTJZhbCOc6Whv2w5AtalwLKtxDpPUCtbr/hczohll7dw7Oig0lKKthx1ct7FPBWOp/7JEcuIzfM89qfkI/4FRZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LV7b/PzU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LV7b/PzU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9434D1F000FF;
	Mon, 14 Sep 2026 03:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789356434;
	bh=CIDbXVM2jeGQjO4zxD5leriOt7cLbGdO3SlDMTR1Ssg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LV7b/PzUJaEst7qWyVaYoRKcR3BRX+AOcDz5SqSfx7NDkF1D7nqB8DPL1aXWKQizN
	 jaQEkisfNN122Xfajpz4UIghBmRJOiin3oVxYH4YmOw17aNIjbkXUJ0iJ5zkt3xmUg
	 QY/BS2GQu5gqwTmZ3WCo6LKS7TCAD2vnq//0Gyx0gxhxfTGn6P5TUMYJrcVSA1Pu+u
	 Yq2TCZEvr6iOqyXFUxUNOcCVt4FOFo1Z/U3a+8RsmF9IytIpCqYKx17TrvTZkXPzel
	 gIrdD4N9qCMxIVKFE+A4HqP6Tc3XgY/pfTk5bUyIacWSReYYxSnZRZb6YCCNPfIerW
	 SfeX8NfLjQn2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] phy: nuvoton: phy-ma35d1-usb2: extend to
 dual-port with OTG support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, olteanv@gmail.com, vkoul@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org
In-Reply-To: <20260914031859.385224-4-a0987203069@gmail.com>
References: <20260914031859.385224-1-a0987203069@gmail.com>
 <20260914031859.385224-4-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 03:27:13 +0000
Message-Id: <20260914032713.9434D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unchecked regmap_read return value in ma35_role_sw_get leads to =
the use of uninitialized stack memory, potentially leaking 1 bit of kernel =
stack data to userspace.
--

commit 93b1ad8e66488910d7c296427cb3acbec813e0a2
Author: Joey Lu <a0987203069@gmail.com>

phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

This patch extends the Nuvoton MA35D1 USB 2.0 PHY driver to manage both PHY0
and PHY1 ports using a unified init callback. It updates the reset and clock
polling sequences and adds a read-only USB role switch for PHY0 to expose
the active role to userspace.

> diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/=
phy-ma35d1-usb2.c
> index 9a459b700ed48..2c60be0ee50f7 100644
> --- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
> +++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c

[ ... ]

> +static enum usb_role ma35_role_sw_get(struct usb_role_switch *sw)
> +{
> +	struct ma35_usb_phy *p =3D usb_role_switch_get_drvdata(sw);
> +	u32 val;
> +
> +	regmap_read(p->sysreg, MA35_SYS_PWRONOTP, &val);
> +
> +	return (val & PWRONOTP_USBP0ID) ? USB_ROLE_HOST : USB_ROLE_DEVICE;
> +}

[Severity: Medium]
Could this lead to the use of uninitialized stack memory? If the call to
regmap_read() fails, the variable val will remain uninitialized. When
evaluated in the return statement, it would return a USB role based on stack
garbage.

Since this role is exposed to userspace via the sysfs role switch interface,
could this potentially leak one bit of kernel stack information to userspace
if the MMIO read happens to fail? Should the return value of regmap_read()
be checked before evaluating val?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914031859.3852=
24-1-a0987203069@gmail.com?part=3D3

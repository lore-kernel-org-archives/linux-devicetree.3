Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD011C5F1B
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 02:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790648174; cv=none; b=YN2OaOlZaSU9c6Z0tm+H871wiqmJQD1v74n2NMbXIOmRSbix9K6rDarj5kBwFR9Vpy/yVa8Al9UNHqBZtpDcBdI1c+9fN4f3UnYlZsjAsGTIMijnfojlG9d/syMqXifYe93vbXyU8AC/MUMZ83JHvBX1tvotqe2mO0b0l3kJjfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790648174; c=relaxed/simple;
	bh=HGacQfhtXMtID5jIwejDZHJQm2A1yH08CfjD3/x6loc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FuKM4zQRuZjAikgix1A/hZ01pwhKGtGFxTMNg1xHPyazriQxKmUTsZIa2iLg3/pUioHex0VJO58TZ6SubRmZhQDz4SxsUu74fiiC4bnzktXyZ4XTqyLTS3WAv2ytKMJG78zbZM3G9qEJry7pCe9qhsfrlftLo9db5SFchqBXnLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8i3f/v3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8i3f/v3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB891F000FF;
	Tue, 29 Sep 2026 02:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790648172;
	bh=zwl3tTzOXIR9Std1UeTK2RA1IHFZWaJIg+6cKzNqwAA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H8i3f/v3qxfYK+6vAShGxs93raIuac5bE6cIUbsN1uzYGl93AWRBVP0fb+y0uuTGZ
	 jVgHzPDHqxakogDsoDnE4iAtn3xbI/ODAseUwNvPnq6TMDYcLpiPawTdsrnaDjVLOO
	 PKDpRS9FHVLOEpx46zKE5yIJFYNnGOerQUmPByz1AR5sYeB0q2AnmSWhq/7Tm5uCUO
	 zLrV6vZcYLiZ8UiNze8sVVIX1dP2DO0ObKyxkXrbYsrHIthX6luKzqwF9aQkkvZ8ze
	 vmyCUUXTpQ7NTLPJWT/+nI4W7ICjAEdAUkm3VDmtHvPZc4s9XxGF+zwHInzYeWmtlF
	 2bPD7BmUE+Dzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] phy: nuvoton: phy-ma35d1-usb2: extend to
 dual-port with OTG support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joey Lu" <a0987203069@gmail.com>
Cc: vkoul@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, conor+dt@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260929020854.1282339-4-a0987203069@gmail.com>
References: <20260929020854.1282339-1-a0987203069@gmail.com>
 <20260929020854.1282339-4-a0987203069@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 02:16:12 +0000
Message-Id: <20260929021612.7EB891F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] phy: nuvoton: uninitialized stack variable usage in ma35_role_sw=
_get()
--

commit 801a123466a572aa070fd7a885bb27adf3f83110
Author: Joey Lu <a0987203069@gmail.com>

phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

This commit extends the Nuvoton MA35D1 USB 2.0 PHY driver to manage both
PHY0 and PHY1, handling host and device modes. It introduces a single init
callback instead of separate power_on/power_off callbacks and adds a USB
role switch for PHY0. New device-tree properties for resistor calibration
and over-current polarity are also supported.

> diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/=
phy-ma35d1-usb2.c
> index 9a459b700ed48..547c7d55d8ff4 100644
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
Does this code use an uninitialized stack variable if regmap_read() fails?

If regmap_read() returns a negative error code, the out-parameter val will
remain uninitialized. The subsequent check of val & PWRONOTP_USBP0ID would
then evaluate uninitialized kernel stack memory.

This could report an unreliable hardware state to the USB role framework and
leak a bit of kernel stack memory to userspace via the sysfs interface.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929020854.1282=
339-1-a0987203069@gmail.com?part=3D3

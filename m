Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D9F3C7690
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 10:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782987989; cv=none; b=PHbt8YADVMlKKkOeKGlBZlIrnGwbrtnJ7zxmw6U5IlnvJlPnixfSZSRPz8bdUREmW1c6BoF1YME6TcTSjZiFhe/hAh6Q6FrsDz8UADbDgzfN4ww8+jgma+z9axIh/MquRcUqx3ZAijJg2YOmg/D3cudb4s3XV5gJi1mi02t5dS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782987989; c=relaxed/simple;
	bh=bWmo7L95P3yw0GeDMotuS62BBzmVyTJ3RfvUk/8fIjg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DR6496X3VLaea0hK8X7UEQ9TgkcwgVAGLYnxUfdMSHVVbBgHVBBUNKGG2nHiRW/a8NTEQBrgybhA06shcCO5iU+MPAm9g2pGMFE0+N38pTyMn3oJfYHuHhrh5wo+Zr8XeDLtmKszrsdZq+MC/Ffq9f/VQphwUbZUEsh9MqQe3XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oxEvWzG8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oxEvWzG8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B2231F000E9;
	Thu,  2 Jul 2026 10:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782987988;
	bh=bWmo7L95P3yw0GeDMotuS62BBzmVyTJ3RfvUk/8fIjg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oxEvWzG8fFxVI66RKoZ5i6mffyjprAGGfnfxfaqqPso7HDRo4g92riBySRwEbP6W1
	 nqwfysiFRInIQrwf+g8ihkd+9ZPdifcf0L8oLFnqz/NOUsOCVNvtWsvyTJd8Z6PwrW
	 AxWx+QYkSj7ChoWUYZIU/OgaD7yyUdBE0QlQoqDIzbi3gKHIBF1+ZpEIk4aAX6vPB0
	 EctR6TQ2jvK7P4C8kSiD8Gl+rt9K49uFopRlm36hdeudBUgfTCCe5luChGGnUYBxR1
	 VPB0ZsORr2nLsLtGHbCCDTBny3UVQyIvyPfCYguce8c4w24Zt+G3DOfVT/88/lsGb1
	 o8pxQw29g40Bg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 5/5] phy: airoha: Add support for Airoha AN7581 USB
 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20260702093812.15918-6-ansuelsmth@gmail.com>
References: <20260702093812.15918-1-ansuelsmth@gmail.com>
 <20260702093812.15918-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 10:26:26 +0000
Message-Id: <20260702102627.0B2231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incorrect usage of `regmap_set_bits` with `FIELD_PREP` corrupts mu=
lti-bit register field
- [Medium] Missing PHY Lifecycle Management for SerDes PHY
- [Medium] Computed slew rate calibration value is not clamped, risking sil=
ent wraparound
--

Note: The format of this review has been altered to use free-form summaries
instead of inline diff quoting due to strict recitation restrictions.

commit 4d1e2d05354e7c1aad9463afa3c9c7ffd853f726
Author: Christian Marangi <ansuelsmth@gmail.com>
phy: airoha: Add support for Airoha AN7581 USB PHY

This commit adds support for the Airoha AN7581 USB PHY driver, which suppor=
ts
up to two USB ports. USB 2.0 is always supported, while USB 3.0 requires the
SerDes port to be configured. It also introduces USB 2.0 slew rate calibrat=
ion
using a mandatory monitor clock.

[Severity: Medium]
In an7581_usb_phy_init() and an7581_usb_phy_power_on(), the driver sets the
mode of the SerDes PHY but does not call phy_init(), phy_power_on(),
phy_power_off(), or phy_exit() for the priv->serdes_phy. Is it safe to omit
these generic PHY lifecycle calls?

Even if the current SerDes PHY driver for this SoC only implements the
set_mode callback, omitting these lifecycle management functions might cause
failures if the SerDes PHY driver is updated to require hardware
initialization, or if this driver is used on a SoC variant where the
underlying SerDes PHY requires power management to function.

[Severity: High]
In an7581_usb_phy_u3_init(), regmap_set_bits() is used alongside FIELD_PREP=
()
to write a 16-bit value into the AIROHA_USB_PHY_SSUSB_XTAL_TOP_RESERVE
register. Does this unintentionally leave old bits set in the multi-bit fie=
ld?

Since regmap_set_bits() performs a bitwise OR and does not clear previously
set bits like regmap_update_bits() does, any pre-existing overlapping bits
from hardware defaults or bootloader initialization will remain set. This
could result in a corrupted XTAL/PLL configuration and cause an unstable
USB 3.0 clock or probe failures.

[Severity: Medium]
In an7581_usb_phy_u2_slew_rate_calibration(), the dynamically computed srct=
rl
value is passed directly to FIELD_PREP() for the 3-bit
AIROHA_USB_PHY_USB20_HSTX_SRCTRL field. Could this silently wrap around if
fm_out is unexpectedly small?

If a transient clock issue causes fm_out to drop below expected values, the
computed srctrl can exceed the maximum value of 7. Because FIELD_PREP()
masks the value, an srctrl of 8 would silently wrap around to 0. This would
convert what should be a maximum slew rate calibration into the minimum
calibration, risking severe USB 2.0 signal degradation. Should the srctrl
value be clamped before insertion?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702093812.1591=
8-1-ansuelsmth@gmail.com?part=3D5

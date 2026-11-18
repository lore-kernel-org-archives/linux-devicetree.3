Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016504;
	b=u0VqCt6+7K/II/2cO2rsHnUEXwZJ0s17lPJTzTH4D8m9s8XMJ1jrE0EqhTiKpPnBWzEz
	 qglGrfodCbhA3dGujGjDETwKm9WwTAE2FzZLacERCZP6CFVAM1nss7QN08wOaSyEFNW4q
	 qq3SK284eBM6rxXnOer/MRgnYG4ea6LABiJrJb8QoZlrzfQNGBD3WE5Ih0ypzydzoUU11
	 mlTR78wL6cgCv8loAD/Ntl3Fg9PF2o0jo9YVDF1VRMubCgfzMYa3ju/CjZ2rt6u7lbzzo
	 wpQqWUh0oKHs2t0Zqe/DWJRXJlq1gHlSgZDIDbxd7m3O+aeUWSOB1lrP0Zny+mp1dHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016504;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jPQuyYJfKbEF4JYVB7Fd4jgmaG7sAIuItXFSzP1bz7g=;
	b=QuFZnXycNtfAGTXgzRl6fEvB+zVfzkAUXJODSk0H0GjRP4RIP44aQeBWzWom6y1cZ0jc
	 sBfa1wWVFEGsa6KfibnNM3eAcywZ+tI1jcqxrrPL6BjqTUgA/YYoInjrNCXXURVjGPBB5
	 Ch0A2uBAThmU5X4dHyGqIYbsV8XFG+kUWJ+YJ8aXw7EkD58R3fp+EXCzeUE44E71yENWW
	 kH3dRQ3ncu30FIcrdQSF6iqtxoszYmnSQWE3oLZJqFlmnSYt2Ty8+9E1iZL8LxHE3M1bX
	 rL17YsUCSLdHWQJjij8Sc7Tjog53Ak5iq4WtDTn7AV2HwEv3o+8aFZiz+4HDJQHt0iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ITFgWwiz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64E0606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ITFgWwiz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21111F000C5;
	Wed, 18 Nov 2026 15:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795016504;
	bh=jPQuyYJfKbEF4JYVB7Fd4jgmaG7sAIuItXFSzP1bz7g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ITFgWwiz0qSlKV6DAtFvXogn6sjx0HJGCJqeIH70/uXTCh6BywNtVatveik/1mKr1
	 8aD9ZjaN7/McMK/3B9rgteU7smymlUUprAt9lB3gsUzOghahU3GuT1OnZfzj1KzFX2
	 DtaJkBYmOVZrxsz11PlYYVCmuyaygwBlLw5236K2ZYYROHYjz0xUtk/JqjpbAbTqI5
	 QVSXtWoG33FJfrFcJn5b+69+dna4/F3CBKjRghbIDlMtim1D1TZN9cmOW+CefJ9Zsj
	 hnA/w2Gle5sQSXfPUISr+91JRAHkALNY8CLqqpv3jv4jFndkDY3KSntLCR7XA7ZPpn
	 g6+JJWCgYW4LA==
Message-ID: <sashiko-outbox-221359@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Fix
 touchscreen power on
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hans de Goede" <johannes.goede@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118153326.12640-1-johannes.goede@oss.qualcomm.com>
References: <20261118153326.12640-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 15:41:43 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] arm64: dts: qcom: missing Fixes trailer for touchscreen power-on
  delay fix
--

commit 618cd8b22a525766134a0a260252f46c6dbcf50a
Author: Hans de Goede <johannes.goede@oss.qualcomm.com>

> arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Fix touchscreen power on
>
> When the i2c-hid driver is builtin the touchpad on the ThinkPad T14s
> fails to probe at boot. When the driver is builtin the touchscreen gets
> probed immediately after being taken out of reset. At this point
> the touchscreen is not ready to talk on the I2C bus yet, causing
> the probe to fail.
>
> The touchscreen on this laptop needs a delay of 200ms (taken from ACPI
> power-sequences) before it will accept I2C transfers.
>
> Add a post-power-on-delay-ms =3D 200 property to the touchscreen DT node
> to fix this.
>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

[Severity: Low]
Since this fixes the touchscreen@10 node introduced without
post-power-on-delay-ms, should this include:

  Fixes: 7d1cbe2f4985 ("arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6")

Also, the first sentence of the commit message says "touchpad" where
"touchscreen" is meant.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118153326.1264=
0-1-johannes.goede@oss.qualcomm.com?part=3D1

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793692727;
	b=mmj66kwP0U4JiIhwQaBcJAp6GKZRNGLLYVO/YiBygvEHYVWkqXrR99z6d6KqqXWdzAfQ
	 Ryj4KJRa99mbza+DrUPptiaZZColHo9zTnODEHTN8JwG0zTK5+e+y15lfOCoJ3LZd0HNX
	 D2d+rgN/qF7Z/2oBYeu7kNFAjH8ZjMcsQjax2hAfjZ9N4J4EE5mEXowXSehAzTVJw5kDC
	 XmeUMtfr6ddEFVCi1spE0BGsQjEwe4s6ENmR9VJVUO0mWTvxNzkn3m9Vn18TejozCNzNh
	 Ec4vT4XgycdG2TcT3EY1vz5bmA8POHhu5rAPiDuJxC6L+AVy8aLIBdsHXomnFeKF/8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692727;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=o1BJ/Y2TNEexfoxI4/HZbpkaa7m/VA6soorGM6Dw74k=;
	b=ggkRoAFPa8QQi1uLYCb6GLaSbNpxr54KalFQa7jUNBIr3Ir61t09TxyO8Hoznn7Bkd4G
	 aw6v/FTRAc1RSubsN4VkRelVBCctTkTUnKPpCwDmacl45vvOkmxy+Gb9MgEI7fOFrq6xm
	 PhNp1DFg84uK80LB+69gxzLKF4o/4HpHIJEWgNOmndFz6M9cXmu0WdPMo2zeomflLuchg
	 6cx11Lh+Iose2f14Xu5jBbPujxhxaPzBD1GPb92J37s4XQ5NuypU8s2kOiN0yslI3TUu/
	 g9kYp2U0w7EP50XuDBdgYcFathvCm5R/nBXLqQu56OXC72XuozvlEpykq1LGMdViP7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ov6qPki4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF258606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 07:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ov6qPki4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558701F000C1;
	Tue,  3 Nov 2026 07:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793692726;
	bh=o1BJ/Y2TNEexfoxI4/HZbpkaa7m/VA6soorGM6Dw74k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ov6qPki46u9Qd7dwBPTtG6I8/kgcLxHj98b5odjWvXZfLHwNaPnQ8l+i7bjFXu8ur
	 aBEWP/YwmVCOaVXHB2vGNx3Z3gNI32PAqtjMk4YCLEwEM01TnRbAAY95LQU8FejkVg
	 t3bGt1oYaElKRrkS7bG7z89jnDzpvTqhGL69crx0YCFHJ9iamRoYuVwgsa4+h36yuz
	 DsZ0t79+IlNDZru0Nxq0JwVA1Xs9dptzA+SdcH++QmySOR5Pnk8ZG/zcna0rF0Am57
	 TE+OZ4AyNFQuHomae8zkOHbw24W4GB98EAM8prSLCulEF2HK9GnGaEtXY9/G0ki5so
	 DF6LnJTLL0fqA==
Message-ID: <sashiko-outbox-194780@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] phy: cix: Add CIX Sky1 USB3 PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?= <hongliang.yang@cixtech.com>
Cc: =?utf-8?b?bGludXgtcGh5QGxpc3RzLmluZnJhZGVhZC5vcmc=?= <linux-phy@lists.infradead.org>,
 =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261103074913.1971025-3-hongliang.yang@cixtech.com>
References: <20261103074913.1971025-1-hongliang.yang@cixtech.com>
 <20261103074913.1971025-3-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 07:58:45 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] phy: cix: missing select REGMAP for PHY_CIX_USB3 in Kconfig
--

commit d964298ad6351b3e6e7c48b5d622d1449937080f
Author: Hongliang Yang (=E6=9D=A8=E5=AE=8F=E4=BA=AE) <hongliang.yang@cixtec=
h.com>

phy: cix: Add CIX Sky1 USB3 PHY driver

This commit adds a PHY driver for the multi-port Cadence SD0803 USB3 PHY fo=
und
on CIX Sky1 SoCs, handling initialization, reset, and clock management.

> diff --git a/drivers/phy/cix/Kconfig b/drivers/phy/cix/Kconfig
> new file mode 100644
> index 0000000000000..aaa2eb9d45527
> --- /dev/null
> +++ b/drivers/phy/cix/Kconfig
> @@ -0,0 +1,20 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Phy drivers for Cix PHYs
> +#
> +
> +if ARCH_CIX || COMPILE_TEST
> +
> +config PHY_CIX_USB3
> +	tristate "Cix USB3 PHY Driver"
> +	depends on OF && HAS_IOMEM
> +	select GENERIC_PHY

[Severity: Low]
Does PHY_CIX_USB3 in drivers/phy/cix/Kconfig also need to select REGMAP?

In drivers/phy/cix/phy-cix-usb3.c, the driver defines cix_u3phy_regmap_cfg =
as
struct regmap_config, calls regmap_multi_reg_write() in sky1_u3phy_init(), =
and
calls devm_regmap_init() in cix_u3phy_probe():

drivers/phy/cix/phy-cix-usb3.c:sky1_u3phy_init() {
	...
		ret =3D regmap_multi_reg_write(u3phy->phy_regmap, sky1_u3phy_conf,
					     ARRAY_SIZE(sky1_u3phy_conf));
	...
}

drivers/phy/cix/phy-cix-usb3.c:cix_u3phy_probe() {
	...
	u3phy->phy_regmap =3D devm_regmap_init(dev, NULL, u3phy, &cix_u3phy_regmap=
_cfg);
	...
}

In include/linux/regmap.h, struct regmap_config, devm_regmap_init(), and
regmap_multi_reg_write() are guarded by CONFIG_REGMAP without fallback stubs
when CONFIG_REGMAP is disabled. If CONFIG_PHY_CIX_USB3 is enabled in a
configuration where no other option selects REGMAP, building phy-cix-usb3.o
will fail due to an incomplete struct regmap_config type and implicit funct=
ion
declarations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103074913.1971=
025-1-hongliang.yang@cixtech.com?part=3D2

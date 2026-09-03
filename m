Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC992BEC3F
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 02:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788403734; cv=none; b=HfkG5ySX878+xHFVo8C05jNieT5jhVS7CtoJM/oSbgH5Tl6YfVYgatyHzQ5NyCdIhvh6KXkoZhloUth5i3a9UJ3S0c01M76ZORcioUGHz69jSIA8x7jzFvqHsuN0WXqXZM03PQFKJFlqXFCpeVu7CsuKpp5XRFPQ/Dvi0bqRx4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788403734; c=relaxed/simple;
	bh=DusOHe16A1czF5QDRBD8vfo9231kUJ002bbr7Uc5+oo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BEMJGQRQl+HKk87yCoAWQUQ6V75gsOmxHLw8makk2/BIqvlMTS8shrAI8qmdL46YxZTgEoSvObD46RytfOntpAa7BzboDGZi1NKs40awflsnFo2KpYglhfkNcQckedxdBpC64MxMxFHDfHPQYoRGufwtyXYGOGT5MpQnTE/L9z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJ+RjBek; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJ+RjBek"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9431F000E9;
	Thu,  3 Sep 2026 02:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788403732;
	bh=JLxLtfb/xPEr0vKGjJmgeJR+BBWnZhJN7K8XakhPQYM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OJ+RjBekLtl8z/D9fW4lmQNccAt0QW31Phvne9Miz5bcloA7LRxSOKUTZ/PYsW1gS
	 1hKkvqcgLoMnX5ZH1xEdxTPpWwafNmLM4/pZRmRgWVd47iQa7/QkhiouZS7AJzDH1n
	 ETLPUljz1zXpJUxE+zwCumfqn+5lrEKzJdAhc4qneuVtz2EXJbj+5IQ+AUBX8lr1Dn
	 sWW4kM86QbVsb3I2C5hVz0+2KDC5HL3Bc+DgQ9UuQDdlAuwDEdhVvet9PVhZGUMX2R
	 mYzkR0/ZFsgT3WdFkiQrfRYI1fLkd3lVTo2fEKKs1gqCwF+xO+mPlNTj3dcDPOdc7x
	 U5OHZZLJBayCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] phy: cix: Add CIX Sky1 USB3 PHY driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Yang" <hongliang.yang@cixtech.com>
Cc: robh@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260903023521.2064986-4-hongliang.yang@cixtech.com>
References: <503e87d9-3311-413a-98c0-e02a02c4a354@kernel.org>
 <20260903023521.2064986-1-hongliang.yang@cixtech.com>
 <20260903023521.2064986-4-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 02:48:51 +0000
Message-Id: <20260903024852.3A9431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Low] Incorrect format specifier for printing `device_node` pointer.
- [Low] Missing `devm_mutex_init()` for devm-allocated mutex.
- [Low] Missing explicit inclusion of `<linux/property.h>`.
- [Low] Unused data structures and enumerations in the header file.
--

commit 5cad48211eb5758f9a40687789544cb07846cb4a
Author: Hongliang Yang <hongliang.yang@cixtech.com>

phy: cix: Add CIX Sky1 USB3 PHY driver

Add PHY driver for the USB3 PHY found on CIX Sky1 SoCs. The driver
handles initialization, reset, and clock management for the
multi-port USB3 PHY.

> diff --git a/drivers/phy/cix/phy-cix-usb3.c b/drivers/phy/cix/phy-cix-usb=
3.c
> new file mode 100644
> index 0000000000000..0f074af84e909
> --- /dev/null
> +++ b/drivers/phy/cix/phy-cix-usb3.c
> @@ -0,0 +1,410 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * phy driver for cdn_sd0803_t7g_typea
> + *
> + * Author: Hongliang Yang <hongliang.yang@cixtech.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include "phy-cix-usbdp.h"

[Severity: Low]
Since the driver uses device_for_each_child_node_scoped(), should
<linux/property.h> be explicitly included here to avoid relying on implicit
dependencies from other headers?

[ ... ]

> +static int cix_u3phy_probe(struct platform_device *pdev)
> +{
> +	struct cix_u3phy *u3phy;
> +	struct device *dev =3D &pdev->dev;
> +	struct phy_provider *phy_provider;
> +	struct device_node *np =3D dev->of_node;
> +	struct device_node *child_np;
> +	struct phy *phy;
> +	int ret;
> +
> +	u3phy =3D devm_kzalloc(dev, sizeof(*u3phy), GFP_KERNEL);
> +	if (!u3phy)
> +		return -ENOMEM;
> +	dev_set_drvdata(dev, u3phy);
> +	u3phy->dev =3D dev;
> +	u3phy->cfg =3D device_get_match_data(dev);
> +	if (!u3phy->cfg) {
> +		dev_err(dev, "no OF data can be matched with %p node\n", np);

[Severity: Low]
Will this print the raw pointer address instead of the device node name?
Since np is a device_node pointer, should the %pOF format specifier be
used instead?

> +		return -EINVAL;
> +	}
> +	u3phy->reset =3D devm_reset_control_get_exclusive(dev, "core");

[ ... ]

> +	u3phy->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(u3phy->base))
> +		return PTR_ERR(u3phy->base);
> +	u3phy->phy_regmap =3D devm_regmap_init(dev, NULL, u3phy, &cix_u3phy_reg=
map_cfg);
> +	if (IS_ERR(u3phy->phy_regmap)) {
> +		dev_err(dev, "failed to remap phy register\n");
> +		return PTR_ERR(u3phy->phy_regmap);
> +	}
> +	mutex_init(&u3phy->mutex);

[Severity: Low]
Since u3phy is allocated using devm_kzalloc(), the memory will be
automatically freed on driver unbind. When initialized with mutex_init(),
mutex_destroy() won't be called automatically, which skips cleanup steps
expected by the resource management API for devm-allocated mutexes. Should
devm_mutex_init() be used here instead?

> +	device_for_each_child_node_scoped(dev, child_fn) {
> +		const char *name =3D fwnode_get_name(child_fn);

[ ... ]

> diff --git a/drivers/phy/cix/phy-cix-usbdp.h b/drivers/phy/cix/phy-cix-us=
bdp.h
> new file mode 100644
> index 0000000000000..6ec7eb5c81aa9
> --- /dev/null
> +++ b/drivers/phy/cix/phy-cix-usbdp.h
> @@ -0,0 +1,310 @@

[ ... ]

> +/* gop status address */
> +#define GOP_STATUS_ADDRESS 0x83E05000
> +#define GOP_STATUS_SIZE 0x04
> +
> +struct gop_status {
> +	unsigned char phy_status[4];
> +};
> +
> +/*
> + * 0: usb
> + * 1: 2 lane usb+ 2 lane dp
> + * 2: usb device
> + * 3: usb2.0 + 4 lane dp
> + */
> +enum phy_role {
> +	USB_ROLE_NONE,
> +	USB_ROLE_HOST,
> +	USB_ROLE_DEVICE,
> +	USB_ROLE_HOST_20,
> +};

[Severity: Low]
Are this struct and enum needed? Neither gop_status nor phy_role appear to
be used anywhere in the provided code.

> +
> +#endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903023521.2064=
986-1-hongliang.yang@cixtech.com?part=3D3

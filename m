Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781930;
	b=aOBfjyCuJPtIh+TdcffYJk8ifAUYoVAeUXbjUUdArqYWISfC4u/y4eQsIeMZOVroJO7P
	 lvV/SjDWC9BzMXh94ZrTOThMov+/ZzZDQnfeIuW3TOUI51QP6ke9e99YSzbHsaDMyubjR
	 7kKk6Q6Pbv20qh6ZEkxsfFCJXVFRJbU8c1DzrVIKjQmKTXCg4SkkbOUclqH4pKnRYkKa9
	 S9LZGkG89yEuikVjIJJIbnJCSfUzohewPBPazEEIE7q5ATKrRv5/GRu3Bg6lJRPQRvJCq
	 PTDtRgPuZmM0oPzXhMhil6Z8gQyj6DwTNNmhZm9f4aBzQHMqSnTgRLWO/PFGoZhiIAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781930;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=puUvHIuNc+m12ZNnKVfFfWJVzMO9z+QRM9usR5pbjig=;
	b=LTcNr8IcfUfeZ5pbJCQiVTgiyDWiS7I2pWCja6wm0k6KNbIB61vwMq+Xo7splWa2U4hr
	 y6+aT24ASZJPoAzYKcRtGhogKmn8CKUiDRMYutVcHZW8tTnJmkZRElPOQw464wDEkJalI
	 9bZ9bnGDpUEcg9I81HdRZ/SODAg4K6ZCC6otSMft5+FS32z5MBM8jdlJb9vppnhyqsgIP
	 rhls6y9ILw4XIOXW6FeLaQq1JHXseqA6yL6UlpPLo/JZYkEetlxb5/7EodIy0aSxml+o9
	 Rm47XQ4cvRHWTy66g/IBqR+ROALAsjJlV0wjwJjuxvbe1WXd9Y/i/SypWzAqbE/asbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bo0iWyRZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F900606A687;
	Fri, 27 Nov 2026 12:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bo0iWyRZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DA3B1F00923;
	Fri, 27 Nov 2026 12:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795781929;
	bh=puUvHIuNc+m12ZNnKVfFfWJVzMO9z+QRM9usR5pbjig=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Bo0iWyRZ5VQQDiLjXkKSqoT5DU1HSXbFdBNL9rEyKStCnbDXXg0R17ABK7WhhKex+
	 42d1l1OdR5LoRuzLoXFTeAya4O4z2YkWjUKJ2/yjgtSvtsXTpIkFaM9tSRIqOjvqDs
	 yg4C7fwO6B7bs5hfc5qC1kOXrhT1h8g3Vc3cIoPQDBSX/3AC+n95mM+1s9/iqHae8K
	 hxE9u7JgAcLs7zDUelID5gJvPuEVMrG37s2dOzp6svfI+ymZhkj03QnFajiOcTRKU0
	 aAoLu++tO1zeOzWiGVO/FF/Nqy5RC3tWN+0WZ5CtsrNtofpRhA/B7UWd0EFrb5h8er
	 3IolX07hFajig==
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 4/4] phy: nuvoton: phy-ma35d1-usb2: extend to
 dual-port with OTG support
From: Manivannan Sadhasivam <mani@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261111073137.381966-5-a0987203069@gmail.com>
References: <20261111073137.381966-1-a0987203069@gmail.com>
 <20261111073137.381966-5-a0987203069@gmail.com>
Date: Fri, 27 Nov 2026 17:48:40 +0530
Message-Id: <179578192017.13164.17032072234431650540.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10769; i=mani@kernel.org;
 h=from:subject:message-id; bh=IBZTa+XC0ouZ0HWbXHcNNcIYEsJ+6644p8Yzn8C9+IQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCXUjMRslQYgpAEEJJN9EzdVsTz7kVb6+dve/3
 3jJWXANSVuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawl1IwAKCRBVnxHm/pHO
 9VJBB/4yvRqZ61hvxcusVBoV3jRJVy6qexHVUmwBxg6/KWeKBm/TmQrcvqKH5NT6H7GaP6QvW5z
 jlCgdyKZnukqPYWHubsyG6p/O3FzDHk2roJ8MrXmBesLa5UeWUy/7uLL10jbY21RT+Y3VjWxQmL
 i7WIuaH7DDQ//zfDPQPBmTgu+fyCUrbgKJJHHYh+KNpKpbzc9UfuULGrjF2sQ90zaDvTrrOLUYz
 jqi804ZUjJ3wn/DGWUUgPGSkqnbY3cj3b/N/R0k84a6KXWPm1efBWl4prugcI/uzRwetz/YvNWv
 KAayXGTw5HZFWsvg/NefYxXEqU+skoKbMJTlZGy4CMmpZ13g
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-11 15:31 +0800, Joey Lu wrote:
> PHY0 and PHY1 use the same power-on/reset sequence in USBPMISCR, with
> PHY1 control bits shifted 16 positions relative to PHY0.  A separate
> driver for PHY1 would duplicate this logic, so the existing driver is
> extended to manage both ports.
> 
> The original driver polled only DEVCKSTB after releasing PHY0 from
> reset.  When USB0 operates in host mode (USB ID pin floating or tied
> high) only HSTCKSTB and CK12MSTB assert; DEVCKSTB never sets.  Polling
> exclusively for DEVCKSTB in host mode causes a 1 ms timeout on every
> phy_init() call from the EHCI driver.  The init callback is changed to
> accept either host-mode or device-mode clock stability, whichever
> asserts first.
> 
> The init callback handles PHY reset and clock-stable polling.  The
> power_on and power_off callbacks only gate the HUSBH0_GATE clock shared
> by both ports, so it stays off when neither port is in use.  If a PHY
> already in operation mode does not report stable clocks, it is reset
> before failing.
> 
> A read-only USB role switch is registered for PHY0 to expose the USB0
> role to userspace via the standard role-switch sysfs interface.  The
> .set callback returns -EOPNOTSUPP because the hardware mux is fully
> automatic with no software override path.  When CONFIG_USB_ROLE_SWITCH
> is not enabled, the registration returns -ENODEV and the driver skips
> the role switch gracefully without failing probe.
> 
> Two new optional device-tree properties are implemented:
>   - nuvoton,rcalcode: writes per-port 4-bit resistor calibration trim
>     codes to the RCALCODE field in USBPMISCR.
>   - nuvoton,oc-active-high: sets the UHOVRCURH bit in MISCFCR0 to treat
>     the over-current detect input as active-high.  When absent, the bit
>     is cleared (active-low) regardless of the bootloader setting.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  drivers/phy/nuvoton/Kconfig           |   2 +
>  drivers/phy/nuvoton/phy-ma35d1-usb2.c | 312 ++++++++++++++++++++------
>  2 files changed, 241 insertions(+), 73 deletions(-)
> 
> diff --git a/drivers/phy/nuvoton/Kconfig b/drivers/phy/nuvoton/Kconfig
> index d02cae2db315..573acd03e6c5 100644
> --- a/drivers/phy/nuvoton/Kconfig
> +++ b/drivers/phy/nuvoton/Kconfig
> @@ -6,7 +6,9 @@ config PHY_MA35_USB
>  	tristate "Nuvoton MA35 USB2.0 PHY driver"
>  	depends on ARCH_MA35 || COMPILE_TEST
>  	depends on OF
> +	depends on USB_ROLE_SWITCH || !USB_ROLE_SWITCH
>  	select GENERIC_PHY
> +	select MFD_SYSCON
>  	help
>  	  Enable this to support the USB2.0 PHY on the Nuvoton MA35
>  	  series SoCs.
> diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
> index 0b9976fb15c1..bc706356c434 100644
> --- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
> +++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
> @@ -1,6 +1,12 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright (C) 2024 Nuvoton Technology Corp.
> + * Nuvoton MA35D1 USB 2.0 PHY driver
> + *
> + * Supports PHY0 (USB0 OTG port, shared between DWC2 gadget and EHCI0/OHCI0)
> + * and PHY1 (USB1 host-only port, used by EHCI1/OHCI1). The hardware mux on
> + * PHY0 switches automatically via the USB ID pin.
> + *
> + * Copyright (C) 2024-2026 Nuvoton Technology Corp.

Are you affiliated with Nuvoton? Your email doesn't say so. So you do not have
the authority to change the copyright (not even extend it).

>   */
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
> @@ -12,131 +18,291 @@
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> +#include <linux/usb/role.h>
>  
> -/* USB PHY Miscellaneous Control Register */
> -#define MA35_SYS_REG_USBPMISCR	0x60
> -#define PHY0POR			BIT(0)  /* PHY Power-On Reset Control Bit */
> -#define PHY0SUSPEND			BIT(1)  /* PHY Suspend; 0: suspend, 1: operaion */
> -#define PHY0COMN			BIT(2)  /* PHY Common Block Power-Down Control */
> -#define PHY0DEVCKSTB			BIT(10) /* PHY 60 MHz UTMI clock stable bit */
> +#define MA35_SYS_PWRONOTP		0x04
> +#define PWRONOTP_USBP0ID		BIT(16)
> +
> +#define MA35_SYS_USBPMISCR		0x60
> +#define USBPMISCR_PHY_POR(n)		BIT(0  + (n) * 16)
> +#define USBPMISCR_PHY_SUSPEND(n)	BIT(1  + (n) * 16)
> +#define USBPMISCR_PHY_COMN(n)		BIT(2  + (n) * 16)
> +#define USBPMISCR_PHY_HSTCKSTB(n)	BIT(8  + (n) * 16)
> +#define USBPMISCR_PHY_CK12MSTB(n)	BIT(9  + (n) * 16)
> +#define USBPMISCR_PHY_DEVCKSTB(n)	BIT(10 + (n) * 16)
> +/* Mask for control bits (POR, SUSPEND, COMN) */
> +#define USBPMISCR_PHY_CTL_MASK(n)	(0x7u << ((n) * 16))
> +/* Host-mode ready */
> +#define USBPMISCR_PHY_HOST_READY(n)	(USBPMISCR_PHY_SUSPEND(n)  | \
> +					 USBPMISCR_PHY_HSTCKSTB(n) | \
> +					 USBPMISCR_PHY_CK12MSTB(n))
> +/* Device-mode ready */
> +#define USBPMISCR_PHY_DEV_READY(n)	(USBPMISCR_PHY_SUSPEND(n)  | \
> +					 USBPMISCR_PHY_DEVCKSTB(n))
> +/* RCALCODE: 4-bit resistor trim */
> +#define USBPMISCR_RCAL_SHIFT(n)		(12 + (n) * 16)
> +#define USBPMISCR_RCAL_MASK(n)		GENMASK(USBPMISCR_RCAL_SHIFT(n) + 3, \
> +						USBPMISCR_RCAL_SHIFT(n))
> +
> +#define MA35_SYS_MISCFCR0		0x70
> +/* USB host over-current detect polarity (shared, both ports) */
> +#define MISCFCR0_UHOVRCURH		BIT(12)
> +
> +#define MA35_PHY_NUM			2
> +
> +struct ma35_phy_port {
> +	struct phy *phy;
> +	unsigned int idx;

u32

> +};
>  
>  struct ma35_usb_phy {
> -	struct clk *clk;
>  	struct device *dev;
>  	struct regmap *sysreg;
> +	struct clk *clk;
> +	struct ma35_phy_port port[MA35_PHY_NUM];
> +	struct usb_role_switch *role_sw;
>  };
>  
> -static int ma35_usb_phy_power_on(struct phy *phy)
> +static int ma35_usb_phy_wait_ready(struct ma35_usb_phy *p, unsigned int n,
> +				   unsigned int *val)

u32 instead of 'unsigned int' wherever applicable.

>  {
> -	struct ma35_usb_phy *p_phy = phy_get_drvdata(phy);
> +	if (n == 0)
> +		return regmap_read_poll_timeout(p->sysreg, MA35_SYS_USBPMISCR,
> +						*val,
> +						((*val & USBPMISCR_PHY_HOST_READY(0)) ==
> +						 USBPMISCR_PHY_HOST_READY(0)) ||
> +						((*val & USBPMISCR_PHY_DEV_READY(0)) ==
> +						 USBPMISCR_PHY_DEV_READY(0)),
> +						10, 1000);
> +
> +	return regmap_read_poll_timeout(p->sysreg, MA35_SYS_USBPMISCR, *val,
> +					(*val & USBPMISCR_PHY_HOST_READY(n)) ==
> +					USBPMISCR_PHY_HOST_READY(n),
> +					10, 1000);
> +}
> +
> +static int ma35_usb_phy_init(struct phy *phy)
> +{
> +	struct ma35_phy_port *port = phy_get_drvdata(phy);
> +	struct ma35_usb_phy *p = container_of(port - port->idx,
> +					      struct ma35_usb_phy, port[0]);
> +	unsigned int n = port->idx;
>  	unsigned int val;
>  	int ret;
>  
> -	ret = clk_prepare_enable(p_phy->clk);
> -	if (ret < 0) {
> -		dev_err(p_phy->dev, "Failed to enable PHY clock: %d\n", ret);
> -		return ret;
> -	}
> +	ret = clk_prepare_enable(p->clk);
> +	if (ret)
> +		return dev_err_probe(p->dev, ret, "failed to enable clock\n");

Please do not use dev_err_probe() outside of probe(). It is meant to be used in
probe() where the driver probe can fail with probe deferrals.

>  
> -	regmap_read(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, &val);
> -	if (val & PHY0SUSPEND) {
> -		/*
> -		 * USB PHY0 is in operation mode already
> -		 * make sure USB PHY 60 MHz UTMI Interface Clock ready
> -		 */
> -		ret = regmap_read_poll_timeout(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, val,
> -						val & PHY0DEVCKSTB, 10, 1000);
> -		if (ret == 0)
> -			return 0;
> -	}
> +	regmap_read(p->sysreg, MA35_SYS_USBPMISCR, &val);
>  
> -	/*
> -	 * reset USB PHY0.
> -	 * wait until USB PHY0 60 MHz UTMI Interface Clock ready
> -	 */
> -	regmap_update_bits(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, 0x7, (PHY0POR | PHY0SUSPEND));
> +	if ((val & USBPMISCR_PHY_SUSPEND(n)) &&
> +	    !ma35_usb_phy_wait_ready(p, n, &val))
> +		goto out;
> +
> +	regmap_update_bits(p->sysreg, MA35_SYS_USBPMISCR,
> +			   USBPMISCR_PHY_CTL_MASK(n),
> +			   USBPMISCR_PHY_POR(n) | USBPMISCR_PHY_SUSPEND(n));
>  	udelay(20);
>  
> -	/* make USB PHY0 enter operation mode */
> -	regmap_update_bits(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, 0x7, PHY0SUSPEND);
> +	regmap_update_bits(p->sysreg, MA35_SYS_USBPMISCR,
> +			   USBPMISCR_PHY_CTL_MASK(n),
> +			   USBPMISCR_PHY_SUSPEND(n));
>  
> -	/* make sure USB PHY 60 MHz UTMI Interface Clock ready */
> -	ret = regmap_read_poll_timeout(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, val,
> -					val & PHY0DEVCKSTB, 10, 1000);
> -	if (ret == -ETIMEDOUT) {
> -		dev_err(p_phy->dev, "Check PHY clock, Timeout: %d\n", ret);
> -		clk_disable_unprepare(p_phy->clk);
> -		return ret;
> -	}
> +	ret = ma35_usb_phy_wait_ready(p, n, &val);
> +	if (ret)
> +		dev_err(p->dev, "USB PHY%u clock not stable (USBPMISCR=0x%08x)\n",
> +			n, val);
> +out:
> +	clk_disable_unprepare(p->clk);
> +	return ret;
> +}
>  
> -	return 0;
> +static int ma35_usb_phy_power_on(struct phy *phy)
> +{
> +	struct ma35_phy_port *port = phy_get_drvdata(phy);
> +	struct ma35_usb_phy *p = container_of(port - port->idx,
> +					      struct ma35_usb_phy, port[0]);
> +
> +	return clk_prepare_enable(p->clk);
>  }
>  
>  static int ma35_usb_phy_power_off(struct phy *phy)
>  {
> -	struct ma35_usb_phy *p_phy = phy_get_drvdata(phy);
> +	struct ma35_phy_port *port = phy_get_drvdata(phy);
> +	struct ma35_usb_phy *p = container_of(port - port->idx,
> +					      struct ma35_usb_phy, port[0]);
>  
> -	clk_disable_unprepare(p_phy->clk);
> +	clk_disable_unprepare(p->clk);
>  	return 0;
>  }
>  
>  static const struct phy_ops ma35_usb_phy_ops = {
> -	.power_on = ma35_usb_phy_power_on,
> -	.power_off = ma35_usb_phy_power_off,
> -	.owner = THIS_MODULE,
> +	.init		= ma35_usb_phy_init,
> +	.power_on	= ma35_usb_phy_power_on,
> +	.power_off	= ma35_usb_phy_power_off,
> +	.owner		= THIS_MODULE,

Just keep a single space before =

>  };
>  

[...]

> +static void ma35_usb_phy_remove(struct platform_device *pdev)
> +{
> +	struct ma35_usb_phy *p = platform_get_drvdata(pdev);
> +
> +	ma35_role_switch_exit(p);
> +}
> +
>  static const struct of_device_id ma35_usb_phy_of_match[] = {
> -	{ .compatible = "nuvoton,ma35d1-usb2-phy", },
> -	{ },
> +	{ .compatible = "nuvoton,ma35d1-usb2-phy" },
> +	{ /* sentinel */ }

Not necessary.

>  };
>  MODULE_DEVICE_TABLE(of, ma35_usb_phy_of_match);
>  
>  static struct platform_driver ma35_usb_phy_driver = {
>  	.probe		= ma35_usb_phy_probe,
> -	.driver	= {
> -		.name	= "ma35d1-usb2-phy",
> -		.of_match_table = ma35_usb_phy_of_match,
> +	.remove		= ma35_usb_phy_remove,
> +	.driver		= {

I'd argue that you should just leave a single space before =.

- Mani



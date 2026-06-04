Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5F230C63A
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 21:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780610340; cv=pass; b=RNpY6BjMSNAPa6tsjoXVAgfRP6fqImYraLWygHhCX101iNuIx1zLYqFAiQ2HheWlREDiR81+iswbZuij6HlrpUB+QZOZgNzBbcSF5fai3+zBIuB3p904YbqeXDzDZiLsuAllqCTVPRnga2uzQPwqr1kQPs8LAFACHSuIg+cHu6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780610340; c=relaxed/simple;
	bh=3HhYyzASvhfaaIRGRZEchp5ki+KRFzRsP5/TPXQ4Edw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOCROdSe7vgPKnfAHZD7Ro/ZkIY1ORCjZ3fy72Rx5JF/6sC913Jpu71Bak1RwDi2aP9yV8c4r/HUJYFZ4RMEHp3WwW7Sse72ozroYFh7Yr3sxsrd619wAymkj2K60B+VLZ1/DxuRJ6+OXRJszUtG/3DTKCuFAIYIGS4yTv9K2Js=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=BuuOSuIX; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="BuuOSuIX"
ARC-Seal: i=1; a=rsa-sha256; t=1780610299; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E3BhF6F8mwAdNY3syhbiAv2fjb9hQsuAEYSiqB2On5KteWuYWs9W1T+HzyqZBdHNqBh5Q57KIzTzz78V6Vvx8Y8zb2FTHsjXCOqDv1QGzd2ovmOcomaFNPLmNJgPxbF5e5PM2ddUVTM8PQkSo6Yi5UNX8KcYU+6oPOGoUJEggMA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780610299; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=D3jiqikRj+7VQpigLGZ5IRUdsQKnb8Ib5bNktfo2jQc=; 
	b=f4jzDPQ3qYSEipf5qtb6foKwfZHkEE7r/2BmeUMdK2L/b/ICEJKrjZSXZnascAE7DIk03r1Drqc5ks51NTjNpihWpnEAZEyqM/C8+vvZG26123kwllfimnrZMhh0yiXj6L0xW3o99QNjC3lNLh1BX0OxZ1HmLNTnqC7dfgcNoAM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780610299;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=D3jiqikRj+7VQpigLGZ5IRUdsQKnb8Ib5bNktfo2jQc=;
	b=BuuOSuIXhghhiPj1S/2yLmsx7L9T9IF0USbIbjt3EvsC1xd8XqXKn8tijFKonusD
	XvC5iEHn2hhlMux6e6sdCq4frBLGJoQJye1HCPIGWrLLkGlIASbIwd2Mz9sjUNeOqGC
	A1pmHmq+VY/dtSYEkCyY3j9FKq1cOBEyfh11uVI8=
Received: by mx.zohomail.com with SMTPS id 1780610298361673.0509212846841;
	Thu, 4 Jun 2026 14:58:18 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 6B3FB183856; Thu, 04 Jun 2026 23:58:12 +0200 (CEST)
Date: Thu, 4 Jun 2026 23:58:12 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	xsf@rock-chips.com, simona@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de, 
	mripard@kernel.org, maarten.lankhorst@linux.intel.com, jesszhan0024@gmail.com, 
	neil.armstrong@linaro.org, heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V4 2/6] power: supply: sgm41542: Add SG Micro sgm41542
 charger
Message-ID: <aiHgeP2mCISWLliq@venus>
References: <20260602212512.418166-1-macroalpha82@gmail.com>
 <20260602212512.418166-3-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dy2ov5ubgjsceoib"
Content-Disposition: inline
In-Reply-To: <20260602212512.418166-3-macroalpha82@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.2.1.5.2/280.604.68
X-ZohoMailClient: External


--dy2ov5ubgjsceoib
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V4 2/6] power: supply: sgm41542: Add SG Micro sgm41542
 charger
MIME-Version: 1.0

Hi,

On Tue, Jun 02, 2026 at 04:25:08PM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add support for the SG Micro SGM41542 charger/boost converter.
> Driver was adapted from Rockchip BSP driver [1] and confirmed
> with vendor datasheet [2].
>=20
> [1] https://github.com/rockchip-linux/kernel/blob/develop-6.6/drivers/pow=
er/supply/sgm41542_charger.c
> [2] https://www.sg-micro.de/rect/assets/1e8de70b-657e-4156-be68-a64fdbe8e=
418/SGM41541_SGM41542.pdf
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---

This looks mostly okay, but I have a few comments; please find them
inline.

>  drivers/power/supply/Kconfig            |    8 +
>  drivers/power/supply/Makefile           |    1 +
>  drivers/power/supply/sgm41542_charger.c | 1065 +++++++++++++++++++++++
>  3 files changed, 1074 insertions(+)
>  create mode 100644 drivers/power/supply/sgm41542_charger.c
>=20
> diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
> index 83392ed6a8da..57dae0913472 100644
> --- a/drivers/power/supply/Kconfig
> +++ b/drivers/power/supply/Kconfig
> @@ -856,6 +856,14 @@ config CHARGER_RK817
>  	help
>  	  Say Y to include support for Rockchip RK817 Battery Charger.
> =20
> +config CHARGER_SGM41542
> +	tristate "SGM41542 charger driver"
> +	depends on I2C
> +	depends on GPIOLIB || COMPILE_TEST
> +	select REGMAP_I2C
> +	help
> +	  Say Y to enable support for the SGM41542 battery charger.
> +
>  config CHARGER_SMB347
>  	tristate "Summit Microelectronics SMB3XX Battery Charger"
>  	depends on I2C
> diff --git a/drivers/power/supply/Makefile b/drivers/power/supply/Makefile
> index 7ee839dca7f3..c376889db317 100644
> --- a/drivers/power/supply/Makefile
> +++ b/drivers/power/supply/Makefile
> @@ -107,6 +107,7 @@ obj-$(CONFIG_CHARGER_BQ25890)	+=3D bq25890_charger.o
>  obj-$(CONFIG_CHARGER_BQ25980)	+=3D bq25980_charger.o
>  obj-$(CONFIG_CHARGER_BQ256XX)	+=3D bq256xx_charger.o
>  obj-$(CONFIG_CHARGER_RK817)	+=3D rk817_charger.o
> +obj-$(CONFIG_CHARGER_SGM41542)	+=3D sgm41542_charger.o
>  obj-$(CONFIG_CHARGER_SMB347)	+=3D smb347-charger.o
>  obj-$(CONFIG_CHARGER_TPS65090)	+=3D tps65090-charger.o
>  obj-$(CONFIG_CHARGER_TPS65217)	+=3D tps65217_charger.o
> diff --git a/drivers/power/supply/sgm41542_charger.c b/drivers/power/supp=
ly/sgm41542_charger.c
> new file mode 100644
> index 000000000000..334767df3d9e
> --- /dev/null
> +++ b/drivers/power/supply/sgm41542_charger.c
> @@ -0,0 +1,1065 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Chrager driver for Sgm4154x

Charger

> + *
> + * Copyright (c) 2026 Rockchip Electronics Co., Ltd.
> + *
> + * Author: Xu Shengfei <xsf@rock-chips.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/power_supply.h>

#include <linux/property.h>

> +#include <linux/regmap.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/of_regulator.h>
> +#include <linux/regulator/machine.h>

machine.h?

> +#include <linux/types.h>
> +
> +#define SGM4154X_MANUFACTURER			"SGMICRO"
> +#define SGM4154X_NAME				"sgm41542"
> +
> +#define SGM4154X_CHRG_CTRL_0			0x00
> +#define SGM4154X_HIZ_EN				BIT(7)
> +#define SGM4154X_IINDPM_I_MASK			GENMASK(4, 0)
> +#define SGM4154X_IINDPM_I_MIN_UA		100000
> +#define SGM4154X_IINDPM_I_MAX_UA		3800000
> +#define SGM4154X_IINDPM_STEP_UA			100000
> +#define SGM4154X_IINDPM_DEF_UA			2400000
> +
> +#define SGM4154X_CHRG_CTRL_1			0x01
> +#define SGM4154X_WDT_RST			BIT(6)
> +#define SGM4154X_OTG_EN				BIT(5)
> +#define SGM4154X_CHRG_EN			BIT(4)
> +
> +#define SGM4154X_CHRG_CTRL_2			0x02
> +#define SGM4154X_BOOST_LIM			BIT(7)
> +#define SGM4154X_ICHRG_CUR_MASK			GENMASK(5, 0)
> +#define SGM4154X_ICHRG_I_STEP_UA		60000
> +#define SGM4154X_ICHRG_I_MIN_UA			0
> +#define SGM4154X_ICHRG_I_MAX_UA			3780000
> +#define SGM4154X_ICHRG_I_DEF_UA			2040000
> +
> +#define SGM4154X_CHRG_CTRL_3			0x03
> +#define SGM4154X_PRECHRG_CUR_MASK		GENMASK(7, 4)
> +#define SGM4154X_PRECHRG_CURRENT_STEP_UA	60000
> +#define SGM4154X_PRECHRG_I_MIN_UA		60000
> +#define SGM4154X_PRECHRG_I_MAX_UA		780000
> +#define SGM4154X_PRECHRG_I_DEF_UA		180000
> +#define SGM4154X_TERMCHRG_CUR_MASK		GENMASK(3, 0)
> +#define SGM4154X_TERMCHRG_CURRENT_STEP_UA	60000
> +#define SGM4154X_TERMCHRG_I_MIN_UA		60000
> +#define SGM4154X_TERMCHRG_I_MAX_UA		960000
> +#define SGM4154X_TERMCHRG_I_DEF_UA		180000
> +
> +#define SGM4154X_CHRG_CTRL_4			0x04
> +#define SGM4154X_VREG_V_MASK			GENMASK(7, 3)
> +#define SGM4154X_VREG_V_MAX_UV			4624000
> +#define SGM4154X_VREG_V_MIN_UV			3856000
> +#define SGM4154X_VREG_V_DEF_UV			4208000
> +#define SGM4154X_VREG_V_STEP_UV			32000
> +#define SGM4154X_VRECHARGE			BIT(0)
> +#define SGM4154X_VRECHRG_STEP_MV		100
> +#define SGM4154X_VRECHRG_OFFSET_MV		100
> +
> +#define SGM4154X_CHRG_CTRL_5			0x05
> +#define SGM4154X_TERM_EN			BIT(7)
> +#define SGM4154X_WDT_TIMER_MASK			GENMASK(5, 4)
> +#define SGM4154X_WDT_TIMER_40S			BIT(4)
> +#define SGM4154X_WDT_TIMER_80S			BIT(5)
> +#define SGM4154X_WDT_TIMER_160S			(BIT(4) | BIT(5))
> +#define SGM4154X_WDT_TIMER_DISABLE		0
> +
> +#define SGM4154X_CHRG_CTRL_6			0x06
> +#define SGM4154X_VAC_OVP_MASK			GENMASK(7, 6)
> +#define SGM4154X_OVP_14V			(BIT(7) | BIT(6))
> +#define SGM4154X_OVP_10_5V			BIT(7)
> +#define SGM4154X_OVP_6_5V			BIT(6)
> +#define SGM4154X_OVP_5_5V			0
> +#define SGM4154X_OVP_DEFAULT			SGM4154X_OVP_14V
> +#define SGM4154X_BOOSTV				GENMASK(5, 4)
> +#define SGM4154X_VINDPM_V_MASK			GENMASK(3, 0)
> +#define SGM4154X_VINDPM_V_MIN_UV		3900000
> +#define SGM4154X_VINDPM_V_MAX_UV		12000000
> +#define SGM4154X_VINDPM_STEP_UV			100000
> +#define SGM4154X_VINDPM_DEF_UV			4500000
> +
> +#define SGM4154X_CHRG_CTRL_7			0x07
> +
> +#define SGM4154X_CHRG_STAT		0x08
> +#define SGM4154X_VBUS_STAT_MASK		GENMASK(7, 5)
> +#define SGM4154X_OTG_MODE		(BIT(7) | BIT(6) | BIT(5))
> +#define SGM4154X_NON_STANDARD		(BIT(7) | BIT(6))
> +#define SGM4154X_UNKNOWN		(BIT(7) | BIT(5))
> +#define SGM4154X_USB_DCP		(BIT(6) | BIT(5))
> +#define SGM4154X_USB_CDP		BIT(6)
> +#define SGM4154X_USB_SDP		BIT(5)
> +#define SGM4154X_NOT_CHRGING		0
> +#define SGM4154X_CHG_STAT_MASK		GENMASK(4, 3)
> +#define SGM4154X_TERM_CHRG		(BIT(4) | BIT(3))
> +#define SGM4154X_FAST_CHRG		BIT(4)
> +#define SGM4154X_PRECHRG		BIT(3)
> +#define SGM4154X_PG_STAT		BIT(2)
> +#define SGM4154X_THERM_STAT		BIT(1)
> +#define SGM4154X_VSYS_STAT		BIT(0)
> +
> +#define SGM4154X_CHRG_FAULT		0x09
> +#define SGM4154X_TEMP_MASK		GENMASK(2, 0)
> +#define SGM4154X_TEMP_HOT		(BIT(2) | BIT(1))
> +#define SGM4154X_TEMP_COLD		(BIT(2) | BIT(0))
> +#define SGM4154X_TEMP_COOL		(BIT(1) | BIT(0))
> +#define SGM4154X_TEMP_WARM		BIT(1)
> +#define SGM4154X_TEMP_NORMAL		BIT(0)
> +
> +#define SGM4154X_CHRG_CTRL_A		0x0a
> +#define SGM4154X_VBUS_GOOD		BIT(7)
> +#define SGM4154X_VINDPM_INT_MASK	BIT(1)
> +#define SGM4154X_IINDPM_INT_MASK	BIT(0)
> +
> +#define SGM4154X_CHRG_CTRL_B		0x0b
> +#define SGM4154X_PN_ID			(BIT(6) | BIT(5) | BIT(3))
> +#define SGM4154X_PN_MASK		GENMASK(6, 3)
> +
> +#define SGM4154X_CHRG_CTRL_C		0x0c
> +
> +#define SGM4154X_CHRG_CTRL_D		0x0d
> +#define SGM4154X_JEITA_EN		BIT(0)
> +
> +#define SGM4154X_INPUT_DET		0x0e
> +#define SGM4154X_DPDM_ONGOING		BIT(7)
> +
> +#define SGM4154X_CHRG_CTRL_F		0x0f
> +#define SGM4154X_VINDPM_OS_MASK	 GENMASK(1, 0)
> +
> +#define SGM4154X_DEFAULT_INPUT_CUR	(500 * 1000)
> +
> +struct sgm4154x_init_data {
> +	int ilim;	/* input current limit */
> +	int vlim;	/* minimum system voltage limit */
> +	int iterm;	/* termination current */
> +	int iprechg;	/* precharge current */
> +	int max_ichg;	/* maximum charge current */
> +	int max_vreg;	/* maximum charge voltage */
> +};
> +
> +struct sgm4154x_state {
> +	bool vsys_stat;
> +	bool therm_stat;
> +	bool online;
> +	u8 chrg_stat;
> +	bool chrg_en;
> +	bool vbus_gd;
> +	u8 chrg_type;
> +	u8 health;
> +	u8 chrg_fault;
> +	u8 ntc_fault;
> +};
> +
> +struct sgm4154x_device {
> +	struct i2c_client *client;
> +	struct device *dev;
> +	struct power_supply *charger;
> +	struct regmap *regmap;
> +	char model_name[I2C_NAME_SIZE];
> +	struct sgm4154x_init_data init_data;
> +	struct sgm4154x_state state;
> +	struct regulator_dev *otg_rdev;
> +	bool watchdog_enable;
> +	struct workqueue_struct *sgm_monitor_wq;
> +	struct delayed_work sgm_delay_work;
> +};
> +
> +enum SGM4154X_VINDPM_OS {
> +	VINDPM_OS_3900MV,
> +	VINDPM_OS_5900MV,
> +	VINDPM_OS_7500MV,
> +	VINDPM_OS_10500MV,
> +};
> +
> +static int sgm4154x_set_term_curr(struct sgm4154x_device *sgm, int cur_u=
a)
> +{
> +	int reg_val;
> +	int ret;
> +
> +	cur_ua =3D clamp(cur_ua, SGM4154X_TERMCHRG_I_MIN_UA, SGM4154X_TERMCHRG_=
I_MAX_UA);
> +	reg_val =3D (cur_ua - SGM4154X_TERMCHRG_I_MIN_UA) / SGM4154X_TERMCHRG_C=
URRENT_STEP_UA;
> +
> +	ret =3D regmap_update_bits(sgm->regmap,
> +				 SGM4154X_CHRG_CTRL_3,
> +				 SGM4154X_TERMCHRG_CUR_MASK,
> +				 reg_val);
> +	if (ret)
> +		dev_err(sgm->dev, "set term current error!\n");
> +
> +	return ret;
> +}
> +
> +static int sgm4154x_set_prechrg_curr(struct sgm4154x_device *sgm, int cu=
r_ua)
> +{
> +	int reg_val;
> +	int ret;
> +
> +	cur_ua =3D clamp(cur_ua, SGM4154X_PRECHRG_I_MIN_UA, SGM4154X_PRECHRG_I_=
MAX_UA);
> +	reg_val =3D (cur_ua - SGM4154X_PRECHRG_I_MIN_UA) / SGM4154X_PRECHRG_CUR=
RENT_STEP_UA;
> +
> +	reg_val =3D reg_val << 4;

FIELD_PREP(SGM4154X_PRECHRG_CUR_MASK, reg_val);

> +	ret =3D regmap_update_bits(sgm->regmap,
> +				 SGM4154X_CHRG_CTRL_3,
> +				 SGM4154X_PRECHRG_CUR_MASK,
> +				 reg_val);
> +	if (ret)
> +		dev_err(sgm->dev, "set precharge current error!\n");
> +
> +	return ret;
> +}
> +
> +static int sgm4154x_set_ichrg_curr(struct sgm4154x_device *sgm, int cur_=
ua)
> +{
> +	int reg_val;
> +	int ret;
> +
> +	cur_ua =3D clamp(cur_ua, SGM4154X_ICHRG_I_MIN_UA, SGM4154X_ICHRG_I_MAX_=
UA);
> +	reg_val =3D cur_ua / SGM4154X_ICHRG_I_STEP_UA;
> +
> +	ret =3D regmap_update_bits(sgm->regmap,
> +				 SGM4154X_CHRG_CTRL_2,
> +				 SGM4154X_ICHRG_CUR_MASK,
> +				 reg_val);
> +	if (ret)
> +		dev_err(sgm->dev, "set icharge current error!\n");
> +
> +	return ret;
> +}
> +
> +static int sgm4154x_get_ichrg_curr(struct sgm4154x_device *sgm)
> +{
> +	u32 reg;
> +	int ret, val;
> +
> +	ret =3D regmap_read(sgm->regmap, SGM4154X_CHRG_CTRL_2, &reg);
> +	if (ret) {
> +		dev_err(sgm->dev, "get charge current error!\n");
> +		return ret;
> +	}
> +
> +	val =3D FIELD_GET(SGM4154X_ICHRG_CUR_MASK, reg);
> +
> +	return val * SGM4154X_ICHRG_I_STEP_UA;
> +}
> +
> +static int sgm4154x_set_chrg_volt(struct sgm4154x_device *sgm, int chrg_=
volt)
> +{
> +	int reg_val;
> +	int ret;
> +
> +	/*
> +	 * Note that the value of 0x01111 represents a "special value"
> +	 * corresponding to 4352000uV instead of the expected 4336000uV,
> +	 * per the datasheet. All other values are as expected. So not
> +	 * only do we need to clamp between max and min values, but
> +	 * also clamp anything below 4352000uv to 4304000uv to prevent
> +	 * overcharging.
> +	 */
> +	if (chrg_volt < 4352000)
> +		chrg_volt =3D clamp(chrg_volt, SGM4154X_VREG_V_MIN_UV, 4304000);
> +	chrg_volt =3D clamp(chrg_volt, SGM4154X_VREG_V_MIN_UV, sgm->init_data.m=
ax_vreg);
> +	reg_val =3D (chrg_volt - SGM4154X_VREG_V_MIN_UV) / SGM4154X_VREG_V_STEP=
_UV;
> +	reg_val =3D reg_val << 3;

FIELD_PREP

> +	ret =3D regmap_update_bits(sgm->regmap,
> +				 SGM4154X_CHRG_CTRL_4,
> +				 SGM4154X_VREG_V_MASK,
> +				 reg_val);
> +	if (ret)
> +		dev_err(sgm->dev, "set charge voltage error!\n");
> +
> +	return ret;
> +}
> +
> +static int sgm4154x_get_chrg_volt(struct sgm4154x_device *sgm)
> +{
> +	u32 reg;
> +	int ret, val;
> +
> +	ret =3D regmap_read(sgm->regmap, SGM4154X_CHRG_CTRL_4, &reg);
> +	if (ret) {
> +		dev_err(sgm->dev, "get charge voltage error!\n");
> +		return ret;
> +	}
> +
> +	val =3D FIELD_GET(SGM4154X_VREG_V_MASK, reg);
> +
> +	/*
> +	 * 0x01111 is a special value meaning 4352000uV, all other
> +	 * values are as expected based on the offset and step values.
> +	 */
> +	if (val =3D=3D 0x0f)
> +		return 4352000;
> +
> +	return val * SGM4154X_VREG_V_STEP_UV + SGM4154X_VREG_V_MIN_UV;
> +}
> +
> +static int sgm4154x_set_input_volt_lim(struct sgm4154x_device *sgm,
> +				       unsigned int vindpm)
> +{
> +	enum SGM4154X_VINDPM_OS os_val;
> +	unsigned int offset;
> +	u8 reg_val;
> +	int ret;
> +
> +
> +	if (vindpm < SGM4154X_VINDPM_V_MIN_UV ||
> +	    vindpm > SGM4154X_VINDPM_V_MAX_UV) {
> +		dev_err(sgm->dev, "input voltage limit %u outside range\n", vindpm);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Supported ranges per the datasheet are as follows:
> +	 * 3.9v - 5.4v with a 3.9v offset
> +	 * 5.9v - 7.4v with a 5.9v offset
> +	 * 7.5v - 9.0v with a 7.5v offset
> +	 * 10.5v - 12.0v with a 10.5v offset
> +	 * Step size is a constant 100mv
> +	 */
> +	if (vindpm < 5900000) {
> +		vindpm =3D clamp(vindpm, VINDPM_OS_3900MV, 5400000);

As far as I can tell the lower clamp value is wrong here
and in the following else branches. I doubt you want the
enum values.

> +		os_val =3D VINDPM_OS_3900MV;
> +		offset =3D 3900000;
> +	} else if (vindpm >=3D 5900000 && vindpm < 7500000) {

You can drop the "vindpm >=3D 5900000 &&", that already covered
by the previous if.

> +		vindpm =3D clamp(vindpm, VINDPM_OS_5900MV, 7400000);
> +		os_val =3D VINDPM_OS_5900MV;
> +		offset =3D 5900000;
> +	} else if (vindpm >=3D 7500000 && vindpm < 10500000) {
> +		vindpm =3D clamp(vindpm, VINDPM_OS_7500MV, 9000000);
> +		os_val =3D VINDPM_OS_7500MV;
> +		offset =3D 7500000;
> +	} else {
> +		vindpm =3D clamp(vindpm, VINDPM_OS_10500MV, 12000000);
> +		os_val =3D VINDPM_OS_10500MV;
> +		offset =3D 10500000;
> +	}
> +
> +	ret =3D regmap_update_bits(sgm->regmap,
> +				 SGM4154X_CHRG_CTRL_F,
> +				 SGM4154X_VINDPM_OS_MASK,
> +				 os_val);
> +	if (ret) {
> +		dev_err(sgm->dev, "set vin dpm error!\n");
> +		return ret;
> +	}
> +
> +	reg_val =3D (vindpm - offset) / SGM4154X_VINDPM_STEP_UV;
> +
> +	ret =3D regmap_update_bits(sgm->regmap, SGM4154X_CHRG_CTRL_6,
> +				 SGM4154X_VINDPM_V_MASK, reg_val);
> +	if (ret)
> +		dev_err(sgm->dev, "input voltage error!\n");
> +
> +	return ret;
> +}
> +
> +static int sgm4154x_set_input_curr_lim(struct sgm4154x_device *sgm, int =
iindpm)
> +{
> +	int reg_val;
> +	int ret;
> +
> +	if (iindpm < SGM4154X_IINDPM_I_MIN_UA)
> +		return -EINVAL;
> +
> +	/*
> +	 * Per the datasheet, values between 100000uA and 3100000uA work
> +	 * as expected with the register defined as having a step of
> +	 * 100000 and a min/max of 100000 (0x00) through 3100000 (0x1e).
> +	 * The register value of 0x1f however corresponds to 3800000uA not
> +	 * 3200000uA as one would expect.
> +	 */
> +	if ((iindpm > SGM4154X_IINDPM_I_MAX_UA) || (iindpm > sgm->init_data.ili=
m))
> +		iindpm =3D min(SGM4154X_IINDPM_I_MAX_UA, sgm->init_data.ilim);
> +
> +	if (iindpm > 3100000 && iindpm < SGM4154X_IINDPM_I_MAX_UA)
> +		iindpm =3D 3100000;
> +
> +	if (iindpm =3D=3D SGM4154X_IINDPM_I_MAX_UA)
> +		reg_val =3D 0x1f;
> +	else
> +		reg_val =3D (iindpm - SGM4154X_IINDPM_I_MIN_UA) / SGM4154X_IINDPM_STEP=
_UA;
> +
> +	ret =3D regmap_update_bits(sgm->regmap,
> +				 SGM4154X_CHRG_CTRL_0,
> +				 SGM4154X_IINDPM_I_MASK,
> +				 reg_val);
> +	if (ret)
> +		dev_err(sgm->dev, "set input current limit error!\n");
> +
> +	return ret;
> +}
> +
> +static int sgm4154x_get_input_curr_lim(struct sgm4154x_device *sgm)
> +{
> +	int ret;
> +	int ilim;
> +
> +	ret =3D regmap_read(sgm->regmap, SGM4154X_CHRG_CTRL_0, &ilim);
> +	if (ret) {
> +		dev_err(sgm->dev, "get input current limit error!\n");
> +		return ret;
> +	}

ilim &=3D SGM4154X_IINDPM_I_MASK;

Then you can just use ilim in the following code.

> +	/* Max value is not 3200000uA as expected but is 3800000uA */
> +	if (SGM4154X_IINDPM_I_MASK =3D=3D (ilim & SGM4154X_IINDPM_I_MASK))
> +		return SGM4154X_IINDPM_I_MAX_UA;
> +
> +	ilim =3D (ilim & SGM4154X_IINDPM_I_MASK) * SGM4154X_IINDPM_STEP_UA + SG=
M4154X_IINDPM_I_MIN_UA;
> +
> +	return ilim;
> +}
> +
> +static int sgm4154x_watchdog_timer_reset(struct sgm4154x_device *sgm)
> +{
> +	int ret;
> +
> +	ret =3D regmap_update_bits(sgm->regmap,
> +				 SGM4154X_CHRG_CTRL_1,
> +				 SGM4154X_WDT_RST,
> +				 SGM4154X_WDT_RST);
> +
> +	if (ret)
> +		dev_err(sgm->dev, "set watchdog timer error!\n");
> +
> +	return ret;
> +}
> +
> +static int sgm4154x_set_watchdog_timer(struct sgm4154x_device *sgm, int =
time)
> +{
> +	u8 reg_val;
> +	int ret;
> +
> +	if (time =3D=3D 0)
> +		reg_val =3D SGM4154X_WDT_TIMER_DISABLE;
> +	else if (time =3D=3D 40)
> +		reg_val =3D SGM4154X_WDT_TIMER_40S;
> +	else if (time =3D=3D 80)
> +		reg_val =3D SGM4154X_WDT_TIMER_80S;
> +	else
> +		reg_val =3D SGM4154X_WDT_TIMER_160S;

enum sgm4154x_wdt_timer {
    SGM4154X_WDT_TIMER_DISABLE =3D 0,
    SGM4154X_WDT_TIMER_40S =3D 1,
    SGM4154X_WDT_TIMER_80S =3D 2,
    SGM4154X_WDT_TIMER_160S =3D 3,
};

static int sgm4154x_set_watchdog_timer(struct sgm4154x_device *sgm, enum sg=
m4154x_wdt_timer time) {
    ...
    reg_val =3D FIELD_PREP(SGM4154X_WDT_TIMER_MASK, time);
    ...

This is less code, easier to read and also fixes the bug you have
down below, where the function is already called with
SGM4154X_WDT_TIMER_40S as argument, which right now would result in
160 seconds being configured...

> +	ret =3D regmap_update_bits(sgm->regmap,
> +				 SGM4154X_CHRG_CTRL_5,
> +				 SGM4154X_WDT_TIMER_MASK,
> +				 reg_val);
> +
> +	if (ret) {
> +		dev_err(sgm->dev, "set watchdog timer error!\n");
> +		return ret;
> +	}
> +
> +	if (time) {
> +		if (!sgm->watchdog_enable)
> +			queue_delayed_work(sgm->sgm_monitor_wq,
> +					   &sgm->sgm_delay_work,
> +					   msecs_to_jiffies(1000 * 5));
> +		sgm->watchdog_enable =3D true;
> +	} else {
> +		sgm->watchdog_enable =3D false;
> +		sgm4154x_watchdog_timer_reset(sgm);
> +	}
> +
> +	return ret;
> +}
> +
> +static int sgm4154x_enable_charger(struct sgm4154x_device *sgm)
> +{
> +	int ret;
> +
> +	ret =3D regmap_update_bits(sgm->regmap,
> +				 SGM4154X_CHRG_CTRL_1,
> +				 SGM4154X_CHRG_EN,
> +				 SGM4154X_CHRG_EN);
> +	if (ret)
> +		dev_err(sgm->dev, "enable charger error!\n");
> +
> +	return ret;
> +}
> +
> +static int sgm4154x_disable_charger(struct sgm4154x_device *sgm)
> +{
> +	int ret;
> +
> +	ret =3D regmap_update_bits(sgm->regmap,
> +				 SGM4154X_CHRG_CTRL_1,
> +				 SGM4154X_CHRG_EN,
> +				 0);
> +	if (ret)
> +		dev_err(sgm->dev, "disable charger error!\n");
> +
> +	return ret;
> +}
> +
> +static int sgm4154x_set_vac_ovp(struct sgm4154x_device *sgm)
> +{
> +	int reg_val;
> +	int ret;
> +
> +	reg_val =3D SGM4154X_OVP_DEFAULT & SGM4154X_VAC_OVP_MASK;
> +
> +	ret =3D regmap_update_bits(sgm->regmap,
> +				 SGM4154X_CHRG_CTRL_6,
> +				 SGM4154X_VAC_OVP_MASK,
> +				 reg_val);
> +	if (ret)
> +		dev_err(sgm->dev, "set vac ovp error!\n");
> +
> +	return ret;
> +}
> +
> +static int sgm4154x_set_recharge_volt(struct sgm4154x_device *sgm, int r=
echarge_volt)
> +{
> +	int reg_val;
> +	int ret;
> +
> +	reg_val =3D (recharge_volt - SGM4154X_VRECHRG_OFFSET_MV) / SGM4154X_VRE=
CHRG_STEP_MV;

I think it makes sense to convert the function to microvolt to be
consistent.

> +	ret =3D regmap_update_bits(sgm->regmap,
> +				 SGM4154X_CHRG_CTRL_4,
> +				 SGM4154X_VRECHARGE,
> +				 reg_val);
> +	if (ret)
> +		dev_err(sgm->dev, "set recharger error!\n");
> +
> +	return ret;
> +}
> +
> +static int sgm4154x_get_state(struct sgm4154x_device *sgm,
> +			      struct sgm4154x_state *state)
> +{
> +	int reg, ret;
> +
> +	ret =3D regmap_read(sgm->regmap, SGM4154X_CHRG_STAT, &reg);
> +	if (ret) {
> +		dev_err(sgm->dev, "read SGM4154X_CHRG_STAT fail\n");
> +		return ret;
> +	}
> +	state->chrg_type =3D reg & SGM4154X_VBUS_STAT_MASK;
> +	state->chrg_stat =3D reg & SGM4154X_CHG_STAT_MASK;
> +	state->online =3D !!(reg & SGM4154X_PG_STAT);
> +	state->therm_stat =3D !!(reg & SGM4154X_THERM_STAT);
> +	state->vsys_stat =3D !!(reg & SGM4154X_VSYS_STAT);
> +
> +	ret =3D regmap_read(sgm->regmap, SGM4154X_CHRG_FAULT, &reg);
> +	if (ret) {
> +		dev_err(sgm->dev, "read SGM4154X_CHRG_FAULT fail\n");
> +		return ret;
> +	}
> +	state->chrg_fault =3D reg;
> +	state->ntc_fault =3D reg & SGM4154X_TEMP_MASK;
> +	state->health =3D state->ntc_fault;
> +
> +	ret =3D regmap_read(sgm->regmap, SGM4154X_CHRG_CTRL_A, &reg);
> +	if (ret) {
> +		dev_err(sgm->dev, "read SGM4154X_CHRG_CTRL_A fail\n");
> +		return ret;
> +	}
> +	state->vbus_gd =3D !!(reg & SGM4154X_VBUS_GOOD);
> +
> +	return ret;
> +}
> +
> +static int sgm4154x_property_is_writeable(struct power_supply *psy,
> +					  enum power_supply_property prop)
> +{
> +	switch (prop) {
> +	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
> +	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
> +	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
> +	case POWER_SUPPLY_PROP_ONLINE:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static int sgm4154x_charger_set_property(struct power_supply *psy,
> +					 enum power_supply_property prop,
> +					 const union power_supply_propval *val)
> +{
> +	struct sgm4154x_device *sgm =3D power_supply_get_drvdata(psy);
> +	int ret =3D -EINVAL;
> +
> +	switch (prop) {
> +	case POWER_SUPPLY_PROP_ONLINE:
> +		if (val->intval) {
> +			ret =3D sgm4154x_enable_charger(sgm);
> +			sgm4154x_set_watchdog_timer(sgm, SGM4154X_WDT_TIMER_40S);
> +		} else {
> +			sgm4154x_set_watchdog_timer(sgm, 0);
> +			ret =3D sgm4154x_disable_charger(sgm);
> +		}
> +		break;
> +
> +	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
> +		ret =3D sgm4154x_set_input_curr_lim(sgm, val->intval);
> +		break;
> +	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
> +		ret =3D sgm4154x_set_ichrg_curr(sgm, val->intval);
> +		break;
> +	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
> +		ret =3D sgm4154x_set_chrg_volt(sgm, val->intval);
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static int sgm4154x_charger_get_property(struct power_supply *psy,
> +					 enum power_supply_property psp,
> +					 union power_supply_propval *val)
> +{
> +	struct sgm4154x_device *sgm =3D power_supply_get_drvdata(psy);
> +	struct sgm4154x_state state;
> +	int ret;
> +
> +	ret =3D sgm4154x_get_state(sgm, &state);
> +	if (ret) {
> +		dev_err(sgm->dev, "get state error!\n");
> +		return ret;
> +	}
> +	sgm->state =3D state;
> +
> +	switch (psp) {
> +	case POWER_SUPPLY_PROP_STATUS:
> +		if (!state.chrg_type || (state.chrg_type =3D=3D SGM4154X_OTG_MODE))
> +			val->intval =3D POWER_SUPPLY_STATUS_DISCHARGING;
> +		else if (!state.chrg_stat)
> +			val->intval =3D POWER_SUPPLY_STATUS_NOT_CHARGING;
> +		else if (state.chrg_stat =3D=3D SGM4154X_TERM_CHRG)
> +			val->intval =3D POWER_SUPPLY_STATUS_FULL;
> +		else
> +			val->intval =3D POWER_SUPPLY_STATUS_CHARGING;
> +		break;
> +	case POWER_SUPPLY_PROP_CHARGE_TYPE:
> +		switch (state.chrg_stat) {
> +		case SGM4154X_PRECHRG:
> +			val->intval =3D POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
> +			break;
> +		case SGM4154X_FAST_CHRG:
> +			val->intval =3D POWER_SUPPLY_CHARGE_TYPE_FAST;
> +			break;
> +		case SGM4154X_TERM_CHRG:
> +			val->intval =3D POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
> +			break;
> +		case SGM4154X_NOT_CHRGING:
> +			val->intval =3D POWER_SUPPLY_CHARGE_TYPE_NONE;
> +			break;
> +		default:
> +			val->intval =3D POWER_SUPPLY_CHARGE_TYPE_UNKNOWN;
> +		}
> +		break;
> +	case POWER_SUPPLY_PROP_MANUFACTURER:
> +		val->strval =3D SGM4154X_MANUFACTURER;
> +		break;
> +
> +	case POWER_SUPPLY_PROP_MODEL_NAME:
> +		val->strval =3D SGM4154X_NAME;
> +		break;
> +
> +	case POWER_SUPPLY_PROP_ONLINE:
> +		val->intval =3D state.online;
> +		break;
> +	case POWER_SUPPLY_PROP_PRESENT:
> +		val->intval =3D state.vbus_gd;
> +		break;
> +	case POWER_SUPPLY_PROP_TYPE:
> +		val->intval =3D POWER_SUPPLY_TYPE_USB;
> +		break;

Drop. POWER_SUPPLY_PROP_TYPE is exposed and handled automatically.

> +	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE:
> +		val->intval =3D sgm4154x_get_chrg_volt(sgm);
> +		if (val->intval < 0)
> +			return -EINVAL;
> +		break;
> +	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
> +		val->intval =3D sgm4154x_get_ichrg_curr(sgm);
> +		if (val->intval < 0)
> +			return -EINVAL;
> +		break;
> +	case POWER_SUPPLY_PROP_INPUT_VOLTAGE_LIMIT:
> +		val->intval =3D sgm->init_data.vlim;
> +		break;
> +	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
> +		val->intval =3D sgm4154x_get_input_curr_lim(sgm);
> +		if (val->intval < 0)
> +			return  -EINVAL;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static irqreturn_t sgm4154x_irq_handler_thread(int irq, void *private)
> +{
> +	struct sgm4154x_device *sgm4154x =3D private;
> +	struct sgm4154x_state state;
> +	int ret;
> +
> +	ret =3D sgm4154x_get_state(sgm4154x, &state);
> +	if (ret) {
> +		dev_err(sgm4154x->dev, "get state error!\n");
> +		return IRQ_NONE;
> +	}
> +	sgm4154x->state =3D state;
> +	if (state.vbus_gd) {
> +		if (sgm4154x->init_data.ilim >=3D SGM4154X_DEFAULT_INPUT_CUR) {
> +			ret =3D sgm4154x_set_input_curr_lim(sgm4154x, sgm4154x->init_data.ili=
m);
> +			if (ret) {
> +				dev_err(sgm4154x->dev, "set input current error!\n");
> +				return IRQ_NONE;
> +			}
> +		}
> +	}
> +	power_supply_changed(sgm4154x->charger);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static enum power_supply_property sgm4154x_power_supply_props[] =3D {
> +	POWER_SUPPLY_PROP_TYPE,

Also drop it from here :)

> +	POWER_SUPPLY_PROP_MANUFACTURER,
> +	POWER_SUPPLY_PROP_MODEL_NAME,
> +	POWER_SUPPLY_PROP_STATUS,
> +	POWER_SUPPLY_PROP_ONLINE,
> +	POWER_SUPPLY_PROP_INPUT_VOLTAGE_LIMIT,
> +	POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT,
> +	POWER_SUPPLY_PROP_CHARGE_TYPE,
> +	POWER_SUPPLY_PROP_CONSTANT_CHARGE_VOLTAGE,
> +	POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT,
> +	POWER_SUPPLY_PROP_PRESENT
> +};
> +
> +static char *sgm4154x_charger_supplied_to[] =3D {
> +	"battery-monitor",
> +};

why?

> +static struct power_supply_desc sgm4154x_power_supply_desc =3D {
> +	.name =3D "sgm4154x-charger",
> +	.type =3D POWER_SUPPLY_TYPE_USB,
> +	.properties =3D sgm4154x_power_supply_props,battery-monitor
> +	.num_properties =3D ARRAY_SIZE(sgm4154x_power_supply_props),
> +	.get_property =3D sgm4154x_charger_get_property,
> +	.set_property =3D sgm4154x_charger_set_property,
> +	.property_is_writeable =3D sgm4154x_property_is_writeable,
> +};
> +
> +static const struct regmap_config sgm4154x_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.max_register =3D SGM4154X_CHRG_CTRL_F,
> +	.cache_type =3D REGCACHE_NONE,
> +};
> +
> +static int sgm4154x_power_supply_init(struct sgm4154x_device *sgm,
> +				      struct device *dev)
> +{
> +	struct power_supply_config psy_cfg =3D { .drv_data =3D sgm,
> +					       .fwnode =3D dev->fwnode, };
> +
> +	psy_cfg.supplied_to =3D sgm4154x_charger_supplied_to;
> +	psy_cfg.num_supplicants =3D ARRAY_SIZE(sgm4154x_charger_supplied_to);

I doubt you want to set any hardcoded supplied data and rely on the
DT setup (i.e. add "power-supplies" property).

> +	psy_cfg.fwnode =3D dev->fwnode;

You already set that a few lines above.

> +	sgm->charger =3D devm_power_supply_register(sgm->dev,
> +						  &sgm4154x_power_supply_desc,
> +						  &psy_cfg);
> +	if (IS_ERR(sgm->charger))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int sgm4154x_hw_init(struct sgm4154x_device *sgm)
> +{
> +	struct power_supply_battery_info *bat_info;
> +	int ret;
> +	u32 val;
> +
> +	/*
> +	 * If unable to read devicetree info, use default/reset
> +	 * values from hardware.
> +	 */
> +	sgm->init_data.iprechg =3D SGM4154X_PRECHRG_I_DEF_UA;
> +	sgm->init_data.iterm =3D SGM4154X_TERMCHRG_I_DEF_UA;
> +	sgm->init_data.max_ichg =3D SGM4154X_ICHRG_I_DEF_UA;
> +	sgm->init_data.max_vreg =3D SGM4154X_VREG_V_DEF_UV;
> +	sgm->init_data.vlim =3D SGM4154X_VINDPM_DEF_UV;
> +	sgm->init_data.ilim =3D SGM4154X_IINDPM_DEF_UA;
> +
> +	ret =3D power_supply_get_battery_info(sgm->charger, &bat_info);
> +	if (ret)
> +		dev_warn(sgm->dev, "sgm4154x: cannot read battery info\n");
> +	else {
> +		if (bat_info->constant_charge_current_max_ua)
> +			sgm->init_data.max_ichg =3D bat_info->constant_charge_current_max_ua;
> +		if (bat_info->constant_charge_voltage_max_uv)
> +			sgm->init_data.max_vreg =3D bat_info->constant_charge_voltage_max_uv;
> +		if (bat_info->charge_term_current_ua)
> +			sgm->init_data.iterm =3D bat_info->charge_term_current_ua;
> +		if (bat_info->precharge_current_ua)
> +			sgm->init_data.iprechg =3D bat_info->precharge_current_ua;
> +
> +		power_supply_put_battery_info(sgm->charger, bat_info);
> +	}
> +
> +	ret =3D device_property_read_u32(sgm->dev,
> +				       "input-voltage-limit-microvolt",
> +				       &val);
> +	if (!ret)
> +		sgm->init_data.vlim =3D clamp(val, SGM4154X_VINDPM_V_MIN_UV,
> +					    SGM4154X_VINDPM_V_MAX_UV);
> +
> +	ret =3D device_property_read_u32(sgm->dev,
> +				       "input-current-limit-microamp",
> +				       &val);
> +	if (!ret)
> +		sgm->init_data.ilim =3D clamp(val, SGM4154X_IINDPM_I_MIN_UA,
> +					    SGM4154X_IINDPM_I_MAX_UA);
> +
> +	ret =3D sgm4154x_set_watchdog_timer(sgm, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D sgm4154x_set_prechrg_curr(sgm, sgm->init_data.iprechg);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D sgm4154x_set_chrg_volt(sgm, sgm->init_data.max_vreg);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D sgm4154x_set_term_curr(sgm, sgm->init_data.iterm);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D sgm4154x_set_ichrg_curr(sgm, sgm->init_data.max_ichg);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D sgm4154x_set_input_volt_lim(sgm, sgm->init_data.vlim);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D sgm4154x_set_input_curr_lim(sgm, sgm->init_data.ilim);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D sgm4154x_set_vac_ovp(sgm);
> +	if (ret)
> +		return ret;
> +
> +	regmap_update_bits(sgm->regmap,
> +			   SGM4154X_CHRG_CTRL_D,
> +			   SGM4154X_JEITA_EN,
> +			   0);
> +
> +	regmap_update_bits(sgm->regmap,
> +			   SGM4154X_CHRG_CTRL_A,
> +			   SGM4154X_IINDPM_INT_MASK,
> +			   SGM4154X_IINDPM_INT_MASK);
> +
> +	regmap_update_bits(sgm->regmap,
> +			   SGM4154X_CHRG_CTRL_A,
> +			   SGM4154X_VINDPM_INT_MASK,
> +			   SGM4154X_VINDPM_INT_MASK);
> +
> +	/*
> +	 * Recharge voltage set to 200 by BSP driver instead of hardware
> +	 * default value of 100.
> +	 */
> +	ret =3D sgm4154x_set_recharge_volt(sgm, 200);
> +
> +	return ret;
> +}
> +
> +static const u32 sgm4154x_chg_otg_cur_ua[] =3D {
> +	1200000, 2000000,
> +};
> +
> +static const struct regulator_ops sgm4154x_vbus_ops =3D {
> +	.list_voltage =3D regulator_list_voltage_linear,
> +	.enable =3D regulator_enable_regmap,
> +	.disable =3D regulator_disable_regmap,
> +	.is_enabled =3D regulator_is_enabled_regmap,
> +	.set_voltage_sel =3D regulator_set_voltage_sel_regmap,
> +	.get_voltage_sel =3D regulator_get_voltage_sel_regmap,
> +	.set_current_limit =3D regulator_set_current_limit_regmap,
> +	.get_current_limit =3D regulator_get_current_limit_regmap,
> +};
> +
> +static const struct regulator_desc sgm4154x_otg_rdesc =3D {
> +	.of_match =3D "otg-vbus",
> +	.name =3D "otg-vbus",
> +	.regulators_node =3D of_match_ptr("regulators"),
> +	.ops =3D &sgm4154x_vbus_ops,
> +	.owner =3D THIS_MODULE,
> +	.type =3D REGULATOR_VOLTAGE,
> +	.min_uV =3D 4850000,
> +	.uV_step =3D 150000,
> +	.n_voltages =3D 4,
> +	.vsel_reg =3D SGM4154X_CHRG_CTRL_6,
> +	.vsel_mask =3D SGM4154X_BOOSTV,
> +	.enable_reg =3D SGM4154X_CHRG_CTRL_1,
> +	.enable_mask =3D SGM4154X_OTG_EN,
> +	.curr_table =3D sgm4154x_chg_otg_cur_ua,
> +	.n_current_limits =3D ARRAY_SIZE(sgm4154x_chg_otg_cur_ua),
> +	.csel_reg =3D SGM4154X_CHRG_CTRL_2,
> +	.csel_mask =3D SGM4154X_BOOST_LIM,
> +};
> +
> +static int sgm4154x_vbus_regulator_register(struct sgm4154x_device *sgm)
> +{
> +	struct regulator_config config =3D {
> +		.dev =3D sgm->dev,
> +		.regmap =3D sgm->regmap,
> +		.driver_data =3D sgm,
> +	};
> +
> +	sgm->otg_rdev =3D devm_regulator_register(sgm->dev,
> +						&sgm4154x_otg_rdesc,
> +						&config);
> +
> +	return PTR_ERR_OR_ZERO(sgm->otg_rdev);
> +}
> +
> +static int sgm4154x_hw_chipid_detect(struct sgm4154x_device *sgm)
> +{
> +	int ret;
> +	int val;
> +
> +	ret =3D regmap_read(sgm->regmap, SGM4154X_CHRG_CTRL_B, &val);
> +	if (ret)
> +		return ret;
> +
> +	if ((val & SGM4154X_PN_MASK) !=3D SGM4154X_PN_ID)
> +		dev_warn(sgm->dev, "sgm4154x device ID mismatch\n");
> +
> +	return 0;
> +}
> +
> +static void sgm_charger_work(struct work_struct *work)
> +{
> +	struct sgm4154x_device *sgm =3D
> +		container_of(work,
> +			     struct sgm4154x_device,
> +			     sgm_delay_work.work);
> +
> +	sgm4154x_watchdog_timer_reset(sgm);
> +	if (sgm->watchdog_enable)
> +		queue_delayed_work(sgm->sgm_monitor_wq,
> +				   &sgm->sgm_delay_work,
> +				   msecs_to_jiffies(1000 * 5));
> +}
> +
> +static int sgm4154x_probe(struct i2c_client *client)
> +{
> +	const struct i2c_device_id *id =3D i2c_client_get_device_id(client);
> +	struct device *dev =3D &client->dev;
> +	struct sgm4154x_device *sgm;
> +	int ret;
> +
> +	sgm =3D devm_kzalloc(dev, sizeof(*sgm), GFP_KERNEL);
> +	if (!sgm)
> +		return -ENOMEM;
> +
> +	sgm->client =3D client;

You can drop sgm->client as it is unused.

> +	sgm->dev =3D dev;
> +
> +	strscpy(sgm->model_name, id->name, I2C_NAME_SIZE);
> +
> +	sgm->regmap =3D devm_regmap_init_i2c(client, &sgm4154x_regmap_config);
> +	if (IS_ERR(sgm->regmap))
> +		return dev_err_probe(dev, PTR_ERR(sgm->regmap),
> +				     "Failed to allocate register map\n");
> +
> +	i2c_set_clientdata(client, sgm);
> +
> +	ret =3D sgm4154x_hw_chipid_detect(sgm);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Unable to read HW ID\n");
> +
> +	device_init_wakeup(dev, 1);
> +
> +	sgm->sgm_monitor_wq =3D devm_alloc_ordered_workqueue(dev, "%s",
> +			WQ_MEM_RECLAIM | WQ_FREEZABLE, "sgm-monitor-wq");

For a fixed name you don't need "%s".

> +	if (!sgm->sgm_monitor_wq)
> +		return -EINVAL;
> +
> +	ret =3D sgm4154x_power_supply_init(sgm, dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register power supply\n");
> +
> +	ret =3D sgm4154x_hw_init(sgm);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Cannot initialize the chip.\n");
> +
> +	if (client->irq) {
> +		ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> +						sgm4154x_irq_handler_thread,
> +						IRQF_TRIGGER_FALLING |
> +						IRQF_ONESHOT,
> +						"sgm41542-irq", sgm);
> +		if (ret)
> +			return ret;
> +
> +		enable_irq_wake(client->irq);

missing disable on module removal, use devm_add_action_or_reset() to
register disable_irq_wake. Then you can also drop the extra call a
few lines below.

> +	}
> +
> +	INIT_DELAYED_WORK(&sgm->sgm_delay_work, sgm_charger_work);

devm_delayed_work_autocancel(), otherwise the delayed work may run
after module removal.

> +	ret =3D sgm4154x_vbus_regulator_register(sgm);
> +	if (ret) {
> +		disable_irq_wake(client->irq);
> +		return dev_err_probe(dev, ret,
> +				     "Unable to register VBUS regulator\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static void sgm4154x_charger_shutdown(struct i2c_client *client)
> +{
> +	struct sgm4154x_device *sgm =3D i2c_get_clientdata(client);
> +
> +	sgm4154x_set_prechrg_curr(sgm, SGM4154X_PRECHRG_I_DEF_UA);
> +	sgm4154x_disable_charger(sgm);
> +}
> +
> +static const struct i2c_device_id sgm4154x_i2c_ids[] =3D {
> +	{ "sgm41542" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(i2c, sgm4154x_i2c_ids);
> +
> +static const struct of_device_id sgm4154x_of_match[] =3D {
> +	{ .compatible =3D "sgmicro,sgm41542", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, sgm4154x_of_match);
> +
> +static struct i2c_driver sgm4154x_driver =3D {
> +	.driver =3D {
> +		.name =3D "sgm4154x-charger",
> +		.of_match_table =3D sgm4154x_of_match,
> +	},
> +	.probe =3D sgm4154x_probe,
> +	.shutdown =3D sgm4154x_charger_shutdown,
> +	.id_table =3D sgm4154x_i2c_ids,
> +};
> +
> +module_i2c_driver(sgm4154x_driver);
> +
> +MODULE_AUTHOR("Xu Shengfei <xsf@rock-chips.com>");
> +MODULE_DESCRIPTION("sgm4154x charger driver");
> +MODULE_LICENSE("GPL");

Greetings,

-- Sebastian

--dy2ov5ubgjsceoib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmoh9PEACgkQ2O7X88g7
+po1TQ/+K8cQErLb1csqlyMhBFtMDHdG+zfDeJ6BnNcv+AYPi4YJMEtZbRAnu0Sj
cM4F+MixwF9SQiVCprJjZYDEQowiO6ejOXINikHKShoAgFzlSMfPtLpvtIXABaNY
lfwpUDM1Tt4pQJEpK3ncFgw1tvMi17hnkeiKbOdjpOApu6Z078b6HQKlDi4NADVl
65IN5nwgRQxqh0NbU+H3ox5N0gI8zPSG+ADhLnbQA52YuswkECD+vmF/I7dR3Qu8
GpSQoFPAcTWosjkVrfuo/jhOSqEVvedc6lVJG8PExMhPHO/PI0GJbzQaYEzNtEqv
DWHMRlpY4T5G1kzUt9iGTOfJfUGLN9GBAVxTUcN5ibslwNs0O42Uma0D5nBhLXgT
NHEcRa5RxQCI2pT8OvW0eX7SL+aXxfWXkjoNLCTJV64+RuID+kUPVlFh3Mp81jQK
iiYMTAGnguJFbU6ivger7+H1GP/3wU4pW5gMjuyyRNSrSwiOPGvK0SGvEVXe6VmE
3E0Z49+3N/Cilm0mzXsdeleZoVEJ5tbCoqFtY8ISAHqWU7XTxY13B6aouaEE4sq0
+46xHSEGZNbIoSy0oQSrIJ3RTBaO0BqyxuwoqgOX8eQMxbgAt+CO2BaR3PIr/VI2
+Kh3X5UDUgTOyPR2ZlAdALvYwU3lT0V+JceCtA4Xqpvo8qygzME=
=Z4QK
-----END PGP SIGNATURE-----

--dy2ov5ubgjsceoib--

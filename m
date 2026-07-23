Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16BC46D563;
	Thu, 23 Jul 2026 12:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810090; cv=none; b=VgN/GLpfIzf2SDDioAx1tgtbU+ikgFhNgZUaLyO9pGUZUlx0nj42J0/GmrtOJ5yNg+Zoep/qsrxVunyiFNoPm8YGUtMxPaDN1mfGcMBr4461Q1L2xqlHNjUT/7oEgiuA/g6CSAjgQ9NGPYqJ+iBKQAt8LuZwWNeZVk4EQ+r+7Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810090; c=relaxed/simple;
	bh=w/tcGdroRKaEisaq1NGTUy7tW+I7TpXI6GsUMWQcIJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXaZ3pkQhgK+okRu97S4AaWlt6lF21BJbNFeQUCj9z/eDO+BHSuSCOr5afVUWNy3OL+pVjpmGgRxMO4dTvCMxkAE0g/DsvqXtKJccJpg2A0aAuvhtrnHclAYiPCLtQVplNKhwlHaBYRwH9ApLrZx0l0Xt5IuG5fVHWjHUosJD3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hhJ7y7ph; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hhJ7y7ph"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9FD1F000E9;
	Thu, 23 Jul 2026 12:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784810089;
	bh=/ZN6NxEs80aRr7QrkF1VpoYapstIntxXDhCLIl8yNNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hhJ7y7phvR/9taXz/abMH66GhD2YBTeISvTvURlU/6UIDouJGRpEGb/3vtW6ITa7+
	 VZNYVSW707u+1PMaed2EfHblOXE/YihdjmFvtFnzHD92+hpEV+gQNLU9WbEFa252y8
	 ccd+UXy0lSQkVqI5L/DZqxx4iuYZcNcpr/2Yu/8LRtBEOGQBEdbSDhObkcZyeyvJNh
	 6NLQWwgBSyA2biRYoxAeLY6meYq1x9no6xnErrQQM0/4tNfdKjPPfEokxOtPVQBvZD
	 7pATU/QBFEXJrzSSvSNH1M38DYoI4WjLjaiNFaIJT+GIOE32m0D06mHN9e20VEDW7S
	 KpY1WIex0SOsg==
Date: Thu, 23 Jul 2026 13:34:43 +0100
From: Lee Jones <lee@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v14 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Message-ID: <20260723123443.GI3363113@google.com>
References: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
 <20260714092053.2461482-5-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714092053.2461482-5-lakshay.piplani@nxp.com>

On Tue, 14 Jul 2026, Lakshay Piplani wrote:

> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> 
> Add core MFD support for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> family of multiport I3C hub devices. These devices connect to a host via
> I3C/I2C/SMBus and expose multiple downstream target ports.
> 
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> ---
> Changes in v14:
>  - Clean up MFD driver comments, formatting, variable names and author
>    information
>  - Define and document the I3C hub DCR value in hexadecimal form
>  - Use direct regmap bit-width values instead of local macros
>  - Add a shared protected_reg_lock for protected register accesses across
>    P3H2X4X child drivers
> 
> Changes in v13:
>  - Use i3c_device helpers (i3cdev_to_dev()) instead of direct struct access
>    to maintain API abstraction
>  - Avoid including internal I3C headers and use public device headers instead
>  - Ensure proper device matching by relying on manufacturer ID checks in probe
> 
> Changes in v12:
>  - No change, added Reviewed-By tag
> 
> Changes in v11:
>  - Use MFD_CELL_NAME() for child device registration
>  - Rename local variables for consistency
>  - Rename driver names to follow subsystem conventions:
>    - Use '-' instead of '_' in driver names
>    - Drop the "_drv" suffix from driver names
> 
> Changes in v10:
>  - Drop redundant is_p3h2x4x_in_i3c flag
> 
> Changes in v9:
>  - Renamed macros to follow consistent uppercase naming conventions
>  - Made REGMAP selects in the P3H2X4X MFD Kconfig conditional,
>    to avoid I3C/I2C dependency issues
> 
> Changes in v8:
>  - No change
> 
> Changes in v7:
>  - Use new config I3C_OR_I2C
> 
> Changes in v6:
>  - No change
> 
> Changes in v5:
>  - Corrected the ordering in the Makefile and Kconfig for MFD_P3H2X4X
>  - Updated dev_err_probe() for regmap_init failure.
>  - Updated module description
> 
> Changes in v4:
>  - Split the driver into three separate patches(mfd, regulator and I3C hub)
>  - Added support for NXP P3H2x4x MFD functionality
> ---
> ---
>  MAINTAINERS                 |   2 +
>  drivers/mfd/Kconfig         |  13 ++++
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/p3h2840.c       | 139 ++++++++++++++++++++++++++++++++++++
>  include/linux/i3c/device.h  |   2 +
>  include/linux/mfd/p3h2840.h |  25 +++++++
>  6 files changed, 182 insertions(+)
>  create mode 100644 drivers/mfd/p3h2840.c
>  create mode 100644 include/linux/mfd/p3h2840.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ba65ae5a008b..3420701a75c5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19311,6 +19311,8 @@ L:	linux-kernel@vger.kernel.org
>  L:	linux-i3c@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> +F:	drivers/mfd/p3h2840.c
> +F:	include/linux/mfd/p3h2840.h
>  
>  NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
>  M:	Woodrow Douglass <wdouglass@carnegierobotics.com>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 7192c9d1d268..405b50c3c77b 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -617,6 +617,19 @@ config MFD_MX25_TSADC
>  	  i.MX25 processors. They consist of a conversion queue for general
>  	  purpose ADC and a queue for Touchscreens.
>  
> +config MFD_P3H2X4X
> +	tristate "NXP P3H2X4X I3C Hub Device"
> +	depends on I3C_OR_I2C
> +	select MFD_CORE
> +	select REGMAP_I3C if I3C
> +	select REGMAP_I2C if I2C
> +	help
> +	  Enable Support for NXP P3H244x/P3H284x I3C HUB device using I3C/I2C
> +	  communication interface.
> +
> +	  This driver provides support for I3C hub and regulator, each subdriver
> +	  can be enabled independently depending on the required functionality.
> +
>  config MFD_PF1550
>  	tristate "NXP PF1550 PMIC Support"
>  	depends on I2C=y && OF
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index e75e8045c28a..a284b22c7b13 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -122,6 +122,7 @@ obj-$(CONFIG_MFD_MC13XXX)	+= mc13xxx-core.o
>  obj-$(CONFIG_MFD_MC13XXX_SPI)	+= mc13xxx-spi.o
>  obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
>  
> +obj-$(CONFIG_MFD_P3H2X4X)	+= p3h2840.o
>  obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
>  
>  obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
> diff --git a/drivers/mfd/p3h2840.c b/drivers/mfd/p3h2840.c
> new file mode 100644
> index 000000000000..652077408dbd
> --- /dev/null
> +++ b/drivers/mfd/p3h2840.c
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025-2026 NXP
> + *
> + * Authors:
> + *	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> + *	Vikash Bansal <vikash.bansal@nxp.com>
> + *	Lakshay Piplani <lakshay.piplani@nxp.com>
> + *
> + * P3H2X4X multi-function device driver.

There is no such thing as an "MFD device driver".  You should describe
what the device actually is: "Multiport I3C hub device", or whatever.

If you end up re-spinning, I'd like you to change this in the next set.

If not, then please provided with a follow-up patch.

-- 
Lee Jones

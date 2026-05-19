Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E1A4502A
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 22:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779231513; cv=none; b=MZii8U5eZHpEOJjtK43YQuim9JV/ep8CgWTD4Y1P0lYTWng2ng4WS0A+ZDRoW4vd/nWg7Ilj0vN8lBy4AXe4nC5mK/z57r3ATJK1pHxs37l0ghQeg9xic9YYDr3RPTKHWsvZbqeFQSa5Yi4Rh3s0uZt5uJwSlkwKQb89YEktntg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779231513; c=relaxed/simple;
	bh=wg75y48mnLaHgHyQnkKxc/BlrEASPS8X8Fxan1xYnOs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OFemQbabMO73bMel02aNOoMW08JjKtRwfQ0uk0YMycQ3XwXLZaO8+L6ZhM7AjGj9+iDXdpRwCShiVu3PC0QeAmxfenTFcQdvrKUz7tS4icdT6kLI3FHLo1OpnQUeSeGuPd9j5L3S9bMEwSRHT7pejc6RZfhqd5S++zq3NpUtqMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1SmDrz3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1SmDrz3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41C91F000E9;
	Tue, 19 May 2026 22:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779231512;
	bh=ckLWd3Pcv5VS9zUkCSDTjdLnQXXOdrp15i1cta7NHnY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M1SmDrz3tBUH44wRXHoJBQfWC9HbTxbbcl+xe7Zfup18yLZPVZ0ZwrRsjuMS9/oS8
	 UD3tM6CSiZvFfOh+z7K77S6DAGC7JCT0vx8HlAeVit2rSFJR2whgw7HFcYHGNE38e4
	 5enkDsBZRSXHYdFAHD5Ao/Gmi7XiMdKQ4MSe0mU5aVdH8mSJjgVdvmiludXA6zSEbE
	 jpGx7jZdfjiYJxkOxxB9zPDWyu4NQXyY27CcrhWjjQGaJlyOD3POh/HI8TbV9kAPph
	 Ns2l1FoTU+eU2HLxig0EakozmbWmXWaUWW9kcz5/jK2IuU+t+0k2iVem6y223rqQuH
	 UIfdrx+V6d66A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/6] phy: move and rename Airoha PCIe PHY driver to
 dedicated directory
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: olteanv@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org
In-Reply-To: <20260519220813.28468-6-ansuelsmth@gmail.com>
References: <20260519220813.28468-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 22:58:31 +0000
Message-Id: <20260519225831.C41C91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The commit claims to move and rename the Airoha PCIe PHY driver to =
a dedicated directory, but fails to delete the original source files, leavi=
ng them as dead code in the tree.
- [Low] The newly added header file uses the same include guard as the old =
file.
--

commit 86b6424c6ba53c67472bea2d3d41f8d654e1cb31
Author: Christian Marangi <ansuelsmth@gmail.com>

phy: move and rename Airoha PCIe PHY driver to dedicated directory

This commit moves the Airoha AN7581 PCIe PHY driver into a dedicated
directory and renames the files and config symbols. This change is
in preparation for adding other Airoha PHY drivers in the future.

[ ... ]

> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index f49d83f00a3d8..84062279fa63e 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -7,7 +7,6 @@ obj-$(CONFIG_PHY_COMMON_PROPS)		+=3D phy-common-props.o
>  obj-$(CONFIG_PHY_COMMON_PROPS_TEST)	+=3D phy-common-props-test.o
>  obj-$(CONFIG_GENERIC_PHY)		+=3D phy-core.o
>  obj-$(CONFIG_GENERIC_PHY_MIPI_DPHY)	+=3D phy-core-mipi-dphy.o
> -obj-$(CONFIG_PHY_AIROHA_PCIE)		+=3D phy-airoha-pcie.o

[Severity: Low]
The commit message states the driver is being moved, but the diff only shows
adding the new files in the airoha directory. It doesn't remove the original
drivers/phy/phy-airoha-pcie.c and drivers/phy/phy-airoha-pcie-regs.h files.
Should these old files be deleted in this patch to avoid leaving uncompiled
dead code in the tree?

[ ... ]

> diff --git a/drivers/phy/airoha/phy-an7581-pcie-regs.h b/drivers/phy/airo=
ha/phy-an7581-pcie-regs.h
> new file mode 100644
> index 0000000000000..b938a7b468fee
> --- /dev/null
> +++ b/drivers/phy/airoha/phy-an7581-pcie-regs.h
> @@ -0,0 +1,494 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 AIROHA Inc
> + * Author: Lorenzo Bianconi <lorenzo@kernel.org>
> + */
> +
> +#ifndef _PHY_AIROHA_PCIE_H

[Severity: Low]
Since the file is being renamed to phy-an7581-pcie-regs.h, should this
include guard be updated to match the new filename? Reusing the old guard
might cause conflicts, particularly since the old header file was not
deleted.

> +#define _PHY_AIROHA_PCIE_H
> +
> +/* CSR_2L */
> +#define REG_CSR_2L_CMN				0x0000

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519220813.2846=
8-1-ansuelsmth@gmail.com?part=3D5

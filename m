Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914603C09E2
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 19:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778788386; cv=none; b=mu30Gp6aNcIP9375S1MwJQZ9ysqpLD1uG+yS/Zb6PXOgKJizE8oLMPtPJfp41yUGbiVn9IXfcR0kMF626903t/FquE/25Oblsw8HCz1CSr5yjj09TbjWDN6KzEPuzEx+YJDuvcydfljxtJ5xg6JGM5k3jIRpfiCms0TzWToCoJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778788386; c=relaxed/simple;
	bh=pCIZAGABb2k5WNsfnCUjfze4wmC+Pq6qOG3lBsfh1fE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uVNmV7fjrIaEUckz8XKFnyf1axex9IpU+JWmH2RX3ui8hZXeEkokUsfjObxyTR4gvSMw2Odc/87UlmJjJ5h6HpgLukYH8QGzXUYy2z+aX4MetE6Fr9w5+8cnxYyhNW/FgiSvLaLkojlRDmypGhe7hlGWMhzfjCsX/9+syViNQsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVoQ+VbC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVoQ+VbC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4132C2BCB3;
	Thu, 14 May 2026 19:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778788386;
	bh=pCIZAGABb2k5WNsfnCUjfze4wmC+Pq6qOG3lBsfh1fE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=DVoQ+VbCRc9uNCNmwboAyQPujm8Ofz/mrthPxpY2F3S8CG35Lrbnw5zzDuJvj9Xpw
	 QjDx82qXwyExvCw3mBaZ1RUzq6h93lpOWqqE4zNOsiImxkkK0I2VcZ1O2FQwFGlUcV
	 LYqHzHha4yUV2rJMlo84V64ldAZwo3qI0IvfkU3XByfpWtc1bhdhkqL9KqJpnvJEnM
	 fKMvCg5l78T3O4H7vGuODHoCsHbCEoTseqnohtjd+Hrhoy7tDUagfkqIKPUCzEc1r+
	 GwSRhBEB6rqLCYJJM1+lCJUvJS907qVjIW605AAiOgbPG3+amUIx+CAa4PJKUSNjCM
	 fcrbPSzJHrWjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] reset: eswin: Add eic7700 HSP reset driver
Reply-To: sashiko-reviews@lists.linux.dev
To: dongxuyang@eswincomputing.com
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260514114738.1641-1-dongxuyang@eswincomputing.com>
References: <20260514114738.1641-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 19:53:05 +0000
Message-Id: <20260514195305.C4132C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing `#include <linux/module.h>` for module macros.
--

commit 08281f0596a764e191cbecfd9dc12b0b51f6730f
Author: Xuyang Dong <dongxuyang@eswincomputing.com>

reset: eswin: Add eic7700 HSP reset driver

This commit adds an auxiliary driver to support the ESWIN EIC7700 high-speed
peripherals system. The reset controller is created using the auxiliary dev=
ice
framework.

> diff --git a/drivers/reset/reset-eic7700-hsp.c b/drivers/reset/reset-eic7=
700-hsp.c
> new file mode 100644
> index 0000000000000..bdd4f5e3d7a76
> --- /dev/null
> +++ b/drivers/reset/reset-eic7700-hsp.c
> @@ -0,0 +1,112 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2026, Beijing ESWIN Computing Technology Co., Ltd..
> + * All rights reserved.
> + *
> + * ESWIN EIC7700 HSP Reset Driver
> + *
> + * Authors: Xuyang Dong <dongxuyang@eswincomputing.com>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>

This isn't a bug, but should this file explicitly include <linux/module.h>?

The code relies on module-specific macros such as THIS_MODULE,
MODULE_DEVICE_TABLE, MODULE_LICENSE, MODULE_AUTHOR, and MODULE_DESCRIPTION
later in the file. Relying on an implicit include could lead to unexpected
build failures if header dependencies change in the future.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514114212.903-=
1-dongxuyang@eswincomputing.com?part=3D3

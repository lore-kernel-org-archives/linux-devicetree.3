Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4221C84DC
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 14:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785250310; cv=none; b=tWTz35V/ceT0xjP+bdwcknle1+7jvRfRdApXH1eyG96DhhRy6BpH1N8og498lvD10Bkd/kCrZUlBN2oiHKsFelEGkrCsEWyYQWV1odMtjeXGlIsTRPIh+0KVkEJzW5U5/q6IUz3y8Kw6zimnJrFooEPRkculpg6tzPl+C4Zkd1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785250310; c=relaxed/simple;
	bh=HmxTw3+RwcFA+gQ3YRcwfGN5te9avEzwGq9BaFpiC04=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ft+1Zg5yH383m57s61p9/XsKGQ8SD0Kt7H2u1LeLx3SWskFVliJWJYl9HiK9UX+9xk+SO3skKy8vuNGFLGDLU3Pq5zlIgL6qY4xkFIz9eZT0rQM0waV5BX3Dtoj81u/h1bAqUqnb7qogyjwCNbiUWZNu/kv7HH14BLMWzPdZpCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhDypnBQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhDypnBQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6D71F000E9;
	Tue, 28 Jul 2026 14:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785250309;
	bh=njN2MG8YVD/uniWvEAtu2SDZU3+S8DmeLeCMiicXaSQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PhDypnBQ9qadeJtKhPM7hBz54hRwHBD32UYbVYZwC/5V8Xylj5+T8PsGs5A5o8vtc
	 buAw/DSIkEaVoEGjNkireK0V3/QYWsJzOs9txp4PpgkdEFgxZQPXZYvSASir3WK/p/
	 4ovu3+9OLE9ibzdlTyLXzCH3BhG9kq5g/MCL3/FgSZCcgIkeudpN1mOu3JQb8ou49W
	 +Z8234UJb8W+jDgfjoksU/Heq/QFCW/WGwtlpG3IvaSWSB1j9gCnBxmgk9aVhQoccQ
	 DwLIT/AUqgN6p9Ji5Ys7uL40i17Xh57Y6oaYrKnDywUhYPlS98TVJd3YkAyYD1ljZf
	 IW8JSxZURn8nQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 03/11] reset: realtek: Add RTD1625 reset controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728142806.1954638-4-eleanor.lin@realtek.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-4-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 14:51:48 +0000
Message-Id: <20260728145148.CC6D71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The auxiliary driver's name is incorrectly initialized via `.driver=
 =3D { .name =3D ... }`, causing the intended name to be silently overwritt=
en.
- [Low] Missing `<linux/module.h>` include for module macros.
--

--- Patch [3]: [PATCH v11 03/11] reset: realtek: Add RTD1625 reset controll=
er driver ---
commit 6ed7fb0b40e040995c4e1e41d96adfc82a758f96
Author: Cheng-Yu Lee <cylee12@realtek.com>

reset: realtek: Add RTD1625 reset controller driver

This adds support for the CRT and ISO domain reset controller on the Realtek
RTD1625 SoC. The reset driver is implemented as an auxiliary driver to hand=
le
shared register space with the CRT and ISO clock controller.

> diff --git a/drivers/reset/realtek/reset-rtd1625.c b/drivers/reset/realte=
k/reset-rtd1625.c
> new file mode 100644
> index 0000000000000..fa87462f50e9d
> --- /dev/null
> +++ b/drivers/reset/realtek/reset-rtd1625.c
> @@ -0,0 +1,262 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Realtek Semiconductor Corporation
> + */
> +
> +#include <dt-bindings/reset/realtek,rtd1625.h>
> +#include <linux/auxiliary_bus.h>
> +#include <linux/array_size.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/slab.h>
> +#include "reset-rtk-common.h"

[Severity: Low]
This isn't a bug, but should <linux/module.h> be explicitly included here?
The code relies heavily on module macros like MODULE_DEVICE_TABLE,
module_auxiliary_driver, and MODULE_DESCRIPTION, which currently only build
because of an indirect include through <linux/device.h>.

[ ... ]

> +static struct auxiliary_driver rtd1625_reset_driver =3D {
> +	.probe    =3D rtd1625_reset_probe,
> +	.id_table =3D rtd1625_reset_ids,
> +	.driver =3D {
> +		.name =3D "rtd1625-reset",
> +	},
> +};

[Severity: Low]
Is this driver name initialization correct for the auxiliary bus? Setting t=
he
name inside the embedded device_driver struct (.driver =3D { .name =3D ... =
})
causes the intended name to be ignored, as the auxiliary bus framework will
dynamically allocate and overwrite it with the module name.=20

Should this be initialized using the .name field of the parent
auxiliary_driver struct instead?

> +module_auxiliary_driver(rtd1625_reset_driver);
> +
> +MODULE_DESCRIPTION("Realtek RTD1625 Reset Controller Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("REALTEK_RESET");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728142806.1954=
638-1-eleanor.lin@realtek.com?part=3D3

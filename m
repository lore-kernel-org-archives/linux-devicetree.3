Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054D2405C35
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376450; cv=none; b=XTLlRF6pX/LlsGzIbfctuq0f8WCghJmzCcFVNQmzzvJdhqJRRTIx8ccPoTRw3R2UHY4fakiezHlWKwF3ncgML9nrSg0UT1suVp7CSl744/zYkIox60h9rxjECnePzJFxVPQMI92SY7Svk0X9RrWtmBaTt1wBofuVBLi9QgvcXhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376450; c=relaxed/simple;
	bh=I+Nuwy8HPYNqGocMvIjbw7E/HfBa/g39I3OUVoCgqfQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L0XpSEiPTLYTW2WKy6vZAQ6MON0UqC2cH913dRvyl556Hi32ezfLhWKUerEnOYMyLqOC93CLzjORwURvhFOLVVEdotVhOpibPHmQgqZ8fB5i3Ix5XCH2u7Hfuo3XAS1qVsKlzFmw4NC+Sg6ih5AiUIK0fzr2LO+uxmG0Dgkc1bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRNuNlIU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRNuNlIU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647761F000E9;
	Mon, 10 Aug 2026 15:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786376448;
	bh=BnniR0dR3UDy9KBKE9zVaWjOHqNJG9LYKLIHTGdio3A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NRNuNlIUZmVrweOHW3foUGNIrzeT3Y8UhbwcvGHMuOezG535vDz61DiN5SyPmXv8y
	 PZsme12Hlyv3aC3r/3ksQG9tZP5MqnefgxS0aD6uYPMsHuvR+jLlfQbx7m9TaTUl6G
	 m1qG6TwmrU/AjRaitVULBRkyRp7IWCkKpJXrHNr23kAB8KoEdUGxqk1DjO1aGrWYiv
	 R1qgAHNNPgYDpfbXpOKo0qFQAsB4tzNu7sGb8/3qruiGwoppIc/CgpxTTgjGCWV1S1
	 ohPeQP9+DveVVVM7EH7SfohhAiV4sFO0+dE6qPVG/HYT3TcA2l0IYy+jCfFn1qz8vI
	 x1Ka78EJhap6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/14] gtrace: Add RISC-V Trace encoder driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mayuresh Chitale" <mayuresh.chitale@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260810152223.3946743-7-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-7-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:40:47 +0000
Message-Id: <20260810154048.647761F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing component disable (resource leak) on error paths in rvtrac=
e_encoder_start() and rvtrace_encoder_stop().
- [High] Hardware state corruption due to setting the multi-bit INSTMODE fi=
eld without clearing existing bits.
- [Medium] gtrace_poll_bit() evaluates incorrectly and fails immediately wh=
en timeout is 0.
--

--- Patch [6]: [PATCH v5 06/14] gtrace: Add RISC-V Trace encoder driver ---
commit a4adb209cac509aff6293c009b2c4a5f828df5f5
Author: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>

gtrace: Add RISC-V Trace encoder driver

Add initial implementation of RISC-V E-Trace encoder driver. The encoder
is defined in the RISC-V Trace Control Interface specification.

> diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.c b/drivers/hwtraci=
ng/gtrace/rvtrace-encoder.c
> new file mode 100644
> index 0000000000000..9ff3413d1aa41
> --- /dev/null
> +++ b/drivers/hwtracing/gtrace/rvtrace-encoder.c

[ ... ]

> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026 Qualcomm Technologies, Inc.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/gtrace.h>
> +#include <linux/types.h>
> +#include "rvtrace.h"
> +
> +#define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT	2
> +#define RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT	4
> +#define RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT	0x6
> +
> +static int rvtrace_encoder_start(struct gtrace_component *comp)
> +{
> +	struct gtrace_platform_data *pdata =3D comp->pdata;
> +	int ret;
> +	u32 val;
> +
> +	ret =3D gtrace_enable_component(comp);
> +	if (ret) {
> +		dev_err(&comp->dev, "failed to enable encoder.\n");
> +		return ret;
> +	}
> +
> +	/* set mode */
> +	val =3D gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val |=3D (RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT << RVTRACE_COMPONENT_CTR=
L_INSTMODE_SHIFT);

[Severity: High]
Is a bitmask needed before ORing the new mode here?

Since RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT is 0x6 (spanning 3 bits), if the
hardware register already contains non-zero bits from a previous state or t=
he
bootloader (e.g., 0x1), won't the bitwise OR result in a corrupted state
(0x1 | 0x6 =3D 0x7)?

> +	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +
> +	val =3D gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val |=3D BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
> +	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	ret =3D gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
> +			      RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 1,
> +			      pdata->control_poll_timeout_usecs);

[Severity: Medium]
Does the gtrace_poll_bit() implementation in gtrace-core.c handle a 0 timeo=
ut
correctly?

Looking at gtrace_poll_bit():

    while (timeout--) {
        val =3D gtrace_read32(pdata, offset);

If a caller passes a timeout of 0, the postfix decrement causes it to bypass
the loop entirely and immediately return -ETIMEDOUT without reading the
register even once. Should standard polling semantics perform at least one
non-blocking read when timeout is 0?

> +	if (ret)
> +		dev_err(&comp->dev, "failed to enable tracing.\n");
> +
> +	return ret;

[Severity: High]
If gtrace_poll_bit() times out, this returns the error but skips disabling =
the
component. Will this leak the hardware resources (like clocks or power
domains) that were enabled earlier in gtrace_enable_component()?

> +}
> +
> +static int rvtrace_encoder_stop(struct gtrace_component *comp)
> +{
> +	struct gtrace_platform_data *pdata =3D comp->pdata;
> +	int ret;
> +	u32 val;
> +
> +	val =3D gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val &=3D ~BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
> +	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	ret =3D gtrace_poll_bit(pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
> +			      RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 0,
> +			      pdata->control_poll_timeout_usecs);
> +	if (ret) {
> +		dev_err(&comp->dev, "failed to stop tracing.\n");
> +		return ret;
> +	}

[Severity: High]
If stopping the trace times out, this returns early. Does this intentionally
bypass gtrace_disable_component() and leak the resource, or should it still
attempt to disable the encoder even on a timeout?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810152223.3946=
743-1-mayuresh.chitale@oss.qualcomm.com?part=3D6

Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23123101D4
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 17:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790962111; cv=pass; b=CyZuQspJx+sLL8+uVy0ouUE7VOw4zkwm9DXoVBSa2GbAAuq8cl3YhzarRvxAAeFWcdpOhM/zLZa81o01nqKAwzzF8Iqw1z2xfjqa/HqLjm+XElU1R+FJZEdEIBBKTJ38gnfCCZchTnLTblscqIFOSKhtrE47M3ispBRwlQaEMvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790962111; c=relaxed/simple;
	bh=RaLAehqtthYGfFxr1fNAI6j/LB07e/Xp2k/TOc8H0sk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EJ9jSr5TOdPkUjIQCLwEKAuREI3dK+/LV378UMVDjHGKaL9tIgy81bSugfW6RwDpVD77+fZFjMA8XNb0h4eEP7JKaFGCHa7YcnbviTn9cAM3WJbnsx2m0xK+uhT+2Dg9GSMr+P9HLRC2OAa/mZzQTBGAnQU9sp4hEAt3xnmNVsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VpBhbUF1; arc=pass smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VpBhbUF1"
Received: by mail-yx2-f39.google.com with SMTP id 00721157ae682-8aca30a369cso31964087b3.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 10:28:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790962109; cv=none;
        d=google.com; s=arc-20260327;
        b=Q6Gw90ykoyoPDrhV9gylc/B5sSujfFDX/+ivCIPqPQVoaf4Ai5F9MWsVAEeCCxngdq
         D/Hw3U5sBYPNLGvqgZ8iEnQ8TNPPfiBK1WjM4QEsQeWrWcC3u2wB2eZD6KV/cs9i5rNK
         mQdVPDIHG+xfpONjn4uv/+bZ5PYDhPiaI8Uycl3pSd94IjuSMD2vQRSDLUPER8hAaMH5
         rRK3tbNwSmKaFvbwSdwXhmwo22n4GIOmWPbkWj78iQrZs4Q5K90tyaIsVqs2VVL3DryB
         zqWLaAmcw44RJGPWsHUGagGK/ud9vt5wpxL5BxUy/lKIXzY42tb8lalAwgh9ErhLp4Qj
         Eu+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AYkEOeExnXVYl7DVk7pNZ0jHVMuLD/iLqTtJDBZJL1U=;
        fh=6TUbM4WEB5VzwoLzRp0QFIH2aVGD+BxHDJAuwxdfW38=;
        b=MwMB1EaWl5uqGgI0o+prI9nbXmB1GlcrdEiDJi1qotyX8eZAoQRBFAuRqffiyda3ld
         3E0h849+4+oRU60LZH8X7wgOV3dpSXDtdXZFTCXIDyJefAdqjbsVo9suDkRjTAQub6o1
         bOzeB5wz2/JjNSn7faLEuK1+JGfbZRXqEgAIGD8SuUDf9bO5V0NOXJWDg50fYAn7ajXm
         o4D9ARCqryHwaaGnVUZLz4fsDWong9OHXt24oU/8qD7xZIjpOHOBXYoSCAqM/H844p6J
         QJeLG4JrThoaNv2a/4m+ZvLl5Em/emlElkY+1BjWWrV1/4PLSsH1OEqbqjitI9vnPWpE
         5UFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790962109; x=1791566909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AYkEOeExnXVYl7DVk7pNZ0jHVMuLD/iLqTtJDBZJL1U=;
        b=VpBhbUF128kN3aRo97onoOMYBmOl0gOBvPXorzxk6ZkGuDvfwAd4aetnvdeGIyDPRQ
         O59PkcIfIuHcgPXVGclVw6cTs7B3RSc2Rl/FX7BZlH8sYZrbocim7Y9p1cYgH8TM4YHL
         S0ras1e3brzApTZJhOEX/jyRj7s8wEvZv8ukO15Xd5WI1GDB5yQfysu90SN5IH8UnZh2
         Faw6MDwgj2YldngV0OSXv7Bu+58JaXkk4eL4O/Ofn9/eDNMIieq23SvUogPKrRLt0RnP
         kNGmVHjtYbay6+kpQL7YuNvAagKAn1/qJrxwGyqGRsXxbarxoRBWl3b1GTHaugWZ6aFO
         Aopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790962109; x=1791566909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYkEOeExnXVYl7DVk7pNZ0jHVMuLD/iLqTtJDBZJL1U=;
        b=Ly0PkgrtOOF0o9eqf/JAQ3t8HwxPiKhDJ4p71W5ohI6LxNOH4uuQwMBwunKnE3jLCw
         9g1+VMekovVt1aYLrC9MGt8+CoB8Ns+q4zFTLpjGjKYtbjY10vLPsA8MsK1EDgH83OWa
         yMh3EvofHG+TtraIOji8mxvKfY8ok7TqVfyeBJtTC2woD8vus5r3RyPFE4KnLhHsdLnT
         hMm8izmH+laJKlDc7imK9c442uYgn4JRwk+8ppde5MO4TIz7FV4XCkZ/KAo/d3pxSyFF
         mHYF977AxzzSJio0b5Si3zpoy71167CsRQ6BRNyMNaZx0Xh29NRc5K67H9aBeZINiFHf
         BtPg==
X-Forwarded-Encrypted: i=1; AKwUvByR6J1nDonTzvOL+6WOpU+szr8Hp7lwwlDFcvrSBGYD/pkBcLarUiu0frxiXbsA1iGRJtj7k/POnI5l@vger.kernel.org
X-Gm-Message-State: AFq9FYLH4uN8KT7iaeHOalY4DNq/rtWXd1qWg9mZMdfnOsyPnWFoLMZh
	VdSsa5ga0rFQkxxhC9RhYClonLbz386Yytwus+YbYmrA/ZluMAHgcW8OI+rUbCp2tNTWvyJ9Vaw
	I3Z8GgC4W6yK1BlesSvTvedhVJkMk+KY=
X-Gm-Gg: AYBFou0AxVGd/hwLb7bmAO2GBXG47A3EUdTlfeoeW65i84+m/tIQX8lfClh0xUxyc/1
	5HglnUhhZpIKvqM5p0J8BavpMGDWtvlpWKUCOBDDlmRYBkMHSDCxA7AtFJdTyX28YATaRwGR4XA
	feJmbs8HoKMtkr7u/07TA15XcRi3T3XZ9N2va+AT5srJxpr1nQwnt9j5baR8gBxJaSUWgovUKK3
	340pffBmZC4Oexwyzt05N0JNipvQhqDLmRxoKmYuBSw6piIR6WNcc6uZYZgLCQS72UR6sxWJQEw
	NyJWCweHJyD/2EL17ZF5SiI7vnwFbRlYBshEFTrhpLrfcGozAzVieNrYfw==
X-Received: by 2002:a05:690c:4191:b0:89a:63da:cbde with SMTP id
 00721157ae682-8ae39c24e90mr13846367b3.36.1790962108737; Fri, 02 Oct 2026
 10:28:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002131634.113680-1-prasanth.padarthi10@gmail.com> <9cfcd3e7-bbc3-47c6-ad43-72b595a90110@9elements.com>
In-Reply-To: <9cfcd3e7-bbc3-47c6-ad43-72b595a90110@9elements.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Fri, 2 Oct 2026 22:58:16 +0530
X-Gm-Features: AclHuK_-cjgeNcqjWWE-fRWp3-4f5pXhe0bXkxn9mUfCwvl8hZuFbXmIKRHKAIY
Message-ID: <CAMFFDGhCMr+9OV4ceo+SG=xrsoASB2AiFSUZwMJpyQou+eR-fg@mail.gmail.com>
Subject: Re: [RFC PATCH] soc: aspeed: Add B650D4U power passthrough support
To: Tan Siewert <tan.siewert@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, joel@jms.id.au, 
	ryan_chen@aspeedtech.com, Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the clarification Tan.

For context, I sent this RFC to document the hardware-backed experiment and
request guidance on the correct kernel-facing implementation.

Using the current OpenBMC integration with the B650D4U hardware, the host
can be powered on through the standard D-Bus command, and the OpenBMC web
interface correctly reports the server power and host state. I validated th=
is
on the real board before sending the RFC.

The RFC was therefore intended to obtain feedback on whether this sequence
belongs in the kernel or should instead be expressed through the existing
GPIO and pinctrl configuration. I understand from your review that the
separate SCU passthrough driver is not appropriate, so I will investigate
the GPIO request and pinctrl configuration and withdraw this implementation=
.


On Fri, Oct 2, 2026 at 10:17=E2=80=AFPM Tan Siewert <tan.siewert@9elements.=
com> wrote:
>
> On 10/2/26 3:16 PM, Prasanth Kumar Padarthi wrote:
> > Add the AST2600 SCU passthrough selector support used by the
> > ASRock Rack B650D4U host power-control circuit. This RFC includes
> > the driver, Devicetree binding, and board node to discuss the final
> > kernel-facing interface.
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
>
> This is definitely not the way how to solve this. I've already said on
> linux-aspeed as well as off-the-list, requesting the GPIO lines is
> enough and enabling GPIOP passthrough here does not make any sense, as
> it would be disabled by pinctrl anyways.
> There's a whole implementation in userspace to solve this issue (at
> least if you use OpenBMC). The issue you're facing here is, from my
> point of view, a configuration error, and you'll not solve it with a
> kernel driver that literally just enables GPIOP passthrough...
>
> So my answer to this patch is:
> NACKed-by: Tan Siewert <tan.siewert@9elements.com>
>
> > ---
> >   .../asrock,b650d4u-power-passthrough.yaml     |  23 ++++
> >   .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  |   5 +
> >   drivers/soc/aspeed/Kconfig                    |   9 ++
> >   drivers/soc/aspeed/Makefile                   |   1 +
> >   drivers/soc/aspeed/aspeed-b650d4u-power.c     | 110 +++++++++++++++++=
+
> >   5 files changed, 148 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/soc/aspeed/asroc=
k,b650d4u-power-passthrough.yaml
> >   create mode 100644 drivers/soc/aspeed/aspeed-b650d4u-power.c
> >
> > diff --git a/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4=
u-power-passthrough.yaml b/Documentation/devicetree/bindings/soc/aspeed/asr=
ock,b650d4u-power-passthrough.yaml
> > new file mode 100644
> > index 000000000000..e6451d17955c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power=
-passthrough.yaml
> > @@ -0,0 +1,23 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/aspeed/asrock,b650d4u-power-pas=
sthrough.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ASRock Rack B650D4U power passthrough
> > +
> > +maintainers:
> > +  - Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: asrock,b650d4u-power-passthrough
> > +
> > +  aspeed,scu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +
> > +required:
> > +  - compatible
> > +  - aspeed,scu
> > +
> > +additionalProperties: false
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > index a4e384588a54..86291c250562 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > @@ -32,6 +32,11 @@ gfx_memory: framebuffer {
> >                       size =3D <0x01000000>;
> >               };
> >       };
> > +
> > +     host-power-passthrough {
> > +             compatible =3D "asrock,b650d4u-power-passthrough";
> > +             aspeed,scu =3D <&syscon>;
> > +     };
> >   };
> >
> >   &fmc {
> > diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
> > index 11e4db998c06..1b0281e0bfb0 100644
> > --- a/drivers/soc/aspeed/Kconfig
> > +++ b/drivers/soc/aspeed/Kconfig
> > @@ -58,6 +58,15 @@ config ASPEED_SBC
> >         Say yes to provide information about the secure boot controller=
 in
> >         debugfs.
> >
> > +config ASPEED_B650D4U_POWER
> > +     tristate "ASRock B650D4U host power passthrough"
> > +     select REGMAP
> > +     select MFD_SYSCON
> > +     default ARCH_ASPEED
> > +     help
> > +       Enable the AST2600 GPIO passthrough selector used by the
> > +       ASRock Rack B650D4U host power-control circuit. This selector r=
outes the host power pulse through the board's passthrough logic during pow=
er sequencing.
> > +
> >   config ASPEED_XDMA
> >       tristate "ASPEED XDMA Engine Driver"
> >       select REGMAP
> > diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
> > index 5f61bb4cc36c..3e9618d1eafc 100644
> > --- a/drivers/soc/aspeed/Makefile
> > +++ b/drivers/soc/aspeed/Makefile
> > @@ -5,4 +5,5 @@ obj-$(CONFIG_ASPEED_UART_ROUTING)     +=3D aspeed-uart-=
routing.o
> >   obj-$(CONFIG_ASPEED_P2A_CTRL)               +=3D aspeed-p2a-ctrl.o
> >   obj-$(CONFIG_ASPEED_SOCINFO)                +=3D aspeed-socinfo.o
> >   obj-$(CONFIG_ASPEED_SBC)            +=3D aspeed-sbc.o
> > +obj-$(CONFIG_ASPEED_B650D4U_POWER)   +=3D aspeed-b650d4u-power.o
> >   obj-$(CONFIG_ASPEED_XDMA)           +=3D aspeed-xdma.o
> > diff --git a/drivers/soc/aspeed/aspeed-b650d4u-power.c b/drivers/soc/as=
peed/aspeed-b650d4u-power.c
> > new file mode 100644
> > index 000000000000..22a6925539dc
> > --- /dev/null
> > +++ b/drivers/soc/aspeed/aspeed-b650d4u-power.c
> > @@ -0,0 +1,110 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <linux/device.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/mutex.h>
> > +#include <linux/kstrtox.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/bits.h>
> > +
> > +#define ASPEED_SCU_PROTECTION        0x000
> > +#define ASPEED_SCU_GPIO_PASSTHROUGH  0x4bc
> > +#define ASPEED_SCU_GPIO_ACTION       0x51c
> > +#define ASPEED_SCU_UNLOCK_KEY        0x1688a8a8
> > +#define ASPEED_B650D4U_POWER_MASK    GENMASK(27, 26)
> > +
> > +static struct regmap *b650d4u_scu;
> > +static DEFINE_MUTEX(b650d4u_lock);
> > +
> > +static int b650d4u_set_passthrough(bool enable)
> > +{
> > +     int ret;
> > +
> > +     mutex_lock(&b650d4u_lock);
> > +
> > +     ret =3D regmap_write(b650d4u_scu, ASPEED_SCU_PROTECTION,
> > +                        ASPEED_SCU_UNLOCK_KEY);
> > +     if (ret) {
> > +             pr_err("B650D4U: SCU unlock failed: %d\n", ret);
> > +             goto out;
> > +     }
> > +
> > +     ret =3D regmap_update_bits(b650d4u_scu,
> > +                              ASPEED_SCU_GPIO_PASSTHROUGH,
> > +                              ASPEED_B650D4U_POWER_MASK,
> > +                              enable ? ASPEED_B650D4U_POWER_MASK : 0);
> > +     if (ret) {
> > +             pr_err("B650D4U: passthrough update failed: %d\n", ret);
> > +             goto out;
> > +     }
> > +
> > +     if (!enable)
> > +             ret =3D regmap_write(b650d4u_scu,
> > +                                ASPEED_SCU_GPIO_ACTION, 0);
> > +
> > +out:
> > +     mutex_unlock(&b650d4u_lock);
> > +     return ret;
> > +}
> > +
> > +static ssize_t passthrough_store(struct device *dev,
> > +                              struct device_attribute *attr,
> > +                              const char *buf, size_t count)
> > +{
> > +     bool enable;
> > +     int ret;
> > +
> > +     ret =3D kstrtobool(buf, &enable);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D b650d4u_set_passthrough(enable);
> > +     return ret ? ret : count;
> > +}
> > +static DEVICE_ATTR_WO(passthrough);
> > +
> > +static int aspeed_b650d4u_power_probe(struct platform_device *pdev)
> > +{
> > +     int ret;
> > +
> > +     b650d4u_scu =3D syscon_regmap_lookup_by_phandle(pdev->dev.of_node=
,
> > +                                                   "aspeed,scu");
> > +     if (IS_ERR(b650d4u_scu))
> > +             return dev_err_probe(&pdev->dev, PTR_ERR(b650d4u_scu),
> > +                                  "failed to get AST2600 SCU regmap\n"=
);
> > +
> > +     ret =3D b650d4u_set_passthrough(true);
> > +     if (ret)
> > +             return dev_err_probe(&pdev->dev, ret,
> > +                                  "failed to enable power GPIO passthr=
ough\n");
> > +
> > +     ret =3D device_create_file(&pdev->dev, &dev_attr_passthrough);
> > +     if (ret)
> > +             return dev_err_probe(&pdev->dev, ret,
> > +                                  "failed to create passthrough contro=
l\n");
> > +
> > +     dev_info(&pdev->dev, "enabled GPIO passthrough selector 1\n");
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id aspeed_b650d4u_power_of_match[] =3D {
> > +     { .compatible =3D "asrock,b650d4u-power-passthrough" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, aspeed_b650d4u_power_of_match);
> > +
> > +static struct platform_driver aspeed_b650d4u_power_driver =3D {
> > +     .probe =3D aspeed_b650d4u_power_probe,
> > +     .driver =3D {
> > +             .name =3D "aspeed-b650d4u-power",
> > +             .of_match_table =3D aspeed_b650d4u_power_of_match,
> > +     },
> > +};
> > +module_platform_driver(aspeed_b650d4u_power_driver);
> > +
> > +MODULE_DESCRIPTION("ASRock Rack B650D4U host power GPIO passthrough");
> > +MODULE_LICENSE("GPL");
>

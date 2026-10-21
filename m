Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792621008;
	b=hBD6eUUif6xtKTBe+pH+sj9cc6rLZg0QM1gME1PknY2xVZ4u7K76Bk2aQjQ4I5fALiRP
	 KOEDfSGGa6ro9BGg8wkPmvsIC5eJKHDwRubHl2PVBfqaNoegJSJG9ae4jn6SiVDdJvNwf
	 OSXwFxTii55HdlSDAknK2unxVkAGfeXg0zys2f/jnMfS/YQkxSviYSh51Fj8Odx8p7r8R
	 +MkhF8aP3zjF+wakEat7SwoYrgYt9EM1k5kuAazLIQvYHKX0GPuiImYKLsPuCz7hIf9sO
	 rdNQ5UHsN+6AOl3OjbsJ3RRJul4Xrx4u3cEAjsiazay8LrMmyJ5Cv36CL9O2esmaUVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792621008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pBxmybFhraH/PZu9TzxWt83yv/Plj5oQ+sfyrvjnp7k=;
	b=ERgpQ1lEvbUE3p+3SfjcVmfQ9GI+J7cgDAjNeKL4S62Iy8f5NH3U73Y4ni0gnYs7Uw5z
	 q6WFdN9is2yurJkMipfTrC5OssH5NA629CBhd9SeRIPCneEUxow5AYuAaVLBPa6j6N2Wi
	 BGu3WXBJSzbnvQQC5E/3kDRrXhaothpSuXXdSACuZz6jbI2wi1ck3g/xDdLuJXfo9kmTL
	 pbXaXdVaOSRC029xF6bJbxDlx7bdk2ze0rVeb6WS0DZTQiOb++H9wpLXG4tcDdh2zcxkZ
	 OVMH2ssZ0avWZedFcMtPGSdjdM4EfWA/zOvlHgOINUIiSMWNibFySV2hKrm29XTvJVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Pp3zPBI7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBB6606A325
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 22:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DBB6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Pp3zPBI7
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b10d24345dso12151507b3.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:16:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792621007; cv=none;
        d=google.com; s=arc-20260327;
        b=iWUOAR+BsCCnDGqdIhsrjcRQ1VteaE/ry8h3vNtdgWvWGialgiMHNqhAD+UygjxBQU
         0alBJMbFhk5rW4f7tzJ7Te5Y4s2gckXjyd4iqdi1UQ6kiRhzT8i747RI+My390q/rmc7
         4r3sxeSpxP1z2o1wDhuIBI9Cl4aBBP8DfRx+Wsn/YpLq39z8oMg7AcXOO3Gd3ZlG1LHv
         48t0/3XBrienXqrRJXcCsutnwrHVjUL2nKYgYLsDMCGNM1c18DdhPUE/RodYDS5GBGw2
         kNqeHTXDd2prEnuKq5LR2/jfCzhDwFsWQbqWf1FzXRkVh7+Atyz4cvlM3eDQl8WEE0OX
         v2dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pBxmybFhraH/PZu9TzxWt83yv/Plj5oQ+sfyrvjnp7k=;
        fh=PTJtvnM7jFBLrtyPbjEMeKNl5D5DBb32i2VKGZjLIhc=;
        b=sl0ncRlTYQY7huw4mmRpbIh3xaBY5CnIRmm1DYE8FsYg4efGvUHww82ddS3BNcPlVJ
         LbOuO7hq32bpVOFAlTaHUl/b/iBrQmZ4dFgOFHk6GAgftlX8zl08ynjl/PZUB6Uxib4q
         wRsxs5sKEcjxx5tZ9RS9Q2UKTNtHzFJKx+Q4IzHyBbw+NDtAwGjD8k2F8teWfY3rR4dW
         LJ/sPy3ACbvT4zsqcoKWHTkt4WnM0wEUqWhboGVi/kd2wvW1wcfygpGaYHVadeCp9xrr
         CyHHti2mt9MxrRpj5H/BD7pR9xStqoFTb3d5+/5CgaVALehtKvP3ffMneM1w6M5mws3D
         nSgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792621007; x=1793225807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pBxmybFhraH/PZu9TzxWt83yv/Plj5oQ+sfyrvjnp7k=;
        b=Pp3zPBI7GONExxATnfQd52OQh2njdUvt29F7MQp/AEVn70HzNcoaPB4/yDg8KSOeLq
         7wfrAe7ITktoLrUPAlRn2bXTEEP+lCh5VC3UG57EE8x/1HrBVgZUuwFgvxtiwwCITWnx
         k3x6DEkwQMjRO/7/TY5b4wQnKs0Yrbk+/XvFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792621007; x=1793225807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pBxmybFhraH/PZu9TzxWt83yv/Plj5oQ+sfyrvjnp7k=;
        b=qAdiVJvsggNUETvuNDdBFu7RSXa7P64pW369+AiTUVj41qVAjZb3IQC42q4iyExPuO
         rLuv++xYGnqQj4K9SegxcRvso5dAm8T+Uw0l2yLP1B3w6bUCKNWpBoYljyfe5C+D5iC9
         kgYxXBdWAw3pjbC5Zet498kCID8tve3M8FX3RVq6fWGbWQO/VZ2rjfuRpntPmCavWH0C
         OwX/vl4iksK3fs9Ml0+1IvMdcFnuHVU9jXkKQmnagq+n842HMAitzrFIO5MQm0c9Sz52
         rkX6WtmYXTuoUUaGWmbjN9zd9oh2eaZmD+vbZa00is0gOUAzWKadJ46oXfMJvIJ9MI/2
         lAAw==
X-Forwarded-Encrypted: i=1; AKwUvBzN7RzLiBfdz1JA0P2TUaV5sxKI0zoU7SwTSc+aPeiWLSbIMHWBw8cvgdOb0VTn6+dakPltCGDGlgqn@vger.kernel.org
X-Gm-Message-State: AFq9FYJO5T+XF1EIfTVBiFBW8Pk2E0t0iviLi+4x7HPsr9NT+UQE622G
	s6sJrBKiW7FipMmHVzbGp5qE4g3u5LHhv8kwpQuX8zTKmzIu2UUPYkHVMIjmwuEJsO7tU/ycePm
	LjVeBJNHZByR1aoSVWBFrlBCX6WRWxiKCTvYqjFY2
X-Gm-Gg: AYBFou22FLpPcGy8qABaBmzuq8ocqrA7au+bu2T0k+R82VKj0wfSIgxcLH8KJJCRoWF
	21WsDQ7Yfan1ROwRfL4nAQyYBHKlW8kNEpGC9xxyHgPyNMTBLOwWose4cZu+A6k5Q+vqTQX6OjI
	6anMxQmr/pDGj83ri6pKkYXL3Vj7GrY6MPlKPAoe0OkzPAsQ7pi9j2ibUoI0xp7GN+hltB4GaPB
	n14LTJuAiKCedQTBK+Haf/KrHIiYIjK2EbunK79clEvUWL+Ld7s0JZyUdfWcYYYKeiur4BnPYYz
	G8SoMjG09YVWhhGY62des0TN3+ynXDrPfUgDjYEhrIChtaQRdOecdgEq3qlaI9wBPyeEHKrNZGK
	VmfQpPQKt+GlPAF8xEmU5Xta/QdUevf6Wqu2UVag2bQwHT9uSEj5/l23GAY0ckqEzRg==
X-Received: by 2002:a05:690e:14ca:b0:679:938d:a5e1 with SMTP id
 956f58d0204a3-67a0e5d5717mr1652923d50.106.1792621007076; Wed, 21 Oct 2026
 15:16:47 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
 <20261019-send-upstream-v6-3-cb9ba4b3d6fa@chromium.org> <sashiko-outbox-178136@kernel.org>
In-Reply-To: <sashiko-outbox-178136@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Wed, 21 Oct 2026 15:16:36 -0700
X-Gm-Features: AclHuK97y_1C_fXZ7yRJHnp3ya3ECqu5ReTQG8sTLOF0eRq_fLLRwG53TU5NjZo
Message-ID: <CAEe3GZGsfB+zi3Qf6buPWP_3hkw9bsd4mB=PtBrp4irtM5Z0zA@mail.gmail.com>
Subject: Re: [PATCH v6 03/11] HID: spi-hid: add transport driver skeleton for
 HID over SPI bus
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 12:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] HID: spi-hid: multi-value sysfs attributes and missing ABI docume=
ntation
> --
>
> commit 4c66f3d16c395b79d0997b29357fb80b5a6f2708
> Author: Angela Czubak <acz@semihalf.com>
>
> HID: spi-hid: add transport driver skeleton for HID over SPI bus
>
> This commit creates the spi-hid directory with its Kconfig and Makefile, =
and
> adds the initial core driver skeleton including basic device structures,
> sysfs attributes, and probe/remove functions.
>
> > diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/s=
pi-hid-core.c
> > new file mode 100644
> > index 0000000000000..02a7608c4b882
> > --- /dev/null
> > +++ b/drivers/hid/spi-hid/spi-hid-core.c
> > @@ -0,0 +1,213 @@
>
> [ ... ]
>
> > +static ssize_t bus_error_count_show(struct device *dev,
> > +                                 struct device_attribute *attr, char *=
buf)
> > +{
> > +     struct spi_hid *shid =3D dev_get_drvdata(dev);
> > +
> > +     return sysfs_emit(buf, "%u (%d)\n",
> > +                       shid->bus_error_count, shid->bus_last_error);
> > +}
> > +static DEVICE_ATTR_RO(bus_error_count);
> > +
> > +static ssize_t regulator_error_count_show(struct device *dev,
> > +                                       struct device_attribute *attr,
> > +                                       char *buf)
> > +{
> > +     struct spi_hid *shid =3D dev_get_drvdata(dev);
> > +
> > +     return sysfs_emit(buf, "%u (%d)\n",
> > +                       shid->regulator_error_count,
> > +                       shid->regulator_last_error);
> > +}
> > +static DEVICE_ATTR_RO(regulator_error_count);
> > +
> > +static ssize_t device_initiated_reset_count_show(struct device *dev,
> > +                                              struct device_attribute =
*attr,
> > +                                              char *buf)
> > +{
> > +     struct spi_hid *shid =3D dev_get_drvdata(dev);
> > +
> > +     return sysfs_emit(buf, "%u\n", shid->dir_count);
> > +}
> > +static DEVICE_ATTR_RO(device_initiated_reset_count);
> > +
> > +static struct attribute *spi_hid_attrs[] =3D {
> > +     &dev_attr_bus_error_count.attr,
> > +     &dev_attr_regulator_error_count.attr,
> > +     &dev_attr_device_initiated_reset_count.attr,
> > +     NULL    /* Terminator */
> > +};
> > +
> > +static const struct attribute_group spi_hid_group =3D {
> > +     .attrs =3D spi_hid_attrs,
> > +};
> > +
> > +const struct attribute_group *spi_hid_groups[] =3D {
> > +     &spi_hid_group,
> > +     NULL
> > +};
> > +EXPORT_SYMBOL_GPL(spi_hid_groups);
>
> [Severity: Low]
> In drivers/hid/spi-hid/spi-hid-core.c, bus_error_count_show() and
> regulator_error_count_show() format both an unsigned error count and a si=
gned
> last error code in parentheses ("%u (%d)\n") into a single sysfs file whe=
n
> userspace reads bus_error_count or regulator_error_count via spi_hid_grou=
ps
> (which is attached to .dev_groups in the later ACPI and Device Tree suppo=
rt
> commits in this series).
>
> Per Documentation/filesystems/sysfs.rst, sysfs attributes should export o=
ne
> value per file without custom formatting or mixing types, and new sysfs
> attributes should be documented in Documentation/ABI/.
>
> Should bus_last_error and regulator_last_error be split into separate sys=
fs
> attributes (or moved to debugfs), and should Documentation/ABI/ entries b=
e
> added for the attributes in spi_hid_attrs?

Will drop these attributes in v7. Already reported via dev_err() and
tracepoints.

>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-send-ups=
tream-v6-0-cb9ba4b3d6fa@chromium.org?part=3D3

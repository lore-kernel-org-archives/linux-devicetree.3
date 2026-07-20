Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05A53DFC65
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 11:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784545634; cv=none; b=frphDhsYpV3ShiQYzPsIkukKVjEYrHA6M1twyD3geWjlv5uSSDLr7BZpRLzjYLSnSsY9l0RT6ISF7Sc28/AI53MSC4BQRhgnJqLgoPKy1JgtH2X5J6L4WIuuBAOk+IwaN7Of3c4oKT9LUnsg6GOYA8KwH3M+ZV4PI5mC3oBn5co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784545634; c=relaxed/simple;
	bh=WWAuBpJuM1odnG65HUT646N/thKeCcHH8xjoUDAj8b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0MI+Fwt14mOm9YzLPepth5X5RUz8prZ965YXE1mSG3O1z5Rlt4NSXXwaV74z0eLm0FuXkCgDrI18RS4KiiurGHF6c8oFpyYbdVGHWYje6nyIcNeOZ3bP4RzwvewY/4bSSfy8GaZ/yGtsUuAGM/EQ2IA+5VmSeMWeTSBtX0qwb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCbhVijI; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCbhVijI"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47640541585so4987418f8f.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 04:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784545631; x=1785150431; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/zgIrLwdkZiGqMFiiLYoRASN/eMBGS8ykh70vVqSw+I=;
        b=ZCbhVijIqPdnXWMEbgRzyuwyK9KXSl5zkQb0/xvr4KtcQrC6ja4oMTKdRe68HAWEuT
         OEBLAcaDETwGm255bOqmaBjlVBtuxWrLJIM0sXff4y+awWf0aDVJihX1fHk5etPbEBuy
         3z8N5qFk51hLjlYVhd4rnnGI5WYvUQoE3rgEVOaI6V/8tQ8Nm2+erNz14Ugx/Gd88CiN
         C+Up42QS8DYveWQkJyL7FYDo3xVI4ix10yqmO4qBPLbR4ITdJy5Wbk+zZFmqa4i95dHZ
         eD5Pji9tcFXrP2zMN9rxIGqQLXXoY8oDD5WB4ISb11uvWUW9ayFYvIBlxxvGfnUvhZeZ
         mTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784545631; x=1785150431;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/zgIrLwdkZiGqMFiiLYoRASN/eMBGS8ykh70vVqSw+I=;
        b=ch/faALmLlbARW4eNc73SyMtyhBLg0pCAVevy/PeERCyKoCVKOKhEQ0DOkRu4bGw2c
         OxkFlK695b2mJUEVBZW4znd6I9AT2Ckt8MNitwN1uswwKO/etfgBox0PK9vB1UfMDKfm
         pKQg+k21CUy6bOsUjluwZWYF+Eym3zN/w/Xb9hgfn5ILmfl9mSjO3+WywCM5R3evChZm
         p5wZD/SxIBFbncKj5oB0lyajmDpieTUbJygmXhiFReIrVBz/8rgiee8NZFmLeg0PcGWe
         wSHTXCDtVbAJykIhgBy4VhsGAOrJaJlwzCkR4Odc8n3WN5TJTMTJv91xfjKBBTWNeH5i
         qLFw==
X-Forwarded-Encrypted: i=1; AHgh+RrCFsRTGJQpMVThtY3zJZtuhkmbVyWb3/GOqRmBIf6YA0dLmGf52QCd4lNtg/7Qh6Zig88jOBpzym0J@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0VCdP90ZZPGhneWtm7UAwHBAXfQ3NPzYUxCaZfamxmcdqwZKE
	SzRwTMTv+iPmOrphw+ATXVENFbk7EumelS1OeGsaphmRbxSdBraBzuRW
X-Gm-Gg: AR+sD11eTe2HdIRmpuwoY98pAD/1DdEbPYng08EW8p8UrnzTZGrikGD65Jx5a0gPrJn
	LifzKdYpDIvzxVzeMTW/dbVSr5zg90yEsFvpYRd7tFzdSQrKUaSC1pXvESalxpHkCuub22ANd0g
	XPIRFQgBp+4564YebW6TZZ9zDSbS/xn+kMAfOMvhZiGcG9OmBtnnHAPo1xCMHZ8imNdX/5GZdIo
	z+xWSOzaGIYUNpLNkMV9ZN30gqobjv8/2027aKuPPPn5pu7dumlA+d4N03zcv1aVaPUoytwu2UA
	S3234omO0I3WI/MHj48FXY9uFZT70QO4n7HKLa/dht0OkkM7iGHtYu5PKnRWR/w4l/HJduTlDPg
	DCMtNt4hX2bPTC5KFOLTxgKFWofMArWP9pGeU+VX+04NvrJ8v0VHqEorw//gqwUiKrsGblZd5p0
	yMHmsr
X-Received: by 2002:a05:6000:298f:10b0:47f:6609:c60a with SMTP id ffacd0b85a97d-47f6609c66bmr10493764f8f.35.1784545630478;
        Mon, 20 Jul 2026 04:07:10 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49acesm28009004f8f.6.2026.07.20.04.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:07:10 -0700 (PDT)
Date: Mon, 20 Jul 2026 12:08:16 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Stefan Popa <stefan.popa@analog.com>, linux-iio@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Lechner <dlechner@baylibre.com>, 
	Nuno Sa <nuno.sa@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Siratul Islam <siratul.islam@linux.dev>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Ciprian Hegbeli <ciprian.hegbeli@analog.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: adc: add MAX40080 current-sense amplifier
 driver
Message-ID: <al3-oTXgPQ0eQLF4@nsa>
References: <20260715063652.368501-1-stefan.popa@analog.com>
 <20260715063652.368501-3-stefan.popa@analog.com>
 <gnkthebcxlpbwvbo774hap4mphqro4gxho4zemj6p3ixa2qp7g@ncb5o7tw5wf3>
 <20260718004145.079c5262@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260718004145.079c5262@jic23-huawei>

On Sat, Jul 18, 2026 at 12:41:57AM +0100, Jonathan Cameron wrote:
> On Wed, 15 Jul 2026 16:23:11 +0200
> Nuno Sá <noname.nuno@gmail.com> wrote:
> 
> > Hi Stefan,
> > 
> > Some comments from me
> > 
> > On Wed, Jul 15, 2026 at 09:36:17AM +0300, Stefan Popa wrote:
> > > The MAX40080 is a bidirectional current-sense amplifier with an
> > > integrated 12-bit ADC and an I2C/SMBus interface. It measures the
> > > voltage across an external shunt resistor and the input bus voltage,
> > > storing the results in an internal FIFO.
> > > 
> > > No existing IIO driver covers this device or a register-compatible part.
> > > The closest relatives target different silicon with incompatible register
> > > maps and feature sets: max9611 is a unidirectional high-side sensor with a
> > > die-temperature channel and MUX-selected gain and no FIFO/PEC, while
> > > max34408 is an 8-bit multi-channel current monitor. The MAX40080 has a
> > > device-specific register map with bidirectional 13-bit current, a 64-entry
> > > FIFO, PEC, a single-measurement mode triggered by an SMBus Quick Command,
> > > and two selectable input ranges, so it warrants its own driver.
> > > 
> > > Add a direct-mode IIO driver exposing the current and voltage channels
> > > with raw and scale attributes, a configurable oversampling (digital
> > > averaging) ratio, and PEC-protected register access. The two selectable
> > > current-sense ranges are exposed through scale/scale_available; the
> > > current scale is derived from the shunt-resistor-micro-ohms device-tree
> > > property.
> > > 
> > > Link: https://www.analog.com/media/en/technical-documentation/data-sheets/MAX40080.pdf
> > > 
> > > Co-developed-by: Ciprian Hegbeli <ciprian.hegbeli@analog.com>
> > > Signed-off-by: Ciprian Hegbeli <ciprian.hegbeli@analog.com>
> > > Signed-off-by: Stefan Popa <stefan.popa@analog.com>
> 
> A couple of follow ups even though v4 is on list.  
> 
> That should indicate clearly why you should slow down and let people
> get to earlier versions.
> 
> Jonathan
> 
> > > diff --git a/drivers/iio/adc/max40080.c b/drivers/iio/adc/max40080.c
> > > new file mode 100644
> > > index 0000000000000..a0c1144cfda7c
> > > --- /dev/null
> > > +++ b/drivers/iio/adc/max40080.c
> > > @@ -0,0 +1,630 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * MAX40080 Digital Current-Sense Amplifier driver
> > > + *
> > > + * Copyright 2026 Analog Devices, Inc.
> > > + */
> > > +
> > > +#include <linux/bitfield.h>
> > > +#include <linux/bitops.h>
> > > +#include <linux/cleanup.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/iopoll.h>
> > > +#include <linux/math64.h>
> > > +#include <linux/module.h>  
> > 
> > Typically I would say you're missing mod_devicetable.h but now we have:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/linux/device-id
> > 
> > You might need to base your series on linux-next though.
> 
> I merged rc2 into the IIO togreg (and so testing as well) branches to resolve
> merge conflicts with that series.  Upshot is just don't bother
> including mod_devicetable.h in any new code.  Also don't worry
> about including any of the linux/device-id headers unless you don't
> get them via i2c.h, spi.h etc
> 
> > 
> > > +#include <linux/mutex.h>
> > > +#include <linux/pm.h>
> > > +#include <linux/property.h>
> > > +#include <linux/time.h>
> > > +static int max40080_read_iv_once(struct max40080_state *st, u32 *iv)
> > > +{
> > > +	u8 buf[4];
> > > +	int ret;
> > > +
> > > +	ret = i2c_smbus_read_i2c_block_data(st->client, MAX40080_REG_IV,
> > > +					    sizeof(buf), buf);  
> > 
> > It's not clear to me that i2c will use safe buffer all the time (from a
> > quick look). So I would say to make this DMA safe the usual way we do in
> > IIO.
> 
> I2c always bounces unless you use specific dmasafe functions to indicate
> that your particular buffer is DMA safe.

To me it was not clear because of:

https://elixir.bootlin.com/linux/v7.2-rc3/source/drivers/i2c/i2c-core-smbus.c#L604

In the above case it looks like the buffer is just passed to the
controller and it won't fallback for the emaluted case where
i2c_smbus_try_get_dmabuf() seems to be always called.

Having said the above and looking (briefly)  at the .smbus_xfer_atomic() users, not
sure it will be such an issue.

- Nuno Sá
> 
> > 
> > > +	if (ret < 0)
> > > +		return ret;
> > > +	if (ret != sizeof(buf))
> > > +		return -EIO;
> > > +
> > > +	*iv = get_unaligned_le32(buf);
> > > +
> > > +	return 0;
> > > +}
> > > +  

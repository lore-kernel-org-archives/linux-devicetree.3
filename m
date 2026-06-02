Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31F33DA5AD
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 12:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780402963; cv=none; b=MuVEI3DW6fiKrVhhtim3wfd335Bglq2ecLl1+vXdwHzLy+/tGB3C2vaZDcWjD8pEcdP07bikU6sARAux9Du4RLMjf8xos3bYOC+GYy4X1aPRf4eaD8zL5a8nNRp6bbK2Wc8WL6f8PH92it+n0llARVCa/dLbBfiF+aRfP7hCSJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780402963; c=relaxed/simple;
	bh=KUMtbd37dKGW7VFJni4oIu86+xQIgZrAuruSShZ+uag=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=D+E8EdphYmt5ZfWv1iHnWvaTfxe2ySlSyn0MLkU/n6xGe3ADums1njxRRaMCti1ZkasE0HzpWyVZQWYRfhz7hl61Si/QDOnKK6nOSKG2SndQnZrPMNt3+y254oSRUXLwHH+bAvmezxZmoJZws5CQAxJ8P+Mk/OesAyKCSBBwnJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Np1827Bj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Np1827Bj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b09e4cccso7806605e9.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 05:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780402960; x=1781007760; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QSNb+iVRstZYqJOYyT+xflLdmOYKtCw1pPY1NcbZIU=;
        b=Np1827Bj81KUr/1+2wFvdo5f1sYWSjxV89S6oB5cvFvUkGWopSyi/O0Fzks5qGz4p+
         PAd3sZABuBQwhBP7HNnDdJILhYeyErPXtwKsblxXTNIWC0nNx/OZP2s3Xbv9xTjwDgJi
         nPnUf85F+gucnIL31IeAcsRAoaklDJj0ypfPhZWVg1qFgoJT5/NPQrYDDOmyKWjh2zS6
         K8jpAZUlgtgPYQTB1jNYrlsNxtA6aa9U6kqClyqBTFb7lJM1OANUbbRi5+zFf1Q096YC
         16Dalpo2ocL7Vxhm3+GyfD4IVe2tR7dwTNIJGtFArLMhIDgfzH8eAaPsUbL04YzIRpIA
         DKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780402960; x=1781007760;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7QSNb+iVRstZYqJOYyT+xflLdmOYKtCw1pPY1NcbZIU=;
        b=Zh0kMKTvDJi6iHLZ9N69hy0iJXjFO+I+74ETkW+ztfvdZeERmIY2nfe4ZsVzeglcQt
         LAsSDPTC/vzQyWZEyRa0tTRQsl3ruj62nDzmFFaf/txLiDUvgb9kmM3bN3v6/Dek5V30
         MKcj587JV91qsHm8U0vHw8x7zyW5YaN+zC72jpOo2nZWxzjH01uZLdIrcDifrgkufLs6
         f0Axva+U/fPEUl5R1uEgchnD7A1+NoxE7RR5sPxcospYXy4DlhqscLrnempmfa/aluB4
         rgx2RDWk0MNW3i6BBYvqpxCeuNOsTGEHfd2Vg8LT2Pc9PFO2jICsrx14k9tIFFtJQ92K
         wujQ==
X-Forwarded-Encrypted: i=1; AFNElJ/c7mpOrgpHpXSifCVr7J7xyNHtIsSCe8tRUCR7WG/OChWz8Q3RWVRNIi8SFgAlU76JivbqRqAL9/4L@vger.kernel.org
X-Gm-Message-State: AOJu0YyRxjZUBnhVX5Myv4gG6rdvtEIzeizazbYbjON19Dgj65cLwH/M
	a+ilawBt21NiNwKbiPRMSNdyfih49N/dXHcK4U2lSLuSHZnPSRYVb4r/
X-Gm-Gg: Acq92OGTIJICoeciTJIWWyjWZpAHQyt46mLnZxAxDAqWf5qXP917UMyN0kyOMpXUDVG
	yt6nPF6IdUQ0PI7Gfxa/CcMc2B37AP45OUZ3ChlG1OWdcw24RQZVLtUMtTpA3NLAVcspxFWW314
	9pVTI2Tsjw/uxBO1DFa1yt2sFsYUpKE6InFbkr3kZ8G/1dAFHKEEj2uStF0Z5JeKxryQZd9gPre
	o8BEgxsephH1s8HhvZdPcnevqD/ui+OJ3enkdui/1z+RH3zle5A7OlYV5OtLSrWWHiNs7c0Uhiu
	KLD4IXrP66XHgC3i9Qt/D25FMX9qkw+KqV1JRcETWdafus/59bL9oDkzT5eSJ+pVcKUSRWOLAcz
	CEn0hulsfgtcDVuyZTzjaphCNfcJ6wwZxHXv5vYJVcP8K+D72Sh+56zwq43jUCQAwi61+f20K/8
	UAn2bMZPLmPbvZpFchysup7chfBQbvOLTPVghZVXLwa20XqTI=
X-Received: by 2002:a05:600c:1c0a:b0:490:846d:e2de with SMTP id 5b1f17b1804b1-490a293fcfcmr291135115e9.28.1780402959943;
        Tue, 02 Jun 2026 05:22:39 -0700 (PDT)
Received: from localhost ([2001:4bb8:152:df59:3b69:56ea:a39b:adb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490aab4f87esm39386465e9.22.2026.06.02.05.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 05:22:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 14:22:36 +0200
Message-Id: <DIYK6APQQX6S.2KLGTD0G5GCDA@gmail.com>
Subject: Re: [PATCH v4 2/4] iio: light: add support for veml6031x00 ALS
 series
Cc: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Jonathan Cameron"
 <jic23@kernel.org>, "Lars-Peter Clausen" <lars@metafoo.de>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Rishi Gupta" <gupt21@gmail.com>, "David
 Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, "Matti
 Vaittinen" <mazziesaccount@gmail.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Joshua Crofts" <joshua.crofts1@gmail.com>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260531-veml6031x00-v4-0-e64f7fdce38d@gmail.com>
 <20260531-veml6031x00-v4-2-e64f7fdce38d@gmail.com>
 <ah6p-f2RCW8VcuDR@ashevche-desk.local>
 <DIYI40YK6CSX.2P4017PHVJHCT@gmail.com>
 <ah66ljSiIc0ywFC2@ashevche-desk.local>
 <CALoEA-wdakU-Ei2FE3WpGR+CYRDN1bjv2sZ=XJ01ZeH3NP8xeA@mail.gmail.com>
 <DIYJ5ZACTWVS.13T8L275VHTKM@gmail.com>
 <CALoEA-w3TqD=2YP36=ScmRttmmG3BBCKvtfSqeJL0PVxRxEbuQ@mail.gmail.com>
In-Reply-To: <CALoEA-w3TqD=2YP36=ScmRttmmG3BBCKvtfSqeJL0PVxRxEbuQ@mail.gmail.com>

On Tue Jun 2, 2026 at 1:47 PM CEST, Joshua Crofts wrote:
> On Tue, 2 Jun 2026 at 13:35, Javier Carrasco
> <javier.carrasco.cruz@gmail.com> wrote:
>> Thank you, Joshua. One question, though: maybe you remember that your
>> last driver was missing one header (which I am not criticizing at all,
>> as you can see I missed some too!), and I am wondering if it was because
>> iwyu missed it and if so, how that could be avoided.
>
> About that - I didn't actually run iwyu on my driver, I recently migrated=
 to
> Fedora and forgot to set up LLVM and iywu-tool :-)

I installed IWYU and added your mapping for a quick test, and it wants
to add a million headers or so:

python3 ~/iwyu/include-what-you-use/iwyu_tool.py \
    -p . \
    drivers/iio/light/veml6031x00.c \
    -- \
    -Xiwyu --no_default_mappings \
    -Xiwyu --mapping_file=3Dtools/iio/iio.imp

drivers/iio/light/veml6031x00.c should add these lines:
#include <asm/byteorder.h>                     // for le16_to_cpu, cpu_to_l=
e16
#include <linux/bitops.h>                      // for BIT, const_test_bit
#include <linux/device.h>                      // for dev_get_drvdata, devi=
c...
#include <linux/errno.h>                       // for EINVAL, EBUSY, ENOMEM
#include <linux/limits.h>                      // for U16_MAX
#include <linux/pm.h>                          // for pm_ptr
#include <linux/stddef.h>                      // for NULL, true
#include <linux/sysfs.h>                       // for attribute_group
#include <linux/types.h>                       // for __le16, bool, aligned=
_s64
#include "asm-generic/bitops/builtin-ffs.h"    // for ffs
#include "asm-generic/bitops/const_hweight.h"  // for hweight8
#include "linux/array_size.h"                  // for ARRAY_SIZE
#include "linux/cleanup.h"                     // for guard, scoped_guard
#include "linux/compiler-context-analysis.h"   // for __must_hold
#include "linux/delay.h"                       // for fsleep
#include "linux/dev_printk.h"                  // for dev_err_probe, dev_db=
g
#include "linux/device/devres.h"               // for devm_add_action_or_re=
set
#include "linux/err.h"                         // for IS_ERR, PTR_ERR
#include "linux/iio/buffer.h"                  // for iio_push_to_buffers_w=
i...
#include "linux/irqreturn.h"                   // for irqreturn, irqreturn_=
t
#include "linux/kconfig.h"                     // for __ARG_PLACEHOLDER_1
#include "linux/regulator/consumer.h"          // for devm_regulator_get_en=
able

drivers/iio/light/veml6031x00.c should remove these lines:
- #include <linux/bits.h>  // lines 9-9
- #include <linux/units.h>  // lines 17-17

The full include-list for drivers/iio/light/veml6031x00.c:
#include <asm/byteorder.h>                     // for le16_to_cpu, cpu_to_l=
e16
#include <linux/bitfield.h>                    // for FIELD_PREP
#include <linux/bitops.h>                      // for BIT, const_test_bit
#include <linux/device.h>                      // for dev_get_drvdata, devi=
c...
#include <linux/errno.h>                       // for EINVAL, EBUSY, ENOMEM
#include <linux/i2c.h>                         // for i2c_client, i2c_get_m=
a...
#include <linux/iio/events.h>                  // for IIO_UNMOD_EVENT_CODE
#include <linux/iio/iio-gts-helper.h>          // for GAIN_SCALE_ITIME_US
#include <linux/iio/iio.h>                     // for iio_chan_info_enum
#include <linux/iio/sysfs.h>                   // for iio_const_attr, IIO_C=
O...
#include <linux/iio/trigger.h>                 // for devm_iio_trigger_regi=
ster
#include <linux/iio/trigger_consumer.h>        // for iio_poll_func, iio_tr=
i...
#include <linux/iio/triggered_buffer.h>        // for devm_iio_triggered_bu=
f...
#include <linux/interrupt.h>                   // for devm_request_threaded=
_irq
#include <linux/limits.h>                      // for U16_MAX
#include <linux/mod_devicetable.h>             // for kernel_ulong_t, i2c_d=
e...
#include <linux/module.h>                      // for MODULE_DEVICE_TABLE
#include <linux/mutex.h>                       // for class_mutex_construct=
or
#include <linux/pm.h>                          // for pm_ptr
#include <linux/pm_runtime.h>                  // for pm_runtime_put_autosu=
s...
#include <linux/regmap.h>                      // for regmap_field_write
#include <linux/stddef.h>                      // for NULL, true
#include <linux/sysfs.h>                       // for attribute_group
#include <linux/types.h>                       // for __le16, bool, aligned=
_s64
#include "asm-generic/bitops/builtin-ffs.h"    // for ffs
#include "asm-generic/bitops/const_hweight.h"  // for hweight8
#include "linux/array_size.h"                  // for ARRAY_SIZE
#include "linux/cleanup.h"                     // for guard, scoped_guard
#include "linux/compiler-context-analysis.h"   // for __must_hold
#include "linux/delay.h"                       // for fsleep
#include "linux/dev_printk.h"                  // for dev_err_probe, dev_db=
g
#include "linux/device/devres.h"               // for devm_add_action_or_re=
set
#include "linux/err.h"                         // for IS_ERR, PTR_ERR
#include "linux/iio/buffer.h"                  // for iio_push_to_buffers_w=
i...
#include "linux/irqreturn.h"                   // for irqreturn, irqreturn_=
t
#include "linux/kconfig.h"                     // for __ARG_PLACEHOLDER_1
#include "linux/regulator/consumer.h"          // for devm_regulator_get_en=
able
---

If that is correct, I bet there is almost no driver prior to IWYU that
has all the headers :D

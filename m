Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576F33E3160
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787819425; cv=none; b=MGjlaDtq99ShMPcRNRuZG4zq79diPDgrkC7nne0cfeLUGu71iGVh4jgPJeDkNiN3GMduGlWE1ULf5mpBFzEMqzmlVbscVpt6suJjOKnjuZG62Nbl+1b9kXpWUAUXb4gsQPo46sidcnh58p+eSBZqbusUBE7b4m56QdfNIhUxxuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787819425; c=relaxed/simple;
	bh=yJpyF+5Tc3G8tE31WpMqXfWM3y43ClMVTYl+eMZsTmI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W0YwD5Bp/jtI9bAX+ulQTsAIIzWMvLmymKg4+gocJCIEtlXQRjKOQfmPA6jMZ/q6TQa095O8fdRmgAaiaNPRejJv4AdlEjwxLUQoFzpuY7s9WJfaZRKK5bHL0yU+ApoDwoAFLTVem7afILOuaZ2TXNbfTB3EHw0d77TrYShhISg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJamGOWR; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJamGOWR"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b966dd74so9431065e9.3
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 01:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787819421; x=1788424221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gv10IZgS+I8/TcY7gcREpSsUvzMsxKqW3sbwG8Jb3QY=;
        b=aJamGOWR4RskmKAgdzroTT/6XZdn0jLXN4eI42AFneeGhUeKClD8v+xJHo6cd5//dR
         l+7TljvSWDuY2EkxK7lCpsSrJbgYwL9U7KqMIDJ4IH7QYhvaVE/3Gb/lzDwSVHjgr0pu
         nBm86C3Bg69rJtasMMPnQgTISlRCTkJ0O6l1sOvee7utl6ZiIrNh6LxGsqMaHE66u6rN
         AEPpTQoKZSnri660Aqi9iWkuaIVfG/kJwvOd7VKTc7Dic3OkMayKLuXFThQ4bCRN4qZf
         PNQcWp0xRtx18Z1Cs+wQAlxRcMFLCLMTQMnwQz5yukSyzYipkXQkcDT+XGnyPgSma9Zm
         BNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787819421; x=1788424221;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gv10IZgS+I8/TcY7gcREpSsUvzMsxKqW3sbwG8Jb3QY=;
        b=ZBNO3AscUTJPlts4STA6vFqPnveeiif+zhz3oBz51lB5VZTt4YXEjmKtpEYOgXloPL
         89Pe2GhoGTl737UjXjc8/b7ngAZ91FpdWTZC24FZQ5xSDs4mPtiRTQcRPSgLx/EMW/Wg
         jR73epCXdbbQbwTEQV+m2JsPGIvbfxRxSp39UGpK8pjbPnQ2hpAI2KFc4BPa03Iqx2iW
         KQ+ewJC8w18pI9VLyIuSPdnwPt8SxNoURCDngtK58ZNVm2PFk7N9NPy3nNpHjfoLX0bS
         UPV33NjmUEptj+s8qgKdvosFZEXVgMqLG5Uf+UEJyJTXVbcWySuNjYbQazywCcUjb9pV
         2wVg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3XrTZutIoq1A6InkeBtJILn2Ebu5cIhl62qGczLKLtmIjzFUCUEW9WQ+3qAZonimFh7qLUQmr/nJV@vger.kernel.org
X-Gm-Message-State: AFuF++mY2Pwm4m9eQDszSTZKhB8wt7Af6b+5yqNx48Ij7qsZEOOlfMAc
	QllYbcPuwZBeBdKw3DLUa+LU3PfZUuXS+LfzZft2izXFLEqjChy6RrJa
X-Gm-Gg: AR+sD137gsVFHxSozrngEij+/eM1evFVDtuKn8srRPuj+pXynOg5dTNPENuivZh7uP9
	+0z6N7MfTs74T2L+2xJR7qwwyIPfCUm3kYvT9vnuU6VmMlKUB6pFvdIO7Dk0VOEa0gHPn8FY1ES
	HZC7px7iRaXCskPmpk2Zpzo1oYvX+p5ro6sR+jmxNIfxwacPyhJhMtsvX937cDB86M0LRsBn1n0
	U1+VCfuSHa8DXwGBAixmKzu8lJupgcoCMyzpfpcFnPeJk4TGHVIIuFg8NBE+DuLTEJJlD0WaAKh
	JVJ9U8Ma/5u1YmxaytKv73upOL5xsTqASQvbdFNSZRqfGFgHTVj9R3hDQp+oAeGELwY+ePk15yp
	FfAGBB9oDiAM3bZV2ApqJj8li/noJcyu7CAHACt9ioukVwhIQtIvp9AoO24PApKfWWG2hRf4waC
	nFrPFnUN15VA1OUOdqaLUmnfo3h2oeCoLK0wyyaM6rgPoA8rQtFVurjA+WWil4wOdjJwqnLgBVN
	O2kpdn06q+7+5TbWuaezVHLult+sYRZQqbT61FcO7jIWndV679nq93Q+wH/TwSRDEAHSTet9NrZ
	tIzoolbceBbTSXyxMEq5fF6LH6ygQst40zSDrBo42ltjGiOOoQ/134pyFSxQcqejSJkiH0Kr/s8
	/Yvk6+rX5kJjjEQp8qmQqe8KRXgY5+2KfhtC4yc3FelXaI3Zba4Ao17S0iQTZmBBhQM2/NHK8o/
	8sdSzu
X-Received: by 2002:a05:600c:a0d:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-499dc6e9b00mr152209385e9.3.1787819421205;
        Thu, 27 Aug 2026 01:30:21 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd56826bsm53438315e9.4.2026.08.27.01.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:30:20 -0700 (PDT)
Date: Thu, 27 Aug 2026 10:30:19 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, "David
 Lechner" <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "Jonathan
 Corbet" <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Mark
 Brown <broonie@kernel.org>, Marius Cristea <marius.cristea@microchip.com>,
 "Marcus Folkesson" <marcus.folkesson@gmail.com>, Kent Gustavsson
 <kent@minoris.se>, Conor Dooley <conor.dooley@microchip.com>, Daire
 McNamara <daire.mcnamara@microchip.com>, Paul Walmsley <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, Janani Sunil <jan.sun97@gmail.com>,
 <linux-spi@vger.kernel.org>, Kent Gustavsson <nedo80@gmail.com>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v10 3/3] iio: dac: Add AD5529R DAC driver support
Message-ID: <20260827103019.00002663@gmail.com>
In-Reply-To: <20260827-ad5529r-driver-v10-3-38f2be07b824@analog.com>
References: <20260827-ad5529r-driver-v10-0-38f2be07b824@analog.com>
	<20260827-ad5529r-driver-v10-3-38f2be07b824@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Aug 2026 09:34:48 +0200
Janani Sunil <janani.sunil@analog.com> wrote:

> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/dev_printk.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/iio/iio.h>

IIO specific headers should go after the generic <linux/*> headers,
it's just convention.

> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +#include <linux/spi/spi.h>
> +#include <linux/types.h>
> +#include <linux/units.h>
> +

...

> +static int ad5529r_write_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int val, int val2, long mask)
> +{
> +	struct ad5529r_state *st = iio_priv(indio_dev);
> +	unsigned int reg_addr;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		if (val < 0 || val > GENMASK(st->model_data->resolution - 1, 0))

There is a function for this - in_range(), in linux/minmax.h.

> +			return -EINVAL;
> +
> +		reg_addr = AD5529R_REG_DAC_INPUT_A(chan->channel);
> +
> +		return regmap_write(st->regmap_16bit, reg_addr, val);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +

-- 
Kind regards,
Joshua Crofts

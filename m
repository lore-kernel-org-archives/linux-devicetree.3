Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC10318EC1
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 09:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785661449; cv=none; b=fJX+b7Sulcenqlvvoptc/ggym4+tg1L6ucQyViSsr8dCZZIKf3UYBFYhnGXi7tK7N9sqNnl+NnWklWVwDF5lVLEGMnqlAuGMevlOp1Mdy5g2N5NQcBHI1AM6YNFzP7ZQrZhz+6+0dxmi7XXvDoj5P5YNliDhi/VopTGZBwFmhhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785661449; c=relaxed/simple;
	bh=XoqwTzBTDw0ldPHh8ANmlH4Zu4YUOeLFd2ixic5ddNw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rvsk/FScLh2we8TdSnfXfJezmopIOrvdCU2EKbsExuRZxVvko3r0XgBD8qWaqkHMwAIci5H9agUOtkKTkgufWec/RryUeN5J6ch10vC1vN0Z0Q3JFYifwjcUMU23w5teAUtMycVP19LmmREB0QO9tgKZBVJYzY8d5X8DbnPjhFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lStp2W/D; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lStp2W/D"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49553515a8bso18590375e9.1
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 02:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785661445; x=1786266245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KLNngFHUaW4FMnMMnOZ4ee/Vyns/yW+WufUQsHnkGgI=;
        b=lStp2W/DxU44DcfIaqwGkszwmLSUYfjd6d1nZmvUTu9qDyc5YrR55OQM/qelXZAiym
         snP1KDyR3CBcf24WNAKvGZU1+MjMF3uBoB2FVnEvyUkqPHEjWJbAAIeID/xVf7aGK8wS
         wBdaquxyj7LsasO2ziK0lxo/ovcnWfdfMHIu6/EOO8nSIOsrnKssImg03jLud3y4Jiw/
         bBoJKnnLCjFv+L0Suv+JTAYZL+ZHgK9T68mJwoDM0nGH+tNou6recLCy3sSEx1+h48OF
         JGhaTu2cM2w21wvhrAkoZc4/YW4x/zzn3zSG68evkH9DkYmOoJ8ZDZZwHwBtZnJQP6gU
         XEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785661445; x=1786266245;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLNngFHUaW4FMnMMnOZ4ee/Vyns/yW+WufUQsHnkGgI=;
        b=PB4K27H0KV//udx4YnBj+ayu2Kcw+drEav6AdVzWIl5rD3EzJdg/VQXt16YSzn4Sli
         LK/qoMxHmciDjo2cHcaZgmFLWSJBf0gQnyHKgumUC0FeidC7clJ3HictHzvkRbkfXiwk
         6h9FL0oxa1ugw9ooewyuEyJM11/wNXmUuoS7k2krsMxUz01hAhYSs9/R0r6kSK7HZtLp
         cO5yavFwYObd3949aXDa3HNguDtP+XN/423C/+n33vtRijXtfDFT9s/u1bZMp2jDUs+g
         7o9uQU0Tz89kW4bP/DYs5JTCmUEaMW1Mcl2Nt9d/ezto5mhyivzmwyU7Df9LLIwzPi60
         mwtw==
X-Forwarded-Encrypted: i=1; AHgh+Rpbabjwmot3LHzXPlPHH+Dg0VHiGCEnezJd3WIYc5A5SVpZbFVqxQSko16iYb0DynibQePRrJNg5e4E@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6avdK5SZRdZgzxN5lDXc1Ptf0UEuHcjScUlS1K866nw6D9Ju1
	b1TPpsYrAR1v+oUxRgwMUQuLySEOt+NwIdWaGiEgRrWq+5otmdl/2jTQ
X-Gm-Gg: AR+sD10rqvt+QvrQ81DcCnynPDOkzGeXt52WH5IfJe2NvwXrWGeWCKmJgEKzOZ1nNpc
	BNVlyERFPOw+Bkwu3T7JVoZpXOJhO95oTopjBwBPTIpz5M8D0l6vP/OLqS9UBxZd2n/jMZ7rlqI
	Kiw+nTELA5n3V6idu715Mah+WA1p1Wd3XjpiJSvALWmMdNc0UiDvJnbQZEcdy6T+F+hCgCQV7yZ
	evI47G7Kqe1eFgm55pYRD1MkKuHztukXCt891XWYkE+d3AZktXscGlrI+LElw76MG5St8Mzw4GP
	3B8HfoRqypZuRVgFS4NWZOiOXNf/JtnUTotwP9xh+BcxaMACV9MUnVpJzmfl+R0E+1H+2xxfwS0
	wtm/v8G5kPI8uT0CdTMxsKr7O3dRZ3HOffcX0xjfYysuHpDWD3AVZrrFENHwkpBCu6u47KXCkz4
	dJy15hSfCQTz3nW3c/UCh9i89s4/Qmk8LcU8HxU1Cj8wQq6EehZJ+NRb71DkfALgiHCqYie/Ywd
	BJVri1a3SveiBOcT3xfYNUhHw==
X-Received: by 2002:a05:6000:2dc5:b0:47f:34ba:2d0d with SMTP id ffacd0b85a97d-47fd72a9061mr14609516f8f.8.1785661445068;
        Sun, 02 Aug 2026 02:04:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd4562a38sm22160461f8f.21.2026.08.02.02.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 02:04:04 -0700 (PDT)
Date: Sun, 2 Aug 2026 10:04:00 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>,
 rodrigo.alencar@analog.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org, Lars-Peter
 Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, "Gustavo A.
 R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v10 11/17] iio: frequency: ad9910: add basic parallel
 port support
Message-ID: <20260802100400.588fa107@pumpkin>
In-Reply-To: <20260802015607.7d7d4dd8@jic23-huawei>
References: <20260729-ad9910-iio-driver-v10-0-aa1f6167729e@analog.com>
	<20260729-ad9910-iio-driver-v10-11-aa1f6167729e@analog.com>
	<20260802015607.7d7d4dd8@jic23-huawei>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 2 Aug 2026 01:56:07 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Wed, 29 Jul 2026 09:25:38 +0100
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> 
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Add parallel port support with amplitude, phase and frequency channels.
> > Those will be buffered capable channels, but only basic control of offset
> > and scale are implemented at this point. There are separate amplitude
> > and phase control for polar destination, which will provide different scan
> > types. Enabling and disabling of parallel mode will be implemented with
> > buffer setup ops or with update_scan_mode() once IIO backend integration
> > is in place.
> > 
> > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>  
> Hmm. Curious... clang --version gives 22.1.8 on x86_64.
> 
> make LLVM=1 LOCALVERSION= -j12 W=1 C=1
>   DESCEND objtool
> Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>   CC [M]  drivers/iio/frequency/ad9910.o
> In file included from drivers/iio/frequency/ad9910.c:10:
> In file included from ./include/linux/clk.h:13:
> In file included from ./include/linux/kernel.h:26:
> In file included from ./include/linux/math.h:6:
> ./arch/x86/include/asm/div64.h:113:8: error: invalid operand for instruction
>   113 |                 asm ("addq %[add], %[lo]; adcq $0, %[hi]" :
>       |                      ^
> <inline asm>:1:7: note: instantiated into assembly here
>     1 |         addq $2147483648, %rax; adcq $0, %rdx
>       |              ^~~~~~~~~~~~
> 1 error generated.
> make[5]: *** [scripts/Makefile.build:289: drivers/iio/frequency/ad9910.o] Error 1
> make[4]: *** [scripts/Makefile.build:549: drivers/iio/frequency] Error 2
> make[3]: *** [scripts/Makefile.build:549: drivers/iio] Error 2
> make[2]: *** [scripts/Makefile.build:549: drivers] Error 2
> make[1]: *** [/home/jic23/src/kernel/iio/Makefile:2184: .] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> 
> > ---
> >  drivers/iio/frequency/ad9910.c | 154 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 154 insertions(+)
> > 
> > diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad9910.c
> > index b41b011af281..aaeff2e7640e 100644
> > --- a/drivers/iio/frequency/ad9910.c
> > +++ b/drivers/iio/frequency/ad9910.c  
> 
> 
> >  static int ad9910_read_raw(struct iio_dev *indio_dev,
> > @@ -691,6 +753,48 @@ static int ad9910_read_raw(struct iio_dev *indio_dev,
> >  			*val = 0;
> >  			*val2 = tmp64 >> 14;
> >  			return IIO_VAL_INT_PLUS_NANO;
> > +		case AD9910_CHAN_IDX_PARALLEL_PHASE:
> > +			*val = 0;
> > +			*val2 = AD9910_PI_NANORAD >> 15;
> > +			return IIO_VAL_INT_PLUS_NANO;
> > +		case AD9910_CHAN_IDX_PARALLEL_FREQ:
> > +			tmp32 = FIELD_GET(AD9910_CFR2_FM_GAIN_MSK,
> > +					  st->reg[AD9910_REG_CFR2].val32);
> > +			tmp64 = (u64)st->data.sysclk_freq_hz << tmp32;
> > +			tmp64 = ad9910_rational_scale(tmp64, NANO, BIT_ULL(32));  
> 
> Process of elimination points me to this line which is a slim wrapper.
> 
> static inline u64 ad9910_rational_scale(u64 input, u64 scale, u64 reference)
> {
> 	return mul_u64_add_u64_div_u64(input, scale, reference >> 1, reference);
> }
> 
> David, any thoughts?

Lots of instructions only support sign extending 32bit immediates.
The asm constraint for the ADCQ needs to be "erm" not "irm".
I bet that is true elsewhere as well.

See source/arch/x86/include/asm/div64.h line 114

I'm actually surprised you see it with clang - it usually prefers the "m"
constraint.

I'll try to find a source tree that is clean enough to generate a patch.

	David


> 
> For now I'm backing out the series.
> 
> > +			*val = div_s64_rem(tmp64, NANO, val2);
> > +			return IIO_VAL_INT_PLUS_NANO;
> > +		case AD9910_CHAN_IDX_PARALLEL_POLAR_AMP:
> > +			tmp64 = (u64)st->data.output_current_uA *
> > +				AD9910_NANO_MILLIAMP_PER_MICROAMP;
> > +			*val = 0;
> > +			*val2 = tmp64 >> 8;
> > +			return IIO_VAL_INT_PLUS_NANO;
> > +		case AD9910_CHAN_IDX_PARALLEL_POLAR_PHASE:
> > +			*val = 0;
> > +			*val2 = AD9910_PI_NANORAD >> 7;
> > +			return IIO_VAL_INT_PLUS_NANO;
> > +		default:
> > +			return -EINVAL;
> > +		}  


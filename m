Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109B13B8405
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 16:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778603771; cv=none; b=lUmv3xNWsCFYxpjvRqxlfa3MhVWbrNS2CIKSAHKJ7b8ZOjzTUYd/dkmGW3DVEJxkHA22sbPw8izUTIG5Lsd4t6p+EIAKbD+nzw4ovJ6gQAuuiU8QWRn0YilDj+Y+/BRSrWJ8mWrlYc8KLSZIum/uL0LEgdwMlasxogKGB1WOxck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778603771; c=relaxed/simple;
	bh=G+elPRfb5pjp9ejJ2WFTvVTAj2Yq9+7JbBIVvG0CSuc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqQ6EmVTjm0fA/A7u4cQzLF6G0m7BzmBrPoz1MqlKA8sbnrS0BrWX/24/XweBzTWvs++Z/Q7NIdXpIYShjJsxDGM27Q6A7wzjLrdaO+yNXNb4DxT8Z+16z9tnwarB3Nml81bXxbefXpTGq8fgnVxTdkSaAUJ8lzBcG3l/Kcdzwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DG5r0Uzq; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DG5r0Uzq"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bd373f83042so41457766b.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 09:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778603765; x=1779208565; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kZd2jwWErlU8p+pvlP7UuokLuT/ajSujPqtlbnDh3o8=;
        b=DG5r0Uzq3ftjrnFlOFBuVc+zijdhTixDy9nUfaFbUG2UnVng7RGKRuMbGvkZPY5Oef
         biURNe9goVxypxI74ZPNUfkBHA7ObQmHaTHjie8/JM6qAE2cQk2x+AscZVgq/47ilqB3
         rZpedQqRVZznM+NdvAcsmXFJXT73jzBXjnHN5lYZVLVgf56aVguTABEKj3I2y4EyQjMt
         tntM44DDBPttbEoA6FB9fb4acAh/HYufhJOTaKiE4g6D699pqe5pV+mu8j0h8wBE+v/q
         yAccdRrzuEzN+GOG7L3+UEXvqVvewfdOKEVywRLoUTUzpnbN20RrfJAEmEnSlV0UseQX
         oRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778603765; x=1779208565;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kZd2jwWErlU8p+pvlP7UuokLuT/ajSujPqtlbnDh3o8=;
        b=OSpOOrMArA5yqZUut27oJXlvXNtSfZnQWEhxbMICKdsu0u0fkJ5aC2W8K20G2aLxzw
         zpUtuswVYBUw9NFNIdiALa94lRptwun9XXI0zuOog4mihrxQmCJE7SDDoSlh7U5iDxzE
         Doy/jW0Eu2KACdc5NHe9+zJ+y0Oa55WrX/3qt3eCXiZsZcoxpSEazzZVWL19PDh8Qd6q
         HLRr2N3ogEM+u5u+sGjC+OQuaL9clyDv90BoDsD3mJQ5eR+PyZViushp2TJnjYv1MqX/
         nBckH/tfNpc9wiF3KjT+Y631LLf07qe8P7Ytibk9wwiCkocCOJtjMKaPEg/wOAwq0d03
         yoUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8pTx0rn7UqEux6ouQoh/I/jvQxE1N0qHtd7yKfp0QSyfr+BCThUZmLAVxU0SfQx+m1PS/X2o6lcVeX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw87yZVwS8bWbhKuK6GSyLGv7oHS3V6JBRuB1wNOxXVMZAXdsid
	sHk3J9ztvkbbmIo7+yde0QIiroAKWMkFAmPn+iNy1Rmuwph8OCmSjcAq
X-Gm-Gg: Acq92OHv3BOoeCPrU9F23WAR98Vr0np6NVYtykzqGnaZrwyP3s7BtS4M2xrxS38oMn9
	vQJNc6QSOBrfQMBcYzvLRmmuMoYEMeEeoDPcp/lCFKEZwvGMiN7ooDS2lTs5IjxWV0oRNI3ULBS
	lA4lUJNDDHdzcsDEFOAeGe4b2innLmzJlaAp+ziDjh/wzeST1VjhKe299JrnkGAEGhpNEGdJ4OY
	V9DGRsbOkMCg4N9AIg8/UAYNUlIRBGKuXarweUqjZN5vmk1+wKioJnYNL4zvfK2FvcCKRWjazsV
	jSmezT6RxAHQzaWm29UraepHdCKBuf7t0xp8dRJRVNZ30xUqCkVP2u3AMeR+FlRYDSF/SLPAjpL
	bOm9MICeq+VfqDh1lBPXxevkkt0EHYuV0lOv/UGs3KEnRz3HnMCN4UtdBsroJ70JASpdMXAfldy
	iIFU08+GZ79yGfUR4OApNtsr9FN/oO3EL/6nwwlUdlAyfnW/IRo4umaXLqY/ruoLGdakiNooeRO
	jWvAX7uNRFh66YdK7ripKUMF5NWEXLUIGscDxcosYnSpsPm/Q==
X-Received: by 2002:a17:907:c29:b0:ba7:f5fd:ede0 with SMTP id a640c23a62f3a-bcc11a6e057mr847059466b.6.1778603765039;
        Tue, 12 May 2026 09:36:05 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcb2882737fsm665806166b.63.2026.05.12.09.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 09:36:04 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Tue, 12 May 2026 17:35:59 +0100
To: Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>, rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	David Laight <david.laight.linux@gmail.com>
Subject: Re: [PATCH v12 02/11] lib: kstrtox: add kstrtoudec64() and
 kstrtodec64()
Message-ID: <q4rmlkgecvztnvjg7b7wtqyvhdy7uxgaouvhae2mlsxaasasbf@dfakp4m5l5sl>
References: <20260510-adf41513-iio-driver-v12-0-34af2ed2779f@analog.com>
 <20260510-adf41513-iio-driver-v12-2-34af2ed2779f@analog.com>
 <20260512123953.40d80bc9@jic23-huawei>
 <agMnWzMjW1LwCSyT@ashevche-desk.local>
 <sj6cpjhakyfvv6rgox6cnhl2u2tgaecugcok6fw2l7zgku5wtc@aqx3ul72vgca>
 <agMvlS3-0wvGmBwh@ashevche-desk.local>
 <dxjg2sdyxb7ieb4abmeyyye7qok6cczrxabpsjyjhcbehwoec3@sbbqoo4wmzre>
 <agM8pWrM6j_XksvN@ashevche-desk.local>
 <ur6brs3yjzyb4mtelabmcglxjltddqvjxtgl3lkdkmbjlkmnsq@bwd6rz7gided>
 <CAHp75VeoH3yVfp8NWjKfc_df0VRLkyf_SK4e==-wJOEodVjW_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeoH3yVfp8NWjKfc_df0VRLkyf_SK4e==-wJOEodVjW_A@mail.gmail.com>

On 26/05/12 06:21PM, Andy Shevchenko wrote:
> On Tue, May 12, 2026 at 6:11 PM Rodrigo Alencar
> <455.rodrigo.alencar@gmail.com> wrote:
> > On 26/05/12 05:43PM, Andy Shevchenko wrote:
> > > On Tue, May 12, 2026 at 03:12:24PM +0100, Rodrigo Alencar wrote:
> > > > On 26/05/12 04:48PM, Andy Shevchenko wrote:
> > > > > On Tue, May 12, 2026 at 02:21:14PM +0100, Rodrigo Alencar wrote:
> > > > > > On 26/05/12 04:12PM, Andy Shevchenko wrote:
> > > > > > > On Tue, May 12, 2026 at 12:39:53PM +0100, Jonathan Cameron wrote:
> > > > > > > > On Sun, 10 May 2026 13:42:20 +0100
> > > > > > > > Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> > > > > > > >
> > > > > > > > > Add helpers that parses decimal numbers into 64-bit number, i.e., decimal
> > > > > > > > > point numbers with pre-defined scale are parsed into a 64-bit value (fixed
> > > > > > > > > precision). After the decimal point, digits beyond the specified scale
> > > > > > > > > are ignored.
> > > > > > > >
> > > > > > > > Whilst Rodrigo has already replied to say there will be another version
> > > > > > > > I'd like to request final feedback from those who were involved in the parser
> > > > > > > > discussions.
> > > > > > > >
> > > > > > > > They got very involved and I'm far from an expert in the right way to do
> > > > > > > > this stuff.
> > > > > > > >
> > > > > > > > I don't think David Laight was +CC so I've added that.
> > > > > > > > David, Andy - I think you two were most involved in that discussion:
> > > > > > > > Any objections to the end result?
> > > > > > >
> > > > > > > I already said a few times about the naming. I do not like the kstrto*()
> > > > > > > be semantically different on how they treat the input. Second point is
> > > > > > > to avoid code duplication, but this one is less of a concern since the
> > > > > > > new code is in the library close to the other potentially duplicate code
> > > > > > > piece and hence can be addressed later.
> > > > > >
> > > > > > I suppose I reached into kstrtodec64() and kstrtoudec64() because it aligns
> > > > > > with your expectations for kstrto*() semantics, no? Those include:
> > > > > >  - overflow check;
> > > > > >  - extensive input validation;
> > > > > >  - optional '\n' in the end;
> > > > > >  - mandatory nul-termination.
> > > > > >
> > > > > > am I missing anything?
> > > > >
> > > > > When we add scale we basically make that not true. Moreover the code in this
> > > > > patch makes scale == number_of_characters which I think a bit fragile, however
> > > > > it's about the fractional part when the amount of digits is equal to scale.
> > > >
> > > > That is not really the case. It is being set as a limit, so it does check for
> > > > truncation and zero-padding.
> > >
> > > I do not see it happens in _parse_integer_limit(). It doesn't try to parse more
> > > characters than it's requested in max_chars. It doesn't check if there are more
> > > character nor their converted values.
> > >
> > > > > To make this work as expected we need to add an additional call like
> > > > > kstrtoull() (and perhaps drop that \n and NUL-terminator checks) and see
> > > > > if that overflows or not. Since it's a fractional part it must have less
> > > > > than 20 (decimal) digits there, so we check the rv (or how many digits
> > > > > were parsed successfully) and compare to 20. If it's more, we got too many
> > > > > decimal digits.
> > > >
> > > > For overflow it checks the KSTRTOX_OVERFLOW flag and leverages check_mul_overflow()
> > > > and check_add_overflow() when combining fractional and integer parts. The amount
> > > > of characters is not really important there. The scale cannot be bigger than 19 and
> > > > that makes sure that int_pow() does not overflow. The code uses _parse_integer_limit()
> > > > due to the nature of input and to avoid 64-bit division, kstrtoull() at any point
> > > > (parsing integer or fractional parts) does not make much sense.
> > >
> > > Under 'like kstrotoull()' I meant something that repeats needed functionality.
> > > I believe it's parse_integer() (without limit).
> >
> > I think we are going in circles here and we could look at the code instead:
> > - integer parsing with _parse_integer()
> >         - overflow check and validation of the return value
> > - fractional parsing with _parse_integer_limit()
> >         - overflow check and validation of the return value
> 
> No, this is not fully true. That's what my whole point is about. The
> max_chars parameter limits the input check, then it skips an arbitrary
> number of digits and only *then* it checks for \n and \0. What will be
> the result of the
> 0.00000000000000000000000000000000423 in your case? Whatever scale you
> gave it will return 0 without checking on how many digits were
> supplied.

I suppose that is a valid input and 0 is the expected result there.

> All the same for 0.9999999999999999999999999999999000423. My
> point is that we should limit this by 19 digits.

why we need to limit by 19? Digits beyond the scale carry no value...
just like leading zeros to the integer part (which is also accepted by
kstrtoull() when parsing with base 10). Not sure why this is invalid input.

> On top of that, what about -0.9(19 times) ? the fraction should be u64
> in this case and it's fine. The sign applies to the combined value.

yes, range for signed values are verified later.

> 
> >         - extra scaling and truncation happening outside if needed.
> 
> Right, but the given input may be way too long and still needs more validation.

What is the problem with a long input of digits?
C compiler does not complain about this when parsing a float value, python does not
complain about this when parsing floats or decimals either.

> > - check for input termination
> > - combination of integer and fractional parts with check_mul_overflow() and check_add_overflow()
> >
> > > > > Maybe I'm missing these checks already performed?
> > > > >
> > > > > > > Having the test cases is a big benefit, and that part I like the most.
> 
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko

-- 
Kind regards,

Rodrigo Alencar

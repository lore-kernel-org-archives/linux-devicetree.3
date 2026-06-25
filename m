Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1413806D9
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 07:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782372615; cv=none; b=geFQiN2Szc/O6+6PpPre2qJD6jROX0KprRce//bFssrrufFVyfNBZc6mKlnP6m/xrUCN/14YegKaDgbdIgOXzaPA89/uWDkYZUU0POT10UCNZz7OYy5pbqqO/hI7OyY4xObZj9O8nBBoJeZ/RjNbnXeIgS/N+hnrqXl9ZazwtpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782372615; c=relaxed/simple;
	bh=tcB1rds/uzzj4nfKHTALU46dqA5+55+NV76XtXupaQE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QW5cBLt0xsZ0M1h1ZqP6ERWWdJRm5LLY1SIPvUyVi2ZMFIWgndI8wmixpyc5HzC/Uby/ZygoKaozpZjZtxenMBM7OL2L2O1WyBJx8d0SNfCy8WPldCGH09Uaar7jKpBEtbAICROP287kIvzojqcWNLyMeRyAXzp7OwEQ7QPWBuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOGKFqeD; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOGKFqeD"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490cdae130cso10508445e9.0
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 00:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782372612; x=1782977412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PTCS/VbEwbVfOVp9Z3suxyrpmFmcGl/hr2a+SPTASFs=;
        b=DOGKFqeDZdfgryQh5cqzce+e/VkUFql6nuqLuUM/unH/FHWTJcf2ACw3pXk7U5CBUz
         zCdtgrLUaryT/egHs4XPqBElXBSqoCDY5XTxxbP/6bdq9UpQuGjNyod72aqwP4I96IQ3
         9HQOMSXWaSgeD2WsdMdVamZDvGfGZOcK8FL67sYstE/sSIODiKVA+knTnyjEVJzbcM2j
         n/i2c7LYCO7vwWPCdAnGwSBgB/nJys+B2JLonNOvqPOGrhqdyoA6SOVEeb9W9ZGRO0b0
         JPG8HBAN8lM/eolUPVEVza+zJI2S+2r14x+Ly0yCL6+Mg26M/aX7noaNTTWm1vwdnB6J
         6naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782372612; x=1782977412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTCS/VbEwbVfOVp9Z3suxyrpmFmcGl/hr2a+SPTASFs=;
        b=kh9L9mZQZFvcREh12iotQdgsW2Rs+YH+9wXDskBb8g3xC2jhYpCU9N4y4QRjfXgklN
         vQxpat8gYAQR+hxkR3U1DTbrcOKs7HDJREQ7Namu4d+7bQx5h/ch3usOyRJtVy2r/7O4
         Yv3SIVE3i4Ca88c+CfbstZwghJoXPicm9Hl965W2Rd4h0/Fm3w8+zIb5qs2KTkSBIVBk
         TA6sxuz+Spll4wKd//lT7OihXiS4slg8oZx1w2d0FinqEuGiEAnxRZvKMWFwwJVueJUl
         6eRT12FpjWAcrMYSwqaa6BebuRUj0b8nOt8VTq/2z340YweSteE4GsAKUtV2FwpNy/ef
         9NdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RnKGkxmMN92qrSXuuGKG4b+DeZGi/xXY6zTw3bbBr8YhtLJTYTtyvYgjKJ+emM8X1FE4n+cXMwgEt@vger.kernel.org
X-Gm-Message-State: AOJu0YzRNSijc5kVC5dTRmr3rNcx2eIe3fyKZEA95W6oNRM17iZmsXOL
	M2ly9KpNTGCFFE8wDxLBezjbIXVFjKe8f4kRSHCGvGCYONhdKaI7BFRB
X-Gm-Gg: AfdE7cnF4ANuqnp9QYv2+KN5uZzuRLcGOpOK+8aeR4h+jWI5b5bfN8zHCEdkLkXn5pA
	ryswHQcmOjK35SA7MxT2aYbi1PoWu8QttbdpeDuu4BAUIQDr3c/gBkp/bpXBi4SyxYJvFnxa28x
	CXnRMEL4OIOxykxBmHQC70EXoF5fehCUl8Fwskr1wvuvYa9x21afGw9KPweIFeXrJTLGrjBYq4H
	rqHhTfYFnL6CDyDJZNpOKXytcjZ8nmRorkwSlKhALct/vk4WM0fFindqwLmAQgO6vq1Y7BYpAmx
	/uqmhnLvFmF1X6trR7Vm0JN87uI8kIAAMtCB1KrA5halpcdMvgXRpUxlC0PdRhPZcss+5Hwss18
	mqj6nbBP+9NPmr5yQq0JOiyci85cRr0hZq84rGs3BTqJuaR27d5mJR5DiZwhKsAFineFW3qJC2R
	eC2sXYPhVCnreOKs+7H9Lvf8Ow+1arSpC5lgQTwlNEbvzzn63YbqPuM9xuU5uxUSfQRVvCt7/Gq
	6aaSrQ5z7M8UwfIY4Zel7kcxytk
X-Received: by 2002:a05:600c:4e94:b0:490:c2a2:b1d4 with SMTP id 5b1f17b1804b1-492668933e5mr14101565e9.35.1782372611740;
        Thu, 25 Jun 2026 00:30:11 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492660e9f0esm32574495e9.9.2026.06.25.00.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 00:30:10 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Thu, 25 Jun 2026 08:30:07 +0100
To: Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux@analog.com, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v16 04/14] lib: kstrtox: add initial value to
 _parse_integer_limit()
Message-ID: <ssrckqgv3rqpfgxwpx4ca3m5m2mp3frxs6sd673chvsorhsjiq@63t3eosivg3a>
References: <20260604-adf41513-iio-driver-v16-0-1a7d09143bc2@analog.com>
 <20260604-adf41513-iio-driver-v16-4-1a7d09143bc2@analog.com>
 <rvx36i2ydmwhbbkdgbvh26uqchyoptzuu7tleuyarqn2skzkxz@owzwp62mzkdo>
 <20260614210044.19dfc8df@jic23-huawei>
 <20260624155414.61755e9a@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624155414.61755e9a@jic23-huawei>

On 24/06/26 15:54, Jonathan Cameron wrote:
> On Sun, 14 Jun 2026 21:00:44 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > On Thu, 4 Jun 2026 11:09:33 +0100
> > Rodrigo Alencar <455.rodrigo.alencar@gmail.com> wrote:
> > 
> > > On 26/06/04 10:58AM, Rodrigo Alencar via B4 Relay wrote:  
> > > > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > > > 
> > > > Add init parameter to _parse_integer_limit() that defines an initial
> > > > value for the accumulated result when parsing an 64-bit integer. The
> > > > new function prototype is adjusted so that the _parse_integer() macros
> > > > stay consistent allowing for one more argument, which defaults to 0.    
> > > 
> > > ...
> > >   
> > > >  noinline
> > > >  unsigned int _parse_integer_limit(const char *s, unsigned int base, unsigned long long *p,
> > > > -				  size_t max_chars)
> > > > +				  size_t max_chars, unsigned long long init)
> > > >  {
> > > >  	unsigned long long res;
> > > >  	unsigned int rv;
> > > >  
> > > > -	res = 0;
> > > > +	res = init;    
> > > 
> > > This might generate conflict, as the code around have changed in linux-next.
> > > It is an easy fix though.
> > >   
> > Thanks for the heads up. Hopefully that will all fall out when I rebase testing
> > on rc1 once that is out.
> I've done a mid merge cycle rebase as the char-misc branches have merged.
> So this should be resolve on my testing branch now.

https://lore.kernel.org/oe-kbuild-all/202606250230.etPGuolf-lkp@intel.com/

Apparently, the documentation header now includes parameter descriptions.
The new one is missing.
 
-- 
Kind regards,

Rodrigo Alencar

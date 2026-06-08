Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3616C3B42FD
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 08:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908814; cv=none; b=CbWYSWT/jXeV9cFoSiNX8aINMCbrier7FlfVUR5RZlpJBUlDymFienIbcc8J5NUVVem2Rc8sR1K0SdTtli6W/tYDVEQCz+591QLqRGhUHxFb43CeP0TSwhRpdWIXiwuCtIHgCpPxndWGurljtbkTlTMze2F8NKpa9ObIs+BUq8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908814; c=relaxed/simple;
	bh=w0Y03KI/WXTiM1lCd2IZX/tU84nMGP9fpRNtF8Hfbbo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YlnZZAM/PuP8n8gYhqdoW0c4PTsUdp+aT4vodDrvytm4ugupInPIp+DC2IDh02ixiTIzvo/O2xjljruU7cWktC1t+qHI7P0E5aIt82zxAcgQ7DStMz/0IY4GmJvmmGZrz5MiaNsV7J/CB8+5DLXsqCYRZPmHtbgeKlyP8UwfAUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TM5xGRzk; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TM5xGRzk"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68cec9f4c6cso5649880a12.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 01:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780908812; x=1781513612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DF9J0yB3N5s3rQCL1ritzyWIRkWZ9b7iIV38e1+B5kI=;
        b=TM5xGRzkZdNZpaRCT79uyM2cYsWP7DT9kd5wSC1BlM1kXDno2nnXmv9NoiM7aIJ+hX
         9ucBxrWMeI1TtWs4m25rnJPwbERB7H074lqrX6Cze6EMKOmzrJFnWP3H+1hZjR5mcOqq
         eAo+Cthrd/xrvhcJJu3EuDVjS6dotacuypZ238JL/2e/8/QypqcFZeZn+J6grRM5Nr9e
         ZNGhc7Oym0Y6Ulw1QAJrY7jfJNoIAY/gUG28uaZy1qYaDNccfLtu4pSK1fATGfr5L2Oc
         /P8B373ivCmnWWcVo9t8ZW93UUnE6OKJudRXJpSaG2hQ9CNpzDulFb9CVGvUeuvJsvxl
         i4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780908812; x=1781513612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DF9J0yB3N5s3rQCL1ritzyWIRkWZ9b7iIV38e1+B5kI=;
        b=BPSoU+vx2JyD/tpesbQsuYnrg3hbMCJhB8RKtqevYugnJL2UuFMm8NIEaQ5bYGt1f/
         1Lu7wwJbuVXQxLqnyF0X6vVrwik+i56WeAtNsp5+UUpYOmys+Obs8C+8d6pLbPHPfHMb
         0G8lWDx5nWx+mMYor1mtRNYWCyDuBkClWZxhuW0JjHvDSx+ObenYO79OaUjDDCcqoBz1
         hZk9uawY/2oTQ+bBxNPhh1TlzGdSfTIgPP7Lta/yeaj6stoxAY6w58qtgSNsQaZanAu6
         /ha0vWDK9fHWUib+r4ruooaisFzykN0AlNReVHcsPD6gaFUjnunzIZeTXvE8TsbajGqQ
         zqDg==
X-Forwarded-Encrypted: i=1; AFNElJ/DYRZ21BjCR4smqYi4jXJ7rf166Z6iIyB8g6Lmax8t+xh1iU2VWS7Hp6Rvtd7jJO//w5mCAX5p0yQh@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn3iW9fSg5IJB9L1izXynhwF9BpqEDUm4dSjAPkgZT+CQ4EQhJ
	kZCRdAqvDaNOvV0ILqgUpduJGSZSQdT1p2BxZMFmENcp0RfABwJFKZrp
X-Gm-Gg: Acq92OE6b8KXQyjolRwnAfHUE+Z518FncPN/dg5nTDIXntTmOEBwscDNUcqcZIXVtH/
	cNXNkZj+DmCgadhM0pqRaTu5WTWcpmdyiifwG/HLaIFIKlAjlTnz6YLYk/VMrgz8zXosxflR2Wl
	4/eytXEJVelZvOdFNI8m0jmXUgmCIInn2vob7eGIdtuuasD/CtvVTWiO1sIKVyzp7nhUZ+0L+cG
	E83N+RMRqF10l/euzQtEKdMH90BNwA/csFVEEaxcz3Fc5BBTIVGIM/egvXg1C5Vs7ut2rCECKEt
	WYCvs2UzPp2PYMfk0Ix/zyM0UFMXD4C2wbXEJQEBEyowtRpEMENq0zo6DmUWvm31qOUTYU4imAf
	TKI+AInab0aU7ntqdi1U9njSzYN6XXKqDE/5IpjXg7NFogs00YdnxTZT3a4nnwJzRoIoSVmiAqb
	2f0t6LHAqG0X4wB2SrJuujZPPvPIJ2XYwlZmN8a8PKZFGxbcRJYj4eACaH0Z2r7LiQjXlWDosxJ
	YnR4Fy3VVXl/b7zenHZ49kcOz+XVZB5Xfj+5skxvhK5r/O0LQ==
X-Received: by 2002:a17:907:8020:b0:bf4:ad51:bfd4 with SMTP id a640c23a62f3a-bf4ad51c05fmr226578266b.45.1780908811088;
        Mon, 08 Jun 2026 01:53:31 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf41f05041esm424435966b.62.2026.06.08.01.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:53:30 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Mon, 8 Jun 2026 09:53:28 +0100
To: Wadim Mueller <wafgo01@gmail.com>, Jonathan Cameron <jic23@kernel.org>
Cc: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>, 
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Maxwell Doose <m32285159@gmail.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] iio: types: add IIO_VOLUMEFLOW channel type
Message-ID: <6at5vkw3byvbdw3przfchwrqscghdfhuwkv5xf6v6dkvfpplt5@3k3gjxn2ua26>
References: <20260530205435.37326-1-wafgo01@gmail.com>
 <20260530205435.37326-2-wafgo01@gmail.com>
 <ahx5cuM1xlOVP6DT@debian-BULLSEYE-live-builder-AMD64>
 <20260601104233.310ac930@jic23-huawei>
 <20260602-slf3s-v3-reply-03-wafgo01@gmail.com>
 <20260604094436.3c50f123@jic23-huawei>
 <20260607-slf3s-v3-reply-femto-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607-slf3s-v3-reply-femto-wafgo01@gmail.com>

On 26/06/07 12:45PM, Wadim Mueller wrote:
> On Thu, 4 Jun 2026 09:44:36 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > Yes, I'd prefer that for consistency (m^3/sec).  Hopefully the scaling is
> > fine with the new forms that are happy with more leading zeros.
> 
> Ok for m^3/s if you prefer SI, but two things before i switch:
> 
> 1) The scaling is not quite fine with pico. In m^3/s the SLF3S-0600F scale
>    is ~1.667e-12, so IIO_VAL_DECIMAL64_PICO keeps only a single digit
>    again. It would need IIO_VAL_DECIMAL64_FEMTO, which Rodrigo's series
>    does not define yet (only MILLI..PICO). Rodrigo, you offered FEMTO
>    earlier - could you add it? Then i base v4 on top of it.

v16 is essentially ready to be accepted! I suppose adding the FEMTO format
could be done here if needed.
 
-- 
Kind regards,

Rodrigo Alencar

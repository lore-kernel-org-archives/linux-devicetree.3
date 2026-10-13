Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8408851C349
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 20:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924741; cv=none; b=mN3dQwuIRhQJaBENNQJ5YwUyzPuYwfmLBtrGPBOBDl6yQZE9R+ftPOwQQMCSAjZhx/CynwmlX6ScgvO/IkQZk/GPL0wyL4+R3EPogHkP4mznMqlA//uZnY/KbCL8C/cE62uB+OUQ+WxBBxvr5URynmavH9ncJ4/qcXNP5F99f+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924741; c=relaxed/simple;
	bh=9JEk6M/t3MY9SSuk+PIRB8RNo2kp9MkFOx2KwMdtO+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2JriqjLpk91t7+8PL1kZzxqpqouNg4HNrA3dNTA5kBLpj79Y9JavElTwtiMZFj3mUv3Fh2lYkY6wZI0ojPNHFoicPphWmFpm2YXOCkk9RwFn1PInCi5gEmXo9xDXdCFsQNyRFjsg0l6P7qhfzRKSjDd+H8+6Lv5c6qCiq7i8X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYAjcVek; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYAjcVek"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-98301b325c4so965982241.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 13:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791924738; x=1792529538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X5tey+LJTJY08HDXCS/BJlW6ZqEg1h3t9x/9CrciE/I=;
        b=kYAjcVekvYIoZb40tM2amCYBneoyhhCIBYCkGZ4S5isMv2GP8/pWnNSL4lGhcfQVGb
         bTrFbeUqPFpm0EMSu0qnd7brQYGjQATnAskIK8D2mbu40SP7CDcpfStI93qyd33Mx6I2
         g7QWPLJi2Er8xGfkERYWT3g55G8aTYnCvLJH/JfuuxtBacbDlrL4nKNFyNfurDnjKfoF
         9HQnABhV2MfOkDIRDXtHVmGuenPeERcT8GcT0hkCaPTRfqZDg0IMPugiU9HGKKEtFQZz
         Iw4wIjEVYJHUlcjjystkaqX/7UNcb8WYqHSfQXDMns1G37Mrm7zpqp8rK66SAEu98lge
         PWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924738; x=1792529538;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5tey+LJTJY08HDXCS/BJlW6ZqEg1h3t9x/9CrciE/I=;
        b=odfbZlRIFMPZLgCj808gplsj+fXH4boGlNi676ihbANTGqht0VRN+A02NyU4uUIXZm
         IFgeRRMTRZ7LsBELcXEulioATF2ZTQDU/Z5GnOfMepz7PkCo/eAabACdf+0aGjF1bnKC
         dHSY+HIne3xTb0t9X9m1NtJxJk0BZYR1Tv7uc0DVv9fPdsG05IoC1H0CCvDrNWQpo3JO
         B1xUFwtR2EBieK4pfinsACPFUq9Hs8ZPmcTAzCktFRjjlzAAt9MEaR+P2aQdzRcdI2Cy
         aIiGHHwouipWfj3Gip+j2tYVYMp9Bq/aof6G7GAMkUdSoydkAARAnWL90vM1s+uk3+cD
         8buQ==
X-Forwarded-Encrypted: i=1; AKwUvByPTlc7IHtsPsOmnIFHn4iEw+wqW+MChmZ0PEqL7tEsjpIUiu7p+LJ6gVNJvUKhMfImBbqkqvha84XT@vger.kernel.org
X-Gm-Message-State: AFq9FYJjDJcOy4vp9OGJBqW0rzC0Fc+Ya8cnbMrZabnaHiPMyAGLE7B1
	O/1tu/1mJdyjkrXC+7i2z8RJEa7Dzu5lbyEhAeQ5KdJBTKp9w8Wm7siB
X-Gm-Gg: AYBFou1AF0T9W6Ur5EYph5t+V30KdVseIgH+azxHE8KlCjYjWaOCbppT+euAlrcPtTh
	GNJp1a5FmDFzDniI+bP17mtXqMAnUnd/iBrh0iV1da/V+m397+i0Ed+jlxWuWLbLHp4ruQQaZ9x
	XUxLGn5Pp2kWT6xroEvAV27X2MyPx9Ym2oyAu5V3SdIOB3lpCds9uR6NXwZRzEh7ZZtYc35MGDS
	4mYuOTc87ZxRB3lP68sGHMydsBGpyC0pc2XMRH+Zp4JK8KreRXUaiwsEgbhjovic2FMdkq9Xmst
	DTcG4zfFoXauRQ8IuzbJWK+h3c2dwGM4MZvlVwcOrxY5nRsoABNKQ80mLw5xEZQ3bk32sibbLU8
	7iQRNloRfSUAk5ANECtb/E63LzxnqBySdbeqOn9C17+HlUuRZ+EszFnU7SKWPcLqLo7f1M2ZeDC
	r0vJnMdccUfWNPMTPt/YhX/f8/PVgAWqbks9mnT/1I1DCmve6IE76R0o/0f1mwPgDOcd7Scox36
	gDC
X-Received: by 2002:a67:e713:0:b0:7b4:bdf5:9307 with SMTP id ada2fe7eead31-7cb3a17c668mr3406598137.30.1791924738306;
        Tue, 13 Oct 2026 13:52:18 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb39d6396asm9396454137.1.2026.10.13.13.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:52:17 -0700 (PDT)
Date: Tue, 13 Oct 2026 17:52:39 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, marcelo.schmitt1@gmail.com
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v4 02/13] iio: adc: ad4134: Sign extend sample data
Message-ID: <as6aF-dBevp4bF2Q@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1791309733.git.marcelo.schmitt@analog.com>
 <8f22f48cd830338d801342a52fb454607e8b06c0.1791309733.git.marcelo.schmitt@analog.com>
 <sashiko-outbox-162349@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-162349@kernel.org>

On 10/06, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] build: -Wmaybe-uninitialized warning for conditionally assigned 'sample'
> --
> 
> commit 6ed41c1a7f4a36c8c7537ebc2c932623b78e2afa
> Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
> 
> iio: adc: ad4134: Sign extend sample data
> 
> Sign extend ADC sample data for correct delivery of negative ADC input
> difference.
> 
> > diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> > index e53c10b9a44a9..6fdeb27d7a42b 100644
> > --- a/drivers/iio/adc/ad4134.c
> > +++ b/drivers/iio/adc/ad4134.c
> > @@ -172,6 +172,7 @@ static int ad4134_data_read(struct ad4134_state *st, unsigned int reg,
> >  			    unsigned int *val)
> >  {
> >  	unsigned int i;
> > +	u32 sample;
> >  	int ret;
> >  
> >  	/*
> > @@ -196,8 +197,9 @@ static int ad4134_data_read(struct ad4134_state *st, unsigned int reg,
> >  		 * Clock out data from all channels to avoid that.
> >  		 */
> >  		if (i == AD4134_VREG_CH(reg))
> > -			*val = get_unaligned_be24(st->rx_buf);
> > +			sample = get_unaligned_be24(st->rx_buf);
> >  	}
> > +	*val = sign_extend32(sample, AD4134_CHAN_PRECISION_BITS - 1);
>                              ^^^^^^
> 
> [Severity: Low]
> Does this code trigger a -Wmaybe-uninitialized compiler warning?
> 
> The local variable sample is declared without initialization and is only
> assigned conditionally if i == AD4134_VREG_CH(reg). While the regmap core
> strictly validates reg before invoking the read callback, the compiler analyzes
> ad4134_data_read() locally and cannot statically deduce this external bounds
> guarantee.
> 
> Consequently, the compiler evaluates a theoretical path where the condition is
> never met, leaving sample unassigned before it is passed to sign_extend32().
> 
> This can cause build failures in kernel configurations with CONFIG_WERROR
> enabled. Explicitly initializing u32 sample = 0; or unconditionally performing
> the sign extension inside the if block would resolve this.

Okay, u32 sample = 0 is what I've chosen for v5.
> 
> >  
> >  	return 0;
> >  }

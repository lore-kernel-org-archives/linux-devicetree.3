Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DBF278161
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 21:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774906354; cv=none; b=I4J7VxRsgZNswE6eWGLqFVtCPna2I9rrg8p9FCFAGv2/6GVio6rVgnh6DIxcY7jYG6I2TxC3bdC06tsPPN65T8UEcRv5MNPYPk288/t4504JxXirC9Iz/F5rnleovkwHOCaD/GTy6R2pJjNdYcD51t6+hfN97mu9T41RpqQDQQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774906354; c=relaxed/simple;
	bh=cvtXsI4axVwTIovKRprOkchfucaM2+uXUok47XoQg0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z8N9PlADNkqpQfCBoKh2ZHcnxHr5IO0paDKYoKt+5Ydam45NZhElFvkKU5a7/4AcbiqfPnMyXYwM3WhVqCZ1Qb6c/KgFxbhwZUncW3i8DaCUJ7bJNxkj4Wo07rJAC/l4S52s+cmHzCo2Lxoc4EK6IHVprqmAVZOlJMGQJU4CD6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Je/U67KB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Je/U67KB"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-485358f43e7so5513675e9.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774906352; x=1775511152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OKaHuqaVw+GmllxkOaKRS1TDseRwmAHMFWqK5tt5meY=;
        b=Je/U67KBTKBaHpwEX+8h5Df70dNXYvckdPSNlUsuMGGEZVotzjx+qdw8pZIQ+bah1I
         2GWzM+PmN62xn0C/5KeWjXdKrzbTPnRhQftBgmtCdeKIuI+L9iIKZJlkuNW9lkpUn+aj
         ri9KPBicOA9+z/d2QpTSzMG/HcYDG/wAi6s45UVXOEAA2jJgoUdbd8bQIqszkbH3zCYR
         VE56ckMLPZPxw3pvYAJZzxOyBdYQMWzI9fCmbvhnOV3vvZrYrgNZsIPZpZmx2PT3ZCIg
         R2T2csvllhKXtCZogiAr2PBKqCX3t3bweI0fn24360TazEDekiRxiacR+6vNfYF9tCOM
         kBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774906352; x=1775511152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKaHuqaVw+GmllxkOaKRS1TDseRwmAHMFWqK5tt5meY=;
        b=TXgdnxCSYnk0glzsLztniRvl90fGEXmYp5kRxpDLM27pxKWssWUK2eJBMkqWq4Bgz7
         lZ6+apxjosaQrweLCQ8A2Ed8nKv7IXlh5IpPZt2P08uapJ6AceP+hpx4/jOf0RILG12O
         PaIXOPh6H5LMZ7OgLzofN5igYvEAX3tU4quMCeREWEfsih19b3Vo0vN7QNJ/ZvvHmUII
         Va8qOyR7DaYEECS0/75mkaoqA/vX+GtmHCqcWIuR4v7LDOJr9sy10NWXe1NuSB0PLq6T
         fzExdJijhsJXyxfqojaIS9FAw8wjNNe9AhxczVjSVzV9E3ntmyINxKXFsRgIn/iLEYkN
         0pMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQNXRpLEsYLh5MnPqDvNF+jrVEDw8n+p1Nmy6il5oeikWR0NY6vR3M4W9G/LQuK+qtnIUlftcHS+tA@vger.kernel.org
X-Gm-Message-State: AOJu0YziTZ93CdDKew0Z8ms9T1pEIcqgWv1yDSpU4lkFyxNgAuPhBxHM
	aiI5f3Abbds5te8X2z6Og63FC3E6IjaeQg+qJ28GnbeQtjcxvbRsrQnD
X-Gm-Gg: ATEYQzz2yTWGDeDZlHPEqs6y0kzHmztpNSqFZW37ID/THQ6j3esrGkSC7V1yPcQnuex
	58xC5z5UCOSUSKlBdMVnWR3kEg40EUR6jvAIhNSd/QD2pxXV7ARCE8nMTM4HBWq9V3/BQKcrg3q
	Z1fdHV+bKI7HEjMW8DcIPHKGVvd+wBP0qf2s9hp3KV0cTjTjtpm07ah1kLyQGQwY9wTRgQU3Vp0
	8LkxPWSOL/TXg5BfA6+JCMmE9XVb2fIqXAj61lq2YUhZ5hin4NhdOner3RbDxvjinryZYWShLhf
	Tp5vafy80MCyFjnvkzuc/jV596kvJZpCxx9mzTQD/2MLAhA4NdO61honuC1Qy3LAzFjwoZChQTR
	sMJ05H4hhBsr459GOZPuOU6FMTJGvSOsisVLezyZz2JvczAhh46O6OkmXw5C9QGydyQZ+Q7j6/t
	/OfmdmbrIuygsmLCY=
X-Received: by 2002:a05:600c:8b41:b0:487:17d:d0bf with SMTP id 5b1f17b1804b1-48727ee0e73mr119109885e9.6.1774906351342;
        Mon, 30 Mar 2026 14:32:31 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d50a:b400:fc92:d05b:3301:b722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d236a9sm547898585e9.11.2026.03.30.14.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:32:30 -0700 (PDT)
Date: Tue, 31 Mar 2026 00:32:27 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Rustam Adilov <adilov@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zavertkin <misha.zavertkin@mail.ru>
Subject: Re: [PATCH v2 2/6] phy: realtek: usb2: introduce read and write
 functions to driver data
Message-ID: <20260330213227.zujvcvsxdfknzltz@skbuf>
References: <20260327160638.15134-1-adilov@disroot.org>
 <20260327160638.15134-3-adilov@disroot.org>
 <20260330211918.y7su36j47e3uelcv@skbuf>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330211918.y7su36j47e3uelcv@skbuf>

On Tue, Mar 31, 2026 at 12:19:18AM +0300, Vladimir Oltean wrote:
> On Fri, Mar 27, 2026 at 09:06:34PM +0500, Rustam Adilov wrote:
> > +static inline u32 phy_read(void __iomem *reg)
> > +{
> > +	return readl(reg);
> > +}
> > +
> > +static inline u32 phy_read_le(void __iomem *reg)
> > +{
> > +	return le32_to_cpu(readl(reg));
> > +}
> > +
> > +static inline void phy_write(u32 val, void __iomem *reg)
> > +{
> > +	writel(val, reg);
> > +}
> > +
> > +static inline void phy_write_le(u32 val, void __iomem *reg)
> > +{
> > +	writel(cpu_to_le32(val), reg);
> > +}
> 
> Please don't name driver-level functions phy_read() and phy_write().
> That will collide with networking API functions of the same name and
> will make grep-based code searching more difficult.
> 
> Also, have you looked at regmap? It has native support for endianness;
> it supports regmap_field_read()/regmap_field_write() for abstracting
> registers which may be found at different places for different HW;
> it offers regmap_read_poll_timeout() so you don't have to pass the
> function pointer to utmi_wait_register(). It seems the result would be a
> bit more elegant.

Even if you decide not to use regmap. I thought I should let you know
that LLM review says:

  Are these double byte-swaps intentional?

  Since readl() and writel() inherently perform little-endian memory accesses
  and handle byte-swapping on big-endian architectures automatically, won't
  wrapping them in le32_to_cpu() and cpu_to_le32() apply a second, redundant
  byte-swap?

  On big-endian systems, wouldn't these double swaps cancel each other out
  and result in a native big-endian access instead of the intended
  little-endian access? If the SoC bus bridge implicitly swaps and requires
  a native access, should __raw_readl() and __raw_writel() (or ioread32be /
  iowrite32be) be used instead to avoid obfuscating it with double-swaps?

  Also, does passing the __le32 restricted type returned by cpu_to_le32()
  into writel() (which expects a native u32) trigger Sparse static analysis
  warnings for an incorrect type in argument?

For reference:
https://elixir.bootlin.com/linux/v6.19.10/source/include/asm-generic/io.h#L184
/*
 * {read,write}{b,w,l,q}() access little endian memory and return result in
 * native endianness.
 */

and yes, your patch does trigger sparse warnings:
../drivers/phy/realtek/phy-rtk-usb2.c:153:16: warning: cast to restricted __le32
../drivers/phy/realtek/phy-rtk-usb2.c:163:16: warning: incorrect type in argument 1 (different base types)
../drivers/phy/realtek/phy-rtk-usb2.c:163:16:    expected unsigned int val
../drivers/phy/realtek/phy-rtk-usb2.c:163:16:    got restricted __le32 [usertype]

Furthermore, please drop the 'inline' keyword from C files and let the
compiler decide. Your use of this keyword has no value - you declare
phy_read(), phy_read_le() etc as inline but then assign function
pointers to them. How can the compiler inline the indirect calls?

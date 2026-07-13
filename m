Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6633F23BB
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 16:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783959504; cv=none; b=FUw2JweQRQj2sB/UClLSpe5IvzRC5RIy0Dvhm6z3UbQVbQBds22VNEI2ZyJ1fZT67YLj9pBSjvyPIOjGTfUekN3FfBF5ErF3fIpA28u5XvwiML49Wdxn85E7bPUxzjsRWr87Zn36wEKQrxD6uEFe61/iEG/bU6+JbeLkUVkhiIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783959504; c=relaxed/simple;
	bh=j/xGGVpfBmZ38fXC8JgNuKE6Pd+vPTqjmTMDjnqgZk4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkSLuKD0fA3Ux+dlmSQ/VP1dzDXkQoF3N6PPciOV2Ytw122PrBLpCe3abk8okbUVulZqgMNASP71jy/hUwg14PYlUCZAD9DiXSB2HLsm8PW8ur9bh4FZ85gQcYsjiJt0JTcN4g5FH1/2nZk2BUODMyDYUNnXWjCSKy62jJtPNB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOopP5Le; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOopP5Le"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso782565e9.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783959501; x=1784564301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TbGjb/jMJnZzb2UpXKwZzIOhvZ257eTjhYHwFcycWxE=;
        b=KOopP5Lek6WwBkVP78wZIawLKodi3zHxJ8ipLT+pzfncbVPORan7bKbC/pxSFKaEAf
         R2hH9ufjSC48FbdymIqun3oH7vkyg+0S7P46qLJ0DuiHPbVypbotReu+4J8SVSe3Kx9g
         qRBqU1rshS7IpsGxaACI1ffgoJiofV1zj9/az25SHRVcaJqZx5cwcarVqdhYbh3wmrtC
         9RuYWevfr1+BiWjHGzMZO7E3YXlBBJrgLimCNSea9wDT4qfV45AAFsH7Llinz0LxJazx
         GuPQ8BnAFAQhoFJ6Qfoy2QUe7iItfn5Y1QJ5ZlGoIVJyzhpwDv52N4vfe3RdHrxPTF2c
         gWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783959501; x=1784564301;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TbGjb/jMJnZzb2UpXKwZzIOhvZ257eTjhYHwFcycWxE=;
        b=qv8xFn6xQhwHRJu72+SKKK6CxTXbKQbwQzgE093mtpEWP1THFLsZKlRGqf3sqXfMaG
         g+21lOqzajBPB6FJa3EM0XbbIvJGb1+HprG3hulchHk+iUXcTEC8fzljGxYtUpSZQyGB
         kYXrIeZcpVBNKjqYjsYOeXFb8C54GqXX9t9Uu82/lDIE7lxFh8i4gRKhJJQAsDthjd1u
         S+zUsslPeizGIDw5wxSiDYFZ25uAZFiEmnP1ZRJozjFUt5h4eTZACmS/zuCwtv6I7iiC
         Ulzii6kBkcLONOIJXqQfi0HQOy9GE872yQ3k4H3Jre+c7eFzHJQiczb8yEMgWf5kMmLY
         OQpA==
X-Forwarded-Encrypted: i=1; AHgh+RoCDAYS9GbuEGWpvdpP4eJREusrLUkjH09aD1mMAU6+bTCW9dpF9SUtYJu14/cZPeunUcQ88xQ1ZuXx@vger.kernel.org
X-Gm-Message-State: AOJu0YzSB3capZxJNcZHYeipWidE2G0RVf7FXTxZ/qFiUWT5zGUfNn02
	S7kBU57iVQ/eFSmycm/9pTzaGye0VncAtNx9Os1UpxyZNuGU3l8GgQBZ
X-Gm-Gg: AfdE7cln7twVGLyQ1qwPvv7a2Bk4OS4TN4fbLyFB56X0GA+3aSX2dmqt49jIRPGqD8x
	WKgUh3r9hAKmi2CrBsapwhzBzj6xntbINDvslGlxIBbdUOuganoVRGF5iS6+Q7pIEuK+QnKP2Om
	oCaw+2KTS8vBA7fV7wTT/VlZCV9xM9HEnj+pzaXStFawReNvfUllBEk8P/IhzpfEN3l3y+L3Ezn
	673xwYUKOLWxs+9lhGL5PBqaijZd8QBYaCfprMoW7PAdwKRC+pvVX1Mov28zxMex+kpqBHZ5Z5h
	pVBEbeHpnAWpWPM6c6UiitaW3VBsEMrEtoVgdGfYb+jz4Uu9VNFTSrYx0niG1areZMPRsUlv816
	KvJi44lJ0Gv+1t/86karBXPIdHHQpRliU6CutvffpHxh258eAiT8g0n6VrFPlCM09ZgPX7CdQgE
	uStcAWUlYeMmTo/nm+jogpdmBLXiXdviH17mB36eBRdBvp+G5evZ7lTfyuLQd/xRbEDxfvcCOn7
	axU1Va1dOxsMYP5PhHdiWT28Mc=
X-Received: by 2002:a05:600c:1392:b0:493:f753:24e8 with SMTP id 5b1f17b1804b1-493fed59338mr80519895e9.6.1783959500626;
        Mon, 13 Jul 2026 09:18:20 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm7873375e9.12.2026.07.13.09.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 09:18:19 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Mon, 13 Jul 2026 17:18:14 +0100
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Michael Auchter <michael.auchter@ni.com>, linux@analog.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v7 4/7] iio: dac: ad5686: implement new sync() op for the
 spi bus
Message-ID: <2shq75gvzzm27rodbgmtxkbgt5n2a7dafjc2mmkttwnshmhyqr@pdytastitwfm>
References: <20260710-ad5686-new-features-v7-0-1bcc8c280e4d@analog.com>
 <20260710-ad5686-new-features-v7-4-1bcc8c280e4d@analog.com>
 <alM8M78O9-cRSxR-@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alM8M78O9-cRSxR-@ashevche-desk.local>

On 12/07/26 10:03, Andy Shevchenko wrote:
> On Fri, Jul 10, 2026 at 12:20:48PM +0100, Rodrigo Alencar via B4 Relay wrote:
> 
> > Use of local SPI bus data to manage a collection of SPI transfers and
> > flush them to the SPI platform driver with the sync() operation. This
> > allows for faster handling of multiple channel DAC writes, avoiding kernel
> > overhead per spi_sync() call, which will be helpful when enabling
> > triggered buffer support.
> 
> ...
> 
> >  int ad5686_probe(struct device *dev,
> >  		 const struct ad5686_chip_info *chip_info,
> > -		 const char *name, const struct ad5686_bus_ops *ops)
> > +		 const char *name, const struct ad5686_bus_ops *ops,
> > +		 void *bus_data)
> 
> Can't you utilise the dev->platform_data for this? I believe it's exactly
> the case where it suits.

I could use dev_set_drvdata(), I understand that platform_data is to be injected
by the board/platform configuration.

SPI/I2C cores do write it, from the board-info structs at device creation:
    - drivers/spi/spi.c:835
	proxy->dev.platform_data = (void *) chip->platform_data; (from spi_board_info::platform_data)
    - drivers/i2c/i2c-core-base.c:973
	client->dev.platform_data = info->platform_data; (from i2c_board_info::platform_data)

After device creation, the core itself doesn't touch it.

-- 
Kind regards,

Rodrigo Alencar

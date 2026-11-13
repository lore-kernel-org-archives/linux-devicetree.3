Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572658;
	b=3qerkfepi5uNu3K2mvTFShhlC18nZs0Y6b60jEg2Ibs4KlTB7N3/GSbm/Rjkr4i/Vk6V
	 abwPF595s6uuzIVCxhD+zTMd1VumPcpEfHdmzafCtvTy/Se+0J2qVJV02bFeLiYo6aK0t
	 uQxhrGgZIars/aQKU1L973Ed1EwazMljVuWVkdVn8crUiGsUqzoiqphxReLFLyNG8GMS1
	 8eHlrEVdO7P1F3NP8/SbcWpdWMrPe13skcUZAoP4NqqwJ7wAt2N9E63YvAF6QbDVkyo4o
	 pdkcGyxL5aZmWsgbm+0TQYSPWcmOrq740/XCutVkSUtPm60XTrcf2qNLWVxQLMSGjnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=C/5+MwiGBhrvcZh2GunvS7SNbgc10mz9WWPVXOV6bJw=;
	b=MRxLudC4IyrtO4Ts4ihNFCXwe4403rJgdajg2vr+fLkuJOQ9i4uslBFqQRWHLN8Iu0Br
	 tmItkiH1Wm8M235h4zn9RUzRTF0PvmOB8UoB7+diEG7nxpIxh1uaCFUCyi/2b49ib8bsD
	 HD7gG9JhWWVlYHto9Oj+nArXGWWssTnJIzvTpk7/f5ZkGIrI7MGbleAgCTMRd41579iap
	 GEmydkPMNE48qZ3sm8u/MLH28UYIysyNqPuOxDOQz58iiannB1KxbvOq5qAKwNPU2cFcr
	 hpFoPanrvJKyTmaDM4g+86T4VpYuyRhr534v8dy2dXCiDxtg2Qd5pagCYlBxs2V3lYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VPwIm5Fs;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D361A60A2621
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D361A60A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VPwIm5Fs
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3704d30b84fso1165344eec.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794572657; x=1795177457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C/5+MwiGBhrvcZh2GunvS7SNbgc10mz9WWPVXOV6bJw=;
        b=VPwIm5FssYcf5tgjo8d3hmUfvM6E81Ea1Ks/10Q3gFgmUCg0ga6D+J7u69pi4EQPzv
         aCZbphLT0EXyKoVc4nLadr2TgoJlRfSiZy7purzSurIhG1vQjqFZOzwGx/nhfNnLRqcL
         Ajli1tfHuS+4Tuy70GmKWT8kY4y4brEQwvNvhxt4UER+Y3qBvq4PE9zuLenL114KJoeV
         FS58xyQPJqq6cIRd5H83Ppnombuu9Zdd6VNFL75tYMF8qacbTc4MWb0pQDuFJN/xnwjL
         YidvVR8BDXeAp926gD7BtunnRfbdUVvcqpD6mz2EnOKSvxxJQc5xV0fA0ADsZ/nLw24t
         pLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572657; x=1795177457;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/5+MwiGBhrvcZh2GunvS7SNbgc10mz9WWPVXOV6bJw=;
        b=1jmaA/GULbearumhCgzIoGAESp6KlIad2GHw5ebNiSfFN4aXF8xtuB/7D4eQ0nBkz1
         p5pVo1AP4+8lPFsBCWSI1p/3yQc4+Sh7kob21tBZfSWdy9RF9e3644GqNazaG+RG9pOS
         CXR9u9n0IsIp0y07Xffd0VSwmVQMQCqL6Yh8vUXyq+eiW0SNhX9ZLgjG7+DHc/CgkCKb
         eHGKvngRvJ28yne7KOTwWBkYXIhq0APevfEm/vjFHetIY/9VXmULM8PvwZf6CTYUZzTY
         BN7MHLjnO89Z1KqYDqWHhwW0VbwTNE+PGjvaQQS3mEDFzG6FpE+nH2aQydppjDK84qZY
         L6Eg==
X-Forwarded-Encrypted: i=1; AL+hErGVJxUhw7WFH5inKO+MEXsbkaxMxkMwAFPcV5VtMlfjMygm8E/cJSTcv3cod6YRQR/nFHH3Xi7Nhif8@vger.kernel.org
X-Gm-Message-State: APuU4Z+mjccwV0eNE6yP1SekjEcVcerHnEVqRZ6EvtoBUW0U3GaBHbsb
	zhGGO1+ZOx2Gn3jnkojx/a86V5gQsxVjtsDXdZC1OeD6WlDNZoDcYS0NIjHO8Lao
X-Gm-Gg: AYBFou25IMPqXMO/hf0owhUBZDaCRszWd7hNCkpaN+oSt23WbIzEeHLzPp8a6WmDLSy
	Rpvxv2UqIfNK3lKx/Z6WVUViNQlN+XOcYFc82xAVOXEB1zyVI0WPUbussUBmETLoNWGskjTx5ZT
	N4mfp+xdiCZsYd+VQCn4H3qs4GFcP1B8s5FseDYmSNWVqMEcl9rAeY0GcEoAPQw/aV1qWkvdvb7
	lOtDBpdL6EccLGNS5KNmg2XJjAYFWO/MnaW2xmfFNLKvgSyRtqCkuYFvz28oSondIom3iDZCOwq
	xk2YFwVMHwy7af72t6tNP/+mFSVssYI/5CEF5w44BO6PnFFXCcSYHbDeLwQ/+nUeli3klzjbZfv
	km6/qcurWUCCgaMAi3IxD9OYQdP1OfSvggD2bWA92iBIyamhl0LrfsYudSsSv4eu2RvW+JbCQMn
	/5V76gGmLSPQMLTp9oQffX7tqror07dibnQ2sx0/FhRjTAT4VsRVuJywPX+1x5gBN1fFqI1XY6N
	/fmxlzpjpjmg3iOPlslrrO+WEqyzsTaTkV+dC4HaNTznzYrewuDOblUv2xLdyDx6rs+4NvQWF9o
	iE7wCJ01w8UdZ8Uizvol6aC0K1k7TA==
X-Received: by 2002:a05:7300:de01:b0:369:daea:812a with SMTP id 5a478bee46e88-379682c2053mr1692885eec.30.1794572656803;
        Fri, 13 Nov 2026 04:24:16 -0800 (PST)
Received: from duge-G3-3500 ([183.192.220.187])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm7242488eec.16.2026.11.13.04.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:24:16 -0800 (PST)
Date: Fri, 13 Nov 2026 20:24:05 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: Add K3 eFuse and temperature
 trim cells
Message-ID: <uot2mqhilzdfngqcwpipdo5xzncyvesmw2hw6rqk7mnveer57f@6m4cqzotx53k>
References: <20261106060525.346873-1-duge1256@gmail.com>
 <20261106060525.346873-4-duge1256@gmail.com>
 <au5Q9lYTUegeEglv@aurel32.net>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au5Q9lYTUegeEglv@aurel32.net>

On Fri, Nov 06, 2026 at 11:13:10PM +0100, Aurelien Jarno wrote:
> Hi,
> 
> On 2026-11-06 14:05, Jiayu Du wrote:
> > Add the K3 eFuse controller with its AES_WTM clock and reset. Describe
> > fixed-layout cells for the temperature calibration parameters stored in
> > bank 0 and bank 7, using controller-relative offsets.
> > 
> > Leave the controller disabled for board-level enablement.
> 
> What is the reason for enabling it at the board-level? AFAIU, this is 
> part of the SoC and does not require any board level hardware. Therefore 
> I believe it should just be enabled by default.

Agreed, there is no board-specific dependency. I'll fix it.

> 
> > Signed-off-by: Jiayu Du <duge1256@gmail.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3.dtsi | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)

...

> > +				#size-cells = <1>;
> > +
> > +				soc_rtemp_trim1: temperature-trim@120 {
> > +					reg = <0x120 0x1>;
> > +					bits = <0 8>;
> > +				};
> > +
> > +				soc_rtemp_trim: temperature-trim@19a {
> > +					reg = <0x19a 0x2>;
> > +					bits = <4 8>;
> > +				};
> 
> I have tried this patchset, and while I can see non-zero data in the 
> /sys/bus/nvmem/devices/f0702800.efuse, both temperature calibration data 
> appear as 0. Is that expected?

I see the same on my COM260 Kit: both banks contain non-zero data, but
the two trim fields are zero. The factory 6.18.3 kernel gives the same
bank data and temperature calibration data. 

The thermal driver change in [1] reads the bank 7 trim first, tries bank
0 if it is below 8, and uses 0xd8 if both values are below 8. This handles
the zero-value case. I don't have an explanation for the zero trim values
themselves.

[1] https://git.openruyi.cn/OERV-BSP/kernel-spacemit-k3/commit/334d70cf990d4e9a9899bdfb758e47732ba5d519

Regards,
Jiayu Du

> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net

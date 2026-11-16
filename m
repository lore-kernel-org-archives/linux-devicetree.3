Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846523;
	b=lrEEFSjPi2csYEou/LER/Yj6TKppX99ygpx4sawmRQM/lvxWgwjaaNSwOiI1TbYDA23D
	 QBuAQBtxbbKj3OGiGDhVxP1iySjocNkr6lbNm7i1urPChpgvwTZ0mqW90K18yPkDanwOF
	 6jXnzCjhPtAQ4BquYY5rYLi1cDVv5E0iVCUQxe1FOPGZ1mzdC47L3bQtqNFeveh33rQcv
	 U2h3DCWKdCQjwtzvFbjpLfTXnQ20RG31HFpg19xAcXORoeNv2SVC2An95zvaGNJjrl80H
	 +yu8gz2UlE39x0qIfrZ9kJkZ1JWOahm+Oo2boPCBuujjG8bE5omCLwX4ESmq0R0eyFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2+nzMcVP/+P9vG+E1zkKZ9XZsaAgRds940lbNhNpcpI=;
	b=Wl/Xqg/ufCzKjmK9gplCbFtEBHXhBu5S7Dktx87l/bXyEn3BpqryK94Rm64d/0WfqPia
	 mUH+FDukcqPfsYUFdSfDIiSNBnxewYCeP1Np6zzhgcGLfla8X4UaYT80h3DEL/F0/U29v
	 sRZbO2h83k2zUoaHtvCPyZvBg74sJdTZr09AYH2M2QXNuB5zqGK3DWAGd/TfCrVpUyWAW
	 puT/W410Nj1hwEriZ9MF6078tXo2TZCDenMcyiB4KnjydbOfB0AUShiKJHWZ63YwdyDB6
	 ANP4o89kZ1bUbSGh386F5mnwQRFkH3Def8jLDzF8CgKL6nD2IEgkQojXIzzi5mqGK7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgGsa1h5;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF607606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 16:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF607606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgGsa1h5
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so18336375e9.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 08:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846521; x=1795451321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2+nzMcVP/+P9vG+E1zkKZ9XZsaAgRds940lbNhNpcpI=;
        b=DgGsa1h52Rts8iMQsAM4EJfolE1WumuJFMv+MANoxbtXJXUOJKjkXxqF7F52ddwi4B
         igJl8Rh2ip7GVy8wPhlLKhruAujaQotXx1zhJlK/t1l3kKd7ciRnftPamiLQwevK64Bt
         k8APXM+6MHR6p9gPx61Vp76+p/B521PwanYfwN3htVEnEoonaZ23QL33BIDUw3R+yf4d
         h4IbGGGBRAapLvL8Rlc4TNDPbcyxFICIxnJoPuMIWyJ/Ovt2fCzL+Zl6ikJ+w7CHqluQ
         Ayy4mBCMc8Z7wwVKi76I1WC/0L03NnAnS2aMKpMAIs0mwzZilY4SpSvU/4y2CBxtQROJ
         IW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846521; x=1795451321;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2+nzMcVP/+P9vG+E1zkKZ9XZsaAgRds940lbNhNpcpI=;
        b=dbs5GZ6+qVsn+v0GWkehgYPv2SGW5W2ouHKYqBqZRnenhWOHcjrZ9uwb9QKtRAFZpk
         SWr3ZKTqXL70jxwwvcWbD+vkZjFdVMuOJliAH9+4e6J0kzkp485v/sr1HlzyGprynfHg
         iqoMHjYkaH17TeX6togNxbtBtcJLig5UQ1Zgf/liIxm3GCsmUSUm/ZtN3lIPrmKpi5Xp
         C45gQKiVCkgTR7yJoDxWe+EBJxH6a5cb6tsqbtjJ1+iz7XBBC7C8SCYYhIeXWmXUxRJN
         9A8lP6AjKudq7CUtpVfans4HgvsehAHRD0n4UfYnRidfTdqiLgZgnpA+Xnyu7b6oMbUa
         5gTQ==
X-Forwarded-Encrypted: i=1; AL+hErE4NMZ4truydlt5yFjoAErKVre1ImLn+mF4oFDmxUtF+lxIvzZUdkbAv2sR1igW9bD6uyoErjstrf4w@vger.kernel.org
X-Gm-Message-State: APuU4Z9TVTlR4XeBjjog+17v4Rzsb0HEmCmlmzu7fmZCvFPVMPGvFXIx
	ooQmc7kSyngysUCkCCqjsrfzmuGQQp8ZLHN+noUuVRYJ1KCSk9PV8FM4
X-Gm-Gg: AYBFou1JUEDSaZD0IQzCHy+d15zvdeEJGkVjhMMO/Rlbt1XL+ohnvTRt2jbXznq0qEv
	55WX5PkMPW9HpiDwN/hg/FHbnhqbSx4m3tWYksU+KU/hOmNFCqSyU/thbQPFCTlXSTUhLOzjI2V
	bFTkWnKHxkhFPNloAW0IIjZ9J9YdEOyzZ+z9TchmU7mqN39SzZlOvmrFJMFkeOd0B6UB6dYsxbU
	315fLmYcZdxc7ggoSdYOGP9DU2/+Q1ej2dtGR1l7s4aUR4Z+d75HJG8mWjlmw4gdeG62Qj0aiXY
	NPiqR3Fkf7jQzHz6HGehKdiHlJ+A+wjInNiT8X857spXqi9JMbij9+iujZLBMfgIv7sv4ekb8GQ
	zrWaHgzdmD5AaAfX+qkaWo2P2/eTklUmm+Nu+fsMqZkxCM5X03TgwOGAJmq4vs/hYki5PxwBls3
	p3NOw/wAkpZeT20HFRZVCB7D7pOXZgYD/CYtXEv8xs0bDrNAAx0W4KPsjCWjFqgw/Fo1AP3cGAG
	NgV39srBSqWQiWt9GrTJSJzdvH4eEst0uUI9lCbnvkMkAq5S8Eqj+VgdhpC2uc0Gg4LY/aBUJ62
	h03Kv5/FO/lvquAQaHvoz5E9nvyb0ggPdGbm+67gzDJMKqlW2g201saeAVrlsvhhZ67aD9uBpwI
	yX8zRhvND6UAJlqz0IijuwL2DER/lw76CogpwPeUg1LOCQvj1y/I=
X-Received: by 2002:a05:600c:3e06:b0:4bb:6947:3e1d with SMTP id 5b1f17b1804b1-4bb6947426bmr119351755e9.20.1794846521012;
        Mon, 16 Nov 2026 08:28:41 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm412165885e9.15.2026.11.16.08.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:28:39 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Mon, 16 Nov 2026 16:28:32 +0000
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@analog.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 08/10] iio: frequency: ad9910: support iio backend
Message-ID: <ika7dmfhhue7il5xgbgx434vjxdwj57dz6kebaossw32vym7nt@gmpxjkkqirgz>
References: <20261103-ad9910-backend-support-v3-0-0e9224ddf7b7@analog.com>
 <20261103-ad9910-backend-support-v3-8-0e9224ddf7b7@analog.com>
 <auoRUS-tsK4X0KoU@ashevche-desk.local>
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
In-Reply-To: <auoRUS-tsK4X0KoU@ashevche-desk.local>

On 03/11/26 18:52, Andy Shevchenko wrote:
> On Tue, Nov 03, 2026 at 11:53:04AM -0300, Rodrigo Alencar via B4 Relay wrote:
> > 
> > The AD9910 parallel data port allows modulation of the DDS core parameters
> > at up to the PDCLK rate, which requires a high-speed data source. Add
> > support for an optional IIO backend that provides such interface, with
> > data streamed into the device through an output buffer.
> > 
> > The parallel port channels get scan indexes and scan types according to
> > the data destination: 14-bit amplitude, 16-bit phase, 16-bit frequency,
> > or the 8-bit amplitude and phase pair for polar modulation. As only one
> > destination can be active at a time, this is enforced by the available
> > scan masks. On buffer enable, the destination is configured in the
> > backend and the parallel data port is enabled. The sampling_frequency
> > attribute of the parallel port channels controls the backend data rate.
> > 
> > The backend is also notified about profile changes, as it may drive the
> > PROFILE[2:0] pins, and the debugfs source attributes now consider the
> > parallel data port when reporting which channel controls each DDS core
> > parameter.

...

> > +static u32 ad9910_buffer_chan_idx(struct iio_dev *indio_dev)
> > +{
> > +	unsigned int scan_idx = find_first_bit(indio_dev->active_scan_mask,
> > +					       iio_get_masklength(indio_dev));
> 
> Split assignment.
> 
> > +	return ad9910_scan_chan_idx[scan_idx];
> 
> Who guarantees the scan_idx to be in the boundaries?

ad9910_available_scan_masks constraints the possible values here.
will add a comment.

-- 
Kind regards,

Rodrigo Alencar

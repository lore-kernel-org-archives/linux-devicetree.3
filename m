Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC46374E4B
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 21:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774905564; cv=none; b=gGxFQtxebuSdz7f3Fyxy/PspIg9aPTpc/SfMRvj7XCje7tSf2zN4ZsaM8NZ7kR84QOccsTAZDYUFVVNUjWHUkc2oIdlqGK5PRxNUJW+IagR8I2nfxarkjmLqwXkqDW8Tt/DJa0Tgm4RBLkCS9ssR6ZgpuHiKIphdB0hB+89FjXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774905564; c=relaxed/simple;
	bh=GT1SnuVsVCu1jUiRRrMlQsn3ANH2+9A7vu3mf/sPeAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hkUPlRdDEycgdyXeE2PKVJU5gqLZO6eZ/0RuZBaKHXCmwxQSzqByHC8OlT338pqgH/yaBZBrTCrlpUhdja2QIEJ3x9NqKSL1zfoYau9Btx8N25Y7+LISBXuxpynnfYtLBFefo3oPakvyJ0Q2DTdHrTCbUPdYIIBCeV9Ue9BQ9uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jaZLnre3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jaZLnre3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4836fc075d2so7356955e9.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774905562; x=1775510362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9jvnpLIOE5HFulMUUMbL5hgO4aXaFuGYK+UuancwyCo=;
        b=jaZLnre33zu3TL4XDynziD+dcEgUgbAhk/h55PMOnPae+VTC/ag/3nQPRmucXmHkB+
         uNY9kJdxz4kgTpsk3PASlc7lSB3M7wtYU8+XBK4ZuG747TNnjLEbBqEUwo+UHi/qlClW
         +O1ci8tQkfUwGPsvf5JPAfNYkzvmVhVQxN07jnFxPbbX2blU7jGt5CdOP1IvHqvJ8NEt
         hk5UZn4eMgRjBNLVtir6eoYm+scj/IdT0upZuYk2dnu7DZv47subt4+ot6Ivqx5rpVU5
         7mbZ0zD7wiz/rJvz97rlXbFHRvMVAfAQc52dRbfyCE+NImqe39uet9UOFgwjaGkKugbW
         d5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774905562; x=1775510362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jvnpLIOE5HFulMUUMbL5hgO4aXaFuGYK+UuancwyCo=;
        b=Miissk8EWF34aS46Bwru4sS+xmC0hobgbLG4ewLVF97iEKB6Jr+wXi/ln5rcwCmuci
         kjpRtFTJewVKsNsYT9UuBLT/WUVDO66E6d8ui8QlXNizeOcDT+2Iz+PpMZSU0/PwX1H1
         kxPTBUvNvIX0bdu4FrIawmE2KyWeN+XjxWD/eioRAK50XkV1YrEkHS+b0Esr6Dcy1JfN
         WtPEVQHRyrfllX01KyT/QQxrXEhJui74p7hGrdymTidu1TfnjBqIyvDoT3ETMu/PNWbZ
         tfeyiEoZXp8wyclkIUL6fIT6BoycP9I6pFBLVpAZkAL44VLt9iwruE5gT3ogBXUGKpQ7
         NUCA==
X-Forwarded-Encrypted: i=1; AJvYcCUwDo8Ctv7fAmpZWAIdZB4P38j929inXeY9gYPk2x6sJkPU3wr2pn2l1/P0D1Eo0i64dhMHFGkmOTCP@vger.kernel.org
X-Gm-Message-State: AOJu0YyMsLIQkMxTNhLqIyOGhtaQMc3oqpHkCCqpZNQ/LQPIBfdgA9i5
	/A5Dz6Fm6OkcrT0wJTapzZlbgbqR6Zdpm3AYUDk5iRZzQAQh3119H+KS
X-Gm-Gg: ATEYQzxi8y0Ph8TyYOpN839jkPjTagWvBOjexgKWiBLgD1qFexlgxm+RfTfDC7uf1Sy
	J/NOgHvi7lPwnfMjobdTiK5x3qfnEsVTTgmi+ow7m+jbMFMl6PPctbyFolx0ofz5agdp7idYJIx
	8cSGYRqSecDNzYk3mKoYhxUyhpsZqUKZxgoXXE3phKaEVMldahtetbSVSOWBuXDxOqKFqry8wZC
	p56WlYQEDhz3ynw+Hl3ZlC8cmmDBgpKmFjTuYVUIO4vX10YMOTZanDH3KaD9x53m+/lTUAuQYGV
	m9Tqh1V3BxQqhwE8YvdMaO73od+XYnV7Q2weMC9sR6j3hlSGE76SGZjPg/WSoXDQmN3dkY2hsIE
	EjTjWfNWIv0JsY/7mirlDBySdNyj4/IHM7pKLi6LiEdnbgUbP/XBQpNZRNW9tWbsgOsq1Dc0g91
	o2iVvUvai8W7fyCaE=
X-Received: by 2002:a05:6000:2903:b0:43c:fdfe:bdda with SMTP id ffacd0b85a97d-43cfdfebea4mr5006211f8f.6.1774905561753;
        Mon, 30 Mar 2026 14:19:21 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d50a:b400:fc92:d05b:3301:b722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm20904824f8f.29.2026.03.30.14.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:19:20 -0700 (PDT)
Date: Tue, 31 Mar 2026 00:19:18 +0300
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
Message-ID: <20260330211918.y7su36j47e3uelcv@skbuf>
References: <20260327160638.15134-1-adilov@disroot.org>
 <20260327160638.15134-3-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327160638.15134-3-adilov@disroot.org>

On Fri, Mar 27, 2026 at 09:06:34PM +0500, Rustam Adilov wrote:
> +static inline u32 phy_read(void __iomem *reg)
> +{
> +	return readl(reg);
> +}
> +
> +static inline u32 phy_read_le(void __iomem *reg)
> +{
> +	return le32_to_cpu(readl(reg));
> +}
> +
> +static inline void phy_write(u32 val, void __iomem *reg)
> +{
> +	writel(val, reg);
> +}
> +
> +static inline void phy_write_le(u32 val, void __iomem *reg)
> +{
> +	writel(cpu_to_le32(val), reg);
> +}

Please don't name driver-level functions phy_read() and phy_write().
That will collide with networking API functions of the same name and
will make grep-based code searching more difficult.

Also, have you looked at regmap? It has native support for endianness;
it supports regmap_field_read()/regmap_field_write() for abstracting
registers which may be found at different places for different HW;
it offers regmap_read_poll_timeout() so you don't have to pass the
function pointer to utmi_wait_register(). It seems the result would be a
bit more elegant.

Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F5F2EC0A6
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 19:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778009162; cv=none; b=DS2wzGjqTbwEm5rqOMEK11SvWC8Kjmq3ANW/iTjvRCwGTi6DgI1jdVw7wzUE5wua/+DOpzKtnGlnmFXxDpfmVCp3/1qLoIJQ/c+ZAhur57FW7YV4MAwR4BQ6yPLrjpTa4bGifj9srqoLm0KSUfiYwwEOw84w/9uEUzKfxETCRMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778009162; c=relaxed/simple;
	bh=Ju4k3GBbJJfoXPcbc7oT4PX/agxMZ/DCX/ZvoQ1Slw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4NXM3O830SUGQdQjLYRdSQjV6fz4X7A57XbaHoR2cmoBQ+Vr26Lw2Antg5Y1LRZm+5hktudPQO94HtvnBdtoz4DXDH7UUPQz4KyUJpKhmlKKpGwZqmoa7rtxFDN+7CvCTOFylYEifwpvzWTHDTiFLrCyfEuzzubKHK6r/v++WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=naMaXjaV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="naMaXjaV"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891cd5927dso7339225e9.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 12:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778009160; x=1778613960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FjZZ8z2drWWZW3cB7DNESyomf0wyR6f8DA/CiusrLec=;
        b=naMaXjaV+xtF4NS4+tg5TAuDQxVug0n0qt7YHnRHgrRvlMAkFYSdSHArICFe3sAsVu
         +xPX+mfOvV0NrtQQaQKLz/67cGHrSYpAx4uDZOdg+Goi1gXwFb3jAGAvC404jUXVs7cZ
         3m5ztk5WeRes6EmFrKiPt5lGYkzKufwqvfgi31FtzdnM/8HT4z7D1sOlK6fcXMj5AvGT
         NUSYpyh92zqt/QTH1kEZL4HVOYA/Cw+xMshB+ClCJzdACZwu9U6KXB8XXZpIDEsUcTWi
         kW2Usnv9pb1LIiRA4ENO8cVACrkgLEsXm/dzxCm/lvFQmVvZGq2cLnC0Rx+p3ee9Cyp1
         NqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778009160; x=1778613960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjZZ8z2drWWZW3cB7DNESyomf0wyR6f8DA/CiusrLec=;
        b=WzlKi0xAkgzt43FxyENmlgo/E2GLCokJNiMB2hkjfb2/aYNui0D9JjYB9ZtM7IgOvO
         /fPcLduLp8ohLk9y0oknUYkLzQa8ciKk2c2vL5KUyopzltm6tGpK7c1Qi/zvM7Ijctlz
         6vZKPuTej52lqBeDsOIb2jKuYaYlWQzXxtTTg836/Ww5Ap9TqOK3u23mpFeLbGypFS6f
         Ku+fSWjSxHFw5BtnVpejGMODdwuYNNmVd9JvizUFQvafrt1Xp8aX/pkzV4EI+j406svR
         UX2Ro1rrLpy77JqM15xiSd7x0uz5G6PiJi9Nj9XmolTaGjGsqTfgL7ZyFkwiRxSsX1j3
         G00g==
X-Forwarded-Encrypted: i=1; AFNElJ95JbMneeQ6uV0Zp/c2kNx+LG3poydoXpY3EvTmKy7vZ5GuVk/AJ/ct/W3lENQKe4pLN/49+UlJ/C++@vger.kernel.org
X-Gm-Message-State: AOJu0Ywslm1mW83eO94fBnI0x5tyNoj2oTlmgvtJmaIDapNwc4CgkFCV
	DhLVknpTi0mFNp7V60AlnxuEnPzuT7iCRNssfZe1mgjkUjvJ80faYyQH
X-Gm-Gg: AeBDietAXGmJ7BsBgzREaLOX6GAP8RT8cSyc32rHMNx4FcmRLapADIHkq9seTl3Dxek
	aFliTllJ3y0xNc7U45nSsEM7fcbQOPI8gMisTs3228yT54tSplhksxPClUSGaZ0ejeo7Lh4yfxw
	NkAF9CEVgC84WwIBDzZcoWKjSzOhs03kMwTuUUzxVSWxW1h2YoJsUeq8BkOg6TipU7B/NqxgJC7
	Juvx3l1IlgieomUFvSu/RlKKixUuNmLKqO/+sccNFQP50hS+Kinqg/T+A0fl4RM1d1+H0vGyBdP
	XeDWwUxU8rgAD1TxZ4pbj5hlqNFWbuROFR2+KgmuUWYQ2XNA4xhGup2xPguwDxZBWGcBLEUhf7t
	js4WDoB3AZ/iZqL53cJ6z8MxDEYX0gSyh3C9vGZuuDwY408hWNivfo052YuNGW+dsh9X+KeUgds
	WVzdzV/ZEgFjWO0d/hVWbnZqv5Qw==
X-Received: by 2002:a05:600c:c4a3:b0:485:c456:5e4f with SMTP id 5b1f17b1804b1-48e51dd7e6dmr5358795e9.0.1778009159832;
        Tue, 05 May 2026 12:25:59 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d403:cf00:9b58:9830:baf1:5f76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb72a17sm390558535e9.6.2026.05.05.12.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 12:25:58 -0700 (PDT)
Date: Tue, 5 May 2026 22:25:56 +0300
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
Subject: Re: [PATCH v5 5/6] phy: realtek: usb2: add support for RTL9607C USB2
 PHY
Message-ID: <20260505192556.tyuxcmxzeu7dpxza@skbuf>
References: <20260420191941.81834-1-adilov@disroot.org>
 <20260420191941.81834-6-adilov@disroot.org>
 <20260505113001.idgj7ssikjgcypa2@skbuf>
 <9de0dcc209eab02d2a4e5fcec25e7711@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9de0dcc209eab02d2a4e5fcec25e7711@disroot.org>

On Tue, May 05, 2026 at 06:10:42PM +0000, Rustam Adilov wrote:
> On 2026-05-05 11:30, Vladimir Oltean wrote:
> > On Tue, Apr 21, 2026 at 12:19:40AM +0500, Rustam Adilov wrote:
> >> Add support for the usb2 phy of RTL9607C series based SoCs.
> >> Add the macros and phy config struct for rtl9607.
> >> 
> >> RTL9607C requires to clear a "force host disconnect" bit in the
> >> specific register (which is at an offset from reg_wrap_vstatus)
> >> before proceeding with phy parameter writes. Since it belongs into
> >> the vstatus register region, it doesn't need bytes swapping.
> >> 
> >> Add the bool variable to the driver data struct and hide this whole
> >> procedure under the if statement that checks this new variable.
> >> 
> >> Add the appropriate little endian read and write functions for rtl9607
> >> and assign them to its phy config struct.
> >> 
> >> As mentioned earlier, the readl/writel are native endian on MIPS arch
> >> if SWAP_IO_SPACE is not enabled. Since enabling SWAP_IO_SPACE results
> >> in boot hang on RTL9607C machine, wrapping le32 around readl/writel
> >> should be a good compromise, but swab32 could be also work.
> >> 
> >> Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> >> Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> >> Signed-off-by: Rustam Adilov <adilov@disroot.org>
> >> ---
> > 
> > Have you considered ioread32() instead of wrapping le32 around readl()?
> 
> I think you meant ioread32be() and yes i have considered it. If this is what
> it takes to get rid of le32 warning you mentioned from an earlier email then
> so be it.

No, I meant ioread32(). When I read Documentation/driver-api/device-io.rst,
it says ioread32() is for a little endian peripheral and ioread32be()
for big endian peripherals. You have a little endian peripheral (relevant)
and a big endian CPU (not relevant) so I don't see why ioread32() wouldn't
be the correct accessor to use.

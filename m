Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504799;
	b=VB1viYNJz0H0vSmhoWn7HKDoUwRj9uEZsiLBa6u6089neDyOP8Rbz9SNqHO17U+BWB7Q
	 wwAdGQdVkdltt431kEGtS2UvUf9l0eEURRwsY4bdo9Sm4BaeMcz3SgNUdpDGzctfvTIUV
	 9g+1avZnF3gUqhbpu6C7ogI5dRwHm0aoZDOYfNlmSCKwT6JQmTrz6Ch7Y2EwPn0eFy12m
	 +KpR7xDzfvCRTSwBTq6+kurKtsYAm/IIJb5Bb+WrHpRYxxiwu5CzN0dTQR9R6GjwTqxms
	 AEjd6gNqsaTq3tfR/kYLKlrXbl3Ef6ziSv4wDxwCi1BIEtKjVr94QsaVlGXtltpH/nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PnBOhXvJIJK4VLpTdrp7cs6iUz2XtC8WuEePd4QSYVU=;
	b=XDCTKr7siMZ/Yry6QzTsKsWfWhJ6yRhbyUUv5vQ7I0qW9aS0mNgpGyI216kYMthC3S8w
	 qS6XFs3WW42NHp6SSX2QGviql48HABuLWtumCHSBNCZLUknNIOAhM8r3RegKWI1d0k4Pl
	 AUUVZrWtsovTzzDRdMfwAkPOlGG99wj9/65kEAAKFyQZ7mM4b8dpMMeLxJ4h9Nqqu8WSM
	 Dqhw5hYSIFO4YSLlVtM5nWLUo7UfQQIQbAQyHXXI3+RzD+GK3SUiRcNZkLQCYE2hvqM81
	 TCyMl1bBcRykJmbVh6CtfheyZ5KnkXJh3986q9MpMNoqeRtC3/x/x3s2/hHYlrBW5bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="DP/IFoaO";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA1A606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AA1A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DP/IFoaO
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so22885275e9.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792504798; x=1793109598; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PnBOhXvJIJK4VLpTdrp7cs6iUz2XtC8WuEePd4QSYVU=;
        b=DP/IFoaOO27sakoLsWxYmS8AMQcZ7aKaL51LH0a+Sp5yFDvBQZiJwmWrrRUjQjo/Le
         Hs1aO6FN/Z0GghqkpZYecUqFeTfwMhmPT9gxEQw9ZkwzKnagwLTBZRRmK3r1ffv9MGlT
         1gh/GyGe9+31357fwCPo5CzyNltWMGs0XzCKfSl/o95Wjb0E3osnTRw76HcJxIRMiM+K
         vxbX2NIE3KIP8HShMWTO5uzYpPZ9oSeTAermMB5YrORWVQXZHU3Le/uhi5bTvCeGQ5cZ
         /THmDjubibPzEBNY3b2lgZytV9NvcW8HmnQXaH3i4tH94m4rnyKkl1Ad/pWLoRj8zpjk
         6oZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504798; x=1793109598;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PnBOhXvJIJK4VLpTdrp7cs6iUz2XtC8WuEePd4QSYVU=;
        b=DIW5H6tbbsG4Q/JRjv8hno+OMxTUr1oZqbD9VXW4MnTLhc8bPavgPNt9bgscH5Al5/
         Ikn+UP/ip/1y1m0IKeE0yJZ0Qy+NE/fuAT1voK2JelXBOE/Ad4CFf0wIDbUpgp5scOzL
         OhMpKrGGoOlaFzv7bTs4H6ClEbJZ8pGchx2RAKKyV1BrVWpNm1kx8lQdtGlBmthVby7f
         4HTyCrfm/ix2aRKF16CJ8quBqvzGHaCpAy9dFXY6abOItISJyLFodn1CTz/E2Ito2pti
         RkANDgKDzVfK+ScfY51mPiVHjm+TG9cYd7fBcj9Bk4pqvNp2C6auQPeVRoU4qAaZ9wfc
         5nDA==
X-Forwarded-Encrypted: i=1; AKwUvBzmHj5jYlIB6Ss0hJT1fZObbjQDEYrG3TC7tb5OO7G8Pk8kWOsHdSzhAcGpv3qETUxO7VAbKwuJgSLw@vger.kernel.org
X-Gm-Message-State: AFq9FYJRMG9utDKsCzT324F8fVGt6aBk19mGQ+FUuPdM6acB9mv4iijv
	lfs1OLYKKulAv3RRfSlHmU6HF04WVqkpfiJqC/9syh6SQzPoDfOFAzAJ
X-Gm-Gg: AYBFou1T8Gnwds+nKzKgrsBcSSwVMaV5wMKn8KPegV9h830KnBXxc6lWLDwtMK7GgsI
	BnaOspiQbeA7wPNLLHjUU0ibN8rcKKhaNDMd8t4uvlQlEl7eYsFItb5l+zd+D7YTaCVWlF1Qafq
	8tXY7/yKf+EM+ljRAAQ7g3Uech3AI86oW0qO0PVoLEeE3Q6ZGM5Y/pMGdTRnVDB5chbuEXtpRZN
	mAShglZJKkMVvGaF8X0AScSJf5FaShkJFGSkDU1yY1rJc1T+e6+9LZvsSnk4TtbKpdWdLKtDwY6
	f5OA8L8mMPQM80v78y5dOQXIkIITtebmghqGLB4OkCw0spW69B5VHvg9sH6foCA5hlEyytyn9i1
	g2w0PnIK8npRA/U2N5+srMQZeUDknT1sEnxLogcsGAJ6EMNzmJLjwYEjXjRU7dfCFsp1kDzgo/k
	CTZt2mBACiXhgVFqZ6DyY+r9vbSUvpDO+T7kXMypiUt0Lm21f7bAM3U/BEIHA3sur1ZbKvUuJv5
	ezm0ft/xtj5e4YaYjaLTsxEdfMEhwVbj9asu4nUezjSZSnTnw6GRNu1DWipd/5aetNw/KGiAZBj
	X3gLqIqr0GZVw8HNnpKq4q/Bb7ca
X-Received: by 2002:a05:600c:c082:b0:4a1:f377:5c6b with SMTP id 5b1f17b1804b1-4a1f3775fa9mr44357515e9.7.1792504797648;
        Tue, 20 Oct 2026 06:59:57 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8214e1sm6231804f8f.37.2026.10.20.06.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:59:56 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:59:53 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v1 0/4] arm64: dts: Mark Variscite i.MX9 I2C recovery
 GPIOs as open drain
Message-ID: <atdz2TonrGyL9Ox4@Lord-Beerus.station>
References: <cover.1792326585.git.stefano.r@variscite.com>
 <20261020064106.197223-1-peng.fan@oss.nxp.com>
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
In-Reply-To: <20261020064106.197223-1-peng.fan@oss.nxp.com>

On Tue, Oct 20, 2026 at 02:41:04PM +0800, Peng Fan (OSS) wrote:
> On Sun, 18 Oct 2026 14:32:23 +0200 Stefano Radaelli <stefano.radaelli21@gmail.com> wrote:
> 
> > The I2C recovery GPIOs on VAR-SOM-MX91 and VAR-SOM-MX93, including their
> > Symphony carrier boards, are missing the open-drain flag.
> > 
> > This series adds GPIO_OPEN_DRAIN to the SCL and SDA GPIO specifiers to
> > match the I2C bus requirements and avoid the warning emitted when the
> > I2C core enforces open-drain operation on SCL.
> > 
> > Stefano Radaelli (4):
> >   arm64: dts: imx91-var-som: Mark I2C recovery GPIOs as open drain
> >   arm64: dts: imx91-var-som-symphony: Mark I2C recovery GPIOs as open
> >     drain
> >   arm64: dts: imx93-var-som: Mark I2C recovery GPIOs as open drain
> >   arm64: dts: imx93-var-som-symphony: Mark I2C recovery GPIOs as open
> >     drain
> > 
> >  arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts | 4 ++--
> >  arch/arm64/boot/dts/freescale/imx91-var-som.dtsi         | 4 ++--
> >  arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 8 ++++----
> >  arch/arm64/boot/dts/freescale/imx93-var-som.dtsi         | 4 ++--
> >  4 files changed, 10 insertions(+), 10 deletions(-)
> > 
> 
> LGTM:
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> 
> BTW: Do you need fixes tag?

Hi Peng,

Thanks for the review!
I treated this as a DT cleanup since the core already enforces
open-drain operation on SCL, so I think it is fine to keep the series
without Fixes tags.

Thanks,
Best Regards,
Stefano

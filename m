Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B8848424C
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635821; cv=none; b=TvVlnuuSKUUvs53yJbifBw+8wzJ28E4pxyi0eynHe7PIAG1M+VdLGycNRMh6wXJfbKKlNnWgcgD3kCeZSwAaUBKTI+NJIEvbnCNGy6RIcr08+6bjXeYAguMl41QiFy7kqIR9tj7PwqDQmnHFW8w9FdJFMp2Te+XiEYjN81ZuWhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635821; c=relaxed/simple;
	bh=yfRkCuS35PVDJtQH6LGNo0eJraVDhj9aLz4NwrcJT3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6Jga929EniRZkayTesx0IM+0OEiTRnJXpqgPc1RYqZoVgAEOo2CIy1+KBnEz0dXbZrORKDl38a1Jx10EiHQfZblptn7m1aI96ZbPZ5RR3K2DXn6u+TxiwiWmwqyFpzMRCh2i6iCsz8IyVrPmrs/X03CnfeKDtDQ9O7Lhl1/rYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y926oDzO; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y926oDzO"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38511175ad3so2224000a91.2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786635818; x=1787240618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JjmvO0/8z0Ky0cbqYz65H+qVZdA1pLokllKhuMy7Skk=;
        b=Y926oDzO+aAE17iH1VilGC/H7X7+1Guhx/Wl+ZWHmmTtIk2O0D7ZzYboPXIXE6w0G+
         F3rLBxw/D/2kBF24WbSemtSGAd6TgGKC8wy1jTCAxhyjaFuPFPylXYZtRI/btr6fiaLG
         5lxNACxY8y2LhaPBtNfVIpO7lrllsPvCiYHlBjt5XIeOhDCgPUDoCIqxmCSk/iWT77UL
         ujDolwEWtGtlWv1mnM2N6OMKo0ijDI0ECW1/ggtE/fVGnDxTGDLHGvp39VKJLiz3M7VM
         OzrDwn5uctTraKA9fLewP8XClN95tCpaX63aT7Ed+HCiEpm+mKCL07+TfmFjxzzHXZYb
         em+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635818; x=1787240618;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JjmvO0/8z0Ky0cbqYz65H+qVZdA1pLokllKhuMy7Skk=;
        b=X0+7W6AiPeNh6HpK8FqPO0OXBbX2RnEAZd08HGG/2GhmI3TKiCG/r1RT9ygUk17RtV
         KZxusnHRC9FvcqkFWV7Px5FF28/RuayTmUdItLzhixHYMK/0saR7Do/Ivz9jbpec0p0i
         dmzW2dSGnT69VnHEKT8bo6XAqVN3I/4BQL0zH6eNZa9KZjGTYqmvK4uoCCqqPkMCMy8t
         wm7JGpkrLcm0huX6RIaz4GOcCRBl+Hb0NiBU4Ejd0ssm0Dh27fTM/EWVolyFKU209fTx
         dczLJUjR29xJmMFNx25wlv7pMbZkxT+iMsDf43AVgYC2B5de++rMqsw+EGyUr8CPSsXO
         BZEA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6VZVSq9VMKU8kFqse4X2lEG49YRYqKcpDUMgLFtqZdoP+88t94RtfTuVGwYkZHEUgG0KB812x3Irx@vger.kernel.org
X-Gm-Message-State: AOJu0YyANUCFfWDZI2b/dfkZDsADkjQoHL3lwCvlSueAj/eoK7TcQuWD
	le4urEr9YhUTdhzzdn1z1Nh6au0xe7Yb0J3f9S8tmrb8TiQjCQscK5/S
X-Gm-Gg: AR+sD13J1bQTYu4bXHGBZ9cs0Ty76WaAzOKHzKQ8PVS52386o4HcTMu3KOCwPsbfXZo
	zkaj7NTmKwN3QRtjW0h8vQOuw8FvOcFPMZjiOTu/ThYCaRVUyO9Iva5u7rjNYf8A75oQs0UB39q
	/Ke4tbDcSo3VH1IYGpRqitHIqWKBTfpS1cdco9g2pMoB9J8VXfYmU7TNA7CwQoeX/qjPvuPN4g8
	e6iOnB2YLuKQhQuFkqHwi2QOGkhQhKnC1IpMb7weIen291xt9Gj02RhrbYPpSl7x+7aD13M9I6Z
	TxZk4xGLs2GIIfhB4fGhB8dASN+BrDB1jgbYypnVtoGjzdeuSUL/4h6izPDc4Wv/ZFO2k39Y77j
	bCLemxytahnEe4kXl5UhxdbezML6sB2iN4EnwP1eaqZWdRK2hbJpfdriqmUKr2hclvRWPeRNukD
	l2dPCXS2Vl7KMscAW0TC2iJHGLIDDwZNBgAlBWPFuOBoEbzu6rWG8J+UBk7d4Tm3s79Rg=
X-Received: by 2002:a17:90b:3843:b0:38e:1497:af5b with SMTP id 98e67ed59e1d1-3931dffc226mr7907538a91.1.1786635817974;
        Thu, 13 Aug 2026 08:43:37 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931dadc0f4sm1600312a91.2.2026.08.13.08.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:43:36 -0700 (PDT)
Date: Thu, 13 Aug 2026 12:43:29 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <an3brO5COdw_F76m@SMW015318>

On Thu, Aug 13, 2026 at 09:58:52AM -0500, Frank Li wrote:
> On Thu, Aug 13, 2026 at 10:33:35AM -0300, Leonardo Costa wrote:
> > From: Leonardo Costa <leonardo.costa@toradex.com>
> >
> > Add a device tree overlay enabling the Toradex Capacitive Touch Display
> > 10.1" LVDS V2 on the Verdin Development Board with Verdin iMX8M Plus
> > Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
> > on the Mezzanine LVDS interface (J10). The panel is an Opto Logic
> > SCX1001511GGC49 10.1" WXGA TFT LCD LVDS and the touch input is provided
> > by an ILITEK ILI251x capacitive touch controller.
> >
> > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
> > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > ---
> 
> what's difference with Add Toradex Capacitive Touch Display 10.1" LVDS V2
> 
> why not share one dtso?
> 
> Frank

Hi Frank,

There are two main differences:

1. The mezzanine one uses different backlight controll pins, so here we
use the 'backlight-mezzanine' node, instead of the 'backlight' one, used
in the one without the mezzanine.

2. The touchscreen GPIO and interrupt pins are also different with the
mezzanine board.

Leonardo

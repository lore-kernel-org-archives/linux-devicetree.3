Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793880589;
	b=aYw4kvqIOR/a/gfxoyhubf7B3lgo0AOopTPYOJMqktMov9WWSm+zYABOIeHHfCOS8SbS
	 hcddn0YpUHMCnYkVLT+1ogJk9CprVUfOiVVTej1zXLLXI+1bBojdAKecy7g0nApFhch6J
	 T/Lwe8RhrgKkcKkzLYD48fLUfjRUjjv1o9eY4bIRcwPyU4ai73vriZFUCVylc+W257fNC
	 I127vgPWtRbHjRGNKxJsDucMvTegmSXx492lRdhBbjTGzcF6qwtezsiP+h7yMKaqP86TU
	 VG6nuS+ZZBbIlmDy+qraRujv/zETF5Shk+OtQurYl1LYK9E/nboefh4VRyuD7dJTDmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4fvBY9zhAaIiPkSg9Hq87qAnpt7MuwN0ORLvoKho5YI=;
	b=d6prTk33Vqtb2Mk5HbOYS0HYgajLkhDiEfuD7MgKKdAgqUvjgqLaRef+Q8Ur3wNDlkZL
	 Ct6eAYYB/SD80arAj2rk1Cw8AlhV9inKvbOVFPraqpwIyktG/oCywkwwm7ztW4XCRlPb6
	 McHuVCx6NLCo8wIsNUAicA55GLT/2O7FMiMWmoKHhXlFP/Nut3qplGINimPvBRJnBlYJP
	 dMegkV6frqEsQQ4XAlmLHH2HbSeSgv8cfochTyHl7aJk8qIxcgJh8FoFsFarbuSbhpEyI
	 S5HNNekEj+bdCKO9XcQdEioPvDEFa0skyy4Vrr0eulNiED2t/LmyxCFgiiuKFNXg4Iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Q+WxMlJf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A27D606D82B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 12:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A27D606D82B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=Q+WxMlJf
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso1062716a91.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 04:09:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793880588; cv=none;
        d=google.com; s=arc-20260327;
        b=gKboaAYqaWJupqM5fha8L24UY8AL5JOHr8ZJn90PpIEcbFlCcneOyJldiC2z7lLp7V
         YZpF2RVjlksjyAmKxV7K2UXg0x/iyTPRJTzIXer9vLfvEntWTrgRpT9BmgkNenagqIfe
         8canhcMPDVJ7YoMBQ6GbQ6oF0ZbYV59gWNgU7y+LYvx+G86cQZlQ+aGtfa17PaUJ38UA
         IYx9wkelZhMllbRgWsmoJnSrHv9M69VjqTROPqFf7tqtKiFNOI0+0r7Y1DhXotyAg2Bf
         cIe/hGGu7mKx5q+aWjf9iXU/gjQpJ6RV7pL2gOtPFszumX1FYtHOR4V5PJEQe+PLGQHi
         3IFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4fvBY9zhAaIiPkSg9Hq87qAnpt7MuwN0ORLvoKho5YI=;
        fh=D1GHWf/Y5oAfcqbMcf6A8PlQonQdiINBT4Pl4EE/4PY=;
        b=K+qYUJCASYn6O1DCqnb1PVNjwHvh6Dm7Jr8upNKDfdkqPEnhgbqZRsM6+wT090+r3T
         KNrkJw6upAUNTZVSj9mjTiQmXxffJ7maHrZ/69zSv4nTVjy4DwvfHVKXm/Fa6atRKrdr
         tmruvqObWAmx1qwAq0HfFyu2tu6jldbnRQ19i0Dlq1CHhhns3u3G5a3TRPfcAwJEor6F
         fUibHV+7aE6rTMhUVOW8/E1mcnUrf7xHwBUpah/5oNw2QKNAw6e4x1bNld8lThW1xKrt
         nOcZSFfDvlMBGhC0UULYUzIg2x6N4IC9IR9tfDr7iQ8c+3YjkHZobMZS/zRlPliBvDuI
         v3Zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793880588; x=1794485388; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4fvBY9zhAaIiPkSg9Hq87qAnpt7MuwN0ORLvoKho5YI=;
        b=Q+WxMlJfY7MViaU6RLvN7dpZUozphjLESBEG2broJDvOwYJAvRWCePoSVYZS0ayrT2
         yDPeKobp0ymw6o0GmblbfC4Q4XpXjHwETjYN8qOZ+7LIAGdXwRxgFNxx2R/jU99w9CRx
         C4E9xFsAmOh9/8YZaYPyDChinvKxfAxj/aDcldSCDR3UUP6JPc4RgEbL3iQry7cHWlyK
         a+rj6L0fgiNySzT0SzMHdI9iA7jrUdVxbhaDTTtCk7GpvoSXfTTKuY3Nv5/4+2TI4Qkh
         OcGPtSb+I5CxNAg75wEatcEV6sQphoKgiOn3L7Cb3SpJ5uHIAvghzWrl6bJx0E45NSny
         FnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880588; x=1794485388;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4fvBY9zhAaIiPkSg9Hq87qAnpt7MuwN0ORLvoKho5YI=;
        b=jtK5CNw7joq2LgAEg+RVod46I/jGS1VMupfl+LPaufXonivUBOvwRAebD9ycSeF4o1
         uyv+D4S2TNBR3XUsBq1s6/ZgK34kLb4tLIZC9+xqOlnox8YM1XQJDoBNEaCBLkkE0TQN
         dhOXuTr6tvNZQZm0EVI6RMosFrM/wgwkujRHxT1rdm6lQ7cg4VZraC8JA4XztA1s31zB
         65HcBgW+iyK3IOAUqmHNfKAMOn+oce/e1+7IjA2WSGopnnvNtP4p8uQ+Ur0NxB14MqBy
         Ci3ub2oYGE6K3EuVVIX79r7mIAqUYDJK40QQA5n6+crx1PzC4B4GGZVIEuJXOCIkaKIk
         LP6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxWTnevHYZFx0Maoe7ltkJIfcFubKzAsFpahay99XBF9Fw9isT7VgzxzsmnXYd5sDWS/+aUfC6XPiez@vger.kernel.org
X-Gm-Message-State: APuU4Z+0OfRQ0oo4Q+ZiCs0vNAag8zgV2hy7ufe1Stn33Jgc2Nz/BUFw
	R3IeUH49xT7YDNlILarA/3RrltdyBdRu7AsDFzrysJEkRLFWf9TYNIDROAQ6MowYy46/Z/MaZtp
	oUp66ldh0FOc6DGszjrQcwyYdHz3dXdz0lka+36kXpA==
X-Gm-Gg: AYBFou2VhO/XWJCdG5JcDA85aQs27cX9aUvDCym1Zp1GyLvyhIfAz2tfndBMYHW2v1I
	8eE453EBfpRy3LPSRpAAe0H7SJy08jWgmwGZsqki1X0FM0tY4S+gYf1ka3Zbdme8CXaGHyGc6AQ
	xTi6yLRrSgFs4HZJE1jvONWqYWcvnNfY68FBGfAnKIJe0JCLcwVUkUmclcx7awMoOJGfzP2PMqI
	/dcU4+TnHJlLU8q/GhMDo5G5pNfOnXBkqozOqPm1EA7Xh27yPeRF2I36eCQ3TLLBveuTHYck1zh
	//Dw/NwYmovsgC+5lWBMWwnNtJqgjWclYy+e8L0MjrVrTLkTU+k9w5mVPRR1rEGaOhWfmMRquvf
	pCjXa7iyk2FfJw0ATyniEPvgsGLKUkmr41S+WlMvK1Q8f+xobIfdX0I7zW6I=
X-Received: by 2002:a17:90a:e7cc:b0:3ab:2737:3395 with SMTP id
 98e67ed59e1d1-3ae8979d3c7mr16512224a91.42.1793880588558; Thu, 05 Nov 2026
 04:09:48 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com> <20261105-dw-hdmi-qp-yuv-v6-14-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-14-1bb63ef5766e@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 12:09:36 +0000
X-Gm-Features: AclHuK_MHMThyHgJMV5RxoSYYJYLTJBQMatbDWcZrO2pg9eAtUGM46fm6kw3Mdw
Message-ID: <CAPj87rNp=Qen3CpxdBWHrKqmpDq=w=3fhbuJFM2uVLrwizWQRQ@mail.gmail.com>
Subject: Re: [PATCH v6 14/15] drm/rockchip: dw_hdmi_qp: Enable YUV420 output format
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> Both RK3576 and RK3588 SoCs are capable of driving the YUV420 output
> color format, and the required bus-format handling and VOP2 support are
> already in place.  Advertise it via the platform supported formats so
> the HDMI core can select it.
>
> YUV420 halves the TMDS bandwidth compared to RGB/YUV444, which enables
> high-resolution modes such as 4K@60Hz on links that cannot otherwise
> carry the full-bandwidth signal.

Reviewed-by: Daniel Stone <daniels@collabora.com>

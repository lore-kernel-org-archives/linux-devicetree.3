Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66BE23A564
	for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 03:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789789588; cv=none; b=IIFxgO/0MX+kzT0m8+1r6le2IbEiW38n9cPZxI8JuB83K7d4TJPkXs3MKCsdLVKryTzxvs8GhPjhYV/xPmusL0ANkB2r+ZoLJGHZzQPHA7UbscWmxCFwW4Brz3Xl3gg3frC+ayhB94A5WJTVq7NyCVlIEJwD+B1YgpARJWLVlR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789789588; c=relaxed/simple;
	bh=fHoduSfqmeHU5vnirE2APiqfMdBihLmLNXcPHXFuxyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/bKpt/O0Rcz3DRbyaFHY9T2BU8LgnVbC8Ik0gu8buLeAxBMdMZNVThGJt99ok1grUPWxWhxo3h7CEcAGbVI1iVrtoOSA+4TqquUtW3a3AY0jOAT+88yrJqwE6fQkD0atDD8TxVvAPFyBvOoKM8T3p8Bhr33L1BjEmO2yg0gm/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMt7HpIH; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMt7HpIH"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-89666eea29cso10186417b3.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 20:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789789585; x=1790394385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kkEWiPdkM+yBWXXqRxoSdmIjUeqUoHdebZ7h0q4+WKg=;
        b=KMt7HpIHhl7BWzKbeN/pe9ncuijW0RX+rPxXTHgWiRNS44HjWnMKU9UOLLbOblVPNJ
         XkTk8GRja1LzkTuqoouR6kWrIXFWqhHsmq57p7Vtp/Aa68Fon1HZE/Nr25BWHc58wRZL
         9cjWcIPxDo7e1vIHKe6HRrDH/4SaLw1j2XhTXfnSbrTjz+p/4YbEaQn90KZoqL+WaklO
         qQu4sGPuZnpiGI+XFVEK1vkRq10xav/pYOGJxd9MwbBYl4JDl0M9GCVZvHhhOiNz/dqs
         0zjLu/DzlvtZBML+uKdCmfJhq1Yrwq0B9pCqtYfVS+jutyrZ9x2BHLJLE3cYlHN6Z9gt
         SJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789789585; x=1790394385;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kkEWiPdkM+yBWXXqRxoSdmIjUeqUoHdebZ7h0q4+WKg=;
        b=r38Feh1vTUnYo6Tx8SEuJDwfzHOmQmDC71sinGnAIKAic/Si0gtZ7UnDL1lkXiYYwp
         JpBCCvQohR+/Yqy84IaZ9lKOHOWjB6O1E9tChFjckc1kIblMCqkw4OODhvB0AWcEbuvz
         73xQd1OZrPW+pkjxIcyJSwZlbZBQYSLNfV4mavByvHw+q9dJYq8vjswzPYqgt1iH/zHJ
         uwc8K4JqNVpVR0CzRAD2Cy2HeQLZaMZhjCJ2rKAkKCsvw2mhxguDy3HvVGXEENF6huUx
         X6Sfjxstpo0XWPmeR/zOyvM0QZ0TbAHtXYeMlB30ITLgqJNZLKQcksgOzxX+Eawa+FAB
         LbKg==
X-Forwarded-Encrypted: i=1; AKwUvBwmuCld1BFMqP4AY5CMYfgChhrXuB1pHN94ozfHFDIsLabY86TYCN3w5FSzUOrKWTmn094uBkbr7MCo@vger.kernel.org
X-Gm-Message-State: AFuF++ml1+US2z8mlw9o3HT6vIlLVLaGSfTCJCEvo31UOBmxAjJS/9P8
	P2sgRSZjkmUf94gVkCnq3Fl1ATYypZBipRUg+YmjE7QYmj42VLhB6tDd
X-Gm-Gg: AYBFou16VNiKYMww5Y6vHaoiw9M4B7U2j/xT12teSBKeLtbvxJ35TBfMiAX3hedHQGv
	cCb2HNvY2i0vdq6K2Pjgv7Y8jJMR4q1DFdPhxRLZt4T4pSlvXtE4Ssy14+tKaDPl6wxxwIb+MqL
	Ub7jzJKApNx9MkfAEUDdlzhx0VFz9g6SBwRh+CsWlWWAY/KpIlZUsq2p6vJ4bcvFqUKYZ/aOFET
	jDUIZiuEKm4EPLQNH8EQx+SKNI0XwxiVH947Oo2pAHJaLFkecMjpF5IHUXQxBtgoiIuxUWg7pjf
	nsx+qQXpkmxujjBbL/5RMtyTuAq/ZQS0Rl+2zN2aC68PlY7psO0BhZcDln3cke31kkbk6R7yqRq
	g1zMIED/N4gRV0Xqa1yJ22JssvanBNCD6HBMQfKMkXko8Tlsiz0jaFAAFkg/eBvfekmsgHJobov
	nbVqln/ylx9m4OtS4+h+RnbLQsBvok7oIzKydurk+ocZrTGSCiz4hLuQ==
X-Received: by 2002:a05:690c:88:b0:873:5bd1:98c9 with SMTP id 00721157ae682-8973839bd60mr14337277b3.59.1789789585628;
        Fri, 18 Sep 2026 20:46:25 -0700 (PDT)
Received: from gmail.com ([2600:1700:5431:250::3e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a480d45f9sm5919867b3.36.2026.09.18.20.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 20:46:24 -0700 (PDT)
Date: Fri, 18 Sep 2026 20:46:18 -0700
From: Chang Yu <marcus.yu.56@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Chang Yu <marcus.yu.56@gmail.com>, Andy Shevchenko <andy@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shi Hao <i.shihao.999@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
Message-ID: <aq4FioMYYiPqlhwS@gmail.com>
References: <20260912013912.51887-1-marcus.yu.56@gmail.com>
 <20260912013912.51887-3-marcus.yu.56@gmail.com>
 <aqepkmQS_p6K1Bd6@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqepkmQS_p6K1Bd6@ashevche-desk.local>

On Mon, Sep 14, 2026 at 11:00:18AM +0300, Andy Shevchenko wrote:
> On Fri, Sep 11, 2026 at 06:39:12PM -0700, Chang Yu wrote:
> > +#define AS7343_ID				0x5a
> 
> > +/* AS7343 config registers */
> > +#define AS7343_ENABLE				0x80
> 
> > +#define AS7343_ATIME				0x81
> 
> > +#define AS7343_ASTEP				0xd4
> 
> 
> > +#define AS7343_CFG0				0xbf
> > +
> > +#define AS7343_CFG1				0xc6
> 
> > +#define AS7343_CFG20				0xd6
> 
> > +#define AS7343_CONTROL				0xfa
> > +
> > +/* AS7343 status registers */
> > +#define AS7343_STATUS2				0x90
> > +#define AS7343_STATUS3				0x91
> > +#define AS7343_STATUS				0x93
> > +#define AS7343_ASTATUS				0x94
> > +#define AS7343_STATUS5				0xbb
> > +#define AS7343_STATUS4				0xbc
> > +#define AS7343_FD_STATUS			0xe3
> > +
> > +/* AS7343 spectral data registers */
> > +#define AS7343_DATA_FZ		0x95
> > +#define AS7343_DATA_FY		0x97
> > +#define AS7343_DATA_FXL		0x99
> > +#define AS7343_DATA_NIR		0x9b
> > +#define AS7343_DATA_F2		0xa1
> > +#define AS7343_DATA_F3		0xa3
> > +#define AS7343_DATA_F4		0xa5
> > +#define AS7343_DATA_F6		0xa7
> > +#define AS7343_DATA_F1		0xad
> > +#define AS7343_DATA_F7		0xaf
> > +#define AS7343_DATA_F8		0xb1
> > +#define AS7343_DATA_F5		0xb3
> > +#define AS7343_DATA_FD_L	0xb7
> > +#define AS7343_DATA_FD_H	0xb8
> 
> > +/* AS7343 FIFO buffer data registers */
> > +#define AS7343_FIFO_LVL		0xfd
> > +#define AS7343_FDATA_L		0xfe
> > +#define AS7343_FDATA_H		0xff
> 
> Please, keep indentation for the registers the same. Also would be nice to have
> them sorted by offset.
> 
Due to the register layout sometimes registers with similar
functions/purposes are scattered across the address space. As a
compromise I'll group registers by purposes and sort by offset within
the same group.

Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E688D31AA87
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 17:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780249815; cv=none; b=TZp6Cmt1WYBam9RkvamyRtj/td7nJmX5NefCkfIb8U+NSVTQggHd9NybIS4jbZnChMfwaqRydyUp+EvS7B4ktLJzS2fXMKgGZxlAXHCDi3YEFmDRd/lCQI3F0zucptU7RxgDgvw8wlC8+2c4/xTFNbMFdLaj9Qq2UaqSO2ex7nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780249815; c=relaxed/simple;
	bh=Ie0tdeKKKC/qHnGi11ij9dSjb3ov2da91DTC1L1Uk+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7YF2HGOo2Tn3zerV+j9N7E/dNIomXSQhqS5aMT+9whLtcBg2bGlFKWHUG10h6ePtcsv5O7GAvo79WyRdnbaHYVZiEnHNomIzFx33haMyEMPi1fbwf4rF8Lr/9dadI1Wh5pXH2fHcdAsZJ6diE4/ykWWkMSraBHFsX9bpVWTHCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1mrxMoL; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1mrxMoL"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-59f8a140a51so336366e0c.3
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 10:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780249812; x=1780854612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6aOFqOE0+3SonSNESP6o8ztUwdkx135+fxitVMjtx9E=;
        b=h1mrxMoLAmQ2dO0cA4asbP/CzA6Cu7dCrACCVcda4AFRM6CgxFyaVJzh7cz7Jc0GbS
         gPLW4PF/75wN6UlMT2MnZPOSCb+SqPtgWhEPEiZJha4reZOY+uTDESmdDD7RJzd0/o/t
         3emzwO0deCWK7HySUmYcLKDo6Ck7KdsmSGEKloly5Q5adYoY5kyLDhAPvQPhBPrawXF1
         QmzJePN1Z5wNuU6RE6Oo1oj9eL30KorW8IuUpLfD8DrQlTDmHf80wXn+YGPrs7MoJpgl
         Vgw4NyjsWWIUuc8Oi2YBkhZlZjmHdQ0ffh30BgdePwpB92EYcnWoQ/0fS43JCNH7smMY
         Btcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780249812; x=1780854612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aOFqOE0+3SonSNESP6o8ztUwdkx135+fxitVMjtx9E=;
        b=BQCZeiO6ZTZfyNzvx8v3+VfXb/8BJegly/O38+JePei9ua3m2h9MudEdMLdepGpSFh
         UDwMcvoFTvxzhqVf7SzBdbvI4nB1p8a56hdBLUjPtlVwkH+eIR1GQK3RgQCkDHli4beZ
         9ywlpKosne4pDBXnmq59qdSm/DIIsYWlJ1TlN/G6e//TYvNqDqZ/ARNQxhYW0CbL394b
         Ko7U7HfMFv9Dqw+iQbZjPdyE1V6OHrUFNODEvtbTZvZzzYTUHVPKqCRpKzqPJw/7Zhvg
         olgIhyc7Ln2lNuOJlERdjS+pJYQT+PDg0vSdbnIUHBJPzslGZk7nPOG8sKb534sW1oNR
         ogBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8nzT6GhqLYcWJ2hLA6mlZpSBsV7QTVv/XwpSHl7W3H5UjVgwlPwLK7cqZOVx7Elz8mxk9NEFmEMcsc@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqia4+yBXJs/pAtY7Cj2ysfVw9FtbB3oiJkgiS+EwVqoa6N5R/
	v1+o1yHkX3x5Ff18Eidp+tLhCDFfose27XmX29nSqv7I/imTu5xcWeHB
X-Gm-Gg: Acq92OFGdtHdvjC+R0TbCxONaBkV/jOTsPpk1A3TGQa3BHWslM4MQFlnP7fgvXALVtx
	6PxBZKmjBARwQY2d0D36Q7d1NvBSwg6k83EHB6sBpNlMB+jp6Xt0EG1O2U30gcQUoxbdizgQx+3
	hLJ/h9dtqYqDZ5voil12jMPcoP9yXemdxDZn1wod9KMHL9wyHMf03QWg3Jq6FNSlXb6Lf/HoqfM
	MdKmIwH94Litzacr9QAyEDtG+c0E9Iw2BxxacmIbeU/enj73ovtDamhvvvHByo4fmL4YswjVmEN
	7V74Q+pWfwsnON3ybgPlSJ0cevao0rQR04i3uPvKksNDKrfwMLeC1ApbU9sEBcnXkIPQIfGMq5d
	9Xmaac/lvMKEHidQUrUzyFntUNSKzLhQOmdnRyDhP/pumI0DXs3Q8BR45D8ULbMfI9C3cW3X4UO
	nJulClI6R5asUIUmbyE1CQ2+65H5aAPuFApLtKQkaj9JI=
X-Received: by 2002:a05:6122:6b8a:10b0:5a0:1bcb:acec with SMTP id 71dfb90a1353d-5a01bcbb86bmr611736e0c.13.1780249811860;
        Sun, 31 May 2026 10:50:11 -0700 (PDT)
Received: from localhost ([2804:30c:1f02:6000:8b59:7c96:762e:9faa])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-59b02af204esm4634282e0c.5.2026.05.31.10.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 10:50:11 -0700 (PDT)
Date: Sun, 31 May 2026 14:50:33 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Wadim Mueller <wafgo01@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxwell Doose <m32285159@gmail.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: iio: flow: add Sensirion SLF3S
 liquid flow sensor
Message-ID: <ahx06cIPIoH4rQ3J@debian-BULLSEYE-live-builder-AMD64>
References: <20260530205435.37326-1-wafgo01@gmail.com>
 <20260530205435.37326-3-wafgo01@gmail.com>
 <ahxzpBcqN6o6q4a4@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahxzpBcqN6o6q4a4@debian-BULLSEYE-live-builder-AMD64>

...
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 06a8c7457..222a03b6d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -24187,6 +24187,14 @@ S:	Maintained
> >  F:	Documentation/ABI/testing/sysfs-bus-iio-chemical-sgp40
> >  F:	drivers/iio/chemical/sgp40.c
> >  
> > +SENSIRION SLF3S LIQUID FLOW SENSOR DRIVER
> > +M:	Wadim Mueller <wafgo01@gmail.com>
> > +R:	Maxwell Doose <m32285159@gmail.com>
> > +L:	linux-iio@vger.kernel.org
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/iio/flow/sensirion,slf3s.yaml
> > +F:	drivers/iio/flow/slf3s.c
> The driver file is added in patch 2 so the above line would be introduced in the
> second patch.
The patch adding the driver is actually patch number 3. Anyways, add the line
for the driver file only in the patch that adds that file to the kernel.

> 
> With the MAINTAINERS entry adjustment,
> Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>

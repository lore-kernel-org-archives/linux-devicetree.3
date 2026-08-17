Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E3147125D
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 21:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787000563; cv=none; b=cPVMppjYsGC4RHif0YW3IRWsErRcYb/kLMgOPFZdYAaF21jjV0IiIVCzOvyNIUnG723+bxNWGZDv06H246FdcEgf21vuTIaRlqPp+NUTpexaOt1ExxIodlajjI56QjHxfXIqa7fsojVdx3HAeU263elWggYObsHLahQRAP1f+/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787000563; c=relaxed/simple;
	bh=OBF4nRNWRkXeGvYZgQo5/rE99ZlB0dZCjPG6K+A5+9o=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPyJdJv7yCIDhpvWHVJojVR/uOcuCB5tkkrrh2gQv97BQMzOYC4g+Gxt4yNZpES7q7fcbtG84LMq05OMSHvlJ8T3bLuYUUEUWQkCyDCHXLvI7j0knUesY2g5Qyfvp4W3lv5d/inN0Mwi5aJtKRPCG5+z11VETxmHz9UMbURjRwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUGc8WLw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUGc8WLw"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4980dc26022so39363135e9.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 14:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787000560; x=1787605360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YsdJSQ5fYAT9wBvdQXX0+jSKWG1ZCV+4ju+rZFixoe4=;
        b=dUGc8WLwtjvazkOoF1yo+1IiQ01uJQWBdJne6fmCMi6VB6JzO1nUjqaSYPhqUdLsTt
         798JAwuKNy6Vjaj4fDWKIJDeNfkYLGsltIbRic1Hv1tvQzyqHZktNzb5mAL9KUetTjdM
         GyKNX0dgJGHvBAAu6lSo6ngDxW5SgC7EXLwRoppX9la+1ObVvCoqxJxKYta6d02JpA43
         BBUf5z85reOAB2CcIMTx7BkkIILFQ3emovVLokjp+YT8irdGNj2Trm3zGL0Q283HmdDR
         IVwtr/OCmL9LLWk69AtQ6EEqWUqpRUUfH7WkyXwy0hfQE3p9UzppQeEUqy6K8jX9zVqK
         9qMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787000560; x=1787605360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YsdJSQ5fYAT9wBvdQXX0+jSKWG1ZCV+4ju+rZFixoe4=;
        b=rLKmW3yHsg5UyNuveoxKWuD92GcRyDO2u7F+epjW9AsNoHmKq5/ygNSDm3u3nV7Sdz
         lDRGFpAD2g7gCdJUEvXIGYi9LG2go3JVPfVTzXLqwxPpHjoA4QTELNj/gWuSR7F6bNH/
         W+qIZbAPYuO9Ow4uwzEj6X4QbhdZxxBteEfLi0AjOGgvUveKuarasvVm/ex5RGmV43cN
         Yc3G0tEv4uuCnGNK5h2rVRxr8rXfcCmuxc5snCJhsFv2gp4U7Arh+t0aBnq8dIBNB5kW
         30rQN52pocAl6zqdMq5w6j2cXplKbAauQbHJg/bqUubQCyd3YTSU0ZDIY0Esm4C0i4BN
         inpQ==
X-Forwarded-Encrypted: i=1; AHgh+RoqvlX+lrIU2PPMfGUS9kTSoGRDbn2NxOmnnlGf/bfR/iyBGZW6LTt4t+I8qevSS07g2Km+SEUFF+Zb@vger.kernel.org
X-Gm-Message-State: AOJu0YxVcOAT50W0yUtofihs53Gei2hVriog1bE247nHeM6cqRsUDK2M
	Yrq76drGIpi0zVErHySPR62YQqGTCtp4aKmJev5xeOUeu/F+f332Hl8G
X-Gm-Gg: AR+sD11MRtwt5lnm7Ow+z0kPNO5h/fk0IFVhNSdWhlQjXq9duPQSu/0Bhfky3DuIdJr
	fMbi8kpyJmeqZyoVcPsP6Xe/z1At4lYfhyujFcbUnXkrJA/awlVSFyPH5FdlqmdvJbWN8oyCxBS
	UCFd2LJ9P7KyPFYDbb56idru2ZlWtPjs+LD04GEAr3i1E+8NnYOHH/dOSnolCtYsI9VVltUf56n
	c8H9AQffob5L/lwm3zjXeP0/YPe7w6zkvW/aIsk3JMOGorKaP2nKWKsc9jsVV1YRaO5PVRDB5cY
	+avZ4YyPCvbT5tmB4vufzEvfgD4wYyhTFm4sf1S2KXJ+oqejNlU4bobgLgn9XTqD9ylU+2+yszY
	9lxbfUXAevV7ZZ8CRlUpVhe57nHdlqu5FLjz2jARRIkz00+MA/mPq94FwMjtMWV2IwD2OodHOl7
	SB/mgakytV+I8cIHHUYASEnNtOyM42vE5ZVplw5K7L1ESxGBNw00ijiXEbC8Z5LxyGpEjbC5/WQ
	RSpuyYblmCRcXUQCnKjC3HE22nO9LY=
X-Received: by 2002:a05:600c:8209:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-4998796f497mr470360865e9.13.1787000560141;
        Mon, 17 Aug 2026 14:02:40 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-21-27-15.retail.telecomitalia.it. [87.21.27.15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b81748sm7050409f8f.37.2026.08.17.14.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:02:39 -0700 (PDT)
Message-ID: <6a8376ef.be1895d6.92f57.c9dd@mx.google.com>
X-Google-Original-Message-ID: <aoN2606mlY7pWZ-X@Ansuel-XPS.>
Date: Mon, 17 Aug 2026 23:02:36 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH v14 00/12] net: pcs: Introduce support for fwnode PCS
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
 <20260817134727.1f76d6dd@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817134727.1f76d6dd@kernel.org>

On Mon, Aug 17, 2026 at 01:47:27PM -0700, Jakub Kicinski wrote:
> On Thu, 13 Aug 2026 10:35:05 +0200 Christian Marangi wrote:
> > This series introduce a most awaited feature that is correctly
> > provide PCS with fwnode without having to use specific export symbol
> > and additional handling of PCS in phylink.
> > 
> > At times there were 2 different implementation (this and the one
> > from Sean) but Sean agreed that this can be picked and used in favor
> > of his implementation as long as his case with race condition is
> > correctly handled.
> 
> Coccicheck says:
> 
>   drivers/net/phy/phylink.c:1039:31-34:
>     ERROR: invalid reference to the index variable of the iterator on line 1028
> 
>   drivers/net/phy/phylink.c:1364:26-29:
>     ERROR: invalid reference to the index variable of the iterator on line 1346
> 
>   drivers/net/phy/phylink.c:582:7-10:
>     ERROR: invalid reference to the index variable of the iterator on line 569
> 
> I vaguely recall that you're supposed to make a copy of the pointer,
> not just add a "found" boolean. Dunno if it ever happened but Linus
> was trying to make the list iterators override the pointer on exit.

Oh! I wasn't aware of this intention... I have seen lots of pattern where
the last value of the iterator was directly used (if detected valid)

It's and easy fix... I can send a new revision right away if you want,
I'm already on it fixing this in the meantime.

-- 
	Ansuel

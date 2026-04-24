Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096363845D4
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 08:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777018122; cv=none; b=PUwkGFzaKzZOeW2Ok8/56+lMBFR7OA8d+Qf+HablBEYNSxObDxdizDW8fDuhQGRhHGf5YVZGiaCPnd3C2HONiEDn4CERRIu1BThaFPdcaf60eGTheIGRTc6SgK+jTf9P/+Xj/GMYzyltF7NMuD3lq4urbZK8/Nfd4m2UmN6Cb9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777018122; c=relaxed/simple;
	bh=7FiijmYu3Dj8mlC564v1KV2nBi9KBlwe5DUSdSCtYYc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXTBDCr6txp60FLltz5+w2iVqF6mtq21H6brb5kkDRMnuHIU0DzmprhLRhT5yIL7JoPiVu2BcAzQaldu4AdCXXMcAvnzRc3fJcZIsAiDQtcKvN2NGHuSQ2xaaTdQmNeZBo+T2ZUNyjp9cbFLyLSdNEG2dijKnMDqXFTon3Bl7eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJ38r0Kx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJ38r0Kx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so69421495e9.0
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 01:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777018118; x=1777622918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qyquCGe5ofz0hi3dMWSPP6IFFimcOu7be/w7dUl/RaE=;
        b=UJ38r0Kx7SEdEShhcakqmlL9+v5z+oG5vq50iW1JlKxQQXQQ4RpUPhjJKUv0s+K4US
         hsI+zIl98wSflLz1EoWNlwD+iifrIqlv6Pf0kvQZ0goZhNRc8Ftl2J48NGTUdsruwbm6
         KPV4sRYa4fKdsWcBHV5DlsV9L53DIwmIetEEPAj60L172ljUVIt6GJueakiJQSlCM09u
         soVBbHll8XNBhzOZT9czd2BwCTVFNJ8CLm4uR7uFM0K7HSvuym4jW6mXg9EQxpV4dj+g
         3+lgCaHN1ZgUnKO93Ydjwewy7sOYY8y99YliOOxtxkGhUJ51PBBWsCrxkVD/MAaozOfi
         xsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777018118; x=1777622918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyquCGe5ofz0hi3dMWSPP6IFFimcOu7be/w7dUl/RaE=;
        b=pToHeTh0U0RfffeD3V+PkUFujSAHqWfpqGzPWfqri5cPepMyqdb3ctdc925vncswf3
         0d0GqS6Xof9HOxXgZP2fg2f0Qua4cVIRE+FaPEs9GFGllNJPJBCC5lNqVpF3//V7Uhhc
         qf+VCvMUDi2ynbqBOgSNfCHphhpCrBxLBsw0Zh/T7mIQf75SgS5BgEjJGz5r+0IJMPGz
         N9iKv5a1XUni2gi7d553gVVUGONI+8cCrOXyLa0I+QdFm45I2gof3H31tcAx68m6IOhb
         PqBoQvnYl8b3uudnra1lbbBo/XmuK5x9HSb+fkreuTRHmx2WbKD9FdrtcEihTQJkAI+L
         oPwA==
X-Forwarded-Encrypted: i=1; AFNElJ/eEEEFmxJHDI7wTwEPGlwszhu06l9fvqnrsu0bsQtQ894cGy2BADqkXJzXRRBzFYsz0/FXCSPjk94t@vger.kernel.org
X-Gm-Message-State: AOJu0Yx79PbxGArSlobH16+8+L2hXxlqkXivskoWfQQ4JEbvR21z8PDl
	pYcNxG5A+l3pu99QwZS76Gje6rRvwKVKYOAq+g0h0JNa8yo1r8cgi87a
X-Gm-Gg: AeBDievCUz4EKZpAidIZBPMTB8F/d4ynCZNZfEz75UgB/JFN5xm7004PsUMBW5FOhRF
	LSnA5JAZvbCeWYOamEul0ZjGB15TN/R9LmRRUlHfwbEUkWkr7Fy/L5CZmWF0VG42wEmLyoht93d
	ZJpwv5sH+vpK1lLoDIILvGvBLzYge+wFvytB8nh7utpBYaerdi10htymwbgIwtqVcdE5UdcyClv
	hsOkJ1s3TlUBFaJy1OMn2u/1aWICNHeLoXsbHzpzZxVCnxa5MavIr5Nk3qnvwxNPBN9nA5Uy5JE
	mxDAOwK9q/bRYYf3/GXv4Fq8ubolxSvN+1jfqb+nGN+is74LZWKVlm4/VFu13YMaTbb0RabkbOr
	zeOyc9p/E8VPFjH9IcllKinQS4CNlthI3z8EbxZ10bvTj8dlT6qmsc5FSAOlOdSFijkQJPBy5+H
	EZNQNzlU2H/7yWkcOR9ZxviCP3lXbH6f6t5Ep+lEqhmofIUsPJ46+mKcGkIrCb/VwihDbaHIPRY
	/4JBXeg60wlK6d8SQhi4OdCXg/+z4Ou6vSJ6yukDX6Xr+NMPHl8MRQ2tNNyfg==
X-Received: by 2002:a05:600c:3006:b0:487:1108:48b8 with SMTP id 5b1f17b1804b1-488fb739f86mr239225625e9.2.1777018118104;
        Fri, 24 Apr 2026 01:08:38 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc18bccfsm521542255e9.8.2026.04.24.01.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 01:08:37 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Fri, 24 Apr 2026 09:08:30 +0100
To: Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michael Auchter <michael.auchter@ni.com>, linux-hardening@vger.kernel.org, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 14/22] iio: dac: ad5686: add support for missing power
 supplies
Message-ID: <mr2roj56empkjsfmeptr4iemblzca4myxohcieobk7bx5ikpy4@5a2j52x7x7lo>
References: <20260422-ad5313r-iio-support-v1-0-ed7dca001d1b@analog.com>
 <20260422-ad5313r-iio-support-v1-14-ed7dca001d1b@analog.com>
 <20260423190524.12ef4acb@jic23-huawei>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423190524.12ef4acb@jic23-huawei>

On 26/04/23 07:05PM, Jonathan Cameron wrote:
> On Wed, 22 Apr 2026 15:45:48 +0100
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> 
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Get optional regulators for vdd, vlogic and vref input power pins. vdd is
> > the input power supply, while vlogic powers the digital side. vref is
> > replacing vcc, which is being deprecated, but still supported. The value
> > of vref_mv is checked so that a device without internal voltage reference
> > cannot proceed without an explicit supply. Error report uses
> > dev_err_probe(), which helps debugging an init issue.

...

> > -	ret = devm_regulator_get_enable_read_voltage(dev, "vcc");
> > +	ret = devm_regulator_get_enable_optional(dev, "vdd");
> > +	if (ret && ret != -ENODEV)
> > +		return dev_err_probe(dev, ret, "failed to enable vdd supply\n");
> vdd is very rarely optional.  Can we not rely on the stub regulator
> that will be provided if there isn't one in DT?

Corret, vdd should not be optional, but I havent made it required in the dt-binding
doc. Should I be concerned on breaking existing dts in the driver implementation?

> > +
> > +	ret = devm_regulator_get_enable_optional(dev, "vlogic");
> Also doesn't sound very optional.

The same way, that is not required in the dt-binding doc. Also, there are different
packaging for the same device, on which vlogic is internally connected to vdd and only
vdd is exposed. Some board designs may also do the same externally.

> > +	if (ret && ret != -ENODEV)
> > +		return dev_err_probe(dev, ret, "failed to enable vlogic supply\n");
> > +
> > +	ret = devm_regulator_get_enable_read_voltage(dev, "vref");
> > +	if (ret == -ENODEV) /* vcc-supply is deprecated, but supported still */
> > +		ret = devm_regulator_get_enable_read_voltage(dev, "vcc");
> >  	if (ret < 0 && ret != -ENODEV)
> > -		return ret;
> > +		return dev_err_probe(dev, ret, "failed to read vref voltage\n");
> >  

-- 
Kind regards,

Rodrigo Alencar

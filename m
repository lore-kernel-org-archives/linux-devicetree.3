Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA14B2D97BB
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 05:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777611637; cv=pass; b=FSaDWNXl8TOAh/vb1tk8WqDUspPjFC4h1Ylc13YPLk11aVJQPmDPkT69kRbp2FlHS86uMUzh9ILNHBBvMuAAdE/VlM11Ono9AhKM4AVcLv4LzfF97JbwbKKYtS/d1KEkgUmsSeBL6nBJCjfA4qF8xQ9zrPwnhm4HwRaKlYyJh3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777611637; c=relaxed/simple;
	bh=SBauyVcTPX2Ataosw2rZRkBglocAQphV8+r815lWmR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BCAHk8U7l4k6LZlMyEPFTKCThMRS8RIv/3fng4UsKvlbqTN5ZB4ACD8fY36xSo5oFb45VpJDTwYED8zK3mx2KnzJZ97vOLJZNchuVAZa1QogM5QlqI68cetZqcJuyyQDs+0eq4wfranvmP3HBI6NZ5ZgojOIikeCYshqt8b2frE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LiEdR2e3; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LiEdR2e3"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so20660915e9.0
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 22:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777611634; cv=none;
        d=google.com; s=arc-20240605;
        b=hMsUzSy839MrQwg7t8zYVigZ/lz2nvgFkrlb4VRyTjQZNR2HUFAr4zrrkqCooc/+tj
         vKdp6cQEIOCcdDvriwIQPSEwE+fXnu47nTxdRiM/NKkBlHrSIz+5U1B64juimkAa0qJF
         C8l+PIDu8IJALTmpGqTiNHdFoVDzFSfpsru+CtwAK7oesP6WgNLEHJvdhjOrkwbeSzdX
         GQtoXmij4CEkJu7S7RxHDQDABLMcvJzzq3RQWJZ+KhtgaA4wA+cTmFyHRv3nrieoaYb3
         HQR3E9N9y990Qrnpabap98NV4YrLCdZtEr/ZyFrrchcByionmpMGAN8EVJruGn53JFLb
         TD2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u4fQWvYslfT7zG5J1AHK+cbagfvgWh5WDnFa7R4/FpE=;
        fh=tvrJntYmxBUhST5MWvDKcbXEhwjtCmXAwHWtvnBUHyE=;
        b=kDgM1AbuLx6YZFDHXwOfIFXiIcTb0utErgItigSduNTwNH3ua+oNn+ubeNSdBW7pyb
         1QJxoIXAKJJKODNC1YP70IT7pj89wmgtVl5cqy7OtrBfpcGWuayLD6CnxCdQsOyKM6nn
         Nuxm/FK3IQMGJ3LZ4wg3FKU0+E8YOTkbW2yuGMIo+RoBUAgFQoAS3OzQVOpi1Ad84KWj
         8/Uw2fsJ/GRW7mzZhT0b6gY0gtAR3mzxV8/hCBDkFIUyfOu4scPYnT0tmMvOjZfC8/me
         0PtCXq22mhwb5nHPQZYkYzJ/aggtwFTKnQxHQ9eaUs3TxljX0FiHSli6zkSwMQ6zHu2b
         FFbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777611634; x=1778216434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4fQWvYslfT7zG5J1AHK+cbagfvgWh5WDnFa7R4/FpE=;
        b=LiEdR2e3ds2xAwAt8smNmGpxkyonV63yfyLBw2yNm4kCvCdCpvzXwNeUyWDcn3mpGq
         1mO6AhhniZZs1+q7gc4OQbDcJuYUFKmYqAUglrQZT8v/dbGG/CIYebeJbdGWvwgW5noC
         zoJSQWJY7Wb7Mm5CDDIjX5Nq6ESTUoo5xpqXQZ+QTFcXDOiQENwqgIwncJcHGWRFN0Sg
         Rq1IGKNILeBUbE3T3an00IgKqD0iEy5bRDLDvN4hGQFqkTck7sN1bCoVppveSF0+SXNA
         fHsJ6lpVxSfHIK1ujL5bTuW44WlzI8tHsYHCaVMEMCaJgDI7m0ohuoDP9ExtuTQwDPyw
         D7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777611634; x=1778216434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u4fQWvYslfT7zG5J1AHK+cbagfvgWh5WDnFa7R4/FpE=;
        b=N0xINZcIbzAbO6Pl+XbcSj0vUjTDV5InwL9qf0O2A/hYB37z7K8etDx14mPwjz7gfz
         +3ut+obk1b8c1zpnrD48NlpiGYFoBsmexE7EXf5jxDNfkcPUqE367faDwcTXM0m9Se16
         ePudmWjocY57IPiENhGst5MakcVCMSeUIyst7UgBwPklThSvTwkHxHvWoxmPnKYdYW06
         DPA24nVjPuDbBcuGYLyIvt0acYheIAiQX6O7RgkSnmj8a4kP/lVCNWCT18JaA4Ok171z
         46w4YkXutzWpslOM919JTsLgbQC5boUPKfNMnqWY0TwXDxtt1yd3KJFKjx3P5kgIOjNN
         8gYw==
X-Forwarded-Encrypted: i=1; AFNElJ8oSdPWDmC5RUNDhWhbIgSiLp/UkSkJGNg+ouAD3KcX4Z9/+v9+Er4eWYYu53hrBYEJTUjEYNDRQEg7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6fAOuyDf/4zSv++qUGCN7pOdCgf0LMKA5pOQKIMT+4ed7PiOK
	0M0YHtfSJBgOBBRJpOsxJT7h+lr5Jj2FCL7hTr+W3QnbQP3afWR08v3M6IogeT+r+q66a0Q0HWV
	lVcIPoj8JRk9Oj7fOvZfUQqtrjAyuj38=
X-Gm-Gg: AeBDievxaSh2nyxTv9o2XwX1sxffE044FHg34DcRyhekgDNLJKCE3SPPX0lEWj+iwhB
	v9/ijG44lWJ6vEPKjazAaGMPhbKQpLCh1gFYgHupWh6g4DPBHnb3jZ+EKnnqKfD0UmXG9FYfxCF
	gzgGLmqU0JrcUyrY9axKbceJazHPkSPybHtNckGd3Pz4JBV73mFpVTW7tAHLNYLw213rKQHu/bQ
	TtSH8dS/2lwQo1v5UpQs8qFQH9/8QDCohy2dHPmsIRW4nOOZPq3twGsIqYOtoCu3C0TwFjuqYrI
	oBDxbN3anxA6vFSc0Qw=
X-Received: by 2002:a05:600c:a010:b0:488:7ff6:1f75 with SMTP id
 5b1f17b1804b1-48a8eb98882mr22166985e9.21.1777611633905; Thu, 30 Apr 2026
 22:00:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428113923.112920-1-clamor95@gmail.com> <20260428113923.112920-2-clamor95@gmail.com>
 <afO-nOr2JUfm2dUA@kekkonen.localdomain>
In-Reply-To: <afO-nOr2JUfm2dUA@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 1 May 2026 08:00:22 +0300
X-Gm-Features: AVHnY4JLhHPzj6DGjsiLYEr3D-nEAFcsblb5hzuuwo4dyelOT22nmoL5seKrUFw
Message-ID: <CAPVz0n178FSdKfyEzbij+dvHTv8C4KENbOvyt3-A4a=mJxsYig@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: leds: Document TI LM3560 Synchronous
 Boost Flash Driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 30 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 23:4=
2 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Tue, Apr 28, 2026 at 02:39:18PM +0300, Svyatoslav Ryhel wrote:
> > +  flash-max-timeout-us:
> > +    minimum: 32000
> > +    maximum: 1024000
> > +    default: 32000
> > +
> > +  ti,peak-current-microamp:
> > +    description:
> > +      The LM3560 features 4 selectable current limits 1.6A, 2.3A, 3A, =
and 3.6A.
> > +      When the current limit is reached, the LM3560 stops switching fo=
r the
> > +      remainder of the switching cycle.
> > +    enum: [1600000, 2300000, 3000000, 3600000]
> > +    default: 1600000
>
> I missed earlier these limits are of course incorrect for lm3559. These
> would need to be changed for the lm3559, too. I'd just drop that compatib=
le
> for now.
>
> I can do that while applying the patches if you're fine with that.
>

I appreciate your efforts, but removing this property will lock both
lm3559 and lm3560 in the lowest current which may cause malfunction
when driving more powerful dual LED configuration.

I will address lm3559 handling in the driver and I will send v5 as
soon as it is ready and tested (since I don't have lm3559 I will test
on lm3560 but they will have same mechanism just different values so
it should be enough). Will this be acceptable for you?

> --
> Regards,
>
> Sakari Ailus

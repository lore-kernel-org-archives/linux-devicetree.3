Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF683C3438
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779037883; cv=pass; b=SUtqq3gpCJCPgLWhbKZds42VVm7R9llcfamywvudhDHueLVBugo+TcTk1LDv7ft0OblseaIXzINo04SIXSguh+cUJ09E291k8vSiwHY/0QfxTEK59VQ/XG20nDU48GygbgljgxQGuos/ZnwZLCOn9aAiQzPen/Ma3jGwvDSMYEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779037883; c=relaxed/simple;
	bh=VcqMAEZLIy6UepcDNfGzxEP6jYWQESkbRSqSUZivUPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9w8eAF+B7RavGPECgnNAI7fgWPKNBxV9oVbEqQASteu4/SAeLUn27LQhGGnMqgqqgSumQqCijlKAR28P0hCt+4IfXynMetkuSBIcmuywqTG1eJFdIDVdTKAan5RLx22amTVZZR10wmhOTBn0grRpKraNGwdXLl9ffQCkOdkUt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxMKUd8r; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxMKUd8r"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so1000741f8f.1
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 10:11:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779037879; cv=none;
        d=google.com; s=arc-20240605;
        b=XTB8k/5fgCzvVMN6NyOrjxbVm5DTyTnSZojKw+OFrAzLwy8EUdJaihpESzarx7XX8V
         povxwV8OqEuYO6ZiWugT8AwSldioKwSkv6qKI11sYEDq8YQApt49nRzYizGXDMcdznwA
         KJwf4eaJTMcf2wUjwsR9UUigCMupv0qCrdqYkmwB9LvQ4xlPDvgzqVAhtLnifSiiA8gQ
         w6bF5gkFbZ9kS4nf9Ejqne9iAuoHwGmyAsNlkwG7g0EKfALTjSAL444JU3D++PieXgFs
         pYMzCdnl7bCG5hdOsKS4PDIZ2pd705Uo+G+Yajm8nFrtia8Y+GyVMO11C29huN/Ibt7m
         qMXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oOk3mNqwPe7B1Ha1xIvx/x5c0FAW1KnQKPwGG0/kFNQ=;
        fh=u5AbDLLcKtiIKBejOK+dM0ROmT5k15PweQVMyZWG7jo=;
        b=XShVpzgs8zJBnpRrsGfzlAmxrDcgA7Q2ymlVyg5Dcxa9uIErlHd6ygYbRBWrzN4rZi
         w9mtFfaEkyrIGKKMyP8Z2lrvW4pVcEN/QoC8j/jPb3/CACPriiDURiAm/ZM6HwzcGxfZ
         37aCw4J8bELMaEwTnidbvlZ1kyLtxJLRy0LV3vJcMqcKM6cozEWTEtS7eJlFABKHE0Cg
         +CTgu9jWMRF9oYT9IlA2xMeiUOVvZB2DmjWfGOVEUvDSdcRs/rs+TYhqOiiob2J2igCF
         kNB+6+RsgP5xhjf7kqrlcf24e6I3c6lCT/7ia5KtvrGAfHsQEYCie0tgsR/dY25bRWTz
         5SFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779037879; x=1779642679; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oOk3mNqwPe7B1Ha1xIvx/x5c0FAW1KnQKPwGG0/kFNQ=;
        b=XxMKUd8rmMLu6gWYuWRq1Hj5nRmlz7egqhvLAFdPx//KO6cWwuqOIlW7AeAKfK8NoB
         6B3WgF4K9/uIRakD2lc1OMH8n250R1E8ejLKdLDime433G9YfhetvpnpbygPZJkx6k1Z
         8mdKmk5fIWC8YnOy8fr3GIg/6wRg5MegoZIg9QSOwhuuBJu/0GMIqCExyQEOoJrjgoMA
         aueMT0Uckj32hbCpjYI6nVIcmjeB7bGeXApux7RSC8IxkAEVUc3LOqxfoNrvioDONaqf
         U77DawZ698hWaTmtLmn+fS81IBMYlwgQATP+h10y9l2HmJ0VEfGM2sFdHTgk3CsLWbdv
         uhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779037879; x=1779642679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOk3mNqwPe7B1Ha1xIvx/x5c0FAW1KnQKPwGG0/kFNQ=;
        b=ADM7VL3Sv4WSRWslPW5BomtfQvQT59/7Z06WF67G8+OvCo+gUks8HFM42XK1tx1S8x
         G+TC+gGt/Bj4mpfo7y4UICW4nY+TA5HRsMEiLb+79C/r0h5lY0LH4D4tunggU7XQivZG
         0eGh4y/sv+vTs5Z4HdFXFLILyoGqgipLowNj2KNdl3Z04sVA/RtU5iUOKD2S6iDR3H+d
         3af77ry6Kegm634kE+fuG29cLgNfrSEKwYwvXg1fNvi4oosRaoKUWNld1whYo9zgF3xj
         wfSzSRTNWjdHxrXD04+24dZVCJ3LAycYE/IdOQ8EjlSuGdlyFOnEtJeMP4U0MizWIQRZ
         +tWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/dmBG9VhFkiaeh5a3+2glH4Dd6Mf6hjnc1sNyassD+l7qiYooUS2fVC1Qyp5F48soi6zlcrJULACaq@vger.kernel.org
X-Gm-Message-State: AOJu0YyEXrE4RMy9842XuPQj+ZJUu4U7JYGyAP7YpBTVajzNUwgXEA66
	2mG5DQJK3/BtVs3arOrHMeeW9+l5gAre/2zJTtuh0ECWUNLJ9+bargaA6/NQVE25eAo96BmSYRD
	KAdoK0IudTuzE5dRjsjHgc0GaTC3s6bM=
X-Gm-Gg: Acq92OHR5gjSVfManaCjIb2pvCRnU6V3xYVYeQcPuVkChY4rvV2jQ7DEML6DICk64BA
	YnITOky5rvPQcMh6hfDT/2b6U7UBSd4hZm/rCgQk+IDy7CV3wtm6ASHcjAjPCCZ8Wc9f1aJlXng
	ZfaWnUKFf66AZzTPggIX1WsH4tw4Jine+MyigcNZCB/cIqbGnFvUe6wCZJv8nmO17mXNjSHCYDC
	cPqn4dlAJ9/mLKYeDonhCFbLxJp0UBiYWvq5ifljZf1ktXKxjUQ6mYYeNE9wqBC0ouhXIHMz9DO
	eD9qlCikR4tIf+iE0ZRZYvgJ2FgOEa58+OvHwRkKjZwUMH9MThvBY+QzxP8Y6D5Pin1bQRmJcei
	D8HmUw1IOsByWNcY3MYJ745gQ9IlpNzW4OwuqHF5V4M+X8rJqWpThDaX9BOJc4fuuZolKeQJYmV
	wuvj4pHw==
X-Received: by 2002:a5d:5f49:0:b0:441:1e41:19c with SMTP id
 ffacd0b85a97d-45e5c5fd484mr18023529f8f.20.1779037878885; Sun, 17 May 2026
 10:11:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516-veml3328-v1-0-1d4b663e2fe3@gmail.com>
 <20260516-veml3328-v1-2-1d4b663e2fe3@gmail.com> <20260517143449.6c30b99f@jic23-huawei>
In-Reply-To: <20260517143449.6c30b99f@jic23-huawei>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sun, 17 May 2026 19:11:06 +0200
X-Gm-Features: AVHnY4LXDVs3MpxIYkHyk_Tn4lGbYKhu0alZrM9Qpom4vtzjFVIC-DUNf0PWHcI
Message-ID: <CALoEA-zpJ2B4W6N-++cBqE6fBLsd08D4j+Rozgpt+1=NBAga0g@mail.gmail.com>
Subject: Re: [PATCH 2/2] iio: light: veml3328: add support for new device
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 17 May 2026 at 15:34, Jonathan Cameron <jic23@kernel.org> wrote:
> > +static int veml3328_write_raw(struct iio_dev *indio_dev,
> > +                           struct iio_chan_spec const *chan,
> > +                           int val, int val2, long mask)
> > +{
> > +     struct veml3328_data *data = iio_priv(indio_dev);
> > +     struct regmap *regmap = data->regmap;
> > +     int ret;
> > +     int i;
> > +
> > +     guard(mutex)(&data->lock);
> > +
> > +     ret = pm_runtime_resume_and_get(data->dev);
>
> PM_RUNTIME_ACQUIRE_AUTOSUSPEND() will mean you can rely on this
> being auto suspended on exiting scope.  Will allow early returns
> and get rid of your goto that you noted already.

Sorry if this is a silly request, however I can't seem to understand how the
macro mentioned above works... Could someone point me to documentation
on it or a functioning example in a driver? I tried analyzing this
with AI as well
and it keeps going in circles that the macro does not exist :(

-- 
Kind regards

CJD

Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2D34582EA
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786698503; cv=pass; b=DUS22pwQOETx/nB9Pv3Wb0UShAvm2xg2B8n1l3RMdZ9iaxxUe6zif4DEdTTj2khBx9HLHSWbiqY19lfdLx6pFke+VB28C20gxwUYOiXjDJrYkdSzi9lh+ONSlIeXnrL12EskQt/ExxkHTx4tnmQ1PJK0DnZhglIFxSbmwxJGtTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786698503; c=relaxed/simple;
	bh=HYuWGT9uBk6DYJSNsZ7JcYY7syMooP0ymWSP1i7eR5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SaNHNp9v844s+dhkn/c6UTrsbJimA8uJrCoJaaFM0C7r9htVLD+vb1WuWzFDYFnGlMNuDfxHJVXLTHnwOShpkXvkVDti7CK4l3hGtjRkHl8tjPXIEgXsEZHGe40qrnSFU3HdC7EyIH5pwU2m0hfedwzQnHnbpAJgpfRueJwIRx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwA2gp9m; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwA2gp9m"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66b32bb75beso1204041d50.2
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 02:08:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786698500; cv=none;
        d=google.com; s=arc-20260327;
        b=dQ7iTgW4bYx93xwMgAui5paTvCR2dYP9Na3yaB1I40KpfHiOx3ySej352Uajd/Ep8H
         7gAJUO2ZknCDJYbCKESHodp9ZySoBihhYgVpPrxU16BY5GwrkdcaBkN49Rof07nTERxN
         FPLIdLxS+H9/6/giLzpyCX0b/4PIiXCJjxI5ewsCTjYVorAlFl/WA+f3ENR7s7gCQJ50
         hcL5RkYnOj90DyImsIaj2bwvPOUmkxuHi3jbj+GDn9BznC5jLB+ADjkZXCATa1jZAUiO
         ecHNwLTeIW7uN4MXYgM6hYkBf1QR9ELZoDbAbN7yJIA2l5gSzVRLQoJ/X3TrnFIBvdcB
         5ZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HYuWGT9uBk6DYJSNsZ7JcYY7syMooP0ymWSP1i7eR5w=;
        fh=Nw9iHe0Tx8iogKNLCXpYRuHSidZ5AtilQdCwNKKyOQw=;
        b=bh5YgDaFVNaBIkKTPvXspSRVTbcnLtlCpVS1MV8mlH/xS1XA/kuLTK5N0JU5c9FX5O
         +mNoaHdVX7k3QFehXKvveXLTLvQwkFnh+xmpWY3kt6R9+WofBR0AMSo+L8dpQ4LbAbWr
         erEBL5nQgHrxbP8f8jI1xhhzxeDgtfgf4rOPqTD5C75S7akW67k5uariMZDS2idG4b8n
         DOvu2OfCcg1luaCWdmuPMZF5M1xxEi0eKCQbgjNzW5xtuYZEx6hF8I9jOp5bH/jVDfbX
         EtRocYqiAqyrwKrJfmrneB5p/YEOFsBwAGqKKGdIN8LMF6BaRIL5Lg/2qY9VXnrKXv7U
         IQrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786698500; x=1787303300; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HYuWGT9uBk6DYJSNsZ7JcYY7syMooP0ymWSP1i7eR5w=;
        b=HwA2gp9mIBUqDAocA0WAZa7eXnQq5Dm9bOFyTOg78u/hsSWb8B8YdvO5+2mhzoGarx
         e+M2IxLQSTFenwfrmx3CeQ5E0WnJfjA/YcEoIMGMCw21qBxlPzTd6F2KxDBO8B2BKIAN
         /4osf6Yx2wnNuDUkN8FrB6BHorUpupZXqobE5kuvBC4I1F/CewJpO2cKEnGNyU87w8X9
         CyWHazcmy+ULaJuw+d5A+eH17uUs3j9NZ0LIvTRJJLb5r+w/B9w/5Zta7tzEOEwyiOWy
         OcuAd63cqIUo5UK0MHch4CQTItRHqiINNG7sG2/c8zv+PtQe/LKUf5Q/ttGRRF1P+Fm2
         Nm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786698500; x=1787303300;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HYuWGT9uBk6DYJSNsZ7JcYY7syMooP0ymWSP1i7eR5w=;
        b=C6nyXjkHunumk3cM6lwlGW1chkyIVXtwreVwYGtMgxGBWrffKx5fIKfsRwI1VtBWb/
         JKNOkugDuIxrlSzzVDi6tfuJ8u9F+EvPDAtb2QWLkApbq4pPMBtrEtp/Gy7EtTyokmTy
         y/yS7+RWSYtlNOHvNWmex1JVxiT0isEMR8Tf5lEPMAxr9aSSuLa81TlbWBqiOiYjyuyI
         MlFFbBvYbHJ6JSDj0nAwaKZNcRoUN9nkFRExU2bLrQQtG8tM1mcU8ldDdJ4iqMCHN01o
         UjWbAzi2IM9cs4gaKrqyvWa2QILKcIR5RVqnLYgQv5T7ky0rM+GR0bs9GTlCahoSYNpV
         Eblw==
X-Forwarded-Encrypted: i=1; AHgh+RqHu9ETSlmfsFsYVi/8jsr+j1ZyqWL/sk0pKSIXXoCY4tiHQ8iy+ZOCkyVhVs0dDtTCLpWkZ0tS21AG@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq+++X+JJxHmzoGUr9DB4muhuibohX3KW9fjcD9EoqXcYH0uB+
	XkkvWhAqppZ13yYzYf5fPkTyTg4j9rE4bepxMf8s+QuSsxLU3XP/tp7SgK4JDE2h/8OZUjCuwu9
	QulWfidfazCRM+Btz1ZpSCedRuQhwz3s=
X-Gm-Gg: AR+sD11XxJYqOjJ/H97U6fG32XO4CeqRlM/eWM8CUkS0i9lmIyq8zcfx7SUkC7gD6rQ
	nUHjcr/y3qVarh8vDPRnaVU5VP8IpszjU7TOINherwQxEMIZVhsJlk9CxtXDV0m4TltpW+L+WH6
	0Y/l9Sd/uvOm6GvNkwE/dXWSU2KBwKc2nGooWu+Umpt9HanLHwH1VSb/Pxge5DKbo9KWNyskHED
	vunMgUSqZPRmDyc8pAymKkp4C36p0DBguCKEA59J1+v6lR61nzDFeWabDKve8RlGzZId3xhEdSQ
	WApBn6YfnmtEqc+8v+augx7oTznsjF+2hFnBiQhUSFKO+RyktoIS4uTt9xIRrGjFvv/IlWIREMX
	UYXaM+Q==
X-Received: by 2002:a05:690e:47:b0:668:99c8:bf15 with SMTP id
 956f58d0204a3-66c72b054d2mr1376716d50.11.1786698500469; Fri, 14 Aug 2026
 02:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624055648.127399-1-challauday369@gmail.com>
 <178406687202.3036881.4468660016404184803.robh@kernel.org>
 <CAAj-GBnn8rGD6o5HmVfYtEksXsL8ZPKcc_AbfKUEHtTsN1pN-A@mail.gmail.com> <20260813191817.GA1981719-robh@kernel.org>
In-Reply-To: <20260813191817.GA1981719-robh@kernel.org>
From: Uday Kiran <challauday369@gmail.com>
Date: Fri, 14 Aug 2026 14:38:07 +0530
X-Gm-Features: AUfX_mysdJZURZMpWD2u5czIFjSBNKyPyqpb58_YjGlV5lTuJ2_g3vYfefsKrMY
Message-ID: <CAAj-GBm7GcbyB-A7R9aomVCxhbh7d8D7tUxO3qCMYZV8d2N=Xw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: watchdog: microchip,pic32mzda-wdt:
 Convert to DT schema
To: Rob Herring <robh@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	skhan@linuxfoundation.org, tsbogend@alpha.franken.de, krzk+dt@kernel.org, 
	linux-kernel@vger.kernel.org, conor+dt@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, me@brighamcampbell.com
Content-Type: text/plain; charset="UTF-8"

> > >
> > > Applied, thanks!
> > >
> >
> > Thank you, Rob. There are similar microchip, pic32mzda patches related to spi,
> > sqi & rtc which are reviewed/acknowledged.
>
> I picked up watchdog only because watchdog DT patches have a tendency to
> get missed.

Understood Rob. Thank you very much for picking up the patches.

>
> > 1. microchip,pic32mzda-spi.yaml
> > https://lore.kernel.org/all/20260622-ingenious-finch-of-fantasy-7bafaf@quoll/
> >
> > 2. microchip,pic32mzda-sqi.yaml
> > https://lore.kernel.org/all/20260625-omen-stark-6bb827ebcc43@spud/
>
> You missed sending to linux-spi and/or Mark B on these. You'll need to
> send another version.

Sorry, I missed to include SPI subsystem maintainers. I will include and send
updated patches.

>
> >
> > 3. microchip,pic32mzda-rtc.yaml
> > https://lore.kernel.org/all/20260703-identify-cringe-ef88079923cd@spud/
>
> You missed Alexandre.

Alexandre Belloni <alexandre.belloni@bootlin.com> is in the send list. Not
sure why it is not picked up.

Regards,
Udaya Kiran Challa

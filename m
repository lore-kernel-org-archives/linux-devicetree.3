Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9803E63B2
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 13:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778248671; cv=none; b=T5VXASAr1StI8Ih1q3+0uF5E9E5A+DeBtwuS5JCG8TCCOhQ1MNuFfTqNwFVIhwk/OREhCZo63Kut5LDDxhS4bZFqnxDL7wVq1Ek7nGeI2LS0yh1wBc7OivW7E738CX6yWFLDsxuAHCfdKaCDRV7uNaU0S8CoVVLI8O689rqCP+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778248671; c=relaxed/simple;
	bh=jm8S5eHYmLUlHSlinkOSY2lIF9Dc6wGjPC5ZNBOT+BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BueOhlREa5MFD2a5e07gMyzcusN5GfB2fhYuaYNNkOUv2lTgKsFqtvUybDfyMse5VkkiZ/ljnj9lwl7POUKxO4j4LXBFwooQ2F1pkG/ue/PoDhD5duriW/STBBRLUOv9PfXe7isiaF276TqyCas0/zh+kFm9EZApDCwCblghr7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uwsyz8xS; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uwsyz8xS"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c15849aa2cso2586770eec.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 06:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778248668; x=1778853468; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mvH1zlruzUaAUBZaKhp6+2gmZc2N+rNmWQijZPZfi+c=;
        b=Uwsyz8xSnuoHXlg5P3pv6e6TNKsUnvCu5TH3gtDL14Z+d0B058+EUjF1kns/KNL56l
         VFpauuGZH+BXuFnd+hN/Uhx1vhd1+gPl9TKajmGaX3XEmCrAwHxJ536tjZKcFYfVut6V
         yGXhAAfAYeeyRSUjLDSwBjxTkX+kOpUFxcxXY/e43Y43AKNpKaJv2td/AmryDfHfSKfm
         l/h5WeKu2TeCDDE5trhESIwWVAucN5TZalWACU2YXhT2KLU6DITEA1XXC4Ug9I9pvVum
         1OujkT6fHmJGNwd2TE+kannqAzOEHRnvH0Lb+yL9XnSDcv5ve8IFQPZqK9FnTLWr0k0x
         cDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778248668; x=1778853468;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mvH1zlruzUaAUBZaKhp6+2gmZc2N+rNmWQijZPZfi+c=;
        b=UT8tYVZe3Fg/ZrXUB43ni1DpUbyOXAtru2S4ofNaYaQNVeNK6HcyoLK54TpFHFS1mg
         iBILKL6HIO5aUcWcXCnFT+cTni3DAWWSsnjZmd0L/pKPZtha9nMGRjRV1h/YiWJRSBPH
         kTKwB3D1WFmyYwRyvevHpVpOI4wg6z1C0jVdMyBCDfCU7SeKWU78WWk49dFOFd2bPbnX
         aCWMogybUQuYCxZHRqMP9Sn21wnT5OljujbaxIY3RVUR+ot5q2M5hCs9En8PYatMqPLq
         5vU0VIm66cbhvsnTK7cISkUWQkuy2E0I/NPlpmDu7caKC+9aJo89Khf8Hvp0x2GCpGCv
         +Xog==
X-Forwarded-Encrypted: i=1; AFNElJ8Ju/CEmycVLA08Fjag8NncfWBGElFyw7mX1I6QkIxS8rNQAso52i3JBQztE0cGiMOKgKPDAvtAxaah@vger.kernel.org
X-Gm-Message-State: AOJu0YwJMfWhlsXN9UWifnDU9eD/HhwmhuHvF32sTiexlTzmXUhdGB/j
	UNoGcq6WgKq7i27vJ3bkiaaeiodKaPs9UBnUmtGfuzNVTIUn+Q1gR6eA
X-Gm-Gg: Acq92OHv1SQyons76Khrcs7A3Z52CotU+MLYB6cCs4EgLha52vXjOFSL8+ysSL+l49h
	ZGdzfkgYxyFYkmEnFWQYgpq4YBTEzxhvLud6CIO74OnmLXWPD/okQk/TYw6EGcSpymqH9N/9hMK
	MngO6w2d3KX1nRS3BbW3a+ZRdHy59J2OhMLwExJLwkPJ18yWZlc1yD9RG/cajuBCpBuT5ZADAAC
	SFu1Wa0pE+b6Z5vGe3zSF0vFTUVI6y9Sfdx6ic1PDvIcumvzHr2iPS01nKvcvKd2ooF16H6ZCzy
	OwVSkCk1i64+si1UK/D9paa0TL9CSI+ha4nTcq3IM9r9MnK+itiIyCAI2DUTlR/tbgaXfrCjBtd
	t97eH/0Qh/1mRFNcQcEuaBeOtulm1o7ajYfYuYszt6YVmObiwDyjojrtykqcRN+YZK1Qfemb1K5
	yb84LYKZweEzuMtyrWd1YTffZjulvZxOWF0NV2vFPfS99SciQzqvOETC6a3sQEDu9aXgcuZUlW0
	88=
X-Received: by 2002:a05:7300:ec08:b0:2ea:c085:44b1 with SMTP id 5a478bee46e88-2f549f838d8mr5657827eec.19.1778248668002;
        Fri, 08 May 2026 06:57:48 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:852e:ebf3:8de1:32e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88847502fsm2577588eec.14.2026.05.08.06.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:57:47 -0700 (PDT)
Date: Fri, 8 May 2026 06:57:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] Input: isa1200 - new driver for Imagis ISA1200
Message-ID: <af3rZcrPDtNxM8A-@google.com>
References: <20260507133948.75704-1-clamor95@gmail.com>
 <20260507133948.75704-3-clamor95@gmail.com>
 <afzJUcvQth6v9KGC@google.com>
 <CAPVz0n1wYMsLLzbQ=4HLT1+Cx8GoxY+n9Q0cJ=dYv9bF=piOVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n1wYMsLLzbQ=4HLT1+Cx8GoxY+n9Q0cJ=dYv9bF=piOVg@mail.gmail.com>

On Fri, May 08, 2026 at 02:13:43PM +0300, Svyatoslav Ryhel wrote:
> чт, 7 трав. 2026 р. о 22:26 Dmitry Torokhov <dmitry.torokhov@gmail.com> пише:
> >
> > Hi Svyatoslav,
> >
> > On Thu, May 07, 2026 at 04:39:48PM +0300, Svyatoslav Ryhel wrote:

...

> > > +}
> > > +
> > > +static int isa1200_suspend(struct device *dev)
> > > +{
> > > +     struct isa1200 *isa = dev_get_drvdata(dev);
> > > +
> > > +     cancel_work_sync(&isa->play_work);
> >
> > Move it under input_device_enabled().
> >
> > > +
> > > +     guard(mutex)(&isa->input->mutex);
> > > +
> 
> Should I remove mutex locking from both PM functions?

No, you should remove it from isa1200_play_work().

Thanks.

-- 
Dmitry

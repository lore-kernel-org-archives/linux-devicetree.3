Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D77B3F0A9E
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113934; cv=pass; b=swRtp6Jzdn2LtcdV8QZizbSIUBPNYkgjqxy79JGe2JtayNL56EPaAndaIYlOvhzLMiZjNialc/5KCGU+vDc1whO9txWgJ4RNyTKFsZ0kmnPEHxZ10iXvPp0IzqE/CHEbTF0ZTkMRKBb9y/M0u/3uIysywrTzH1FqX6k2TxU6dNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113934; c=relaxed/simple;
	bh=xuow7G3f6BZxe2u9mbDa9GR+btG5Vz+B4t18943dAXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DfYo1hAbpQr9EuKQH0v5EI6gYT9sY0yl59d6746nfyFi/tRluQH/FvhgcbnYcZGyllufk//a9WlQRA/Vf7QZ7x5bpkjzdlYTppyWIek/u59laRQkWen/VbjcwlTMYtnfSo4jQkJUy6VBeplCDHlp1QJTZduhNXQtz2h7kdlh1M4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MVaj2VIY; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVaj2VIY"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45297094718so1829377f8f.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779113929; cv=none;
        d=google.com; s=arc-20240605;
        b=iuVUt+pTBU9reRIVXTEIzYXv08XM2VJVCdQflSJMKsq8GpVIOlQOYtAwYl7njTs/5d
         hAvyvqKazoI11SMYS8m0iCpy+Rcldz3NXhDagT2t8XQYmiSUejOruIDQPSURurY7nVG1
         ZgiHM87GZXDJ1PDNQi+n4UXksDY6G9CX9y6Qdy/hf4PgcupaCpXOatlkFkeJtBngC2Au
         E6AsvWcYUTBOBSQemNV2I1IDXA0/qvRmKXyaqXWtnx91tKlsi8u50hB5fFI3qdiLOk0p
         nFQmCHaJVMrwvo6omk9EdAuJ96bb2AlkRIsZvFnVpaXrrrmj1BqjlJWpJEPKMPW8zPAd
         GPCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iMFAIkVwK5eQG96dgwCv58Stxk1/depDhaUJOjOWwdk=;
        fh=LETm88QEYVlQ92k9Al9Q/yfadtmaUtCo4uFLgC+wD74=;
        b=MfkdIQhKBwNxhcgRhf4XVhmZceDVfocyiTpzURM4yKALlmT0fJ+LlArxc3c/Ys94e8
         2EBkj1SwstVzx2ZdM8SJSeERSFQ5k093xmb5L726do5PHpaFgMCelFR2qwIlZDscAbuv
         ykVpNv8+KN4CnvikLu/xHL5veQJiDt8C//d3rzVaEGZjeuxtM1hasY6WnNHNg6AkrQc0
         ntJMtp76/3Et51A7i4eQwZStuVAC0+ya6zHpg/E9iCs6HvkswDKyOS4d3oyv9OpWugzT
         rXL2Zuh0HNH8sm7MSYeaijkb7fNTI+G4lLlQd4Q7y7qZ0TBE9r+3Bodp2rVAl+6Q92QM
         dK/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779113929; x=1779718729; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iMFAIkVwK5eQG96dgwCv58Stxk1/depDhaUJOjOWwdk=;
        b=MVaj2VIYZhzi5MOo7Cl712ncRu9OfWvaumvGJBDxuytEXdWe4MHcXymqKDB5OCPRgv
         z6ERk1s87gHRyW3nmB9sGEVXX1sKShwyE6Bkbvq9CWkE6a7Nul+RU0id8gwLiifl10jo
         8gBBXQL3rCW3HZvSjD0q0sorZIzxdweiTdk+9JD0+5dytll5eGLNHqRbM6faFVplXl/a
         5W4jiiiWT9odvowmOqlm82ksFi69/HyQbco9tCWMj1Wds0aKfsgeAImgyV9vGLLAtSHg
         kOUoLL8InYYGrISOWqV/LghkgU9fQMTyACjoq/FaD2fWII3b64lMmVTk2FbNQajviJRV
         BdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779113929; x=1779718729;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMFAIkVwK5eQG96dgwCv58Stxk1/depDhaUJOjOWwdk=;
        b=e35R7Fg74saR4tfpD2mYxT8qC1fA7SQwOSggd7joeOOABs1wP/kGjAxf6LBCoah8Gy
         jtopZ9aC3z0pBz3lYeQaF1NRqStBi0F9YQ1TpqWZdwOx1oxPUEPgSdEWq3qdpTAX+jMu
         cCEgXs3MxjwMa3TGI2rRj1JBT6GcrRaf8iecCALvRuh7OiynL26DCSBYxunkQzxmL3hj
         b/IumA8+TMYAEX8EKtFQRKh9/QyLXXtAl5HigBAFzt14n7vEJhPiVlsDj+anDID43gGE
         fOFMITnYNNiVXlmn0iKU1UOTTRPvFKiAKtMRxQ1dhfNkS0sfDabYpODJGU5LPRP/c2uY
         /FSA==
X-Forwarded-Encrypted: i=1; AFNElJ/O6PTCyBkitiF3rXjYAd4dN3VQituxia8t+ej0jLnkPHMUKifO69WvTCKH/13L2t3yFQ2davlU8pB5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx33ZyvWJqQFz/2atIXkI0nfaDnvqcZCxTRiRlF1L9I6DRU+Z1e
	+Z65wUOVl9luIZDN3MEQ+KNZrcDdTJsPU1tzUwvOgOVwH1CjSZdlYHpjOg/kjzvJzV2Ir4zhrw/
	3SYs+JaCYQRi6YTCTtM1l/bNS4c+Ozp0=
X-Gm-Gg: Acq92OFEsbvonE3mBDbZ5VQfAP6b/dGqoxlL4fgT0DGzLo5Qxoa+JllAapFfxMMm7p+
	bIx/tjfgvYmK1aTQpzyXY0oPAivDIRjK5zG1TsCCd+V7syPk/yF/Xx26HYAFep8zp0cFaOJpqwv
	uV0lqOw+bbvwewmwMaRAFyfmYsFPEH1187/ONDMrABxDubgQZ6um/jZN8JY8jjXuPGo5MxOeMXi
	ZneoCzYOmjvKfcD9isTiyJXN8Kg/Ipw7ypoC2sAUeV8I8QUyKxOlN6/2rBghlSzwNjiQ5nyZtmk
	S9VW8slmN6p74k/P8EFm7XLAO/pfDw5Rm8SaC1ENk2p91nJzC46tJpxnYKan/bXf77DznlAkmzd
	U6vrDDT6Ur2uOJ/IaYQYqppf7NlZV4ha5PGAOLOG9eYh1UIbXd3V6kPt5F1MNQJTp2zOmHI153w
	JgAHuMRaVGxdHf1W9K
X-Received: by 2002:a05:6000:2f83:b0:43b:3d02:7806 with SMTP id
 ffacd0b85a97d-45e5c58ed80mr25602693f8f.28.1779113929216; Mon, 18 May 2026
 07:18:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516-veml3328-v1-0-1d4b663e2fe3@gmail.com>
 <20260516-veml3328-v1-1-1d4b663e2fe3@gmail.com> <20260517141054.3981672c@jic23-huawei>
 <CALoEA-yk9dJFx=pjjm-=UmTi6Wzx1crLswFfGC2QtPMCP2834Q@mail.gmail.com>
In-Reply-To: <CALoEA-yk9dJFx=pjjm-=UmTi6Wzx1crLswFfGC2QtPMCP2834Q@mail.gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 18 May 2026 16:18:37 +0200
X-Gm-Features: AVHnY4KtdgYmA2UL_w_pGgUt2FELICyPTAO87MrpbTWGkY8mAyGUbt4TtvHM1hU
Message-ID: <CALoEA-wrMkqvqDVPDUSbVSQNF56CB3R84Ch5=nX+8aJqmYxDhw@mail.gmail.com>
Subject: Re: [PATCH 1/2] iio: light: veml3328: add devicetree binding for new sensor
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 17 May 2026 at 16:26, Joshua Crofts <joshua.crofts1@gmail.com> wrote:
>
> On Sun, 17 May 2026 at 15:11, Jonathan Cameron <jic23@kernel.org> wrote:
> >
> > On Sat, 16 May 2026 23:50:53 +0200
> > Joshua Crofts <joshua.crofts1@gmail.com> wrote:
> >
> > > Add devicetree binding for the Vishay VEML3328 RGB/IR light sensor
> > > connected via I2C (SMBus compatible).
> > >
> > > Additionally, add an entry in MAINTAINERS.
> > >
> > > Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> >
> > This is very standard looking. Have you considered if any similar
> > bindings can be easily extended to cover this device?
> >
> > Note that there is no direct relationship between bindings and
> > drivers, there are single bindings with multiple associated drivers
> > and multiple bindings covered by a single driver.
> > Also dt-bindings get used in multiple projects and some of those
> > will do different splits in what code covers what parts.
>
> Hmm, now that I think about it, the VEML6030 binding could be easily
> extended to support this device - oh well, should've checked earlier
> and it would've saved me a headache.

Before I forget, any idea if I should add an F: reference in the MAINTAINERS
file if I'm just expanding an existing .yaml file? Given I'm not the maintainer
of it, I'd expect to just have a reference to the actual driver file and not the
binding.

Thanks.

-- 
Kind regards

CJD

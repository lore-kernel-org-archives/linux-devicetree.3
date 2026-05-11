Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731FC3BE147
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778537103; cv=none; b=JmSRvmkv4sQg4SrUH5iM7igGVjhy4YAbkLSHckg2pxZtwfnbAYc3NFfi6lJNU2gG15+DLLQYk2YifIu0Ir750g9nxBA9ku9HQXk2JYBru7mtyGt1Gyf3MSkvpSqOLyR/+wF13s3OWoDOoj0ZlfQUHNQqJAOO4zu/8gjmV+7jv/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778537103; c=relaxed/simple;
	bh=CIAqLMPPvoM4e+OnpQX7C3aTrPFyWScfWmBqyOx9pzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJhXM4PnkxObXLRZcHOdV0ABSIZ3PytM1vsSmoCiA17ifisTbh7IRD0sWlYfEk/GAfKPSebbwDzE6RunKd2LvTfuVvtiDBHVp6aogM6J2+uSk4xQjGjgbfzaPvbjYjSHS76kWtX3QaHy++FJeCpTMnhyd2R64Ctso62wiaDjL70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXmNjSjl; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXmNjSjl"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3660b84347dso2983527a91.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 15:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778537102; x=1779141902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TwJIirVuKqVtnnrvOqanwGLH5bXkSp5/1F2o6q3Zsnw=;
        b=kXmNjSjlWLrmBtWjmPmvzoihmIJqJgSMX78uD22/VL3H3nbSsPoQoF/FbKTnUgbA9+
         juJoj4FEnivEpFw1ICDqYUf9AfqVbsCB+UOPpidNmeTdaVw2UJmoisjiMY0xrM8F3D0O
         EzyIdzrdSZY6i1eZYkh8ge/gEwSBFdXedu0VluuKPuEtPY/RGv+QpRrmKGov6VBXE1to
         ST++dFmlM5JIvZEcSy3aC8XUxmUC0qx2f0QdudhDRWJ8BnltWGuGjfAoS8QN0Vkc/Www
         tdvck8BLlZSJsQ8Z2wTxt+xfA7vwyD0b1I5G5xevswuP77QCmIyYrAkAtCIcZOZlyItv
         lDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778537102; x=1779141902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwJIirVuKqVtnnrvOqanwGLH5bXkSp5/1F2o6q3Zsnw=;
        b=ASpRXrIslg7N0mHHC+44711n26oWzcqi14dyKiDDeniD9i3OYOuqll2i3I+p+ZaBP3
         Yvhq+EjwIv2wMj/LtnVY/NEECsmbEfaijPsuDdH1P6X9ii48xKqLrWNi6QnP7zBAgiVa
         Sa5fZQgBb3zQJ6Zy2iG9W929nglLmjYi1m6Z8c/zgMJ+PzDFIO+FEbjJVPltKa3R66wC
         J9TFGib5pam0HZZHVu0+h74Dr46KoffAvAd3S6P+900IZwhN2PXmmbcC8OSaUmJr2Uq/
         NooOkuQGx8E0dMO5DUq6CLhqFPnEUegk43/LlhBzHj49otgEoyZqhvlg44IRqIMGWHHH
         fBrg==
X-Forwarded-Encrypted: i=1; AFNElJ/fXypT5Y0L/AZOt/+asvtXb/7pcprVcrs+GsdEVWCmSXYACDKBTDe4EZ+/vGv1uKr8Xp2WDR0gsbzE@vger.kernel.org
X-Gm-Message-State: AOJu0YxlND/vKqWgdTH0PYe0rGXbPgNqIww381I3YlGxc3hgTLYGkwmX
	nBF9pruoYOlibrL0im6mM7K9H0S/BU4g/YAg2ycZ66e8TwczR0tfE8Dk
X-Gm-Gg: Acq92OH1zXQPP1PYIipNLc+hJgdEZUe1ouXOLYqEvNGfxJKpMDhWrKKME8tRQOc3wQc
	gUzQ24xgUjGMT2OdSCm653skiB3lx6TMT7Jkc6CCx8FRUY5tYFl6u26NvHf5qPWXA5EXAY8HfuT
	cEGLEbUR2uE2IoWFRHL0dg01mCdWcKgdB/Em6IUj13YXhKvKzABziatDXP3GmeYrokrC+HVZsNw
	xBkHjKfxeIogl30Sp4W53XWmIubA1nsWzFoJ6GICYFxDS9CbqT1/aq4xFM/XZ7mIRQ8r0Bc0xOB
	hpIwQCsRvdKdxqqJ2nGEKv3GugTTbt8HtnLW7YfsNrN284qiprBoWHfVd7oSlMOJ1otBSdMqLG2
	8YwTdRYL0E1LH03OvCAPPBgL4NQ9V2rIPFRkpvmbgHwQSpXr+W8Jt50yO64s8X3E6OP0E1O0VuU
	7ULE0Tkydf4acAIpak6S0eYRU=
X-Received: by 2002:a17:90b:3d8a:b0:364:a173:2d61 with SMTP id 98e67ed59e1d1-368b2511be6mr449645a91.11.1778537101695;
        Mon, 11 May 2026 15:05:01 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c826771c6ddsm9907259a12.23.2026.05.11.15.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:05:01 -0700 (PDT)
Date: Tue, 12 May 2026 06:04:36 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Longbin Li <looong.bin@gmail.com>, Yixun Lan <dlan@kernel.org>, 
	"Anton D. Stavinskii" <stavinsky@gmail.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: dma: snps,dw-axi-dmac: Add fallback
 compatible for CV1800B
Message-ID: <agJSPkA88GcTYS86@inochi.infowork>
References: <20260511063818.463877-1-inochiama@gmail.com>
 <20260511063818.463877-2-inochiama@gmail.com>
 <20260511-crave-sworn-3b43371ce11a@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-crave-sworn-3b43371ce11a@spud>

On Mon, May 11, 2026 at 05:01:01PM +0100, Conor Dooley wrote:
> On Mon, May 11, 2026 at 02:38:16PM +0800, Inochi Amaoto wrote:
> > The previous version of the binding change only add compatible
> > string without adding the fallback compatible, this breaks
> > backward compatibility. Add the needed fallback compatible to
> > fix this.
> 
> I don't understand how adding a specific comaptible affected backwards
> compatibility. Did the dts originally use the snps compatible before the
> device specific one was added?
> 

Yes, the device is already in DTS, and since I find an quirk for
it. A new compatible with fallback is necessary.

Regards,
Inochi

> > 
> > Fixes: be3e2a0419c6 ("dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> > index 804514732dbe..0a30a455b0ee 100644
> > --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> > +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> > @@ -21,11 +21,12 @@ properties:
> >        - enum:
> >            - snps,axi-dma-1.01a
> >            - intel,kmb-axi-dma
> > -          - sophgo,cv1800b-axi-dma
> >            - starfive,jh7110-axi-dma
> >            - starfive,jh8100-axi-dma
> >        - items:
> > -          - const: altr,agilex5-axi-dma
> > +          - enum:
> > +              - altr,agilex5-axi-dma
> > +              - sophgo,cv1800b-axi-dma
> >            - const: snps,axi-dma-1.01a
> >  
> >    reg:
> > -- 
> > 2.54.0
> > 



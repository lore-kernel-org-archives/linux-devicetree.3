Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC3F3CC7EF
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 14:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784385159; cv=none; b=ED8CGnxwab2YG9gmzqWfuI2G4zuPYywtE01id8/Z6xT4gCw5pY61kYrpQhT9E04obuLFjCv9/XBIkVXGy1Ks9TchC2IfpOEaT8V0gBMxk5nu0Ifh7LstAn2E9YE+qmOnHQw2JO6MKIIIQyB++p5BpbedNS3IUABNgNXQ7yfqT7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784385159; c=relaxed/simple;
	bh=qT89Wi3RAN9CgJ0A7GdoQ7adS5M+Uxt5TfxmdTXEZ+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swspC4Y9mRBIcstQpjJt7nxupkqoj/azQrlGftjAiH5pZtddXMVrH+Y7sHetkeNik6WA8azzI388jG0A6dmYMJf95/786Ib8+3KWhVrGBI3gjnONixYjYwAuPwdCB2w1DJK11OEHAbsQiJY9ginQ82IUCAZhmm19zUCqisby0RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Sagd4BG+; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Sagd4BG+"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e622cc874so643209285a.0
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 07:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784385154; x=1784989954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qT89Wi3RAN9CgJ0A7GdoQ7adS5M+Uxt5TfxmdTXEZ+Q=;
        b=Sagd4BG+iDuB7VIM0ibTD9d9fZoRv8htP11S1+sYfLu2zkycWEfEgdzfmyEAfrt3p3
         /k8Q6Ly/wnIuKWPdPS06tJrHkm2cV0hIgByBWt3A87DudI4W5g1Zb0qbPMntxl1KeNwQ
         K45c6AYsyJCaQdSwr0DEnMYS7QZxFjGJMk9+EhnfyIXOVEI0c05lgv+W7go4zIpAheeu
         TE1mFdgtA+Pbd4Zq3DGGEnM4+O2CysrxBJeD65wTY/ZLaXCQPA6Aw754xr6lmXyhxIJ6
         5D1OWHNB6hjNl2TiQK98JlsYxkJSBYnYv1ILgPrAAqYi1+zUNBubu4IowrWA3cWiWswN
         wclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784385154; x=1784989954;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qT89Wi3RAN9CgJ0A7GdoQ7adS5M+Uxt5TfxmdTXEZ+Q=;
        b=ZBsdByXaQB5U20dXfp7xV3p7ZHC37weylulY1W8/1AmjGu+uddtEV4YPgnLjhMXdsP
         ua6iKC67r+Qo9zmeMIeSyHkFkItXL0TejN0+QFJrpXWbptQGAlt3Nql8eb6yE9fdSAkS
         xrxcGqkKcdnNsV82p52gqM5TZbGhreQ6oyAP5vzj4vSgktGxIBUD0YbgVQUhm/q36d1y
         dM67SQf8+n8BhYVjp61yNJ4I13no5s4rp0wh1ZZ1lvAwNp3YtazdikqopQzD6RCX11Is
         Qst4zeXY8Ulh5UWVCfrfY2VYBERH6OMA6mcBGQ4HoewcvIB6HIXo1Vdpfj0DnpOGzRGE
         TRHQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNJ9VyHa2XoENIIx/QdmUClkAVBqTLeBQQxvYB3JKxMUxIVqDZakdwCButsbtfBTYY8nLNJm+9oYui@vger.kernel.org
X-Gm-Message-State: AOJu0YzFNB6118/APRGtJD5PyDHN5xFubpr9n4IHov3udCLz9LmlZxBz
	dpwL0ZCo6qJYsqOezbeiRAl8AmV3n7pP3yL6vBAbRCUTVy9RDIaU1wbxWYDqJK55wYI=
X-Gm-Gg: AfdE7cm6MTVQzFrPuSegZBkc2ISUe4Uss5d+3ToCpK6eee3CIbLNlPT4nl69mUMe1eF
	5+jev7Vt0ooyn7ddz6/3e1XwSlZqT/koMCizaLnkMhxtYSGjCrhMqkG26L5etTpXvftIDE86VlH
	5NwSHxykvQ98lIuB62Cdgdr4mFW70SZg7hSBmWaBKhR9qkRijSWSEmfluOfNTszm9OkSdlH2cYY
	Rff8Gn/+WuZI1bFxlzXwXE5dXY9SE8zEPU+eZeu+D9ML186B6RLk2CQbQlloQmGSNAnPJ66/VZu
	nWZgsNFP+SGiiwwT68A+UxIxrwKcq698/BoTYtgDuOg1AD+240XA8jn/q4ypdIrsST3uENUC9cH
	mZZucmE8tukikODGPZVUVimyzpX7D/puMNuGsqa1IGHBxtF4dv8J22DhVJKNz
X-Received: by 2002:a05:620a:4706:b0:915:6a2b:6265 with SMTP id af79cd13be357-930b41e282amr722435385a.44.1784385154410;
        Sat, 18 Jul 2026 07:32:34 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b542d1e5sm425204385a.23.2026.07.18.07.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 07:32:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wl65h-00000006T6V-0EUE;
	Sat, 18 Jul 2026 11:32:33 -0300
Date: Sat, 18 Jul 2026 11:32:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Drake <dan@reactivated.net>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	nick.hollinghurst@raspberrypi.com
Subject: Re: [PATCH 5/6] iommu: Add Broadcom BCM2712 IOMMU driver
Message-ID: <20260718143233.GE701389@ziepe.ca>
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
 <20260712-bcm2712-iommu-submit-v1-5-80e10cdde2ea@reactivated.net>
 <20260712221125.GD1835788@ziepe.ca>
 <57f5675c-8bcd-4022-978b-9f7933bb0032@reactivated.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57f5675c-8bcd-4022-978b-9f7933bb0032@reactivated.net>

On Sat, Jul 18, 2026 at 09:39:48AM +0100, Daniel Drake wrote:

> I don't think I can use that because this setup uses an IOVA aperture at
> base 0xA00000000, whereas generic_pt assumes it is managing a 0-indexed
> virtual address space. So the driver has to intercept every incoming IOVA
> and translate for the aperture, see how map_pages calls:

When you say aperture here you mean we place an IOPTE at VA 0 but the
dma_addr_t for that has to be adjusted to 0xA00000000 ?

I wonder if DT can do this with dma-ranges or something, we have many
other conditions where the dma_addr_t and the internal physical have
offsets..

> I was wondering about making iommupt understand apertures and
> translate accordingly, but I imagine you would want to keep that
> kind of thing out of the generic fast path?

We already have pt_full_va_prefix() which isn't strictly an offset but
it it probably matches what this HW does.

You can implement it in the broadcom format and return the prefix value.
So long as the vasz fits within those trailing 0s. That's basically
free and has no runtime cost on other formats.

Jason

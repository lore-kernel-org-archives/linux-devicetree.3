Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AA14369A
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 00:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785283829; cv=none; b=GQd55P03amA8hyK/dleO6NshMv1qvIVIFkXnv1+jZC7Xdxo75bXKt1dBgLhgoCr022KDoYIRkjbIT3yir9wWujxYXGNgIntZFWaJjHqd+IHbHbiz9xPweL/9dW2yuJDhM+VCL1eGVe3HNg8F8xa2IqmWAdrlllNsUeLZnZ9nY6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785283829; c=relaxed/simple;
	bh=KkoSOGKlusTnK+ZdAUdTrIWUD8iRGveY1t8vcyjuTsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IiRtm/xEBNF/Dj4laEVndSkll8VuDgggZWdP+vnOwc3OOUFWaok5a9Z7ht/26JE5swa6wYQiRNcSoQQJ+JDU7wsTLNXVjUVuvvp6Ojb0nwVQdqSh5nBPbHe+m2ZynTDuwuqbnCg1L/ohPKNCFItjz5vO4E1bvdSDx0iJOnElzUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=mcmqTg/t; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="mcmqTg/t"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2caed617615so5269895ad.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 17:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1785283827; x=1785888627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n+eyuJJuDqUpzb7f6fRfbazX81T9EOhy1ShTPafeE64=;
        b=mcmqTg/tliJWARI6Xx5X7AbBYrtWQX7fnTqiuElsOYvgdgarsyfBYplGI4hZo0PNpa
         1zE0AtUsPYovco3czerA678MPnF0+kyxmGL3g2zAjbpb2owQAKK29cxqy2yisRJevX7w
         HIkMJiWnLDitLX12vlOFPE0hLfN5vzx8srC4B9GCQTRfStpbDlFbxuhZC/R/pp6EeYoX
         8eEFBgnzeV7tbV1Xe/Ef4U2L0/Gb6Iq4RwxW9bydPFn2B39MS/lpUZjB4Fv5uNBPyzpq
         QCljYFaqkGnm5PmgPJxZIhFIjQwX6nlb4Q6F5vnZ92B0tjKhvshpn1zSGpZvpGilRJ4x
         JRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785283827; x=1785888627;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n+eyuJJuDqUpzb7f6fRfbazX81T9EOhy1ShTPafeE64=;
        b=TejPrRs6DOak+7dbzlG80bWq1nPaBCHhPG3WPwUn46hQVwJa88xVTUt+IAGgg7AKCu
         c6On+g8kLjM6lx7P+eSIvqnE87LeNh16AulMMgAKOsT4fOJf33wkTRB2cg9eCp6CD+Zv
         X/3eym9J4uc4B0MNQriCl4JfxPF2KGaAxra33C9nwBIUhiUAEwuHVCuWLDc0wlWORZ06
         zeKr9hNqChgDTk7MCXaKE0thm9AQpZ11ydLvx5doM6CTFQuycVmbgqQRnd3rvU2H8c3H
         Tx8sO9sgoRmXsNkPxyttusL3DUjEZ9X8FoxkPnMbtEbcqesxgKu16UfwfFTw1dENCcN3
         U1+g==
X-Forwarded-Encrypted: i=1; AHgh+RogmwFptEeqgKgiArSsvBVufY+sXLOkZWFGgskspdFgKbVTM5EBDsTsJSMjBTZ4GFakxQ0rWZAE1DF7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7SDtwv+6HcaNt2Ucz4Qr8WTEBLQaSeRet3DXyepJWYISnw1/2
	krYlkCp8KLEj1wBsCfbpb7sgorpUI2kfbJYw2oIgLy9m5XkX5m8vUyHHLGLecz51jcc=
X-Gm-Gg: AR+sD11yFd5zNbPnE7e6euUY/9xpls9Bx4pRPPRIe237ddb2n7qZZTvt0PAYiNEm/Kd
	N/nEoKiEUc5NkNDt1SYiIzEdyQ63LjKz5Rxxzz9ONF2xkVmXGOfGa+tVyZ4rZ6G+8GWrmOAvIvj
	bp4RRLgZKDqivv7YDclXco9OnmqElVYIjDuzp4RLeOJepePqHyWNCTcR8eKYfT5GFe/xudyNTKl
	PFz8YVsC6Na7FD4/JLe2XmwRQO5dHxFAXFxTNRYey+tuzP9qXXz1kPIHbyChgRcazjttCehOMMg
	HERBgXlMoihA+d3yOC9Dso6bhC/a+5XxKiljkES8rknflKgqCrmt45sx0dhFh6HMlD/srhlVZEM
	HEQ2mvvnqgfkSZURSZV77S6SRLO2oS+GobLU2PLJf9ZWqk6OLw1FNCfG7eKR6FU2vUQ7vVENXR5
	rwfo4rZe6+1plE1aXekagaETtOb9GcN/sHfgG/IlKLkhd9Q8hL98IIYvmfEm4Ktoup
X-Received: by 2002:a17:903:46cd:b0:2cc:f7c6:8353 with SMTP id d9443c01a7336-2d015da2cdcmr51336395ad.41.1785283827557;
        Tue, 28 Jul 2026 17:10:27 -0700 (PDT)
Received: from ziepe.ca (d50-92-54-205.bchsia.telus.net. [50.92.54.205])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a4596esm2962495ad.23.2026.07.28.17.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 17:10:26 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1worsQ-0002DH-GU;
	Tue, 28 Jul 2026 21:10:26 -0300
Date: Tue, 28 Jul 2026 21:10:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Daniel Drake <dan@reactivated.net>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	nick.hollinghurst@raspberrypi.com
Subject: Re: [PATCH v2 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
Message-ID: <amlE8rEgryPqrUZd@ziepe.ca>
References: <20260727-bcm2712-iommu-submit-v2-0-0247b5c03de8@reactivated.net>
 <20260727-bcm2712-iommu-submit-v2-4-0247b5c03de8@reactivated.net>
 <3e7ba95b-51e7-48e4-aea5-f86db1739ac2@arm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e7ba95b-51e7-48e4-aea5-f86db1739ac2@arm.com>

On Tue, Jul 28, 2026 at 11:51:04AM +0100, Robin Murphy wrote:
> > +	ret = pt_iommu_bcm2712_init(&domain->pt, &cfg, GFP_KERNEL);
> > +	if (ret)
> > +		goto err;
> > +
> > +	/* Set up a default (error) page used to catch illegal reads/writes */
> > +	domain->default_page = iommu_alloc_pages_sz(GFP_KERNEL, PAGE_SIZE);
> > +	if (!domain->default_page)
> > +		goto err;
> > +
> > +	domain->base.geometry.aperture_start = BCM2712_APERTURE_BASE;
> > +	domain->base.geometry.aperture_end = BCM2712_APERTURE_END - 1;
> > +	domain->base.geometry.force_aperture = true;
> 
> ...and thus (as things stand) this is a lie :(

Well, it shouldn't be here, the iommupt core code should be setting
this from its own internal information. If there is something missing
to add in the full_va_prefix we should fix it.

But, AFAIK this is the correct way to declare a page table that has a
range of IOVA - which I think is what this is doing..

> If you want to operate like an IOMMU, then the translation aperture and the
> bypass window should really be mutually-exclusive;

I think it is operating like an iommu..

It uses generic_single_device_group() so there is only ever one
translation.

If identity is attached then it clears MMMU_CTRL_OPERATING_FLAGS which
I guess fully disables the IOVA aperture

If paging is attached then it sets MMMU_CTRL_OPERATING_FLAGS and
places the aperture at 40G. Based on the comments about blocking I
wonder if the "bypass" even works when paging is on?

If blocking is attached then it sets MMMU_CTRL_OPERATING_FLAGS with
some 0 address cap which aborts everything?

It looks to me like some of those comments and choices don't reflect
what the driver actually does. Since there is only ever one
translation we never need to be worried about where the aperture is,
it could be anything so long as the HW gives it priority to bypass.

Could the aperture be placed at 0 with the bypass fully disabled? Then
it would basically be a normal iommu.

Jason

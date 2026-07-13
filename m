Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3053FF89F
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944058; cv=none; b=S+sAjFMmuIBzaxWVA5RDfcyjGXfr+WMVX3vJh7b9W3RpLLZhRmfMHxyB4Bq712chQf6C60inoK4GbOua/he5HIW1GP0fotzB3fQdtc1Krl5RlwwFjgK9Qhw50P/mgP90NKi2N1sUOvuc2TkXYn0JAhj47hvHF0ynTUYyUr/YINU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944058; c=relaxed/simple;
	bh=cw4aY6+xvzrYm0iCO2mGlo5F7FyS7T8m2XSxQSLnD5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R44eIi+qOfcXO0b1ZWJ7tHIZXAZU8jAU/veA18wh4JhdlRn44FO2qUZbpEMwFStdzUcqY1x7wgF5vJ6nvPKs0337N/bo2zsNvtK+1+D0k1FHBEkD3R1cgek8WnG3Onp9FukXNBMwDeby6KkHJBGdeLaJVOctGLf5kjGAtAviOmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=kBBd9Vdh; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="kBBd9Vdh"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e57a753f9so235304885a.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783944055; x=1784548855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5HCZAcclosWUynw+gIE6OLmOTVWR8tes+S5wt04CaM8=;
        b=kBBd9Vdhg890iVSFO/ipreoQLU4SeBg/IxXv9g/41ObcTY7Mx3pARN74hoyR7NzaVW
         LkyxQMcAVksjeCm/4qvsEiB4SqBOMro7FMdPbNNG5X2k98BVKxJ+1Ch2jbtXnApX45eL
         TGNBjYFbxsd2ha+BqueCWkz+dxjYhbSgwYekhIfNt/nL/5VxghIvW3gmE9NsV6Aj8Qo/
         +zPeK/B+LcdnHK6rkjYpBwF1BMgiPu98RPJuNNoPWA4FS2SNB5GSA1AoafYOt0XrVmy/
         9u2mMLV8ogfbKSxmRPnFlAvkAMbLSQkUintOvkFtdZjhN+cSE+2lJoCk+3K7I8aLna09
         BzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944055; x=1784548855;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5HCZAcclosWUynw+gIE6OLmOTVWR8tes+S5wt04CaM8=;
        b=JG7JZ4yxW6tdAB6NBFFtNUWPruRWGOWWPQhjfsSCK/wayvTHdBmXSYgPimh7R5tHap
         1EcI7HHFVIcTgFvi3L2qhPl10leWntUzgrcBwbQwJGCYEJfX0QmvMu9lBATDJ6EqiEA2
         7JLztBsDlGGbX/8ORsCzw/WKcEaAhFs51mwBCwROCG7AAj2PiGdQSE5ofG2VoQNbsgtA
         wlAtF79dqMrmSt0Nh4TvLpu/Qfe2Q2L0AmrI4mXwJ2AQAiKG7bPOw1IWLgkCO1veg4eI
         sN2ZL8XEyOuMQWAyHDgZ1w1dI/Hk94DmhJ8e/sQwrmR+WYfPtkfJO7GbJhisLq3MOmxV
         l+TA==
X-Forwarded-Encrypted: i=1; AHgh+RqGqPUpWcctMgcGQPUhSZxiz2KNcNujJMrLPSU0yAZaRAxvpQEGGdJP3ZRGv4i1pYVDShTaavfR+CxE@vger.kernel.org
X-Gm-Message-State: AOJu0YzyhokwFi36q9u/volnFKvKVU35L7b8Igz0h+FBrm0BD8PUoKOS
	d4eUF87lTa8W4gKlxqZOoqn8YQJwKZH2Jq2kyBLXu6vPeeiejHoXmTbIzbo2g4TMtEA=
X-Gm-Gg: AfdE7cnM90jQ8pJUZf2vw3EpFZCzoYOZQkBbZbPbAVQ/qAVckR48nTYOpZYRb6EeLyG
	bsO/7MshVF6yehwYMR/8CNV/DXBlZysLnA286yE8JueCD1kKw2K4mIhUz14g7J/lEtefZBYfyn6
	EBL5AfN1EVb1gixboEfn9+MaaFSC+21moDciY+0t2vu3k81W8DutzbPyWG1Eyuv2LqDL+WYAp1R
	rpiEXfWfFm2SMwepCGvo1X+355uDCO5idQTCN/a46BL/h37dvzTTUruw9YvQV44AIz/KllG4F6x
	Zao+fNiGT/mWg8ymGa6RF8W1WAjr5wbXY8ufNvpzew9lGdPgKkgwXP6xK5+durtKzrLfFxW1Nct
	gY8xDg/woO4HE8CTePVKPPMHXtYp30DwW5WoNGXJxxwXwCA+9QYMJ5TAgGM9Kkak8o5frp6c=
X-Received: by 2002:a05:620a:1712:b0:92e:5612:ba39 with SMTP id af79cd13be357-92ef2cb1651mr868484785a.44.1783944055161;
        Mon, 13 Jul 2026 05:00:55 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5cf9b7dsm1066306685a.23.2026.07.13.05.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:00:54 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjFLB-0000000Cu4e-38Ps;
	Mon, 13 Jul 2026 09:00:53 -0300
Date: Mon, 13 Jul 2026 09:00:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Cc: Daniel Drake <dan@reactivated.net>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/6] iommu/generic_pt: Add Broadcom BCM2712 page table
 format
Message-ID: <20260713120053.GE1835788@ziepe.ca>
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
 <20260712-bcm2712-iommu-submit-v1-4-80e10cdde2ea@reactivated.net>
 <CAPhyPA5CqCzsDZg1_Sfr=EP5G6uLnnvDmdd_REZPX_VpwS=VJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPhyPA5CqCzsDZg1_Sfr=EP5G6uLnnvDmdd_REZPX_VpwS=VJA@mail.gmail.com>

On Mon, Jul 13, 2026 at 11:02:15AM +0100, Nick Hollinghurst wrote:
> Hi Daniel,
> 
> On Sun, 12 Jul 2026 at 22:19, Daniel Drake <dan@reactivated.net> wrote:
> >
> > The BCM2712 IOMMU implements a 2-level page table format. It is relatively
> > simple, with one unusual aspect: leaf entries can only be installed at
> > Level 0.
> 
> I should admit that a single-level huge page mapping is possible, but
> I was too lazy to implement it (and haven't much tested it).
> 
> It can be done by setting bits 31, 30 and 28 of the top-level entry
> (all other combinations of bits 31, 30 will point to a  next-level
> table). The page number is in 4K units but must be 4MB aligned.

Let's do that instead of the weird full level contiguation page thing
please

Jason

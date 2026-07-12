Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327C835E930
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 22:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783893762; cv=none; b=ZtD2mV+MctRNwoEgnju8gKl8BDQlxmTh4c5XW7+qrVzXsJnQHSZHHdm54EsFstax05MTSqViu3BAy30vFSPtv8+41OonipxTmG9WKHS+4YCdJMFtNUXc7Eq6GVHyZSxd4PZsbXpA3NKUhU559vI7aakYgJVZXfwPtZ2yy1umKyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783893762; c=relaxed/simple;
	bh=9doQrKp6KwSDaJ9VqtVfvX30Yv5ebNu4lugCON+hGRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+n5mqUmVkE4X9L71GgSU8wcyQ5Fz5naePrrjKIY5qPIWJbkxGoMM59lf48quixpfPOAXSDegSJE1NqxO57KnlM76mNZXaKyXdgSfxWVlj0VfZmr/tV9NN/wyq9pFtbV9MwRlu5ZO0uhj6PNEfqNZytzaGpuK8pzHChgWYcoExM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=EETHylX/; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="EETHylX/"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51bfb91795eso18971271cf.1
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 15:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783893756; x=1784498556; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FvL6EjrEIuF0wC64QnMQO+VDujPOa7rrdCG0RMcrsPU=;
        b=EETHylX/5ENk2vbj6K3EEL0Onyn77l/nN+UoFHmq/+rZE/seCoHowYvoAe0aNenBAS
         jTJdTuDvDFfm3rSQ5agT0eTT09KrzmInKSRX92nYU2vavpXvR8Dal+xhDBmi5+CVf5T4
         p8wG3IK9e0ycqZEsIWHXDPivDNoKibN34XzLJWnnWTLaQfKAXgtOzB9eCTgjNlj/yRn8
         KwymwH/P4Rktt4pZtvbJM8fyXt69cyvXwMtKQkbuNiNE+2B0j/yPi9vxNcB2FEjYCurR
         14P3W7tzkuiKw5vV8sCLTL05JkvQmy7dgJI4zRByhSZcz1Hy7ndTy74sTDw/CU0LlCZ5
         uVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783893756; x=1784498556;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvL6EjrEIuF0wC64QnMQO+VDujPOa7rrdCG0RMcrsPU=;
        b=stCU9wMUGRIEZp6xOZcMU+FwOHXlaketMEaJJbASkKOGRe2Ib9uI9Kl/XCRucLAk2+
         8sHvuoy3dlLQdMjgaPLhTCOoB/phAte7kOvZ3+MYa/uYOwFah93zicy/gKldEOnN2Z7T
         9yFDJef1lmC9J/IVScNkxhzuRvPHLYCIYGB0k+QpIPgP8sY/uqZTOlBWC81WbpZ4RSx9
         xSv1HjVTQ6zmdtgiHmxCrtuQohO/1VT60XfbZqv6VNHLy97lFu1oSfn6uz3Dcrdf4czr
         QLVasEOlrxox/Nz9vTY5UBIxghB7HSTR2IUW8ZQ0wwDrUrinWMbIhImEJFdzuSvn4qFY
         9BHQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcrwnTmjKcYjIhXtbeuMLwr5xkmZSBQBUkx3RYW2os6SZU6T46JxwyLByvNa2pfRaBIQvlVf7aOANw@vger.kernel.org
X-Gm-Message-State: AOJu0YzfAQsSf535XTAMCqD+S2tDRqacuRsqBvH1q6GsShqiJS4icM30
	vX2QYRtWqkhRfYwwmbh9ZfqqKAP8rqDWSFfx87J7s64xTt74ly25BcZXQEZzkHFPnfs=
X-Gm-Gg: AfdE7cnlSl+J38xeKu/TDlT9c2WuQE4h9PG/3nAWtev5z9T28VtRssVZPl+np7sIFC9
	sP2LR1VCn1oytOEZuMDwmm8s0pRWBehar3C4BJR5TU2FT65VTONCV6bw0HjHukSEl5oz5edO+1d
	tkftefqqq309zcTbPaoTja21V63A6mEcrPHcDVL+x8BybWYmJuN2NShjZtH5QZv+C+5C2txorFk
	N80N8uKuT/q5FPZOOvT0+vBOVapKQZ5U3oNZ54DwlKMbZHS/BOe//b8AVVJld4N5IoPgEO/XweG
	49ZLjqqB3dGoqV5pqrb52hpCKd/lV3nSkSn71REYQyhV5H0QZL9wqpdmfzV6YhqNtc8MaNH1e3g
	93m6HCGMxe6duwzGWvWUuGvNSvD4Px1WFiFaa+jcJ70GpGe8GZn31MJpHgQGU
X-Received: by 2002:a05:622a:15c4:b0:51a:8e07:59d5 with SMTP id d75a77b69052e-51cbf071548mr72240201cf.12.1783893756428;
        Sun, 12 Jul 2026 15:02:36 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd56c4b78sm113643606d6.18.2026.07.12.15.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:02:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wj2Fu-0000000BnNB-2edV;
	Sun, 12 Jul 2026 19:02:34 -0300
Date: Sun, 12 Jul 2026 19:02:34 -0300
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
Subject: Re: [PATCH 2/6] iommupt: allow full-table contiguous leaves in unit
 tests
Message-ID: <20260712220234.GB1835788@ziepe.ca>
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
 <20260712-bcm2712-iommu-submit-v1-2-80e10cdde2ea@reactivated.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-bcm2712-iommu-submit-v1-2-80e10cdde2ea@reactivated.net>

On Sun, Jul 12, 2026 at 10:18:52PM +0100, Daniel Drake wrote:
> The generic_pt tests currently assume that a format should never support
> a contiguous page size that spans the entire mapping range of the table
> it resides in.
> 
> This assumption breaks for BCM2712, which has a 2-level page table.
> Level 1 entries cover 4MB of memory via their corresponding Level 0
> table pages. There is a concept of a 4MB largepage, but that is
> represented as a Level 1 entry pointing at a Level 0 table with the 1024
> usual PTEs with an additional largepage hint applied (for TLB
> optimization purposes). Unlike typical IOMMUs, it is not possible to have
> the Level 1 entry point directly at a 4MB chunk without the need for
> Level 0 mapping.
> 
> This BCM2712 format is well supported by generic_pt: SZ_4M can be
> advertised as a possible size at Level 0 (so that the iommu core feeds
> it 4MB-aligned mapping requests where possible), and drivers can also
> advertise that *all* leaf entries are installed at Level 0. This indicates
> that the tests are overly strict.
> 
> Transform the test to become a validation of the driver's routing intent:
> for every advertised page size, check that pt_pgsz_lg2_to_level() maps that
> size back to the table level under test. This is roughly what the original
> tests were doing, but also allows the BCM2712 case to pass.

Seems fine, but I wonder if it should be conditional on the format
somehow, I put it in to detect mistakes on what was the universal case
that nothing would do this.

Either way

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10BB37A82F
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 22:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783894289; cv=none; b=AUcyCFcxJ14yHNs/XPMpHh6ZSIn5bwp0pxJZvHx/MX3tVFdJNttvlrDdaQl/blKhJm7xRrJyRZtpQFQ+DE5pzSp8dZwUd+PLr2XRq9aQpUn/Rd2tVMVDtlxFYp8xfMOdS9ETJBJHPItgf1/jDJmtPfSdY8a1XTIq/GZw9yZbOv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783894289; c=relaxed/simple;
	bh=vICjuJZMyL8ox/LroketggeEi023fKRGGXjlLd3/YVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZctkeKo8flFsubtFnTkyBOX0nENjuDaTcbU9r6Xh1aN1zLVR11a97oQYAvuBzEu6a+Srbpb/MQnqb01cBUfcyjlj8dnn3yAlaKHUlIlEYJy5rkVwKZUUbr78jDyUSyoK0qciszd0KMyyIsIcihzj5k2itEFtNUk+cAh3KVNf/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ZTfD/Az3; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ZTfD/Az3"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ff5d1b0f91so14637356d6.2
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 15:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783894286; x=1784499086; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=egnmCxbrpH7UR+MZJeffNbFqc9tcIYQZ6W/rYZyeos8=;
        b=ZTfD/Az33NRTsDpAMPJkFousSSL5hVhynBEYuyfStFhCaqzRx3fuTQ0Oocle9uK0Df
         Q0RE/ILH4ZpwnKbtvNIywkMfj3ZUw0U/g38lKHr2Wh1rRGhGj4yFxQ/SXgsDxPJPmGFQ
         wl6BFvTW7VVsh3HxhLjYTXAawHHlDgO0o+Ftnkw9TKyGVz6eGIzcrYH810N4AWkhKBFi
         dN92zfY9AlRrSvOjizjgcAw+EpNNqfq1ipo1k44jCOTGf0CSBnIQXownnwOXAnoi+a8W
         S/lWyT0g618Gtw/LZwVBvclRCqL20XNGsu8fEoZcTcRJ2snBubX6ieiArjOk33FNqg6V
         e/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783894286; x=1784499086;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=egnmCxbrpH7UR+MZJeffNbFqc9tcIYQZ6W/rYZyeos8=;
        b=kQrop+L7RBkwXi9u5dCti387QvuxcRGoA604pSKUKpVRxs85O/5WYW8G/sPhE7g6Ri
         +pdfgM+NK0PEjiyLPMXOdi7ViI0iPVMarLhCitvJWcp+MdrbVGBLL2IbAmM8ZUT2+d1f
         FTCmDZ5u6420PnE08lgzCyiZgMm8z7yYq6kpwXX7Z6wpCNkFJyxYe7MUP7W9RSTNpeur
         Bx3Agt9b3sPWCFTQSuOcGWNJj2wb0uHo3zqrUlPkQu4PFkEvduB7zoOfHcrFSF2PJJKK
         87ezsWcFsYAGNZ54IXEDhyjiSLutd5LnXn0xHiCvPmwO3Hl+phCjPNEbEbul3BM8vsVm
         3g3A==
X-Forwarded-Encrypted: i=1; AHgh+RoLzeaAHCBZ9nui62u93M8j+75jNPTP4pDdttPiWvuajYF5dhHUp1v8/TVfL5wqaILXIxgn7lrkCukJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgxo3/mvRzCGR3e/pLyjrjFG8vO/cRtKXB8rjIA5u7jxscTvgl
	fSutcKZJlActyjtebaic2I8kIXH5h46IbBIPsO6Swu9Eqw1Cd4oZDYBR0pFU0Wm+OZI=
X-Gm-Gg: AfdE7cko40Z627XlFP2KbupDGgIlluuoeB6RnQIrlrXUKG79ZV3DGDMFJs0XFb05E7o
	xo61oeYcNAiWivPZOAFTy4JJKyYmCqelpWkQoXnf3lXxgZoOXl2zqn++osBhgox7Ju6Joar3CLK
	kao+XXtpBsfnh/UGaVPMZum3I+2mtiebwB7p4/2Pldy/87u+sgp4aUhB3LvKVJS+afvMjMNapkv
	g/IM1Lp5p91rptYRhq7jR6W7bSbP/syrmBzotcR4GrUb350KVu8tiTF69kyVMSJVJ6qiq6eC+lc
	aQALjXg3i/aoyF5TVPaDImRSDgTKeht+W3xmp9f6eW5MK8UNomJ281V4DU4ghgoDg+GiHqddaIs
	CwpNt1altKQmcLVphxwPo9LChNjngTbqFDv0fvgptMlFHMAHott0UMqpxuuWE
X-Received: by 2002:ad4:5dc3:0:b0:8f1:440c:7f81 with SMTP id 6a1803df08f44-903fe450e71mr71838966d6.4.1783894286578;
        Sun, 12 Jul 2026 15:11:26 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50e10f4sm113814616d6.1.2026.07.12.15.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:11:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wj2OT-0000000Bo42-2Ctj;
	Sun, 12 Jul 2026 19:11:25 -0300
Date: Sun, 12 Jul 2026 19:11:25 -0300
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
Message-ID: <20260712221125.GD1835788@ziepe.ca>
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
 <20260712-bcm2712-iommu-submit-v1-5-80e10cdde2ea@reactivated.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-bcm2712-iommu-submit-v1-5-80e10cdde2ea@reactivated.net>

On Sun, Jul 12, 2026 at 10:18:55PM +0100, Daniel Drake wrote:
> +static int bcm2712_iommu_of_xlate(struct device *dev,
> +				  const struct of_phandle_args *args)
> +{
> +	struct platform_device *iommu_dev = of_find_device_by_node(args->np);
> +	struct bcm2712_iommu *mmu = platform_get_drvdata(iommu_dev);
> +
> +	dev_iommu_priv_set(dev, mmu);
> +	return 0;
> +}

Any chance this could work the way that smmuv3 does? I view it as the
more modern example..

> +static int bcm2712_iommu_map_pages(struct iommu_domain *domain,
> +				   unsigned long iova, phys_addr_t paddr,
> +				   size_t pgsize, size_t pgcount, int prot,
> +				   gfp_t gfp, size_t *mapped)
> +{
> +	struct bcm2712_iommu_domain *mydomain = to_bcm2712_domain(domain);
> +	struct pt_iommu *pt = &mydomain->pt.iommu;
> +
> +	return pt->ops->map_range(pt, bcm2712_iova_to_offset(mydomain, iova),
> +				  paddr, pgsize * pgcount, prot, gfp, mapped);
> +}

These ops should not be present, the iommpt provides the ops directly
through a macro;

> +static const struct iommu_ops bcm2712_iommu_ops = {
> +	.identity_domain = &bcm2712_identity_domain,
> +	.domain_alloc_paging = bcm2712_iommu_domain_alloc,
> +	.probe_device = bcm2712_iommu_probe_device,
> +	.device_group = generic_single_device_group,
> +	.of_xlate = bcm2712_iommu_of_xlate,
> +	.default_domain_ops = &(const struct iommu_domain_ops) {
> +		.attach_dev	 = bcm2712_iommu_attach_dev,
> +		.iotlb_sync      = bcm2712_iommu_sync,
> +		.iotlb_sync_map  = bcm2712_iommu_sync_map,
> +		.flush_iotlb_all = bcm2712_iommu_sync_all,
> +		.free		 = bcm2712_iommu_domain_free,
> +		.map_pages       = bcm2712_iommu_map_pages,
> +		.unmap_pages     = bcm2712_iommu_unmap_pages,
> +		.iova_to_phys    = bcm2712_iova_to_phys,
> +	},

"default_domain_ops" should ideally be split out to a "paging domain
ops" static and set directly during alloc_paging. They are not really
"default" anymore if the driver has unique ops for every domain type.

Then use something like:

		IOMMU_PT_DOMAIN_OPS(bcm2712),

To define all the page table related ops automatically.

Any chace the HW can do a blocking_domain, or is the only way to do
that with an empty paging domain?

Jason

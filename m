Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7999838836E
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 08:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784363995; cv=none; b=bbm80ovbU/JPLiiaWNFZkllIeEQscxV6ECxnAgoTaU32TCbbCKJkXA2hDMXqxVFuBzEkOQji0W3z1OJ5haGYQVtB6TK0f39fFWELo0U9NvAVKj3DXeo0HTKT7WNHnFkQeXeCr9smf7QfjGeAsPz1hyrIXpLJahbJD0OunbJ4Mxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784363995; c=relaxed/simple;
	bh=wxhO085La/+XeWU00w7Xk6/Dkf9lbbQyMuWbzMBiyk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cn7nokSI2RoM/fkxBlCkSVCMaWizPEtTitTp9yI2WUOAqD8kNAS27XPLKq91DD42G0UeqyeUsU7yENDSrSxFokLq9Bzpd+Bm2+HZ37nM4YkQuhlb27ss1VmJDBozO0ybQvghFVCjPDqJmLXEAFvZKzfG2/2zDOocp/f2P0z4stc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-472326ca506so6746178f8f.2
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 01:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784363992; x=1784968792;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7tMDcOMCOuv2/S1kjEybtD3qi7le2Cks8fYUJXxydzs=;
        b=RvmBOTtyxUlRi0W2LvZwUzgD8rLQvuX9v/yjkvvbvE5jInEmB4MZY/c7Qw5j/xZJWC
         ROXsUsaZWOGJwa+Y35ooE5oZ9YXNJxsUSOt8ZdHxa7J96d/TASwloce4UK6PENBaslVa
         cg7jYhmOKHU0YPaUiUP6h+hoYDZ3voUm3rFhLVfAwVmPn5Mrn2omUvUk+0fy9YRoZbX6
         FEjoTkr0cyqaIc/YoRZsAMVScFutDkSuDUFD7NjD0odoA1hiiSu6ftwnfrLflJKtGvrz
         Xw6DJtpHL9ne8kUDTxjJRz7LbwvjCsjAnLZvK2pyEU9MogjsvWZuvTZfxLetHktwPX8H
         dB4g==
X-Forwarded-Encrypted: i=1; AHgh+RqkPwYHKJTMkEKtJ1egcNDSuNg3J7utYSS7COoS46bSv+ghY/0o2EwHkgqTPQl0FW75sPpQU0EiH41r@vger.kernel.org
X-Gm-Message-State: AOJu0YzpWWvBvjCoeyVWJljmQtGcAGXmg35L0+pYqRRNkXwUJDCUgs0d
	hRYnwiKKpDw8OWyRShUSjFSluJ/wjQZzIGZgs6ICeOSRUv4gVWNBnwy3
X-Gm-Gg: AfdE7cmMFCMmPSLpMtDkJrrnzqmGds86YXd0qjpqQrNz08cLw8zrvDlUfBjguR95nR7
	fcOQOPThggcayOcXCp00s9WMjmdM5b4fIRZLjU7OhTmHa0mwoYuJLCKbH+5Z6gwpEh2KY3XH6Ht
	nYQZYBmuqY+a1r5HefzoI8gTBXevaCgjtWyB605kgvzb7b42yGXTkLESAnTYkp0wX2vOlXjZkY0
	ZPY/cD85C0RtH/2gTy2OLktGLCn0W8ONdEiLppEit1COCsotXPJzjM1DEjncbMUVwY6tSNPUQ9/
	WbBF0G9XEVtWguZQ0bpP8q1rfGIuGNP5o1GLXodrCvT50cjYF/WHKFW2MmhAW/T/oZ/ZxVWwspE
	v7WWGB+9mVsfje0/q0Yc9kVQgxZf+8EdLFLe6HOcldU+54PbQJjYlGbODklbcenbRsZHRGaCT/N
	Sw3TZnaw+XDczFtVwc333qEzsS1Xyz5oe54OqcCVKnm0fisJ9e47aM1lj9XhWIPVvbP9cdWJyc4
	vEAgk7RSA==
X-Received: by 2002:a5d:458c:0:b0:47f:45b1:128c with SMTP id ffacd0b85a97d-47f6233eda7mr5267829f8f.58.1784363991641;
        Sat, 18 Jul 2026 01:39:51 -0700 (PDT)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eddd27sm10661708f8f.28.2026.07.18.01.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2026 01:39:51 -0700 (PDT)
Message-ID: <57f5675c-8bcd-4022-978b-9f7933bb0032@reactivated.net>
Date: Sat, 18 Jul 2026 09:39:48 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] iommu: Add Broadcom BCM2712 IOMMU driver
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 nick.hollinghurst@raspberrypi.com
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
 <20260712-bcm2712-iommu-submit-v1-5-80e10cdde2ea@reactivated.net>
 <20260712221125.GD1835788@ziepe.ca>
Content-Language: en-US
From: Daniel Drake <dan@reactivated.net>
In-Reply-To: <20260712221125.GD1835788@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/07/2026 23:11, Jason Gunthorpe wrote:
>> +static int bcm2712_iommu_map_pages(struct iommu_domain *domain,
>> +				   unsigned long iova, phys_addr_t paddr,
>> +				   size_t pgsize, size_t pgcount, int prot,
>> +				   gfp_t gfp, size_t *mapped)
>> +{
>> +	struct bcm2712_iommu_domain *mydomain = to_bcm2712_domain(domain);
>> +	struct pt_iommu *pt = &mydomain->pt.iommu;
>> +
>> +	return pt->ops->map_range(pt, bcm2712_iova_to_offset(mydomain, iova),
>> +				  paddr, pgsize * pgcount, prot, gfp, mapped);
>> +}
> 
> These ops should not be present, the iommpt provides the ops directly
> through a macro;
> 
>> +static const struct iommu_ops bcm2712_iommu_ops = {
>> +	.identity_domain = &bcm2712_identity_domain,
>> +	.domain_alloc_paging = bcm2712_iommu_domain_alloc,
>> +	.probe_device = bcm2712_iommu_probe_device,
>> +	.device_group = generic_single_device_group,
>> +	.of_xlate = bcm2712_iommu_of_xlate,
>> +	.default_domain_ops = &(const struct iommu_domain_ops) {
>> +		.attach_dev	 = bcm2712_iommu_attach_dev,
>> +		.iotlb_sync      = bcm2712_iommu_sync,
>> +		.iotlb_sync_map  = bcm2712_iommu_sync_map,
>> +		.flush_iotlb_all = bcm2712_iommu_sync_all,
>> +		.free		 = bcm2712_iommu_domain_free,
>> +		.map_pages       = bcm2712_iommu_map_pages,
>> +		.unmap_pages     = bcm2712_iommu_unmap_pages,
>> +		.iova_to_phys    = bcm2712_iova_to_phys,
>> +	},
> 
> Then use something like:
> 
> 		IOMMU_PT_DOMAIN_OPS(bcm2712),
> 
> To define all the page table related ops automatically.
I don't think I can use that because this setup uses an IOVA aperture at 
base 0xA00000000, whereas generic_pt assumes it is managing a 0-indexed 
virtual address space. So the driver has to intercept every incoming 
IOVA and translate for the aperture, see how map_pages calls:

  static inline unsigned long
  bcm2712_iova_to_offset(struct bcm2712_iommu_domain *domain, unsigned 
long iova)
  {
  	return iova - domain->mmu->aperture_start;
  }

That's why I also set is_iommupt=false. I will add a comment to make 
this clear. Let me know if you see a better approach. I was wondering 
about making iommupt understand apertures and translate accordingly, but 
I imagine you would want to keep that kind of thing out of the generic 
fast path?

Thanks for all the other feedback too - working on it!

Daniel


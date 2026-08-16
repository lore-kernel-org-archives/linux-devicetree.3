Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BE681AA8
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 12:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786884640; cv=none; b=kyONQzDkuriiL5dZhXkBaxB1wl8eZNCk2s2bbg+3spe8WN3+EwQNPXmoheRqR0OKBbGphDXANv6ELx7OgxSHjtSTjai0NCQ3Cht03CjNgwSOK0cwl3Y9sYmCVq/lEMFnzOnT18wiY9glKdJD98lF+WWT/qhudjmHFUCRlGktR9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786884640; c=relaxed/simple;
	bh=/zJcq1dpAtnbiCH/k6eDkSCdhLNff6qFJqqgWbso61M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=R6RoeKNoxmyAweRlwMSYZ1aa2fG98FlWnJVyAy/Vxapzk3jndh/AaU8aF2HH9h+wi5S37J+02JcTaxBxmkDhNuK7XrdLm++qWTZJIkYpajEgHq+4fLi8wX8okYqM0/uCVNcxsN/ofptP3UagY12tBSybi2RPQDZsx0/uyfGy63M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47db714766aso2092872f8f.0
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 05:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786884637; x=1787489437;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPrcGGvEf1e6P4d7hpsNvKZqUN+qMke5YpauuSzuEx4=;
        b=pVAaWCng22ZFuQr78p0ofnqAAsVybVZpWh8JrYactxOF/ptAy5+tEZ+c6U5X5b5Z4H
         ikfp88P/8b3Y8OrqfibrC/MBuFSZJgLHf+7t8ULzvhGdVaMbqs9c1xFjJP+Z6+F7Kuer
         PZXGUNrDwN5P3ULCuTZ3JC5XATQfPgEgFouNMmovEq9F201vEdu/FgYD508FZjCPSzO6
         cEc6oAAHGQIWCr/Dik3g/xVzquN80G/h1z4UR6MYbHW0WdsGPC3VIyIbDfw/w55KLrJs
         e+V6Uf2NdfUIou5QaP/w6OJT8OXgkgBdtBpNP4AOcttuJOBnrQv9V6aQNQ5e0GvmqfOM
         qvOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5XQ1fRDdGeIo+gKtWI3e7spF1l7SzkRZJq882xKM9DHi0WuRjGoOkuJjULB9TK19CTI6T5Dw/SLlH@vger.kernel.org
X-Gm-Message-State: AOJu0YzB3kHjMI8+aXe4fq/BpqskrweneaLGLBT5gAbhX14kUYL495ck
	h7ksgRQ57BaMJ7gdI1u7nDRQc0KfzJOXaKMsuAnFjZ1ux6BMa4EqlR+/
X-Gm-Gg: AR+sD11nsI0e4/VLo7vrQGmeB9G+Z74EbQ1sZzE+ITafQ40MW8K0ClemQtmi4rqkWrY
	KHNp05JsulFrnqMOV16pffWhDWsAjHtxvdoXt5zDeFA4sQ7iB6Vdj1dzKAZGXoQjUAJdgjYGIye
	7qQ7N8Ig5cobQNzDUgM5J+j7F533aszAg36mSgi4/5GGwasljEeDaHcwB/X06dDNT63/eI8mNVY
	YmJltac/3N5iJ6/5sDIQ8PzjeEBc9u2pKP82jiVroyPXoeWlZMMooqcpmiicf3NPAfnn25eQ4gM
	p9Aa8cDGN8wsH8jrq/ZCWxfgLzRtkxYg63w/lPQRZi4pZXizS/oR3clz/iudO75JOxFG43JDnZd
	qCK0ati2g6NrRP+gEdY0JfP7EF5T/vxQk66kU/Btwig0+YJ04GUR5fvnIDzL9wdCrKtaaixRxb/
	Kj8UK63mBKYv6k5xN05JcDmc0160wnvIxaPDW/as5BsDtSTcFMJV64Vw1uW1f4TO7UNaxckBkn2
	5Qyq6Lm3VAaTGKHIsjBr5nsNBG7cg4cHdGxU9io5gcg2V5FI1IXwk85IfJWrsKXWLM5AChBZBrK
	2aY=
X-Received: by 2002:a05:6000:184c:b0:481:314b:b041 with SMTP id ffacd0b85a97d-4816075f4f5mr30224247f8f.7.1786884636404;
        Sun, 16 Aug 2026 05:50:36 -0700 (PDT)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f219e12sm22222287f8f.10.2026.08.16.05.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 05:50:34 -0700 (PDT)
Message-ID: <abc25cfd-0c7d-4719-b6af-9034c87e9f88@reactivated.net>
Date: Sun, 16 Aug 2026 13:50:32 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
From: Daniel Drake <dan@reactivated.net>
To: Jason Gunthorpe <jgg@ziepe.ca>, Robin Murphy <robin.murphy@arm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 nick.hollinghurst@raspberrypi.com
References: <20260727-bcm2712-iommu-submit-v2-0-0247b5c03de8@reactivated.net>
 <20260727-bcm2712-iommu-submit-v2-4-0247b5c03de8@reactivated.net>
 <3e7ba95b-51e7-48e4-aea5-f86db1739ac2@arm.com> <amlE8rEgryPqrUZd@ziepe.ca>
 <d6bb859e-c1e7-428e-b765-7b471e1ce005@reactivated.net>
Content-Language: en-US
In-Reply-To: <d6bb859e-c1e7-428e-b765-7b471e1ce005@reactivated.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 31/07/2026 21:22, Daniel Drake wrote:
> The aperture could be placed anywhere, but the key idea in the current 
> driver structure is that we deliberately place it above physical memory, 
> so that we can have the bypass window operational for all regular 
> physical addresses, meaning that iommu-unaware devices can operate as 
> normal.
> 
> Each of the 3-4 IOMMUs has around 5 devices hardwired into it. When the 
> IOMMU is switched on (effectively via setting CTRL_OPERATING_FLAGS), 
> *all* of the hardwired devices are subject to the IOMMU operation, 
> uniformly. There is no gating where you can have one of the devices in 
> standard passthrough mode and the rest using the IOMMU. Also there is no 
> Stream ID in the transactions, there is no way to configure per-device 
> page tables.
> 
> Among the devices hardwired to the IOMMUs we might have:
>   - Devices already set up by the firmware and relying on regular access
>     to physical memory
>   - Devices that don't require large contiguous DMA allocations and would
>     prefer not to have the translation overhead of the iommu
>   - Devices that handle scatter-gather natively and prefer not to have
>     the translation overhead of the iommu
>   - & devices that want to use the IOMMU :) so that they can work with
>     large contiguous allocations which are actually scattered in
>     underlying physical memory
> 
> So we have multiple needs to tend to, which is why the driver currently 
> sets up the bypass in the regular address space (serving the first 3 
> above), and the IOMMU aperture in a high, unused part of the address 
> space (for the devices that do want to take advantage of the IOMMU).
> 
> Are those good enough reasons to set up the driver in this way? Or are 
> there other approaches to consider?

Reading the thread again I'm sensing that it would be preferred to go 
with a more conventional IOMMU setup, rather than trying to cover all of 
the above in a single configuration.

For the next revision I am thinking:
  1. Paging domain has the aperture at address 0, without bypass/identity
     region i.e. some degree of memory protection is present
  2. Identity domain is complete iommu bypass (as-is)

This allows the system admin to choose between the iommu benefits (and 
associated minor overhead) OR the non-iommu bypass mode. That choice 
would apply to all of the devices hardwired to the iommu in question -- 
we wouldn't attempt to support mixing identity and paging approaches at 
the same time as was originally proposed.

Regarding devices set up by the firmware that require ongoing access to 
RAM, of which the display controller is probably the only case, we can 
use the existing mechanism that allows the firmware to communicate such 
requirements.

The iommu driver will do:
	.get_resv_regions = iommu_dma_get_resv_regions,

Then on the DT side, I would ask Raspberry Pi to provide a firmware 
adjustment in future versions. It already dynamically programs the 
framebuffer as a memreserve property, a hole in the memory map and as a 
simple-framebuffer node. We would need this additionally programmed as 
reserved-memory:

  reserved-memory {
	fw_fb: framebuffer@3f800000 {
		reg = <0x0 0x3f800000 0x0 0x800000>;
		iommu-addresses = <&vc4 0x0 0x3f800000 0x0 0x800000>;
	};
  }

and also a link back from vc4:

	vc4: gpu {
		memory-region = <&fw_fb>;
	};

This will cause the iommu driver to set up the initial page tables with 
the above memory region as an identity mapping. This is done before 
paging mode is activated, so once the iommu is actually switched on, the 
display controller will enjoy uninterrupted access to that framebuffer.

Let me know if anything sounds off!

Daniel


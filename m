Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E09440656
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 22:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788387332; cv=none; b=pZ3w8BM853s0SQiHjHYYmG32Kb9j9RC1KHA1fZy44UzvjeDnAYscqvXieETo2/N3cEiWc4QVtcbz/QBDpyYfw+f1IctoB6FisgZ1u4xUVUnqUsbcFNkgakV5wmoJ6QaWmsj5d+J8b1xu99dCwyfZisdfMlwS/1hupiXk8pCYxLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788387332; c=relaxed/simple;
	bh=HkFAbO8MygqvyTuNPvM8c2JpQVjswNB1aNAD46Eofxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iQGwdOxbu8HUfZHkE/Yntyi3u2DmpOyIQfZllUFoXm/nDo2HIN6ooPSytSuT2fwd7qTkPt3JKC2pqswuSWCTRYoQuoYWroGCoWQuXnAYxQsSRg79PoCVfWNoU+RRVSBPKTSF3ofMpAF7UjmRgLXyd7GqfW+qIBGjMOpb8xczb3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1126310f8f.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 15:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788387326; x=1788992126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+vEOyqPDv7rU89jwmnevj+9dxsKc/yKY2uAhwHha8M=;
        b=dVptsSPBOD2AcEnrN9rQsKS3Uk9YeKAfgPO/Hz15UZxXED696SKvg4f6efpIM1DW4u
         wcq5IenQ9BUU82bwqREXE4P+iUD1MoMlccSW3kJplQH/6ZxsjW8eVhFoTbepKmM5W+2J
         vfFAr15f2Intm8kwpRHWtI/XxcDoNYwuvGvqEw6kNB9hshBAnjx4T1JSIiE7OtSW0HL4
         p0aARQPca/piD1XQLvvxctf6LMyFSuoO4DgxUUvjyEfoNoEMMRVoVma3Oe66uDPAYMQd
         c2YaDou4kbEZ+cOmv9HxcrfNjGVQmQP8HtlF9vhO5FHvoLnH6JNlF2BqQo+20ZIEFHKH
         nNEA==
X-Forwarded-Encrypted: i=1; AKwUvBx380lakohIE+YL4L07k6Kmr0mZdDr/0BSGcYBBYv1rlUsHGKphCk4VMHGnXUWCrEjtuKqsIssQYsvM@vger.kernel.org
X-Gm-Message-State: AFuF++kGFh57yeTwvV3wEUwh8K7/JH8/Jhj1/xNrK+h9KHfaJO9+9jkb
	sZttnvF3QMAvbGGobrIqfV+X3dPH1i5/trGEo0FiNn+DY9drgCpT4KeN
X-Gm-Gg: AYBFou1LgjQ3E4kv//MghWr8VmydNUaaadNAaCO+hbzdtRElyC8vY/h8k7FoW3wCGz0
	hhwRh9pZpZHeUnLWdZLMjtGrdxhnLI/WIdVydpQTTtGFXGk9A3tZ6U4hsA1WStFEnYG6WRKRl5B
	tswrx2Ihr4UBSnxsPEpp+zZtEZK7ybX8iey+Nq6ZFMOGrYM/7k6VDpH5fBVDSrc10T4pA7AH/rX
	gQ6t8cPC4/y9I/Yf/rmQByUWHdiRWim86fqVqkjTZzy/Qv2ZhDVHSz5fBUKHqiZgF2jYB0E54fE
	MGckIJm6x56z+ZqNa2t3b/IB2tipHMXsF1l8XfbRI3SPiGz9iy5LKlW2xRiYeHNARL7ugnlIjlZ
	R0BK97k2sFUVEC0J/xT1PwdU2IC2E5ca5YAVL6gjRs3U2oMgQUrWLcdXFpGjWvOvmOSjvSzD3x9
	3QBdS0D4YdaBUcJqRqEHHdS5uSy1a8cJzfMx47K1klqfksqz8gp8hzl3sJn+rcdqU4Q9LGGH4In
	LGh3HPegE2a4wflW20wf3J0N7l2t5GyRgO7gi69YCCCgoWEsXE2vG+MOjnkAK32nVC0Q/WRC800
	b1Q=
X-Received: by 2002:a05:6000:4208:b0:484:4769:18a4 with SMTP id ffacd0b85a97d-48488f10236mr16624383f8f.14.1788387326455;
        Wed, 02 Sep 2026 15:15:26 -0700 (PDT)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed38cfsm8301961f8f.19.2026.09.02.15.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 15:15:25 -0700 (PDT)
Message-ID: <9bb0ee66-d313-4a07-af4c-ffd002b55dee@reactivated.net>
Date: Wed, 2 Sep 2026 23:15:23 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com,
 james.quinlan@broadcom.com, Jason Gunthorpe <jgg@ziepe.ca>
References: <20260902-bcm2712-iommu-submit-v4-0-9dbb657578c1@reactivated.net>
 <20260902-bcm2712-iommu-submit-v4-4-9dbb657578c1@reactivated.net>
Content-Language: en-US
From: Daniel Drake <dan@reactivated.net>
In-Reply-To: <20260902-bcm2712-iommu-submit-v4-4-9dbb657578c1@reactivated.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2026 18:57, Daniel Drake wrote:
> +static int bcm2712_iommu_blocking_attach(struct iommu_domain *blocking_domain,
> +					 struct device *dev,
> +					 struct iommu_domain *old)
> +{
> +	struct bcm2712_iommu *mmu = dev_iommu_priv_get(dev);
> +	int ret = 0;
> +
> +	scoped_guard(spinlock_irqsave, &mmu->hw_lock) {
> +		/*
> +		 * Completely block DMA by disabling both the bypass window
> +		 * and the translation aperture.
> +		 */
> +		bcm2712_iommu_writel(mmu, MMMU_BYPASS_START_OFFSET, 0);
> +		bcm2712_iommu_writel(mmu, MMMU_BYPASS_END_OFFSET, 0);
> +		bcm2712_iommu_writel(mmu, MMMU_ADDR_CAP_OFFSET,
> +				     MMMU_ADDR_CAP_ENABLE);
> +		bcm2712_iommu_writel(mmu, MMMU_ILLEGAL_ADR_OFFSET, 0);
> +		ret = bcm2712_iommu_clear_and_enable(mmu);
> +		mmu->domain = NULL;
> +	}

My understanding is that when the IOMMU is enabled, the address cap 
represents the highest permittable memory address; requests for anything 
higher would abort. So I had hoped to achieve blocking mode by setting 
ENABLE | 0 in ADDR_CAP, thinking that would set a cap of 0, and hence 
memory accesses would fail.

But a Sashiko review pointed out that actually this value would produce 
a translation aperture of 256MB, because of the way the register works. 
And I confirmed this experimentally, Sashiko is right.

I also confirmed experimentally that setting value 0 to ADDR_CAP (i.e. 
dropping the enable bit too), with the IOMMU enabled, results in a full 
unrestricted bypass/identity mode.

So unless someone from RPi/Broadcom can inform otherwise, I'm going to 
conclude that the hardware doesn't support blocking mode and remove the 
blocking domain implementation.

This will cause the iommu layer to fall back to creating an empty paging 
domain when blocking mode is requested, which seems appropriate if the 
hardware doesn't offer a more direct way of blocking all memory access.

Daniel


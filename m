Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809393;
	b=YCOK8/3LmOGzkpCi7OI4krqAA9t8Jaa5exJtkDfVPhLqrSHLUrnDVaoN5v5Bq4adMofV
	 LKqpNvzLxY1PBk3owfZtIZrZ5W1lJLllf+vgAyWxPmv8PE86QbgRkQWxKXk/Cn6nuz582
	 KPJpH60XFu7bEJvG9K5HJGIlUpiJ/Fsr5bpbWVKSl6nQbX4mJ8oeI3UrFt5yfMb0QuEHz
	 i+KoY2BYHN2wx94jL4I2u+H6st2LnCSmwszqORWKO7uOdKQR0Rx4TobGUiJ3Vd69w3cqg
	 L7AWMCwSbnbnIApJH7UxThvKPfKCqx1PhISLjCsazb72aMWPi64A3ceRmcQKke8pbSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=vocGYEw/5tonadEsgL+tN2/v9RawaaHXU9Cku3rNbjM=;
	b=O34byX0W5FAs253nc59TKXAu5H8EaJVSbcK+0WCyBJ23G8RMdbcdQtsKxgkKgEPqixZn
	 Jj9eUJQG8/wqP07R2LxpAVqpcnn035nUA1mdIPfUw3JFK4DsjT4YFfkSP4ecacLXzwyKl
	 hJ4EoxyoHbfkQl9NM0GsrgTLAVR6PUVoizGYtAa8AeLVzyLAkwbO3VsKLhETQWYkN/8S/
	 peB3evmK7a1KM7vywj0G+dmmRS8vvA9+VVokB7dk6KvDdM9Kubnd6Ha0quzVO4iVWzCHY
	 7usx5ImxXuPB3yqZshYDEoJh1XDKLpVl2LZQ4EVtfMTD2/l0anZd3gOpdHthVp42hmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OfBHQzq3;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CE4606D80B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 16:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39CE4606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OfBHQzq3
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so12182575e9.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 08:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793809391; x=1794414191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vocGYEw/5tonadEsgL+tN2/v9RawaaHXU9Cku3rNbjM=;
        b=OfBHQzq3oKvaoOFRoHZC/AgPU6SHQTh8Tn5idn471YK/WW7khloYoayW8Miad1hh/R
         KTc7jor1qVubUrWQg5V/EQUqhjaIYEmOPlcmCvmduK0bPEG+qH0SofyMwQhX1qq/jLD9
         Ys6NJrQnAvEuV36Z1EOknH8puwbPth1kq5JCukPwMIFTDJZuDZM6V1lZmTauLqIOgglP
         ItOQhaGCEgY9eyhrxBcJh6mK5QNpkHYUjVc0vWfGL8qNUakZeutNp21/PAUmX/S7c025
         J3X4tZ3V3kfN+vE74GoZsRwqv2GdRW01AmrkMZ2nVZgQwm5fILOeSN3G7j8TlKScH5I7
         BYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809391; x=1794414191;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vocGYEw/5tonadEsgL+tN2/v9RawaaHXU9Cku3rNbjM=;
        b=nIbz9kpwli6etZTj2pbkW+FhW5Z2j/ftSmN8Ccq9KcCsIj6cK/WCYFqs7JZQcqKQna
         SiJPB/bM6AooVJhXnU+5VptrRIZZqswZ9fLuQk4A2ADYupsUfAHAukPVh/IoTAZOsNFW
         drqm2onBL9xwbC6fH8CPEOmPCPrFY1Kv/oefLlvqlyOVlv1KxYU8RqoH6jwaw4My9qR+
         lDaMU+uGqgez48UL5UKFBiGQm/YA/NWaVwRDjKmf1sqngZVAr4YAD+h4kPjUUnr49W3/
         Ayd6wlWxQg40FbX0/B6TEMAXn0wjvPBU4uWM1xRzb4kGaKsgfk9LMUhzyBaLfbb2LRcE
         YWnw==
X-Forwarded-Encrypted: i=1; AKwUvBxe+ForTdNfaO2aFf0aRKZFskvLt2bpuZM25NHUkM70GbwDqteQlYlJYwyQ8Sia0DPr1wdoSYOoZZpu@vger.kernel.org
X-Gm-Message-State: APuU4Z9Tst1RmsYfBMHgHis3542gT5/DQ21LHErRn3o6G9t41F8o+s4A
	iSStP7H7PkQI2hY7wL6+5ZYy/eFTSFPZIcNkdzj2pNDWAnhvNkXEBNiGPOb8LRkuAs8=
X-Gm-Gg: AYBFou0oytuFt3CEyeNYFhckVAlrvTWRj/1eQm9GEy8eCvWoG5qHL++r/0/HlPTSiMF
	ilv4VWUtJltqtjH5Hal/FgJKJkL2ykM/ATYIY21CvawXrJqyEU0TjeRG/jJrXv/NUti1dUViSbU
	YF9j7FDZE/cYcYHDzMIt4/TiL/O+Bcgc29gLHjSnM342L4JrLe3AJVYfgWrmHkexaKfeo3UFuMT
	c9a4Km2jDXRajwkYGhvl3KbsZEGSLofP5QfFGYQz+wQ9s2Mrru+AaUr0ImzRou+spfobSxNeMzM
	HTyWMMFQxZS8oLzQ53XHxDcz1Dx8SmBtgGaiZmLUnZRdZRhhEs3ojrtFrRGoklN5u6GT0QC5m/3
	bBnucQiGDWie36Stlc8kx5K2MKe5DbAtkPWLddiFH/o734Ch2QgFXO1lSwTQ7Hmi3migrl4JE2/
	u62Akd+qGPcVYYGdzP2Y0Jg4mjTH14iKZtXN+9qfEXogxTnkOHp6Oyk5ie9tb23x/icj7psCkuD
	CIqdtlBW3DSBf9QgfszgBkzabSQkEU7pu4y3En5UuaEBPAExOtXLi/7hmYxET2711yAcZAZl5+U
	1p1xple7EPnqWN3zYB0Nl7yyIMwUQRpvqtuIcCaw2g==
X-Received: by 2002:a05:600c:1907:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4b55c8743d8mr75395e9.3.1793809391436;
        Wed, 04 Nov 2026 08:23:11 -0800 (PST)
Received: from [192.168.0.167] ([109.76.163.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a80e0fe6sm168477495e9.1.2026.11.04.08.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:23:10 -0800 (PST)
Message-ID: <f416b51a-0775-4834-9e1d-af8a72d9a1d8@linaro.org>
Date: Wed, 4 Nov 2026 16:23:09 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] of: Add support for "iommu-ranges" on a device
 node
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Vasant Hegde <vasant.hegde@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>,
 Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
 Eric Auger <eric.auger@redhat.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, devicetree@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261103-add_iommu_ranges-v6-0-361f3921a133@oss.qualcomm.com>
 <20261103-add_iommu_ranges-v6-2-361f3921a133@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261103-add_iommu_ranges-v6-2-361f3921a133@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/11/2026 15:29, Vikash Garodia wrote:
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index 5c266511db78910d6fd221af5437cecff4931c22..0428ceb50dec58f11872b4fb64e283fa8d9046a3 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -185,11 +185,118 @@ iommu_resv_region_get_type(struct device *dev,
>   	if (start == phys->start && end == phys->end)
>   		return IOMMU_RESV_DIRECT;
>   
> -	dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] as reservation\n", phys,
> -		 &start, &end);
> +	dev_err(dev, "non-direct mapping [%pr] -> [%pap-%pap] is not supported\n", phys,
> +		&start, &end);
>   	return IOMMU_RESV_RESERVED;
>   }
>   

Same feedback as @ the last version of this.

I still think this behaviour change should have its own patch that 
preceds this patch so that the logical change is clearly explained and 
understood as a standalone change.

Supporting iommu-ranges != not mapping misaligned ranges.

Otherwise this change goes under the radar of the new functionality 
addition.

---
bod

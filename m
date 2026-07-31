Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7C93368A4
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 20:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785530048; cv=none; b=CoaNKCyeXKVggZ4xs3U1YvCdaWibkmKm15uzakG975S4A3qEAT7XbYHMcLj5Tlb1WgJfgk2cEDOswAJ2tEAleMRSsiHMS7PG2Uifs/nHCP23ze4rNBlmr+3ZILYGDBPiHVHU2yZ6V1YayVTukgRQlGJ4hd9+4c7/LmioJDawWrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785530048; c=relaxed/simple;
	bh=NXZDspMbrOv5vkONMoM2L5ggiE2EAR+AQYiQEdJNcHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fZxvxlpLFst8Nhwz8BuH6ffU/9YYe/lxuCm4Gj249TTqsN3lLDWZwTPCqN42nLHmyMrnuuaAfYS4F5TuhJC2kAnbMgz1nMxBhvxIx80ssb9exOoYZzDsVGtotW7jmpSPB2ICNmoFE+6YRPNGDNhZmfSAZDQQMVsOyHP+0o9P/Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47de008b020so1045920f8f.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 13:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785530045; x=1786134845;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Se3TlLpuysYiEG2DYm26v81iW1ITt60yQ73LdmliEgA=;
        b=asyiRQq1zRDlKuhgW9WM+1PyKxL8kt1VpgfqxqlDCopobzq72XCdRJtQ5lOZVsZ26T
         G2sKfXa+h3jhMeZi8IcZH8lz9ZWfLHdw7ZkQT77/bQOVzJtEJjGnOrVFc8l4ONrZOYYN
         6PQj1kpox61jgFqK76nKvhO6KwBxHOvakyD1KKh2zewfPvSIeF5HNridGvVXtwvX0Wfl
         SJdoMNX0RNsQ0rYRUDGpZq1cs3YLsySMbs1fMP4EKk1WqQlfXVY3BF9TXRXWrzoLalW+
         qPitWxacGDLQBekBvgdWdILNwYw/i+icQwpG4yHrDepTzJIZzfvnqrM0/LHOZ/RTYjLO
         ivkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqjsf42+qvZ9RmLJRIz/0+lzRqSpP0wuvlfjJqwMoeu/IMP8SX9JpEMShBBT1Goe2gfzzaLhY1LFcy/@vger.kernel.org
X-Gm-Message-State: AOJu0YyHf1U0T59UH1klCxA5FH8in2HZ61J1F+9ugWJinqFytE/wBBMe
	J6bLaXMsYqMT/UPtav50v2VVx9PU9w0xkegwLN1nVRvOv8deEhjQvgam
X-Gm-Gg: AR+sD12HzABWoDuFMmzo1W64CaNK42lSPBIEQaOjpmSyFwou773Gw31CdYQDuwl8XJ6
	DGbtAfC7G2uwrX7Baz3a4T9+tJYXCO7tyK0IkEgX9UYSheOJVtYfD4+dNn5q0ebsGDCQq1fhnRW
	O2UrEl+epVGvFBsil0CXpzTOEn/iOkerI4qk+NyNyHEh7EvG7kNo4PjJJc6XUDm25LpyAMg6pMh
	JAJgaEEkLYMYblECt0KzOlSaU+lTk51GnW67N8DkmyGuhtqG3FUFomrlwEFo3z8R8VK2NOSaiqk
	dCmiSXWIO2MZDtUFibfp3AkPZGgrLinpUMynpCQ7o93ABY8PtiMaf4jEvvdhTJjplh7wNo+wp/M
	sCo+HZ6upcWwC1Z+EGHHS+bz7Iw2kv6ios1JojvhSaMlBxhUTq1UU6HFh5VQxM1WRDVsF5U6CYw
	vKdrTJN68r6isN1GB8ccW6np7QmROxa3TIvM+kQDpQwfXT12cce54/kTRvQLDF1MnhzcZ3060Cl
	ZitQLB8L3R5ym5FDH5PKH22xlO+logWTBRCcKmZZW16OIJW/c7R7w+IJHqQUdRg+HY/
X-Received: by 2002:a05:6000:1846:b0:47f:6e8b:699c with SMTP id ffacd0b85a97d-47fd729208fmr2040027f8f.14.1785530045266;
        Fri, 31 Jul 2026 13:34:05 -0700 (PDT)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm9618856f8f.19.2026.07.31.13.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 13:34:04 -0700 (PDT)
Message-ID: <6d9b28ec-0905-4cb0-9a62-980c7fa69572@reactivated.net>
Date: Fri, 31 Jul 2026 21:34:02 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 nick.hollinghurst@raspberrypi.com, Jason Gunthorpe <jgg@ziepe.ca>
References: <20260727-bcm2712-iommu-submit-v2-0-0247b5c03de8@reactivated.net>
 <20260727-bcm2712-iommu-submit-v2-4-0247b5c03de8@reactivated.net>
 <20260730-small-solid-spoonbill-8a8bbd@quoll>
Content-Language: en-US
From: Daniel Drake <dan@reactivated.net>
In-Reply-To: <20260730-small-solid-spoonbill-8a8bbd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/07/2026 08:00, Krzysztof Kozlowski wrote:
> On Mon, Jul 27, 2026 at 09:43:59PM +0100, Daniel Drake wrote:
>> +static int bcm2712_iommu_init_cache(struct bcm2712_iommu *mmu,
>> +				    struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct platform_device *cache_pdev;
>> +	struct device_node *cache_np;
>> +
>> +	cache_np = of_parse_phandle(dev->of_node, "brcm,iommu-cache", 0);
>> +
>> +	/* Fall back on 'cache' property used in old/downstream firmware */
>> +	if (!cache_np)
>> +		cache_np = of_parse_phandle(dev->of_node, "cache", 0);
> 
> NAK.
> 
> You cannot have undocumented ABI. I asked you to drop this at v1.
Is there any approach I should consider here in order to support 
existing shipped firmware versions that use the 'cache' property, or 
should I simply break compatibility?

While I was working on another issue recently there was a lean towards 
supporting existing/wrong DTs at the end of
https://lore.kernel.org/all/878q898ulx.wl-maz@kernel.org/

but admittedly that case has some different parameters: it was incorrect 
DT values (not incorrect ABI) and also was more severe (breaks boot). In 
this case if the system were to boot without iommu support it is not the 
end of the world.

Thanks,
Daniel


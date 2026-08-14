Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1C246F48F
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 16:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786726528; cv=none; b=f1juy7Aj6A4+f02kSA44rDsl8Ysz3cJNSp/OTvLOCvcpWGBv0UB4aLUKlspPdqeGSRHC9OJIjR57p7N9Cq4MnzYFUOT1/235s33B9G+BFGa7ia8GWCpwvJSIj5okJpSZd2EmcV88CwqA5DFKeAf4WWErUQIAlMu6adsKPZVOkrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786726528; c=relaxed/simple;
	bh=WqmD5hXYOAK6kBvhlyX9kY4EFHWaHHEjeY00+AR2Vzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Op4WyIZG7AnS9tRCNY1VocLYKnwhtGNGvZxBPhH2DfwxvQwyR4tY4Um4syyRY31bR4l7h8AEanGlILNJalemCSfsYt8LaNUCsKgfXhmRBGup3T5AP5ShZIiyrDpiLROxLwnD6OH09hj2RxSt6+2RRFy6ZoWkz86KvKQ+cAkz/1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Q3kJfHfE; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Q3kJfHfE"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c2a76536bso12834131cf.1
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 09:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1786726526; x=1787331326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MBdDNyiCPGHvqfQIw5TnuF+7Orj5dVBLCug+K5ZvgvU=;
        b=Q3kJfHfEJlIWB0LDUDyD+PHkvC5HpNL+bUBXYvoAEGUF9TuDCgno5MFbIXWwmtggbg
         mbopcxjH3wNpzOzHVLKx6+Y2WNY7WNn9AgzPB1PM7ChF9s156zoEh+ejU6ifz/bEnztS
         jsEk6hlg5HiAIgVYE+EcAMef8csKoJ1My3ro4Z2yFvkG9oK38vkgSFwBdl1JGV6qiykW
         oQq9rFW6XN41kBEiEK83xKmouDYEtI1pbhSWbnEl26SapwoYS6rl7VwexiSSzVU7sWuU
         0+ycPJme4DfeuChclO5WWvoiL4XNk/KS3wsrrQS5zmHqzmQ/GXKptFMrf8A6L9AAsFhC
         kWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786726526; x=1787331326;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MBdDNyiCPGHvqfQIw5TnuF+7Orj5dVBLCug+K5ZvgvU=;
        b=BTrepi7ej1IaiMNLQjMSslzRh8G2OwlLQnqSb4IA+4/xWhCt9xzDv5yP2dVYR3UHWU
         SvFcVG1TAgUYDWfpO2Lhk9HWIXrhTL2l3G7v8WiO/2yDecrEI9r+3yjMyQUFoe5LoOFe
         IODenuk3PnomYPDRNWSeIcaskjM+wmLE88kj/4pco6uTErDifdsG00FKTWB9iAT7nl08
         KZchT0XxCZqh8A+FcnGA2FURG5L5nQbT4EQunEFbhkIvjdD7xFVtv3UcFkbgcrOHGGAm
         c+FInguug6qzQSQI5i2d7hAvecWgjMIsO+5Ej0Mv9qrUSKBnuDVAODPGfFGaGZC5Pdpv
         BhEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9+rI8mcNpvuJiaCu3LM/Ojrw/PWOftg5wZv2Fy890afmvULAzSpqZXaf9FC/7l18JQopLmVy7L3RV@vger.kernel.org
X-Gm-Message-State: AOJu0YzpkxHG7ymJOor9+1T14N54JCS+Em4nxFmUxNFkVAPS+fn8KSyX
	LAcuIl1eoD3/rBLV24ggp4mFVmWa2+dhzA+fTSFDUldCdPXtl4h7SSpHhC8E061+Fw8=
X-Gm-Gg: AR+sD13/a9pCvJO7jvGKPTaL6Y3R3OMMx1OIsbbWgiC6ydYssnQ8mX/MeSLcRXptOu1
	e/sDZrXxo5Gb2lY+sGFZpBRSCLo46lFsqNey/NACyJ7NFqi4XJsc+mlea+h3zyY+hXKTktStwTX
	S8kXEaGDbvPTKwDlq3CdPQNNl5nsznbazdjeev9w4mjtu5xzFOi3/QZYwDNi/br/+FFApqerF74
	qnFJp4eTQMFuvLHO9jQZzI3R7dZxKHwfE5y0FegW6XRTI4H63upO4u3EPdq643hbPo1sZiBjjqe
	Q+vIive3xeM16Z1sN0Af7dxveoxBI8d6B/euQ3y6ezjbmuT35bAm4vp5okRpwpf0OKXj8sktwri
	bn3ccpXvUY6PP/3qRjtleIETxCzb7wWcUhAJNvKi+NVuiBPgsw8AZBjfSiNLdvJJonlhsheQp0x
	3j0unPJhi/iDXRfEE3wRBJ6+yMjbOYzAVyqfgI2qsnmR1rgpEhvQ4ALDW3JJi/Jt1DXalz7EM=
X-Received: by 2002:a05:622a:409:b0:52d:844c:b176 with SMTP id d75a77b69052e-52d853c9846mr76430861cf.11.1786726525996;
        Fri, 14 Aug 2026 09:55:25 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d84071799sm24476161cf.20.2026.08.14.09.55.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 09:55:25 -0700 (PDT)
Message-ID: <8c33e30a-e35e-47d4-a851-c82e18ed7472@riscstar.com>
Date: Fri, 14 Aug 2026 11:55:23 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: misc: introduce pci1179,0220.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, bhelgaas@google.com, daniel@riscstar.com,
 mohdayaa@qti.qualcomm.com, lbiancon@qti.qualcomm.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260813222943.1655453-1-elder@riscstar.com>
 <20260813222943.1655453-2-elder@riscstar.com>
 <20260814-deft-unnatural-teal-1dbac3@quoll>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260814-deft-unnatural-teal-1dbac3@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/26 2:01 AM, Krzysztof Kozlowski wrote:
> On Thu, Aug 13, 2026 at 05:29:41PM -0500, Alex Elder wrote:
>> Define the binding for the Toshiba TC9564 PCI endpoint function device.
>> The third downstream PCIe switch port within this chip has an embedded
>> PCIe controller, and that implements two of these PCIe functions.
>>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../bindings/misc/pci1179,0220.yaml           | 150 ++++++++++++++++++
>>   MAINTAINERS                                   |   6 +
>>   2 files changed, 156 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/misc/pci1179,0220.yaml
>>
> 
> There are no properties in the binding except standard PCIe ones, so why
> do you need it in DT in the first place? We do not describe PCI devices
> in DT by default, so you are doing something unusual. Commit msg should
> explain that.

Maybe because it's using pci-ep-bus?  I'm not sure I can answer your
question though.

An earlier version used auxiliary devices.  This time the PCI device
sort of stands by itself as provider of the endpoint buses that are
used by other devices within the SoC.  There is otherwise no single
driver (e.g., for an Ethernet interface) that is implemented as a
PCI driver to bind with the hardware.  The SoC drivers will all be
platform drivers.

If you don't think this is needed, I'll gladly accept that.

But the PCI endpoint bus is a devicetree construct, and it seemed
to me that using it needed to be documented somehow.

I'd appreciate guidance on how to think about it so I can document
it properly (or not).

Thanks.

					-Alex


> Best regards,
> Krzysztof
> 


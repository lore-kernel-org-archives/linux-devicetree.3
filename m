Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE8748422C
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 17:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284757; cv=none; b=LDIa3Tf5Qbr1ImFv9ypyINtmGkq7HDrfUEIFuXo7+8EicNBMc7v1al+nzSEa+PhRlqh8GJ6yigV3faIcY+isCCcn27Ny0g2ikPV6ZJ5PkUjTuOLrecrpvGYvXNBRxbI0baSO4Blr6TXUYzlV8L7c/MHnFqMFx0/QSFJKmPCtW6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284757; c=relaxed/simple;
	bh=9gN6qw0vJ5l/AthNPXEYu67DRbQvRWzAXeVYsxWq9rA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZelmN9BS0VYbWRo1o5ZwKMFd57cRGmZwV416L89MXIeeUeRByiqV94w2v7UVOM1QP7HNUVTywqsW/8psy/R1HxkJ4Vy2OMZIrPMW6z8AMiL2wXMFXsRyPh2rrmvXgfbIxJ2/qCArTGzfbCRA47VR5w2uYeS4FwrelpppFQm+Uk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=A+Tu2Jwm; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="A+Tu2Jwm"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-90cdffe8e3eso1203106d6.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 10:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788284754; x=1788889554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4urxLv//MTT17qiTaqXXkanTI4Y6EUbnjG2xxOzUII=;
        b=A+Tu2JwmRzwLsIyfaEWXm/AR+9yfKE9Yd6v/nZOcLKxuhXSmvGBES7CONeoXhvDPeh
         Jg1C04FjXvK3QrtRqTZ7DlzcAR4lL/bt9Z/wxgZxuy2kqsqGARVD+XY7bb9SC71ZJNnu
         O6KcTGnkBa7XTY3fEBjdGljMRQTqzfzihPfYfBwLw3vg74YjY4Wz1R22hlpRECi+4uvL
         Q+Gh0RuW7Aj5/aLnHq5yxsXmc6As3tfmeZciQ/3UvHfc1gNYLulj0/UlH3lIs9uVqbpr
         ePRCQhoO41YfIiAkH+5Cqqm0j6AdnNbV5NVwsFkofDoYUX2TpfmFATTSIQsPirrZ/H2b
         Nimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788284754; x=1788889554;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/4urxLv//MTT17qiTaqXXkanTI4Y6EUbnjG2xxOzUII=;
        b=P4XJX7zCbHqmtAqt4L/bWOj8lQQ5DT32wXKIrVhLCfql6J+ocCo5vDq8dNXcV9KEne
         rsz866RsIQTirvc2zmKtgzSZyESkg3B2A6rwmbo2WSU6Lm04jbWl8HSF3sYcwY6I4ENa
         R4w+TtLrluT13vsuGmRbV3S7ey7DxS2xNaV+5phqNSX7FTV9Rw4oUFFu19F+meDcqVj4
         U06dB9BzkzVHWoUjmbCHpoM2JyDrBzAXZu23VnWFUsaEYSIIxf97TWzZEDd9hQM4NX7v
         CV4uDu7n+6ueGcP1qkqGNt3UCzZwf/XewFqiU7JJqh1CCUXh7aGUaxhmCcJB4Z841E0H
         GJxg==
X-Forwarded-Encrypted: i=1; AHgh+Rp6KxbsWpEk0x+sNsKHkbZhVhsrnKmJEqh5EXY5WQLyzM3cQGO7houSUmu9XgpSWRQdrO7CPuFe3o8a@vger.kernel.org
X-Gm-Message-State: AFuF++nqCKU+dr0ecN3vgTfPcamgGuieIGIAiKN0VPTZrRMNiD3Eps6Q
	yB9tuK0KiUx6pgD/xn/U2MEebCL6ohASMPzlzLpal+RGOdYAE9oZZFz4hugD95lNKCslsbNKcA1
	jtv7IrZk=
X-Gm-Gg: AR+sD12Eopajq6R/syNFdB8AlW2TCSDKWPvWHc9M9XdoXbBvFL5ydj6tOcZaczNbdwG
	+6bhUQKFrM/t2+DV7RINA4E8OnryxvYFlq1jKRWSAq+Hb4tMKOet2J+UmLjUG72y86xz7OvtKsP
	ANnaEi9/km1COCtcGY9znhxJkhmnuak9KzzRF2ePBkwbQCub2b4DmmD4ab/xqRlKJhX/+K4M8nL
	oa2v+5uVHQC7XjT68hSWJfekULoFoFxKjvZHkkxUIEe+agUDuZhGHoLESuV752HVcxjEOU7BAZl
	qrxExb0VcQ0xQq57YrvOpYib9k4ywlCwE8cW7Tr+tIQR62/1sVHKnK8TlABObuYzQcYo7WzABdy
	Q6Lzm4GXYXTUnelFKsI/bVEdj1bsUBCIG/1gQ0uSOBdB4ky4WtDzcI5BRdwed6wKmJPQt1BPPIk
	WtWhjISFeQNVJwPehAreffgUn0N7q7kZUQi9vSMQeH46M95cqPO47YkyaTy0Y4
X-Received: by 2002:a05:620a:7103:b0:939:4890:98e1 with SMTP id af79cd13be357-9394890af20mr1322529385a.42.1788284753970;
        Tue, 01 Sep 2026 10:45:53 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939173a735asm1080527085a.28.2026.09.01.10.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 10:45:53 -0700 (PDT)
Message-ID: <04549e98-7f05-4d2e-8b08-d42f44c1daa4@riscstar.com>
Date: Tue, 1 Sep 2026 12:45:52 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: qcs6490-rb3gen2: use pci for device
 nodes
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260901172058.1512508-1-elder@riscstar.com>
 <20260901172058.1512508-2-elder@riscstar.com>
 <20260901173941.294E01F000E9@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260901173941.294E01F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 12:39 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Conceptual Flaw / False Premise: Renaming the node does not prevent it from being treated as a PCI bus because `device_type = "pci"` is still present.
> --
> 
> commit 3cd795cb2f33ffae376d5bceb9ba0da490602d05
> Author: Alex Elder <elder@riscstar.com>
> 
> arm64: dts: qcom: qcs6490-rb3gen2: use pci for device nodes
> 
> This commit renames devicetree nodes from pcie@ to pci@ with the intent of
> stopping the embedded PCIe endpoints from being treated as PCI buses by the
> devicetree parsing code.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index a13315bf0fb07..99a985a177a61 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -954,7 +954,7 @@ pcie@3,0 {
>>   			ranges;
>>   			bus-range = <0x5 0xff>;
>>   
>> -			pcie@0,0 {
>> +			pci@0,0 {
>>   				reg = <0x50000 0x0 0x0 0x0 0x0>;
>>   				#address-cells = <3>;
>>   				#size-cells = <2>;
>>   				device_type = "pci";
> 
> [Severity: Medium]
> Does this node rename actually prevent the devicetree parsing code from
> treating it as a PCI bus?

This patch (series) is being done separate from another pre-existing
series that addresses that particular issue.  I suppose once that
is merged I can re-issue this one.

   https://lore.kernel.org/lkml/20260901013654.1343537-1-elder@riscstar.com/

It looks like I might get a similar comment from Sashiko on other
patches in this series... I won't respond to any others unless what
is noted differs from what I've explained here.

					-Alex

> The commit message indicates that renaming the node away from pcie@ will stop
> of_node_is_pcie() from matching it. However, because this node explicitly
> specifies device_type = "pci", of_bus_pci_match() in drivers/of/address.c
> will still return true immediately.
> 
> When evaluating buses, of_bus_pci_match() checks:
> 
>      of_node_is_type(np, "pci") || of_node_is_pcie(np)
> 
> Since the device type is explicitly "pci", the match succeeds before
> of_node_is_pcie() is evaluated. Should device_type = "pci" also be removed to
> actually prevent this endpoint from being treated as a PCI bridge?
> 
> [ ... ]
> 


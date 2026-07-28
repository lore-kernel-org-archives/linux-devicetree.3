Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4E9372B50
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 16:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785255632; cv=none; b=YHRThT0wRDb+sf9MHmQPCk2rsnGEuTrFxo6Ct+vyuvkjjwnRFGNBqWo33CgYNm2yV9UI3LFbQ/Y8cYFGNrvCF6n5ht+95bmV6o8zvrZ0yee879bbcYPk22GL4m6LwICS0qAC6a1aOPvBhtePBy5wFM4RWWBwZT4W0fqKGg2Dvyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785255632; c=relaxed/simple;
	bh=aRbhOWWtpMQTr1NddZX+RUNWSFdiTv1wf1seseguq4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IcN5SxarGnG7H10XyNwRXoCV2H7wBVzfy6gT0t0+xV6I9IsvjJvOWk7FgKMIk+nrFB8so1kc7w6tG1qV80MkchriYaXFse9y9uggdxt+QLpWPkKmhmcFvkSmosqpLdtprQomiGON4VmW7ZlKyK3EFLXl+tdZplav05FOVWvdRPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=C5HdDrqn; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="C5HdDrqn"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2cace91f112so1157455ad.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785255630; x=1785860430;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ldrGXYVfZqZof6XV0b95MEUdQpAbYXx4kQK0AyVaZ1M=;
        b=gDhBebsAdkT7nIUEqteo3xF7WgD416fZKSQQTD5j5wVuOWK9uzHRu8YHVeeSHeiyEP
         r+Lst/+R7Sciwsb0YefdYsPQ6Gh81il0jVmfq8Wu23UV0bXhakIWiJGtKFDqKoE3HFcn
         sCRxJKdgQGH/n1sWeDfMESHejBih1kPcwPeHwX1RWrkjH7eVD+sfobO1PTds/dUgZ85l
         pFnp1Ab9syBaDekKb8XXDlWUDszI7PBB1sqwES+yJw9bLjmsslpeYwROqvizmxGjxXX7
         ExQaH5sHBNIqcEbFDB5YmX+qFTWLc7Fdka7+1NzxohssrBaImZf7b4arv0KrXDu5dSC/
         GL7g==
X-Forwarded-Encrypted: i=1; AHgh+RpIifBF4kp7bgnsvz1cM+TDkXRXgFrWoTL4jKpjp5qonfEO8GvRuKeyUCpR2ISRAJfAoW0UzlQaqivX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw38PQRSmmhdH8F2aRVVhVfQNp1p2DekIdY1ZweCX5Vbdz6mdDY
	qojXwrT/U2LZICQGw6N84JO0B07yRToXIXf+PbFWfVqZrCsXpPGfSi1noN3AU9ou2jfDXkn3S95
	kX2607MgMQIG/gaJVgNgbygLnG86g38OOtCTelWhaAxEM1LFH9Go/5Yp706QyEJiFBHjp8hWIgW
	AmEKBMfAyGIbG0gvK5cHDz7FWf6Nu011fC+AOH8RoY7DVR7uClZBORM0Yj5qeLbDeTOkDKLMKfx
	hheIWnBS4L6gFpiGRzigQ==
X-Gm-Gg: AR+sD11ORDKgv7/pmm99upOJeXzAnWMHNk+A1WKIJwbkEBuwCPDd7/umxKvfPi7Hwx4
	F2FQ7VYBnHe/hfAvoR0OhbJ/leGlX8BzmOHs34Gj0poMU3yUDbCU1XZ3Xzv2SXulnLFpMaPLE7L
	u5jqOKh05Vr9xf7t8Eftj9KLDgpn48+91646oIiuAnhbuAqhDbcqmt4tBjWuK8LSlN3k1ps0c5B
	z/VdpWjW1Kjf+sMbhWpTqtHXk0iXpe8eiVNSncfOFfXDvnG0YpDKoVQVSK+yIfvigUReL8wF8th
	vNII2Ia73rslf2b3gTAIMCHOYAizBwEJaAfGr2xaK+0h2LYZJbEgNY3v3HdlN6Vbp+1TN+7Xjfw
	ilTNUVVidVtVe3vxoHcGoPZA6PehAhutKLYh5yHBEe+RNXGfMxDEwkb0NYL4s8DrfdQWZyY+ozI
	vFUUy6+UGa8/a5dlMUjxmu8U/NGp4tHs7p9vqvg2FY
X-Received: by 2002:a17:902:d48c:b0:2c0:e5ee:f55e with SMTP id d9443c01a7336-2d015b00e1cmr38092575ad.7.1785255628817;
        Tue, 28 Jul 2026 09:20:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-73.dlp.protect.broadcom.com. [144.49.247.73])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2cfde7b2395sm11189255ad.44.2026.07.28.09.20.28
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 09:20:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ea75996387so96078236d6.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 09:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785255627; x=1785860427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ldrGXYVfZqZof6XV0b95MEUdQpAbYXx4kQK0AyVaZ1M=;
        b=C5HdDrqnBPIvfqtNep5viMGJuH1rBUJFO7n4s4p/8JEu321rvL751OdICImSUgdroR
         2qPnyxKam1+E7LmvHskmml+WvV8+Sj6pDurwEcLzbyEfIjRl3eFmZUDRBh/2iO+wQ9Jk
         S1tJjzCPEzYcLmYgEE9M5rYzaPygjS8SzZl5s=
X-Forwarded-Encrypted: i=1; AHgh+Ro68qNecazmlgZYMAhtMeSSJVHlYzXJv+nzVqRG7Grv0cBTrXcJfd7wsdoRunZil89hHwq03M8c6uTm@vger.kernel.org
X-Received: by 2002:a05:622a:50f:b0:51c:8439:14d9 with SMTP id d75a77b69052e-529d70e6e9bmr29502031cf.54.1785255627614;
        Tue, 28 Jul 2026 09:20:27 -0700 (PDT)
X-Received: by 2002:a05:622a:50f:b0:51c:8439:14d9 with SMTP id d75a77b69052e-529d70e6e9bmr29501711cf.54.1785255627138;
        Tue, 28 Jul 2026 09:20:27 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081dc8a00asm2538436d6.20.2026.07.28.09.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 09:20:26 -0700 (PDT)
Message-ID: <86243c3d-6680-4c2e-9eb2-8c1d5d390120@broadcom.com>
Date: Tue, 28 Jul 2026 09:20:24 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: broadcom: bcm7445: Correct indentation
To: Krzysztof Kozlowski <krzk@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
References: <20260706101920.341586-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260721172801.3591970-1-florian.fainelli@broadcom.com>
 <9a415731-0de0-4cb4-b6c1-fc78806f6414@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <9a415731-0de0-4cb4-b6c1-fc78806f6414@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 7/25/26 09:37, Krzysztof Kozlowski wrote:
> On 21/07/2026 19:28, Florian Fainelli wrote:
>> From: Florian Fainelli <f.fainelli@gmail.com>
>>
>> On Mon,  6 Jul 2026 12:19:21 +0200, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
>>> No functional impact (same DTB).
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>
>>> ---
>>
>> Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
> 
> It is still not there. Last commit is v7.2-rc1.
> 
> Your next branch:
> https://github.com/Broadcom/stblinux/commits/next
> has last commit from May 29. Something was not pushed?

It was not, fixed yesterday, sorry about that.
-- 
Florian

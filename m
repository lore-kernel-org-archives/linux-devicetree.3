Received: from mail-oo1-f99.google.com (mail-oo1-f99.google.com [209.85.161.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1D83CB2FA
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 23:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786665485; cv=none; b=aEBArIVBL8OVElBa8ORSIKTSwMy+7/UnZKOMKPL63ETBOvnb2qnXtQj0nfJErWQkI5pZhidRvY/aZ81VrS0iNKfiD43lZsYLpQLPVyZOoQ6YFJH68UoxXzBmf2GSSn3LbHlg3dehmsuoXx9DteiTENnyo1EkjnNol/YTnx0s/zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786665485; c=relaxed/simple;
	bh=6hEhZLRjiSXwimmsWRFHI3innYmAOqyLiXArbJ3l3Ac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cyr9HgTyS47secNNF42slj3Wbc7HSTB4OXT5zp8DPG0UHU3nwx2Zv1tqbAOdeFr4mVY9CXGdKHRJQ0pfTYVZNlp2HPFEzg13Unbj63457TizD+BofjB6Mm8y3P9Douw0dP1uQjGwmtszv4BZhFkWFMFcaYvFRN34qmLLkAqnsT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XCzhZjcy; arc=none smtp.client-ip=209.85.161.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XCzhZjcy"
Received: by mail-oo1-f99.google.com with SMTP id 006d021491bc7-6ae8445b7b6so257099eaf.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786665483; x=1787270283;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HqzFBeTkl08g07JC6AeT1GoIZHKrk+NcGWCQbDWAixA=;
        b=VxHWN7RjwCbRjFv3/0KtEEpC+iIi/6aPkEtXzrMxs+LtxKJBZtF9Z3Q2nRV0I4rN3t
         LrjC1jjjp1uMaOvtij5i3pB6QCFUIvuX5h7GsqVuzHOIJB47yEkju+ULBSISfAb9GTuY
         7jlqNhdQrDFwmuaalUozc1YliaGAmf9dUSxf8+9D9nt5fyWxO4h4fgH6kPoSZD6CW3Z4
         FazF9BuYCxCom4yFBcTSi8jQ4Iay2otTwzcq3+Pbs6opUA/KruyNxvnyS8hHZuz223O0
         DPEYt4GxfbWlBkcyWptGp7uJMjyFxcJ3NcNJIlODYOJRVc5Bg+aNxvI7o54CJhg54EoJ
         kxPw==
X-Forwarded-Encrypted: i=1; AHgh+RqS9DwhUf3cg9aIrvs9DixofG+3wBa0eZPS1wGAKZK0V+CzUmdBFMvzgnKhwrtfJT5P1rlgRoMrM2cJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzVeAuwC3w7zn7a++MKN4t47Np7DHrYIlRuz6rd9/D77D5/3DYV
	CF8nzRSBNZCOiJUFzuZgcoD/1P38ShfKCP3GfBsAd5K5fkcPM3Vf4vhBO+/2w8lksxAq+wHwy+r
	Soizyy8D1tHsScQaNBs92pGGbt/GKXzkvX+3UNcPX2YnHJBh295aZP9eYvQjExPpMEsyPXpHHR1
	LoBH/KRfAuP98iuVjoaJguv54SFMjq8dpjUPE7dOxqZ6udr0lRjwyrGll2JJLSPtwJMA2l3hGoc
	UeMR6na01CIG2dlm+48Xg==
X-Gm-Gg: AR+sD11yGXJfmYBsGUcjEtKOf2N52n9DrfGJAkXpnsjOgagDR7DFnGkH9sXGzV4n6aW
	L9jMlqiFlJotNCaA8KzWYFW9Uu/BAeEXNIVbPf4NnJs6zMP/EFRw3al1oxzJd6F0eustlwGGR2W
	YtkPT8f81b/OBBbSMr7KFw7nrxrKhVeix/E5tvWHg+DwSIrpo12fdDCO4zzSh8KAiWPlsgyO2RY
	K6VNkUXW+TiJSuAADR75XdvrIazC1J87VGxgMOPcxBciN3hwE+iy5RoBj+lI30egCQZK2FVe8SU
	IRhybe/HVdM7wHjEsQNmIjqn797c0aUn/bdoMTPrIOJdiYfAe7TQ3lOVkCM9NCD5TcPgsBX4bG4
	aOOWwmcMnSumM5pMpL65GuNbZ4E+PoOkbJUtXwnUKFLlBMkyItlykjKm9w4FOm3MdEX6VvicZ1k
	LKwCxNpVaG4lvIPgbaUrsFfumbz5Z5jzeZZACsUPBe
X-Received: by 2002:a05:6820:1989:b0:6a1:3ee1:d679 with SMTP id 006d021491bc7-6b0d6905a55mr1974305eaf.30.1786665483216;
        Thu, 13 Aug 2026 16:58:03 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-45e8ffc4bc0sm41927fac.14.2026.08.13.16.58.02
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Aug 2026 16:58:03 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso434917a91.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1786665481; x=1787270281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqzFBeTkl08g07JC6AeT1GoIZHKrk+NcGWCQbDWAixA=;
        b=XCzhZjcyj4S5x9A58aheCBtbOLU1jGBvZpjNE6L1k2o6k+DYGV/IKZAU9H2/V0YklJ
         Yc8qoNf8xo2duDkRYjvOAFKKMP5TpcEaSzR5GPRmlKXNy0bq6cETLm7AVOBYN4bZAl4V
         Rn1oZudfty8ITjcjpd2g6HXU0zMArNuef/jNs=
X-Forwarded-Encrypted: i=1; AHgh+RpZ9/6UinyyIYT9phFwIhcUR1EkSoY7b4N1NrtDfz+0lw+rgoadSM43y1+ubb1tfdIxIVbcZYnRTbh9@vger.kernel.org
X-Received: by 2002:a17:90b:5803:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-3933cb3b889mr1708599a91.8.1786665480771;
        Thu, 13 Aug 2026 16:58:00 -0700 (PDT)
X-Received: by 2002:a17:90b:5803:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-3933cb3b889mr1708520a91.8.1786665480115;
        Thu, 13 Aug 2026 16:58:00 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413887ee70sm2452391c88.11.2026.08.13.16.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 16:57:59 -0700 (PDT)
Message-ID: <d448dccd-27be-477b-8444-2574f95f7f37@broadcom.com>
Date: Thu, 13 Aug 2026 16:57:58 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] Adding brcmstb-hwspinlock support
To: Kamal Dasu <kamal.dasu@broadcom.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: robh@kernel.org, krzysztof.kozlowski@linaro.org, conor+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260427201233.380314-1-kamal.dasu@broadcom.com>
 <22348975-bfb1-42c9-9593-06215f961845@broadcom.com>
 <CAKekbevRigjTVMUvbOsnU0rAvWZRZnuqhnxprujvG_k4OFC0HA@mail.gmail.com>
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
In-Reply-To: <CAKekbevRigjTVMUvbOsnU0rAvWZRZnuqhnxprujvG_k4OFC0HA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/13/26 12:25, Kamal Dasu wrote:
> On Tue, Jun 2, 2026 at 11:39 PM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
>>
>> Hi Bjorn, Baolin,
>>
>> On 4/27/2026 1:12 PM, Kamal Dasu wrote:
>>> This series adds hardware semaphore support for Broadcom set-top SoCs
>>> via the generic hwspinlock framework.
>>>
>>> The semaphore registers live in the sundry block; the DT binding
>>> describes only the semaphore register range. The compatible is
>>> brcm,bcm7038-sun-top-ctrl-semaphore (BCM7038 is where this block first
>>> appeared on set-top chips).
>>>
>>> The driver has been tested built-in and as a module.
>>
>> Is there anything else you would want to see being done differently here
>> or is this ready for being merged into your tree?
>>
>> Thanks!
>> --
>> Florian
>>
> 
> Florian,
> 
> Since there hasn't been a response from the hwspinlock maintainers to
> your ping from May, and given that:
> 
> Krzysztof reviewed the DT bindings (Reviewed-by),
> The series is self-contained under Broadcom STB platform code and has
> no core framework changes,
> 
> Could you please take this series through your Broadcom SoC tree for
> the next merge window?

I want to give Bjorn and Baolin a chance to respond, but would otherwise 
have to seek help from the ARM SoCs maintainers in order to get these 
patches moving forward.
-- 
Florian

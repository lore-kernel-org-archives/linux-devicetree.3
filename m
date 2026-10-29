Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793294180;
	b=SB/AQcyklOpbgS4hlC4d8IKbu+0UBZzWzioCk3KuCoX3s180JT9wKJPF5YmYTzfblPsS
	 LhDvPRbDa8hZksRgMZJzWF93QJI6FyyRu3/3v34QkiyJ2py/bQbDSBQz7nyg3WfkzPj2+
	 cQ6OXXui/PLAGQ5zl+7GNxi/6xrEFnHGWLl57MLnehb9GwUrGuSR2D7GXV9Tpcr0Ij8U0
	 APLUXbtEBGLO1lTcCZBnG+2xCgH+U0AH8tO1SrAtAFNXBtlJiBQFnVc19Az5p/jloejlW
	 zvNcjAOGlxJi2zBQyKTNgxhHQLHHz77LOFrLkW/6RJI2YXaK2E9Neir1oVDdxjFpV+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294180;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=lE2uSXffLzacbrPa786MlXxJ3B9g3YGKriI1oE9ksSc=;
	b=N2FSdFtCDtyWFMCc4lWGMxbCYTouYbmYNCJLdvgvmKvWrmyzqmzl5Cb2XFvqN7C6TTAv
	 W+rnNHcTca2gwORMAOAHiMTKV/Uz47nY35X4+wAyc0f7iQP8bC7R04ZlZg3fGeBqWWPDg
	 VqOglBPxJvCHKEn5AnObcOMJC8TIII03IjZqY+TDMT/lfw7X9u9yihVPLiSAG/DP4eyz3
	 VScUSOrEp4jpj4JYaah/4cphJbY/S9DRmcDbczZUqJm8FY+l8OQo0ztAc91Z7cA6wm7bX
	 lubZAPiDCoCKA3qHNsEvyHWKFp1vZspNriuAKK+kNgI1CrD42fndFIvqF1rzL33wGiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Xffpx+5Z;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EE3606A320
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 17:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7EE3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Xffpx+5Z
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1556586a91.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 10:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294179; x=1793898979;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lE2uSXffLzacbrPa786MlXxJ3B9g3YGKriI1oE9ksSc=;
        b=TaKcJpDOA+CAR1xgADfrbJgxmgUnJLy3Cc8GIhsY91d2TKzNdrzwSQHT9JHuqslSLe
         p6iCg1EhziWWVeFLVxnTyMLW4OV8pXPFc5Y5Nf6Bb2/bQdcwZolf/2LXZlVJWczWS1XM
         ShoHCb1S49BjJ0aQ/0e3bLWzv8kawWJGyV/qBGOtkavp+2mHBKDpfbUoGMEBnbcVnDG+
         MVTTu0B3JNH3Imbv7P7VY5krNcZQ3ToO1jUOvPUozjM3Vcny+wP2y6KKBzyuGkTCaV8c
         CJByitLiGXPV0QfisZpbMBssuERWFskARgStXMumg4PsYFoOkV/y2HZn33uE/S8HRMve
         M8qA==
X-Forwarded-Encrypted: i=1; AKwUvBwNsMOXSu5y4k1+s/DLjfDBTXhOb7mb/lQM4tbdg/gu6xAOubbi3/Qxtf5JRM/NipKDfSt5EUVuzl2+@vger.kernel.org
X-Gm-Message-State: AFq9FYJK3ECrIp7nHeicQd1vzrFyZeib2Ih2OonJP8srk+vVn1VYaDe+
	X+rFS7YE7mT52TmhyPada1E6jxs1mxnOI2MeJeqqg2lEDfsbh+UIntUGGzqoOn0DcomK3lEb0iC
	0R5gaXMNrDjNxNM/eo8lRZ+4sBMbRczTiLoJHCo1u5anyd9UjPRvdf3bmiYTmqty8hsFe1//jtG
	ErQ2TMuHHTB0vO4THImaRn2VfuGzGSTu0MD5Zsa6FPwpsm7FNAsPvHx3VX95Cl1Yo9C+V2U8Mq0
	1RwSB7kFulTayuN1SyqHhuK
X-Gm-Gg: AYBFou1ODzhVJmWEZJ/Td2wyNVQorOYuUJHVx10gQgBny0sbNayaeNpsoqBuXvjgIMP
	0wyPNbdzTpXJ7b46PX2nnIaey1nGslb68dl/Cqs4nRONASXP1+nm9cvkmc8alfcSdVC8rrNmb7n
	MajG6NT6VJ+ELWC44EEr3UHNTICfnGEO7VL6sCHx4tb8MxVKW/ecywlTs6IIRAdZbApYfMCIXuh
	4eT4u+4GmGuIX7S6FwYrgp/P4sAcKDiSrfPmhlrRKgIqtReSLpfUqaM16EtO+XnqVQHLkNflzXv
	OsPg7/PZNDKPPsXVOftd4r9DV82hZxsEhIHqFB59qvfU1xgs9/TpQTksI+xHKxzABrUHHkJr66X
	o2Uf/fef/nTahZkE0bYWXeFm31lHbpO+Sn7XXzNHETwNbwnNFaHMWuVWns6OMgvj4vlAMHFquzH
	uzKbWUskmfgrv2we05S0ZC+AdWIaZH7CepDSHwtiLr
X-Received: by 2002:a17:90b:28c5:b0:3aa:fc22:8aa7 with SMTP id 98e67ed59e1d1-3ae5822fa26mr5187337a91.53.1793294179038;
        Thu, 29 Oct 2026 10:16:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae85f87a56sm23419a91.1.2026.10.29.10.16.18
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 10:16:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdaf2073b0cso686992a12.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 10:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793294177; x=1793898977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lE2uSXffLzacbrPa786MlXxJ3B9g3YGKriI1oE9ksSc=;
        b=Xffpx+5Zks4jwrXGeXfC/Wmarq8AB4r49igoB46m4tRwQkbkbWvf2bjursmEHeGMiG
         p2jIdDDtpusB8cPFn+deTPquoY9vkjRSoMGflo/vGsymczYKSzVsV52DG7Xv51dFNVxG
         9SIdOzmrUrrInrIM3cXGtaV1Yf2fychPtODaw=
X-Forwarded-Encrypted: i=1; AKwUvBxWWcTTPXCrRcKbEaARLeMZ0ubHo80Kexw4eM3Nogchy/Utpl0B7XBrhBJEIpilyRyUU5ZCU2gtaeha@vger.kernel.org
X-Received: by 2002:a17:90b:5903:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3ae57e2b52amr4762325a91.6.1793294177312;
        Thu, 29 Oct 2026 10:16:17 -0700 (PDT)
X-Received: by 2002:a17:90b:5903:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3ae57e2b52amr4762297a91.6.1793294176832;
        Thu, 29 Oct 2026 10:16:16 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm444813a91.14.2026.10.29.10.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 10:16:16 -0700 (PDT)
Message-ID: <fe8b7acf-b495-4202-a5f1-51950c55c037@broadcom.com>
Date: Thu, 29 Oct 2026 10:16:11 -0700
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
Subject: Re: [PATCH v3 2/6] dt-bindings: ata: sata-brcm: Describe the NSP IDM
 registers
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Tejun Heo <tj@kernel.org>,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:BROADCOM IPROC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
References: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
 <20261026191618.3178830-3-florian.fainelli@broadcom.com>
 <20261029-versed-automatic-orangutan-43cfde@quoll>
 <e5c4ac0a-f5de-42e7-910a-cf2c9c4cabbc@kernel.org>
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
In-Reply-To: <e5c4ac0a-f5de-42e7-910a-cf2c9c4cabbc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/29/26 01:10, Krzysztof Kozlowski wrote:
> On 29/10/2026 09:09, Krzysztof Kozlowski wrote:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: brcm,bcm-nsp-ahci
>>> +    then:
>>> +      properties:
>>> +        reg:
>>> +          description: AHCI, top control and optional IDM register regions
>>> +    else:
>>> +      properties:
>>> +        reg:
>>> +          maxItems: 2
>>> +        reg-names:
>>> +          maxItems: 2
>>
>> Please move entire allOf to the bottom, before "unevaluatedProperties"
>> line.
> 
> And you already have an if:then: block, so this should be together.

Will do, thanks!
-- 
Florian


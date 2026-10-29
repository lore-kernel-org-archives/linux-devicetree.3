Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291742;
	b=W3os1Fm/cPEu6qft5p4F1r6pOmfnztRVCUr6XUEctfMVD88B3iOz60LJ6UMWrHQH/0E1
	 YI/BEDpTufx9ky8VEFML+jDTeVhwedyNoV3Nc4fNhLfzt7IKLQjRq2rwcEHjENZe9m8Th
	 N42AuHs/n6PNhwBlLIItdrByBmbtENB8ubBindSXGxOS0csCWi1sBqhN0zHrdt7wjY2ZN
	 7CHYK10Q8LLsjnlE8g3vlkr+mrsvLAfpc69Hs457AQq+weXdM3prP+lV6bLdgAkKEuXdK
	 Do8W0NsQaszdAgvJo6UzKpCUYx1V3bHKiCD2aIALvQdaMy2U2XCphixud5xvO8t2hXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291742;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=GjQwvDz4mWIuZZ+lNXDjzqnPWz3b8NLeIsPBGcLEPHs=;
	b=ciTxCSrb0jMstQ3KBCyWkWf6NEABFnKY0FueL4Z9eQIztDgEhSbldERfCOxjTdUztiiQ
	 DjH/eS4nm/lAI7fkbTaHRtpF2IOTQVzgwt9xFyhADWTHc8Fy9bMGQPZ0rlrngQUkQQvMM
	 udJ7hzu3WR0MbK14r8eCDD6/U6Q2CiXdLUuuAj0NqR7Lxx9rYJw7YToJsVVtMZntfXTx0
	 A0Y2DxCtRhfwiQX61kAvZX7A2wzuNKX+EdC/YiJ0UCNcFdZ/gbNov4Aw5rOsOxAmH+iSz
	 SyNxxGr6iNMmo33S3XjMeXl7JK3JPiameI7S22ROYlKkr3MJn2IM9sZI5REEZqiQk3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="eWq/jr0Q";
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F32B606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 16:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F32B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=eWq/jr0Q
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so1157988a91.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291741; x=1793896541;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GjQwvDz4mWIuZZ+lNXDjzqnPWz3b8NLeIsPBGcLEPHs=;
        b=KNXoFIhcwdz/wPEn/K8Pn0glc1FjlAZMaePCaD1fRTuWPEtuIKad2/LIiBsUUGgFeS
         L5qpfpJl0+dKj76m29jiRCWoQ7nwuP46kKE0kLwBD6zxmPcYU+vyFQDUHt2V06xd4e3m
         jfOVe8SaucHH63aWUWDltpDfgW7xf8HKsQMDr2pmY3h90lWjPNwZi6syn8Im7HpRwhCx
         tEySAifr6LotgVOIVYpnBS3WYYqLZsyBEkx0vmHqAIN2a1Zvj1rIvlYp6WNf24X7foyX
         4BcIoBftaJamoiJU525D6BgQyEE3ksd+Uglb2SBQuzQGQy3kXW7Yay2xayafpezkswxQ
         m1IA==
X-Forwarded-Encrypted: i=1; AKwUvBw4O40l7Y1uae9kTFmTbinA1mqykElyS7j6Q4zjovbqfsJ07wjem0kJJ5lHkmuOAP5tyIn96r68UCQc@vger.kernel.org
X-Gm-Message-State: AFq9FYKnry0mXBPLddRRTLkBGLOfBJdO4Zx9cEebwAEd2h7SXnqGjO7M
	UAdJLeLzJPmfhXSqqKc5lLHvnyXZfAwzZCPS8/mhRfgijvUimsO0RQ3ZW97oFDylunpUzcONbgU
	+Wurgv4M6MfKxVchGiWU29CiZpcMFE2gPqKQH5delEjU3D2YH0vbhQAAujDm/HDT1ZHsTrbdbu7
	lLcBfqtvP4kPeSzvE8bG9DlwYLe4MujaskdGhbq0/FHmEv5D66PZn/ZpWuWA55E1EZ9LcWKp9VC
	uhmfjiZEB3v2mxU2ybsPyoA
X-Gm-Gg: AYBFou1cY0h7/BnStLugJQCs1jBcCGB4or8rftX88UDw2xh5IbvqofAMDT9oexBn6FL
	STyUIzUXegVIVc+HPGX2jZR91iiOODT5YLmn21oXZc41m+9y3vCZsSzOa0elJGl4j+M4UAwiY6Z
	rXs9Qj1+GxoGqTx5WP5vwBMCc1YthvyrDdRzjWO246bvKb4BssjVA6I0Y4wQ7cPVr8HDVuYjt2N
	mzfQvt/OLY/pdCg52PCipsVDPmEdneGQcq5iBt0mRwShlHVr38GwAPMb2KpT+q1EJkG2Q2DapX+
	t41GZf7J2v3afJuVudETx9239jpO9VDDLaVBqPCgzeFm3kk3Kl+lJZRNd4wLqJ3q/fF7wFoSnST
	e0NzojUmFmn/2nrdbnK6zDutxOButYQxG3ohXBThkecaMVgTG8YRkfipT5ZBsDxdZ9T5rhvRCFM
	V/GxGhPQJlmQE3YjJh44mACgXtT22t1LWVsB+kFXqE
X-Received: by 2002:a17:90b:5242:b0:3ac:7556:8eda with SMTP id 98e67ed59e1d1-3ae58100ac6mr4164546a91.26.1793291741008;
        Thu, 29 Oct 2026 09:35:41 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e8b50f9sm2491908a91.8.2026.10.29.09.35.40
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 09:35:41 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5376f1853bfso47709941cf.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 09:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793291740; x=1793896540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GjQwvDz4mWIuZZ+lNXDjzqnPWz3b8NLeIsPBGcLEPHs=;
        b=eWq/jr0Qg6cjXctSxVguAdeO1CzRoTOceciiQdpGvC1F0/5nTuCfi1PckSoCpc+dU3
         1K5ATkG57DUC8z3ROPYkkjMfyQF4hRBBVSjfcrrRbKXGDIpSbCHl0s/RD8+dOFCHPQBK
         D+Xf0zMYug1fjd2js4xmAnulPmqKxftWlXqfQ=
X-Forwarded-Encrypted: i=1; AKwUvBySwNYVjl6Ldzq1MWiIsZdbe0PSUIbkGb4NHPIknSt/sSiu0p9yiz1qjNN2e8FhlWi3Ztyq8XuZhmQH@vger.kernel.org
X-Received: by 2002:ac8:59cb:0:b0:535:fc2d:b7c2 with SMTP id d75a77b69052e-53fcb7f9340mr101251861cf.33.1793291739297;
        Thu, 29 Oct 2026 09:35:39 -0700 (PDT)
X-Received: by 2002:ac8:59cb:0:b0:535:fc2d:b7c2 with SMTP id d75a77b69052e-53fcb7f9340mr101251311cf.33.1793291738724;
        Thu, 29 Oct 2026 09:35:38 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca31b46f3sm272576d6.45.2026.10.29.09.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 09:35:38 -0700 (PDT)
Message-ID: <cb6c4485-90c4-4ea2-8df8-4e1ccf47dbb1@broadcom.com>
Date: Thu, 29 Oct 2026 09:35:32 -0700
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
To: Krzysztof Kozlowski <krzk@kernel.org>
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
In-Reply-To: <20261029-versed-automatic-orangutan-43cfde@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/29/26 01:09, Krzysztof Kozlowski wrote:
> On Mon, Oct 26, 2026 at 12:16:14PM -0700, Florian Fainelli wrote:
>> Northstar Plus uses the SATA IDM block to enable the interface clock and
>> deassert the core reset before accessing the controller registers.
> 
> And which compatible in the binding is "Northstar Plus"? I tried to map
> them to arm/bcm/brcm,nsp.yaml but nothing is there, so it looks like you
> are making changes without having actual compatible documented. In that
> case this is not needed. Make changes WITH documenting new compatible.

There is an existing compatible defined: brcm,bcm-nsp-ahci. NSP = North 
Star Plus.
-- 
Florian

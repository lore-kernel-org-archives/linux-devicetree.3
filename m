Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380273;
	b=5Ifpwsa3Jq1XdL85SEMbk2dmbSiCA38WD3o175ibkQZSSA1obSY989VgkxMnu9c174Jh
	 M05h/6lLg03beAR8yIRDQ5nu0ERpO4Let/CtFA1ljNR08O6AGh3k/r31fQffp1JOxIQpF
	 BSgAUjiWH7vDxcEhE17WrAqafJ+NhZJEN32Nw8yiZ3vZIueHRlvElBZ5PmVC4XfgbA8+z
	 HJy4M0OVxp1YtMFZ36EEega1WZjgy2HZyLhaurxY0y/2g88RCq2+/Cuaau8Mvs8UCrNgr
	 GEXw137YbHhjLLTvnJHSoVQmJ9MHzzC7S4X0MvTYeDH8tm1H/h/jObusmqyv0o7d9cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380273;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=7DbiMhjxBfgIRvFyWx+zMAj+b86N6ePaSG30TxtUrXg=;
	b=TCSWoyUGx06V4TiqakyNLBZJ7N43lAwcaBZpl7dlyf63iq1qglBkTBrRI0wymcGKL3y8
	 /FTLxEK4XuSnCaz73YgINJgU+w6WgTa+tGM07v+CIFfVA/4ftTyCc5mavbY+4iQxstVHw
	 8CJAWn4+xxA+JBabjpRR1iRWv38rQCv2S2g3l/YSwqzIASCLIsD6zCk6lr+Uv6RfAgzrT
	 44HTzZqJHKbhnxozsAkSufE2v1QngAVNxia2mgdJ7wxQAmZnNAgVbE3P7Y/+IE+v2wtrN
	 xawMgdlc65EwI4KpCKGenqOclNbh37VAMCKm0GXpJBmtb+z9HoEab1K7LmhsF3LSOnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bgUrQZBb;
	arc=none smtp.remote-ip=209.85.160.227
Received: from mail-qt1-f227.google.com (mail-qt1-f227.google.com [209.85.160.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD20606A31C
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 17:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CD20606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bgUrQZBb
Received: by mail-qt1-f227.google.com with SMTP id d75a77b69052e-53fdd2fb171so10642881cf.2
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 10:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380272; x=1793985072;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7DbiMhjxBfgIRvFyWx+zMAj+b86N6ePaSG30TxtUrXg=;
        b=0J/6lpV6FrjP49bbIsYC/Ydqkct1lIrMiLlGDh6l1Mv7nV6mqK9NFjPP2Wixb7XYdu
         Q9XuTAt0lUiCuIS25h76xRb1F+SAoNb1gFS8h8Y90tFGp9JJO+ymP9hMkPaFFO7ItTCi
         nLtga3FgoiuuI/z7KW42K+Z3rUci9Jl/C2xEJWmRIl7B9B1CrHtMnhzxwTSm6yaRnNf+
         687EKey3ajJhXgjjv0FznxomIGtP+tU+n9ZxvJ9x/LbbaY6lniF7/2FDxl5qM88IT/HN
         QpMkQj170B3nMLDQnz7C+NoHYNsPSX0IpbWrXxilu5dw0v3MZu6L5IfSUUEP0pZ4c2W8
         TRCA==
X-Forwarded-Encrypted: i=1; AKwUvByw5+Z+yH9v2UUAEgIKwxfIzvzRVL21uVXugzloazUyTd7k4xqgc+rPSYlOZQxw3nl5BLuyWLVE+FuY@vger.kernel.org
X-Gm-Message-State: AFq9FYLvrrlgwctXiJpPoarxQKptB4bAgMOeP4Ii+ACDchTM5B9V9vEY
	+XcCqH6fAJ4US4n0fYJiC4BQOQQlmbUqMem+d463oTZInNQRdj5jzoV2vLC12s4YN7h9d951FfY
	KLHXOYIy1NjaoMB3ZqOqeAPL6YYzL35PK/RNplti/fDsgIJGk45SOcuGwQ9MXY+wthbav6Pj4HC
	GBLcCZTc6yVjEzxAZZSFHplTUqmOo7tozUe/VGN/7RUuHNvW4u1Xr8ap2/97IQvhkptcj1Nau6D
	yUsAYlt132utaPkUHADuVjf
X-Gm-Gg: AYBFou2CwTJoiE/ZGbnH4R3erFvs9yGp0kWmIEFlIXYjtVRiHG3px5/k8dngHi2ePlG
	+6kCS2TsQGdyajWAhajL0i7gFuJe2BYuSML2Ptid8D1I6pcuo21WtCkdB4weQPT3OynPf3zzrFs
	MZRnvfLTtLjOxDtokJ01aIpn/UkF/Tx7SbiSBHfogWcuxt20NtHdw9KLu3mYCcSQpVrkiX9Wkwo
	2oAMARbYlBRFwLAtwB6emmBj81SxECb2OgiYa20Uonarkt+N2iCQEIntU7j8W+yRdydWjIBiGrB
	VYafJFY5r/yBJjLvMfZNEXy2wYt94dYwQcHpc8LTa4TSWH7WDBO3gI+53fOPc+6Pdet6lr/GDlM
	Rc9pvjA4PBdehIzzwwxkChbKn/8MzQ0o/a8eHgul60viMEBPmGtrf5oPLYJDU4TI8QjTgnqJ6+1
	S50Wet//Ke5nnGjAnTadqdCeLIFyIcKVL+7bttrVx6
X-Received: by 2002:a05:622a:c07:b0:536:c00a:b7a2 with SMTP id d75a77b69052e-542b733057bmr46615871cf.46.1793380271777;
        Fri, 30 Oct 2026 10:11:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-5430c86be1bsm153961cf.0.2026.10.30.10.11.11
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:11:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so1347630a91.3
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 10:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793380270; x=1793985070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7DbiMhjxBfgIRvFyWx+zMAj+b86N6ePaSG30TxtUrXg=;
        b=bgUrQZBb2tNfUPun5eU8IVGbdPrnAVgHt4ZkP/K5DuDIYPsV8Zdlejkg6JrcDSOUhm
         /J/9RUEYgID2sN0fFZd/v/GYpM3Rothfl/8P/Ps3YuJDYaeLLiJXbWLBqRL0IuGQhIXt
         6myZ17i5yxHS79H2HR9k5F8qSWwIKdHOmaIeo=
X-Forwarded-Encrypted: i=1; AKwUvByNcdMQziqtT7/GG+VRvKxmyjCxbVSG+A+ZY7eMh3AnYvCHvAHnETWKzPgAB6JC9qYTB8tEQomylc6a@vger.kernel.org
X-Received: by 2002:a17:90b:1c88:b0:3aa:6b5d:a00a with SMTP id 98e67ed59e1d1-3ae898510b3mr2474487a91.53.1793380270430;
        Fri, 30 Oct 2026 10:11:10 -0700 (PDT)
X-Received: by 2002:a17:90b:1c88:b0:3aa:6b5d:a00a with SMTP id 98e67ed59e1d1-3ae898510b3mr2474434a91.53.1793380269908;
        Fri, 30 Oct 2026 10:11:09 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845e71a7sm4640721a91.15.2026.10.30.10.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:11:09 -0700 (PDT)
Message-ID: <d1436c92-b7a9-4220-a69a-1ec72eb9f5bf@broadcom.com>
Date: Fri, 30 Oct 2026 10:11:06 -0700
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
Subject: Re: [PATCH v2 0/3] Support for BCM5301X AXI trace PMUs
To: Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Besar Wicaksono <bwicaksono@nvidia.com>,
 Ilkka Koskinen <ilkka@os.amperecomputing.com>,
 "moderated list:BROADCOM BCM5301X ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list:ARM PMU PROFILING AND DEBUGGING"
 <linux-perf-users@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
References: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
 <auSHoj46Os6gSEUH@willie-the-truck>
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
In-Reply-To: <auSHoj46Os6gSEUH@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hi Will,

On 10/30/26 05:03, Will Deacon wrote:
> Hi Florian,
> 
> On Tue, Oct 27, 2026 at 10:51:21AM -0700, Florian Fainelli wrote:
>> This patch series adds support for the BCM5301x PMUs which are AXI trace
>> engines present in the chip.
> 
> Do these replace/interact/support the series from Ian at:
> 
> https://lore.kernel.org/r/20261002175738.3242646-1-irogers@google.com
> 
> ?

This is a different piece of hardware, I was initially hoping we could 
cover it using Ian's PMU driver for 2835/2711/2712 but it's really much 
simpler and different on the BCM5301X SoCs. Thanks for checking though.
-- 
Florian

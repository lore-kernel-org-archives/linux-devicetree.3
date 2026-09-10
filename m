Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608E84AEBC5
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 16:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789058811; cv=none; b=KpOnuDjIRGHZYe8oO7DMvn7XAPT3we4Jm+7aQyd3hRtr0kCdy6Y95hhW6ZWevTTD9ssIOmUBgz1cD55XAihXeaGr2HBFqVl/xLwSVi9t7FemQUvw97AaCZqL2PRdYXhTbitdLMIrjzPyorLx/+whUivAK2DrNrIPbPHC7o7LB4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789058811; c=relaxed/simple;
	bh=C0VDUY1Qn+GKhgB1OBz88lFhG+rPU6LKMkmDDE66l8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDK7rtzsGlznMtFNGv6bIhsFHPSUTCV0I57owz7gzECLZr4osE2wWbnqWttOs8jlOJl5JvFJliILVjMHWsXdRVWX66QMCtpJk9/ygOUHeQQ1MLDG1S89tKbUKmLq0bYJHq+hWgfyKSwC33uQiHa6NDnbRrVpAwb78ImT33f23Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=QmBj1QCC; arc=none smtp.client-ip=209.85.215.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="QmBj1QCC"
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso13359a12.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789058803; x=1789663603;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=E/hbBP8zfoX+TAOwTlTdxoBwUjk2GjRBIHrshh9UGEs=;
        b=gVwtKSMPF3ZnJZWvzChdGROBW540+rj0By6CtwYz7mk0ptjt+N43RefHcR49pfc65J
         94xubfz4+5cUCOU2fLC5a1AHIfrgD+qLmDSBfbWnjOcrd2d2rHfnbO8xFnpcIN+ZANfh
         e1bDuv0aoUgje3o9CFos/X5JX+4o/j90l2NAk/CHCTxDOtGzEpGe4sk+D3kzozumQdhM
         +BosdnlWQOC/S3Yjsyilyp+1WUWSdulMKqUnV9X77+2F9xBrYyJJ9QpywrhfN85UM5U7
         FJ5iVZ6Lg9YHg7GwYTuBy56wxYyD5McIqLmw6Ygw8dQcb373XMo2+lC5IHGI2wtopk3r
         Qj7A==
X-Forwarded-Encrypted: i=1; AKwUvBx6c6aVYDLbb5Sqh8PJv99i/tXW/tf+B4LGRWqPTjLnVKivEy8pwcGCVxzNaZo0/4JjX8sXj7naQFXy@vger.kernel.org
X-Gm-Message-State: AFuF++n5FfJH7zn/2lyxA/V6TIKO9cjOmpb6+nA7h7Qg7bootUZeKFeT
	VCFP/9jQFxwKYRYg6LWbBIeGdGxyefg/uFSiYqksmCZyfYkkVibw2EtAFPNcmQRsl37uL5z0SoM
	x8+R5/sRbfl1C3yQLB4RJDv/hpp21hio6eueXuFgeVXqbXBPMpm1R1zsGCxJJCv2n/32NoOWkaS
	Gq5OgNViqpkDIHv/NSt358A6801O7Pm0Yl/q5pr4G1P0FULpuMeB42RL49wRTyvSBhlO2MrSkJQ
	0kNzZdwcefa/LxZAwrf2Q==
X-Gm-Gg: AYBFou2OoIgh2VGjGfuiXEUpLUIYCgBlYHFf6nxBA2HKE+fyqCx9+aYc5Q0oKJFHVia
	dHp8SjkJlo7v5FLuoyGnTCbWlRPUZNDpVvvcMDAZSh3W/PCChnNTH1aHjb07m+GXIdRAn6sAjZr
	jT6vcC24FSmqY2pdRoMupbEugdtzppeDXf86ddtnHeVkfz6YNkef+iX4/Azst+9BkwowTbHLXXz
	g97hlKyv96Lnj62/x4/aCpCPMYu9CZmPcwxFRXOFhiShUCViyEpolVdWxiNDi1lZZ4hW9jresWA
	mvKlmE83/5z0XwF74UopWTLGnE1GpdES1BYzNsX2jFHBphqpOdL0EbqiqZ4WHCehQVveJGm/2hd
	WBgyz00dMcuUjF006bv+Tav3ZhFiyKbt+k4FHrlaimzRsAmCdpLuZCv4GmCzGM9iBIsqkKwGmDC
	gCtowzegwlYItBuO3UZIAWOyBqkkUgk8fZ3+nt2xJ3NU0=
X-Received: by 2002:a17:90b:5112:b0:398:c150:e7b3 with SMTP id 98e67ed59e1d1-39bac13ba6bmr22605122a91.4.1789058802983;
        Thu, 10 Sep 2026 09:46:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39bae615e84sm1059189a91.0.2026.09.10.09.46.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Sep 2026 09:46:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso100898195ad.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789058801; x=1789663601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E/hbBP8zfoX+TAOwTlTdxoBwUjk2GjRBIHrshh9UGEs=;
        b=QmBj1QCCXb07LmuBHuTN9D0POjkIWvn5ZtgkZm7yiumaMnOc/EqT2O1ygZqQ4Z4I+j
         G9NJtgQPxV5TELdsDBrDLhshFBdywctgJouk7qwWqvyhvtdLX5ecuxxXOAEg31eKn5Cc
         zsIdmucUetFa4ppnrH+9LVa8lZG0pUeaBtdqg=
X-Forwarded-Encrypted: i=1; AKwUvBx/D17hHgw8T/9z1m5Oqw9qdQKic06XMsWda2mpv4H0daQnvRJBtaKFTcTKyVecmPZsLutREGSlUDm4@vger.kernel.org
X-Received: by 2002:a17:902:d48b:b0:2db:3d9a:173b with SMTP id d9443c01a7336-2dd2a1fe2a1mr5936125ad.9.1789058801149;
        Thu, 10 Sep 2026 09:46:41 -0700 (PDT)
X-Received: by 2002:a17:902:d48b:b0:2db:3d9a:173b with SMTP id d9443c01a7336-2dd2a1fe2a1mr5935245ad.9.1789058800733;
        Thu, 10 Sep 2026 09:46:40 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae36adsm90000605ad.76.2026.09.10.09.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 09:46:40 -0700 (PDT)
Message-ID: <6a65465e-f860-434f-9dad-59d9538c97b8@broadcom.com>
Date: Thu, 10 Sep 2026 09:46:38 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] ARM: dts: BCM5301X: AC56U: add nvram node
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "moderated list:BROADCOM BCM5301X ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260910001209.116465-1-rosenp@gmail.com>
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
In-Reply-To: <20260910001209.116465-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/9/26 17:12, Rosen Penev wrote:
> Add it and set for gmac0, which is the only GMAC used on this board.
> 
> nvram size found from a random bootlog online.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   v2: fix typo.
>   .../boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> index c80ac16ad949..9ab618a097b1 100644
> --- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> @@ -25,6 +25,15 @@ memory@0 {
>   		      <0x88000000 0x08000000>;
>   	};
>   
> +	nvram@1c080000 {
> +		compatible = "brcm,nvram";
> +		reg = <0x1c080000 0x180000>;

Why is not the nvram node moved to bcm5301x.dtsi given it is common to 
all of the chips?
--
Florian

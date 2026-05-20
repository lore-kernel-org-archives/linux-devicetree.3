Received: from mail-qt1-f228.google.com (mail-qt1-f228.google.com [209.85.160.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054753C0600
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779319582; cv=none; b=SOLxG4GJqYO49j1QRnX7AvW2DVCZTZF6ThxiXPKZH1Y6+49JsSd8GwjGiAdS8BctuhqsGIjFid/nRQb4ifZGiDimHIEKnUG5breNVZ5M0nxobqqskgNq0d5LNSf7ldsdWKBK/GDAs8ju66vgKK2/AVzgTlKl5RevKb5q/jjI8sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779319582; c=relaxed/simple;
	bh=8gXgK/h0hCmwe9qiJV/0itGnM6zW+O4ZE6UeaQBjOvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Inmham7XKlaO3fHi7zyUxb4ouQHT4mfQYGhhWQXK8n3s82prexJ6p96Bn38ytXRYTVGuREJtY1f7VS8Z+jLX/g5gCcg948gtqtn0oM93S6C3peTNYA/cVGRHw0twgj3fLwtkz59eMSUn+PQ5TX9Z0ztyK5bdVRFT3A7nQHpBMvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=CTr7o5rK; arc=none smtp.client-ip=209.85.160.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="CTr7o5rK"
Received: by mail-qt1-f228.google.com with SMTP id d75a77b69052e-50d880e6fbbso68587501cf.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:26:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779319580; x=1779924380;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=of8goAcgo6BFYI2D0ojfLUYu7ENvlbSg6CCV/wxzOBw=;
        b=Dn9xc6MHzImFh+h+yyzDoR7f9lIDvcFlrvzstrwAhSyKz40tdyZnOh+YVJ6ueNtIhQ
         Tg+wEbX+5CQn0cIqALgXQ8a6LSCekxKyXZH33hdxs+LBsVFpw+m7vCMpmD9IV1bwbGK9
         PEvT0hbs5v3oMoiXwi5fLqOq/XHUjwAOtEFPGcW2jpMLNGZAu++gTSgn96fHSFViJf2L
         pBPIa+z1lAVgpqZYKnevaugHbsjULIu/Z6TkgP3KkU4NUk+Rkl5uHZD3g0qRJCaQc4+B
         5BqjKnqVdAeFrrgJIzw62Dg7vlc/l5vuE7hhZ7+K/XzPBAdP/CT6tUYUgI8VVQlKz1gF
         a8Rw==
X-Forwarded-Encrypted: i=1; AFNElJ9vRUHR2gQmmGsZo20vc+fNM3s4FuzWBU90tRjWXSR3NDEFJ9xeJl9V8NWmY6Xn1OdbsY8MZsRIY0DA@vger.kernel.org
X-Gm-Message-State: AOJu0YwjaGZyHO4ja1Fh+q3Y+gAqfEwORN+6vMF5sckb+TBSjs9SRe+v
	F8x7bUhC8lLyXWeQhajMZS0OAvGwRvX0j2iEKKHtOCTYLJ/NE1YRDooCi72GT1JDWfCH14ODTJW
	Jseb6fGHNBZBbUB3irnpRegWE4EwLzfJZnRYfID+4tQOwBC2wsqfu8bxb5hreE+1bDA2ORYkk8Q
	0Lr0tmIyUtkuRMvJdZMyPwJ4JnS0w7awgLNNs5rZeCTf0wfJMV5+HXH/pQBxHzWbQ/TNB+LVykT
	+Lbcd9QkWRK+UmUeKBUNw==
X-Gm-Gg: Acq92OGPNjo3l4RJwStFjm7PPmkbRqc9urgvWw7PwYyfEayITGmpKhlxDZwYID3yzOV
	HJyHodCHyOtxp+Pj+2ltn+YmEP48zLEET1WgCt+yppjNzoGa7RBN0N16ID8xUviu7Z4rJ8Elq4K
	kW9SbU+A+BvemX9ecEYWQ8OkzkAhwBS9/+xYclI76bCBSdVa5pqrZVxQT2uc4hMD0x/1rPweBJt
	JfZcFfLNOqfdiexwrolhoIphh5JafwbyVQIzKsA7DeMbxZ9J3C5lEwThyrOIxyhPvtq7S3+bRPf
	nzVKMVH8OUqW9k3Qy/jELvonT0gcebDnTIS+9roA6tvFqNH7NhUzh7Rx0HF2gBYue5dfDU9PIPN
	ENYgw7kavTnoGunaP2aDaChVqp/usdOjTaY1rFlFTEOHYlr1ZeVvn/32GIK7YU1rnTe5ZmwaXiZ
	aHoJEoZOOjhEjSR0hsySOFUoqjFTef7z2qifOtjyfO0JhjXwS4SJo4bACwRI+ewaks
X-Received: by 2002:a05:622a:5586:b0:509:11bd:9d3 with SMTP id d75a77b69052e-516c5847b04mr7570101cf.1.1779319579670;
        Wed, 20 May 2026 16:26:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-51645687d52sm11557341cf.2.2026.05.20.16.26.19
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 May 2026 16:26:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12df8bc580cso2829126c88.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1779319578; x=1779924378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=of8goAcgo6BFYI2D0ojfLUYu7ENvlbSg6CCV/wxzOBw=;
        b=CTr7o5rKmqpHpSCnq/t8YTDpPUaE/oe4il0K3ZBjH4ZphB3pZd882Erfuzf2WtuSB6
         PZZzLf09rjblmPzxgesbj322bUFRq1UYX9NV3OLA1+7zdOBraz/XH/W56Mlt0x4hqaGF
         RLHNR5J9OTvIF+ABbSSNuxGESr1wOCdc57/jI=
X-Forwarded-Encrypted: i=1; AFNElJ8TPidRAONR7baUw5TJqH0VBZ7mK9qDzwn+W9+yY7EfppBrlPFcX3E60MPTZCH6Ne9ecWxNAq1yVslT@vger.kernel.org
X-Received: by 2002:a05:7022:699b:b0:135:e8f4:2926 with SMTP id a92af1059eb24-13634938515mr206332c88.3.1779319578325;
        Wed, 20 May 2026 16:26:18 -0700 (PDT)
X-Received: by 2002:a05:7022:699b:b0:135:e8f4:2926 with SMTP id a92af1059eb24-13634938515mr206311c88.3.1779319577703;
        Wed, 20 May 2026 16:26:17 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm28875493c88.7.2026.05.20.16.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 16:26:17 -0700 (PDT)
Message-ID: <0ae5c657-91a6-4ab0-ac53-c419427ff4dc@broadcom.com>
Date: Wed, 20 May 2026 16:26:16 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: BCM5301X: R6300v2: fix USB3
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
References: <20260406220453.101185-1-rosenp@gmail.com>
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
In-Reply-To: <20260406220453.101185-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 4/6/26 15:04, Rosen Penev wrote:
> USB3 needs GPIO to be pulled HIGH in order to function. Add vcc-gpio to
> do so.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied, thanks!
-- 
Florian

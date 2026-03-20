Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79319191F91
	for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 17:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027372; cv=none; b=rWZHlgGdA0Xh+1ilvPRJQ42u/qmCttSViEYiyBEeQgCRmOHwOzRwa9atYbfjLNcaNHCl/o7h2+6Xkms3uFbKapQSUoHQPNfCI8lEpK5v/olkA6bSTbz+fOpzPdXgHzPllmOvX8JxIi266n9HIWEfADoX2acujtwyYX5r1pn9qYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027372; c=relaxed/simple;
	bh=OqjRQoj36ob6DBl7aSajpZlqMBO7G2mLP7Q6kVxI6JQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IvfGoKUXjrA/tu8M0nBBYP4AcZTFYvnI+5vjy4WukyKtE7BVI//QciNbqXbI8pNESSB31SBOpvO9wFmm8kUPyQTOkY3n9cUuJC+PM7Zu8pAeGGotEvCnKLI93uYnpv4pKc1GxT9C4BoY6ydT9wjav5XcUUBTxYQrb2XNlbSn9z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=R9+T8ymB; arc=none smtp.client-ip=209.85.215.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="R9+T8ymB"
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-c73e9e4cdf7so331863a12.2
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 10:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774027371; x=1774632171;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oJqGquqzkfxqS4IFo/Hi5ODMiGLpsYRxUO+ZevxPhno=;
        b=ql7qGdESiXG7g7msUArEKF0VQpu7nSkXvSP6vkPBtlNrxCPq+ry8MvJ5V8Ngqft/Gs
         9jElsGNIMT8n83eUqyfRMsPsCHP4QFSysG7wmyQg9nhVsiwS1aGCEzP6JSV5fij7wrjr
         uDpxoPuAEW47G16wjksGdTITC7o31Qf7sYxdwfNZfPfRc5J1GjsuwGwbsz2enjDNkb0E
         eFvrlNSF9fdjjqn35A4sOkp8y87trk6Q2ELUagk6NS49OlZuF4sRVWWbdil4aJf9ACEi
         jjFck9LF2XHUkU6wFTGmPJPNuXJ+j+vZ+caa/r6mT+x953Q5nTzmrbwq14usaLP6mVFf
         /1eQ==
X-Gm-Message-State: AOJu0YxD+pkKInO+1NDr20E48qNoSciT1WFSboo0SXC/gi6rmD8q6zfU
	PsH1TDreX8Wuue7Ar+y93PrXmAOKBtmIFLDXhBHQUxnRjE6nYlMbS8fhunWkJGmo8D+0IJGPbr0
	IKh+IWUKW2tp8bvzsi7bMHsARB8FvOTbKHUAzTMw1ezz87RvgqfPjQc5ZQ9+PWGFrISRkFi4Zkk
	SbnLADcLpi39EfdAvD30iEKplQ19lKz7xsE76QZ1aIGq905T7AiiyGAdqUIB/HhSdDh8p4Jx8cb
	gcvwEt5c49bQMMt76HQGw==
X-Gm-Gg: ATEYQzyfPq9c9eJxwEWtNw7yZcE68/2JHtgHIC/PUGdHaunBrUoLf833MR3CK+0hBtt
	XkD5WHfWmn+7hKea8B/N8kmCQnFhO5WNEF3FkX5rhqUCc6h+YwxwVEzrHY0x6OqfVI6KnHWJHpB
	fasrv+8tL2O5rbLn7Y5AQmHqv2SmwpnqsCzcoEz+7oNFnQ4wwEvqlGsx+TiXzzVn67FAiEaRMti
	bI5mWEPkgeDSf+ufKj6v/A1diYllZsEV6C0oux0aBnK3Zm6mJ3UNxKvlNWDETY/xkhAiPk7CSpW
	rssC/2aERa78kT6XgvjDKwm8HEm/bQa+wQrnpYKXZbgvjhxK2C+CRujjnZXXkQrHO2EvrcZf4f0
	t+z5yZKh3hJItWbGiQbCycX2VQrN+mm69UIT1gD6QHDtKG4GXkkxNkf9rxjrYHLzcyI/55IsFji
	cnibJ0ID6ZNHkxtccCANkbMQBHGp+Z6lKcc7NTOo8dpdfzwyBWWqMYtdsg1sccvg==
X-Received: by 2002:a05:6a21:3286:b0:398:7973:277e with SMTP id adf61e73a8af0-39bceb46fedmr3366894637.31.1774027370737;
        Fri, 20 Mar 2026 10:22:50 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-c743a8728e8sm231057a12.2.2026.03.20.10.22.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Mar 2026 10:22:50 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091a96f0bcso29453181cf.1
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 10:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774027369; x=1774632169; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oJqGquqzkfxqS4IFo/Hi5ODMiGLpsYRxUO+ZevxPhno=;
        b=R9+T8ymBtj55givUVeMp3BZk0dd4JyopwoMhOM+qAIW5ZDNECWM+l7rSDaa+DJlQRU
         j3tFpXwvdQHnpmnR5zN6LQxZpKpQeVM/sH81t/+mb2BZqa2J7YE41C7azopy/N2DCnHv
         nbVx3SAGFydVOHZnMhqNn7AIyXceyzy+5Qllo=
X-Received: by 2002:a05:622a:1e92:b0:501:4d61:f02b with SMTP id d75a77b69052e-50b3759199cmr59306901cf.59.1774027369106;
        Fri, 20 Mar 2026 10:22:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1e92:b0:501:4d61:f02b with SMTP id d75a77b69052e-50b3759199cmr59306491cf.59.1774027368639;
        Fri, 20 Mar 2026 10:22:48 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c8534f9ccsm24884096d6.39.2026.03.20.10.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 10:22:48 -0700 (PDT)
Message-ID: <68148c62-1cf7-4b65-a3b3-3b2da86a4a3b@broadcom.com>
Date: Fri, 20 Mar 2026 10:22:46 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ARM: dts: broadcom: bcm2835-rpi: Move non
 simple-bus nodes to root level
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260320154809.1246064-1-robh@kernel.org>
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
In-Reply-To: <20260320154809.1246064-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 3/20/26 08:48, Rob Herring (Arm) wrote:
> The 'gpu' and 'firmware' nodes are not MMIO devices, so they should not be
> under a 'simple-bus'. Additionally, the "raspberrypi,bcm2835-power" node
> is part of the firmware, so move it under the 'rpi-firmware' node.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Florian, you have the fixes for the prior versions in your tree, but not
> the original commits they say they fix. These apply without the fixes.

If you were referring to these:

https://lore.kernel.org/r/20260106-dt-dtbs-broadcom-fixes-v1-2-ba45874e4553@kernel.org
https://lore.kernel.org/all/20260106-dt-dtbs-broadcom-fixes-v1-3-ba45874e4553@kernel.org/

I did take them as a prerequisite to apply your patches but a combined 
set of patches works just as well.

Thank you!
-- 
Florian

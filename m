Received: from mail-vk1-f226.google.com (mail-vk1-f226.google.com [209.85.221.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501B044E651
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 20:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787775581; cv=none; b=P8fzdpKfrqzDHZlo74DUza01/w/PC9mf9xYxbsJmrhwpgeEkBGRyR11WVJMJ2Mv23vtcDK83IhximM5LYQqwIbYz8oIjDfJWMK2vQzm4A4DipoXSTbAYTtt2yXQYR5QBHuhbOpnQS+m+pxpPnSg2CCVRnCnca/LuxmjiOdg/rQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787775581; c=relaxed/simple;
	bh=JGIElWR1TH2NMfiEhiBJgGaDbYGgOqDPtEOc4C1/2D8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r9AGg9XFzU50MYHBi7myQvprk4vAo9JhXigMxumxiywQYkR1gCOnO+kHzkafioGqqXzp29HoqNL/IBLgytTOYYq96H9rMG+6uaCLu8Y/AqP2JzcTovDBbvvjrv4+PwtNCMGPnKYDY8yatrNgbuZD5eR1RAHimYWGq9x9DDfmXag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Y348zVtt; arc=none smtp.client-ip=209.85.221.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Y348zVtt"
Received: by mail-vk1-f226.google.com with SMTP id 71dfb90a1353d-5c6559620e3so630591e0c.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787775579; x=1788380379;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/6rNKp5zlYMpk4fONW4RGx+rrtp5DhLmtBHfLZxwndU=;
        b=mvkTCd9EQyYEIOrd/w/f4jXR9RZP6SIhkkBXpp50pc3S3QyKqGbmSm6fIORYOUAjdJ
         i16cdO+OQ9lkd/z8aNYP2uTicjVgwYI7d4JV5c9OX93d+BEX6Orv7X07Ss8fIhUDfLOk
         2Z5hBJdGYykwCmdFmwwT/XtpJ6LZSHV+pTg6ymFPrfpo6IJPbof9bbYNBSn9dnE2v9B5
         J0KN2kCjMcxha38BSP5vrJYOj3/r4BxMzk0mDTNEKdSqGxa48llBhnMh/yvPzZGyyS38
         kxtUih/1qbOAr3SplD150npBSSuY8O1E+B2BzLefkm12XW9mSumqDIz11J5MUUIRC/kE
         HiWA==
X-Forwarded-Encrypted: i=1; AHgh+Rqmm9t2pf73J0VrNRKwabnxkvZpfzLk9nefFvES+68nvP8KQwxHr+lTmYUYZXi6efha6Ntpji4SWD7c@vger.kernel.org
X-Gm-Message-State: AFuF++nz/6xlUKp2BB8bFEJl86qV6Yj+Mgsmh0gUp/aRTUYujebaBoAm
	KlxF0CT/7rS7q9eBepnUUbpCfvHrq73VDBr8dBPivu/zXTEuUSIiQ7MarWPM+1xcI9Nl8QMB1QR
	uF35pFAfyUoUDqxe/dM/C2rTpMdmvRM4eKbz7cEi7y3rUUXQw3wQBlpqeCICSKeNoPjwmRWqNkR
	yZR71iY4SG/LoCFaGJDy/qyx2SBpjQH104CAgF9lg2lQQRCv1Mu9tazVxzwx9UeY8W5iyHyL25R
	SRvFkVkCnnv717D00Sq0A==
X-Gm-Gg: AR+sD10IrxdcpiD3IT7xRY47XsuSc903nm29bbwOyB6WOxA5k+i4vzWFo+++isNIJ17
	rCJc1YMnMoIiI6NEW7CI4Dg11hZJe8aEDjZRwAYiBps+j50JT0h1VTlfkbQ7HQ5tyeU7c6Vu7KH
	/cKgMzuWdYtGXag0VjctXDz2YCv3ai8o64U4+QDialTlOPdC9WN+0maroJQuJudLaylXJuTJlCl
	fFeb3pPh1/clBoJPSRvuCqgHI2iuBKyCNn7aOAdaQM6qGT/pcKZKiViJxJgMEhzjgwydYmVQb7P
	IXeNYMoxJVIS3bVwF+8/RCosoNSVfRKYvjYxEbE5rYSQZk9hLlNhuO8DAEp080v6P0o6laj7COQ
	1RWvX22KV+onm+vamasyNghu0Z9V2Vveb8f/bRHjhruoR43IW6p/rQiMiOHBlj2QHOQYVOwzf8G
	QxLSNC/aUInGmfcRfd/sq2glB/8pdfDUzhnGU8pgxK
X-Received: by 2002:a05:6122:20a7:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5c65bc74f8dmr3916525e0c.1.1787775579109;
        Wed, 26 Aug 2026 13:19:39 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c65ff670b7sm956625e0c.4.2026.08.26.13.19.38
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Aug 2026 13:19:39 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso29991995ad.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787775578; x=1788380378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6rNKp5zlYMpk4fONW4RGx+rrtp5DhLmtBHfLZxwndU=;
        b=Y348zVttR1HXESxkrChofkY22Rs9Szo4Mel2Ne4yJ9ZBkzFs+EPgNTFPZceq4jSZpY
         ubj+t7LV/sAVUDUiWzSMog8hTKNjSRDKB4hEi+5DmNA7Ex1xxVc0ec1+YkKnjQHl833a
         0vjTZJjREkb2deVxFfCe/PgjMeVH47Pbk642A=
X-Forwarded-Encrypted: i=1; AHgh+RpQh93/uBBR6CT/gBqRMvnGbLAykfv3Ib/b4SNC5zR6K7RasnyGKCSjdGoPphhc/MHzONunJRR2KMv0@vger.kernel.org
X-Received: by 2002:a17:902:fc4c:b0:2d7:7cb:a44a with SMTP id d9443c01a7336-2d707cbaba8mr182678695ad.11.1787775577868;
        Wed, 26 Aug 2026 13:19:37 -0700 (PDT)
X-Received: by 2002:a17:902:fc4c:b0:2d7:7cb:a44a with SMTP id d9443c01a7336-2d707cbaba8mr182677995ad.11.1787775577440;
        Wed, 26 Aug 2026 13:19:37 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c2b4sm16611574eec.5.2026.08.26.13.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 13:19:36 -0700 (PDT)
Message-ID: <e073e341-76c5-43c7-9e0d-e7b3f10007f2@broadcom.com>
Date: Wed, 26 Aug 2026 13:19:35 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: iommu: Add Broadcom BCM2712 IOMMU
To: Daniel Drake <dan@reactivated.net>, "Joerg Roedel (AMD)"
 <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com,
 james.quinlan@broadcom.com, Jason Gunthorpe <jgg@ziepe.ca>
References: <20260825-bcm2712-iommu-submit-v3-0-7f143e7289b6@reactivated.net>
 <20260825-bcm2712-iommu-submit-v3-2-7f143e7289b6@reactivated.net>
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
In-Reply-To: <20260825-bcm2712-iommu-submit-v3-2-7f143e7289b6@reactivated.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/25/26 13:56, Daniel Drake wrote:
> Add bindings for the Broadcom BCM2712 IOMMUs and their shared TLB cache.
> 
> Signed-off-by: Daniel Drake <dan@reactivated.net>

Only if you need to re-submit, would you mind listing Jim and myself as 
bindings maintainer for these two files?

Thanks!
-- 
Florian

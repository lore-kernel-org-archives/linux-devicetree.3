Received: from mail-oo1-f100.google.com (mail-oo1-f100.google.com [209.85.161.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC584CDA3B
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 21:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284374; cv=none; b=sZHb1wqdmWAo5E6FMi4H50LJ4jPqt3PQoyji+lgCusn6Xu53suJqxnw3POUmEA5/yJWVKtOvf37QPLiWbvP+IeaGK8diCR113u7c/MAomsri2eK1/NZu7KGA/ec5hLZ+VRiBNpkjqKrGbyddZ0Fp4d0unn31zRXewBcFGNB/31s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284374; c=relaxed/simple;
	bh=rlPdolT+Chhji/nEjBLdBkwo9wL9te5/uKOfpt6lX1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WRza1LDUbAxMtaC1ribVJ9YkjHLFejBhxvlx11SPY+c+npg6P61dZTtva00l2y2drckkY7BMBIMYO81HrGEH5u1cJwy89C4y/LkQpxUV5n4k3zSd82CnugYVOw02WHPExyrA6+p527NcC4tN6lgFZQciiV2wpbCr16IIGGIvyTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bbAuAxa5; arc=none smtp.client-ip=209.85.161.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bbAuAxa5"
Received: by mail-oo1-f100.google.com with SMTP id 006d021491bc7-6b37782d003so74570eaf.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 14:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284371; x=1790889171;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=skcWtpxGtZJwW4Q1vAThTtylvAwrMeApRCrXkDCWfgY=;
        b=p9LZ2TOhX7lQTHhJDc4Y4HebO4y2s0bIkO4CK/V0htHisETJjDg6aM2JiyAq282xYb
         9/3a4jCFL3wOuASv8E95Zz7BbZp4h9l4XYLEmGTi24Y+mRiWXmisgIoeSUgNku+11DL7
         OsbQxGPN7glRPs23u3S3LINd2qOFrIufgYdtZHhTXLSpHKhPv9wbeYoV+q3dljsbBHVb
         BDVKrralQEBI0rMne5TFuqxCNSTUtohZN9wJt9otMaJlINw58HsQzhIq0P8cnFwFZ23d
         BCwT1dDrF7gFlRf6SIhu9vOIwuzoYE+8lgqfaIyNt80hqlDahGLb70sE5O8BmUYokHtk
         o7+A==
X-Forwarded-Encrypted: i=1; AKwUvBzePT/lAGXxiXPYeDNDQiAOKCfaadyDapAZ3gdCvsToVyowutDqL1FQ7nJoIMSAJJx+o+ruWseR3GYB@vger.kernel.org
X-Gm-Message-State: AFuF++kc+FnqwIfxd195wmB+mdy3D3Vdq7dZMvZPWu3lWNxbguL3Iemq
	cmdFF/nydco+GflkcB/2pJlEN7DaPcLuQxUG6Jn2+147YHhWpA8PNo86Q88JebcSiUvVtaQtz02
	oHAT1/XpVHW6wIzRQR3dgBhOXRkE2uVNPmeWbLBR7Ata6TGBaE96RHEosl0b3ny7Pu9Jofjmdu/
	h7UiTSUPmH5CurswbTfV/LnaQFCHjah9myd//hzAd9xMu2B0JGMTjcH4+CbDhOAcsKsPzRTa/2Y
	zijB9X9HUfL/86DgKDV1Q==
X-Gm-Gg: AYBFou0DnjOfuDEM1GTFaTmmTuKysj+IKjX4Gbdp6trrNoRypmy/gYR4mKImV4Qwib/
	CIVmHXlbqzk0PhLawPp78JuNbGD6QFSxNwrts+FvDOkabWlEW57y5eFSWEA99f8NkE8s3lNURdh
	EzO+4VOGciF9kTEUu1SytbGgrvHBufBywR5iP1HZkZWxQBXke6qOTWEgKRaQ4CznoIqhOAjseU7
	GVDJSIvvai2YuiwSNJ3gYxeFzGijeyMw8EVLBPgJ76YlxuMIZz6Q82DxBWhBoFkJhHi1PIiHP1p
	fTNbBy3b0hHN81M4zZYSwFX7HlyeqUZ9TJX5GMZtPj2JysbPBdDaL9NWrQiq6O7c2a8rvSTzGk7
	jtD+7wo5xAikguvqyeT7xBDahHdBEYbRxGDHYKeFxrbuBi4SxVf6QYUbzVtMVMOSystPrulcj5Z
	mHeeH8G1rB7pRhIYgE1NF71bxuaWhf3JxnvRdxE8IMDIs=
X-Received: by 2002:a05:6820:809:b0:6cf:cad1:8836 with SMTP id 006d021491bc7-6d43f7a4af9mr3773322eaf.20.1790284371523;
        Thu, 24 Sep 2026 14:12:51 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4933500f92bsm67446fac.3.2026.09.24.14.12.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Sep 2026 14:12:51 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so54053585a.3
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 14:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790284370; x=1790889170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=skcWtpxGtZJwW4Q1vAThTtylvAwrMeApRCrXkDCWfgY=;
        b=bbAuAxa5YBO7+1YY1v7tfS89dLjpSDVaNmjN5MeKZcvSLKcxTf1HV1qKgTVaAceaPk
         WAbjVIu2hbQtR24iQru+usTBJ0c5o61QJfFsW/vRc6jA3pO87f/zlbMu9dcISJzWka/d
         4fQ/Xbw+HK6hUyiBw4//lnBGieVsvHYZRuzJ4=
X-Forwarded-Encrypted: i=1; AKwUvByMvzYnoVjgGzN/hZgPq/EMm8MCzUP/AJGUbg/KixMompd340qkMYsTHv5Ma8BupmytqmKPHp2OrRX6@vger.kernel.org
X-Received: by 2002:a05:620a:8389:b0:939:f8e9:5e19 with SMTP id af79cd13be357-93c43c2f3ecmr105807085a.1.1790284369792;
        Thu, 24 Sep 2026 14:12:49 -0700 (PDT)
X-Received: by 2002:a05:620a:8389:b0:939:f8e9:5e19 with SMTP id af79cd13be357-93c43c2f3ecmr105803685a.1.1790284369353;
        Thu, 24 Sep 2026 14:12:49 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c448eb2a4sm25619685a.20.2026.09.24.14.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 14:12:48 -0700 (PDT)
Message-ID: <7eb8da6d-0c09-44d5-979c-fe0952b92018@broadcom.com>
Date: Thu, 24 Sep 2026 14:12:45 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] dt-bindings: display: brcm,bcm2835-hvs: Document
 iommus property
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
References: <20260924-bcm2712-iommu-submit-v6-0-7b3cace86973@reactivated.net>
 <20260924-bcm2712-iommu-submit-v6-3-7b3cace86973@reactivated.net>
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
In-Reply-To: <20260924-bcm2712-iommu-submit-v6-3-7b3cace86973@reactivated.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/24/26 14:10, Daniel Drake wrote:
> On BCM2712, the Hardware Video Scaler (HVS) is connected behind an IOMMU.
> Add the optional iommus property to allow describing this connection.
> 
> Signed-off-by: Daniel Drake <dan@reactivated.net>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234772E1F06
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 20:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785530653; cv=none; b=YowG4oBvUXz5IkiQtcmub+GNvMf/a9Sy6I2p228poyfnWtJAho52Je3KimlA+VwoZXYH+hh7gtqIWdWxd+kgjRihzXyWAIXm3Sia/SBo+WjgPbuXIYRgjLXDYpx94HK26QbSbLB103/ojnqizWRN6fHT/4CNA5zR5lqx9dqPWe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785530653; c=relaxed/simple;
	bh=aRi1uizzFZhZq0r24/EJnusA0cZE8jNpcWFfYhSNm2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KudX8oIy87SwKxw9bFn2O57piVx9zVLU4+vhSibkuygimkgNLiXxM1ZMf+08uKRTS/aYfQRnpuV/d45uyXf2pHNsH/OvRouieEI0ICu1raWKWB8Jxp8UYQeZJJxa9qZ0qpMYqTkPsJasFXAZ3DuvK8IY6LK4l7Vnbiy8yyPFWBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=M5vvLnlc; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="M5vvLnlc"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2d004f135b1so15153715ad.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 13:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785530651; x=1786135451;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Nek8/ZvkBcwqsEpdKKDo1AmriorOCRUNaOmJzZVPf30=;
        b=MdSs5N6+vXST7MmSS5JKR8ZKclobie1sMfD09Z9MDpjUmqaHidmfbqr36YUbCgKsEQ
         Bo8e6tWHTf19vq3xnm/u8Fn+AHo/roGayc+CFGh904BmOG9c1sfVNfdat0hjOgN4WZgg
         Sz0i0aRJS0bPinW3+mJCDfMwgk5VYwAhKly0m4ibE3jWJyPxgVzRBDXq4tUdviWx6P/V
         IlPajwgWdZBfdzCiUTJwpomkpIn/h1krimAc15yUs5asm/xHmu4pU6d6K/Rfy51Y/Yw5
         V9UnX8eg/d/45SVFLutOKIUK/4c+ncuvz1IJiwyc9qp63BDd/9KT6gqkwFdlpYgU9w5S
         +D8w==
X-Forwarded-Encrypted: i=1; AHgh+Rr/HhTai9arH7zh1Boc5s9gpQtSxvw9zLYINAs76wFX06Vl4ZSbHeuoOq5t0+mAjelPmWbRTgGUHCRo@vger.kernel.org
X-Gm-Message-State: AOJu0YxdPflIIMzdRJTHv6wBuTNy5SnpN2NSinfPuaD0WQfqqu4M12X1
	mW2OuZKeHDwJmxbI7l2mNpHQ46L5AT1C8gUdCDm+pjIlslx7HF/rthTnR+hpWbXPHKGLm9TJPkj
	lq+YpLP4o72tOwsJAkpUSbQB2XzHbBlA5szXXZrdr94uns/N0Qagpm+ZLASLNIapoQb7dwIy1/y
	uJO+HmhH++v+xWxPbOar2DNjcVTDMmrkXInIweARxvIPDjc36Vezz0BEWn+T4LQlA1T9Mxkdhfr
	bKeR9XUQP+1q14PGGlq7w==
X-Gm-Gg: AR+sD10/KYb1DqkxUJTB578A9s8LD4JlQT+9zXSchIrwCiqXu2ZC1nIaUslZZiRJ096
	XgoNgcnVKD/RKj5z8l/Ubhza8+ziap+u1IbE8fYcivo60PW86Wzh0EN/Li2SCVLStqdK2BEnYX9
	f1AK8zg1aKuCZkoJH73XJVnktIXGJmnwiNByHbaQloqizVBgFSnJh6pScfEH7GzRzJbu6B8UVgO
	tNNhOiXHfUoeM/oKeQh87fn32mvAYT6jXfqPUyhO87qF88arTpt1t1UmSNqFmDJOevg/0O+rlRc
	y7aVNzxQoiqF7fHU/9viWQqZCm5BIh4peMULEyqr7hSXnT5bJw+YxteFH6r04sIWGmNXVA48cKH
	wPqVORWqdM8mNj+BOuuULozXgVzHnSNhpMtQHqodiYZYfQ3ecebM4AUGLxfGS2eVCcNG662Kph/
	ZYHHpQZ+M1gO1NVhdOcCWmS/oxGshbOAykaixZEzs6
X-Received: by 2002:a17:903:3883:b0:2cf:8131:75f4 with SMTP id d9443c01a7336-2d05221d420mr12389605ad.11.1785530651302;
        Fri, 31 Jul 2026 13:44:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2d04ae842a7sm1936235ad.13.2026.07.31.13.44.10
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jul 2026 13:44:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso1613249a12.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 13:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785530649; x=1786135449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nek8/ZvkBcwqsEpdKKDo1AmriorOCRUNaOmJzZVPf30=;
        b=M5vvLnlcHLAuahcjHVJSUvPTBcF2MmeaJMP/3+B8qvPA2bP3LOP5gjTV03poFXfAsL
         fJdDqnrj8jbXpCMwYUeWbdXO/kcXg51TH7GksPwn8MUbMZ61SRA3CBwyIEa95a7Dt+1u
         /hiAhS4bT8MaZ/03706pDbKu08nU/ZZRKvqpM=
X-Forwarded-Encrypted: i=1; AHgh+Rr7ZTyTo/5S3h1/XmE2NpCT/eLfgighsd19BO71vcfPFmFEYnM/SBpLLavgzApqra/icHpLnXRsavK0@vger.kernel.org
X-Received: by 2002:a05:6a20:9f46:b0:3b4:5c70:ca3e with SMTP id adf61e73a8af0-3c92a74cfa9mr1160620637.25.1785530649427;
        Fri, 31 Jul 2026 13:44:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f46:b0:3b4:5c70:ca3e with SMTP id adf61e73a8af0-3c92a74cfa9mr1160592637.25.1785530649028;
        Fri, 31 Jul 2026 13:44:09 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4cb51asm9239344c88.9.2026.07.31.13.44.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 13:44:08 -0700 (PDT)
Message-ID: <d27d0ad7-687a-46f4-b6c6-f34f3232f1c3@broadcom.com>
Date: Fri, 31 Jul 2026 13:44:07 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: adjust display status
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>,
 Andrea della Porta <andrea.porta@suse.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250924085712.1040284-1-pbrobinson@gmail.com>
 <37220187-7369-4b20-8e00-0846ee0ee6fd@broadcom.com>
 <CALeDE9MfhU+hL-d1vruhCzN5vvb9LsR8YwDPOR1XmpLcygLbLQ@mail.gmail.com>
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
In-Reply-To: <CALeDE9MfhU+hL-d1vruhCzN5vvb9LsR8YwDPOR1XmpLcygLbLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 7/31/26 11:51, Peter Robinson wrote:
> Hey Florian,
> 
> Not sure what happened to this, you said it was applied almost a year
> ago but now I dig I don't see it upstream.
> 
> Was there a problem, or did it just fall through the cracks? Should I resend it?

Looks like it fell through the cracks during a rebase, sorry about that. 
Would you mind resending it since it no longer applies cleanly? Thanks!
-- 
Florian

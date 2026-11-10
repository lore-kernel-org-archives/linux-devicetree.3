Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794271177;
	b=OFWxoue/AjK10l5/bLGHJhdinECJsltEK3ykWCeFf/bUD+QrOiymQB5hKEB15dyQNV/c
	 5MPkn581/eu1xqPDUTML+9lzJUrzEFRcaVMlemdcMfpK4qfydKKVyctu/cEXIyWY0UZXF
	 +KfkCXyWAAnxRJ1HqTO9eOpt1q0EW4AdOV5GoGrfWXOYm2jJ3Ichzrv/tkTLkF4+2XqXP
	 JStGfGePT07nvajAX9+B+DxaBPTZalCImpX4rMyJBDtmsnoB4Gfg8QbgyPpbxmv70iw4S
	 GCe3pIovIlhT6ZyKTPUp+TAi0RZEUyr0zetqyswpbXsgaNQkEHmLKZufAFAbYjsDNKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794271177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=IoWT26L+lCNjLByITvEDqGCl/vVklbh6utt0NNZqd+U=;
	b=w0ZaU1A/F+FbPMFDdOGE7e+HORXbYmpTTAgKlkwKWG/ASt7Q4nL85wM9yHn/mV5hkUKb
	 /5jYeQyjbZBFT7RikAg9GPm8Gmr/l54oG11NIC8kv/Uzxk6TWhzhFvnkCNzQpbRW13BDz
	 h0L+pr2aqZAaEr4kUVtUDz4r+j9Hb9lzoDwbYjBIYhCVDccL2AYCqUVjjPaIub2MYbvOF
	 svDgSGkbV/d1b+PuFHspmAsGbPJbHEeVn9RjEprHTVN1W2ihrX8uT14+GoaWIjtMYIT2s
	 wJp/+Mp0+A61w9IFC9ic9ZAioOwBp3dVmu7E8Eau/9BKjA79bT7BurEIKzSAzV9HY7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a6nYydig;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E858606A321
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 00:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E858606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a6nYydig
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so936403a91.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 16:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794271176; x=1794875976; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IoWT26L+lCNjLByITvEDqGCl/vVklbh6utt0NNZqd+U=;
        b=a6nYydig6QvSKo7EkEElyV2YraExoirso0hjPWfiBXMd5zbsE5V2+ys7gBTXGBgLMy
         KztL3S4lXSLQNQFXbomWBbd4uwbtyFzJ3PlMxe3uSSdlmkG5VE/Md9tv0hOKnruaYi0x
         aPiGZY/Lb/b9UIj6yOm3Bkfm7pAV+dJnpXqlq919gh7//xQg6gdoEVc1qcuuy4ZsBpqV
         bd01OkHyArnS20r2xDk3ROR//CEabXF5XGAQjI7VyXzuf/s1A2ioL/h/VL0QUAHHRZFz
         iXsyGWYm6ejppGHGdXnl0oclHQR9TKzhn0HYYCOubjWw6Rhb4LBRNRyKYxgjASXaQTqt
         k2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794271176; x=1794875976;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoWT26L+lCNjLByITvEDqGCl/vVklbh6utt0NNZqd+U=;
        b=KTioc1bo6oIWS7dez09iQUFmFiHpFTOcBEbjduiQuEoEy5TrE4BN/7jLK4248g0z0r
         GSNBZ3SaUczAgeeD6H86QGNbkPQ2xq/6DH2Y0h1v6BLUVKvMRkhC2S5+JcetWNwQioV2
         3ct5V3SoT1oBs6L92t07c/Jtw6/P/oIImAfIl5G3Bj6sQMO9TkpOqt+l+MekrW+ooKHH
         /rMPxsN1khySdkQ9l0t91F3Ra1RxogyYUu0+yEkTMhmblR9IRIrTgbdLIbE12nEn7FEx
         7JXUOx5E82b+oMEEiXxlRwZ2BdsEtCGFT26z1XruQg7EpYal/aaPWNaUp2LebtStSXoS
         +lXw==
X-Forwarded-Encrypted: i=1; AL+hErFNhZbCngIWACyj3LHKkBJbqudYPxrw8HR0j5ZfX4W480EoCLkqeV79CzW9XRWN/RSmr5nkM76Xj+9J@vger.kernel.org
X-Gm-Message-State: APuU4Z8Pjn4To9tB4ZSaip/sZPrJyEdMiXLcEigfQFhhzdo60hXc2eve
	Isvh0n+g814k46rob1Ulm++OFLvivrOE2GijUNyZoq5eMVOELCjifTRf
X-Gm-Gg: AYBFou1Z1Jhkhfzqrfd/LXwbxUyn5ZcgFG/7adIFORjo5EqRae2bQDvDDk91oXbL99v
	0JXMt6vNy9mbhUBOMDm5H97xgIDKIZVMFloE2fOZ04pFc+GXM18hPxfZWXX5fqxHuSqw8kg2yer
	tBsolXmb6IMtwq5mgc7EiC2l6S/xHeJ5rgolISJk+Vf9NPYXpOZaJxBVoCx9+5rcvBiwx+iVKxQ
	uA8PUOK6DT7A7ISdhbp0iZNtI0Rh+/6SsXXDVY3LfwxZtxz6Fyro+IjVCA9TvxDPbR0XWOTRsoN
	B+kMb6LDcXbBls/XDIIiCDnA2QYWXMCOq2pXFjNS30JIN9nAoypAJdc7tNzpaFZF+0jX+5NSBs4
	i8WpfNTAHcrKr1g+aDDK2mowoTFfo/B6drfapmMzo4LGEU3nrJDG9zezCHGRLqtOUktaOXjQRj0
	FQusDhrAL86zWP6DFO9vdZmU49Lrj5XXHIFWK8ge0jHQhxf5lD7SdhtJev7P+1naWMiqkAMrTLz
	jMfi9S+9mLHdjON6hwMMm7eZS+z+SxTu53POZj2x1193fo3T8jCi9eRgavQkT8ep5QUlZmuPbgz
	i28I+x28LzrQueF/3m7kBNzl738xptAS0pc288gwr31sYhD6/Va8lrQ1b8exaU7SrLH2EESsUy9
	PwNen
X-Received: by 2002:a17:90b:4ad0:b0:3ac:9d83:8856 with SMTP id 98e67ed59e1d1-3b166ad1ee5mr1415032a91.9.1794271175917;
        Mon, 09 Nov 2026 16:39:35 -0800 (PST)
Received: from [172.19.1.51] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16779d5c8sm1512711a91.2.2026.11.09.16.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 16:39:34 -0800 (PST)
Message-ID: <d2f451a0-33bb-47ab-b31e-aa40df9d7ab7@gmail.com>
Date: Tue, 10 Nov 2026 08:39:18 +0800
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
Subject: Re: [PATCH v2 1/2] dt-bindings: dma: nuvoton,ma35d1-pdma: Document
 MA35D1 PDMA controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org,
 Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, kees@kernel.org, gustavoars@kernel.org,
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20261109052900.2960473-1-shanchun1218@gmail.com>
 <20261109052900.2960473-2-shanchun1218@gmail.com>
 <20261109-petite-imposing-ermine-fbbbcd@quoll>
Content-Language: en-US
From: Shan-Chun Hung <shanchun1218@gmail.com>
In-Reply-To: <20261109-petite-imposing-ermine-fbbbcd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Krzysztof,

Thanks for the review

On 11/9/2026 9:16 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 01:28:59PM +0800, Shan-Chun Hung wrote:
>> Add binding for Nuvoton MA35D1 PDMA controller.
>>
>> Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>
>> ---
>>   .../bindings/dma/nuvoton,ma35d1-pdma.yaml     | 71 +++++++++++++++++++
>>   1 file changed, 71 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof

Best Regards,
Shan-Chun


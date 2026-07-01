Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931033C4B9A
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 23:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782949083; cv=none; b=TH/31Vrn/rjEEhCjFwDIxb+47Y3ElVN7jwrd0s6P0COr8QOEkf+ydESGpK6N482R7qRcTi/nZexDWheQiEQ8Q6cN6KvlULWng80xPgceCwrOtZNY+ljo6m1Z07F519PQ1mJtGKoE5khjmR+V6g5FSp7mdiAlPZVnJr09unFaYII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782949083; c=relaxed/simple;
	bh=Ul+8pa7VUBwqQ9vUFj7cuT/cSE751FIa+VX8ioXeBlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QqnNGNV5fdFs/Ro+3sUPf95pNOutXRDi4oPJ6AyQFYMMwXNuCmQpDAeb+5ZqcQlt3GBb9CcjapKLk/MSWRarlNRsA19h5zNDa6BrVtSCiMBrX98DvBV1uJH87pUBAcZTHDENa1lB9vr5iAtRyS4uVWQzq5IhwTDxnMXFISWv+BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=au6dbQ19; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="au6dbQ19"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb36c46bbso140284e87.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 16:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782949080; x=1783553880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OVCh6Lf8+nzzdAxzyPMuHDYAnEuNDpXn+opdGjJoaxg=;
        b=au6dbQ19ocDmFW8BHJn9lEOMKFQxa57yUbSs2zRJi99wQw+wZvrKCbkurmaCo1z6ba
         QqM2NXH4gWIXH+y1SspK8t40P1Q3TSZVDI/a69Lwf0KUdbQMnQBnZ9pkPaEQ0lCDYBrx
         14+O5E19dxpdNBt2Fi2znI4X9LzOa6UX6FgZKAO8B/l0GcqH+RzLAs6PGLJ9a6CTr9j5
         O11S5Bx7XBBec1iTqvBjlrAJHz4STwdd5cWuvF3505igPFahuo2K6LYpBaWIT8X0BQJU
         nDtmRGDQ+9IkksZVfVem2NBE23modaHpD8AmkTAi5DQcbyiypS/zQ1zp7dgHVK94vuo0
         Gxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782949080; x=1783553880;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OVCh6Lf8+nzzdAxzyPMuHDYAnEuNDpXn+opdGjJoaxg=;
        b=Axt0pVCtsODsJeslvtthGJX5HnA2+QG1I+CKbDQEnog2msZ0xBauAGe+vLsawT47cx
         7jjvx+C+7oBKY/T4cm40WSECumElGh6TYX2B+fDKXxlCdTxr5Vo3cpxz8OXBGOwtREfr
         EFC5UAlbS/Ww+gAYP3yl7VhS0kCnZK/ync3kLo7MHfOtaDOVg2AawyXJPQOhNwvTiuuW
         0urVRM55B9v3FWpt+M21brg8H8OrfQKoAaFUI44dsURDjzBRYkZ9q4frKFttf4DnMORn
         dn3LkIYNtR2OwB859083x+f+FUauZrdTxLfWXdp2VPABS21RAL+R+GjW7g9gC+w7RhZ2
         Hbqw==
X-Forwarded-Encrypted: i=1; AHgh+RroFdjnCDg7ov9jwkV4Zfe5kbQtYDDyVMO8NSZlCBNUnSn7ziRXIQM0X7z9E2PNm2FXgR7VamJ4GySN@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqx2807wXSOAnEHBTiAcPTE4CchCGRf7MkZbpFFVP6RKNMC+mP
	CVGMGonf1N5md8m3kfpC6NKOFmMH8+mt+oDEUMQy/sBRSLh6kBasiasM+avU7CNCXTY=
X-Gm-Gg: AfdE7cmgQcPU9wS3bRbwE1MRVAaKkIBgrskFCutucRuTQLX3i02VT0FCvE2Ojex1sQG
	Q8Wta2mx6/d/r81MtpZrETyf5CFFPbpSyW1IWMLrRN0ArteGsxIkmVLPflbbUxdVt2ljb7WKu38
	Vt36iEpWaw+1sjq41EzYfozciqypmTmemNgvLGTdCbnSn9srVexDtp91cYDomsn6hv6Fjk59lPA
	LlNN/Q9YSSnBJf45uCLzequByi4gQkNSi7jKSRF0w9BP3IhWPBBTIDceNObzb5X9agM9YNiZIZZ
	2maA3fvfZkFDqglpKYLz3EdlPgzK8SNXtcv21NAh5fVZP734Sn2Z540rOskC5FtYP6SsM2w7dNK
	TViinQ0g1oYLrLcfiavLMpKExibdatOv+SESFC5aja+Zii8jNfc2hfKEEdtW/ZUHIDvHo0HZvPw
	8gmI9cL+dBz7vnV5GLJ7idpuxUjyE9ZmVyRWXXlqH1XttsTV4TzypoRUwBkmXqQ7zpLZY=
X-Received: by 2002:a05:6512:4613:b0:5ae:b17a:2617 with SMTP id 2adb3069b0e04-5aec7435771mr533633e87.6.1782949079808;
        Wed, 01 Jul 2026 16:37:59 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89dc478sm300818e87.68.2026.07.01.16.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 16:37:58 -0700 (PDT)
Message-ID: <ae3a381b-5697-43ee-bdfd-aaf2d22ceedf@linaro.org>
Date: Thu, 2 Jul 2026 02:37:58 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <7c564df8-5c5a-4b43-806e-5e017e5c51db@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <7c564df8-5c5a-4b43-806e-5e017e5c51db@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/26 01:54, Bryan O'Donoghue wrote:
> On 02/06/2026 22:59, Vladimir Zapolskiy wrote:
>>> +
>>> +  "#phy-cells":
>>> +    const: 1
>>> +    description:
>>> +      The single cell specifies the PHY operating mode.
>> #phy-cells should be 0, because the PHY operating mode is well defined
>> by 'bus-type' property of an endpoint on the sensor side, the opposite
>> side of CAMSS/CSID as a CSIPHY "consumer" should not dictate the PHY type.
> 
> So going through the list I don't believe this is correct.

Be specific what is incorrect.

> 
> Inserting bus-type into the PHY layer is borrowing from one domain
> linux-media and pushing the concept into PHYs.

It's the other way around, "bus-type" is an endpoint property of media
devices, reference to video-interfaces.yaml to get more details about it.

> phy-cells = 1 with CPHY/DPHY specified in the consumer, as was Rob's
> suggestion will specify the mode.

This cell is just not needed, and unneeded complexity should not be added.

> Then to understand if we are in regular or combo mode, we parse the
> ports/endspoints in the PHY node as we've agreed already.
> 

That's correct, and while it's unavoidable to parse endpoint properties,
a phy cell value will not bring any additional information, in the best
case it's useless, or it opens a door to a clash, if different phy types
are occasionally specified twice.

-- 
Best wishes,
Vladimir

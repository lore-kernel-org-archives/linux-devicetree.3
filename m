Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201770;
	b=d5KiT4i6j2tHgtimt4oWM1Atk7FGa/GUkR3hSCOtIlCrbqMZ5fFrXJed2KKhjZro9L6u
	 nqXyqtApanPDIMlRiYV29tqLqcDwVtF5zQnstDvcXSlEnBNemUfDCqDoHWTOnqb8Pbi7I
	 Bl93RB4wTbYbLdYAxIPhQ8VvmWwyBnMdjiUHp8qTeQxHcnMTm7RRgkN2yoP6UPW75Kxr2
	 gQrcqBbX1VtbU6OK0MdsORVTxVKl43DCfK7/6p2VJL9Kq16ZW1sw1qC6SlFgpj4VSku96
	 zGaD0vxm1fRLWYELKKSuc13kfLOY+rAPrMeBKgAFFLlico8mJBRxM6rfoz2DgTyoYzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=tnqJ5WEWuOH/sryca1mtSF1R/jE94CQ0TEC1LthA+kg=;
	b=OYJa51VW85Iuqbkng7ReuTa0u32tOb26/9N8kU/TEW2bKwBVqzqMjDqXuGUjMrS2KejF
	 W/NbsTGymo8DDwfKWVbo7gWFLTrhhQfYnaNxVBulRRH17ZzJH49kk1gTrweYjxmi9zfs9
	 XiyHMcCXLgH7VlMGYC68gBVaDGPVm/+uL9JrYfvzGGOGGmD2yx2dbYLLy9XLERM4yJZLk
	 LABo15HQ7Zc6LFKblM9gjJzqqSPjqbzBAT265W3BXLwMwAjfl8iAJQutQ95hd4cVa9Yrn
	 uKpehzkYvpoGikYKHYJFwYo37pZlWh9c17fvFhLhjUF8dkRHzO/bCe5W9ix88I0izwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UZ5vxgZU;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC385606A31C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC385606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UZ5vxgZU
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so10157145e9.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793201768; x=1793806568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tnqJ5WEWuOH/sryca1mtSF1R/jE94CQ0TEC1LthA+kg=;
        b=UZ5vxgZUunglt4G10pOQzIVVK9fHKqQKfOoFuVBy7okRyLDlBjGEnBOAeVPvW/aOMu
         1wadd36u1eZDO9mNluALYMFMr2+yMlApFveU9bZa2AhqrkIBMH/ZGT2XzMH6Ip8dReJJ
         aaKalseqlpgjcq1GqbUOS7FDjwY75yP2MlyOmAtKaBRs9Z9m+SAd4S/uYNDPG25kNINs
         F2Xa+qviSLXUBhO+NSoVvdoqYgTbouK6lRfZEf9zuBTvBNF0FDMNl3Epf/CG6nwqcmeA
         V3hZ7yHlmaIiiI71wRfyx3A5JlWFE1+dM8uK/o1xLtkwEzrLDHmo+8/AzAaLuXjZJ6K2
         8mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201768; x=1793806568;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tnqJ5WEWuOH/sryca1mtSF1R/jE94CQ0TEC1LthA+kg=;
        b=sje9uwD8fWkO7W79K1u5X2HPbnQMaO/074MQ452Q1Xa8X6P6h2Rq60T6tmcqHXW9Iw
         JWR0KbDkHEzmx/z95r3T2WsE/W7LvoW+eo2xHo7hsjk1ohIOcdZHUxAfzA8Fga47Gx1d
         pNlu/CCztUlijHiZlFQLPtiQmehvBrLPAzOVSCDJjqerU35u1LH51ZhGnUzZod5i0z37
         EnbGEoOqofeUcX7fkL87irEbIYaK/vfNN7J3KJci/CagWtZyz2Lj2EYFAAzFLESLPzI1
         u46fGzQA4jTezXpeAnb4L0dDxq6xQDVsPqvvhAkGbYGEBarcBaUUNzSO1xJeoisFFZtk
         Ow+A==
X-Forwarded-Encrypted: i=1; AKwUvByDhM903BQFA+l4k89N9BDDWXLcnobxAUn6H9bZoCqbZmJ7yQfE8YtnxDWwGmHd2OhAWiETdzUa8w+S@vger.kernel.org
X-Gm-Message-State: AFq9FYKVB/rLYS3ztK6AKCCxaMg5KfTEg7ex563PevriL2zD+8Cry8Bp
	Zl6+1TH6KAqJMFgfAw6dlgMABwE84IDJbHBLMA0aL9WgM9HmIPQSBxHk18hF/crk0TE=
X-Gm-Gg: AYBFou2amw26pE6iAgPljEAeC9JDGyrhhwbAVfmrHaoLM4aRVZqEpdTHZ5fLU8nyORV
	M7foRsYz9XHWxw5MiYRDApsuPF2SbhvtpkqWO3eywCtSXXKtoVpHSyfsBa5CRY86AJ5r9W7J03l
	bFIUws2eCxRJVZyUgYHJFSZFqiZ3gr2urVTjFaMj6mbKKrGKv0QsySL1yf2ii+Y1f5W6Z9eoeyr
	LX4u1i3joLpmcfm0hLrIWGzivoRo1l2wwm2NjMfLOWXJi2v6Etx9Ttd7Y1lLRT7YWsF2yia2a+i
	GuSxpozJ4hb7Kbg4OiradOZ3UHtY0aJqJKWy9YXA+pPOjOTNeo6y1X1gWXARqdt5rmD79TJh3SA
	GqV+2yIBwPrUfTRkLXhBUW5qgAcu2vl8ArKpIx5dojOYIEBT4Eld/LQwaWe/r/+278Lw5BOan/Q
	rC9DnC8TJ4oAvTXyFMzV4R566S0qmnQ0M3aCIgOuzNm/gSNOs5TAfiwqCUcn7MV4V76NLt70fPl
	eXZ3alacJI+Tr/Enkj17TX4QMs9+9jKq5PFS2c4ZOTkmethpLlkC/jAy2e2foA6XqRFcl5QebOq
	JYeaaHIdVQwq815ReX0V1gdLZiv3lhS3wAecedjtKw==
X-Received: by 2002:a05:600c:154d:b0:4a3:5a42:b2a4 with SMTP id 5b1f17b1804b1-4a96720266bmr62849985e9.12.1793201768098;
        Wed, 28 Oct 2026 08:36:08 -0700 (PDT)
Received: from [192.168.0.167] ([109.79.76.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05f168sm41594465e9.4.2026.10.28.08.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:36:07 -0700 (PDT)
Message-ID: <ba560f04-d817-4b01-a1c4-293165625f07@linaro.org>
Date: Wed, 28 Oct 2026 15:36:05 +0000
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
Subject: Re: [PATCH v23 11/15] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-11-95f250b18612@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261028-kaanapali-camss-v23-11-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/10/2026 15:20, Hangxiang Ma wrote:
> Add support for the TPG found on Kaanapali. This TPG uses hardware
> version 2.4.0, which drives test-enable and reset through the
> TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
> TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
> CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
> the data source when a test pattern is selected.
> 
> Add the TPG resources to the Kaanapali camss resources so that the TPG
> subdevices are created on this SoC.
> 
> Signed-off-by: Hangxiang Ma<hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

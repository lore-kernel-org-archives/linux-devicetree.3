Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354734;
	b=H64O1Aj4GkdFIDQB4kpEhlbZx3DMXm6uUu9Z38/K+OUKNR4/UabUfpjTPucLbqyFFi7U
	 SzPTUb+ANhfgmbDl+HGxqZqiHgQq/MTZcIfhCZnWlfFozfTptmAQYWCk5ocp55n7r2HiK
	 tl4rqhvUESGtwogkj1PLn+Nk2wFeqbrLyiZrUC35ytnnYjTB86xf4Lr0+B5sRkhPbX07l
	 ZCylX9COd0FGfHfK+EGlU4urQE+uYCZN5DTwB0ca2Vp4TcGgm76nBut9xQI9xhRPBah0G
	 sHmjU2K77rGp62dCBNyVyH4b+tbGWfcJey5/7F3suasRjhfoqVvUtiaVrCYMyF4W2PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354734;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ZW6/d6tafc93+2es2jKCUdQztkgttkGrcDy02n1rkws=;
	b=PYOK5not5H9tvn4Y0pchoDtljIT147Rorc5pPC0qS4IqxCuoOaro8GlJ6sHbca8zvb/X
	 Nq6BnQWnZo52atKoRP8AxfwWRVmh/NhurZEi1JECVfLrCE4pPBXKeYMEizQKZFsDTci2/
	 9PjVuXcXGxmufV/ANiQUotoYzjYdKzqVPGnIh6aNAM/qot48QL51JeuX4KOvY1EhfVlYN
	 YvD0LQmty5UtK0bT/PMx49I1JNiyhQ4Sh07UNSdPRB311wi1zbqpfoiTii4xxUs7Q+5/u
	 xa/P0kTzN5KZ8vVYcLvDOfpCfYbpzZ2GQeQgXovWDDlTHgYpolbx1YqZ6zbaVNdgh+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25E160A380C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 23:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B25E160A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67c02c106e6so2922250d50.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 15:52:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354733; x=1794959533;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZW6/d6tafc93+2es2jKCUdQztkgttkGrcDy02n1rkws=;
        b=JzgF1bAdZAOli+a7R4N9C6cdg5Wtpi1OSnxNe7OK62v4psvfun4EDb6lLgA+QiHt7m
         M8GKr4teiE55UgpiS2Vwt+/5ruTipmO9nAv0nl6z4BJk701j4Dj1Zximz1k7heBGyI52
         3H8jTuDXU5OJzUhp5M0zQhlrkv3DWZ13I1GiW0A8ZyJf7Uqgb/ZGp3w6FwA0m08ZE6P+
         no7kBTPcdN1G5YX9v9129S4wc02ivPz/+9U3nfSH4E03NuHJVmYWIp2wN1Owc/nBKvAc
         CBededMh+8sGpM8ce4keq8EJRWJM3Ql97gpYQ27TWBuCyUBvhkoLy/0o2JpddfjYhAxb
         XJ0g==
X-Forwarded-Encrypted: i=1; AL+hErFuF6GKVLSy0me9y6Ebuin3Bz91cd1SZeL5CFrmDxDrr1NvsEKJ94lila8uNbmFyxZeSo8kcOvZpCIj@vger.kernel.org
X-Gm-Message-State: APuU4Z8ppL2DiQKPuGRLfA51QdfBRHo3y3wTwMuRdsb3glbmksqqMqEB
	Ibltli8PJWaCcyva4wDOPSnetQVwDE/kWNcO58NlmwWQDxLO44YXT/BK
X-Gm-Gg: AYBFou27U+7HXpA+o0p4qHsW8KyWM+RfUp2NGcBX5XL+M38B2SuUDXOviQXydgAD9wR
	2N5p/bR2KDwxjxHs61jSEy6u7JddBy6MVJhYu2HNJcY8RhbraiIi07UXz4pC1Io97u3XPNMQKEy
	Df62vGH1zxR7PFjm7jQrqdVKsV6uSRtn6iGUTdr3DxdJ+8waxObYbZNPwU15gX1ditDSYvCodZI
	ybVAz7ha5k3c9GmFdU0Df1DmXZMgLti43eXitfxbmUczWsG/Qlw85Cd3EXhcAoLlZh5/zlUohRG
	8egzf5z72B96t3NuHKRh8LprCLaNWlsd+5GCFxCsiOKj+cgLkFIBMgT9eas8333NjOv89VwImk1
	R6PXnjE43qGxvVVO4abbBsmjL+QU/IC5asYfRzh/Ey9r4UqgijfXxmkVr/AqXRrLCc/vgnHm4kx
	fGMZQHFAq7ywwbiUgJokMwsVD3j7RmUZF782pt4NBJFDobYtApeO1ZjlWthVVL9lgH5zqawyJh9
	LUQ9ZR9p24KGWXY7AACvR+xYVG1A8UBGz05mY5df6raO16FROdpT+/FBUebB5oYzSk08OAklg7S
	ilz0D01sZI/0Rsm2VQ9mhjZU4QktKKjNdTEchC5wb/3xiC0VhcGUywypw1LOicDagGak/jp+
X-Received: by 2002:a05:690e:16a1:b0:67c:17fb:ecaf with SMTP id 956f58d0204a3-67c67ee4a9dmr690322d50.26.1794354732657;
        Tue, 10 Nov 2026 15:52:12 -0800 (PST)
Received: from ?IPV6:2800:a4:806:ef00:2f77:7097:372d:6d14? ([2800:a4:806:ef00:2f77:7097:372d:6d14])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589f065dsm3149000d50.16.2026.11.10.15.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 15:52:12 -0800 (PST)
Message-ID: <f127954b-2255-482b-aa3c-cedd2311f77e@andrewgigena.dev>
Date: Tue, 10 Nov 2026 23:52:03 +0000
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
Subject: Re: [PATCH v3 3/7] dt-bindings: phy: qcom,sm8150-csi2-phy: Add SM8150
 CSI2 PHY
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-3-0103e8a0bbcd@andrewgigena.dev>
 <a9ab1add-5f04-4687-83bf-ca29a068ee33@linaro.org>
Content-Language: en-US
From: Andrew Gigena <mail@andrewgigena.dev>
In-Reply-To: <a9ab1add-5f04-4687-83bf-ca29a068ee33@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Vladimir,

Thanks for the review, replies below.

> Please double check if SM8150 CSIPHY v1.1 is capable of C-PHY:

The hardware can do combo mode, but the driver only implements D-PHY and
returns -EOPNOTSUPP for C-PHY, so the binding stays D-PHY. Would you
like it documented as "not yet supported" anyway?

> D-PHY combo mode is also supported on the SM8150 CSIPHY apparently,
> it shall be reflected in a way that two endpoints could be present.

Split mode is described in the binding, but the driver rejects it, so it
cannot be used today. Is it fine to keep it out until the driver
supports it?

> In downstream camcc-sm8150.c, PLL0 is on MX, and PLL0 supplies CSIPHY
> clocks. I believe MX shall be added to the list of 'power-domains'.

You are right that PLL0 uses the MX corner in camcc, but that corner is
internal to the clock controller, not a power domain of the CSIPHY. The
PHY only consumes the top GDSC; SM8150 uses legacy GDSCs, while on X1E
MX is a real power domain attached by the PHY driver.

> Still it would be preferred to get 'vdda-0p9-supply' and
> 'vdda-1p2-supply' properties.

Renamed in the binding on v4, the driver and the DTS, matching the X1E naming.

> In general the change looks good, thank you, but likely it can be
> embedded into the scheme for X1E.

Clocks, register offset, power domains, lane table and timer all differ,
so folding it in would need if/then blocks for almost every property.
Would you still prefer that, or is a separate schema acceptable?

Best regards,
Andrew

Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78535427A1A
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 20:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182821; cv=none; b=A7DUjEHKJEPMilFs11HTTV8ouUVWY/DvzmDBBeJmVynMqHRE1dLTFYpI991S6sG1RmrgFpubGh6oaHMUZ/rouiVhPFBZImkyi4kflpqqoXPDGhY59sTuaoJnpBz+aLmby20jw+bRfmOiaGh50bVCqkQl0LnmnLgbr+J7IM35ff8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182821; c=relaxed/simple;
	bh=h0sPLnTlsUQxhlB/c/4nYrnOp2ouV3eIdQwx3lmCH+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LhAPhLj2AupCwYmpUjEhAI39APNFXDrQQq0rAd5fAV2avaGWx8DTodEkPq5mzB4r7Lk11aYXzRTmYdWUC7Yzw5Z5JMqm01oK0GxBDfNl2VqLEfj798VShgfQBu1NfJ975B/tMSdK5DK/BGwpCIISzzt3f8LVmV22iEydejmbtgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IP4RtJF3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IP4RtJF3"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so30613905e9.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 13:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785182816; x=1785787616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wetn3gRf3r576PuDu2lS5jC7fWv6xVZ19kQlvaEDCdk=;
        b=IP4RtJF3rSzydt089Nj0JkW4zbUgHECZ8tgZ/5gKOOV+m+WF+KG8UOxDb9A9nRpfxt
         VybnBUgBcp8k7zTGRn7Rw+HMYlOK/k82LbtoM6tPjz/gNGzoZ9q5sSm7Ze8n2T3Cezbw
         JT5VXt+cH0RBkIhpzn0s40iG7uVnp06eAYRoS5d11cEtL4BPe1ueWY82v6sGQ9pbPwUp
         5CVMk03d4m23SRjeaiuB9pq9/miaScpikW1Pjwd/udTsXwU+yBcx8dxNWJF0Gb1tQiqH
         wb8F2EC4hErmTi9DaH26kIgy3Kw9R6uGiLogZ8EonUjyz+6zewolhDnglIPR8SpRhmmi
         Ne9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785182816; x=1785787616;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wetn3gRf3r576PuDu2lS5jC7fWv6xVZ19kQlvaEDCdk=;
        b=DFyp9ECKFkuT07m+hzDhT5RA0908jihNkI/Lnz7nvLIrAlagUpxjy146H58ad9Srpa
         R+UexsGHfPhY/KwSRgotB0kaNdywkRIENnu7xQvXMMaLWJ22YQ/uMP6+caXrxIPDocA9
         tLHiaxV+unDgk/ZR9Vkeol1cX+YgDc8+ZLEDDkGfEbeaGvPyZbKWq9SHHmVGdjU+DXPC
         uVgM7XGFNHPvPMzaT92QCQNIewPEOVSeUByWQ4j+mUVMP2meX6tWxvPVT8SPzks5EweM
         T1HZ9q3RXWa1r2IOX8O7h2jjEuQ3kZij52jR2Otfe/v2BkPp5rp3bZzkJrq2YkXJseyD
         87Mw==
X-Forwarded-Encrypted: i=1; AHgh+RpGSmHgy9psUVSV/WWDNgqT6T1vomoROyVj62fNE9QogtW54b4m5BwX54I0Ckwy90NZXGJaXsU4RpOB@vger.kernel.org
X-Gm-Message-State: AOJu0YwhjojDNaQt/w/Ya7ffzDhbqqVIGNy9aU2WOzUcLN7OwwxaywWo
	XQIIg+WMYALEZntUO44U4rlzgugBjQ7+RDaiNep602bxNhUP9cYyp8XOHEDZrJyrhM0=
X-Gm-Gg: AR+sD10V6G/Pa0CzXjKX7+IGD23JHsyLv5N9Vxl/MJ9Ug6/le7Eu7xmpMLUmzyGN7YF
	YHzt9ESz7MF0Jg/YeZNZK1wfz8EIcTucfGRzUasr/m3JrwUthpX8djFe2WehHuUgGc4CwtIOPhN
	v1BNh0r0gVjrhqBNI9nQp2c4L0/rdNuXPexvy8DcpsV1UKMOcrQL6TC+zxVfpqk5/x9u80Wp7W0
	mS2eB142f2TCRZzw926K7vFm7DgvWv58hwtn3C5XECD7BYlCxjnJ0peCnWICFS2V6MlL9KZ2FiU
	jrKVnOPVDldAQykESKBsCCctvKHHgYG0r7YtTcqtMkurZBQT/8bWlybbR9q/ZOY+N+Dho/B362v
	WWwv5SboGsn41lDeDX4w+D/6/iE4DOHXhzrWFsCkCuE3kpxra0EtoIfpxUVXCx9it/nmaVyGdvo
	1zW/svB0KVKdofGBoOVHd1g3i2
X-Received: by 2002:a05:600c:4248:b0:492:437a:a653 with SMTP id 5b1f17b1804b1-496b5700246mr67328175e9.26.1785182816614;
        Mon, 27 Jul 2026 13:06:56 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.105.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c46240c4sm17482495e9.12.2026.07.27.13.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 13:06:55 -0700 (PDT)
Message-ID: <e9cbff02-fd47-453d-8743-8816560f0f6b@linaro.org>
Date: Mon, 27 Jul 2026 21:06:17 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727-x1e-csi2-phy-v14-0-27d1bf477593@linaro.org>
 <20260727-x1e-csi2-phy-v14-1-27d1bf477593@linaro.org>
 <1e1bc17a-4c7a-4c08-b0c8-2a2ff31fe870@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1e1bc17a-4c7a-4c08-b0c8-2a2ff31fe870@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/07/2026 21:03, Vladimir Zapolskiy wrote:
>> +                description:
>> +                  Logical lane indices 0-3, not physical pad positions.
> 
> In hardware description it's physical data lane indexes, the same is 
> said in
> video-interfaces.yaml documentation, the numeration starting from zero is
> selected to follow even bits in CSI_COMMON_CTRL5 register (D-PHY mode):
> 
> * https://lore.kernel.org/ 
> all/59331aa7-8430-4754-861c-4ba6a4810ccd@oss.qualcomm.com/

I'm not sure what you're asking for here - this exact text ?

ACK the rest.

---
bod

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269046;
	b=C7Wy3dzLVkKp0YlHN5duMmOunZI1bp/rGVey5As61pa/AvhODJnZIT0XFvNWK0tqhXJ7
	 sul7WLhKrxOQVhRyAAMSsmghv47RrVysn0lx7zCMTHCJFejNSKnnPNACSGbtpUtX/4BVa
	 PI0zhC1khIJ5wd9MqieI4H9mJPKJan3aSh19AU6rerr7MQOYgYLhTBLNiUM/yB3SsDhvi
	 sH4Yi3G99PyVgfXBi3gQzeABzLA0GWn1Jk7RY+lqOL8fQmkFCX3WMCqrPZZ2Rd99QwO63
	 w/U96uItdqtnCII72EQI3wm6bwduaCS7HAEqYbhvpLanS49uxNQxTITN7hPhssO0+5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=vESg3aj26lEluvBcaUBYlDgZP/BjzkrTsmOjKAVCv8k=;
	b=4SDIMdqPeMaZoIRkj0XWKHQU7NMpTyR3Uoc9KL+LarhqNrDpUXNSRGqMHfC0AFl+spXP
	 W/APRwjP89r/bsKZ06tAwqJV5Ua+96jcGZjLv30dikDGPBazg3mHDfpJ1G4W/TW4g7/yF
	 CofBWHatfkjqgle8eduDiz21AwudCsKMGMMXU5SK8XbDxRnLoXp6uJt3KbtDGqyOfldtd
	 /4ibXoHU3zL/chiKLK9tbF/5NEKsemBDuk7gVy2PIrBTGBBnGduO79TJTTjUucTQFWKlF
	 xicfDUkil3x8ieTzcjhkhKZtn8NETpg6FmA5izM2VkGQZrFr3zd2NWMo8+6bcLYy0ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YN77BDj2;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F59606A334
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 00:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66F59606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YN77BDj2
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so12242145e9.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 16:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794269045; x=1794873845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vESg3aj26lEluvBcaUBYlDgZP/BjzkrTsmOjKAVCv8k=;
        b=YN77BDj28AgJIKBjQOvbV7gOozPi0QbWFAXmF69f0sSx+uC5nwG5WFm+q2acmxICIC
         jU3ABme9xOBIXz/YlxDAATfhxn/I4Ek26jZ32MsWxTv0SwHzXG2fchiOJvHFbpt9q7/b
         iagEpoRSfb35tW+6AJ6KUtAKWTQAh0CAXMAASLbNe4+1LoGFkQVCkNcvxgx5M5Z9ch4r
         gqNuq5qri/Qe6gcGW470dXFscsCTziXLbFOr6/jI+rpwaEDBcPUuRINtNUmdkVnUTqhk
         XsXtyU6M26x36c8vWDq80w8Ran5mIWbTd9TIW9sJPUYuhW+dw8H0k1viQLJvoqVWy5yR
         7Apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269045; x=1794873845;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vESg3aj26lEluvBcaUBYlDgZP/BjzkrTsmOjKAVCv8k=;
        b=u5YJSPQfWW9Hct4POInVLHGO3DRHLl+8JOhxMWjVJ4zPSvszHLJMdD0naPkPCGkK4w
         Gud9/zZPHYsXa8FAbleXZPn3b/kwDqL2P9lEUyP7ZfLRo0bqaahJISEGF2Ea+gwIYCha
         1dJb35bLB4Y+WjsE+1qiHTKySa0Gr9Rk/BSkniaw1kDwBTgfuuJc8RcCfKb5fBISm+6y
         QaI+ZtGAHfoQdO4RRGYznuVT4FerDCfpEWdmPv1K1B3EculllFJb2t1ASF9ExlOJw9ku
         Ghhhhxo+I1S0QN9rdu5Tpk7ZbIS9oE35v05wzBBX4/wG3OeqQ4dbhFs0/RrHHuXzuSL/
         SoHw==
X-Forwarded-Encrypted: i=1; AL+hErHWeQgbC0atbR0lUsSsvE9L1SgNjy6lXU65CungJ+jJJcDaWik3sePMYtbu9KCx3WNEQ6XgcEuz/bsB@vger.kernel.org
X-Gm-Message-State: APuU4Z/fmrwFSvhlWSzJM+YPnJegiU1zqyn89bt9pnk7dK7LwtwjhN5B
	BJaYYy1HVuGEChq7XDrL/9ozIWpwtzYzQORDR381S9XsppTIczX/X7eYlGpE7yLU+s19A/rZHpv
	zp/u8
X-Gm-Gg: AYBFou3Wu4/vakKfo2axi2Y1drXimirR53zF6NGpQW0D0nh6RCttx3hqSxwBu9pgAZe
	PGj7CKfTg2Qjibqm+SFLlNo6CSBwVZ7eFaE/EFLiu6zDyzXALWor+XocAg8frec6p5Qw7hFvSgb
	SByQI94/A4gM6LOdUL5LObvMjuIc6Akha9pMaM320dpiNgTHsEQ2Yk0gIei3T9nK5gYcefxNS0K
	3mlZtsHwtkdEIw73jBYRcTQ7Ln7xu6KFNGYNYS+lOsD3xpkGmd/erpiF7eGrZNcTgEZvsPWFIBn
	9DW9XegYXSVAgOpShHO+EdGCx07WbozX1unLo3m4SeQLhS/SoFOOC9DRiLgQV8ch+dR1Kp9plc2
	jgpWi3m8fhy/AQWiW5k24rMEsZvfSz4gWfjCVglk2u9/6aJDOj/NDeaOSUAoQX19s3BG0Z5lF/3
	TdSxJSv4GboPMGT5yQyFFQLw/1fsXP+xTru9pifKKnYez/JPWmWm689b9otLqS9pxljSzsuEzSq
	+748q60TJZOX1OLmM0ZshPN94yRBAx+9HNnDsXAza0C/+9beZDvYsKf4HB4TCwzXFXUHs5ZNR9c
	WY6tPDgZJJGAiJTOAMl0t74fn31INX6H8y8R6UI=
X-Received: by 2002:a05:600c:811b:b0:4a2:1197:1de0 with SMTP id 5b1f17b1804b1-4ba02344e46mr9602805e9.19.1794269044761;
        Mon, 09 Nov 2026 16:04:04 -0800 (PST)
Received: from [192.168.0.167] ([109.76.74.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2c5asm38245075e9.5.2026.11.09.16.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 16:04:04 -0800 (PST)
Message-ID: <fef23213-8ccd-4235-a375-c00aa540bdbb@linaro.org>
Date: Tue, 10 Nov 2026 00:04:03 +0000
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
Subject: Re: [PATCH 4/8] media: i2c: Add Samsung S5K3M3 image sensor driver
To: gauravsuman007@gmail.com, Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
 <20261109-sm8150-camera-v1-4-3d2e7b407516@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261109-sm8150-camera-v1-4-3d2e7b407516@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2026 22:38, Gaurav Suman via B4 Relay wrote:
> Tested on an LG G8x ThinQ (SM8150, CSIPHY1).

What would be common practice would be to post patches for the platforms 
themselves - i.e. the DT patches to test these changes and view the 
binding implementation on real hardware.

---
bod

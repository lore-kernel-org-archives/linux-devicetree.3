Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295D33E63BA
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778250196; cv=none; b=L2HUEQda9iqiDrmOra7u+Brswt3jvL3uleVk1FSALRPcMwZ33vZzX//M4DoJ5oJPMPyQqqTvzni/x87Ma+FrEngkptNaqrsGf2PD70WjJ8KLMn4YVRLd0khgpTn359FWYjk9fOIrQhweaZkMORbEmTGmPGpE8jIypUNoycLuMLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778250196; c=relaxed/simple;
	bh=ManJat2Px3QZ0GJzd8wVC++psBG14jWrGPkE5Xc+QjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W0y3/wJB+j3Oxg5zBdYCUws4grg4n26t6pcemOmszQN/Bl1ejQc1GP7cxc6F7gglScQ+oH0nT6JPhmYb8mOyovNE2Q5+XwBof29xneajomJ2FerVsw0FDtwbl/jCaTioSbIYn+w/DKRyc8l8GkJYPCiX85/SPoL+MDvOgSIuA9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tgUsYatJ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tgUsYatJ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-67bce1840f1so3273830a12.3
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778250193; x=1778854993; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+iFvo8qHSuKHpqwOV+1SAexauNVOA61i8ZsTqWG1p1E=;
        b=tgUsYatJ8EjQF0k8zVoW4rLCBwuNKZOB8n1hN12Z5/0C35Scdaidd1ybzI7eYe+HSk
         Kq1ZSSzn7ppxc/+cYO1vlWfx/f5K2sIAKSm4Sht2g5erB+vJkJAyDHNjXti73+v61to8
         0CeaZfBUGVgyc4SYNma9WtwHYaiSasg1CXzVHBtIbDW5lLBq7selTJ7flEwxifm47emr
         /qiYFy24M1VSz0W3rmj9W8FW5S8aPzsFgTJWEC1+HTEAMlx1kbwl8QHnslZFveUeEEdI
         1bxTznL8O1GYym7QwtTHnPi3zGetrJRe29UBGT9RdWWVpUNKIBd0Fn2k5MHeQeXB6WRu
         QapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778250193; x=1778854993;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+iFvo8qHSuKHpqwOV+1SAexauNVOA61i8ZsTqWG1p1E=;
        b=BZZo8PlY6PVwWZpFzO91N3t+EhqfLuBVOzUOEG2JiI2E0Amq4Iqm3ULPDMZBHnUHvc
         eF8EfVkGvTzQCuda5x0VbXd43NaR7yAf9GqSErIqmyO0kgNUBGbEEEwf78mgcFfaxjlC
         2QIE4eXAlSwTv4/P5mAn6gl/P8tNlWQ7hVu5NDOX7pjSzh++yNGdW0j5FzreXXKU4+qC
         uxcvyLKxUSRKJIBZmaQySxmrcAXppS9NE3gdpGeA/vn9WDPXOERmCOXlNZdj3Pfg+oFJ
         1y8hL71iMJXI5S5XItpmiYkwDSF5Qz6AJZLDtWhmdqhUt3jefU4N6JvaqwPKKWhwnqS1
         Xjsg==
X-Forwarded-Encrypted: i=1; AFNElJ88mVXhIqE/XPq4aFlAWDBHcJeQBULq2VEYdKe0q6/MZZnwsZHqdMdiuIsthq/LLQx2kJvAFHoyi+qX@vger.kernel.org
X-Gm-Message-State: AOJu0YxR4xpow23ZcOAAPxh3OW6FWnfhWzTDW/Dg22fRxo1VGrwll4fR
	BGsk2i1i5Q66svuagklcbkEQtokGcPVBA1Xwf399QMRgXuRkwgsRz3CvAUJMCPNe3cQ=
X-Gm-Gg: AeBDiesNoAbtWFlTP/NailRZ936oWWGppXQSe6YYOCNORHkBv74rajy7qtgbkBsB2pw
	ElB/OgtxDL8MpFaiDeQCGaZ+1oH71npfvQhD6KtUkzLUbGQsUgMaag+H1+LD4t+rL0v2aYp9bKR
	MvDAL9haTJLtwX+aAq5ZBLWHoVGO8QiQNRUjgzXBh5WqzfIW155nFrRNYwaBjpq9/Yjdk3k8x0Y
	YrFZq/eunF9VDge7wzXWXyNoGncbK4wW4iF/og3zmkVB01BgLs1tjpVZDLEcEhb1LB3q1tOLZXX
	jV4c20GkS9yfeGnQSF76xvnYCnQOQiIeo7EjKuUbEvZ9HQ1strlmF0fl4UIJkt3yeQkmk+7OnNT
	fBsf9Jp9RaB8+HSKp8rsw16SE5Y9wOWWMacJh7TNH2ez/IpG8WPY8V0AWACBJjp30WnLpCISKbL
	a7Q+xn8i/0ZWQpU9D/XZs4ysmHfa/T66FyUGY=
X-Received: by 2002:a17:907:807:b0:ba5:2f0a:2f40 with SMTP id a640c23a62f3a-bc56aa45eafmr738018166b.4.1778250193349;
        Fri, 08 May 2026 07:23:13 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.20.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b6a648sm703741a12.7.2026.05.08.07.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 07:23:12 -0700 (PDT)
Message-ID: <328860b4-1d4b-4a90-9d10-cb70207aaa5c@linaro.org>
Date: Fri, 8 May 2026 15:23:11 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] Add dtsi to describe the xe180100 CAMSS block
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
 <20260508-hamoa_evk-v2-4-3ebdca3e4ae2@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260508-hamoa_evk-v2-4-3ebdca3e4ae2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/05/2026 12:40, Wenmeng Liu wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> 4 x CSIPHY
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
I'll repost my working version with the PHY stuff so I'd kind of 
appreciate you not posting an old version here, just wait for it to land.

---
bod

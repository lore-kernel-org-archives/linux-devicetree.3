Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0093F0765
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 15:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780067263; cv=none; b=tl1/KwNy9Hn52KvMAamz5J608NQ/pwdCLUGiA25oHR6Vy1w0CwhN6GK4XGGXCdExU8Indey9Ox1/yF48OUB4pijnThMRvuGt7dmvWf6mPdK6OnQJfgtzR1AMWIO23ob6/TLsfVNGH8JcEMhXTJV9dZ6Ir1a34B+kk28TZ27F4Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780067263; c=relaxed/simple;
	bh=tF43KjufwHIu80KkfJ7VV26iopIlq2XuutVp9qCHPRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ECxyWwPOzcoioN3ftwUUyflrA1UAzITj7ucXONF3iI4iKG5IhJVKJ268UC7uEpYJ3fVfy7YqzmadMUe0C1yN6VQ7y8aUpkQd4RIuiSI0fXrc15muCE0QrkwxEZER7nPNuv6EFrsXqBZvGcYlnz1sWgt1jpN7PxSAGPQQUvQqOB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wr9MG4XV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wr9MG4XV"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490686877a1so41299185e9.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 08:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780067260; x=1780672060; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMsYKu0rt98o4CUIj1PMUPtxut+9KNkzkjaeGCrAIPg=;
        b=Wr9MG4XVrb2AlEpJ2OuftCHDddxh00iA/NqJ0CsRzpHi/XPGFame3B5yHnl6IJeYPp
         HWCx0p1d6cp3GYZH5oUyta/eCJA/TaChfDViofKIwI4LrI1wlSCKzPA24Vd4d6c2lMKU
         ADxrfJXu8d4beDprcfkHcPEzkJr0LI92X/PbdIVnekcRK/u87aShycKNDOEgjoebYNt/
         P0G1yhuP5+OP1fLq3HNmvggckV+UNHmq1ASesLiaebrMeUuh79+gc1SHai1UaWngeqO+
         1JS3EgeCHzNnKrWy+VnqxUCdS9KtBnAetNWPMrYv9uVsblLvO3wRgwW2XXz/3avIFk1y
         vZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067260; x=1780672060;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMsYKu0rt98o4CUIj1PMUPtxut+9KNkzkjaeGCrAIPg=;
        b=MOmBhmQhWT/54xPeAxrmGZBparpgewubZ1WOQ1/8X/jGecZuoS9vPK6MniH79gLMv3
         /mGLWJesvYyyv50LwsPGDSgLcXEGOV56IjpEDzoYrFoXHQMLOMOk9P6HQf7u+XSW+IaP
         UNmqP0JrStuq4iguiyr3mrwAH3dX3eI8H/cBpfNf63l5+B5xnfB5U2DMoAY28pf64+ag
         q0aqP5A5XBrTVZbliTCIRIAIAYvTEREQZgsuSlxlS0WAivCojThjV7N1/869N+a54lOY
         /TL7Jsjz7OWxJg2GqlprDwllBLCCIEfpRiMJmQO9/K4IVHqPqH3yWmtQ0FFwPIpHDMnY
         B5Jg==
X-Forwarded-Encrypted: i=1; AFNElJ9juIoe6pqxkxcMlLqZ5rKbHNvy9UB1Hh8v8P66QTidDtex8uLcokXaLsnzvSO78pRbw3aOlzf6tYFG@vger.kernel.org
X-Gm-Message-State: AOJu0YxfnGjVA82fd/pG9bNFDK88pBrMnfi5kpCq0GAgDM+AnFNZfwMg
	TLn/bMSJXGEQzBw8NbcmcL1s05V9PmuLFrGkQQwWGdmKYbzeA6AtC8p+jxCP/4RNZG0=
X-Gm-Gg: Acq92OEEoZtLi5EYtU+qQ+GSstf2QAqPJ4mkA4uQ+QHLIwHEbJlwlE2yEHRLKpcxoiV
	m+TgtpNothp1UfMTHRkhvQpuUvab0y+bf3vgwr8uA1pfMw8UR90GtusagqD8Uu7g28qjbSpIOn/
	Y1awbQAnk6YSQ+9J814xU4U/J2HtjtnQ9WeQYEXhg+gXpbt7JYHcY7vkGndJztP05Zcm+O/H9+Q
	mWGDYMcn73cW6ysggidM6gFSEz6t3BbTettSTlEguUcPvs6mUCMDnX/3LSdLSmwEHPHCe4eFkN5
	/UxSfKexesnD5uobI/WEeFFilNbeMUf/yAlqPN/BePWITTzq4MufHm4+dM9FJGBy5syLA50MhVW
	zjA2cH92bX8WuXyLS4W1Yw2tmy8R78ZJPSslu6ZyqTtzXdEW1NmFrHFhKaqO3vvdErJbTCwe/mL
	+WxPMWt32TA/Ae6hK5mJ/pI8/OD3AJegOuVrB53eHDMfs=
X-Received: by 2002:a05:600c:a30f:b0:490:4b89:5372 with SMTP id 5b1f17b1804b1-4909c62603cmr38449265e9.11.1780067260267;
        Fri, 29 May 2026 08:07:40 -0700 (PDT)
Received: from [192.168.0.101] ([64.43.33.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a04e2sm3789037f8f.1.2026.05.29.08.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 08:07:39 -0700 (PDT)
Message-ID: <8618255e-ecbf-4f55-877d-09cb2faa6f50@linaro.org>
Date: Fri, 29 May 2026 16:07:38 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: media: Add bindings for
 qcom,glymur-camss
To: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Suresh Vankadara <svankada@qti.qualcomm.com>,
 Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-1-bee535396d22@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260529-glymur_camss-v1-1-bee535396d22@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/05/2026 15:37, Vikram Sharma wrote:
> +
> +  vdd-csiphy-0p8-supply:
> +    description:
> +      Phandle to 0.8V regulator supply to CSI PHYs.
> +
> +  vdd-csiphy-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSI PHYs pll block.
> +

To be brutally honest, I'd rather see effort and buy-in from qcom 
engineers in converting to CSIPHY as a distinct sub-node.

Pushing patches to hit your own internal deadlines to the detriment of 
upstream quality is not OK.

This binding should be predicated on separate CSIPHY nodes. I've 
published... three perhaps four versions of that patch to radio silence 
on your side.

---
bod

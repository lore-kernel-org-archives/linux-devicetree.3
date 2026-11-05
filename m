Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872465;
	b=v97juTFGwbCFkbS+1LSNtIUt+dTOM5cRLn+UoxVPNeiTNeU8j2UahJLxtFa9G8WKmNIR
	 XMWg6j/zCo0cQbqGfOs9MFcm9wUNRBcbCbV+o8y6YZsOeF3AJTxtIrkoMpnHf/A3xob7Q
	 wNo/zg5Vk5cfS2l30jeYuU4Jp3hsQgsT1I725xjjDm16q5lMAPIiD09Jr0NtSS4KJo8x9
	 9qQ9Sb7AqzUsn7jF04kNP9+KyuEmBZf9FVN4Ho97btaPTP7ejNdJU4U06TrX2h/EghlSq
	 4ov8W2Pb63wLP8GONgpHcYYhLAHSitFe+kYyD3qDEHP5EPOTWmAdXlSLM/6e1IHoy2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=bHA2T46sCuBYYbzvf6id/DX/kPTJVcKbHipURIwsPzI=;
	b=xno4H9xoADrusPlI3fEdGARFWyRJQzA9ItOH1U3ybAw6Xa6whowH136bDnkVjy4z0yns
	 Zufu/2WTpASmZ9c8BaDzWzomk9QWkMZUxwmypvJVtqpocffg3IPqEnarJQsEipn1heF4P
	 QUV0XaoSgntK35RFm4b9dX5ZuQQnMGq2EmJKBEeg5PRmOMH/bWtcBQT+3Qq6pf6DGzpas
	 eL+jX81xo5uEPBA6jjAYglGE3kGpJtCm4OU8rcrqMu4Xdfe7orDG3FjP79iThseXRyKZE
	 Ly+rxE9cJwvmQow/DmPUiF+PNnJB1fctvFgon5T60IjrrtR42+nwNOW9pWQnCUhnWVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u5fjdwl0;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3B2606A33C
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 09:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D3B2606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u5fjdwl0
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so13827225e9.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 01:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793872463; x=1794477263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bHA2T46sCuBYYbzvf6id/DX/kPTJVcKbHipURIwsPzI=;
        b=u5fjdwl0lTWSaSIEzx139mydxtXWqrSt8vY2zyXiD9mYugFWNCbtSyddgACYhIMH8t
         9pa7u5hZxCXUo7LLOmp6x9srKSC0xdw/wThtTCXY+sia6WTxp5cBqPy/FCu40ne5Nj4C
         cVQBiKFYRxxcBUmQYkviodfufSqTRP2S8rEpOv1WnRzb3597DxmkBULCuz5sjZrbosNF
         mzwxKwBSF/9onBAQmhqcfUcJKegFnq4WgmpxJLjZQFY7/6hUXOvHivsGkgDlVWEGj9y4
         34Hx+rJFGgrLcHpcBWIezUJxTyA2pG83VIrfCKzfiGnxGMDr7zVlBE/DkshcnvcSndmc
         w4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872463; x=1794477263;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bHA2T46sCuBYYbzvf6id/DX/kPTJVcKbHipURIwsPzI=;
        b=ODHwKT4qqlDYAaNlNVHJaFBRMavbSZnEbGWPp34WcjJWuQwPuzjk2wQySw+R2n/KzR
         4/Q6lYTBHfTsCY3UTHvnWfy4A/mR+PVYsykHUaBxL3+ZjdfacIxenLX+lwZpOgHUEjOU
         nCpki9sUc3qBUTNw6d906576CEjk2Oe5TU9Xb3NQTjFtblECiEf8HLXHTc3sW8dtXVPz
         LBgQ1FEbJfrE1cB1Zri1F8Aks00Y+J/fMhvU9EiNKLuGYV5umhn3P92kO7BGSfN19KF1
         bYqVXijJGLd/oBpcmLn4vkV9Sdabs9p+pah5K+eA8i4mp/2sHypvPNuRnuK5+tiZ0Q2r
         hb9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzANMlphTHzVRkSjlZ5H73rQzIl0Ej34/tABvHReBtv06Q7xOETAGqBcufaOanSyBQImTu3IzAj/AQH@vger.kernel.org
X-Gm-Message-State: APuU4Z9mU+4OuLl+T5EyOPgSWOfuMdm2pUlK2QZgu4ptBf4K586l++N7
	T3YWQUdDLiyUekvumNGPiUD3NSwld5iqUHvoyM6iCyLUBigCpWuauGL73OoPPFZ1RZgrdsZL92c
	51T/Y
X-Gm-Gg: AYBFou2EfuhsAtRne/EXApqNWZIJ+L3pjEEUgFiIBKYzaq2S5a+dPDto8Kxw0k48NrE
	6ALkrbjJXr53e3zfg5+PD3dxwX5wub1UmLWg6H2FGvNccvNeSgcDGykGpZABVaZMGCKm9iffDIc
	MfB0C0h4F+wEphCXgNuw9DmRD7p7DF6eZ7Oyu89Pvo2dBXz2/rYH1iJPDyVZ3tTnH+/DEbH34US
	DZRP1WLj4hDeInhn7WfqLxPsCXQuT7c38Yt37G00FX89hBDz+VNqzyatP6bV7sJKnvQvHJx6i1y
	71PjO8wU8Z6jCKnDDYBsMh7YF76dww83RKvaa86yaXr0Hw8BmO9vdwLK0bBFEgHX1V3Gwf600CB
	rEZKYbLPegs25+h+PbsvLjLdPAiIIuDUYPOkXmKJgZWlf2NevT4g305LSHPOmL7f62zRc7T9QWJ
	BOsb67DXClpv5YOMcJYfhf3mpa/wua/BrO5ZZRUBEJOwu6a/sqc7894vOtTaSiVfxxiUS1ObMni
	ok9gg3WA8TbSJIb4VA9Y5ljw8nmod8rhQrrvHFcDbBolo0Dtcu58BRBKMDQOjkL6mbPY+rYoUZs
	AbhDBooa7YB0ys90GuKfeig/og7ZXQ/VhJikLkPV
X-Received: by 2002:a05:600c:6089:b0:4a2:a8c:22b0 with SMTP id 5b1f17b1804b1-4ac14ec75fbmr396131445e9.1.1793872462901;
        Thu, 05 Nov 2026 01:54:22 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac2772sm8669912f8f.18.2026.11.05.01.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:54:22 -0800 (PST)
Message-ID: <28793651-1a46-4589-a9c6-97ac979a5b48@linaro.org>
Date: Thu, 5 Nov 2026 09:54:20 +0000
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
Subject: Re: [PATCH 1/4] dt-bindings: media: Add Qualcomm SM8350 CAMSS
To: Vladimir Zapolskiy <vz@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261104234533.3044265-1-vz@kernel.org>
 <20261104234533.3044265-2-vz@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104234533.3044265-2-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 23:45, Vladimir Zapolskiy wrote:
> Add device tree bindings documentation of Qualcomm SM8350 camera
> subsystem.
> 
> Qualcomm SM8350 CAMSS contains:
> * three CSID and two CSID lite blocks,
> * three VFE and two VFE lite blocks,
> * six CSIPHY devices are described as separate CSI2 PHY devices.
> 
> The SM8350 CAMSS is very similar to the previous generation SM8250 CAMSS,
> CSID register spaces are placed inside VFE register spaces.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

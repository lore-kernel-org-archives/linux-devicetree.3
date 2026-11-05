Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872605;
	b=F8/WKjKxe0DOURbBcy/qF0l3eABoN7OiCkwiEByYpvMxt0M0btMte2K2zSdibpDZtmq5
	 YxLDaViFImyP+3H6WMyaC5ZkOPsefmdQKN6X+XULvkFHZKjqhdwekLiR7CFZxsyHy/wUE
	 eFHFGYim2teTWxg2PMa2laLeu3sfASnqB0tlOsw9WaV/2U7icnGcKMgSiMIA0N8PGQc0T
	 oTkUi72G67tY/QphssN5l1wZDh/aVt+FdjTsXnhHG4gezKZEPrS60vN5aLKRYEhRgULuw
	 NwKddTYsWzxBmOIX5+Q2cF7acuJm36+rQ3W/FnuaOcejNBMitX/0K1Dj+DEzzGNzVgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=2frlz/ems5IejHKiFsfGGWOinpbQU8f1d97fQ0qUPvQ=;
	b=Y+ZEXWDJG/tpSikhhMOXPtAgHFZeb9GGzedPod5AJuA12GI2HFXXwpZVCZ4o4fbbBDw+
	 eQ0oiiBUClBlQXkKyqmQN1mvuqF9Th0Xvvf1x/kpYIZbVt9nKY4tuKfeKFjY7EhyWzDll
	 +z2AnYF8j9ACOajYXzzFYx9COSJWGww3tyT9AcFWDp247oh1pmIEvZdYymoUsbb4JDGD5
	 vXFHdC2GQtipTqJs6BuIHBedNONge2jAbvQ1tQbGBIUX6/KQ7PAk+FywPz/9Y6xOFX0Uj
	 ukSmI0MBn+fNoMyJqzRpYc8vI97dQ6cxUQYEq0Yvf30WRciqywbq7U6abb1wvz/YnGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="iEX+lGE/";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A6A606A329
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 09:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4A6A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iEX+lGE/
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so13851865e9.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 01:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793872603; x=1794477403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2frlz/ems5IejHKiFsfGGWOinpbQU8f1d97fQ0qUPvQ=;
        b=iEX+lGE/bIUyOkTKslBRe0Vr9Go2pnoRPTtF4VMJljqH9BHFaC6Lcq0U63Nxwz9730
         KMEubulTOJC60T3skacMuGfKdJCRouE3/yQwChyXueGlZNHbT1RB3h0A19ZvPqfux/+7
         v4ISUE2DjCJfubXmbiVpFBcom6Mo777vsKq1aTySR9bQUNldKuDpdVQOks7fwvN287GW
         GG4+wyuFrXZNUaF1ax7i1FbPaB/2bPABfb2GuY+1OXZO7ZH1xfD697yUYefytNspXdca
         HBer2y/cskrNGHLPtE7LbCUscNHm7biKiU1pHuvMLMiPKi43+yE8rtzNffSpECIHNS4s
         4MqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872603; x=1794477403;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2frlz/ems5IejHKiFsfGGWOinpbQU8f1d97fQ0qUPvQ=;
        b=Z/nQ476XLge8mQIvJhpPQmE6J0/kcDqdAYm7b13e8gpSTTwuY2T1ejNEa42YDNs/o2
         3ORzSQfnTueNgmAC28NNidxu4/j8oAxvkj8P8xWfdPhzz6oL1BCyicB/WpnWAkx3IqNk
         iQ0Hkh/nTuv1iWP0Ta4NHrNNNb6iBQbmAxpGqMyoQ8IifTpNnSuxA8WKEdOraBmlePZ1
         u4WtjlzPjo4gTYX/tEtF7DWZm1QQ5t9m0bLShRP7hU06O1+fpDmpfR5ttrSOgk27Lek9
         cA8HBwf8D3dUvG1gdPqnNfjmVgMNs5SgNwztqHuEXrGvpT05sAOn1WdICLi3qcD2sucB
         VlSQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4Ok+dN+dhCfx1wl8xY56tQpEdAGtLKaLEG3ZxxMPH7VTXNB8+gqVq5lHSols6I/z9uiLchHKiriAH@vger.kernel.org
X-Gm-Message-State: APuU4Z8uO+bKIRcr1Xy2oyaxKG15T10tYOGv5eEqJ3ZrsSgHjipLHdIB
	9eucW15t6gscrr+Sb4i3b/slabwh3YAI42XLj5excaHfaRG9itpmuKHMtsugGHy9Vv4=
X-Gm-Gg: AYBFou2rMcvRBZv1W9EqrwPboqpFeSRCpR/ogr0BvXymy7Ox4dQjPHRwIw4His8MN/x
	T5XXFLMFkS4B3nP7dKNXw9jqNGk9Eypg1MUMXLrFZJ3OlSOOcngb+BWdZzgCw7ck3XzRkNcQHHV
	NjbzAIob+Vj4mDNWGNuKcD8a/ESzQN4IMwgmwinPnRFNLKWWwOXz7q6UljpG2ajfF3LB88Y59Zr
	KkC29m0S0UX4lfYre/KEadhlTch6m180Gmx+0hDMlCZmc/LhGIm6WWvEigcJgXbn2GwtwIP2gTo
	X27Jv9D/jWQUjSrnWv3LG56gXg2yT7PSN/KHyBPnnjU1rIg9QVeV8sPp1uE1GWEfgEeD+MOrhZi
	5O+X5PMOb/xz1jvYjHylpXg0G7K1JMtL4y4SAJgkBoYTM+y0HeM+sx8SigRsUFaIeb17eWWkdT9
	fINUj/eIbA8PeDbYXRRkFjBKJu4NPdnJot7+jJ3EqMFJ8ss376to5eP7+YxjJeP/3Wm/y04Qs5O
	B3TGbpWOgZEhV1OjQbZeEEBsCVktaNT6zHVQzP4APkjgjWehbiFG4N57JZ27ympgwQU6nn1TZZ6
	cCSpmWAXzFcbfLYOiE6HCHzzZfaPPod4ptr7ZZi6
X-Received: by 2002:a05:600c:1c06:b0:4a2:fe11:9a8a with SMTP id 5b1f17b1804b1-4ac121940c8mr531574055e9.0.1793872603069;
        Thu, 05 Nov 2026 01:56:43 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b64809c39csm3908275e9.4.2026.11.05.01.56.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:56:42 -0800 (PST)
Message-ID: <1a644699-cc69-47fd-b72e-aac320f2d84f@linaro.org>
Date: Thu, 5 Nov 2026 09:56:41 +0000
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
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8350: Add CAMSS device tree node
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
 <20261104234533.3044265-5-vz@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104234533.3044265-5-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 23:45, Vladimir Zapolskiy wrote:
> Add Qualcomm SM8350 CAMSS device tree node to the platform dtsi file.
> 
> The CAMSS input ports will be described along with adding CSIPHY
> device tree nodes, which are connected to them.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
Missing ports {}

---
bod

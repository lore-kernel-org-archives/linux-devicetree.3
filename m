Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C03E3F39D3
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 21:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783545117; cv=none; b=DcS63Ko7PX8hyUYmF9Dt17cf0xyu2Fsh8BP0A/8T50GUNrgcUJIOnS4S6ldyf7LnNX3ZnKOXUwhoNLU1KtLw4VMeLdJYmbMjLX8FZ20sTgbq2deo2o80caMWj3fJTh044xCF+NYIoIoYQpBmpcR9XxSCpFXqUqC5WVtWEwnp03Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783545117; c=relaxed/simple;
	bh=rIHDIzV62J2cxny3gvrSjGxCdFunl6AY+u8FpKeBnH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQBniQ4f5LE6Ftg43Uatmlom3eUFtXxqi1zyP/iZBloGVwSMZa5Kjb7KXlz/FBSuX186artuOjPGD3/Ju0w1DCZ7xgk6JQ8RL2PgkizQnvhjyBNdN5w2SgrgJAxuBbtpu5khxIH7tPwAA3KFdiTh4yB1DQh6JJM2mxMIZUJM9cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oYSSrB/1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oYSSrB/1"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so6139815e9.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 14:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783545114; x=1784149914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ACnCYqtn31aNRa5UhofUt9P2pF5DMnEJGyAo4BheWXo=;
        b=oYSSrB/19HiLbPeKGErUQAixq/UdabJ6QbD5eP3Nk620Zzu8Bnt+Y6TJNhoZfOmFwO
         RJgE3RL4ITGTFHlMpn6sEIZBeHXtcwaH6lxKQoxYryyKGrKOp6QNWkhgjGGkpUvW0YpS
         InrmHD258mTKZui/lcfN2jT4lmDRK6zLcZxnm8Ke5I+x7pIBZPqpUFofgSCNAFkF+pfW
         pMABVInGLJFUFWxGT0kKKmfxeZDppKiw4DmeKwJfx3k41Plo2reSzqBKnFQAUKIEMNuV
         yAXSu4xe4OY3mr6N/0KJNs8aPY9AEMSCgOJ+FpNLFrBypeXM609KqLsWb65VQWT5U6iY
         Q4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783545114; x=1784149914;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACnCYqtn31aNRa5UhofUt9P2pF5DMnEJGyAo4BheWXo=;
        b=Ds3/QQ26EiPyaca/+zEJPQ/NODxhHjIkyCDzP0aeiN1ZOTn5G4JMPwJfqgjgHcCb5W
         /0gJZz3lRBIR/hsDEVJTnBRDeWCkQG3rtpATaWnyAXD+CpM/Or187unPgrkgF7VRHGC3
         pTdcXF97VqVi13PZ41LSn2mg2yqmUFJcBjh07mB1sEi5L1cIX88aWr0c/p7H3lmzOKMx
         TqUX7vKcvEblN5QCxjCYoxeYhwGAGIjKe0F8pC8IARY0yljl4bebpwRJX9941PmP/IEL
         y304Otvp3EdZWxyFNLEoUaYwVB4mUu3DoGUIBc9g2hL5kuM1B++AOlwyIzPu9fkbjeny
         hpig==
X-Forwarded-Encrypted: i=1; AHgh+Rod6Agcoh6xubWBvn0iLhND1pziZhNcRFnIHZRcjj12qst1yF6+xrCZaezZSscgZgW0uVdsJ6Je8upC@vger.kernel.org
X-Gm-Message-State: AOJu0YztmK9/EA7/wZdH4zW8tJ03J6vKL8ZA9oxK49nDBhzqzV9yHuWu
	Iglk3RHO2nRvpnRQ+O8xpImHefy/GxN9kB4scD5RtSJaae4nL6rY1MjsjQBKrk73v70=
X-Gm-Gg: AfdE7cmFmh+VvaG0lin/ZvyVWQv47WUnk2Bwu+PiRutiCmZGNAormVkl7QK040QWYtj
	k9Yold2103VvbXedWoHvKy2mYi/B/2PsgG0A2R82n0aIXGM8kK3tWRwWDXJJ6Q9IrfXGsxZjB/7
	WJkbD9CxqtdmD8yVAxW4fQ8km82xWp01M/DH21+nbdct8054Hc9KdSsktXtv6JdUQl3GFN3ZLYw
	W4vWE5zWW44CS6OuAePgqp950wmYqpIm7ZqsX+hGiXB1+QDn3zzYrQK11AYJyiid6KQpBUMZMps
	Q73RpoAOHQf+Ut7IAYlzw1rfoRCp/fQBW8oFJFB4WYI+pdibuF2Lasre0khnkaZTXlKy69XWkEQ
	OYCu8PtoCHJu/T/IwTfvQuht8wdBcZpTT8PKmZpC0HJ4w4MbGzAzGnAYWYu0NB2J5E3j9dJ9Zoa
	cPpMPK7s74qZ7zAfpTrMBX6R4x71Y=
X-Received: by 2002:a05:600c:c8a:b0:493:b730:8d78 with SMTP id 5b1f17b1804b1-493e68730cdmr43626125e9.31.1783545114335;
        Wed, 08 Jul 2026 14:11:54 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.204.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d843csm44848779f8f.14.2026.07.08.14.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 14:11:53 -0700 (PDT)
Message-ID: <5aa5487b-67ef-448f-8975-0c46ca1d3451@linaro.org>
Date: Wed, 8 Jul 2026 22:11:53 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] arm64: dts: qcom: Add x1e/Hamoa camera DTSI
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
 <178352261564.2235436.11540452339147753406.b4-ty@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <178352261564.2235436.11540452339147753406.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2026 15:56, Bjorn Andersson wrote:
> Applied, thanks!
> 
> [01/11] arm64: dts: qcom: x1e80100: Add CAMCC block definition
>          commit: 6a3568f938c9ff2cb493f82dc595b4dc2760f517
> [02/11] arm64: dts: qcom: x1e80100: Add CCI definitions
>          (no commit info)
> [03/11] arm64: dts: qcom: x1e80100: Add CAMSS block definition
>          (no commit info)
> [04/11] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD pmic,id=m regulators
>          (no commit info)
> [05/11] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB sensor on CSIPHY4
>          (no commit info)
> [06/11] arm64: dts: qcom: x1e80100-t14s: Add pm8010 camera PMIC with voltage levels for IR and RGB camera
>          (no commit info)
> [07/11] arm64: dts: qcom: x1e80100-t14s: Add on ov02c10 RGB sensor on CSIPHY4
>          (no commit info)
> [08/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add pm8010 camera PMIC with voltage levels for IR and RGB camera
>          (no commit info)
> [09/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add l7b_2p8 voltage regulator for RGB camera
>          (no commit info)
> [10/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add ov02c10 RGB sensor on CSIPHY4
>          (no commit info)
> [11/11] arm64: dts: qcom: x1e80100-dell-inspiron14-7441: Switch on CAMSS RGB sensor
>          (no commit info)
> 
> Best regards,
> -- Bjorn Andersson <andersson@kernel.org>

Bjorn.

This is v3 from March. We are on v12. I don't think you meant to apply this.

---
bod

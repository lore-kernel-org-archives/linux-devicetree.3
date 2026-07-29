Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383AC439332
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 09:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785315965; cv=none; b=WkmxR3BndfH1HEPqh4VzJ0MaLkf+WnDVuYtEn3XkW/ePFoDb/gmgb3bHUXiYRIP53kYoRGUYylLSmAlWLrqvTcDhIsK/+MLC1ONNOA4NFfCW8oy+GDZ+glD+XdDFDdP94804UoL+kB/qUPZv1azmoM71ysPMxxUw5UMK0MxGX8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785315965; c=relaxed/simple;
	bh=Pgzdd8QWkHLx5iJntf57eHKC3caXUVrMC3GRDLNiXIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VNjcW+BSFI2/MCXfCbKxdJ7l24/NRFBxqDt0+TY2WtAXfSBTURKCWBZ3MD5D1FB5stYGydI3Vl9c3xi5R4knMqIFeeihAcUCvIXtVj5/3gYP4/6u/GXu+AQwOZR9guDBcid/0lvxpJGcNw4XyQdRbpWIDurp79Nl27ZkubbDYjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mE0/FiJy; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mE0/FiJy"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15c42a45adso255610766b.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 02:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785315960; x=1785920760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/MLmidGDM5QU9T+4fBVHNCPTr7RK0V7QVFC0bGSvSY=;
        b=mE0/FiJyriFLB0XSsNSfv8S1OPGzSI/6lTdLM0KcToXv2AgUM2COud11WYHC0PMJtH
         Piebq4RkZZ6Hhdn99hEW1GDRTwynXyKhs3GfgN7a4nClWVoej32HCrDPyzRl630HaLXv
         xPZtsBySSGNKKuriqT1COFcSsKKLK1OYSIrJbQx8Bw06jIYNegOs4f4z1PIQ5Wn6F6Xq
         rO038n1NcG3MTgWksqkd3PWcBqs+euQ7sJkAv6daRCGuhHbroGFHCsQmbzl3oqzQan0E
         d6xsB/3D5QG9FOgqqubGBb/6Tp0WuuJYrMbIsMrgxmecv9N1euvyIeaxkJKMYRNiTxFB
         AM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785315960; x=1785920760;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/MLmidGDM5QU9T+4fBVHNCPTr7RK0V7QVFC0bGSvSY=;
        b=b14uXOF8mSzHPVmm29lIJzlv7GrPEGRhSb2EvQP36bJetDiB9sVdQI4UVrXvk/bkxz
         wn9B+4qoIewjCF2tPRMnTZzj/BXOlhAM4qEkfu0uA7ln6T4C+7TOzdu58B0foyH7aqGO
         iavXfu7Al2QSsWPrz2+Yi+PEdqqw1THLVfivyIpEai+mHa1BvfYM3ozjVY8FuucC9fYZ
         yxKyKUMxbBMRUDpTxScv341u+GPxSzpcvReS3zPm29W/GKFiL4AI1lYSGZZyBWqLsKO1
         mzrp8opLltf++NYPzE5PSEmgQFq/4gRmY16h8UCc2BBd0ksGtfBQ/eVlrPYi499z+Fzg
         mRVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpwltur8/CDVQTwcs5NoVTWcHKZFQY496OB5j1R76N0ZlCCyJtP72FPp5zKuJVVgunV8GwsM02uECrE@vger.kernel.org
X-Gm-Message-State: AOJu0YwA1UfoLg2DoTGUtEw70lfZiq+e5KqQMbYmj38BxcNI01ly3zkj
	YhBTX9zfxa4kN1xMIvm8H3bp6lgEGAN0qFbRrL5K2XGdpvoYQ6HFQySsNw5rfREiQmc=
X-Gm-Gg: AR+sD12uaVxAfC4ATdWJUeAhudKSV0xX44M03Af2HfJILPh6LfveMejJNzZHEmgswgt
	xCrFMBtsTCru9apDR3waaEmCgK0uLfBKSdAtHR/kFmOb0MWvQwd8e3L0ddHzzwtN5AeulapVFNJ
	JRqYH+VPKxz5Ji6tBQjw89P9GR/F2sqKwJg37TDYgqEee8V8jhkJQDeouoPpbEqQmB9UvuQUIf3
	2mvB+/4IvjRHJcRiNxMp6fPCSJ7i9PIbJgXA7YfFEaeprkLz6IwdDydmaj9TQl0l2SqHHTkbaYz
	GP5KzS+3h2nAm/I+A1GAg5sAo34Oz+cUM6sCpCSTSsHGaDpfBCJ0YzEdGRGIirMAvTbmLmW5G8y
	i8JJLLLQYrzh8fGi2HOuKwua/W/fRntjUz3S+fWTWK2alpEI1/zzlHV6FY4CD1Qmmtb0iMyXpaA
	pJERKEMMAyhbq9hMWRdkFCpIJGZysEZxTF23XkacxXaawWzvfLB2+WcdOq38vQq12UnUmdFQ==
X-Received: by 2002:a17:907:6d0a:b0:c15:a7b9:2ae1 with SMTP id a640c23a62f3a-c1f8cbc0449mr86006066b.6.1785315960387;
        Wed, 29 Jul 2026 02:06:00 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.24.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83cebf3fsm87314766b.25.2026.07.29.02.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 02:05:59 -0700 (PDT)
Message-ID: <a661e25a-c889-4c6a-9052-5429d9924030@linaro.org>
Date: Wed, 29 Jul 2026 10:05:58 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 4/5] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-0-ae811e2f0799@linaro.org>
 <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-4-ae811e2f0799@linaro.org>
 <20260728144448.GA2141274-robh@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260728144448.GA2141274-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/07/2026 15:44, Rob Herring wrote:
> On Tue, Jul 28, 2026 at 10:35:35AM +0100, Bryan O'Donoghue wrote:
>> The original iommus list included entries for ICP and BPS/IPE S1
>> contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
>> ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
>> CDM IFE. The remaining entries serve other hardware blocks which will
>> be described in their own nodes as support is added.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> What happened to krzk's reviewed-by?
> 
>> ---
>>   .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++------
>>   1 file changed, 19 insertions(+), 7 deletions(-)

I didn't run `b4 tailers --update` is what.

---
bod

Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F6F3A3E96
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775808997; cv=none; b=XcT3PA4XgpwVMi7GH+6uWT1YmO/XaES3xVLLl3sPkXrYYajFlLBrnS2Cp2DKE/qwrA9V/k6cYY0D56a9DbOkPNgqpP6SAs4voXeCtawxfIx7DysXnJr6Mcs6EmyIChjLVcVppGXDpwFHkp0rrhkm14823pWJb8nQ0lJFTua6rcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775808997; c=relaxed/simple;
	bh=XtXGqPzWh8q9HgVc0vdy2c3tHF1YZZdgyN9U6qjhzX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cc/+SLEFU/z4ueXmLmj6NlOHPmaxppPrpAXqwgo0R14Cs8FoiQIRc2pOePd/eGluBVgDgcLUYHAcjP8uvU2rZZaZDCCpv+SqAo5FEEC7J52nVFXIHwMXlqZa8uVmYOs07iVMTzMAYOqWsdG49hPpwc6eFBf4GQwD8Oi5vG1QLmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BowBnNN/; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BowBnNN/"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-66c17372965so234760a12.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 01:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775808994; x=1776413794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OR2OsOoHo0XEMTeQrZ4vaIui9J4CKX4eq9R2pcadAuU=;
        b=BowBnNN/xuEmHWc7iPzfEQqXJyj0IxKbh61YS6ruiOmgOhe3BZuvVGyIOHQZu8HfyL
         2QbK6SQlADJZuwN4S6ZGkFMhiB/c8qFYJFNBNcO3e2m/D3ZjQosAfn00m2ikh5DrcV1j
         duw54GA3AWTvh1CSWtXXhz9uZYbTu8LU6K85vHe9hCb4tiWadZq4ky9nxsllewMh76vn
         bIFQs9s7ggaPxBx5sVPxUO43VD11hUXMbH2f7iqBykQ/TWoJE0cTHj0A/dVJS9fVXb0J
         TSEJlMpZ7h00yXBMUJIlaSmoc5J8alXBXWOT5tvQDcn8OQG+IBnjHz0gizRwjy42pYv1
         rPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775808994; x=1776413794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OR2OsOoHo0XEMTeQrZ4vaIui9J4CKX4eq9R2pcadAuU=;
        b=iCsBJf0ZmZkmLT7tl3FfnD0wilZ9UyPB8Xu22+TYDHUgwZhtpl+nJqS/y6aOxiu3SX
         tH/Mpe0CQoJkuenCPZttkuAK7Fdvp/jrlt+P+jjbBnUx4kuAjkuafZTCuCg56ZrpiDgq
         dED50P7Wu/7Ombng9dJG9MqmxMg4KURTpGgDmfH0JGFb3dA8yu5ocLDhEVhuGcFN92C8
         Zu4NNJyA4U6VBalA3LkcXJ+DKAK2R/xakAKc9kw+2wMeVuCQybiRHw77H24mT+50/sVn
         PXTZaeuvHcXqAqhseKr7NpGKt6J18xJiHF9u7e2Zpm0cWH6Qy+ztVarw3pDxNCRIJ/1U
         fhMw==
X-Forwarded-Encrypted: i=1; AJvYcCVk0E79p+VASps5ASaIiKHsULiPYrGqaoWTeoUDred/HuwazkylfAlLF+Dl9cbAWEKQ5X3D6exJIRvu@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvz+vJ+699retHGPLnFVQcVzx2OVFsl6P7rybKsDjdhpoPiuRS
	cuhT9xOmDBje15KCcM3M6hT6rqpHEMB9CR6rJXQ/eZDh3DX2XbX6F1YLepiK8CSkHOg=
X-Gm-Gg: AeBDiet3vk8S3N0jJlPxO8eXFsWci3bSUxYZ/Vk6wpFIqNWlkdLiIaj72liw3REgn79
	BgMhhOeO13NaFBTuajrfY8+KQAzIL4zwOaVgI+fvnl1HHoevDL87vun7ukpmFrxAdAo5wQXy7qN
	EUx0kCTIMuW0YHGMTOX17/ul1oWZyDLZ01P0JKchoLfRK+jonvWbpXEB6Hos5qyCCt+K9JeO8oA
	Wx+L8kKQ29nVGiEW/j/hYugLCfgZiJDs2CmdNdQiHd9WRQP/CZlPJPk7kxtrcoMygzgo1dtd7DS
	mwR5yDCqSFk7IqNopjicBFNfCPpIwrbhbEbKtw52wKL/nG39PibEjWemJKGr1UZ5zsM51G1Rr0E
	vwhwEspfURclz4AwEUsY5FCLR2sza3HApiUd1gHt/iS8RvYAsc2EqAKRNPs6BIdrXAawM9hHcWx
	6lV/bsM9PoI2eBF6oLXY+cVH9sdCGGD4B96/b+d9XlYXy1z83vNjIsgZeF5HCREFSjaFZJep6g+
	7pQMd9F5JZ/R5ICwKGBmsw3PGIlYZ7TEGanHRJC6PwGS2EbS8JwM1j5UtkKi70L/uGsr52wZnYu
	Kx9ariLHYZx5vA==
X-Received: by 2002:a17:907:9801:b0:b9b:207c:f7ca with SMTP id a640c23a62f3a-b9d724f0008mr130116766b.5.1775808994189;
        Fri, 10 Apr 2026 01:16:34 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de97e36sm60770166b.10.2026.04.10.01.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:16:33 -0700 (PDT)
Message-ID: <765e4740-cf13-4d4e-ab69-c1abe1c39d34@linaro.org>
Date: Fri, 10 Apr 2026 09:16:32 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: purwa-iot-evk: Add camss node
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com>
 <20260410-purwa_camss-v1-4-eedcf6d9d8ee@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260410-purwa_camss-v1-4-eedcf6d9d8ee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2026 05:25, Wenmeng Liu wrote:
> nable camss node for purwa iot evk board camss tpg support.
> 
> Signed-off-by: Wenmeng Liu<wenmeng.liu@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> index ad503beec1d3d8c671d3564942a74c484de762d0..eef03f1eb2a950c06294159be3f97169fb487265 100644
> --- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
> @@ -734,6 +734,10 @@ retimer_ss2_con_sbu_out: endpoint {
>   	};
>   };
>   
> +&camss {
> +	status = "okay";
> +};

Hmm.

I don't agree with this. Enabling the CAMSS node with just the TPG is of 
very low value to an end-user and doesn't "prove out" the CSIPHY, TPG 
and RDI path - which is the minimum entry point in upstream right now.

I don't support less than a sensor at minimum.

You guys must have a sensor you've used with this board ?

---
bod

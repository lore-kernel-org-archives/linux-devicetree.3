Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BD1371888
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776419667; cv=none; b=XAD/q9/3yIZSnkRyl90PvgdBUFrEEkgYD50bNEz69zGgt+UZpwGg4g1aYx6IHfNtkyuEL19u5EX0gwO8L3ngmAIojRCDXwo+mTH5tMPlVacamffVV4TvxgYYAUIcj+rkSoqjhSgoCVNb3LcW0IpBRZ7iyTIBb6E1d9O/uUjRsq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776419667; c=relaxed/simple;
	bh=zY1uJ0AaPChwbCkJzKQs7C36HEuyLGmvoneiqqT47+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iw3UGoaGH7VXPRkCLXc/+oJh1FLGOqqhkpZdtOuAi2Zi40rWbLLJscEltHAg7FAQutzkxGHhT8iArk374XsjatweBl2W3+6i4X0pdI3WpfyYyNYOjXuX+XwLxeH5deQ/4aS+YD/cWbActPqV501wa3dBTuTepeL8Sav2m30AlrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KyF7QI+l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1VHrUGm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KyF7QI+l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1VHrUGm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H7AXmv3438220
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 09:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TSqyZYtczbrMJAR9r8mAgtofBSnvKj7JQnZ8roG/Yxc=; b=KyF7QI+lyqmHgPTu
	v406XyggDMMwAB2+uUEPfBGpFn9/O5Yu1PozWD1AQ/GII6rXED6DS9Lmn0iHXy/O
	Afx1tuvUlOXoXl21LgEJtmSZjigkLQ9WcqgZYNnaZ5Ebc5CMxQc1en3SVvRnfZZn
	pmzeOHdTKUxup6DcLMzplas9ptesSk+ybXOW8PMgqIdOOMz70MjO4hzO87ncrRhy
	rGdLSl7YolSYAfdZfvIgKiyw88kVpEoo2V7inuD8TTRAHLtf/adRH6ZpjbCTTx4y
	5lkd0jSQyBZIG5w56iJ4w1NgLDLMPFJ2pXQH/IhyfbbsCXe4vbeFmSozadjTXEZp
	dqWcPg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg88rqy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 09:54:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24308165dso7993175ad.1
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 02:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776419663; x=1777024463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TSqyZYtczbrMJAR9r8mAgtofBSnvKj7JQnZ8roG/Yxc=;
        b=d1VHrUGmHMHxZfysGI4Ah2lpC+L9QRXMXSCs7FGO0LebxKwSZ2bTaxifRul8AKP8Wo
         WDkD3f0IBE1CR9yVWgZWl6Ce+8AXatkHE1F4Auo3UCieVxHwZ0pScg7+rIrMT1dTQzMX
         O4795CEu30OMRdDtkyL9j0E1cr0f81098ehhcRrtIrG5b3vcAiOYFH1WhCRN1CMd940S
         D8vdfkPSwgOlE7RmR1ZsSVciExWboV0JVL/uJj6noz/FNaXiahAXUPYqLKsQmluHlo2x
         pbGl2khzcx6zjUpawyUysoCAscpz7GOEHKaG80HU+Iwls2ATxRxeqPI173Az/ZqbYxDe
         gIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776419663; x=1777024463;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TSqyZYtczbrMJAR9r8mAgtofBSnvKj7JQnZ8roG/Yxc=;
        b=aUhEv5e0Yqclfk+hZBrBPWwIaofjasnj5kH4wMpB1TpE0Ph1TNAs3c3m7spq1JxPvP
         utI8fndWotPhY9hEiHzwOlNbs0S0X21b7AOj/MvpIUf6ZgPMPZ7R46gxgeXNc5ngHf53
         e8v1GNENTR6evoOQfW6ar3PClchX5Jgy35gNJkjyz1pU/vRD9GZ6CGf4bE+HbgFZT7Ph
         6CddoCIV4BLfGQh1nSZme5T86S3NHuc/3N3eihEE+V9aubVKVc0K0t+PlNP1xoOGkbqr
         c/sqmJ9TQvTa6RSuO2TpJh6ybYfUf1X4LBznMnRAd8c+9PkBE2UNNTHcAp1P7N1c0Wmw
         eSKg==
X-Forwarded-Encrypted: i=1; AFNElJ/KNCbgcQVL5pUsBLV88W+9dXqIIhJv9qPYEab4hV7u5El6lEhJu4R8KVi4cXTrUTSFfJJ5IhTitM1L@vger.kernel.org
X-Gm-Message-State: AOJu0YyhqaZjiaIz+ad5nJBNjgpLsluEHHMXVbTwSLhvwvggjXRyQhBJ
	m3efgyG37Z8n7+s5Yqzm3i+rw+XNhXNrzDFWa3o2eKbKw5ENR3uvpxDk3X7ggE+Is4Fh58VGOm0
	nU/n9Jk8dZ9Op/B16TbSgSNL+8O+LNlpT1cTljkpDB96kz/a0+Rf8EX3XWWaVDGAT
X-Gm-Gg: AeBDietwa3ohVhU6nKpcRAMfCIkW3aG397TKq6oBX4olztZS1OCqp7cq0bNNBWEkz7H
	YPJqUKwu/pVsgF1ys9wS4KMm4DlQ0sFSvKHC5wJBJvUEd4E7gJtKh8RP8sA4gGAmuJ9JvUQvhKL
	nVtLrQ6vZeOlKt7brqEwwj3cj9z9xbfik0kqChOCPphw45uldVQvv7nutpYaRyD9GxLuiJiBkm5
	axr0Mvw1IhNQ5cLyjmjosl6BR1nhBq9cRz8Q1Nf9RPHjoQ0pLxc7zqHr5anjvyKAXebKJY3REEz
	4aoP1fojNSc4fZhO7o9k5jhnSJYjPhfPSQO5bbi0XiX8Wnrpm76QoYNjEUmyt201ZkdZUFffxRW
	i77j9pIf7F+hKC+I6vWwKSs3Fw05jxuultvS1pGwGKwtLyKkRp7boHUl7ndaHrw==
X-Received: by 2002:a17:903:1ac6:b0:2b0:c90f:44b2 with SMTP id d9443c01a7336-2b5f9e8252bmr23808455ad.12.1776419662890;
        Fri, 17 Apr 2026 02:54:22 -0700 (PDT)
X-Received: by 2002:a17:903:1ac6:b0:2b0:c90f:44b2 with SMTP id d9443c01a7336-2b5f9e8252bmr23808055ad.12.1776419662459;
        Fri, 17 Apr 2026 02:54:22 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cbaasm15911585ad.54.2026.04.17.02.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 02:54:22 -0700 (PDT)
Message-ID: <3b65a6c0-bbe4-4b57-aea1-f4070ca1db99@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 15:24:16 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: crypto: qcom-qce: Document the Glymur
 crypto engine
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260416-glymur_crypto_enablement-v1-0-75e768c1417c@oss.qualcomm.com>
 <20260416-glymur_crypto_enablement-v1-1-75e768c1417c@oss.qualcomm.com>
 <20260417-portable-proud-dragonfly-6bdd9a@quoll>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260417-portable-proud-dragonfly-6bdd9a@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: N8LxCOHYlM8FOHu0zr3IM5BEDppNEIjB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA5OCBTYWx0ZWRfXym4WlU76ED4e
 F+WPvmdkA9T8bIgNOR90xoDzCFb/9O7zLlrCMkLGStjrcQvwkfaiR83zh/mSdDhuNZ1bIQQPNzi
 KOM0JoUf8q7/fOh32Es9oxVj8+pJiDUcZ/7cC4pbbGT41vwCNhB0Y7R/klEggIKnu0QX7WwA9af
 Hg3PfoTX1J5tlyguNwINjxueYH9+EZ8JZhl6Usqj3mXB2aPqe/N5b6vLIoU8YndnxPoeubxgbrV
 CzqCopGN+W7C3X2njQxPz7L8n8XvSsMK9VktCBZx96G+ilvbRQFKP8WrbLn/G+K+DpGdWIv5qio
 G3il2yY4X37N4tXS0Qo29PuZjZ32khnMml/eG16xGJN2Fi08ylZ/vbSpy/WLmfRGmFFpmU0eBQd
 0tnAbHhtvyKcc3WSE7TJZG846CefTYlVuqIpaxxne+jiumrfTVnUPz7F9m5jT2MdZbnpAzW84+/
 lbyvxy4o1A14feY4oXQ==
X-Authority-Analysis: v=2.4 cv=X+Fi7mTe c=1 sm=1 tr=0 ts=69e2034f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=CM-kEsVbLXR1AP68oKIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: N8LxCOHYlM8FOHu0zr3IM5BEDppNEIjB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170098



On 4/17/2026 3:17 PM, Krzysztof Kozlowski wrote:
> On Thu, Apr 16, 2026 at 06:37:20PM +0530, Harshal Dev wrote:
>> Document the crypto engine on Glymur platform.
>>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
> 
> Poor commit msg, but none of previous patches were doing it better, so:

Noted, I'll try to do better next time.

Regards,
Harshal

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 


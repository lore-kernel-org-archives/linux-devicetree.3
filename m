Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBEB1E633C
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 04:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775707746; cv=none; b=Ao8LKqdWEhV7geyMDxChETzRZf0qa/AX7jQzr6HV1I70sb0Ivcx2LME7w2ZeGj8KheCqURBMJ+5T4ulSOVIcDuAK3OohiPiCPBykk9MuwOf9ez+1cun45NHXl1qqnyClMx2RmzWSkYH0HWUMurExD2TRmoVKj0WDITdY3v5TW1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775707746; c=relaxed/simple;
	bh=ZSf5xO+BLsbBoBd0FQBbT7p9kYdgQNM6EbBkzvXqI28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NjZr1B9EheKxPGp3+XaHb42oj5NHJKI+++7EDq1jTaLrpjlRQaJLjtKIT3Dcd4uXbsC0tc69yf4WuvggSXquEqgf+O04DEh9gqQZ8LBPk6V6FxUK9u3h0oyKaZVKpyVgSJJ1baCl0sGTWZCxuYJGU47O0r5+hfpeYlDh0hPfyc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGLjg1wO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FOKKvOYe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jGLjg1wO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FOKKvOYe"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638L24t13715439
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 04:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rTNoDrtKSCQdYNXgupm04bBF1BRz+e09UGrEYCktWOY=; b=jGLjg1wOmB47h/ZL
	arsvpH3/jfQCZDeSzGhOeDhrS/VA24QP3Z3DJIIdFxjvYDeGWpO8e1VxYGpCTGVh
	P5xnvDuLd9Ib//go6jqIoVmp/YVKfQ6RZ4wAw+/GPyP+XwXnex8cz5ZIaBABNrKa
	vWHGKuhhaHfEt5zQqHm53c3J2pMCzbPdyxTujSapp8VyCyXuQEk28qISmfC+SxsC
	Sif+h9O+SNk5Q7TWbT1OK96NuPn4kdTltrd7X+bikHBJ00StOxqoakhY/MN8PlEy
	k/pUIDsHW79cWGMkwbmGSBt6J8uwUHVmRzYKP94KWIg8Ve917gYD/bgGd6+XGbx3
	xP6eeg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt74a7qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 04:09:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d98c6ab60so513121a91.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2026 21:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775707743; x=1776312543; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rTNoDrtKSCQdYNXgupm04bBF1BRz+e09UGrEYCktWOY=;
        b=FOKKvOYeKo/SwaO5AK1qZmYbK5BAXD6iZ5+9erhlxFl6bQTvUWqyQLXbQq6CI2nO5k
         FiMXg7DUSBXr1v6xW8BBzVxphapo/zeLDl8iHolOHNkLGIJPQXsEQbOXfrkQ2vL5xDlx
         mlumKpQQNIhjP7eh98sUPd8/kShU+jdicXL2kKPwMSMcmpuSz8jZzul1O32lx18hPwu2
         IK7TuLbCpQLahmEh++lnLdeitlJ6hq2ih+TkEEqJapI2+F2dKHkx6aAZ35E3h8gGiXiA
         vblsnByZk5zfUMhO1K+c5+iyx7lsSJl5bdvfynbhhDM+JNT8zad9qWPQco6Sx+OicA0t
         VXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775707743; x=1776312543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTNoDrtKSCQdYNXgupm04bBF1BRz+e09UGrEYCktWOY=;
        b=TL2frmAmeIVV2jfPGdsdYwlpxFT/XjyvzYLf0NhQVUqy/yKh3ppgxkUDhLSpiVctwg
         r0ma83tBrpKFlCuESCrPJAVl9d+fjXInGc/3hb5ME9zWpcCn6HL0rPLRBK6K1G5e8Jv4
         SWM6qr7wGuPM6efT/rMsE1aBhF1WZCXaAbQyVqXNiAezP1CD/+loSzEwzK6q+1/5Ecd4
         BgTOB/hZQmefM/l5dFwANbgBFtI5YYONF7bkU825IYYedKt+CdObU9NZn/AOnVlvjnk/
         8SSa9161vIRTIO6PCcPpYKFATDx40atO5DyFkqzhlFCseBHDKGeCGCADfffhmPBtfbsa
         zsow==
X-Forwarded-Encrypted: i=1; AJvYcCWWm3pHakfuIa1UTLbDXGGpZLvwyeCuHmGO50B06x3CZrxWUoUVcni6wUDvWkfhVeoPa/3v5x+MICWp@vger.kernel.org
X-Gm-Message-State: AOJu0YyVXy4BXIFxetQ/q7oax/pSR0uEfLkvKkQE+u2Jme0zLI5o6kEY
	s3gzHN5crih/V8ye5KTimBWg8SfUq1rr9mT91Wa8fvGCU8vAu3Jm/LL02G0SBspT1Iwa2MfLqXU
	iHUWOfiSzRqqAlh31FxxyZioLJW9yVm+40C5WaT/OVNmXs+ZdhsC/z1aqQJ8ymZbC
X-Gm-Gg: AeBDiet51Jr4mQ1V1xZhouqUoSF+IdTtbRiiWTZ4C73QT/dZrzOxRi7bJdfMjPyNQNJ
	O5fNfjuSHdb6+TOEFP7MpcwFpCAdNZ+TXZtNHXdsHB2UMazKsW6KTu5HG7Hh/Bv3IxewtBP5RhQ
	gZHFJDigCl5229JhUSdmySyiISMU9J+dpppwoy0KFvdmaeGvTy4OyTlrW6yQqI/hExfnxq3ykPk
	mgnlHVLAcJNQyJ8KndTr90rsBXuLEGDMsjCc8+HLIzsKqqIa0+esX9G/bTh45u6tKjUanuezXZ5
	nK6AXotARjqTpVDa/uExl4VKkseDkYtnaQaRjGKKqY6XWledUAb3aa94Tnl1tAJclOpI/jWmZvY
	A7rvfKwVgZROChbf4kvvn3Ikq5RjDWv6GDJiUl/kXouvVF7s3ch0P
X-Received: by 2002:a05:6a20:7d9b:b0:39b:e3aa:df2d with SMTP id adf61e73a8af0-39fc928ecbemr1917815637.7.1775707742946;
        Wed, 08 Apr 2026 21:09:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:7d9b:b0:39b:e3aa:df2d with SMTP id adf61e73a8af0-39fc928ecbemr1917788637.7.1775707742497;
        Wed, 08 Apr 2026 21:09:02 -0700 (PDT)
Received: from [10.217.223.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6561fe9sm19461122a12.15.2026.04.08.21.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 21:09:01 -0700 (PDT)
Message-ID: <f450b6c9-e577-4d4a-9d01-c331efa8bac5@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 09:38:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Add QCE crypto
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260407-crypto-qcom-eliza-v1-0-40f61a1454a2@oss.qualcomm.com>
 <20260407-crypto-qcom-eliza-v1-2-40f61a1454a2@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260407-crypto-qcom-eliza-v1-2-40f61a1454a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TL51jVla c=1 sm=1 tr=0 ts=69d7265f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=9nldhgvQxnsrbX0ZkhUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: yTtqimSZfrizl1ULN8hNUcLZVGqmO4Gw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDAzNCBTYWx0ZWRfX9kLg8QP5PnyO
 Pb5mLfN+wHZ9HJ/w+g9skgGG9u8Wy3h4Arx+ZrsLbiAwHDXzk0CwG8isq5opY1mJv5s6j7mjOJG
 /IW3uQ8lRWAiwbZIgegF+q5hDZUZwMECEAKwcypjddRWjQVMWTXgshxjxBT5i/l/q/fbvkFVYUV
 uaOOHPjO4SWH/sZMW8kH5mJQszXzOs+Ugsi8GYNd9uGyPKv81Omk7sb0jhPIFD07fxeLoEVBTXJ
 vSupYQYfeoqvo3HB5BqAdGxDWGgDadeF+RYMfIf0RydzfTre2Z6IXcG2nrBflIH6Ra8ahKsu5Ky
 AtZeFEt9rFlYPGSHmU0AZZtlfkEw8noAjMPeJLNCZSTzyqmBNNObJuRgxqR0zYGbsUJBdSatD/5
 8xPFB7st5335j2FRLqyU+4RNYK3yI1Vc27lMQXmPkOGQE/GO1fYkJuq+Rik2TAxSS8b4fnu9ojP
 GhAtH/J//z3kt6OTZAg==
X-Proofpoint-GUID: yTtqimSZfrizl1ULN8hNUcLZVGqmO4Gw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090034

On 4/7/2026 7:21 PM, Krzysztof Kozlowski wrote:
> Add nodes for the BAM DAM and QCE crypto engine.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep


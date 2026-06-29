Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ADC35DA63
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782728694; cv=none; b=O/ZMJuRqVBJfH+HfG3p5iB8434UH04LJwrGdzsQSKG8r8tAJkzdEx5Bt9P7RIVmWbuD8jkPGj8NACx72TYpIK2VR5jCCxcQyW0b979tRdaF61gzj9FHXOqUviVSPAhPEs9c8yNJ9Gt95+tFhuIXpJK8FQ3j4OaUSX8vG8x6Qh/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782728694; c=relaxed/simple;
	bh=gx6Hc+xwDO6+Tr9b3IiC7MpXO14GpZ80jXnsZw3dv9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V9xFvLjjOdRPHDCnR4JnKNy0HISLG6RN/7JMPomX13lgUJX27yqqkazFF0t2P+15WJ4e2MzLnM8mgxFlMrBgYsGpG0XvA/dNYr6G5bua9pU84RSM1DA5oPo1/t07dKouCjrkf+YVcfDnYePAgQ8F/WY6RIMXNxZYl4AjBOsQzV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mpZs+7PK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kW2GzBCR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mpZs+7PK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kW2GzBCR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T7Dq8s2188726
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l1Fbhotj1M3nPhbbjSPmKC0CX6nRcaFEC/MDtEsul2o=; b=mpZs+7PKc3Ubkqzc
	7uY8WYPtje7SgmtgutoA1jnVTJvqqiEy2UG8IgA+JsjQbA1QFHoxpk4FNWtEfcR1
	jDF+u4lU6t2FhqvT9sKEi1ZxEpWIyRaGV334w1C8AXzL8rC4wDS6ngj/sNuyxEME
	X6huopiWCmvHhw9LVWeE/vttniqQ4szGKWFBm9FPQVNqEM6cl9bB/UNCIFQo0AOJ
	GUWJVaRo/AlJFvK/qu8/uFk6lFypZvcvgsaphu2jD8B8I0IGN58VWN6rSoKwbzlR
	OMJx/HhucffyV2ebF2txoJnh+nVftvc/klPtwVSkcGPrewXFuOmBoUFDDhuC159A
	Xgx75A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4trt00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:24:53 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-845a29d8c1eso2301819b3a.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 03:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782728692; x=1783333492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l1Fbhotj1M3nPhbbjSPmKC0CX6nRcaFEC/MDtEsul2o=;
        b=kW2GzBCRpy/7ACSQjmSIpoEITbuqhK+uKidzxGkwHshyCe2WjuCO1uGPMYWzXHXNGX
         kwH7uYiLe5lJKU1DEIlUHjTci/ph4jO/RvlE5NJ6iLj8nxeJx1OXE16KvjTPEqxXhAax
         /u5mJwgyoTJAR0CrD7L2gnEqY19Dd5waaqGuK7b9BgNw8fYkcw2AIGf52jj0szRv7Ofl
         Q1gvbQS1coKAC2UjoI4d8wx/d6T9bz+X7n5pguXyQkejDWb7RTQLoH+Wf4CD7pQXjnZq
         gqXF+3BNiRsOvtfGBLLkFoYUFGbVV0epPAVcXARkbVkvrXUEc0HKs9QcXnEQmI2mkwsl
         fgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782728692; x=1783333492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1Fbhotj1M3nPhbbjSPmKC0CX6nRcaFEC/MDtEsul2o=;
        b=VJJiwWYeqxqNaYOiZ/N4kTuChB6mVxgdC9u0DvmP2/iA3q4WjSLvQI4znk7aQuEnju
         jKo2dVKvYOoQm2GIidP2qyfVyvdjvlt4PlmYz3YoIlXMpF7XiDYhoZQSOxDOQ3SP9X5f
         urlDygmHfPNxSUrGdCz1TTZ8QNI21CMqrAQx4u+vH9af/EUvOBGq9sCWzJ97s4a2VgNt
         gvwpEdX4bDhIM/t7yvvkCFTqyZuw4w3GvErdlU4ygbnhTKWPHlIf7ONQyit6C4zUX6NU
         8f+gEj76bYflRutXZ6cxt+HIunOIFNPegm0Vs9OvXtPErCtEyiu/bpNU7MU0D2Ct8Oy+
         GhnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rou4pFvcJh/uq70JKXlg42ypZ6iOvYqDftiLMd2ic5InrO1z/GUc+X+hgEADbcHutiMkueIjeoZilbo@vger.kernel.org
X-Gm-Message-State: AOJu0YwNwHCJGq2Iz6UspP+2SacP7hAAF1VFAgXX5UMd10FpNDR6htzo
	fJ9YarJz4NxSuiN6NdRO6gtGiidvsPzeXte+8d2EyGqSMvpnR1uwUZ3kuTPPDf0vhvQ+7xizFMh
	eTYOVVdGSyDmiW0Oa2kJUFphsjg0YiSDzCQ/f1bY3uSS2Q8EtJ/CWRMgGY/x0dgwz
X-Gm-Gg: AfdE7clY0q5aw0x7MarEvtZFPbEP2CPwZTXryptaQr9c1wiWNZXBz/7/ahXaCf0unNj
	zYW51S/2XQ5EnMGRTDYYyz9znBVPo+LIm9cSWBmFZs013dIbi9Nm2B86sU2ZQGIAWfj4V5qxUm9
	DtoIf/vN/sIjwPFoycppJvPpqppZj9USFFl9RG8wtmsqJlHN+p/e2B9vqpNElzy+P1SPJY9I891
	dmY3TyxUVLZDdFFBjNByN2ge6EPCImDDikZcLYGMfIN9EaloEuhO0tC5FWKa7Kr9bY4HXBFX9Td
	Dek52eaCM0XVy/tzVBdN+7AKetW2sOROIKnThJP7w/4YDylyN4nLMjNS7UpGZb2l27nCU6krE5q
	MK/OL6r/b6ER2Gz6kyZwbJHctHYHP0jdkwRa15MV09HA=
X-Received: by 2002:a05:6a00:8c11:b0:842:672e:7b5d with SMTP id d2e1a72fcca58-845b39f9acdmr15279465b3a.17.1782728692427;
        Mon, 29 Jun 2026 03:24:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c11:b0:842:672e:7b5d with SMTP id d2e1a72fcca58-845b39f9acdmr15279454b3a.17.1782728691963;
        Mon, 29 Jun 2026 03:24:51 -0700 (PDT)
Received: from [10.217.222.146] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8477594750esm2435981b3a.21.2026.06.29.03.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:24:51 -0700 (PDT)
Message-ID: <86321e30-2bee-41bb-9d63-d0e6ab4154db@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:54:44 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE eMMC nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-5-1cebc8b3275b@oss.qualcomm.com>
 <d8fd7888-cf7d-47e2-8e77-3ba705c88502@oss.qualcomm.com>
 <ajjmXMKdWzae5qqk@hu-arakshit-hyd.qualcomm.com>
 <dcd6f0e3-46a6-4f57-b4a6-0b9362b1a8c4@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <dcd6f0e3-46a6-4f57-b4a6-0b9362b1a8c4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4NCBTYWx0ZWRfX/CBWLKaI/CsS
 G0XW3BJB5SwHy4mgNAb+VnB12mYL8JyoiLujUmoR6BhMN5MjOSvpDKsXOiV6jzxzM/nFM76Yca3
 EJXP7vuzG+bAmH7K2N9D7pQqI+GtZJdBDiAArPeLNDBpEMs+yOUUADEO8QQq98Nb4UEe6VKHzxQ
 74EJgwML/CI/ECocuSlAFKB7o2RJQJwg2uSu2McPJe6WWLShT7MxGISbqqqC+Hb6F5ICL0zgZNk
 Ubt8eg9hoDk1Kl5Zzq9Xhimz393mtuKrLGTQy/DK0+zC95TuxQjPaxmKFiCAmSAaJIJd+DNh3HP
 yIZeoyuNH77PMAvIGofEJap87xsvkcjJ78jDG5SZrj0avwKwgSS7MEcoSDH5OwC2JztEUksAZoA
 /zDW86+svgMl0mToP8qSS6H+gPAhuj7PHxhHEVmS4bAHMTEa9WqVoFCHLuVbetGUcwgxFk9lAoM
 AI1tuCLRlCeDUsmwnCA==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a4247f5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=nI5agbhGWDarof4E6psA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4NCBTYWx0ZWRfX4pcm6LsmDZQH
 kjVhB0s/4o2g+rWwjajGtK5g1yl16rxECOQIM3ZS9pC32qo00D6wylmjUNEVVLz2noNT8dqmx0q
 +q7gknP9RpAXhLUoysFS83r4mP2CCdQ=
X-Proofpoint-ORIG-GUID: kZ-hr5B2XiTXFpC5pCGStPlAng9ZikSa
X-Proofpoint-GUID: kZ-hr5B2XiTXFpC5pCGStPlAng9ZikSa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290084

>>> Since 75 MHz and 201.6 Mhz require the same power level, is the former
>>> OPP any useful?
>>
>> Yes, both use the same power requirements. However recommended by the ICE team,
>> the DT should include all opp/freq supported by the hardware.
> 
> Is there any reason at all where the OS would prefer the lower OPP?
> 
> I think you at one point mentioned some dependency vs the storage
> controller's clock frequency

I think Abhinaba captured all possible frequencies(even lowest ones) as
what the hardware currently describes. It's upto storage controller
running frequency and let it scale ice clocks to higher/lower to it's
max capabilities.

Describing hardware based information also avoid revisiting DTs at later
moment.

-- 
Regards
Kuldeep


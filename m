Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA683D8117
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495652; cv=none; b=gOWdGEPrm27QakOSIpF6Hc1WCwcWeNpKvwGdOpMz6tdvzWN2h8yY8dhnuAC4lBSSfFXdJKvaUv17aFQ2u24TZm1LIfml1dn8TIWIDlgBfAqbfVJfg7Amt7yFCxFDle6hCvdUbzxyXGgXozZr6JHga7h47CxLtZCX134zvYr4jDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495652; c=relaxed/simple;
	bh=Zzc/LyNUJmfRTRvy7NnUzglQq+z8kfXz7t/DNL1P4QY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tbYgBvW4tKrJuCfB9I3qtYUoIdTpN+vEEgWJ5KSRh+kcT4I1VvzPrWhKYXiDCFNvHJVxO9FusiRM0xmcGGusA7xxiYTSLUpXYkDwh5vEs5lDbSR2ffR9ggmSM6wAuUjjGFIQ2eW7wx78T00enr23FfDNsHxbs1sJXF67cHaradk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/+Syyko; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gGLWMtsW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/+Syyko";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gGLWMtsW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BA52sI2039449
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zhgnjsb0hfvU9qaTZOw/KbLQAptbinCFGnY9d4Sij64=; b=a/+Syykoy6NyxKKe
	tRHW/qjzYLVM7MUxvRiEUlyquwszHORcQ12vZta7kuZDi8y4jF91gzpYIfWBmGIL
	7N1vqgtThulkLSvFzjqCQj0cgNcOvTTBd+Epm7laV3yIlDPLa3dHOUuIMpjzXdxX
	rhnmQvcfFiy6tmqMPTJstAkPuIRQgbsROPJhRqPm/LUL/YETyfrxfC/0WFNJXeOv
	BKKX06EvobnhoeIEE/ZwVEmgtktwdz3viTPN0EgHgP0n4i+R3UvoCfHRVgqECts/
	raG94Nsgo96CnAb2sMOtFJURjYOITaYOP1ObEMWSMEiMVykZESD0Pe0PmF5giD5+
	DfHbCA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3d22r34r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:34:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6313443ffa2so200880137.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 03:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778495648; x=1779100448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zhgnjsb0hfvU9qaTZOw/KbLQAptbinCFGnY9d4Sij64=;
        b=gGLWMtsW+I3O+M0F4vqTVhpX7reBDf3u3VyJXmaOtQxBj79nvOjUAty1uQfI3ZuV2f
         2cbwwqh+Vrv1Mz80wVxkIIvg5Li+yRsQR1/gjuq5fuPp5MQxA+xmL2cuDZnkPYMJteGa
         IW/ySRsfST2GX7tNLNFI6UGx/zvUtswfXiO6x6VDSQRYVwlFzg39jRPT8DvYys7z8c05
         hHOaMlQCHjFTxMHiBMuLvnODfcBFG2rt1WYCAozG6pn/nJgEF5eCCrWxjqKIst5v8TME
         Qr53MxsDkUz6NzKxPJiM4GUmZLpw10ezSh0f7bma7tkxDskXUKkOV4DkRRFHgDaE3Dam
         aFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778495648; x=1779100448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zhgnjsb0hfvU9qaTZOw/KbLQAptbinCFGnY9d4Sij64=;
        b=sHBsROvwbVE/Xlr+rcuoaPFdEwVOoNwui2iskrXUvYTjDqcrfNlWkxCmbqs2kqWoI2
         l7awdE3F8197oV9gLibPPnMq53S9Y90YSnBPjUAqUosW8CkQj6VJGdbNWtGRb9iKyJCP
         oquWtnP/RlNxZk1Si3jBs1eBAKP6UJfCq/oGRi36XQDDqf86y+j9cze+DhwRFIb9k5iX
         y+PdipCuzCVE2Geh4pjxoULXKevtcFqEMUtIEPRTTQ3eOZB7/VVSrOYl0UbdpzHag+dh
         lbXmuuGGR6oSh6ywVLaYlsxTYpFNcnhanZnLa8V95JV3trChNs3KUHdGIq0jd7D9Z+Yz
         Qk8w==
X-Forwarded-Encrypted: i=1; AFNElJ8K6BBmS+HwVacLN6VxMg5xf7XkAaF+p0VPJeVe8CVKh530faaBPc/fbvvZQOFKpeGfnuZIptu6xunu@vger.kernel.org
X-Gm-Message-State: AOJu0YweFQuQ/XUoyAWIZijNJmY3xUWRz/F40x28zg+B1+T8ALLkuoug
	QXDr2/j5MIrtrCxUmBhnao6VbF/Szp6uievDPT3OaTw3yt28xJtxB9/mrZoWDUqCRtf/4r7HQUr
	q2/EzCuPotFi1NsdC1IsdPqf0UC83yiehgadh2t/zVDrClvHMRnOItMy/x/A/hpTT
X-Gm-Gg: Acq92OG16/4AYHNUBvT2Yuh6bL8pe4lXTvRreoq/Bgx9e8/6HMoMZK6SCjsv8d9vEhU
	jwCYImuSxyPBT60Yz4teCvmTAIo9J3lpTIO1xZiDRrf9dn+VC7ES0zfgp0i7hMryn06YWh26xib
	KZ/R0IVEzlt6QVhihamZHjL/tGQ0AhZhE0D6gfMrtVsfA5j/GO1bXAzrN+2DbDLEzyVbgNPBsqi
	7FwsphXL0MsDYX/MqCjZO994YSl9BaV1gj6YjpDePi2iXNJUeO5jVz2zE0+7xp7zoVVv4G5sYID
	dxuxQIMI6ldhlc136OHIGUCsUp7sOSiYpgIAZYABfuK+dkb13AaryUuXQtoze9Qh2OLLvoDWnh4
	trUvNLRAbqfOUfybRC9eqFZJTLMciD08BoC8cWvOqQ5k5beDDiSjW6URMXSgP0bCOnNAoFGdMWF
	OCLLY=
X-Received: by 2002:a05:6122:3291:b0:575:b506:43cd with SMTP id 71dfb90a1353d-575b50646edmr791749e0c.1.1778495648246;
        Mon, 11 May 2026 03:34:08 -0700 (PDT)
X-Received: by 2002:a05:6122:3291:b0:575:b506:43cd with SMTP id 71dfb90a1353d-575b50646edmr791732e0c.1.1778495647819;
        Mon, 11 May 2026 03:34:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bce803148e0sm208248466b.10.2026.05.11.03.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 03:34:07 -0700 (PDT)
Message-ID: <52bcb432-9431-4a1c-a2d8-95bd92f1f484@oss.qualcomm.com>
Date: Mon, 11 May 2026 12:34:04 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/16] arm64: dts: qcom: agatti: add higher OPP levels
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-16-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-16-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EaT4hvmC c=1 sm=1 tr=0 ts=6a01b0a1 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JvtetXaiP3e31RRikywA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: Yg5KBcJeYa8KG06CczafA7yosQUf5BFt
X-Proofpoint-ORIG-GUID: Yg5KBcJeYa8KG06CczafA7yosQUf5BFt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDExNiBTYWx0ZWRfX5Z+gQprmKYsg
 oYEvqVQu2WBPE8m2BYjlDHK6ZF5zyuTbqFlxxCs1zhPqdN1vjmyvIkNP7OFrC6ag0dpdKYKha5Q
 ieGkSycU39XiSw1ok7OVow3NW2TMJI1L5+xAm4o2C+jpV75ezGLfyLSQICHedQ02vf5WsmcsCRi
 tfoHnGc6sFfE3/8ztU/lccUCfo0CqnGvDkJalTCOyhCtApYBCwp6t/BisyLfg1tsMRnGbnD689r
 5PEkXHlfT6NPYw25pcnhlgUCctbFP9tvXZgEUBIILKtXBFXK8npSSsYzfvsZ1774u6bA7+5SrzK
 1+ZzNkvsqOVwCUnFfuUPWqzatRsPPBc4ZE3AubqlVEpsgKrnYp4gLZQwwQ/hxZ/Ui2R3Y4rXZ7q
 ACmVdZRPGCKIeQCqu96j420L48dWL5hixF9RKOab8w4yll8pk3gP7/I36U5oML+jpFMmzU6GYw/
 RRjs3HIvZ+a3VmmvilA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110116

On 5/7/26 8:42 AM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> Add additional OPP entries for the Agatti platform to support higher
> operating frequencies as specified in the hardware documentation.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---

Please add the word venus somewhere in the commit message and
title

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

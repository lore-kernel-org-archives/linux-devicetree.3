Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9C63B9D80
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 11:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779362354; cv=none; b=GZuqdNMDmq3e2SpR+sp7ivBEmJLSU9y7AI7V4oBpWE7c6zFHkXNc4pV52gGciopnJWvQE6A3eUjTWRp8sw3Oa7JVUXFqT0Jr7TV2YfxfuFj4cVtCD9ox3RIpoy79erW0b46Km3X2qiqehY60SW3cBdH5X7yhkmT+bA/HE3TYSWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779362354; c=relaxed/simple;
	bh=Va1tsaXau3ZOp4Fs1C6XDkNnNoOcNPKFH6zod0IfVuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qzOi7FKd9nimxrd6uRTH8+jcEwnEVCJnvztXzW+n00cst1MkDGCPd/dDjVd5M8t3xJqZVN9RlCZOUGP1T5LeI4jxUboDds8UKxWeWvueWoGcrL7lDmbSTTdI1/zg8Z+ZqMLIXtmART9EPyym+2LTLay/KEdU/yZuIuwkpI8H0rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4GNa20f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T4HOYb+v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4GNa20f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T4HOYb+v"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9ALw03555955
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 11:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q7zTCbgzBEgy2rmz8Lm0pdUFHaG13OEbYSNtkZTbeHg=; b=H4GNa20fpZA3wcMy
	LobHT60IIU6ZNxgcEiPCX73buSLKX1O0Tx+ZduVLSb93fUh7qnO1NMQ3rbETM5aC
	ydoJA+9cLksq/me5mLfcJmLVV1IPx8pFdZsqDqML0D9pVsVQjk0lCVN+U4yO9R4u
	+aILbPfAfy5HrabDCnbPh3qR2j3U8/48x/F0SqqP2sXhzZZatgEqRyN3w1E9KdmY
	kaMzgai5M9NRRiMTSvKyvfn1HHwEexTKPZBo+4TpiY1Nib4aZv5tv8uplBW7nfml
	u59E/KyMAy2uErqx8IbHkkrRPTeCUV3L30kuB+5roxzrlg800GXh/RrTbeXVdtkZ
	4cT/SQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6m7sa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 11:19:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516cd650fc2so370031cf.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 04:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779362350; x=1779967150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7zTCbgzBEgy2rmz8Lm0pdUFHaG13OEbYSNtkZTbeHg=;
        b=T4HOYb+v9yAfXR87qfMfX7Ra5/Epgmk25br5GGbtrNqRobeW19ScKksOw1flh/uRD/
         AZDs4xKIBhyiyg4SBI+9wkrEY/vX8l3KXeGa91UIeNaSKGaK6l6oPRsuecIgUdP/hOhP
         /xkEBqUU90xJFc7zAu8dW4IV1Y0ALtQEw7NwX/Pw7PzGVDlLcjyevo5CrRdU57msI9WP
         wRbXiJKFkoPtW8JwaoAJdx4VebEY4VWKJeG+WHzXzDrZqksDXIZ8npauT3rg3epEMGMZ
         dYAUMunfS7W/3rqL+caOPPJt7YjkpdNADFLqmEUlM9RVIs51+gG9y4LFcSRSCwfOmlsS
         rjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779362350; x=1779967150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7zTCbgzBEgy2rmz8Lm0pdUFHaG13OEbYSNtkZTbeHg=;
        b=VIicwiSQWLmmIIqwQPas7Y5NFfSVS4wCCt5SAQydNL3GNy6YpUDgdl5u0nNzU0l/Zq
         jQrSROLJ+aFDMNSc6piXk93OpHwGgbYNBkAaKgKHwF4zZI41ubn8FuqgYHSsydjcK1LQ
         VZrUUKeoJfZ/BarIqYFhYJmd/KZ7JhQjbK0NEW731H3JwMe1gyrkXlddc0eUVIyQg6Ld
         HOceoJXe5iDsjbDQ5lsF4p6VDbaSMbvpdD4979iXH2/MejLq9ffL29HSUhndrX5+73Hh
         GmKvBFanYqPF+Pnf3NaG8esdoYcgOV5PZUbc17Lou/Qq/9IFN2oIfY/dNXhF1kB6R2FV
         zAmQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yudlUJmiRnbX18g3MOMjujsal9eVTgK3KwpTHaEGUx7hES0WV2HXMjxfZMJAFjkGazJ9WrmpGFRwm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3WbwSndgKEGX8lGHN5QMBfzdiHRRa4z74JTeT/sdWa/M4EmWg
	c7RaCi0Ks4PEPcVD3YWs/EKs6G3yhrIeBt0MI2FY0a04Xwn2T1JFj2LXK3fr+rfDFE2VmfCtKTA
	d/DWunu71VYAbEh8cJ7IY9M20wt6UYOI0xMAkWm96rfmRZ6YDHURl8cNbaKoPzrjM
X-Gm-Gg: Acq92OHqrGktEiApfdLw3rOGC5+kHQUc/Y9asF2Y+eaV3bdPaAdCwnpFQtrkdG5iqrp
	+vR+RNmDa5fqEGAPPZURjVeZ5eiokGNC6p4OynS+A+ToFsdQZ09XDR+ZRdExfvUWs3XxggUo7sU
	OW7tpLQzY7flZzU8H3d2yLrVS7g/5FGAIRD+TFCne4mQ/dGz1/4xdicY06rZnQuI/P8m2nzAiF0
	numyXBoqR+hb5sjG62X1ySdJkvELcQmgcdhAAIbv1HN8C7THE6mJkQ6VUpEvwDGdft806AK+KLi
	+EjkFvw2XGJv32j3jgY7Efen9s4qumn4wIitpmVOB5GvUYDEmPRm8KsBH6VgSIif5S3hGK6yjz9
	IOCg9kP6kGpVroViacpQDDRI/icVR4PyvabdrhK9A7Peqg22saTaPFREaF/MxGizO3xjOPlhzGI
	Gdvvo=
X-Received: by 2002:a05:622a:4113:b0:509:e68:22cb with SMTP id d75a77b69052e-516c5646459mr20999951cf.5.1779362350126;
        Thu, 21 May 2026 04:19:10 -0700 (PDT)
X-Received: by 2002:a05:622a:4113:b0:509:e68:22cb with SMTP id d75a77b69052e-516c5646459mr20999661cf.5.1779362349730;
        Thu, 21 May 2026 04:19:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a410c87sm32062966b.30.2026.05.21.04.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 04:19:08 -0700 (PDT)
Message-ID: <69ad1327-8ef2-41c3-b07f-61d00e862904@oss.qualcomm.com>
Date: Thu, 21 May 2026 13:19:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powercap: qcom: Add SPEL powercap driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
 <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0eea2f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=fLRa9Tv8D7x8Vr91H4gA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: vap41LpmVa84AOS24AvVcV1Y6sXZh8Za
X-Proofpoint-GUID: vap41LpmVa84AOS24AvVcV1Y6sXZh8Za
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDExMiBTYWx0ZWRfX77YpKGpIvBUg
 8nDrT5invqaA+mRQx46WxKsLkS3Q8ibReMumb3UPOyeubodpnkwAIVcOKMMevlbj9/P2XKYfz2Z
 X6wfMrMXNCiymK6pdVCk5YEX5D4umJaYZidbWxzY55ZBpaKy3TTXdagBNDaAdU6u0RxLAKvZ2Ql
 goGW4pPylA2vtsr34iUyfb5zfJprsBDuvfkUSVC9PZlIAuXPeqXRWGB16nGwu+qYq7aBosVv59L
 qun+wTxiT9lQ7l8BKzNuZ/gE7PkNNppSwvraZJBwPQEBkZRQ3v51cnyuMSP1WMwbzyeK/1CRVrO
 nerwl3sEaI92C+deqL6StZvVwuPIlIJqfBYF/UHi0Sx3R+3OIATm+SJ4Gatld2UM+qtiVrMvqC2
 u7HivArKNVooxGf+Rlits1e7U3W9BQg/5bZFWgzleQrT1IB4xM1pBBzlYOmTt88Whx2TEm50w+C
 GJ2nhbPSnwV075HnKdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210112

On 5/19/26 12:49 PM, Manaf Meethalavalappu Pallikunhi wrote:
> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
> based power monitoring and limiting capabilities for various power
> domains including System, SoC, CPU clusters, GPU, and various other
> subsystems.
> 
> The driver integrates with the Linux powercap framework, exposing SPEL
> capabilities through powercap sysfs interfaces.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

[...]

> +static const char *const spel_domain_names[] = {
> +	"sys", "soc", "cl0", "cl1", "cl2", "igpu", "dgpu", "nsp",
> +	"mmcx", "infra", "dram", "mdm", "wlan", "usb1", "usb2", "usb3",
> +};

If the domain data is not going to change for future platforms (but
e.g. only the offsets will), which I doubt, please use designated
initializers

Otherwise, please coalesce the names and offsets in a struct

Konrad

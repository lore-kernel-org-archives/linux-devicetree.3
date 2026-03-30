Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20C1372EC0
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774845806; cv=none; b=o/vAHT9w4xT0g5aryvFC7f3R/zTqggHhY/R2DOxE9N2j2wRRKTr9FYcimKYa/xQP+kkg4m+WimWFZpZouR40U7U/YMDV3Utm5UfCjXm1ILboaEgeJDWWNJEY7hnZdXDBRfDKXXjqh8L5GbthZcxeD2G1mIdokUTmeJaF3yvlnWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774845806; c=relaxed/simple;
	bh=9WVzykcacsq22c50jNF208X+qoM9j8ADPetre1D+Iys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3NkU6uJMEKbNzueOcKlnRGFASfpSP2DuOCP93cQGM9xNGpE6kaOrRFATGiMWGfZE7iFvKRT8+UVavTedJBdOLK/acZROGNFQOghXe9jMguGPUV0/NwXRMMibPXFIATdsyd/mP3Bj6N93QD8XiUkPqeYbHgbfzRO5dt2zut8OLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DafHZeIn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NAb7WEGz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DafHZeIn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NAb7WEGz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TB1Jj92229496
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eNczafUMsUWBgDmDWTP3kexVfHM3mf6OxUQJ6oZLC4I=; b=DafHZeInPcGt2fbd
	JhQK+So+maBhaBc7F3bYLKKZ7wepGrRZbmq2a7Bw+lCU9xEnOa8nzpP6vtqI+y96
	+aQt5oO03Q3RgAn4jCFuTHM+SLSSvunir4UJz7lt+rkshAwFqzIt2oY1XEJj0nZD
	mvsp20bMGZr8TR3WmyxoK/87kt2LnDWWpPfe3KxSQ4xX1U1iCKK9w0PhtuZJ/+8I
	Ghh96bpOb93Qfd0TxlyvXYCWgskX0EgLbDcjP6HY3pJU/2h26UQMdXJLONpSp4Oc
	imp2GLRfISRb2QkNZOyBzM81YocSeVzl9MYtUSraE/wScFHoVJLSOSz5MMavUs6P
	YG3EoQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c2ap1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:43:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a6906e35fso5786948b3a.0
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 21:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774845803; x=1775450603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eNczafUMsUWBgDmDWTP3kexVfHM3mf6OxUQJ6oZLC4I=;
        b=NAb7WEGzRrjBmx7lOyqlgxttguhd39M3vqaWyA6C7HbRwnPxVipH5sisvY4KQR316Y
         MHxdRFte5SXDxU6opLRr9P9YsT61jo1IGS8SmK19wB7YH+HvORegDPqaJNf38T1sG6Sr
         zP4ueQ7yeaGT+mHTSQNi2S8SlLkHrV8A+QlbP9GLSLDIklRbKTK+Ze2jxalm/mHrhKsq
         3L2KqTG2XxKCzieT/0PzPKvLYkIO0Lk8P9Qd0LCTbfrY/6S96HXARwa4C5YlYPUMYU6A
         U125x335oef9wcgfMb6suGA2wYqjH87IjcAi7e1hd84kk8HH3y+SXRQnJ9j9gmswEKUn
         Xgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774845803; x=1775450603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNczafUMsUWBgDmDWTP3kexVfHM3mf6OxUQJ6oZLC4I=;
        b=nmKezB9rjUNDh+jJvfeDWTYWFiH3GoMgT4V/kpZ0i/zTOSmheN/rF2RrSqw0bsTFqY
         OtahjVqEKKN/B7r9fV+jufttIHntrOcuLJWL3Ez6CVEgfcU4mlMWALPB4tusywy0s/Kv
         gDkMUIZmL/ticPEJUnFrLJH29mpu+wwEmZ7l7MI2zVYHjK6dE2L2JdZuJ5tH+K9rOlRc
         ZinXL+cdR5IKycS4k0km0JOpd1H0mOoyK4hNe56quffwGnJ4qnHjZk49UVTc1AALQJeM
         6+npH4eUVoQeWkvXlQewU2CdQAI3yzwMYAjRvwVCiFbBN5Iud5cdSUat2Q5z+gtJzIMu
         IAoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPh+S3YFC9Ro5Bfr75qBDxpKwVX3+f9PQkwMCgCFhKN4WaHcqAqD2jUnoFgWlh46V1xtlMuj3SNhPs@vger.kernel.org
X-Gm-Message-State: AOJu0YzaO4Pz/VRa5fszrsF+CNaPQ50yijZru1+zMQfW6mAoc9V7F69F
	qRV6d+fpCeJn5Q7EOVkP8wF4Ly/XW7f3L+Pg1OTdepA2h6uLtB/vou6v9syeg4AHKB5bWBYFdvz
	tBE+y9GHDlCMskOYWzWmN6HExWoJvJnsxNMXkQZzwf/Dth6jjqhiwZaAPdHqjUjh6bG30/IRc
X-Gm-Gg: ATEYQzzzcpuhLdFm0QRz7UYTM6k43kBlzQZgpYNgVsf2fclqfEfifIyxrS5QCVq15mh
	reTRgiuaa8Ap3g/AmEpSvQoVByM8TndKXdPKeyjROhmg/qWAMqv4m+HzY5hwX20Gyf8CFoHBcGL
	lrXjFl9f6e65CqaJoz3N2Phc2TccHTbT1HZdtMB+7mukaOrB2jqdCekrrSvsg/m/36YBQW5RHfj
	cpsSgMNSACsXnLexPL5qbhgrkZgANAp3afAER78Vw0+GuIGO/t4lxgWX4TG3XSE5PyuBYWcdYwb
	PFxZOC4/a5JvyqzIWknbcOj6/1dyDjUJzQF8yjf1jpGijPRPDAt6gLdqDjLyShfyHAWC390xINK
	cuWVnldFwTazG8FOV7kRNIACfEPg6Q9OC74Ai669V1YWvCGSFr0nsSw==
X-Received: by 2002:a05:6a00:cd4:b0:82c:6d2b:7c53 with SMTP id d2e1a72fcca58-82c869c2554mr11585226b3a.19.1774845802696;
        Sun, 29 Mar 2026 21:43:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:cd4:b0:82c:6d2b:7c53 with SMTP id d2e1a72fcca58-82c869c2554mr11585200b3a.19.1774845802153;
        Sun, 29 Mar 2026 21:43:22 -0700 (PDT)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82caa8be173sm5310354b3a.55.2026.03.29.21.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 21:43:21 -0700 (PDT)
Message-ID: <721b870f-400c-40dc-b33f-0241252ca886@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:13:17 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] spi: spi-qcom-qspi: Add interconnect support for
 memory path
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-2-3efe59c1c119@oss.qualcomm.com>
 <92c58ea3-5492-4de9-bcf7-d4a419480002@sirena.org.uk>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <92c58ea3-5492-4de9-bcf7-d4a419480002@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzMyBTYWx0ZWRfX9YsHpFya0yFM
 qPI82OSQuhnELEU59q5Jyl5ehlW7eXn4mbKKm8gdChZGYkwYfKbW+J3Iv8WydolXoIMXlRUd3Aw
 t4h0O3Le3tVw4bngEIoVPm4vWb7pCeAqr6ogSTzAfSX5v5fmgEwcT6xxeoXgMzYJv8XNQEEOxHN
 WdaOGaC0MdB5PedQ7g1jvJ4mbGcRF8iQffKtFk1HAbb/5iG8480j6AGiAUfvGvLIjI4w0XnSfAg
 LNRj6x4Hsvqg5m6iHUiwaoUtW4sp2/YXFjzy4syOtoxU/4osj1LmF5mOun636qP4zYkwT1J3v+l
 RV80wBgl5jLNcYPoEyVH/eQZhgw35vBLgLvGJY+Q5gFgIA2Sr05Ex1qp7rtoZ+gcSuho4kISHFz
 8rdVl3AqfeQSJo9hmsww1DOWbMFAEMjkzy1biqTb/us1AgOEDHSU+ei/UNiJyYHjMkhx3dQ1sQm
 BVv16PYzabDNKvB00XA==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69c9ff6b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=N23bROnFMMGRNAIHwXUA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: qTyAd3fjUvjqinHa893DUL5rytCJiYKK
X-Proofpoint-ORIG-GUID: qTyAd3fjUvjqinHa893DUL5rytCJiYKK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300033



On 3/24/2026 9:54 PM, Mark Brown wrote:
> On Tue, Mar 24, 2026 at 06:43:19PM +0530, Viken Dadhaniya wrote:
> 
>> @@ -829,6 +842,13 @@ static int __maybe_unused qcom_qspi_runtime_suspend(struct device *dev)
>>  		return ret;
>>  	}
>>  
>> +	ret = icc_disable(ctrl->icc_path_mem);
>> +	if (ret) {
>> +		dev_err_ratelimited(ctrl->dev, "ICC disable failed for memory: %d\n", ret);
>> +		icc_enable(ctrl->icc_path_cpu_to_qspi);
>> +		return ret;
>> +	}
>> +
> 
> This reenables the ICC but not the clocks on error (which is a
> preexisting bug with the error handling if the other ICC fails but
> still...).

I will add proper error handling in the runtime PM path in v2.

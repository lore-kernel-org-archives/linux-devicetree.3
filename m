Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39423CF041
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 15:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538918; cv=none; b=ZwGUS2BBC1QDSxRvA+WI7UCNJwfyXhnRHDz7KeVm+Pwkx+9glzxgTREm+dNXDebBdb9Uni5mqZYbAeMiu+ASStjXeQmW1n/UzTAMTttddom+zE1bIQmtyYhD6CUuHuAokDm+eNtdH4c6R682pdnbNqexfpRHibM+tKpQg7ads1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538918; c=relaxed/simple;
	bh=nCRNN6CIdUWxU0TC0zPmBIGU88DS23T9rTmjY23BMuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UCyGftf0QF+lXbX2/FEvAl341WJQ+Q56soK21wyb/+oWHYCbe3/TLf9RaZSP2fvqPT0JL33luhE7ZjUy90JavLWWAYH9j2rBSeW0qpIWlivN1X/g4j3iRY5CkGEpCwFvbKT7SzckOvANLXZB6JYroHPQqJXTDxCHaAFGdSnqiog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVD7TU+D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpYK/q7T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVD7TU+D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpYK/q7T"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhZQn430560
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 15:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9mmPpVRAg1mCFM9/2ox53W3gNuvXNANQ6Cp0MI1ZH40=; b=VVD7TU+DcxlNGOUa
	LHIJWBy3TDYHlR/e72RkOCWkNT/Hh9dDv8W96P8DYqPnq2NTfXkeKEaqMS5ja99N
	Tqzr0RX6uiWXpM9YIAsm996j7skp81ye7tj7JUjz3vmK8O2IAfYKEPcHgvdmUd9W
	HY7lI6TnCf2XA8Bhdzl5TVEvOCN1lH6KZHOdnoOtRm0Icb5nZOnAOA2totvWAMAV
	Yjy47BkRFT2Uy3+UEu0ub4OQNtUTTfa94HK7ihsSmXYE5WocXUNVKsBCYSfJ05IK
	6cmRDfEczykC8fp31b6f0Fvb8XaohnM+ltgyHLi7K0q83vakcM0mXP1IPdY/3MNT
	WMxfWw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteyd9jdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 15:55:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5176ff55dc2so6918051cf.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781538915; x=1782143715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9mmPpVRAg1mCFM9/2ox53W3gNuvXNANQ6Cp0MI1ZH40=;
        b=RpYK/q7T8uTZsCGFEDXx7AmUFeMhU3x7d59wlraPkkEU1CzRH/2ZSmWZlhLb2Y5l8g
         0jK3m3hgrNqD7y9+eF25hEZVD36E5L8n3TmLc+7nvQuIoawEhQTc+41W6aXggG9eGiA3
         88Epm0YtmlK+8hOESN/ZmsdQgJ4P0WslFY150vG9jAgLVVBIaDtrF4XXqRtmf8wULIK4
         m2QjvKxuJuPmBDdX9eY/qf92onkCdvMpPwFVH6G9DiufR/iKc3mlc6qBe75ppAmuYsO5
         yz1X4AchadtaXHIzAX/w7oYN9k1ZWM4FWZKiIbhnr88VPHhVR4i4samv0l7hiBBv75K7
         GCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538915; x=1782143715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9mmPpVRAg1mCFM9/2ox53W3gNuvXNANQ6Cp0MI1ZH40=;
        b=VldHwuxyUVZU4sxewnzMc5Vc9eZweH/eJxXJzIWzJ5SBbm2Jf2BKRk8NNH5Lm7aCqd
         FPigVvrgpKQrl5a2ryVNNuEpdtlHU65Ytb78AUxMSeS6f6hzX8Uu3Eld9paa8cvSzK4U
         g7xl40Btlc9Z0gmgX5s4Zf6vTcigTfSAocGSsQqpDWZmlg051JN3c2QVirSd5gP0TRP1
         YJpzgt8ORGksPJz7VC7TbFzOAHLkMMK5otV/ci+66ZKx7mOT05FS35FF1rEfVvPt9K0N
         5kMiLNhOLwMvRL/xSpEWZ3+/cYPgFE67IMvboIsuU6p41TYs08SLwga41Akx5Hhjz7vE
         f3GA==
X-Forwarded-Encrypted: i=1; AFNElJ+qgZudKPJ+zWQJEl+X97fMXwrczrEB2ZPmEpnZbREJj08NDvcODiL9E/pgjlxpT2tfcJgEHy8UYz21@vger.kernel.org
X-Gm-Message-State: AOJu0YzuCKP+gLZdNLzk0RkadPVLZRVyxKGWEUSaCQqQu2o7zAk1Llmm
	C1Tg8WcuZuPlhZyDeTuzisKdcNo/aPoUDWQC9KQNSYb29tEnz8fNugd0TerPscjKVFncBjRQaJv
	0yM9cSyhHdXePiSaoj2wL4AxMcyZm7750oc6DY/G8yFdtQx8wdUk3yz1HaKrQT3OH
X-Gm-Gg: Acq92OHC7bo2yaswaEn7k6qPWuaLxgL9huKHcWZrKNoWNfSUIaZT4l0GrEDOu6H++TG
	MPc6FYOrm305UetFShZhWcTfA65Yt+IOAmRUI8XSrEVrem2ewA89nX5c+a8TlF+nS/844rYviIo
	LB4LKgC+4KdFqu7dgzPpNVNeDmK1zJXXyic4UO2s1KPTo7YvGZ7G1KYLJX1D6A9oh5ZL1x0COJb
	NP5vnZkpnTFsGcsRcAN98WWmhyQESsL/ebSgzEszxOX7Io6cNKsl+N4mQ2i0R/G+7LbGO26Iimy
	S062ANwNDpGL6DcIvM/L+RRkqG4zNd5m0rhDccK+RkiN0kAJT0A5Q8PHAxQUpGDgYi7rFWv3VKo
	K2C/mLMBO6CkzWATif87MzZs/hK3Jqtc0HSUGx4bZLGvfiA==
X-Received: by 2002:a05:622a:6187:b0:510:144a:636 with SMTP id d75a77b69052e-517fe46d067mr136948451cf.8.1781538915269;
        Mon, 15 Jun 2026 08:55:15 -0700 (PDT)
X-Received: by 2002:a05:622a:6187:b0:510:144a:636 with SMTP id d75a77b69052e-517fe46d067mr136948011cf.8.1781538914828;
        Mon, 15 Jun 2026 08:55:14 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937949bcbfsm3731921a12.24.2026.06.15.08.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 08:55:13 -0700 (PDT)
Message-ID: <60170148-2fef-4282-ad68-f784e4fdfe23@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 17:55:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: Add header file for ADC5 Gen3
 channel macros
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
References: <20260430-adc5_gen3_dt-v1-0-ab2bb40fd490@oss.qualcomm.com>
 <20260430-adc5_gen3_dt-v1-1-ab2bb40fd490@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260430-adc5_gen3_dt-v1-1-ab2bb40fd490@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nwBiMDNV8TT_-AIrKMzAnV8KlFKVJLGE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE2OCBTYWx0ZWRfXwSV+6ZF8JZpt
 N1kj6siAogpBtZaMKuxhq1sK9BLTkDsv/TpQfS/SX0mynepAnEebqwRNvf7ZUTBAaSMziHlhK+o
 6ez+Jl/Wz34tu731Fze6S/FwE393C4c=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a302064 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5RUdO5zOb_ExAWw9uU0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: nwBiMDNV8TT_-AIrKMzAnV8KlFKVJLGE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE2OCBTYWx0ZWRfX6RHGGBS1+pw5
 mGj683mV8KHJTYaHYmvGe/+WOOjeprvdCrS7+ckWMDRSvfDtzIbC+yLsnPNssZmn/G7g6AhzaYQ
 cs4UUqxLckhnArql1CQBK9WbkegsCiqh0+0nMsNFxXzharzoZ2RJwt/iR5+i20NbNVlhiq0SAx3
 vSTfptjz9ozBFOSh5vt+yI2hS/Idy7w8He/lUHAXFZignVhrvsZYyfKkrxtSG/ODOAUYFBUKrLP
 E7/7hX9kqhNWvGVc+jh9g/jZRO4xMay0Wxj3gWHp1ugTf0CXVKSfusjb3zDefNxX21Cf8YHwI7c
 zNrTt/+7lVcKWy7iiIMz8huj4uKs789WnYakGknzdhRxEJkavQjqkOMNFmOWTCkh22iE3bRLVvN
 0uxDQ97xv81uUWF+NhIX7qJX15eEw2LmL69zmh1GJeWSnoWsCg0V8awZ3F8k918Bzdn3dRhmSgs
 v52r0F7MBRmG4avG5sA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150168

On 4/30/26 10:58 AM, Jishnu Prakash wrote:
> Add macro definitions for virtual channels (combination of ADC channel
> number and PMIC SID number), to be used in devicetree by clients of ADC5
> GEN3 device and in the "reg" property of ADC channels.
> 
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

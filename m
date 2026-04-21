Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515BE3AF66E
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776764791; cv=none; b=X1TGatnEFJ4QMyAkqf2vzlqotBtkMfEp/cYfeNfgicx9kYiUonclLJOm/LJdWP5ofb1FbDh49+w72uOHloz6BPU888a1/XgN6fLvAcHt8cbrRu0dwjm/6XXOn86eQOWE6CLVzm+nig10UJmXrORmTnsp1vGnRTaFBtPYhRLywoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776764791; c=relaxed/simple;
	bh=mvEHAZ37oCPDXOuYiqAbdqn9ee2W2yf0pq21pqqdlpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sSZ1xe9ubqfCwL1/02dsjqAI3lIDScjDJn7Ad4A8dZovFGbmOYQ4c+AlxQo+t+T/ZGLe6Eh8MuTEDVhQGw3mbv9I7w0F9wspMpKaEeDXA9ACTQ6aJyURBSJWUcf05eIGSvpD1eSYs2cI3bgxLVH1ueSaU2DZ/njFC69KSx1RbhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSdawfXp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LgBwCxS2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSdawfXp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LgBwCxS2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L5jWpr1014419
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 09:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Nx4YovSNFz1U/AoUNwYoROlzNlXRuYyoJDe9nhlv6E=; b=eSdawfXp+6a81AiJ
	mOkVjFEs8pddnjmHP07YDh1lqqftB202ilCRxoG2ncVSkQQWwkhdebzTO/BufInI
	lFk0CEEf1WJ72o8XxMHc+lUflDaSycTQmTB+jq5ifUqv0X5v98Z/4Moo/Nkd0Vm5
	bNqoIrYFray9dy96Pqg4k9jioDKcFadqAvNqvOYG2SggJSLlFe88DdCbgV7rmUQa
	e9we9B3amW4qZqhVQmRsjbG+L6UincjPX9mMPBj91X1w8b36CWU52GpRJcvY53th
	UVVRS4nNGb7e9jGovCrpRdwwnhNbBcV/EgLZo4M3RkwWcjv2jXPIF0JITfR+ritr
	KVqUxQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnt902kjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 09:46:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8eec753a7bdso8536485a.3
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 02:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776764788; x=1777369588; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Nx4YovSNFz1U/AoUNwYoROlzNlXRuYyoJDe9nhlv6E=;
        b=LgBwCxS2tv/PPgm8Ui0zLMrvgZ8HV/rNodkKZCQy2BxPzOAGCi88kfgSlUxn4G/gpT
         RGuge4WAkBfl7XjwK2hP4WAA9xk94uosnAHoWlAnOZ+Qh56iSosfgph0HVppaLYOKsdE
         bx/SlrIviAHRCZJlyDpBWWhXpx4rCeEIcxfV6fQVmmZFl9Xn4SQ3++eajvhdFPJOP9eT
         6osgGZWKStNxm0niyL+YWUDKaTKHCK+dPZQXbt9KHaC5mqVHaZ0O6zz2BhXfhBdJHfhH
         J9s12UblSySm5wxFzgqpFuyDnaeAdx9jLizn83w98hf79NCOMnPHERthI/nom1ciFdVD
         53kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776764788; x=1777369588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Nx4YovSNFz1U/AoUNwYoROlzNlXRuYyoJDe9nhlv6E=;
        b=NkbJ1/VCcBpKE8JZR/8+C59Dtm9V3OXOX7CEe1xZCEsYwvDE0X8xxMo4gIEF2F0SEl
         s/XPo5ufc8SaMF519JN3ww0QQA4AeGkbAeDTJXOPwIA4R2R2htMGqcxCIYTse/rGT453
         J6rvumX3Fpry4mdBfhGoQg6mNMmyeATpKPtaA0Ckk6WuniyyCytj4VxgEkfNr1nXPHcG
         pYCylO6uo+c8rkQN6zGnmf5R0UCngnyvbzdMobKbTYYxpgEdZkq8HdzjbSGjYOx5NBmb
         TbCIt6NhvWuL3kvdhBCq9YdLNQhnF9R/ZcTyM2SLOh0VuhdfN48c3vtI9N/oWv1/Dn/y
         MtGg==
X-Forwarded-Encrypted: i=1; AFNElJ+DtC3quEew9Qjm1q2ohFdTle6lEhifu2gE1K0zyOgfyMafjUgSuAZLv8fVNIcD5js7c/lgMhdSE0a2@vger.kernel.org
X-Gm-Message-State: AOJu0YwTZ/hrCWbjE2kcOXgha/35VcfcOP3/RHas//6KWBiKndBPAozq
	lFqwGd18eU1W8TOkj4yg7l1itdM8nJslWa8G1rAnIGdXqKYO2Ka2TWyLCv/A+2785kbBezPSrfN
	NdWRweMEsy49XvczsghoBz2FcWMXGQLCndzqCvYSgnTnfuqgw2g9rjZ/lp0/jBkwbZ49NOPpt
X-Gm-Gg: AeBDiesj8f3jIGDjiBHK2niJursRt7tT1JbAHO/DnJLkOIDqub/tRgga9PQD+Omcv99
	EUJVD1fQkvrt4/E/S9xkOayaEV8vhHea55oPwum9ZbONQGUpeFhsriaO1+pq0/nfR3Q7tDsgMdY
	5DhPkkLM67UnQ0KSa7aXpir0FkQkIVybXU4q0T7nnunYOf0ZAOJJHWpuHdaKVN5ZlpHA6uH8Cgd
	+bnnthI/NmGG3w4PHIEcN9LHhGWdJGibnlIFpVn+ZB3pL3wf5JTTqPc9oEdFSv7obsRUIKsU18a
	R7ZgCn+VsEnvaoQq70f7yOT0+1mYr3B04r0IDALVqL4mIhYNqyVHHZJetLHkXTqMtsxzs3v00EE
	dJxh40wCZ2de+O85bgMqrLYMN3GGUeciYXuPqJZsgA8AqsBn1cve7yizCSMeHsiDPA/fFeitCyZ
	DSVejsgTKDloH+aw==
X-Received: by 2002:a05:620a:458e:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-8eef44a05b2mr36849985a.0.1776764788441;
        Tue, 21 Apr 2026 02:46:28 -0700 (PDT)
X-Received: by 2002:a05:620a:458e:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-8eef44a05b2mr36847685a.0.1776764787906;
        Tue, 21 Apr 2026 02:46:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c480e18esm2575163a12.10.2026.04.21.02.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 02:46:26 -0700 (PDT)
Message-ID: <20cd0d36-eaa4-4ab1-9fa6-37d43887c7b8@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 11:46:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] spi: qcom-qspi: Add interconnect support for
 memory path
To: Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
 <20260420-spi-nor-v3-3-7de325a29010@oss.qualcomm.com>
 <e7873eb0-bfcc-4ad2-8016-17b0db80feea@sirena.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e7873eb0-bfcc-4ad2-8016-17b0db80feea@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfbidwYD c=1 sm=1 tr=0 ts=69e74775 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Ktr-gnuM6ESvd8fC0OUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: FkxW_yiC3EtaEzZFNXlg8EwdPVmC4mUJ
X-Proofpoint-GUID: FkxW_yiC3EtaEzZFNXlg8EwdPVmC4mUJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA5NSBTYWx0ZWRfXxWlUrhNWQ772
 zaOfQcO3TFScU6FihizDO9YpBPIXeoHNuPoscJlXKbImWetky+ETllhEr2ECiNmTP5m8TFXLrCS
 MnmhfcVLpC7sY3CfRrBebqy7pMv4+B06ToRJ5LcT9vHV2ECP3tq7HstJbOtRBAdX5gtzleAlArl
 nUUUxSdzjVgq/tcq+VkFQLhALZit0gi+HrP6YgK9wgz3mTL0Cf23XkGHLLoicT+d31hb2wUkRKA
 s2pLpac1fZ0fABYD1O3QAXIKJiu2qjvMAtijkMtHGmVEtCsde1eC1CLEbG/FOdZnIUvA4YCCUAm
 MChDk6rgwacJ+yE02bDSZn4Cfe6/yjbQb8XR9hJdnAB1DqEUi2SYKJ8DiyRoQwcYD7dD28lnySW
 9o8/2XS/RaDltCcQfrrV6rbd62qMuOahlReyX09FJE6w+p7NDqvj8oNnIzO3zn5SGAOFq9FvCe+
 dCZ1/TR3fHqjx59FRWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210095

On 4/20/26 6:44 PM, Mark Brown wrote:
> On Mon, Apr 20, 2026 at 11:42:50AM +0530, Viken Dadhaniya wrote:
>> The QSPI controller has two interconnect paths:
>> 1. qspi-config: CPU to QSPI controller for register access
>> 2. qspi-memory: QSPI controller to memory for DMA operations
> 
>> @@ -729,6 +737,11 @@ static int qcom_qspi_probe(struct platform_device *pdev)
>>  		return dev_err_probe(dev, PTR_ERR(ctrl->icc_path_cpu_to_qspi),
>>  				     "Failed to get cpu path\n");
>>  
>> +	ctrl->icc_path_mem = devm_of_icc_get(dev, "qspi-memory");
>> +	if (IS_ERR(ctrl->icc_path_mem))
>> +		return dev_err_probe(dev, PTR_ERR(ctrl->icc_path_mem),
>> +				     "Failed to get memory path\n");
>> +
> 
> Does this handle missing qspi-memory properly?  It's not conditional on
> the compatible so it'll run even for existing devices.

Ohhh right, I glossed over this.. looks like we need to ignore -ENODATA

Konrad

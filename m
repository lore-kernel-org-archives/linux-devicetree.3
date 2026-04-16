Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7659B2472AF
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 05:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776316494; cv=none; b=nA0QSR6sDyAT1HmRzx4Q4gses4qFuzWHvRslzIDcGaT61YvdUpn5zARjV4Y2MFbIBluTjs0Pk3/Q0WVSr7kxBLoeUQjU4hRg/wNPDHmP//8fPfhEX4toloVlKJ4+GhWriC3CAW+FUi155AIuAQ84yw2NAg79TVb4OVuuwsXUB7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776316494; c=relaxed/simple;
	bh=t1VGyiXWyMdQ25cykNcULPO2ojDL7yLO5+ejAaqY31Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e3xa9JTDGUOGPxfsunShKpZjquWhM+toN5ODMyZkHFedZqfiOU6efzO/dt9VIAMC/BmxCEg7b2sqd0WUxqySRj+0yBNDhOKcAMos/RQQvEghAnRelP0EQ9ZsqMEY9ICcBS8VCfDxu31RKPKOcJ0mKGxYOUnieHxMSlAq1mPmdCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ek/QbMsX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MlaW+vnM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ek/QbMsX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MlaW+vnM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G2salL506950
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 05:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6f7fWQvChwCEQCaCojI6iIWeIE9cgBFRq9QL7hvWFRQ=; b=Ek/QbMsXSZXMQp44
	/KTtG9hAT1OYBFVVyWrlM2pFWSTZe2gB+lK1rk2HEEq3j8f34y2IVknZJ+VpLhqF
	8fjbpvLzPSiuG5Lk7lS9AVuopb/s0P223J46P3ROknFoxjUom5/0PQwo9c/h3kOZ
	ITK/jmPhpkkCsd4Et1gG6XdveY5e+OQQuVQDF/XM+f+vIiuPio8FxAXflijgHy+z
	grOiP8abn+c/iOnLRq5K5oO7EzOivXZsEDjn5IoRjpqZwkqte48V3VGvkrN4Rbvt
	PEzA3lDU8nMsfjMM3ltH3qW6lCG6LfwG/4sB8NHX2O+RdvUpO61B/nnc8RDOA2fn
	wqUi7A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dje1e235g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 05:14:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35d9f68d00fso15277725a91.2
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 22:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776316491; x=1776921291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6f7fWQvChwCEQCaCojI6iIWeIE9cgBFRq9QL7hvWFRQ=;
        b=MlaW+vnMrIRf8nWbGUuOhr2S3AieHq904X855mTQkiODgrHfb5v+XUfT2xYUJlMwaW
         CSJLEZGs3YKKhita9R2YSYiBgxX2vkzBvZEa4oSN8OFp3BlFpMQ4dQOXGqk2JtnEoSeI
         0+dnNaCeJrjr2x/8Hs7GANcYzFMgQF+g3vkbfqbTfYlD0L2MIPue9uj18NQs2O+dDysQ
         3wTA3XPcriiWungR/IBSvjYV7j89jIlZrK3WhjE4HCppc2AEQjh/CQ7UtRIi3ECk7DX5
         YmTeV9OkWx3lQmQBKUvp+lg8bxzRPWPG+X8EyWIiqvdb6CMQgPWElZPCvCaMyLaFOqzL
         4Sdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776316491; x=1776921291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6f7fWQvChwCEQCaCojI6iIWeIE9cgBFRq9QL7hvWFRQ=;
        b=o2oi6CZXmRfOuE2us7UmASZJflyfwkf0cevClIlxoOYvuoJjZMxrYr8CcnhVLSQh9o
         wEhtPgqgwl49NUwDt5btr3alFYTh4xKBUK2LIVUfVh5/tXEZXONZWEhyeRErYAMwbzE8
         DBlszfCtBtNpahbzeZU4doLRoICbqfywTySSjkh1inq19FZhql7QGTIpuo7WRdAJ+xnz
         dlgzcZNnNzp76wsbzbz5/8ftSYBti1jiCWn9JUGyoYcEuMo+v83/9Ab4sbuxAWnuYqej
         aAoTddh4ERsA1JUtoGWKSA+wpkzGNltMg0jhTe9Flj4SnSkSrVX6ewPNYYu6dHVhLd+a
         fITQ==
X-Forwarded-Encrypted: i=1; AFNElJ+bN8nxP3Gw2eWEf7MZfLcwU9YzAXoJ+qqkp6UtvmvdPscoMQh+CiB3b5sWXZ8KR9ldQMDsXXbpubyI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1+gM9Oic1bpheuF+rGSh4uK++3ZCz0lzHPduO/GZY2kx+2juI
	uyIkJDWC/8siokaHkc2dGONPWqw/mWkCFDS0eghQjU+sCunKovabBZp9Tz58qarrWZM8Hl17LNE
	69Rkgy4wG6wOSfQ0bkPw5QCNXTSwXDJuChoQ4p/oU9oCywS5Gk5UKvF6E4ojaHVXX
X-Gm-Gg: AeBDiesJYrN3vioJOOz6gUAOE6VoSxyNrwN8mlyeNeF8JT2jA9vcQjtd9fboOSAa0na
	7NI1+SleYKdHruxfIOjYGQTNPEpF+d3pIsqLYSfdIWCixnDqjL1QIC7jatuTBjpcQrP1a7ESzpH
	hNvq2uRYyk4wqtB2dtvoyDytVgoyTMYnHUhHIr4Y+6/wi1xVzGaDjUHCu0OZ2Cp/1YbaWWlcp/m
	kzvcsVDcuc2dNNeV68vgGv8m76iG67S2gMUBW3KBUF5HbfjPMitlZf+wKz+8ELsW2GP0bOkAI7R
	beQh/HrWLQMhGXdvw3Gq035pG1QmEvijCXMejq8+mC5Og+vOU0XXnF8qKRyJga2gA5xWB3ck9Jy
	GEKVcEAc9DI/t6fT5ygKDcuuM6Hpzcs/wcnadIEJOs5WBM/kgcUxU
X-Received: by 2002:a17:90b:2892:b0:35f:c5b8:ef5e with SMTP id 98e67ed59e1d1-35fc5b8f3bbmr10008353a91.10.1776316491458;
        Wed, 15 Apr 2026 22:14:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2892:b0:35f:c5b8:ef5e with SMTP id 98e67ed59e1d1-35fc5b8f3bbmr10008330a91.10.1776316490948;
        Wed, 15 Apr 2026 22:14:50 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36132d9d1b0sm843960a91.9.2026.04.15.22.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 22:14:50 -0700 (PDT)
Message-ID: <95a01fa6-52d6-4e44-bc8b-69743b2b48fa@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 10:44:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: Enable cpufreq cooling
 devices
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        dipa.mantre@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260415-cpufreq_kaanapali-v1-1-1fa94105d5c2@oss.qualcomm.com>
 <020442d5-5697-476b-a96a-6e96ce054363@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <020442d5-5697-476b-a96a-6e96ce054363@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HZwkiCE8 c=1 sm=1 tr=0 ts=69e0704c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=AyGf7Etz6SCXtETE0GgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA0NiBTYWx0ZWRfX3PYdIMRKb1N6
 VaqjovIpanR7fVAH/y1nKRJz+Vuddc6r3/NQaIj2tH9pJgZHbarPIbbQmbwbzdjh8dvLDRef+Gu
 iv56CWwYsH6lKsTBk4Nxbij5l6fjjmzBU33Z3u2QjOIb96PdlJzJuxYjtPe1PLhkXre3/HgKC92
 1aVjk3BA5jmUNpjhDI1oJYuKfoA1TJPzZ/AoyGtdEro52oI9+/eVrbWnHut1TjS3+VAcDpo/kHk
 9qzMM/awvBBMydVcDKl30SATuJX9dqk1ezdLChqSOX5uSCHrZxgdJlvzPpsLlXDipM2TryX0bjR
 shiRnSvXLJDi8ahXhEEf3UkJ6/WSYmghVuBT9IhDxBDT9dZQ/TLERqkH3G35qizK5caoVfH6S2D
 35F5524GBH10OYx5m4PumAUTrdRYNy3ta+PldUyS6z9ub1NQQg5nsVFuuTCCSdNjHCc/Bqeax6i
 nI9It88iXyOjL0m6mKw==
X-Proofpoint-ORIG-GUID: IoezUQnBrMEzTSDXk-5jWjfOUPOcZMSS
X-Proofpoint-GUID: IoezUQnBrMEzTSDXk-5jWjfOUPOcZMSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160046



On 4/15/2026 4:31 PM, Konrad Dybcio wrote:
> On 4/15/26 12:57 PM, Dipa Mantre via B4 Relay wrote:
>> From: Dipa Mantre <dipa.mantre@oss.qualcomm.com>
>>
>> Add cooling-cells property to the CPU nodes to support cpufreq
>> cooling devices.
>>
>> Signed-off-by: Dipa Mantre <dipa.mantre@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 

thanks for this change:
Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

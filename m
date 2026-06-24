Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B30285CA4
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 11:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782302172; cv=none; b=NFoSlh2H+AJNKKgGNJQemjjSFSE0q3UGY5O342TiEIzIAg5vDbd1/liDu+mtVuccwEC1gXMHjoBMpe0mSIP/WeQ1PzWRGMD8igfeHm18xHGX4miLaWD1jaYSFlE8Mz1Ly8/je9PqaPDT6JeKutwPnh4rottwCGmfYI3/WcJfsiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782302172; c=relaxed/simple;
	bh=Ngg0cGGv2Wf2QNNVEbm7R7xNMHMU7fSuNiLkGSyhs+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M0efE/5abtndY42prbYDEp9rZW8icyOg6HAYJ5MtMZib3QyRUprk/1XPe1lJgLrEy8P/5EyMPGg7dlg4T7Ck8npLQHbckkE/oY+U0S0nLC/eTMNJwgjRpUGes0L3S4o8EPbXBPMl1VfB9VCwCpxBHFJ8JLWnfLnWquy8O9rJJR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/yc1y/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YDGj2nHa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/yc1y/a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YDGj2nHa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OANZDI2869039
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 11:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RyPN6EvgQxaJhTFxH3Ut9REWWNSgLGQUQjpDW8qVC7I=; b=Y/yc1y/aD/s/JSaB
	qzzG0kBATesvCYN1rH8/IFWlA9qjzByPEvXFwNbQZDBePzUQ5AGCbL8Lym0atLRs
	pI1g3z9g/7YS+/IqhpCAynZB55ZG+7CM4MckkiathLP44WdWLYznt0VkF7jCFipQ
	UwfdSJGHhsWobJiRVQarE8YGMUy+TM4UPvc2rfs2xQ+y7nm8cvjEsXMl+T9wAnEQ
	cWY3rVrMjg6BnAa9W+kmmkimquYfIFQXuWLlLyHcE0Mcy95wR58t+Kp+GtevVFew
	DrvgfIcDJeQZNvBRr66hSxqFo7fIrBC5SWwI0j1aAuFzZtFFHTDSq0U/qzHV+k7/
	Q3uAgg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0apq10ys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 11:56:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915ccc2d4d2so25337585a.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 04:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782302169; x=1782906969; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RyPN6EvgQxaJhTFxH3Ut9REWWNSgLGQUQjpDW8qVC7I=;
        b=YDGj2nHaTNdqtKXcex2/FLD+qyxqtiN39y/8N9SZ8Blgzoc9i5r/ArOyw3xtjrbcoo
         kjwjwgAxCWcjwtI+4VXqy6PRu2Q927nAx2a+y5g5jzXI1VxTkoKST7wYn0f1oUdbnYwX
         +W8TJgjiyVaAm7TU0SplkR4hiKpV6vYT0wQTQoIVipUDmxekyScKdM1UQvLcJRr29/iQ
         oZX3M6wzM7FhXXRAzScMRjkdN3xFGxUDXhJryJirSWHgKaiO1y0WeAgHR4oaXGu1PM4u
         6lbJgtx9kG4Uqf/vDXpUlCg88IaVaIe0fKHekYgW3h87ShzmTFtl9H/5q86bhzM15kMR
         rq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782302169; x=1782906969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RyPN6EvgQxaJhTFxH3Ut9REWWNSgLGQUQjpDW8qVC7I=;
        b=ZNVM7X+vJYfN4U0n4fty5WxWDJgcyXZC4n0kLTCvbfDTAnUPpdo8SUwUiC55HxsKLB
         v7LTBWNXBGh97mU7bWkgDz2UvyPfWoqUiWtBc2rrsCReZDtKdtWh14g8WV3+0rPNbaYV
         u2Owoc3qhj7AXsAoWzOOopd6BQIDSwncsCYvjKVm9Rpk8s0n6JnneypJI2lcn6YAq2zZ
         oePV+JhVkGZpMdIIa9/vPhpmfDm1z7kDUj3nRpdfHvOGt6+lIiRA4AuyK/1RimGK25XS
         9tCbMRn5Q+sYDlztRPE+YiSIXysVUvK0HlYmqK300qwlSyP5Mlfvx5iha8bwEhAW0lhW
         Q2TA==
X-Forwarded-Encrypted: i=1; AFNElJ/Lamx2sZ5nTuJwKYIQLoei8X1EWT1yzZTGWYflSoKcPYACDtwcSKWP+kW5dnsUZixpPMS6IbmzKuQS@vger.kernel.org
X-Gm-Message-State: AOJu0Yw58jiTS48FfDzdf2hXLMzycRmtkGXUL2uDhvmgYC8DpcA2bc9E
	x4XUFpuDoMOaQ5itt3kCV0ujk75lO45Exvq2VQzbkqrFymMXWjr+70X7Mdq/tuvuF9UBzqnJhW2
	8R2GMd9rWzIiaToAltfabS3SWTw5jM8UM9K2VDvGueO8PHfAq3KJCrFqnLJe9Kt5b
X-Gm-Gg: AfdE7ckthMhPqEWGf+aMZ3SQree/gMoOfPy6oFfdSVqLKx69mOGe8sRHUBswpej71Pq
	yTRTf6i76cw0c7GMjkPAqxyPd/1w+WaLov3nEA+J2xfzGxbWNDm/tPr/VPY4Rgzhp+8NNCrYFRN
	ZwQCH9DEdPyGVgR5Rxh4X5VcPA0VlR7/5RceAQnAuHHKoZoW8zq5zvOmSWDlJjtBlQqzJemlLya
	lDtt6Xy4pnkJOf9GhkOZjzQTO4CqM4E/2+Szw46tT9hnaQDAHMi+bJybqzNjecUBZvoaLLOAHFu
	9EYh2g5ZxzEi+MGgZglWm/PO4NNO35ZIHU3F5bW0YkDLDV+Ii0Xw9s7jNNF7E6Sol1VPF/dl9op
	zN4IhT1D00eP/fjPb28pBkPjPhH/RCfhr0vg=
X-Received: by 2002:a05:620a:6cce:b0:920:6579:bee8 with SMTP id af79cd13be357-925c6f59e85mr956990885a.1.1782302169300;
        Wed, 24 Jun 2026 04:56:09 -0700 (PDT)
X-Received: by 2002:a05:620a:6cce:b0:920:6579:bee8 with SMTP id af79cd13be357-925c6f59e85mr956986285a.1.1782302168573;
        Wed, 24 Jun 2026 04:56:08 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e49aa07sm648558966b.10.2026.06.24.04.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 04:56:07 -0700 (PDT)
Message-ID: <896f3704-e7bb-48da-a501-0c9b0228573d@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 13:56:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8250-xiaomi-elish: add ov8856
 front camera
To: Xin Xu <xxsemail@qq.com>, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <tencent_A65CB41DCB0CA96634CF8883E1CF89059706@qq.com>
 <tencent_A7DA95458754255A62A4C730EEE484AB2905@qq.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tencent_A7DA95458754255A62A4C730EEE484AB2905@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OqpBdEWzTq4Q5ShQ4l8bGTWnfApumDtF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5OCBTYWx0ZWRfX8c+59hYpmgsx
 Ein8IMuADu1wk502+3zUCZp6Z/922PHoHGPd99fAUo4MAx2QzeFSmrxO09RyNpOKsJWtHqGkAcS
 XvVpCQmKszyuTbqW/o3KL+XJgiJw4GL1tvxAk0ishmUnaBUNM18BA55CFQNcDDxfwp+eTWQI23I
 SJ/NCBAn9tnCoSQHMDl7JCo5gMNIrG5FvPk+8HCiAgVTJ0m155jDKCqEkJLKKrRiHqDgbDyB5RX
 RsQl5WL1QCdSVMzHFw4NzkAzDoLJbHEcBpOocZwLMsmBJF/Z2+2VLlw2Z55g6FYkoN66hUxgSng
 MexOw1iOG3CmZFot+nm1CtUmP+NZMJ2BbGu1IzjhmaZS3AJKEJ6IkzXL4hSqhxN+KASPCX4Jl2l
 hJhBiTkEEHoDXc/33bzI0vDpSXe6UXlAYAj7eEOVLS+Lfz8yXoDJM0YOARxULv3yBp4otpx4GLN
 AhP8O6aw1TrwvAtTL5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5OCBTYWx0ZWRfX3/E34DBBK3xl
 qetU4ZVFXBYOgk3oYyYsH0oTYb1rhU3ExU5/qumN5ZoZkY/84f7R33EsahrWbLPvmAH0mSclj8c
 CmTvwr3+f6aZ8OqT/so/0TBwtV5YHTI=
X-Authority-Analysis: v=2.4 cv=NpbhtcdJ c=1 sm=1 tr=0 ts=6a3bc5d9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=dZbOZ2KzAAAA:8 a=jjwmVdJPvyX2indV5vwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: OqpBdEWzTq4Q5ShQ4l8bGTWnfApumDtF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240098

On 6/22/26 8:52 PM, Xin Xu wrote:
> Add the ov8856 front camera, connected on CCI1 to CSIPHY4 and
> powered by pm8008 LDOs and other supplies.
> 
> Signed-off-by: Xin Xu <xxsemail@qq.com>
> ---

[...]

>  &cdsp {
>  	firmware-name = "qcom/sm8250/xiaomi/elish/cdsp.mbn";
>  	status = "okay";
> @@ -877,6 +933,20 @@ bt_en_state: bt-default-state {
>  		bias-pull-up;
>  	};
>  
> +	camera_front_active: camera-front-active-state {
> +		pins = "gpio109";
> +		function = "gpio";
> +		bias-disable;
> +		drive-strength = <2>;
> +	};
> +
> +	mclk3_active: mclk3-active-state {
> +		pins = "gpio97";
> +		function = "cam_mclk";
> +		bias-disable;
> +		drive-strength = <4>;
> +	};

nit: other nodes have drive-strength before bias-disable

Also let's move the mclk pin state definition to sm8250, it's not
specific to this board

Konrad

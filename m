Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09244192FC
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817202; cv=none; b=KR8+eM7EN5K8totROB+w+uo06Iu+H2ygepXbf5wLEv2qJCOUR7pl2ZL0D9UCnGKDCMx5Vpc1fNh4bb0XR3ddwCSAJFLafpDYMHJPX2MjVo1CqgyWjcgMbZBmIUYZqWDM6BN4qu2XThYL8PhNUnYa8459If+gXn9L39Vw/HE92Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817202; c=relaxed/simple;
	bh=Ec/MyH4Xri+y60xMNcT6+HsrGNJeJczzhCHvAGEnQVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mk0zfRSDCtU6E+9fVJyG3bXqhKLUBoHMmgkynYbluOvgpKPU9j7gYnAyBYw+M3djJ5nJ7wpUQf+5qwP9D3z5h5cH7zB+N3LjtQTUWew5Dggch93IxYBVxb/S3vOuJt8qgR6GWPlVMnzhTi/9M8y3B4+KeuvYjxE9PFh32R7NI0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ll9MB1QO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S0HQKvPm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ll9MB1QO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S0HQKvPm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mqqL1611625
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WpBZ9jkb32jVHwTH+Jt+1cvU5EwYSlabbplseY69W5o=; b=Ll9MB1QO3eXeMkXa
	0CTb/WBQuuJPgt/bOCAQ+jPuok65MaedIfkjhExjs84tALQWT3DwdkKiPz4raJlb
	HAeqexUtc33+0+x1DHbOhucD7OQlYnTSeV+s3/ETnTC7B6rWfE3ilMY8GrKJULQ0
	bxoziPmeNqlIybxs2L2kFjtm1fRKwFsOR4sUs1M3gDFga4Vv5kyKwcDjnUjsXp4Y
	vbKr1ikP6JHwWrlNYoxhSnsmrwJVTXtATbpv1DEoS3HqbVu1d6zLD/ouQmZybwJ8
	0EeBhVE1KLO2/kP/74hcsxbZWvCn6KCGQ6us5etD523adKBxk9gMH7vFrj1EQA6j
	42nXYQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gt7ax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 11:00:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c81db324caso32162015ad.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 03:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782817199; x=1783421999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WpBZ9jkb32jVHwTH+Jt+1cvU5EwYSlabbplseY69W5o=;
        b=S0HQKvPmX6fbRmXuwZIFe8pjnjrPCxTLDNtV5W4m8YHjNGU/T/H+yS9lrcvZ1bCqAM
         zE6R/aBAqp4JdlaiZvjWs0a/uZiR8Tfnlx/7ajuelNj6sifBoMwOMOBVdDTSQqBzMEwa
         YKDm9v/5JUAB8HzB3WbDoV15OAGt7jtXutJOlzxMXBk9hGxBzNzbTlSxAjkHdJ+huwxK
         xjfXTQJ5p9Eb72FeVUEoSbmJ8xq7HZRYr2RrVHHeOgryD7PcK5OIBOIzxNehRXhGtt5r
         b5aVII/e5driIWu+mVXqnujX5ottmmN86jMBQrf9xp7RoWZY0lg9bSaEhHei+oOhrQs+
         bm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817199; x=1783421999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WpBZ9jkb32jVHwTH+Jt+1cvU5EwYSlabbplseY69W5o=;
        b=AQC4aczBkiYNbV+kt2UYIdHFLvQ34WFqhqCwI535qMFVHzRD0SS2x0yXsjUIRHnnpL
         /lO7HUz1sis/mppPu0NiZwQF+fpsoyC9IgEU9YFdTitxvRCNq9i414HfSLzWhmZqlXYH
         jCiY9mnjHpLasDso6APFYZbV8sB8qHfY/96ROBOVceEJxEjRJMfJ9mYRNSgnhRz8xJ0N
         tOUdYi9tVeQ7x5P/BKNOwiflcy2eHtObhEy7XZUsjJE40OIVWlmUag88fS8ue5YoUl8r
         W978iQkUrywTCdGAzsy2eqvz/YL9xF1cl5y6netYAVEkVOZ85klPVHGI4QV00RaSMM6S
         UUgw==
X-Gm-Message-State: AOJu0YxniLeI6b94rBJKPJZt+iHB2OEvp/ncgrptmh42ZlH1eTnr+uCc
	DquxleB0aJs3m+KL4+7HACiQ0dAq276YX/glueYCMmGMm8o/1e+R9lKFN7vwOttBIrX8w6PgxJo
	8vmElV7OyQ/5dLyMDnxsAu1xaKgEYbmJv29AZjc+Hy71vgwH/ll620lvf1f6jwSYx
X-Gm-Gg: AfdE7cnSzWIh52Vtg/Frsr3XJFE2N3dya6Cyvu7lmsjaKdsW+yal9hEg+7/x4UkgTx3
	LNlKqlw+aJqsseF3vPWJ/MDWh3PmhWMgI1APhM9j9GdUdpUFhhakK8LT7VhRx6Zr0FsqeIofrH5
	3DX4Cy8Br+dyrE/IerPoNcprYAmH1giDQRj0p6CjqJMiJxwCQV8c+FQE72Pe4ki35We0+Yd11S/
	P72HbX/IWmQLEqvvm/OccIMyIlDaqTKxVQkLelYcDfBmLGLkcATzgDk5u/PG3mUfPcOXPX1rODR
	cQ6iTXI+4R7ZVpckulEyNRtKIzhA71xVaW6uDK1S3uuZ7itG6W0zmcA2j+g6VCKDiYKHjbpce3i
	GmOLUYCtcJB2AaIrwNLLtmFICKV2r7MQp1o1KmYeX/hnAjwq0wcelQ7kXfZdkai7Nv+Un2LOB9H
	Q=
X-Received: by 2002:a17:903:234f:b0:2c9:e9db:8167 with SMTP id d9443c01a7336-2ca2d52e925mr23911505ad.7.1782817199059;
        Tue, 30 Jun 2026 03:59:59 -0700 (PDT)
X-Received: by 2002:a17:903:234f:b0:2c9:e9db:8167 with SMTP id d9443c01a7336-2ca2d52e925mr23911315ad.7.1782817198513;
        Tue, 30 Jun 2026 03:59:58 -0700 (PDT)
Received: from [10.133.33.23] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382bba24sm10888325ad.71.2026.06.30.03.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:59:58 -0700 (PDT)
Message-ID: <8f175e76-b446-4afd-ad55-18b67eee7e5d@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 18:59:54 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] coresight: tnoc: Add AG tnoc standalone compatible
 to the platform driver
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
 <20260630-fix-tracenoc-probe-issue-v3-2-7201e1841e94@oss.qualcomm.com>
 <20260630105749.197541F000E9@smtp.kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260630105749.197541F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwMCBTYWx0ZWRfX7pFegd4qOmdT
 498XHYyatmNMUNSNdAs6mt0FAcfIIGHTUf2CNRFiCteOAp3fAuvA/n0KXzAvZZGqHEBSwhuIFgw
 GdBHXrXyP8tuChOt5dHA3GV9MW/UGrk=
X-Proofpoint-ORIG-GUID: zt2kUXZS0myyzuZmXACDqxtiqV7JPomf
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a43a1b0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SyiVr3T7apCZMAOczy4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwMCBTYWx0ZWRfX75fNyZSjHdz9
 OAa52Ri0Hm4h9K5nlBOQSodScf6mMkxxl9S4483kI6uE9+y6+FF8xOO1J+5yi7LczjHfuzvcsnI
 ks3xIPBlLA74J5NlN6F/0GOhAYjiB1TDrmewhixymk2mUF1LEcCnhVXbowGa1fj7oPaTJXnyl9Q
 +RVGyTMwTsIvefO/w7M/p4YRkOAoWDzUwBBalsAiWhUa+L92cnsXIKMlor5qmR0E2wsfQ32wm+Y
 qqwbajOYwiIvpKZg+Xg0r6o9ElbtQmn6koEKYlBB9d3wppiHrVDQ6Yg3ms0ZIJ6Kcf/Dm0hRmm6
 3GSquckQT8Dkpv2aBjSDl/XEg/aApitI+QKQJeMZpS5sfp3kxV4RsjJLP7KBZizJ+7Mi5Y62+hW
 9OiB6ZNssiwXc4p70l7WMHnXRfqK1YdLKEJ+kChMsGCosv01ELs3F6AY7EN/wipQ5PDuIkTqXY2
 Dx/zAVblNomQ5EtBejQ==
X-Proofpoint-GUID: zt2kUXZS0myyzuZmXACDqxtiqV7JPomf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300100



On 6/30/2026 6:57 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] System Trace ID is leaked on platform device removal for standalone Aggregator TNOC.
> --
> 
> commit 060ed6649d8ad0bd7b6b53c7f626563782e801df
> Author: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> coresight: tnoc: Add AG tnoc standalone compatible to the platform driver
> 
> This commit adds the "qcom,coresight-agtnoc" compatible to allow the Aggregator
> TNOC to probe as a standalone platform device. It updates the platform driver
> and callback names to generic "tnoc" variants. It also modifies the default
> data initialization so that only the Interconnect TNOC skips trace ID allocation.
> 
>> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
>> index 9e8de4323d285..8237467faba72 100644
>> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
>> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> [ ... ]
>> @@ -295,7 +295,7 @@ static int itnoc_probe(struct platform_device *pdev)
>>   	return ret;
>>   }
>>   
>> -static void itnoc_remove(struct platform_device *pdev)
>> +static void tnoc_platform_remove(struct platform_device *pdev)
>>   {
>>   	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
>>   
>>   	coresight_unregister(drvdata->csdev);
>>   	pm_runtime_disable(&pdev->dev);
>>   }
> 
> [Severity: High]
> Does this code leak the allocated system trace ID on device removal?
> 

Thanks for reporting. We need free the trace ID in remove path.

Thanks,
Jie

> Because trace_noc_init_default_data() now allocates a system trace ID via
> coresight_trace_id_get_system_id() for the new "qcom,coresight-agtnoc"
> devices, it appears tnoc_platform_remove() needs a corresponding call to
> coresight_trace_id_put_system_id(drvdata->atid) when the driver is unbound.
> 
> Without this cleanup, repeated unbind and bind cycles could permanently
> exhaust the finite system trace ID pool.
> 


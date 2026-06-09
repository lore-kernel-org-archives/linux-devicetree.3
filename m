Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675933BF666
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 05:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780982731; cv=none; b=FwvRXCKiRKMNJ5xhi1yZGsPEuRSW8ZPiA3LcTaRy0AZMhhugNCE4g2Cf3eMY2plLAwhU1IM++9+g6+wrBTgGj7EOg6GCvaHFRxnU3YZRkGafkJbbzTrHsDGEjaKU1zr5Zu8HAxPZb9WqiD/SnDx1e8/0nF/Fv21fwAchhtN3wYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780982731; c=relaxed/simple;
	bh=yiN7XWnx0Z2qPQ8zgQNCDMbQgdUAfnp+4+ETkmNbtX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ctcTqNIp4R7GM2j3KrrKBEMJt+pm6WvV3tIu7Zc8xK2V9aGjVjOBF45Mn8t+F+bqBkzTPn17sz6rmqvw1iDgQi+kVcpfpyIfH10G46wbm5XQfwD+rIMYFl74Lqe9twoEcSgzgSEoNMPYeq8ZW543iWoiAzZ4InM5cULr/RsT1r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnK2zGrO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NV7SPSmn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnK2zGrO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NV7SPSmn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wlHI994385
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 05:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AMw4qOFoLAlY1h4kX7c61gcRF9/WXhnsAgkdv1IGCnQ=; b=FnK2zGrO8d0CSVTd
	MQTU9WHATx9TR1vmvQ9erw8THoAuuzwgeerd3hFHph9qz8j5v+QdvG8+LNElYqlV
	nonsJ0V/XyXxHOsphRMYj21YjNo0LbuLDYSP+E7huo5DXU7a4NbkRU+mw5UZToWS
	bgqgVKznDGp3W36L/JWj8F/I2CIlJh0d6fIoSXx5jE3IHCpzzsa/mybjsOWkTK8w
	UKnNybOK7sg90nHtD5MPDqR1utJClzcfmq8OHpLmu0P/SxCVrqB2bLQ5UIZp0BF9
	uiVny1nKZbTsB+esX4mvrqDH9SicP1lLUmJudzvthpBFQ1TnVP2LrYGhhUYUv2Op
	hGA8pQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkvt8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 05:25:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c36f4b76so55618175ad.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 22:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780982729; x=1781587529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AMw4qOFoLAlY1h4kX7c61gcRF9/WXhnsAgkdv1IGCnQ=;
        b=NV7SPSmnXWJdW2v8bFmYdUuccGiNknuQA9YvOFT4rHNqlStqCkyfqb1XDMCRrdz8C0
         4GjmRWBjOPDtCsBaJOUGzaz0yWFMllo1G26GWYDffXtixjh40tir0D0AcD9Nv9bgIwCq
         uWXJNzPEHTLlXPIfizx0k7FtuxFQ8B2J8k5nBYczIO/1qim6jkIUWhEEbGE0vyZg+rTr
         YvjGZl2wdHvN0Qu2pAcYDN+Gaw9rxXRI4MHNqvl1Bw4T3KsLHC248CykJ/x3YXlPQhiX
         5OCrplCz0hVzms5rNReYBmbt/WW8o8C6pWxHPGrFE8ySoasRtWD91KR04OjbNzzpsDyD
         zCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780982729; x=1781587529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AMw4qOFoLAlY1h4kX7c61gcRF9/WXhnsAgkdv1IGCnQ=;
        b=JNJ6QAcuhS/AGhiBN20D30siyNk8d1JwLWFp4JeHr6CGH8qeZhfPfdZv5Fw5qAa4xy
         hao3yHTvcVohX5dSe+Y0gA5QCiUYQbS9n9rnKngJKiYzoG+QE0/MkOkzo+Lu4Ggfy3lN
         614eNBo0MeTPl1mwTbmAERDwoiQlOKZcMOPcFmfo1WYbf/RHs6koLRl7QJhXwt1K+OVa
         F2cccDoaDHbl12oJ/3Gw+XgI3/N/xt77DHknH8qw2AQFUlot6Xh4AQmzPQJCRAb/csCN
         NPe9oCyt6xAzt9jxORWOZbuaL3FBC+0K6pdM7vMjEu2U/JLRjTsdGI/qpcKTT+zr8xzK
         GVvA==
X-Forwarded-Encrypted: i=1; AFNElJ+TljSfLmsTm8BvEnvM09dPxBWl1Qi6RoC+h6GjyLT5X56H872vOeCiKjP5D47ViQ09URbvIRlmb5up@vger.kernel.org
X-Gm-Message-State: AOJu0YwjdJSWDfA1QBqKqM+VYiB38gPyQYEQ908gSAWSKp8F4FGbs8fO
	J+igUNQNbi+RmDSLg/UcUHVGpLaoPcUrWYmQVn0hM7fhbFIsEY+R64Io+ITz/1DtngXOczwKb/A
	TwGgSQ0dmW6+ZUu/1bV3WDShGkJ39FpSbIjvCs9VuyWR9XXk3CnPPZS6HMvyFbAZ2iHgF6+ME
X-Gm-Gg: Acq92OHww/hAlDUSp5bPnVhmeUk/4y79vQp4JRXf0vi53yuKXvqx+StO/g/yBrVFYwl
	SyUf3ijgLLOUV15KgxxivtFFUwMtGcrVEoe/it0OPj1SZPK0zsw1RLE4PWUomqbqRfnHbvbq8Hz
	HnhZhfQw8fq7iKd/1YnNHi4g1S/sbiT+V5BL22vIDuBMjrtV2bkpxl8FA85ZFGfTCR4cxu+Yo4h
	rugJmrl62RsUhkrbM9wLxrZKeF+ggz5aOz0mXN9EaxOc7Cdm6kQ4Wk0nxHjQaiKcrmxQdE0GP1j
	UG7kHz52rji0Rwizt8WE+73VUl2a/rnGn0pv8K3Bq7/JwV8hzWMzugGd82AT85Y+FF5jcjXMa3R
	VOYUGPrbMavBQFlcNwwBNXTu8mLsVN2AHiV4jvQJBCCazD3AIscC0rdA2nKtxmP26+uz3VbCq3n
	Ug
X-Received: by 2002:a17:903:1246:b0:2c0:ccdb:e023 with SMTP id d9443c01a7336-2c1e83451a5mr212713095ad.17.1780982728998;
        Mon, 08 Jun 2026 22:25:28 -0700 (PDT)
X-Received: by 2002:a17:903:1246:b0:2c0:ccdb:e023 with SMTP id d9443c01a7336-2c1e83451a5mr212712845ad.17.1780982728546;
        Mon, 08 Jun 2026 22:25:28 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c250b466d3sm66516115ad.62.2026.06.08.22.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 22:25:28 -0700 (PDT)
Message-ID: <26374aa0-1db0-4d90-9cec-b546df598155@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 10:55:23 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: ipq5332: Move PHYs and PERST# to
 Root Port node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602-move_perst_to_rp-v1-0-8ee5b80316da@oss.qualcomm.com>
 <20260602-move_perst_to_rp-v1-1-8ee5b80316da@oss.qualcomm.com>
 <c59579b0-8c88-444d-947b-615a623f42ce@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <c59579b0-8c88-444d-947b-615a623f42ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: M5BwyVSe2hfJahwvzfzmwrwuosEe1vJu
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a27a3c9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Pny210M0Jru_JXUMdrkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: M5BwyVSe2hfJahwvzfzmwrwuosEe1vJu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA0NyBTYWx0ZWRfX6CR/T/7FYkjP
 v8T9G2dZhs0LciIHw15pzqb12HM93lKPsy3swsxfqUnlzJJnDp0ATN3aA77Of/KYPr8BZbJ7szc
 OWqHlu8zv5V++3vNhQrKuMX69xHQ8fh1sZhpRxMBekJ7FD4i6Nn20faK5eGAIYxIA1rnV9QlZiw
 Zqox47n+2empJQn1bIZydZPf9iypG+BC4/UeqTjEG/k9i/Yt0GQU5bV4KAniu4cx5qv7mFvvMjW
 BrBdg4cIuspdnW8Bud0ZLMUUwcsIoI4Hatc4G2iOzSFdTas3lq2ncpuSDvIWqD941dHCZ1t+kSd
 XKVD+Lw0RhT4ARSXYsxYRjx67cyQ3xTkOVCXmrR/M/3txzEIOUKpwfq4R6X4ynrRj/oipJdbHHU
 twtv2gAzzGB9wko5EwWBR51l/L6HbNgokP2gtwVJK/62U9VRqXlCemChRa6TmJ8SLvXidOMIsEr
 PDpNv9IJgxIHjGQrznA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090047


On 6/8/2026 3:52 PM, Konrad Dybcio wrote:
> On 6/2/26 6:34 PM, Kathiravan Thirumoorthy wrote:
>> Follow the new binding style by defining PHYs and PERST# (now RESET#)
>> under the Root Port node. Avoid mixing styles and move these properties
>> to the RP node.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
> [...]
>
>>   
>> -			pcie@0 {
>> +			pcie1_port0: pcie@0 {
>>   				device_type = "pci";
>>   				reg = <0x0 0x0 0x0 0x0 0x0>;
>>   
>>   				#address-cells = <3>;
>>   				#size-cells = <2>;
>>   				ranges;
>> +				phys = <&pcie1_phy>;
> nit: other socs (like hamoa) do it like this:
>
> pcie3_port0: pcie@0 {
> 	device_type = "pci";
> 	compatible = "pciclass,0604";
> 	reg = <0x0 0x0 0x0 0x0 0x0>;
> 	bus-range = <0x01 0xff>;
>
> 	phys = <&pcie3_phy>;
>
> 	#address-cells = <3>;
> 	#size-cells = <2>;
> 	ranges;
> };

Ack. Let me add the 'bus-range' property and move the 'phys' next to it.

> Konrad

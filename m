Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DE629DB86
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 13:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011502; cv=none; b=KEHE3wPLaOSTQaCvLjcGjHc0h5bH2Pn2lL1KGqRWCh2VbbHyoUFykdKBIJ844PzOBI8OkjXAtm7bL7PZSzbwaE1IIAY0CLlIKsbx4CTHXaPVSbyPDm+2Fe0PeJXCWjA45oiBI5hQ+1D1hWAfMZOVuClf+RVyMHqpAgflVamaJO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011502; c=relaxed/simple;
	bh=TGP3thYwS5cQEvKp3bq6AQJmDxlBqvBlj4kGcWvPqvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qq+TJC9iXVL+1s33324gYd1zkch90wPbSHDdiMmkkZSXQYzy//TZxYybLNa3ow5VmY/CbC3Tci87ebiD9hJ/yvwZhKs/y+ftdIL/OYsaeLAzyAA8YH2n4SHgpKYySoEjW1ZolsWRh90PduZh5SG3+jA7KAQYUcnng72OAQSTRXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z69CVyS/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NICOCO43; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z69CVyS/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NICOCO43"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CnIg52668352
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 13:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0GSvQb4RyHDcKwjA04narD1yN7pysrwi3CeTU0bbhZE=; b=Z69CVyS/18J9r58K
	qULq/j/zWPbC3t5keUjm+Z+ATHHfCJ6YtmcZP8DEB8+t10j5DGIJk7t/uWQUggqj
	+r8WtH5cMOs3kyw58aEzDh22qBUSK9qzZzjfmDaWln+oYKwflwfRN/1dEShTo20D
	c4AhMURJladJhfo8oWohK5thhRHYjSc+fhAs3SKF/vOTh9EtmY3WHpIzGQ/149K6
	xdfKbiuNZXntU41dBKprZ55v/490uB77CWuIvrEJ0uPrYmJXrzYwrDceOnLcpuTu
	m0XksTQAJvY7js9cUjBnp2CpoJnxyKW96PxbOybzDgpLBy7mpXX+K94FRr2pL9Ro
	reIDQg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25sm7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 13:24:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bcfce8a33so5027917a91.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 06:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781011499; x=1781616299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0GSvQb4RyHDcKwjA04narD1yN7pysrwi3CeTU0bbhZE=;
        b=NICOCO43Di7sYRKHfbUg2tz3/RHDKcZ24DQgZrYfVCwklVXw7d8z8TEhB437V9y6CK
         2ZnF7IgkOzHBYnmwmAZ8RXZArG2XAd3dOAWsO2BceWx2Bhbh3qBu44kEOJDvqAVhQKD1
         9JoSLSp/pbLhMGeYNmoolQIFtWPVVzR0z4ccc3jenDywImuSPdZGWJml8n57WKHLEQSd
         1Lh+sakCCspgY0k2HZ7DNGvn/vg2cCEZvOR6iQ5OY38cv31BuvyEGZ1CsE04v/0LPkK2
         WrmtJmG5R9vwVLo3izLIPywyJntyEeYWoGhAXl2ijTXiTuyYmrfwSNuEQ//l3zsICuUY
         /WRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011499; x=1781616299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0GSvQb4RyHDcKwjA04narD1yN7pysrwi3CeTU0bbhZE=;
        b=WPwqxFQsOUcWL9cmWMPh521zjsN7CXNhuZGLjZimoD5z9kFExFCnJniZtUE5nhJoOK
         qZYUn2fv92W6FQmP7fpCn5xfi1k93stXwJRFaXWFnUiKVwfbq8gLSNa4Wa3ZbSH9UWTq
         XFjFKv2wQYaP16uNZ4TyVxRidYX6A+HKDWqLIEh67Cwtv6NWC3e2pMbyDklXbKrtwRJw
         x+WpSv181yL3bwzq7iCnqRcXU6eQvvPDdj9p/aawSZ8zqLKNBQ4kotbWi+Hbct2thgeg
         L5SNzIveVKiX30iWByIrDEuc6XTgXN6OAzW3TYzxA48oaU7aOG8hFEwB27IlT6etLWlQ
         Cc0g==
X-Forwarded-Encrypted: i=1; AFNElJ/5A5WKqqPi4xvU5PTXrNQyRC39ks8iKwKXOAGc7j1hQv5APaV3mBjzmlgGZjUCEtJDrwW94RU08LTb@vger.kernel.org
X-Gm-Message-State: AOJu0YxzPtcI3jkMP+kgxcU/MZQig7FWcnbeR7+5WtdoiuV6VyCi4NqL
	I5zaOMkuQK+Q3qUTrqZkDT39zFbglnvqbXU2E12N8CZRiLJ9Nm6ASE23QQT4PaVnV/01i9sdVgZ
	YMHX2ErE0zLReyNLXFpw0vRxJQLXnJ38UZT8qU7TrtUzLuA0NZ/nGY4QJZZaKzw/m
X-Gm-Gg: Acq92OGc7opY6/WmVN01IG8dd8Jljrt4/DSypoisAP4gB9DqOQW4Q0GPx7ddHrNT9tO
	NFxJW7qLJn0QIi4GKd2TKRPiYP8YhP5G3fCgiwul/s8Sx6SrMN3Q9psJ8vM4sVLy4hpgHmHRekp
	4Ahyu15re9IH63lGIchA86leIU9jWJI2XE0nrYPbDwjObsUvNzYdLyBwM3AjO1hzUn9qavlEZo8
	8qQJjhIRGoqcDiUwx49HNgqjlsz6lFnTKAbTedyOCAebjf63zgpnu3fa5VOKQky3TJ+G1nUHPtl
	y+4y64k6/up3cOka6cgCPfsGvzQptlLEnP+9NhiOaP/YdejxuiSAeGbjNzAQYMdcf8soxwMcW9A
	x89z0+CGbyvMl5HYaH/e/SsDbuPGuJYqpH3E8q+fVeuuVQZ7hJx0qCrfzNblCl9M+8RE=
X-Received: by 2002:a17:902:cf07:b0:2b9:cabe:ce37 with SMTP id d9443c01a7336-2c1ec3f5cb8mr168553105ad.1.1781011498615;
        Tue, 09 Jun 2026 06:24:58 -0700 (PDT)
X-Received: by 2002:a17:902:cf07:b0:2b9:cabe:ce37 with SMTP id d9443c01a7336-2c1ec3f5cb8mr168552765ad.1.1781011498094;
        Tue, 09 Jun 2026 06:24:58 -0700 (PDT)
Received: from [10.92.193.107] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa072asm212244575ad.34.2026.06.09.06.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:24:57 -0700 (PDT)
Message-ID: <db1c1ec6-56ec-4fa8-8620-b8db4e95015e@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 18:54:52 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powercap: qcom: Add SPEL powercap driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <e3b15b7e-ba09-43ca-9e6e-b778393d6acf@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <e3b15b7e-ba09-43ca-9e6e-b778393d6acf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DT-BfAP32o2Audsg9UupHSYpQX3cR2oB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyNyBTYWx0ZWRfX62lsSMxSCs/R
 p0DbVEmabFKlkXRC63xpft8I22Tw01lxusYbOLsgXWL9d7CzdqL/L8fw/PfbAHmIA2VyQYJT5Yb
 TJg7sVbV+z95dbKueU/99y/NSWbpU5veNFKjgUqN6RGPSP2Wf2KSzcBDl6At4p2W7FMv5cbli1a
 bCg979+FPGeJJluEmcg6RE6+DQG95W1IdkFScYpZe2L2YsOCEb7pZ3rRUTdbyHBK6HjdV2Lx6f8
 NDuZZX8qhOBjA2aCQuoXjQzeTlhzJdBujUGn6gNSVaMYc0mO+KoUdzTHyWlxN2p71JarTt9pcp0
 QR+PoS6evi1UImqYhGk7IJmDVjwM9BhmfLczGjLVPXm15ODhoahsk/zgAVsnVl3FQO0JinClq2g
 jdy59OAtug8LfO88IbLvFD29pSuqT8pcwL8D0v5De6YlIquWsUFBTpuQNuys8QmDZFE+8wTcc3T
 vQY6PvYgsGhFMgNTyBg==
X-Proofpoint-GUID: DT-BfAP32o2Audsg9UupHSYpQX3cR2oB
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a28142b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fz3elM8aSJ4FunxCNjAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090127

Hi Konrad,


On 5/21/2026 4:47 PM, Konrad Dybcio wrote:
> On 5/19/26 12:49 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
>> based power monitoring and limiting capabilities for various power
>> domains including System, SoC, CPU clusters, GPU, and various other
>> subsystems.
>>
>> The driver integrates with the Linux powercap framework, exposing SPEL
>> capabilities through powercap sysfs interfaces.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +/* Constraint configuration */
>> +static struct spel_constraint_info constraints[] = {
>> +	/* SYS domain constraints */
>> +	{ 0x10, 0x70, BIT(0), SPEL_DOMAIN_SYS, POWER_LIMIT1 },
>> +	{ 0x14, 0x74, BIT(1), SPEL_DOMAIN_SYS, POWER_LIMIT2 },
>> +	{ 0x18, 0x78, BIT(2), SPEL_DOMAIN_SYS, POWER_LIMIT3 },
>> +	{ 0x1C, 0x7C, BIT(3), SPEL_DOMAIN_SYS, POWER_LIMIT4 },
>> +	/* SOC domain constraints */
>> +	{ 0x00, 0x60, BIT(4), SPEL_DOMAIN_SOC, POWER_LIMIT1 },
>> +	{ 0x04, 0x64, BIT(5), SPEL_DOMAIN_SOC, POWER_LIMIT2 },
>> +	{ 0x08, 0x68, BIT(6), SPEL_DOMAIN_SOC, POWER_LIMIT3 },
>> +	{ 0x0C, 0x6C, BIT(7), SPEL_DOMAIN_SOC, POWER_LIMIT4 },
> 
> Lowercase hex, please
> 
> Can this data be const?

ACK

Thanks,
Manaf

> 
> Konrad


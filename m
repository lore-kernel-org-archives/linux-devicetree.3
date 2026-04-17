Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6019032720C
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776439733; cv=none; b=iuOyvCdwBS85xX057evLFg8/o6M0E9LkB7GdjOu4IEdRHgSIw/LMN9S75F1iRLxfax6RsQpqvDaB15oO+h6k8HVdb9Cps1EJ9n2eQ+QxoDeH/oKW+UpRF+dd9+b62ZWgMYe58PMz/GedAWWNS+gpF/umJ2fMQDSFMA/zMNydgfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776439733; c=relaxed/simple;
	bh=i77yRE8WUhFEs7+CBpzlx+r5MC6ikp723zTT7FvNvsY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=k9R/dt0ie4xXr//C48dax7RI3TNVooUQESQD0V3L5tP4QPo5lYbdDr90wbqv2fJY1SLh/4sd7kiuNtx9Hi9R5EwpgLI2/rn4+hQIMhHs7XwEmA+hQtuWUb2KmV3B3GzNOhgphVm3Eu+xhQlITTNmOs7Dv/3E55nXtKZHN5jCFSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oi6Te+Y4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HydNxlpw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oi6Te+Y4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HydNxlpw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HEWd5V065680
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YaQtfdZufww/K73QQEA/A0d3XIh2ynwFA8tiiBqAF4Y=; b=Oi6Te+Y4gE+h0ub7
	y6aiT0wkH1YE3pSd7X7Ii27zAY28xopCKQ2iKgZRr2E6SRo8QkUVJ/+Ni5SRfIDX
	yU031UGE+uu+vU0DOnu/Q/N19ULH3dh7Opl0eGDK3cPr5Sn3vIIF8mla8L/BXsw/
	CPfJScm8mdfCWW4woWqKudKGRSeH66BjgSb2hEtGZvcEtMECVaTATqhnKtEgP1U9
	Qk/SjyAFQKKRNoXCb7zvwC8cT+aaQOV6Ly4SbRFObHEhfjIrw57aR+zqaF90BkAH
	AGqwmKriE3TxwqSy1Dh07XRxg1br9hsrYGqP0MTssygjLus7onGHP5mjHSOxPhxX
	0AEFaA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk3af4aum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:28:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so1036531a91.0
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 08:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776439731; x=1777044531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YaQtfdZufww/K73QQEA/A0d3XIh2ynwFA8tiiBqAF4Y=;
        b=HydNxlpwja+/pvZkZEbdMf/EwdroItGwZocSFOT74slwHFAznCuDZkwUUTFz2xvLii
         M4+3wLeTQ+yjPZZbP4/gba6wAsg1B2uGVC169a42TaRWAmJxt0ZPjPMMO13efbkSE6Mr
         Nq1UrCh1jSUEzmNTeNXaMd6gDOu2BqVmiBmlSmFFponlssszsNIez0fxAsmiq3wNU98M
         AJxPsyvElSQJ4p0Iouaf1scNMt1GjCY0FHl7SO2yGbzraeERBY/3q22AW9NPdt2FWGbf
         2kO+9WonmdkNlHVks+u6roGOvKAiv65kbyo8r3Z/NHL68cMoLXZox0fYX/H6kSyfeLav
         3jPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776439731; x=1777044531;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YaQtfdZufww/K73QQEA/A0d3XIh2ynwFA8tiiBqAF4Y=;
        b=OR9ZC4cN4OqNhDRCV2YIzaUtl4G+A6WRWPLip4bDMk3Pi4kZOlmzUzYG7xmr/SyF/g
         f6SGty1ZP9/QUFZIcQbMbZn/xsxx0Z2NW3Z5XN5OrTBmf1oqqPSasqyVyxZbEeoseq/i
         ckMoy3z3TzVywkapz/o1haiIdY94Pahetv1bEZzWbrQdD4c/gayNUbY9StkQN+sj+lnd
         xHl6aoACelRotHrmjQoy9aSmH21xmy5u3Cb4P/WnjkIaf/IHrHtlxd5ZqbhZ/z3i9I1y
         S4oyHRT/GzNYUCjp0QshBXZQbKMXnhUVKfSwN4ctK3WpJEyPqPQrg1u1h2A1iNhajSq1
         MN3w==
X-Forwarded-Encrypted: i=1; AFNElJ93+67uQ0Y8ACh86PRNQqD9bLnxHDuC1ZfEr2VEYyKTxtAvjjBl60t6GZXu1skKDtkha5XWPN2kXEtl@vger.kernel.org
X-Gm-Message-State: AOJu0YzdRYjHmOaRLhYiPSwxSzY6GgtR3M2RVu5DdcSaxC8nWplXn4uA
	DXzV9IwSBWIAfP3Bje9JpA1/QY/Tw1MvzstTK3ATagx47xSiEZ9j98GRo3TXrF9VK7sFFbprjDP
	U58N6DRcbidMvZ7o5h6LnzDW9P8TpcQz11PavtCJUzwRGPjgl/YupDb2tsJVtURp9
X-Gm-Gg: AeBDieuYqmZcORBDhTCXZh9Z0y5ConOicXXhiGybsJsy5K/wFyOxaJSBkjz/OqZ2tVn
	jwaW2zZKmTfCtIVhHNGuIxdjzUMip1RJ1Wad40llPjCxHlhDNeUGi31ftoAwN+y68c58ASf6GKX
	3nkK9UVgLmF9nDiClJDGgzyXZDhf1pCv/D+9QpmRwsxaHKjOHgYzafMCbTCLaUNSCVVwNHH5Scj
	RKcxKUyEwPcdvndh40GNI5A16lOeihYqOHPabx9xgciON7rZlIZY7f2Srt+p/PsuZbSES0ixKC0
	DyDivp9d2MIB9ADLEtTJUFS4TIvWKxcesqbAQEuKNWuXX5U4kL/CZV3MkHiy9YuuKS/yeNvsAou
	O3JB9LbdZBnukjKAB5jh9PjGegULIEw8Gcchq4A4vIavmAHV2fQrTA4nqQfZyPhxG
X-Received: by 2002:a17:90b:3d02:b0:35b:d795:cf5d with SMTP id 98e67ed59e1d1-361401ec4b4mr2683467a91.5.1776439730736;
        Fri, 17 Apr 2026 08:28:50 -0700 (PDT)
X-Received: by 2002:a17:90b:3d02:b0:35b:d795:cf5d with SMTP id 98e67ed59e1d1-361401ec4b4mr2683418a91.5.1776439730131;
        Fri, 17 Apr 2026 08:28:50 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a9fbsm3284378a91.11.2026.04.17.08.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 08:28:49 -0700 (PDT)
Message-ID: <7cd1a0ff-53be-7eb7-7de7-420dd1ae7cf4@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 20:58:40 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH 06/11] media: iris: Fix VM count passed to firmware
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        stable@vger.kernel.org
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-6-7d3d1cf57b16@oss.qualcomm.com>
 <20260414063325.f3yag6gnmaysddkp@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260414063325.f3yag6gnmaysddkp@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE1NSBTYWx0ZWRfXyTbGzRzmOAyJ
 /qH3PnpfaafcUfv2EXHzr9IOme1G/5yiNwjgzz88PUfVpXwXXLJIzse/MAvwXWfj3lqAlX00fOj
 fxnj/WIVL5MLte/sH4chsUsv5obrCkb/Wvb3f8WJIXWT0FneJEF1sCDuozYJZGLCfaEx+KoQmDc
 9vhmnTqnt2sOOSCQUWdJFlQJSS3Q9dRak48yFgJzyY0IeVwKl5snRIQsWdxZ7v6gBEApoAlGm+H
 T/yYrCBF0BTJvfXrrJ3Kvfx9iaScoADE/u12GVbu4zrX4oI5Qw4QnZf8HIjENjLk4ZkoMkfig+J
 PqHKMvoqCl2daar8tXUOcM7+i9IbuejkwbuNd7zgfknk6IxauFkhGKYDGOWtnBzZ9lhHO07PzlL
 oevvclem+J0oPDa8QInZHfzxoo/PVrYmVcp6VJ+Z7TfbMzYqpCyu0q3lChnOgzUi/ZJHjtU8Z/N
 JFbGInCmPY7o7qfupBg==
X-Proofpoint-ORIG-GUID: bKxw7a2-UU1L1GnZhlumSl36iUt1ZxgP
X-Proofpoint-GUID: bKxw7a2-UU1L1GnZhlumSl36iUt1ZxgP
X-Authority-Analysis: v=2.4 cv=DfInbPtW c=1 sm=1 tr=0 ts=69e251b3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5Xy_6AgtP5T3jK3p2aAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170155


On 4/14/2026 12:03 PM, Mukesh Ojha wrote:
> On Tue, Apr 14, 2026 at 10:30:02AM +0530, Vishnu Reddy wrote:
>> On Glymur, firmware interprets the value written to CPU_CS_SCIACMDARG3 as
>> the number of virtual machines (VMs) and internally adds 1 to it. Writing
>> 1 causes firmware to treat it as 2 VMs. Since only one VM is required,
>> remove this write to leave the register at its reset value of 0. This does
>> not affect other platforms as only Glymur firmware uses this register,
>> earlier platform firmwares ignore it.
>>
>> Fixes: abf5bac63f68a ("media: iris: implement the boot sequence of the firmware")
>> Cc:stable@vger.kernel.org
>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> If this is a fix, should be the first patch in the series., so that it
> can be applied independently.

Ack, I'll move it accordingly.

>> ---
>>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> index 548e5f1727fd..bfd1e762c38e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> @@ -78,7 +78,6 @@ int iris_vpu_boot_firmware(struct iris_core *core)
>>   	iris_vpu_setup_ucregion_memory_map(core);
>>   
>>   	writel(ctrl_init, core->reg_base + CTRL_INIT);
>> -	writel(0x1, core->reg_base + CPU_CS_SCIACMDARG3);
>>   
>>   	while (!ctrl_status && count < max_tries) {
>>   		ctrl_status = readl(core->reg_base + CTRL_STATUS);
>>
>> -- 
>> 2.34.1
>>

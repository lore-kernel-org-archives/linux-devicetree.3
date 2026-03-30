Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D377333CE92
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774845436; cv=none; b=mxIykOUP8gVNygFm0RGdtw+BtbDRFM1667O7ERn5k2RKcu8n0wOGBkDnpEjPaVgplCCsZICkD4zmlGWzZNIM7yThwoldyLUkUwl970Zq/ooB/JCfpm6Ub+umNmofgGNxG/TdDf6VsLLYj/Fo64W6ZS6CLiftdXo8ugnoHdDh6bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774845436; c=relaxed/simple;
	bh=90yErfVO6uSG78hgvOjh/eyWULbsrl9lJHh5q629Vkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZpG/P7h3C82oQ2p0Y5X5Sc5kkpc/lUy0kWQRP00CVNI2CGVw0VXmD8ZFP0IW31lCghEXOr4XHOjrGsW3+98ierNGkLjlGizt2bVL0ep7ttyb7zrF6TxLSY1b4zlFRaYpbt4LPqQjtaRm9CK2z7q1OFdpJorZ8sXgIz2t3XLEQq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3AIVOda; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XRbc0f1g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3AIVOda";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XRbc0f1g"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TNdZpt332215
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LZtlH7AW5Y8jZDQIgEtVOjVzWfIrAL7bS5xpfRJvlS8=; b=l3AIVOdaeuqvAbrn
	jmOETSQtw3pc7zEzrUjosRdYNE54eGeczZ/dLO48795/ALofesO/z2bIdBQ3Inio
	FVJ/CYnmrqaH25gIOo4n+KoT3jAYFMeTWhUvstHJDi7O/nH6myjN0faCfGfBebvP
	aEjODpG1eWOIwok/s/YmH/Ve3HNM9HoloEtxxyC+2feikcxjG3xBbUWWZOko/a+X
	PTRiQyLlzIyIh9FDYFZ9gUAxM/cpjTA2kBizrvPuiuODBQ9V9lQG85onPjUcAZyF
	kjGf2Q4UpWXBKvlL1qFNZI17I5Qoy8424cS5c+fbXWgPO+XIYZwX5WfJdFO+TpjB
	viei0g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqej9mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:37:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b24af7ca99so15207735ad.1
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 21:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774845433; x=1775450233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZtlH7AW5Y8jZDQIgEtVOjVzWfIrAL7bS5xpfRJvlS8=;
        b=XRbc0f1gm56r9x6JGOIn7ICXIvoAd33IJpzC0+BaZB+2dsrhARiZANOWFI6KRwAu7K
         Nw9UhUxO+OPVVbA/8Ptik0rFHdP3J69X2LLc7gDUOAMw+agLAzfQzJ4ic3epNSf0UG4g
         wtPwokarc6zHKdmBEY/NhE/U8x58Bd++IvprPFWy0jRBFrcdB81+r8UZENPCBawBMp5r
         ZyloxNySq+iTQgfg58ghIBxW/U6t96B0I24WNioHAYiybFhU8sT38FmUBwTV6lMgjMNN
         kLDTjZq6JeeKN8Oa2IRAxgtLZzgMQu6rkMJE+kWHx87T2c5+QvkBLY371lkD94Em9Qn6
         1MeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774845433; x=1775450233;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LZtlH7AW5Y8jZDQIgEtVOjVzWfIrAL7bS5xpfRJvlS8=;
        b=i/f6q17VeFWKNXAiLcLKWFv/IxP+JzwS3t8rlkOnCfDsyeDhbhoueDX8fAJFQlRvVm
         ZzlCR8gBlpxmV7XwBJtXTJiC+7B6tg4IxmUiGlJd16ehC7J4HBwtAnCrkQYhnEotteWG
         UGPnNj1F0vq0JCkHIQCqQa2IV5HTScqboHu+YfpYY7AiaLic/XP6SKMsu7OffFsWCx5S
         XeeXunAze08CBW2sg5qMqQEAIHaWIsqlipN0HlmHh8r827AXTEqpgpBqsLIl0g+PpF6b
         SnFOfruSfeH849RDnXwBSOBbru6q9QQBpRfDgWPoYqhn4OS7QNatH/WW9hMK9rgV2Jgv
         CGqg==
X-Forwarded-Encrypted: i=1; AJvYcCVdHk5E4b62K0eOUpJC+/R3JfE3nKH6cxSU2ukVR06I3ufdLMHBjiPxcu2xDHPIfZZtNiBzOSZr+3BV@vger.kernel.org
X-Gm-Message-State: AOJu0YwORvX7a+/5bhmtQ5yj5FXabZ0wpPuE+WHis+TbE9mW4lhPc+Zt
	GNXh7EamqLcXdw3UWsnTFnvTcqNIUF+sY5Ylc4kXuqtDmG460LA5ZnO6roEhXjmJGbusjn0w+pJ
	BmwkiTm6P2C6Bvq0ufURmWnlneobqc0LMIL7o5bShhEu7ITZ6qSeE4vGm/3cP/cMS
X-Gm-Gg: ATEYQzy2dt/5zkEcuw9Bz3dcoLIPpkXeYMNL8EyM4XYmcE2CFD7/2y3JZBnPffelKus
	jmRQM2ROEYAGfcmQLRDMFSPZFy87RSrk8tbAFWHQKhbheur+JswjjAmOe6JFhRd/8id9kHG4FJq
	dsCBaYfJV5ro0jq5mVLSCs/ERm6LO0kogV8P/gM10EUt98+w7cGRlnqxvDZ8NpQjChjm3DhLcUA
	wRIMdOw4uzAi04q4lvSY/b8Et38vDbJId5iNn3QzOj1W9pLLz6MNz8zrFfjBUun3SzLJFQX3stQ
	dYFyhVmjGiaslO3lK3chkoZQv7xCrSPTCdWdjfd1l/2da350vnClLl3ox3guzevMCSYa6Mz42BV
	zgwkZ2aXZBnr3B1MQtZ5XRcLvQcZ1IkIZ0EqonDiKgyOBhoc=
X-Received: by 2002:a17:903:22d2:b0:2ae:fc60:2650 with SMTP id d9443c01a7336-2b0cdcef360mr115992505ad.39.1774845433479;
        Sun, 29 Mar 2026 21:37:13 -0700 (PDT)
X-Received: by 2002:a17:903:22d2:b0:2ae:fc60:2650 with SMTP id d9443c01a7336-2b0cdcef360mr115992265ad.39.1774845433016;
        Sun, 29 Mar 2026 21:37:13 -0700 (PDT)
Received: from [10.64.23.4] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24265aafbsm78132115ad.19.2026.03.29.21.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 21:37:12 -0700 (PDT)
Message-ID: <ad81de07-c65f-4571-a309-a58e8ca57acb@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 12:36:45 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: enable UART6 for robot
 expansion board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
 <20260327083101.1343613-3-canfeng.zhuang@oss.qualcomm.com>
 <smbe2ltwykqvlzhryclcm5p7wdhjb72tzuqoramjynrsz35tmb@q6l2osdzflvn>
From: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
In-Reply-To: <smbe2ltwykqvlzhryclcm5p7wdhjb72tzuqoramjynrsz35tmb@q6l2osdzflvn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69c9fdfa cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lJRIEu0nk555g-v5qOYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: kvRpxmVA5n6fa_Mz0SVXR8bwbWneUz5q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzMyBTYWx0ZWRfX0Ugn2U7WWxKM
 8BL7qsXTacrz2qziHgpNj1sUnsvj4Xr4gAFmwiRvt3eymVnueWZTxN4lRHyJFR0Ox3yZ3GUGbme
 gyyFfJzn+YE5owNjTsoKB0g7C192GAJ1pHPdvw+u6UJdVYksC568LMYUsqGVI8e/DDG0ui0OC/n
 MDyXlHj03vcY253PckvonqnF4H5n7vpqih3v0/DGNsU38PN07h2k+Eb5rUfuGjdnRr+O384RjDN
 BcPyxh2WzrIQnZ7r40GIoBFw/5wXLUSTCX8wms9l1OlfXdSAooqXi/mgNXY3/pKO4sKmEowWfuH
 IdrlY2UGcn4b8vQRaweMsAq0mDGy9b/MVWUfSo23zj7b7AchAfOztV7HUeO7Ghi1uSDZK1ScqMi
 UZ0E0TAofH9x/YyuJq6u/8KFPnzbemkpht6ldNtXgc8zn4XfWws9U3zlWsqNGh30n7ueKG3x3ad
 +DKPubcqDbYTM0a/k2w==
X-Proofpoint-ORIG-GUID: kvRpxmVA5n6fa_Mz0SVXR8bwbWneUz5q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300033


在 2026/3/29 19:08, Dmitry Baryshkov 写道:
> On Fri, Mar 27, 2026 at 04:31:01PM +0800, Canfeng Zhuang wrote:
>> The monaco-evk mezzanine connector supports a robot expansion board that
>> requires UART6, which is currently disabled. This prevents the expansion
>> board from exchanging data and control commands.
>>
>> Enable UART6 and assign the serial2 alias to provide stable device
>> enumeration for the expansion board.
>>
>> Signed-off-by: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
>> index 565418b86b2a..0b26861eac02 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
>> @@ -21,6 +21,7 @@ aliases {
>>  		ethernet0 = &ethernet0;
>>  		i2c1 = &i2c1;
>>  		serial0 = &uart7;
>> +		serial2 = &uart6;
> 
> What happened to serial1?
> 
>>  	};
>>  
>>  	chosen {
> 

serial1 is used for Bluetooth.

Bluetooth support has not been merged yet because it depends on the ongoing 
M.2 solution. Once the M.2 solution is finalized and merged, the 
Bluetooth-related DTS will be updated accordingly.

The relevant M.2 work is tracked here:
https://lore.kernel.org/all/20260317-pci-m2-e-v6-9-9c898f108d3d@oss.qualcomm.com/

The initial Bluetooth DTS work can be found here:
https://lore.kernel.org/all/20251113130519.2647081-1-wei.deng@oss.qualcomm.com/

Canfeng

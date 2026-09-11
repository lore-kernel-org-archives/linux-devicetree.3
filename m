Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342B136B924
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139494; cv=none; b=t9n6iKssneyxMZBtxvNrLPTbrBpF7xt+pppfBf0M+EZRh5a0gPuYQD+etwxLdjYd9AYNSsFUywK+fklQJMhnHR3wChbl37RCLTK1CoRR5eYt28t0RWQ1wQ84rWqWBSxHPlmyZNUMQEKXpo36SMt2lpuoqDtlIYF7O2krDzSMvvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139494; c=relaxed/simple;
	bh=pC1CCyXtvN10xc3N5sbvGhGAdLjozRH2BPe813E7lyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IOJYslT7k31G4KzSAjXjbIa/cck+spe28cxhRs0G4vgN+M+ElwO0Ozk2X5sSK56BnkhEOm6MiEH+bGfoLQO5GHQOhWCFAWh3NVt8kRxyX5bWT3kUe+6NGqD47Rpy+iQBYuReDF4lQocLCoqeq5c1WQnAzmWkjcgWFh2bImCNim4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NlSo1t0V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FdnUTop/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NlSo1t0V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FdnUTop/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmAc7222597
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JjsKs90kMBvRNGCR6L1JRdq8NiUccmWGU1If0xj1WAA=; b=NlSo1t0VyetQAfcG
	0KZZL2ymdWwewEi3LnrO203oDKoNdt5vD8bkMO1i2hn3XvJ5dHFoDlcU84tWPtYP
	s3DxKXwEuVo7C/yqDkWKspOal4hpw9RemuOksseuF9+6jQPGplpV0lECFdfSDe+2
	BlLlUaKS0LqLIphK0LQNDQY80pt+kz4uOW0JsomVu4vHseN7z704jOCXutDS+OIE
	WSOTsr7ym/zto9R/TrfcARNMQqyyX15Pns1ZG7LEYAvg3E1vJaEXMo5K2Mf7PWW0
	qYPiEU7jOXQomXY8QkjfXrtFuV6no43BhY34O40duMjjbmMLA81i2Xw8QdGJNavg
	MiFRPQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdracfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:11:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86261e66700so877943b3a.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789139491; x=1789744291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JjsKs90kMBvRNGCR6L1JRdq8NiUccmWGU1If0xj1WAA=;
        b=FdnUTop/ujJRaq9EAxMvsGvcv3B8BWZM68ZJvaOEExnA+VzkHSqLR+lA6mrAbr5npw
         Rr3pcnGL4RV1bR91M7SfeCBaAplJBc4/1rU99LPkCfrRDjemTeKxv5tRgKq5/h7jkqk7
         98yeSQ4yGL9FBcbBSHJ0Y4FAo5TdE6yUVcpF9KDo/XJ7GhxiebxeT5FAqZCzerhW0GFk
         l+can153h+zpjm15zjq83ZdNjoKTeKIlTPdUV8YWzJRlPtQheloMH/tauOknwXms4HA+
         j00lqW56eCIA5D7eWF/4OOaiBb4a+/8tfdpYH5f2ii8Y3H/7d+9pyrsngE/A22X5WzaN
         3hXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139491; x=1789744291;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JjsKs90kMBvRNGCR6L1JRdq8NiUccmWGU1If0xj1WAA=;
        b=qgUaFrQ9tsqwnv0xJVMXF7jwqKaIHETDM+j83D3S6HznWUDK5qugnRCk457jdKRX2W
         uUoCZtj7DZWZVzclGGciOPZs3Dhf5vOk701dEn7Vl0GXcyAVwlxsBZe14jkQBDKeeE49
         3R4CLAs6oYFSISskWoxG0waXdammXCaQSkNca9egp/k9yoVeBaW5fEp6WuuVp3pSBaie
         GUp2mwDwLzZ7xmILoPUFNEQnWZ1AFIAmeyXny0l2Nuf6tvxgP6eclmnesjDWr6L34bRn
         EfTxpnOGrKusGFuSI4LCGjBqDv+grMm3AIkdRWZcgCN3BXaOn/DLZIbDV2wdSAqqiRfT
         rpQA==
X-Forwarded-Encrypted: i=1; AKwUvBxomNcRZxlfP5y0t6r7sGUUNAbBuQ+/uKnDbgcp6BmATTMwud1JFi1tQ2Wp2D87644hamKQs1m1RJiC@vger.kernel.org
X-Gm-Message-State: AFuF++mZHjLxV00Yb87os8YyYwGlw5PPwY5KfNyLsGHgkNtc3RcOVSfK
	gbw5cjwTulXnaT/BKTTOmVTY5nexBxDwzLu++RqqJRlw8SDKP7w3/lM57thfxLAs//Da+k5TqaD
	gYdl5X0aMPRwpudH1Bo63I2YGQjxaLPf0Q9KWWFXAV4VGMHbNKRn1vzJkrUbuUixA
X-Gm-Gg: AYBFou2MSOE46MADUB79D++OW/g6gKH7I1zUVdDOpkAkPqGZSEMEXA3PqgdBuE8PePI
	7EcdWfTbxge5EpJtZXhGE0hu8VpyuxvtSDu4XmxwSE0BtB3UJx5hIR6qE03Ev55zOw/FyR7yPkK
	aOUo8EI358dsI96fcqEeQXGvFACMdkDhGTSwiLZjxzlLXhIQYpaxaJc04m6o3mg8ZdhLza3XZS3
	s3c8Qfp4WECEc+yqvbIA5NHm8fV6PQ3kPMu9q9GCa2xwOSpiO/ZENL1fA3HzzIJwCjWhTVa9tcb
	iZkfosnXCSA3zNF4Y2FUsdSpDczCeH1C7ZIxKEGDVixi5XKSyE3yDBy88QYKo4HUgfpyULzXBC4
	//L0j0O5Iq6xbJnz+iRakfluG9foLLVHedw==
X-Received: by 2002:a05:6a00:1749:b0:856:30dd:91ba with SMTP id d2e1a72fcca58-86b30f12a74mr6902921b3a.2.1789139490759;
        Fri, 11 Sep 2026 08:11:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:1749:b0:856:30dd:91ba with SMTP id d2e1a72fcca58-86b30f12a74mr6902226b3a.2.1789139485522;
        Fri, 11 Sep 2026 08:11:25 -0700 (PDT)
Received: from [192.168.1.8] ([122.177.240.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b250c1278sm1268447b3a.8.2026.09.11.08.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:11:25 -0700 (PDT)
Message-ID: <a9d52219-301f-40f6-8af4-c0dea8781dd5@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 20:41:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: Add TCSR_UFS_CLKREF_EN
 definition
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-1-cdff2c67a8c2@oss.qualcomm.com>
 <20260909-devout-generous-oyster-0efdef@quoll>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260909-devout-generous-oyster-0efdef@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RYI-_Ajpg2ICT_G1qL3DwiVvV2NMDBtm
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa41a23 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=3NWKqmDfUQ1iRcuN9QhctA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Dz92lDrrY3zvL3j2_bwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: RYI-_Ajpg2ICT_G1qL3DwiVvV2NMDBtm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxMiBTYWx0ZWRfX9ygXaFoQhjer
 BnRnCS3FDQHWnZ36aC/glgOT4HIjEcHrOhSNBZ8O06MkTyPJmhRMJH95ayyBcc7Z3FbB2wpuryb
 CxMVD35jpGgWc6qzIJd+aQNJq/vqAME=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxMiBTYWx0ZWRfX+RqhXrSwG4GI
 H2YBQ96h9CX5aSxamU/8qGSeEvrifgUFBecjHXA4RY00cC+tR3i13viXSbvdz4EvP2m6GkNmacX
 BBtnqhYUOppK+exMchTtTPHs4qcCGDAuIPeqWMS8YIChYBIGH4qTPHotOndOk8kdjdNmu/OmXt+
 w0piVe4G2Dha+moCXi37F0Xw4jpmVi41nqjbhsbY40p5Kh1knZ/ebU1Lir0namnYGsVIPbHNVNi
 /CVYnxOUXt3BJobEXlzGI8wI5nVszdIxx8nIUMYF+4dMrV7stYIpbQqtbS2zZNCe7+HasSYYBTv
 Ts6RmK/KNK02TValPJcrtHcNOomsC/eSfQX13eIp3jZhzX10ZmlAEa0L9RR5IM4mYGN7E0YVOq5
 QpLnHdvKzyjNJGZTDiTxaj+F1rt4cSxoSUKjJ7bRZkn3WgMJKGQWI4Y5rwqcwzHUIxGXoyWKUu3
 vpfkt0SVi8srGc6hNew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110212



On 9/9/2026 1:00 PM, Krzysztof Kozlowski wrote:
> On Sat, Sep 05, 2026 at 12:20:42AM +0530, Jagadeesh Kona wrote:
>> UFS and PCIE_4 share the same clkref enable on Glymur. Hence define
>> TCSR_UFS_CLKREF_EN as an alias of TCSR_PCIE_4_CLKREF_EN for UFS consumers
>> to reference the shared clkref on Qualcomm Glymur platform.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  include/dt-bindings/clock/qcom,glymur-tcsr.h | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/include/dt-bindings/clock/qcom,glymur-tcsr.h b/include/dt-bindings/clock/qcom,glymur-tcsr.h
>> index 72614226b113bb60f1e430fc18e13c46c8b043d3..f338ab4454a14aa75532cd0a6a56b6bbb02f9448 100644
>> --- a/include/dt-bindings/clock/qcom,glymur-tcsr.h
>> +++ b/include/dt-bindings/clock/qcom,glymur-tcsr.h
>> @@ -20,5 +20,6 @@
>>  #define TCSR_USB3_1_CLKREF_EN					10
>>  #define TCSR_USB4_1_CLKREF_EN					11
>>  #define TCSR_USB4_2_CLKREF_EN					12
>> +#define TCSR_UFS_CLKREF_EN					TCSR_PCIE_4_CLKREF_EN
> 
> I could not find usage of this new ABI in your patches. Can you point me?
> 

Thanks Konrad and Krzysztof for your reviews.

The above ABI is planned to be used by the upcoming Glymur UFS change series in the UFS DT node. 

But based on the Konrad's comment in this series[1], will drop this change in next version
and use the TCSR_PCIE_4_CLKREF_EN in UFS DT node and add a comment there that it is intentional.

[1]: https://lore.kernel.org/all/16ec601e-68a2-4793-8639-b899f31ff819@oss.qualcomm.com/

Thanks,
Jagadeesh

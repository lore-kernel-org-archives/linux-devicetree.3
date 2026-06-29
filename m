Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCD6317148
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782709533; cv=none; b=Ej7J/Vl0tdadMfMTPliagx7FYQTCAJiU1s9QtSrKy882QZ3OKDaHE4oj/DJDrtlu/WWPpwdFhbrwp8E4RA/LOz4fK1ZgAdUWxd/+3zKnG14NnP6d/59bK/du+FCO3lPkVN4dXjZXqTGx0iuxd33RnwWhVFf8lavOO+jpnXIxKI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782709533; c=relaxed/simple;
	bh=8aOJRHKBmfc1+7Rwpqn2N1sXUGdR14XHUpIhVnxAONc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nh4q++TIFamNta5Yjfjtcei37TFitodyykSsa/hV4HjvprXqzdjlYg9GBJYSYe2K7y/xvYiqSYjFLGGeqOunRUtJE4jUB3Nms1dHkrD0UA2Wxvi+m3YMHmwOlT61REX/8PX+oei0sfcpKtLXN2CcTXsrqMckaWCJcZ4w5uDhWpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcgo6nzT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hYNKAGJR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcgo6nzT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hYNKAGJR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NJ5G1724579
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nO3s3VCHHewstNRZJ4t4fpECAVq2VYK9td73k2+GiRw=; b=mcgo6nzTLpNWQlQk
	H0WYlKlFw4NrefmbGgQJsCcX5te9uZxZLwvK5rSWDIN3OoX7sWFzkHZByEzkBAwh
	CIfB1Cec+02ejRvAC9sgBkBVSvmsTSba2MzGDObdG6qhWfNqxllCT70C2x47DVa2
	4sogiU8RIWZfgY1QXcZ9kQKLW8qfL+YeNOHwviiucsrhjzPVS6SuCt7B/jekd64R
	Fr+zlGiYZSPhtONknfPBLO1fvH6k9uHvibKkKK5NK3ybL16OkqdPE3HtOapgDvFp
	9q/R9kf6M1z7pDuuvnAjUJ0IGvHKt3ZapYY05DSLbOpDVz7WBCJnphPAJZQ0d7jB
	mG/4+w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26w6mjpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:05:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c9bd8b9c7so3449485eec.0
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782709530; x=1783314330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nO3s3VCHHewstNRZJ4t4fpECAVq2VYK9td73k2+GiRw=;
        b=hYNKAGJRrD/miqJ2ATbkw+xFnHlSaH+vlhLUJZX0/gVBXKKpCmv2gqYr1o8K3XVZ5w
         iixDd7T0Uqrdplf67nHT4ACl01LxVNERD7edOL1n5e/GO8/U3yv6V7ylRTWWgPYGJGO3
         RAs3o6JJ2iY8Jh48ueNAK0F+0Aw5Uph9CorTG60GdqzZuKD6HrQKqt6Z15FygcshDD50
         MMuuFZqe/ip4wBpqV+kvOJuwRaXRtKPxmbOIyPIh8As4RIm3EmAaKydnPTzG0Et0xyR/
         oH+NqGd4XHhsCEV3aAB7MtQBDOyhTc3sLktK13Eyrm3QZJSPJQ+bnER22527Lf7ua9zx
         K+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782709530; x=1783314330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nO3s3VCHHewstNRZJ4t4fpECAVq2VYK9td73k2+GiRw=;
        b=FRrRJTytOuP6rMeFNFThkJLBvevyszWmDsdOS1kEu+4SB4kDxdqSaV9/3YfAvOuYAX
         bBPt0IfdD12FDhZRPCii61dUjxl1EV0cFzNEYxOUAw8XYDzqB4tt2xhicuaBGlIku9Br
         UlBvtTpqNJ/KqH+y9lPumi2T5E7A5wuQh7UKptU8d0ewHXIVk6+zr+a1g0G5Nx6pIrAJ
         rLBhaJe2mkBjZxlCCYJ5m1MV7i5FtW98P60TQo4q2egx98PSb8duOyKg2Y203Ynh3qlL
         n9c1uSEPm7eqQ8Od7jRBRuvLziW4wflUfiVZuGNkBQGMnwMU8wORYboxH5PjRUn2PFWB
         j0WQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqW4e8MusAaFyVBrLlS7wBD8Y2OFhYolSO/O7wSxr3PQZ+ZaddfpFJ8J66QmWoZB/j1jWMrSeXcK/F@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs+mAYcQegSJ3oxzTIJ9FLwUidAhCH50VFk1G4gX6SfwMFqnlG
	x4EUssFQDAqy/sGDd+yBgsVAzcPqvTzml1p12uqO8o39BJ78daIjefxYRK8YBsMGtMLx5zdpLcy
	hK3hUtxID5cR6anHAr0jixMmaYhACNu+AnzvH1lEtduj/OIpRCvWAfvgT4Sl3F6Yx
X-Gm-Gg: AfdE7ckxak2Y0jqygDo8/ilRn3qvpecwCy3UlHa7U3PXZ5vPVea6VwjOe3RDKG/TCCN
	jx3BZojqPbRc3WT0BZIZJNHLgZ7BMYxgKSH8B0JjONAFRe9ERz1HekSeXOEtPcknDLNp/PcTdpI
	Rg6Zj7ixWLjUfWTCdGW8AUF2SVp4Pnv0VVmRD7E+to4FT1A+GndLu84V/WTuOoH+db+/RMFl3bB
	eeTSiVDXrrTPJhrq/Pc/pctKMbVOSIYTI636JSaqH08q7lbFlIGpcQ0DazmDIkgpUh4mcOArvQt
	Py/FqobcXmyMHzkyxVV06H0s2UDD4hThnOB9tUDUc1zdfRz+w/PzltmWxsmjnAx0DCkg8wTX1+i
	+LmKb2fnBv7CPS+JL426cf9MVUOR9lckhpegoZ//gSTncskRntA==
X-Received: by 2002:a05:7300:d0c:b0:30b:a257:3a2d with SMTP id 5a478bee46e88-30c84fd07e6mr13311462eec.26.1782709529457;
        Sun, 28 Jun 2026 22:05:29 -0700 (PDT)
X-Received: by 2002:a05:7300:d0c:b0:30b:a257:3a2d with SMTP id 5a478bee46e88-30c84fd07e6mr13311436eec.26.1782709528887;
        Sun, 28 Jun 2026 22:05:28 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ca5f15024sm31653192eec.17.2026.06.28.22.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:05:28 -0700 (PDT)
Message-ID: <49d60b9a-127a-4f3f-84b2-ebf365257b8f@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:35:23 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] arm64: dts: qcom: shikra: Add QAIF CPU node for
 audio
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <41118d35-2b3a-4f49-8add-bf501bb93040@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <41118d35-2b3a-4f49-8add-bf501bb93040@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Zfu-NjPvPsUfSkpBzzfdvnVJm_HiMNUp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0MSBTYWx0ZWRfXyMiZwT8YrGbj
 Xqux3hq5K8Pwvt4b8bQcIGtE2/hPoOZR4iEnSS39Q7/Lrg7tM8JaIJRNj4xNhaAsN+AExgEr42o
 APIPbIFYBfGHDDrERL3+CBtEN6MVxls=
X-Proofpoint-GUID: Zfu-NjPvPsUfSkpBzzfdvnVJm_HiMNUp
X-Authority-Analysis: v=2.4 cv=SuugLvO0 c=1 sm=1 tr=0 ts=6a41fd1a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VdTWikP8Db9nZ3PMghEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0MSBTYWx0ZWRfXwc3EyGnBzukn
 lFNmeNRsCyVvpoZBh+RZ7UKiVDKdcZHA6PZo+oomRxVnjQz7Z4EzhFcrePsvOXsP9d3uGnIFmCz
 r9Hom9mlVMB7xrGUdal7S5LYBcV/LJY9iAle8KJmqc6dvtpw7fGLnpRPuXlIMLUCRa83K1EEqRw
 4oly6doiRmhPP2sN8cbmfcDMeZrAhEprk2Y00YEQq4Jiq3iEMIp6A/YchBVf9+bXF0P+fQbGatp
 X2vfzn4hprk9UiXWRnRwiaazXBGCNLvoFJ5/iW1cOVsE9KTo+youIoPLNbBZsKH1yJ9Yd23dwXj
 Lz5T7T3kB1PTmjT+4peAbR/3XHpTpT973KMQ3ZqoR8RknYrStqnjRPFfm5WlHT2nBCGuXz8rLMM
 rqeobSR6yipBQSIisROnkhrL2jx+4K/dpt29S06pQ3WQFlrZzXIwVMDAG0TwfFThnou+MmgnSvQ
 sy+/XIdYDHEYAURMiZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290041



On 6/24/2026 1:50 PM, Konrad Dybcio wrote:
> On 6/16/26 10:13 PM, Mohammad Rafi Shaik wrote:
>> Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
>> front-end links to backend codecs.
>>
>> Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
>> the QAIF block. Keep the node disabled at SoC level; board dts files enable
>> and consume it in subsequent patches.
>>
>> Co-developed-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
>> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 46 ++++++++++++++++++++++++++++
>>   1 file changed, 46 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index bc4ad2bcbbec..e58c87fc8cb0 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -2017,6 +2017,52 @@ dispcc: clock-controller@5f00000 {
>>   			#power-domain-cells = <1>;
>>   		};
>>   
>> +		qaif_cpu: audio@a000000 {
>> +			compatible = "qcom,shikra-qaif-cpu";
>> +			reg = <0x0 0x0a000000 0x0 0x20000>;
>> +
>> +			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>;
>> +
>> +			clocks = <&gcc GCC_LPASS_CONFIG_CLK>,
>> +				<&gcc GCC_LPASS_CORE_AXIM_CLK>,
> 
> Please align the <s and "s
> 

sure, will fix.

Thanks,
Rafi.

> Konrad


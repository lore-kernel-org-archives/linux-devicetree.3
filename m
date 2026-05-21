Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB64367B89
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353154; cv=none; b=ET5DL5m7AiL0Moo0SRAvS+YyNNYd1rPgb1GWdtNnrJnXkVsAnMcX8Igtc6YiJyOR1wG7JkBzEGAIKpE3cgq19XCXmBYW0L23DzzT0CsUhIka8Ki672riWCmaDvJdOtIb/wte85vzpM8FnG3UVVSdLNjKJdunKKMkUzJ/xzMnCMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353154; c=relaxed/simple;
	bh=LI1P7U0gaKVb0FmucV8auUmJuUJiOS5F8FS12dF2UIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XxyfEpai6EnYMRGC+qxfuhkj6H1yKnTz1ch5LUwBYBHzKHyVEy+XkM1TYycj71q+b0KfF0EAIpcgB39mQtt4XePHHWK9ClmZBPwSKPqcloGbyGqeIAp/4cz04wSlFAh7rkoME51L5vV9768hh9W2a6gmtmE302QQ5hSy0f7PyJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KpoblIp4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dfk8qgv5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KpoblIp4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dfk8qgv5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6ExAE1798088
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wJVdsUyX98YGeW/ulFXwxng+OTO4Vq5zgb/1dD/SbDM=; b=KpoblIp4FrCA7WaY
	V0aY174JYcUU4bEHOb41Z1Bp0vTX6wVHCNGVSD6LkHlJOKSlEM6pMyCchKMWcI+L
	/FNSpJpvJrPYTW2QcASurlNney0kg8k3i4HM1a1ehtm/ckxjrfjUZ/mbYitG93PW
	kTikwmzGWt0vQk0lL5Iq2AfhfxwguQDqEW8AwlkY7H8eBD54eQeleAGYZ6Oajzp7
	fyfzICeTNV+SCEiVwa+7W66AbpOAarA+WaB8kVMgt+Gk9mFFDoZl75iHWCWO4oid
	dva7CrlwIQtw7Q9S3DmKdpxHHYzFeXEni4Cv/aP+L0g+zR5bblIqcxaYUFqGvfx/
	g+VS4w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu434h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:45:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365fc4636bbso12791151a91.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353152; x=1779957952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wJVdsUyX98YGeW/ulFXwxng+OTO4Vq5zgb/1dD/SbDM=;
        b=Dfk8qgv5hpROW86sINUAEQxJgcT+F4cvcIbOhO2ceBzhMK419m283sHyNIGASV3mqp
         1R1GOTm+OkDvS/an8UYLT4WLvLoDMbJeYn+Z/ncpSX5KenDGG+2TzUT0FqCMRcR3LsiS
         mKiAx0t/ybQkaGawAZryW/Aanwt390ElyMWdoa/DYEy94jZ+qBKIef3Met1QXy5L3EQ0
         97fySqxRl5ETCyUkwDUdprqhNRj0m7xzavUmIxCMM1bTwvIjA8uNnqRR1U4ZQBANrDpe
         ND79gjiVUzEibOX0pLHvUUtNs7WhcdAQmVx3Dzht4cI6DjFZMP5wbSrXXfjAaDFOJ7Fx
         z1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353152; x=1779957952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJVdsUyX98YGeW/ulFXwxng+OTO4Vq5zgb/1dD/SbDM=;
        b=K2qu4tLsDJZ4nsDnDXWXGtvLm3sb/H0svtSr9/vKKvZ9XA7HsPEET5HZfpul5dEe6H
         BQvvKCaXxSYlM71O5c3QpngWwAruanL5kba3wj5mGqKyz+WI8JqbIUQMNEV3IU8m7Fzb
         2BY4Y+uorM+5F8gaskYkxtE1CQ1JtGh6vJdazu8fkDbqIasR55sEbjB/XYWZPN74K9v3
         1KKgNAmi09bhUIk+Xb2SJcHPgAPCgEa/5bYBjsmDADu9xBtPllfe0gDZqFtO6+78UThn
         jSye9AoxdBFQOkwO9p5r7b8PGmu6WVV+WY0aRlNhR7kmkcAxvbqqlhfXf6JSGgbv1DO+
         QhZA==
X-Forwarded-Encrypted: i=1; AFNElJ8nc+7J4Dhu2G7G7TfycXMuAiCPUwBrXRBXGGrz9rFtTZsnjgDET016AFkGMtEK8/SMljViMOUeVwrz@vger.kernel.org
X-Gm-Message-State: AOJu0YzBOKx/7DO1yDm2NVlUrS1KeJNag7XTZXxEyd/EHJqYp9pDDMJR
	69NiLa1ipgEuBBM2BzhFpgzDRR1WyC5uUI8gZ1ooqGD/cVj2He4AfRYzu+DwDzqrAIVrvCBsxgm
	y5v6p+XIFObbjjgRBAMXgzlos7QyFWayhgZQco5pMMQE1Fs/kuBLhkiImSCML8Eht
X-Gm-Gg: Acq92OH+9S+obApojAYsD50h32Ijt5rNULh2ljNc8SdWqEpvBfIWgrS770JzrblA+cy
	sWZix8CDMQESvkLnGk2iEIe0hpSx2/nEtOYZDR6d752oEXEwL64HIji6104XYklhQEvn3BXT8jC
	NuK5fUEMkOLgY31c2ICYDXD5xs147GvpYZTaJmMTu964u4CekJZgZ3NmeKn1G55rwmSr/lshDYg
	/qBSSZAD4fUcWAdBJ4+vNKniDDXnAKbvWSxLA5tgLDmiQ/YPhuLP1rxJLh8gnJVm0Rzex/nQ2WZ
	lFRCTia4Yt134pBOeORwUq+CuxBvoeJWSlE0HXj4IglK9LJ404twGQhtx4LD8IMYaWB+NbJZlz3
	jK7TA85ci3EfigFLgZWw2yE+b5UkdyjqvunhFSGbdRQJOB0Izyghf
X-Received: by 2002:a17:90b:2708:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-36a43887a55mr2172281a91.0.1779353152307;
        Thu, 21 May 2026 01:45:52 -0700 (PDT)
X-Received: by 2002:a17:90b:2708:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-36a43887a55mr2172239a91.0.1779353151814;
        Thu, 21 May 2026 01:45:51 -0700 (PDT)
Received: from [10.217.222.91] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a46d53ea1sm723782a91.4.2026.05.21.01.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:45:51 -0700 (PDT)
Message-ID: <57c26520-42dd-4159-bd2a-69874945cbbe@oss.qualcomm.com>
Date: Thu, 21 May 2026 14:15:45 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: shikra: Add qcrypto node support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
 <20260515-shikra_qcrypto-v1-3-80f07b345c29@oss.qualcomm.com>
 <8dfa0670-7605-497b-9d53-db9b4a8a3d8d@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <8dfa0670-7605-497b-9d53-db9b4a8a3d8d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NSBTYWx0ZWRfX9POkw3K6Pb21
 8nhFrP5SQsDuQrinIphxAr/3aTfqecz5MnSicTuHqLXDh4dy9Mpa7dwzVD2LRRiHCqmoTes09Qu
 MaxHM8wcMmS3SQKq0nJ4/nGqr4Ta1wZ86t1qW4KG+gVIjJHaaakI3yca3CJL0bvi6yuDFeUbyDR
 QRL2ciZc5iS2XUaqlIt381Gj/bNIYb3lBbwjN3D3QsjEe8jQAuvLM3eaDsDl1pWMKLD1eVl+Ndu
 97cr21lnusBwiaJ87koyEbvgJzsqA+eseSjvJeq81/X5UEa5riC57eG5rqp4DWdXE7cLIGHNVOB
 7FN0HyEUqAldOrl++lKqCPtg3WDfbqvmDuYu6HgYVRBFNdpLd50OtKXWzFnN3d5+bwDYxs7cNzE
 4WuTF2VOdmxR9XEnWfq/vJU2XbuVaAcuhHahfX1rTewTk1el133x+sK6of0IopnOGXzuMvLfJyy
 wVvTwXoeVfFyV9ujIAQ==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0ec641 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FZn51bsQql4VyS6HqkQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: celcgajb0tVWNKzCKgBhPv9dtFJl7MUE
X-Proofpoint-ORIG-GUID: celcgajb0tVWNKzCKgBhPv9dtFJl7MUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210085

On 15-05-2026 15:58, Konrad Dybcio wrote:
> On 5/14/26 9:23 PM, Kuldeep Singh wrote:
>> Add qcrypto and cryptobam support for shikra target.
>>
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/shikra.dtsi | 35 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index 262c488add1e..dbac0e901d6e 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -541,6 +541,41 @@ config_noc: interconnect@1900000 {
>>  			#interconnect-cells = <2>;
>>  		};
>>  
>> +		cryptobam: dma-controller@1b04000 {
>> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
>> +			reg = <0x0 0x01b04000 0x0 0x24000>;
>> +			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
>> +			#dma-cells = <1>;
>> +			iommus = <&apps_smmu 0x84 0x0011>,
>> +				 <&apps_smmu 0x86 0x0011>,
>> +				 <&apps_smmu 0x92 0x0>,
> 
>> +				 <&apps_smmu 0x94 0x0011>,
>> +				 <&apps_smmu 0x96 0x0011>,
> 
> These two entries are logically the same (SID & ~mask) as the first two,
> does it still work if you remove them?

Yes, resulting sid is same for 84/94 and 86/92.
Basically, the resulting sid could be same, it's an optimization which
smmu is doing which can result in same SMR(Stream matching register)
routing 2 different sid to same context bank.
So, 2 sid can be used even though resulting sid remains same.

Also, DT usually dictates what hw capabilities are supported and hence,
captured all apps entries here to match the hardware description.

I hope this answers your query.
> 
> 
>> +				 <&apps_smmu 0x98 0x0001>,
>> +				 <&apps_smmu 0x9F 0x0>;
> 
> Let's keep lowercase hex
Sure, will update in next rev.
Please note, I'll be clubbing patches together in one series as
suggested by krzysztof and fix this too that time.

-- 
Regards
Kuldeep


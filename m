Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E81525A645
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113550; cv=none; b=ex5nEDMvsN5JpYCysngW65K4LuDdqUmeq0KwH1FF9joB6dF2wCwxw5xpWQYBT7Sb800Eole7EwFszR23N8NtLHQWLJ4XjeOhw2WVd0jICrffK2PWNYLBgGdClJ19VzRdOg36eLXgwf8Xk4wEdaz68cBByS9xatf6WvL8NOSDKyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113550; c=relaxed/simple;
	bh=xb5jl4XGZsuZVOQ/+x9BoePJWqpOPRJTjGcc5aZr84E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uE79zsTc6c49GzoEdQx7MgeXg076UZYSX8OX0SafQfrhnY8SbZVZparvb8JR2weqnuliO6mKjHs/Bhdy5duT33RMhEYrRBMs20sHuK0Ca03GTADwkcP7nPl2M1MigaeQGXu7R7ctF7jmE6Vh8Xdst/8MUQvgoMDVZ4J6AP4PALY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5h2D3+x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrOhqxn9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5h2D3+x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KrOhqxn9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FNbK9E1596377
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sNbdh1Cn+rHMPkzU/IBZz+cXpbpGoCqAOoiJ7+4f/Kg=; b=R5h2D3+xv80DyBRl
	iLpDTI2AVv5CWZVWpvcInkkAsZdxSEfWPMnQ7wIPQhcPHhAH2eoMWAQSBift7jCO
	OSek2R+0SEuDzNLHNN4Re0aHq8EE84wD499vSQGBxm7An07U6dTleFtTb9AhzT9F
	rqylxBV1qyK5gJnjHR5OAH8Rbg/yqpiqlDazGZwO8F7M/d9WOzA4JgVRDNpsm6mi
	zoOiFQUT4I1ZN/4ZU2/KLdRgCsuNOZ4ZgLv3yQnUEFhobML23EEoFZliPlywle27
	CAZw8nLmuKMjIRg1B3jQpKQbuf3DTDJjm4hJm6OV9aZFDd+/AVBAvj9gJKVaxMgR
	P5tq9g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2vb6ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 01:19:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88b9d8c9e55so515248b3a.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 18:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792113548; x=1792718348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNbdh1Cn+rHMPkzU/IBZz+cXpbpGoCqAOoiJ7+4f/Kg=;
        b=KrOhqxn9yV7b5/t+tUJ+wj96Vm2p6IlphZCgf38zlLUck6aJUg/3ZuqUWBqc7+RuIL
         CL7YFtU/LV65N4KakvfRSmQYXa0xBpmQWnfznN1NmalFXTOSp3ob7GtkyMhv5P+Y12jW
         L1e8xYmWdKyWYVFBP3V2GH80CavB5Evk8Q37JRxqfq473F7wAoGUv5i+y0wcdU40ZWs+
         9A325fv7/HYoVv0k83nOvHkZfV65MGUn+/ZmhIW/Wd/rFhnjLr9KJh4B9fPa6Qfag5G6
         HlVVr/ou4Ns/gQnfu1di8Cf7/FwlwNFFpX9m17RNP2vlnhhhMPUmRJNHtyciabysOKut
         PHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792113548; x=1792718348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNbdh1Cn+rHMPkzU/IBZz+cXpbpGoCqAOoiJ7+4f/Kg=;
        b=2RJOBz3D2+ZQpBueyNB7ldkv+VTo6i0mdreeJ3fj45A+xbOTyr0CaXgAvHXOt9vKZQ
         k6jHbJxIjOnPhvFEoQOSMnSe+QdPcKRCfFgdB/iiSBo4JMVOPNhWpqpUjjFQUgtnTjL4
         a8Njr5Mka/osaFuGK9GAhRHjDy2HvmjP7tbDUmUPHZdV6VaSyRvbaHclzAJDMKQCT8sl
         6M/4rfOS8ODPl41UaXox9HhVVJDl2f4SH1GAnNHUKA6KfNGt8bVSpNaGzUSYQuXMVrku
         hs4wjWlrBSmOjYF6v78oZExDAWXQ4V24dUntlYd2zaoFyGzdnfFCScnCZp30u5dCANEB
         6DvA==
X-Forwarded-Encrypted: i=1; AKwUvBwr9X2InTEiEjGk2ZwHoEdbfQYIMpRp1vWzCArzi4AuifuqPjejvWy4kepoFOF+ia2nQltl69Mym1AT@vger.kernel.org
X-Gm-Message-State: AFq9FYK2KxV1h0LfeEtR7vXMa+FUYBkQ5s0swcXponaEX1Qu55KOdaW1
	9Rpoi9xRoJlSGchCHkmWVkjXM2ZmTl1+YcnWasU/zn33gk336e/jPyr1+9auCqx9WKfLp/QqNCZ
	FzZD2bsEBT35ZL6QLu4M7Dh7AmioeJ2BASeVDEyWyrcWlLjGG1If5Wbt3L7B8iRVX
X-Gm-Gg: AYBFou3S2L4XW+Qqa1XqS9s7oeiDB3U497SFFxS04SlnDDFSbsT7rMt/iFPJIJSJ85I
	yOoRFhj16g+HPkGcD1Hw0orcxzymCRDJ5W8rwKnOQYh9g/ub9nwESRFZRxRGP4yd7j0vOL5qGHN
	mMRL445oQSb6rTLVY06tz/+EbYGm55k0E2iFabQo3hKkDkwhcjILF93popMAqWiSaOD8nvXHaHM
	78st1cC/1nQ5mgYXsqdRrxFwAfTIUYxwPnX3P74zNzpNO96GsF5h8Bz1gsA+y1QsumqRu1NL9EI
	CZAnhYTnzbzOuj8wWC95rtHvTfhQ0PN2F07OQMSSCHLi+UYV3c0uLoK6gh4T5HQRkBztoXjbfA4
	Y8xJpkH+giRYFqQAr37f7EgWqlj1r7f/VXXEQAskEGt4Dy7qjrIklxneTXp/QRCU+
X-Received: by 2002:a05:6a00:3d01:b0:886:4ca4:a3e8 with SMTP id d2e1a72fcca58-89f1e7ac519mr1088847b3a.5.1792113547926;
        Thu, 15 Oct 2026 18:19:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d01:b0:886:4ca4:a3e8 with SMTP id d2e1a72fcca58-89f1e7ac519mr1088831b3a.5.1792113547456;
        Thu, 15 Oct 2026 18:19:07 -0700 (PDT)
Received: from [10.133.33.148] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f580173efsm309841b3a.50.2026.10.15.18.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 18:19:04 -0700 (PDT)
Message-ID: <324a3513-11cd-4e22-9b51-0aaa46354d26@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 09:18:55 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: nord: add CoreSight debug nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922100850.527109-1-shengchao.guo@oss.qualcomm.com>
 <20260922100850.527109-3-shengchao.guo@oss.qualcomm.com>
 <25956f40-e7e1-4815-94a2-54ee8b1a50e7@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <25956f40-e7e1-4815-94a2-54ee8b1a50e7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAwNCBTYWx0ZWRfX5W9+oMVgQjxp
 0bpdVan6gP31AwyrTVYbrqRJR+ZoCuAQKJxgi9brDeAOqkVSPZipYJZ3t5715oaDdQiYS5sOWJH
 S8nf0x7i2NXi8GPsutdyiTn/WXu57s1F7pEB9gb3FzQxdJzlWbnPT4j3uDNHsjUZZLn75UdhtQS
 GEkp32SOxVjY12lgnkBy5IKI1EC/yT+tANP1TL9bVoqwYGBePDYoGQd0GmPUA6yIPXOpbzpZtKF
 XArfqRfcIISyRheQBGN2yzOWP8Wu12yjhZAsnovGypEAvnIcxSR/723XRvaBj1jVbaImz1jpHj9
 10iCiRHY+JcVtVTn7TFJskJxF9mGhwjYgshJaPcWaAFjya+JHwWH0T45DKe524CuCGPc13vIxnl
 xmE5LaEylsZI1yD/uwQB5UjgKsyYZt/MeqdNdk9hYqYQOKUzfZZEw+FRm/s5CLO0FVTGLxK34XJ
 0qV2owJWTzfwHDYNdZg==
X-Proofpoint-ORIG-GUID: UKfKMLwvVs_M07ShImZ7kmg_v_zHBHk4
X-Proofpoint-GUID: UKfKMLwvVs_M07ShImZ7kmg_v_zHBHk4
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad17b8c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=xuU9YvB76CLXlpF1iJ4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAwNCBTYWx0ZWRfX05UnFqHoUrGl
 798IYc58vGf0xd4r34h5QVDJ+WqICZUjCrzb5EnqmVnBB/8YJH/kQTha/J8k2DDPZUtqMBJCu8l
 Bhp2lq7Zh0lVOxbE99n1iGd9xu4fmHM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160004



On 10/15/2026 10:18 PM, Konrad Dybcio wrote:
> On 9/22/26 12:08 PM, Shawn Guo wrote:
>> From: Jie Gan <jie.gan@oss.qualcomm.com>
>>
>> Add the CoreSight trace topology for the Qualcomm Nord SoC: CTCU, STM,
>> TPDM/TPDA sources and aggregators, funnels, replicators, TMC ETR/ETF
>> sinks, TNoC/ITNoC nodes and per-subsystem CTIs. This wires up trace
>> sources for SOCCP, BCV/IMH/DPM, GCC, QM, DL_NOC, the CDSP NSP0-3
>> clusters, DLMM, EVA, MDSS0/1, LPASS and the AOSS SWAO priority TPDMs,
>> plus the DDR0-3 channel and LLCC TPDMs, all funneled through the
>> tn_ag aggregator into the main CoreSight funnel and out to the AOSS
>> sink.
> 
> [...]
> 
> 
>> +		tpdm@12410000 {
>> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
>> +			reg = <0x0 0x12410000 0x0 0x1000>;
>> +
>> +			clocks = <&aoss_qmp>;
>> +			clock-names = "apb_pclk";
>> +			label = "tpdm_ddr3_llcc_2";
>> +
>> +			qcom,cmb-element-bits = <32>;
>> +			qcom,cmb-msrs-num = <32>;
>> +
>> +			out-ports {
>> +				port {
>> +					ddr2_tpdm2_out: endpoint {
>> +						remote-endpoint = <&ddr2_tn_in9>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		tpdm@12411000 {
>> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
>> +			reg = <0x0 0x12411000 0x0 0x1000>;
>> +
>> +			clocks = <&aoss_qmp>;
>> +			clock-names = "apb_pclk";
>> +			label = "tpdm_ddr3_llcc_3";
> 
> GPT points out the labels should be ddr2_, not ddr3_ on these nodes

Confirmed should be ddr2_ .

Thanks,
Jie

> 
> Konrad


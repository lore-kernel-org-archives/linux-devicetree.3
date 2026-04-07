Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99983A3E95
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 11:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775561032; cv=none; b=Y3jx0Cpj94ZKm03q4gGTtYSsbUN2OcPP46gMWZj44Ddspk2aieuZ4JP2Znno2Vn2q3rubsJ7M5MbH6j0Yirfd8MtGCUkS+mSl9AXtH9QCfAsBdEltI2Y+bDZs2LC72++0KoJVfcI9/CpMCQk9s9mWjmK58MNzsuu/fNu0X05Mgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775561032; c=relaxed/simple;
	bh=0g2DOWAqxXl3/6VKoIdBmNLTlCMN0Jx8vcKCM1lnED4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lxl1Su5S5t1D+5A/QjKvgn5YdSZWar9YP3baIdNivUtnpwJMW/uxniKxwG1tjeCaZZdb9w+mtat22ofZ6HEB0pq45hNcLZdemCRom12+NuwoeWUCjZj2D0Iveo4kSzkS++Q+O+80bei8G6C2b3dFJU4xlfWtbVtBMk1QPCVzx1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EkO7zyZS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DhBDxpwA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EkO7zyZS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DhBDxpwA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376Gk5E2581359
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 11:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XO/DBEMZjhgTBwIbs6dM7BFKs9J0ENtLy/HrD5FOI1A=; b=EkO7zyZSzb7Q4/gd
	/9jVwAcaIp3a3BmkoSwGZ4UhwHlRZ6ptN2cgIafFpcH1AYr7KiUISg1egz/rOETv
	khw30riJhWnIbHlPQTtyeHvhP85vpa2bhsKO5rPH0bH9AI1c9ClYnXlNXKZI1+sf
	GI1h0UVpOZDD84vPCCqTpPWltxSIF2cssAkm0FHgQQ8aUA4XCuiL9BjWkpCtJ7P4
	wJMiFwteYJWYqrFZLfGPUCihG9uwdda1iCGS3UH2ACHlqaXDcGGU3+bA+YZ5evk8
	+R5sE176WHImUi0Y31JNJCNyllwi879hSZ/akuKGeMFY3hqlFGwy1QsBLqL+Mj5B
	VPo4/w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf2fru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 11:23:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d87632952so7561541cf.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 04:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775561029; x=1776165829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XO/DBEMZjhgTBwIbs6dM7BFKs9J0ENtLy/HrD5FOI1A=;
        b=DhBDxpwAvu5DN+keB32w4TR2WKnOfXSSzEXh36xgRPGFkcsmTvfIiaR3QEqX4V4hTA
         RXQf6JlmDHshAOGRoSbFg2KbRazAskiiY80uScw5r9twFSpqPMDoOJNIyXk/ip4FIwIG
         t6V7m6fRQyb4aJz5YCag/MCGY/++3xMg1ASaiuGA9xXsu/sYb/dY/2TSORuJU21RVjcq
         hrE6kGAxapQs0a502kEWt5GG3p/kUxHnhpbsINVQQV7gFXa1xldllRxYHMqmGzGLaO0g
         bSOwJZWS8kh82asFqquMXO73OXNhTYSo/OqiZEG1o9PumeHT3ZgD/E6MAtlOyF3Cfpwa
         C01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775561029; x=1776165829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XO/DBEMZjhgTBwIbs6dM7BFKs9J0ENtLy/HrD5FOI1A=;
        b=X/1mgiIpzxiuf/S8Jg2OEovjpeQJLIZgDnlUhAvp9R8yEzH/Pwekru3cYUs4YhBVst
         SXaSwvNQ5nJNXNkfHodjVPdsOjhbLb2PTUkNu39W7cZXVV0++4+7ZwQU6z0rvLTtnB+5
         RD6kTJHV7GW8FvSvrpHoybxJV3xmd/OuPeENO4h+rQXNhAo/6u0wrTHbjmrsRqBbwL0D
         denwyQOBz010t5iEeaneiS5f1K9+P7uXYTIpHyS4HuS/hz45S+2YXFCevF9TaeOpkV97
         LJoyWY0djm5TfMjdGixDAP4DGeztARnL6Ra4KVqe1wt/AxKKpLOyCPRvPfGc41AKpreN
         P5iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxaCONRqMi4OUt+2HerpnFzqZp90U4sl8NpaPUEy9blQjHlw5i2mSOFaYkVcemf/rTMsYWUit+bXM8@vger.kernel.org
X-Gm-Message-State: AOJu0YwVOUL88+UOMzae7u9bUNzoKK97/TU6IxgthYSeXgwUxA10TIuE
	rIym7G6gC0sX/xkjKAsDSTyDEQdl/+CR8pHo1mNGGoyAF5FgCJuXPypwgFbGL2TZHfs/7Ohelj8
	gEKczu5R4yz+H3sTj2+NquT1pm77ozXPI0+Dqx54FXTpA2jMv5tNUKL6vaXOHb/BC7ld6jMuo
X-Gm-Gg: AeBDiespJXK9z8ziqBQ/kV+8uHoPcYPjW819oTB9SYjcTjBMRUnOFNp2KVAwvEcqU60
	16+tNGJGsiZPzL3mLzboKLuDaoorKAHtVCysR29+lR3gjqNvZ1e7em56+OKh6+BT+j8eaCO/q8Y
	wH1h/zYaVe2bMhwyVy1RQHdI1uA/mDmcdKI5+kYbnMPYB5wcmQEBaHpUTQQ/Mjcta4dBnRxhLp5
	lJaF4U7D4fvyN2fVrZcIZKVERT0qv8fzQgpvo0l9x7H56gKvWXDDS/sse+FJdkplptOdvQEQ6Np
	DyyPFrRMgIYjqlcL99J+aJwZFfmqFAPb3iyQekTZx1mToWAXyE16GFa8ASVPbR6xWRTiZuK6kKX
	V8oPlSYEbRJZ00TlZvSOAIeFTSsmkW0atRmXNojo3i6njWr33gsDGtbH08W1vaiNLyPszH0tq1k
	Jxw8c=
X-Received: by 2002:a05:620a:4442:b0:8d2:394a:d3f3 with SMTP id af79cd13be357-8d4184d407fmr1513597185a.2.1775561029151;
        Tue, 07 Apr 2026 04:23:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4442:b0:8d2:394a:d3f3 with SMTP id af79cd13be357-8d4184d407fmr1513593385a.2.1775561028541;
        Tue, 07 Apr 2026 04:23:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a7800sm4273291a12.18.2026.04.07.04.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:23:47 -0700 (PDT)
Message-ID: <11ba2f59-809d-4165-b4f8-6497a9ff8f7c@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:23:43 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Add ADSP FastRPC node
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260403120753.105869-1-mitltlatltl@gmail.com>
 <66e25445-e7f8-405e-b208-e69b6b401f90@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <66e25445-e7f8-405e-b208-e69b6b401f90@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwNiBTYWx0ZWRfX1CNcJga2eGop
 PNbMmzaoP5l4qUTnlHobjON8thGwu4w/v2nEags9cFGvppE1+eiyNOimhQcTh6j25dApYQ4oLDx
 E0RvuoszBgcV2cDXGqTIFiR3dnVXA4Ff1LnyHs/tJM678WZXCCcTIabpQu+MzyVJOo49PeGbcH8
 bYA1VCORU4h+YECojo8zr6+BmNpSVDIgbB8FImGUNNSAZS8tvIh/+R+kIQR7svPYOBJdRVvWK0D
 nPQmGnusbOhsbcElcUNxflIcPDPRSZHe/NbmhTqtTTrAN7NCljdqIqwIpfZQNtEZlEWV4PwRCfq
 fbF5n+5kct8zARsgz+hT3kNZqi5mU86M2I3my32Z+dqTVtPo7ShSDEEiAuRZiy6Dmoo8rMiI0K+
 vJMd3cvfPBWAy3nmZybNKHfgAZEySwzfH1d9QUzUnDvjWzANt2SK4hkChkuFObxOmOeCCLezn5s
 47ZmrOJvN2yMYdMYACQ==
X-Proofpoint-ORIG-GUID: Qqbu8u2MrXiT7Rk2X5ssn80MJHA8OqbJ
X-Proofpoint-GUID: Qqbu8u2MrXiT7Rk2X5ssn80MJHA8OqbJ
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d4e945 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-RCL7HuMZfIX-v8wKUsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070106

On 4/7/26 1:22 PM, Konrad Dybcio wrote:
> On 4/3/26 2:07 PM, Pengyu Luo wrote:
>> Add the FastRPC node to enable offloading compute tasks to the ADSP
>> via the FastRPC framework.
>>
>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 27 ++++++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> index 761f229e8f47..ee02acd18856 100644
>> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> @@ -2966,6 +2966,33 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>>  				label = "lpass";
>>  				qcom,remote-pid = <2>;
>>  
>> +				fastrpc {
>> +					compatible = "qcom,fastrpc";
>> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
>> +					label = "adsp";
>> +					qcom,non-secure-domain;
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					compute-cb@3 {
>> +						compatible = "qcom,fastrpc-compute-cb";
>> +						reg = <3>;
>> +						iommus = <&apps_smmu 0x0c03 0x0>;
> 
> These are SIDs destined for the CDSP.. (how) have you tested this
> patch?
> 
> +Srini, Ekansh I can't quite decode which SIDs are "allowed" for FastRPC
> on Hamoa's ADSP.. could you please help here?

As I hit enter, I noticed this is indeed not hamoa and these numbers
were just coincidental..

The patch is alright

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA1D25B2F4
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048617; cv=none; b=KlHAtkDXHYtaG9glSBvHzfiALskuneTQLIZegpT+6XaZp058hytS0fLdEOPLC1h65dbRjXQoDY+VZi7HRiRHM+ap2CWTslFQCCA6GgeOJjCxb6utCjWvyJ9yr8/R197BqA694OSSYa7+jlg5ajNUidxeUVbO801lcOmO4J0r08M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048617; c=relaxed/simple;
	bh=8cbUGgsxKSC1MosOzLSv58OI0oScNcI0OsWE55RtOVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R39d7FQaCmH4bzv2Alu0DtdRMJpz0odjCa/SbAvXqt3GXfxejHMScgjwpPAhWrQs1SdLG0VWtYaGx7F3FcVL3wMBkZZxRbvqIliCgK/IygaNETNUp4PiFzBU8ku5bhHCBDTBawsq5FCM32+oLhg3ADgbtn5yCYyeE8/a1B2L1Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RwESrxfL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iL+Auq3W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RwESrxfL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iL+Auq3W"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65L9ulkX1844154
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zcGFFDhIT8I2MwEThVaHfMmLB4gR8uedol/bFjJD1CY=; b=RwESrxfLLAWZnKhV
	F0wWz1x+iRvrtEs/NucURh27ygXAkr4I2W+HtExNf49hIa2U/vH8qHbeaxWRFWXe
	WBz5flDCqDcqVN65c1/2OXx4hQw+4YlCEUjRe6+tZ2qx99LY/XJFPeBOEX1aUzHF
	rUwhzuUMaidJbDeKwjno/andMMNquZPoU00+nTa0hrl/dzc+imkmTbdBynJCdwIy
	sod1Frarz/7lCOq+cTDq5EYPMFN8vk0jWPhj0hbYGgN2DRWlA97W9+XSV0cLUqMH
	4oxJOBC7gVlZjS0cogQRLV4PxNZP5D9fwMoOxqi4KcbfMLA0tfI00tLoM+cPQnC2
	J0jHqA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewj6h368v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 13:30:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c73aaa3643so13479185ad.1
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 06:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782048614; x=1782653414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zcGFFDhIT8I2MwEThVaHfMmLB4gR8uedol/bFjJD1CY=;
        b=iL+Auq3WnLMYw/9GTFsBWBTfukUg1FmOTzlwLVU2/AhuKHHlvZn+nycs4NXyd7vSb4
         R8utCT0UXINZuJUeRqSZAcorScj5lN/7VwuQSSR5KrhJnDrZ8rq8BFUJavGQxnElZgTH
         hJeOzVB0U0+goKsZgw2eYpFsaZXQgNPC1LpyxZ2Aa25/Ob3WUUSa2s//r8nhcvtUxJo1
         G5cJAj1P0LJKQ0FsdJrMOQ05BO1SJTdo8TBmVpSKP0EgFUVsbj0qxaUeQg3YVLj/Dx5/
         RQwpX2SftDQJ+qPqTUIv4kMi8xR+YtVPZ+HrOt1FgWoNbTM4CuTceCnkKNHJ7eaKNwGR
         S5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048614; x=1782653414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcGFFDhIT8I2MwEThVaHfMmLB4gR8uedol/bFjJD1CY=;
        b=Et2eowEeEGnygOLvA+VI/QFVZDkzrG4/VyK57jpUr2X/QtiF7DJw+07iQSrQOPlmTI
         xDcLx1wXjO1dyKLFFC6C9NQuI42SXzbadcQXidVpFF7ntLvE4zCSXr6tWovPQ1kudwgR
         ZOCijvX5uWSsFzsVhouNDLpZ6U0Qss8WWNW1MZ2sc3HBBpc++JYEF/8wkbWgHFVLDFad
         SmpnkbFw26jMQs6B1dYWaseIHAValAv6WSSzSjiunOIa5hCwqc7rNhAo4PdSbDz9V3i/
         HBsBGMjHFNGG8/FzQewWCOoV8lTLZpGm60hGhLOeW0yahzBsYJ0Panae8Nj6a9kDNJWH
         20iA==
X-Forwarded-Encrypted: i=1; AHgh+RoiVtkDjpzc1lBaVNzbCw7Q0tnmgpJKBS/rpWnYJjGKPpfs8ivWG8HBmOvHkLNA7KujBXMlwl19nVvz@vger.kernel.org
X-Gm-Message-State: AOJu0YxXbwzhkm7raW2nubw328BjGITSjrmRqFFpWvsIJIZhZr+iXTpl
	KZWVF6SatvlWRTwS2Qi7PnDLNFq8rl6hE43nUNMjziiynfDpqEvSqWs84xSPbiXWVmRgA8Cl+HE
	L1UnJlu2dQVgUMC/cdEO6kJ+mdrkfd748/RoLQVXfYQ6Z/9XiwLqRcWyqCiBb86oV
X-Gm-Gg: AfdE7ckjOnat5/RFe++IK7h/SzTTVUEaMXohXxlnjsFivfqlaqWDVUg7gDGnAuY91C2
	3BXy+MQbxGy+Dowt0Mv71nszHMADMKbk+kSflzXe6unyyngTu2PjUQD2jCyy39e2iVXjuzuRKu+
	dPFDavvoXpzadcZEok1Selp7M5ooNrPPaNIB6+gx7QVS71p1e5m41Bk+rDibvSAyBzR8pmMtYqr
	JIr9sbAf3Qr5uZDCaJt8VwEziPiBqnUrZ26rMKsHwDBo4t9S2s0I+fV0dzreSDWeYvru8Hd1S7h
	bdoHvlKEgIv/RVgJ4t/cig1RDOaWMOL6DkTcAru3XtUJsq77aDI/m49/lxoUhPOH+r79VOq+D0Y
	tAGkRPZYym8FwcvRYnoBnwk/UkJmU8kTxLSUZcUbs
X-Received: by 2002:a17:903:ac7:b0:2c7:9b17:668d with SMTP id d9443c01a7336-2c79b176c3cmr2748495ad.2.1782048613800;
        Sun, 21 Jun 2026 06:30:13 -0700 (PDT)
X-Received: by 2002:a17:903:ac7:b0:2c7:9b17:668d with SMTP id d9443c01a7336-2c79b176c3cmr2748165ad.2.1782048613351;
        Sun, 21 Jun 2026 06:30:13 -0700 (PDT)
Received: from [192.168.29.32] ([49.43.225.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7435bad30sm48870885ad.12.2026.06.21.06.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 06:30:12 -0700 (PDT)
Message-ID: <b4fae057-08bf-459b-a482-33ec81d88c9e@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 19:00:03 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/13] clk: qcom: dispcc-qcm2290: Switch to DT index
 based clk lookup
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-6-8204f1029311@oss.qualcomm.com>
 <20260605-aspiring-ambrosial-squirrel-a7ef63@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260605-aspiring-ambrosial-squirrel-a7ef63@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfXycO3M2Bk5M73
 elJQjyE5pffFLlEgS/Kkp7jihUL+36sJdd4Q12aRkPM5jy7QVXWKs4laWhaKPArG37hWwkAwUq0
 dvuONS6QQ7H34ZBPXAaTZKz8bfr9YxrsK0VrSqBXOjTmtEX2V18nPB+zzMBFcXsUZnoXESRwKAZ
 QG2FD0gU3tMjjK33pWrpUDPUqgcQLHPeJ9lL2C7gXt2/X0nTJJeteG3k7P5REPlMaO+02XoTjlE
 BRZIedw5arv89283xG4ag0Ypq0XpwtGuizB0DIwM769P95WQjDTJkTEdsxvukCEV3YIv3PFXsLf
 og8eeji/Yu6l/owcmb/9vQ1cXhUnqfRPnOE/CLVCocbx378b3/NNdx2YVQlv8tKuEw7haCOSDVt
 nvWGnJHqTVxOFUYCbx1WylEF9s+YYqeQPYOg+dbm8UrrRGoj5svUYrr4slHyPQQm3hk6ZfBIwmI
 08CEf9T9d9BhAOTMiAA==
X-Proofpoint-ORIG-GUID: H9Vlv0-0c4FaXfLqzOtlOO8YQ-0S2-OK
X-Authority-Analysis: v=2.4 cv=E7P9Y6dl c=1 sm=1 tr=0 ts=6a37e767 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=HwFTmRh04JSsUSWzyQ2edw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BjiN3Y7BKkz1kp-VNcwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDEzNyBTYWx0ZWRfX5x0EnQuEX3Sn
 U/E/4cR478mjyKShDY4IFiJq2haVmDhzG1GbNzBNhum1EomKq/0bzlr9b7N4x8vUUJcmcf7IqNC
 Q79D/6mf6TO7KEhJ1P29soTOC1z+cy0=
X-Proofpoint-GUID: H9Vlv0-0c4FaXfLqzOtlOO8YQ-0S2-OK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-21_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606210137



On 05-06-2026 03:58 pm, Krzysztof Kozlowski wrote:
> On Thu, Jun 04, 2026 at 10:56:12AM +0530, Imran Shaik wrote:
>> Update the QCM2290 DISPCC driver to use the DT index based parent clock
>> lookup to align with the latest convention. While at it, fix the parent
>> data of mdss ahb/mdp clocks to use GPLL0 main output as per HW clock plan,
>> and update frequency table accordingly. Also, add the DSI1 PHY PLL input
>> clocks support.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/dispcc-qcm2290.c | 44 ++++++++++++++++++++++++++-------------
>>   1 file changed, 30 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
>> index 1c21267ae0f7a86c1de88e888c2a990c35f0a0e0..f5dbd19d0a0334362a44f91a69229cb0f018f309 100644
>> --- a/drivers/clk/qcom/dispcc-qcm2290.c
>> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
>> @@ -24,6 +24,18 @@
>>   #include "gdsc.h"
>>   #include "reset.h"
>>   
>> +enum {
>> +	DT_BI_TCXO,
>> +	DT_BI_TCXO_AO,
>> +	DT_GPLL0_OUT_DIV,
>> +	DT_GPLL0,
>> +	DT_DSI0_PHY_PLL_OUT_BYTECLK,
>> +	DT_DSI0_PHY_PLL_OUT_DSICLK,
>> +	DT_DSI1_PHY_PLL_OUT_BYTECLK,
>> +	DT_DSI1_PHY_PLL_OUT_DSICLK,
>> +	DT_SLEEP_CLK,
>> +};
>> +
>>   enum {
>>   	P_BI_TCXO,
>>   	P_BI_TCXO_AO,
>> @@ -33,6 +45,8 @@ enum {
>>   	P_GPLL0_OUT_DIV,
>>   	P_GPLL0_OUT_MAIN,
>>   	P_SLEEP_CLK,
>> +	P_DSI1_PHY_PLL_OUT_BYTECLK,
>> +	P_DSI1_PHY_PLL_OUT_DSICLK,
> 
> You just added new parents which looks like clear ABI break disguised as
> "switch to DT".
> 
> First, don't mix independent changes. Second, ABI changes must be
> clearly documented and your first commits even tell false statements
> claiming there is juet "extension".
> 
> Did you test THIS EXACTLY patch on existing devices?
> 

Yes functionally it works, as these missing external DSI1 clocks are not 
used but present in the DISPCC hardware. I will split the patches as 
suggested.

Thanks,
Imran


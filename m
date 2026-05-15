Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DBC3D3490
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842507; cv=none; b=mCJJI6coGnpgUqmuDbcHusZ9Ny6saRQRsDGNGKlVYwj+P1ejOdqKaNflKqofYgCKekHslCUWJ1MlCZ4lYoYeHRLweFT6MM2euQ4AteY67v3+2Hgr2NArKmJ57EeE69cH0aYI7/G9Y/G4z7vsioQot4fUw2eBHaByYDT0bQmek1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842507; c=relaxed/simple;
	bh=yXfXXimA8X+vL4ZsKrJ3lcwCMHkt/q4ZW+DDphNis6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fxQTuSlJebz8F4ZpvCKwWllFhsm9sWoa8XMBtcJ3mOS6Hns1bYv57tEvyTLOOgEzxztyAlbxB7WkeNwRABf0IM3OQ9S80mxxg/WuaIpwseV52BBp4w1RF50f46veScdakCwkuy+WtR79PT0S+hhVegfaZ3RIh6IkFEqroGZMWVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ohAo0TdI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WOAkdXAb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ohAo0TdI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WOAkdXAb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5NaqO1848082
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	An1TIxkYX4OS8z3Aw9x3YixozpJum7wSln/a2elX8wk=; b=ohAo0TdImNvYhX4m
	D3AF7Wtn+gfgHgn1VclkE7+WnyJzUrJcf6clQkwwL+mFL4vesUyyQAk9Tv1CS9Hk
	/7np2AgTmAD1y0AEQTzYafKPrqTCWrWFBu+ylky8N7TtLiEore8197Li8wytw2iA
	V+pCve8TZkw0YGutOzc/JueJ95MbDY3uisQbbDa95atjcPyJfmarPhxzT77yYhSJ
	AWZVIdvoLzWJcEEwA94cVQ7doDI3xdAt1Pz3WhFxX1vK/ZxuQVi1kM+WzJ92iOGb
	kBQGq/IHQF+KcYNq25NXBQFshEf/wlmphudZp516SOsyT+I3lopQEfcKRQ97NFQc
	80vteA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1t2vwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:55:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d840206c3so21303181cf.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842504; x=1779447304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=An1TIxkYX4OS8z3Aw9x3YixozpJum7wSln/a2elX8wk=;
        b=WOAkdXAbiy/9xELEBS2QbpJQqEYb3iK08mJALLZxJ57i59ZXSHmhoth4ntK+BWwz1F
         fCQPFThW/2bRz5+9sVEWqO89tqIBPa6ONu3Dtx+cww5oiMcau3H4/KI21l9YjTqN1abi
         O+kv954NFaHhg3b3XFWR0Y2bJQYJAD3rRRMOcmXWx814appZL8BFeJ9xw6u8f5IUjaL/
         +2TWZ2VxIxHVDuDBz20fD6yczyc38R6e0DAcDbxsz8o7s2dIQnAmGxEtFiBnP55mFvTw
         CqDpG1f85xZlAY4G6y7kyHGxDa0T6PIctILx2d/76mpa0e/PeKkKMQEX9n1DjbJ4s8+I
         mjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842504; x=1779447304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=An1TIxkYX4OS8z3Aw9x3YixozpJum7wSln/a2elX8wk=;
        b=kO+UQzB9mBL2NjOqMIg437NY7IFF5PM6pJaU6C9Le5qFgkBoc9ITvvJSRb1L4kJnbH
         R4oEvPlmnPX0BlYfmMBm7zeNXW/n5yeNzHCwkYfqIggPL23BWV90SCzQqbemD8jh2EvF
         9M0Aar/tYMI/rVv9Su1xC3Ee99Ul97dwJ4vH2uzYFIriGaajB0/7ZhY5NJG3z+YJg1Nu
         lxaRCcUgYSAdyXJkGSHYsv8VZ1Zk3jVvQqq/vZYvaQ4A2mF60JxLB6p/qc/BRoPQhdoj
         wgS/uhZQW0KFPhtu6+OQfGnTvNjzo1SHtXkTaiGd2CX6ZNuNKIA+2awHhfMIdOrEFV8I
         LgMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/FIGC75e3Uegyk59GSwJ3uJdOQUyJY2FqtK5Vw0tSwbOtRhkSBfN8gml+u4uDdorgMkkSbaV9/Phg2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0RFlvHQYo4sXENI6b3olxFapRiNhkU2BgEO5JiiP9SGTJb0vL
	yHzn5nQwIjdD9qSQQ6/WlK5Fd/7ehGnrIgG+vYc94IC4gK8uZ13Mi/uvUzAtPh83iAmE6hLPemN
	XucB28aje78mYbdNvZ9j2Wgsu9sgIDv8qjW7ta/bX6DleIAxB2AbNwktJXPORpE8K
X-Gm-Gg: Acq92OGYCGjbViLtDZba2hne7hjk0p+DkDmqAHCOwtTFiimsWUpO9GWFo7qk7ZjJxzB
	dqF2oD2+AWfWjG2LFACHR/0mAWU13F0x/R7jp9bZU7oHEth49bfZcTfe0L+wvJQE0p99WAbkj3c
	GVGkhcoZYzmgF/DKcbHKCSbuZWHkFBKBXpde9YpmnRdD19owh+4P4UYnlB2QwhCXlIdCTJe92Tj
	haYtLtNfU5ojYWIY4LtSzw4ThPkD/4WyLAPaB7+1lNAVahTAko7g56LgCTr1mcmPWYMGYzTYkLP
	3c6M4BObM6I9TO1s1jKK5vb1R/brgxkQ97G3ypzpERgOXg8o9jQjJOaJqfRa81YoTXI66VCpogU
	XEe7j8vbLg+Ip3Ys0w6vRND1lhvanvH2VjK0HbLK7lu+zaFSTyxhS9hNHaW35LTX7AkSYelX7dN
	9Qd8g=
X-Received: by 2002:a05:622a:11ce:b0:513:43ce:eaa3 with SMTP id d75a77b69052e-5165a202f87mr32475841cf.6.1778842504102;
        Fri, 15 May 2026 03:55:04 -0700 (PDT)
X-Received: by 2002:a05:622a:11ce:b0:513:43ce:eaa3 with SMTP id d75a77b69052e-5165a202f87mr32475621cf.6.1778842503694;
        Fri, 15 May 2026 03:55:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6831197bf00sm1859986a12.31.2026.05.15.03.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:55:02 -0700 (PDT)
Message-ID: <f8b45439-fc19-4a4c-a2df-93f9071ac77f@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:54:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5210: add watchdog node
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-ipq5210_wdt-v1-1-870c4b7f77b6@oss.qualcomm.com>
 <1b741127-18ef-41f8-b645-707083d7a921@oss.qualcomm.com>
 <3a6f613b-07ff-4efb-8bf5-71e397b15876@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3a6f613b-07ff-4efb-8bf5-71e397b15876@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D7Z37PRj c=1 sm=1 tr=0 ts=6a06fb88 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=A2fHVZT_t9Wzl9UUSvUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfX8CWAwlgFs2ug
 bmubNaH8visZr12n9EPZ+luL9Gv+4Qjm6ZsBBYxCmsG+MFzz0rZKrofH6qNoXdGwBm7WlYgtGsL
 Xe9I1lZDheS94Ralk7/Pkl3gROgackSzm+ZwDR6Aq3JQcN4eQxTvw2aYXVUkKrSMpfpsivse2ly
 YyZgCrVD8Ap6C79oGkVgOZrHpG8Z0mtmTYH+JNU5ZyegwyMobUB+cOBVaN34ZZhW2VQBfr8QJkk
 4b1RyfGJken9LoHBp5SpskMMvThJulhBBGooA5AOVPrdSRJRW6BOMe/OwuQn05bCgCt+gDKmo7X
 DfA4QINOitOClQ7VhhaIiDCUbKI5w2v8goJ4+mz0fsvMYEMFd/luwozP0qV0o44+iZchv/JCv8p
 alf5r1axWNRw5Uo1o0XraWD8pLfCT3vUCiGU+8vs9i6SnL3k0lXzakddasw9bdHGn3Q9HgOJeol
 UxlrAU/d0E8meGgAK4g==
X-Proofpoint-ORIG-GUID: Z3-hsqRPT0gsfFS3eWLy93GPUOQrpJ3d
X-Proofpoint-GUID: Z3-hsqRPT0gsfFS3eWLy93GPUOQrpJ3d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150110

On 5/15/26 12:53 PM, Kathiravan Thirumoorthy wrote:
> 
> On 5/15/2026 4:20 PM, Konrad Dybcio wrote:
>> On 5/11/26 12:56 PM, Kathiravan Thirumoorthy wrote:
>>> Add the watchdog device node for IPQ5210 SoC.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/ipq5210.dtsi | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>>> index 3761eb03ab24..2cdc10529c48 100644
>>> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>>> @@ -236,6 +236,13 @@ v2m2: v2m@2000 {
>>>               };
>>>           };
>>>   +        watchdog@b017000 {
>>> +            compatible = "qcom,apss-wdt-ipq5210", "qcom,kpss-wdt";
>>> +            reg = <0x0 0x0b017000 0x0 0x1000>;
>>> +            interrupts = <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>;
>> Are you sure about the interrupt no?
> 
> Yes. If you are referring to HW doc, it is incorrect. We are working with the HW folks to update it.

OK thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

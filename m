Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0141E8332
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 03:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774840750; cv=none; b=mFutuupA5SRXqEUEdS9sOyuuYf2btb6N3nNlAf2995dbn8fBvKDrvKUhyZoBgJPGw9c+4ldCjGB1tRyPJyFPORNzGNmu1/8q+X80bR9/34G2QG1ddOgvAyNoOQdjoIi54nogX+G60jWfo7P2pLU+WGUYukxFnjuq/lZf/pq8JIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774840750; c=relaxed/simple;
	bh=x1Q0AEyfkGsRy2wVqZKRt/iZkHcxP2JClu0ZvmSbrPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SObqDtlG7hz9QSC1lyWAmtTI8hMsdrz6uLKiOhQgODECVY5b7qr7qw4eUN0Yr6rrujL3ii7HjwURyRexcRVI4d+JhhZAOqM1aUCqwxr34x7Id10TST6IE0UfybkARNccDdM6YR20IqVrCrI7bY8bJfcCtkr8MlU9bqFZ/3woaFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+w0k5C0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QrzigmSI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+w0k5C0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QrzigmSI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TLEMtr3783209
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 03:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pT8UfJxWZ+kyLM3PRyRbZ4r7PM01E/No2UWdApRLzbA=; b=U+w0k5C0RYl32Vc5
	ejj1NloTv41CM2QTDgYhcjjp2Hs21FNvvHyjv7aItlgcpyH3So08trJWUoNL7sJg
	c8fWjI61hOgy9KSIc4Qb5XviCXLjfcnuaGLaX2Bo1r+NP5+zTsySt05qJP2hqnWa
	wo0mmcEDb0g00SIa3vha0xQEYjbfppQvhIRN6zuC1lUjC8tM2k6hdiU10lZkQfuP
	9XFDP3fQHPpaDAkjnU0OSnxG2vIpI2h9keVG57nHzISAE0oJXaRGSQQni63dtLzo
	Sa06IAEcr5COCHcCFEFFB5K/Vogd8J/3N+JP+AIfC2Xawk9iqqz3/F2QIyFORChF
	hDJ8TQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66afv8wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 03:19:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0b0aae381so53630775ad.2
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 20:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774840746; x=1775445546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pT8UfJxWZ+kyLM3PRyRbZ4r7PM01E/No2UWdApRLzbA=;
        b=QrzigmSINErPB5jJ1atENv5d1u+8Rgi07nThk485p0+zKpCBnqjYo938akPVo1TzLq
         /aUH9pGkYhVbyhElBTY5v15gnF/3SD9YY3h0ku0YLOt2mG5cTg7NREou/3k8OgLEI1PZ
         kmWCB1kScatiKodF25ai+XVJl/iUBaE1cBVexT0dF8YsqxqbcWOhSUjnsZUPH9HrZXrb
         //w/WL4fVNaPrnFzFJ8lIBxK1kjTvkZ5HluPplR5WatI15OJoMraouCd+uiIWqPbBe7V
         mYf+w6wzVfxqt4ewW//QKoGzP/4x+2WC1Nffl2hf3XQXzExQjKzqtu8ztfZ778mSbxRI
         wCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774840746; x=1775445546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pT8UfJxWZ+kyLM3PRyRbZ4r7PM01E/No2UWdApRLzbA=;
        b=jCP4JmVcYs2OJdi9JPqYAzPJm3Gq1hLACtXbhXMhH17HP/xZsSCvFyx1ktmR5OVXSm
         nEHgDfolbckrDr6qFStzE1CXSHBxXt0zq/xMhHHaOdAD1EfqL/7S6DhWXkvOIlH3bRFO
         SXpHij+Xyc5uznGNzK3UBKZrfwd4tbtcgef89iD2JdZrtraBDOH+19aTTUxAkeb+LxVM
         dGTgiiO1qAoE72WWwNw79MYXdBRJGNeF3lspgbgtgCOJ329kIQ+l6Ox7NC27IbN1yB9d
         0wUzXjlxFhYPY7wwjJ4jv9fPnrNww5w/BF83FC/xlgGiJkcGgM7h2otBzw/diVzkNow4
         VRwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPdlrSgEhgDca+xF4J+8IID/LYk+hOZWDmqQmc8Mrnv8xX3bv5XFJf0Ubr4h+50nKv22SrzZYIXdwP@vger.kernel.org
X-Gm-Message-State: AOJu0YxzjTW13mXDWgL98BnU1kV2Fp5DIn3/PSUD7wqvGsbbhTJ+xMwq
	G/BCU2f4+DisjTy1sacw0BH8TR5LQUwcR3Fg4c3FMMx0V802O6DFvgQJ8Lq6kto3bNmxNxHcgsI
	2CUsUvJD2TKkQV2uR0D5UAkhsQ96dOSP7Qv61pVPLw7MhanXs3zQ/XBmEQZvHBICS
X-Gm-Gg: ATEYQzxYk74R2plpnWa7yAnSmB3XMTWpuJHP4GVxfmDEiFWswWQN6i0IotpUR9+DEvR
	TqFJUJwxe2YY7qRfyQb8PiNj2HLlW5OZZqmm1ZTgFE96RsL7+fLc/tlZbAV4AeHG2M3mm4WsFDz
	j7JSKYCrC9y0HMSc0FggYQbEhxkchaUXw1+QflPXRgP0vSf/c5SLung0f2L6av3wktHW7Nr7g/J
	qX373GxWe+i3JLfGZkdbmNWWgTWVjoxiNNvXRBRHY0JjP4+gvKYdWFsTxuq8QRHziP7KjC82ToM
	SVqMdVsM4fO0ad076+uPRutJljj8rix7dTbrjd1H6ellx2Md0SSzBDZCM8QL1aAnr5erdVrddk+
	w42oFAkexA8N9rmDLPWXv6HGzKa/khXg+4nj8x/1ckBbuDxQ0zKjf4ijrVyUeFke5qpC33mNEkz
	vq16pl4QzPladHDso=
X-Received: by 2002:a17:903:46d0:b0:2b2:50e1:f108 with SMTP id d9443c01a7336-2b250e1f633mr26924055ad.49.1774840745813;
        Sun, 29 Mar 2026 20:19:05 -0700 (PDT)
X-Received: by 2002:a17:903:46d0:b0:2b2:50e1:f108 with SMTP id d9443c01a7336-2b250e1f633mr26923685ad.49.1774840745349;
        Sun, 29 Mar 2026 20:19:05 -0700 (PDT)
Received: from [10.133.33.43] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642956sm65575025ad.6.2026.03.29.20.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 20:19:04 -0700 (PDT)
Message-ID: <05719918-074e-417a-8209-cbce9d49d94e@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:19:00 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: kaanapali-qrd: Add SoCCP node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com
References: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
 <20260326-knp-soccp-dt-v1-2-a60c2ae36e9b@oss.qualcomm.com>
 <bb03901e-5054-44cf-a150-6c7d5ee0f78a@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <bb03901e-5054-44cf-a150-6c7d5ee0f78a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OrE9_zgil7dEqm5rZrmwiNBhE21YI8WF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAyMyBTYWx0ZWRfX7rsg5xI5eh/v
 5Jq+mdpX+SoFVpXFYFv1ibw0Ybj/XYHlMKpDaeZgOHlFFrNX2iA2vnD0xoJh69JyhX+xnr/LTtg
 f8gklTUQtdYGsiGU59Ho/bToWpPKYTmUHUpnSMNUOZtfCCb+D6cm2c40djaUnVhS1dlEb1+UO2T
 uPkjFxg3KPek4/mQNaPwdyxgW1Z9AhFm/3DG+SZMaxdRsXJ9Bxy1jO2dqJ1ulhVs7iW+w7jwNl3
 UjMZNxk9Fp4cjVj7Lq56jEsKshHQTmPlUzh/Fh8dT53dTIcbyeg8lJd77WaOdqUgqmH6fTtGE6h
 RU85ldzvhGhgFOQIjcjvInvwPEMOlzCzwhf63zsuWyWL66818gDnf4aicPcjsoD8YFTD62qK+M5
 krESbaYBbNCcj76n0RKrM1DJHw1biJGcl3eWqxx7wKilyQEGvS9K0hqW2vhE6MErbtJAO6HbR5x
 B+1AyHoiq3Go3nOCC3Q==
X-Authority-Analysis: v=2.4 cv=KN9XzVFo c=1 sm=1 tr=0 ts=69c9ebaa cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=K_kJy-3VoAIDHo5jem4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: OrE9_zgil7dEqm5rZrmwiNBhE21YI8WF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300023



On 3/27/2026 5:53 PM, Konrad Dybcio wrote:
> On 3/27/26 4:20 AM, Jingyi Wang wrote:
>> Add SoCCP node on Kaanapali QRD board.
> 
> This is really more of an "add firmware path"
> 

will update the commit msg in next version.

>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
>> index da0e8f9091c3..6a7eb7f4050a 100644
>> --- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
>> @@ -781,6 +781,11 @@ &remoteproc_cdsp {
>>   	status = "okay";
>>   };
>>   
>> +&remoteproc_soccp {
>> +	firmware-name = "qcom/kaanapali/soccp.mbn",
>> +			"qcom/kaanapali/soccp_dtb.mbn";
> 
> Given that this contains battmgr now, can MTP and QRD use the same
> firmware?
> 

Offline checked with the POC for SoCCP firmware, MTP and QRD board
share the same soccp firmware.

Thanks，
Jingyi


> Konrad


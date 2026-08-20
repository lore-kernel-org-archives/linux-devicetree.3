Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6F8384CE1
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 05:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787203521; cv=none; b=GyAhjwXnCnlLmplvorvk1INn4vr/JgJKEagnDqqCJEJI6B//qgtKo2YBvaZzmDVtJXp5tBFAOC1t7tSFmFCwjHw65ZB8wc7cDp6Ia49kJbigm1C8WNq1p/VyOBL1DD5PMvGyvCQnBzklAMGsOQgEnREFuxbLXiloz2Zm/fz4khM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787203521; c=relaxed/simple;
	bh=03XE2jy5YXdx2eEWUFRL9mB3C5+BD+He3V3ymcwsAnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DvEGi6q4FowbR0oHDMahmLTQyoC4KzKaafXer9SVnPXylRDPWTokqrOwEe1+1401VeajFIvXEvg4KhHfvna75aL1P7TcYvPUg1CXW8e3tfJYDExPfuoi3Hj0AcORnw2Y83sLv5XldMDIpZf5+kn976n7GZkT2uHSe7EoCHB9JbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cj7nvvIQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fm30WuqY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cj7nvvIQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fm30WuqY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JL7Y1g938722
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 05:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bsZsZ85fdqpazBfwsRkhB0mMT2Vfto+3/6fl/0xfrzA=; b=Cj7nvvIQj7ckN1WC
	6VXotkIbDQBaXoCbqs6PhA+Q+VdM6mfwmRqKDWrdhokLhlivF7t+pWqpBQ9ZSv3y
	HoUgkm9Za39oN0Rkw5MXmI+vlB02BHaAgwCCE8FJW1cuwcZTWpwmepsjm0f/Vxpc
	qZm4NmCgBkfMEgJIukO1rTtr10TzwnfvMWvrRYYjcSEUzys1teDjzgDKwNVB1dHY
	88GGuMY/Tm7Ge1i8QBKuEHGduV2PmO9KwjpYJpO5wIvs5DEU7zbO0YteVCA2bbPM
	d0E2qcsI0K9r2/4XPcaa9emcpiFbebsdr2ihD7w+Cxeq0nGzaJoRS2WLxrohzuMq
	/ILeMg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5e5d3fdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 05:25:19 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84fa3b14ed2so1667677b3a.1
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 22:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787203518; x=1787808318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsZsZ85fdqpazBfwsRkhB0mMT2Vfto+3/6fl/0xfrzA=;
        b=fm30WuqYgbE+nXKKK32EHFCoDBtKP0JtuvslUqHJQREIHswcvNzKc498mVj/HwGb+a
         tV8BXLN1LsOk8fteSeTcJ1TW0ZP7smO6nnBXapMgY4YB1nh/oLvgoV49U/MSlpPbtIMp
         /KeKx3rka5W+qtOkgLcB1GrumWdyZFV+GEtge0KsgkNrYlSMV6JT0Z5FqPkgG/6iNpOS
         T3a/Nt41IEuRHgTJdoIVtHpMwEzuPOGPcDEmFKEHAPve/gqEzkzY2ea8YMRnpoZsR57v
         /3ryaad3Mi15vJHWHe1Yt5Qhn5ND3XQDczvDtyslM5lGId/TYtjqJstvBKTw6P18QCwr
         8rgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787203518; x=1787808318;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsZsZ85fdqpazBfwsRkhB0mMT2Vfto+3/6fl/0xfrzA=;
        b=oLl0lqD/dBt4BVn0gAgcTfoFwMMW2JqbZmBGJk6IoUEtV4pg3uzY338axp1kCdxrDL
         QA2RzEwJ1/hzuFVLSliH2dboz+WxVw+ZKzinFMSQ9JHCWlTb9nU56uqIojvKCIxhTsMu
         C4mwlrgDLG4FJm54ckO6ag6uYsog22iwB/Ql8vLXM1pHTZKf2rdbgM/LY/8vlf7RjXMM
         oPPjZBYeVARojU6NZLs30zjrtv2vTNoM86bfCQZUiAuOip+oDPYT47tuE4g58uK9k0Th
         O4DmPl85RTY2U0qbZVWNYNSsC0mLum90PQEf4Gf1L64AlQyM8uz6a3xFtXrQMCfKkVvR
         t0TA==
X-Forwarded-Encrypted: i=1; AHgh+RoMECuM8ntIwSY3EO4ojGlS/6oMGoP8hplKa6RaZQJclEXDgvu+CPKQTejeigU2rofj1ijsKdzV8sCb@vger.kernel.org
X-Gm-Message-State: AOJu0YxTwIFUJQ6Bva22HruHDDxdI1M87Xnr9PI6y8WFIdUUPcFDokHg
	npDjB4gc6CfhnkOUI9W/uTYcKumv40qpA44LUTM4eocBwyg4kR7l+XxEXCkwfrfVOz+vWiLURL4
	9/v7c+VB/oeZiCYZmH+uXjUEU+xDc/b3EklxDEcatQh2eXnW1h3+zHP3jTCBfQIhKV2Do40Yd
X-Gm-Gg: AR+sD10CpRpJC/Fk2BnDT0CPJJJSPzOUf6MwPPnNgA06tJ/i8pNZDiuvSLbYhDo0fuH
	z970h/7O8p0HRj7HKNq9UD5x9UkbgOGWt248zNxzx0zeTAUBK9J7re5T72R1zaBYtA1mAiepKBb
	GDj7QGXrBCd0bHbRWPbomfDsED0heY8q1DnTJUhSn4xnFuWKCv3wOswjrN09X+WetCzt8gx+nHB
	uVDY/cwjrpEDrVpjS65a1Qp3SnyEGJfrhXwPKDIGeuRbbrOKLIcwSnGBHXCX99wtWFginiMQNvR
	WM5de9qxHFs3gSu+gwG6esJf2X3xP+cNv8gx88AyD9+LtRlsrCOYKck9/orEvGvmAo59GlyqlAd
	7SOpjeqX03ZoQ/ia1qjIVEB0AwHRtsgGYj35NlqfNizCiNDk4JSbzBrL1r8mhipcU
X-Received: by 2002:a05:6a00:1412:b0:848:42d0:bc91 with SMTP id d2e1a72fcca58-851d38abc90mr16072107b3a.12.1787203518456;
        Wed, 19 Aug 2026 22:25:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:1412:b0:848:42d0:bc91 with SMTP id d2e1a72fcca58-851d38abc90mr16072052b3a.12.1787203517965;
        Wed, 19 Aug 2026 22:25:17 -0700 (PDT)
Received: from [10.133.33.27] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3640a4bsm1273691b3a.42.2026.08.19.22.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 22:25:17 -0700 (PDT)
Message-ID: <25c982a2-da65-4710-9412-e3cec66d2c3f@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:25:13 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: ipq5018: Enable MDIO buses and
 add ethernet PHY
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260814-qcom_ipq5018_mdio_pinctrl-v2-0-ff90d6605d61@oss.qualcomm.com>
 <20260814-qcom_ipq5018_mdio_pinctrl-v2-2-ff90d6605d61@oss.qualcomm.com>
 <ba2cd714-3da5-41ab-ae17-522d84f9d1c4@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <ba2cd714-3da5-41ab-ae17-522d84f9d1c4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDAzNiBTYWx0ZWRfX9Zb79uT0trkW
 iW9Pjft62w+DVGZPGznXQXQ3LdueKQ7XKWCIcBMfnfjjmYFTR58BC6z1aX5cfVjq1PyFYYWcFyb
 ncEnrkCZ3ntsYybF/Y6h3/Jr/kQantoGPZOFBnRDoQUwGvh1X3lfvfoV3QmOtCrqwH2MajSOaOI
 FPk0vkXpmScEQDRrYpeCsYVqMtW0PE9w2eB3IrMIRvzFBBIt7yx1JocFe53Nft1fZ/g78/c6q0K
 PFXXEsXe3CCufOyV5WsrjeCAqTZXy5xkdHKbQBkfSzQ6TAE3q3p5YU40CL/T9Htsu2PjIVn1uID
 G+9gHpUXWgwD65JRQy7onA1yo2f+tkTgsj7FCTRhSrcQKbZTXQ3Dvcf2b2TH60UhGXcnwOv60XT
 zJ47Z5kBRgboGBD+fSUrcrGXwkUeadXK/J1IKAK+bjs81gBrmNdoeWQkTQVe51l/wjdXO89OYHE
 4I/5SaYYRa3fJcob5jQ==
X-Authority-Analysis: v=2.4 cv=cuOrVV4i c=1 sm=1 tr=0 ts=6a868fbf cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=MPq_oieJxT8TesfsIL8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: TOU1K02WNzEsOR-Pt29241PLE6vRMJf6
X-Proofpoint-GUID: TOU1K02WNzEsOR-Pt29241PLE6vRMJf6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDAzNiBTYWx0ZWRfX+Ii+vBU2H+FC
 WhgHdZFuSdKrxUTPw05KlZApLBde78wac67BByiO3lfHd4X3jMf5nYs3FB3ySApSFmtlJ2cj4+W
 v4ZMLhgnRcIJ1mLRTeesMQVjFEhuvio=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200036



On 8/19/2026 8:42 PM, Konrad Dybcio wrote:
> On 8/14/26 4:22 PM, Luo Jie wrote:
>> Both the internal (mdio0) and external (mdio1) MDIO buses are present
>> in the SoC dtsi but left disabled at the board level, so the board
>> currently has no way to talk to PHYs on either bus.
>>
>> The RDP432-c2 board uses the SoC-integrated EPHY on mdio0 and an
>> external QCA8081 PHY on mdio1 for its Ethernet connections. Enable
>> mdio0 and mdio1 with a 6.25MHz MDIO clock, and describe the QCA8081
>> PHY at address 0x1c on mdio1.
>>
>> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
>> index 33eef92b19b1..aed8359b1931 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
>> +++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
>> @@ -30,6 +30,20 @@ &blsp1_uart1 {
>>  	status = "okay";
>>  };
>>  
>> +&mdio0 {
>> +	clock-frequency = <6250000>;
>> +	status = "okay";
> 
> If the phy is integrated as part of the SoC, is there a reason to
> not enable this bus by default for all boards?
> 

All IPQ5018 RDP boards use the integrated PHY and have this bus enabled.
I will move it to the SoC-level DTSI so that the bus is enabled by
default for all boards.

>> +};
>> +
>> +&mdio1 {
>> +	clock-frequency = <6250000>;
>> +	status = "okay";
> 
> Nit: a newline before status would be neat

I will add the blank line before status in the next revision. Thanks.

> 
>> +
>> +	ethernet-phy@1c {
> 
> No compatible string and other properties?

No compatible string is required here. This PHY QCA8081 supports both
Clause 22 and Clause 45 MDIO access, and its PHY ID can be read during
probe without any PHY-specific initialization. The standard PHY probing
flow is therefore sufficient with only the reg property.

> 
> Konrad


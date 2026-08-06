Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620553815FA
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 04:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785991067; cv=none; b=TrqS/aRT1mmQNSsyEv2J7tOni6+MWEv04EkmGovIUc8d6je3P/v0CBgMmO+g6SBeDyeUwS/rBdgtndz1CB/+8c8hzedtb4TbNbyLCrKeYEdzqzT0SiuHufrmKDcrLD8M4QJxdgi3xV0jbDTRl24aukR69Wcn1Jvasg4ZNBDoGHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785991067; c=relaxed/simple;
	bh=/VtCJrpZZzW7BSrSBiAxCfOZr/95stzHxElzigjjE1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RIR6Ds29fTLCLY5lqB7mj2d8bwg3iz73YUIr32p5PW4z7UrPygOJV2S1dhq0SVu/cJh74lH2Sfy89DbsbDXEpdriL/DMOgdxMNWifHXkZ2SI3kstsTL0ohFVFfhMGNmoFVixL2qwTXX/jHd6mH1/ua+dsI0nhY8j1nZgOSF7nmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bXaR/nXn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ciDm2l6L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bXaR/nXn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ciDm2l6L"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675NcMSv228150
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 04:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKCuK4lPjrolSSKXq1q4z7GCP0Jt0iCByxPqY0euOUY=; b=bXaR/nXnVJb+40U5
	qVoC408Ak1ZyOMFxmUw1dHQcyP6kKvCx0fXFp3F8IzelM3XjhrkcWqDMt+g3OrUw
	KRD+vYilatrnJUViNn4yYM/OWOyE0UvY9k+/tTX2aPnahMyWblQs1aUPswI0hy48
	1PrOEn1VuipVcyKyk29YeP3Sb7pxtAIMKEGtAE6i6rBvzrgUWtDgcucwvmfMW0hK
	DtHGkazPn/LaWm/xeHB7cqEUTWaTUY2HqllhFpOrJyQv9RyQ6vtAyzZBeJFU0X/q
	GCc/EFx6wb1r7FVT4F+NPww/TzdID9/173dXcOU3txFi2RtdUvxw6Ptd2iHrSLdB
	NnY2pg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv2r64cwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 04:37:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso1597393a12.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 21:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785991064; x=1786595864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKCuK4lPjrolSSKXq1q4z7GCP0Jt0iCByxPqY0euOUY=;
        b=ciDm2l6L4WTEyvuMyu6VxK9HQaNGZFGDgFfV5irnpd6UOGSgDdPXGsVcArTN9zWB+2
         OnblWE6aUjqeJnnivtzVcqVT5TxUWtIiPxvJG+iCXqYHtOYz8o2OPpeAcjd9hJDa6630
         E2El8NiJFFNhQN3kB4P+mRuMz/aEpZkhS1JPIE+2duhigWtTUytAF3YDGdBfEy+GN2N3
         WAPtMsggplnGxaQSO3ZENmoIZNbOqqhwnUJI9YyRmsUsKfhY8tERnLCWEBOJqICR1Jp1
         J2RrNMrzQCVsXw5dtKpUeI6bD+DtXQSRTVezjnlZCdTZA0dwYLtZyIe7PCdtuanbWhH0
         9+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785991064; x=1786595864;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKCuK4lPjrolSSKXq1q4z7GCP0Jt0iCByxPqY0euOUY=;
        b=doZIf4FhY3/ew+V+8FZ4PeopMbnozL/xU3Kqvna8dbht2Z4edqwWBDTJySD2FlYY6s
         hbFVOZzqlAZnXOM5WZ4jHtdqxFpBtFOlY2dMByVAN8f1Yn5liw02X3VxF7fwxi6ixxoK
         kR2Zg1p9r+UmmBkzF6c7fj45NdgHeykgR0EpzVVZgm8k/m+ofeQJyczjD2BO33AtGHjC
         EI10MX1vOqbDDrwdODDryCEMyffqr0mqkZZ7eNqmlL20GjbqOy15WHVO9XjIODJFlGZf
         JftFWaDUW2WiuJY9uZYapiJfWofgDFGDgXn+i1ohigREXvuKp3pQoOGD+nPLXNfp9/ri
         LAxA==
X-Forwarded-Encrypted: i=1; AHgh+Rqw+pcjnyurhQHWcrWwY3KJV/N+SV27jAUHM2mb+0BG0DdSZCjVwd1KTrTUO53U1f91XE6Y44mT4kBm@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu5ovG9M0lMkZicJj2FGt2tJPokILSnHWpbHqOL/YC99gfpz+g
	dFP3Yqpop2Pdiiu0GRXOX5DKpI/pygHmC08iOqSEq2L9PGP8JB7ibR9W/uxi9PcuP3LYOKgbp+5
	XmupiSyhwfqPHbDVlzoHsxWDmA/9JrdPeDl2Wq9wVBGWK7561usY/LdEsTne3Sy5Ek501csuP
X-Gm-Gg: AR+sD1121TIavvLMy9TRtLVBuNhT7dbPoC19zWSfQcy8YVmDhgzeKSzqC8Zmd+OEISq
	egrS7EE7R2nyOo5M7/z7eEHkxPAsjce3+mXeEAGwYGkd2Ibk6z72Y1DTTURyB82VbPN/i+0vygs
	6jpFZgT2q1Fb8VAAaJ4ZluO2FR37JoKeR0Lsp9WKGNUe2JtSbjg2Zcq1fZe06FLfJKG5Z9FkaUL
	ItgjM1Vi+QNFjtCOA8Ps3QRw/op81TwhhZlEJ36DZ1cC+g+UCW4YLLaD3SWhzrrBwB6KsEGJBC3
	ry/kyvt9d1L/0SqKMRiyBmj6cQz6fN7xiYZiKoywh0xFAi0ce6DczoUq6IwcfoOJoS9x7Ap9Xiv
	HtNDzzz9cbImDFeRVSo0ZvgCn7w8pUfBXcTxvFEIosomb1rdzqx+QLDHY2KRotuVw2n60wgILJe
	kT7Hi/iaAPZilR
X-Received: by 2002:a05:6a20:2447:b0:3c3:becb:b705 with SMTP id adf61e73a8af0-3cb85ea2ec7mr13425258637.27.1785991064246;
        Wed, 05 Aug 2026 21:37:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:2447:b0:3c3:becb:b705 with SMTP id adf61e73a8af0-3cb85ea2ec7mr13425226637.27.1785991063836;
        Wed, 05 Aug 2026 21:37:43 -0700 (PDT)
Received: from [10.79.116.175] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867bc261sm22329174eec.28.2026.08.05.21.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 21:37:43 -0700 (PDT)
Message-ID: <a84a7148-b072-4afe-be5b-46773dc008bc@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 10:07:40 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: qcom: x1e80100-crd: Add qcom,tsens for EC
 fan thermal management
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-8-771abd65ee1a@oss.qualcomm.com>
 <20260728183653.A8B671F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260728183653.A8B671F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WrIb99fv c=1 sm=1 tr=0 ts=6a740f99 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_6jWvf3KgIEAQ9HY16cA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 4z667EhViUq7iqpD_9Kce_3p30FBB-Zu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDAzMiBTYWx0ZWRfX5QCMzUJodNAg
 SMcmtX2JqIOHdbC7HTPUshh9VNucRvjXhUWXb/ZxtUgPnslY/1C/zZK7HFomN62dWgq4qOhcIYg
 2tMvK41+3+GdnT9e1PtobAhQz5QBkl4=
X-Proofpoint-ORIG-GUID: 4z667EhViUq7iqpD_9Kce_3p30FBB-Zu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDAzMiBTYWx0ZWRfX+hve1HMMl2ty
 TOTNb7xKS8QMhxrI3infx6Y8v8yt2hNB2UA3k6N/YtK4temaFszWoFRzF2ZoShE1Li1AlA8x1IK
 TVUL7aR5rUctV8hNETwqjciLr2PN1MLStRO1NzZI6uxjLL6SfexzRby1DRLytyDNnFJU+bM7rAx
 eaII6KH8ou7zKZWX9xnvVsl4s2Xq2XqRfcKC28XNQupuvB9SHQPuuJ4BqZ6w/DzY0kZdgL0vsL3
 lZBPgiYaoC0AgFzdYeV7aWkK9oDCwACB399xK3US9/yKpY6nBzA6EuSn8CQftc68cPMgRAfPCUj
 nHQfS9wLd/9zcQ1wfRDlu3r9XnEQfXUwTckZY1ouokp5yx4IrAhX38qHLLKwAjRIXl0CSCssDZY
 av0ySlIYN5HWFCAjeYsjGypd7PCNuqtti6f/LYmQOQAj6aOUqcTp/HnbXoXbC1zfTx4LCE6HZBX
 Tnu3rVWIGx5yXxmKwtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060032



On 7/29/2026 12:06 AM, sashiko-bot@kernel.org wrote:
> --- Patch [8]: [PATCH 8/8] arm64: dts: qcom: x1e80100-crd: Add qcom,tsens for EC fan thermal management ---
> commit 59ab25e0b30620df90dae53f1497861f1847b925
> Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> arm64: dts: qcom: x1e80100-crd: Add qcom,tsens for EC fan thermal management
> 
> This commit adds the qcom,tsens property to the embedded-controller node
> in the x1e80100-crd device tree to report average SoC junction temperature
> to the EC for fan control.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>> index 429deffcf3e9d..4639340e716c6 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>> @@ -20,3 +20,9 @@ &gpu_zap_shader {
>>  &iris {
>>  	status = "okay";
>>  };
>> +
>> +&i2c5 {
>> +	embedded-controller@76 {
>> +		qcom,tsens = <&tsens2 11>, <&tsens3 15>;
>> +	};
>> +};
> [Severity: Medium]
> Since this defines a new embedded-controller@76 node directly under &i2c5
> rather than referencing an existing phandle, does it need compatible and reg
> properties?
> 
> Without them, dtc will emit a unit_address_vs_reg warning because the @76
> unit address lacks a corresponding reg = <0x76> property.
> 
> Furthermore, the I2C subsystem will not instantiate the device without a
> compatible string and reg address, which would prevent the driver from
> probing and leave the thermal management non-functional.

Same as patch 7, already defined via the included dtsi, bot missed it.
I'll switch to the ec label anyway.

-- 
Best Regards,
Anvesh


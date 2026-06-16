Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3776B27BF93
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781614229; cv=none; b=rHQ7ObTY4+KabUakORV5inaaCIEkssIqjJwbsT8qCd2OX2frtC+yTMBLPCPD0YgtBbpfbGuKEYcNNIrFP9ybeB4hSun+zCr4d/axZ56n1ot6cMITduKUKi87/KS3RH1Rf/KmkWdh34OujYA0ToCxFMP2zGp0y9xMFvlwq2nzVJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781614229; c=relaxed/simple;
	bh=XjqAcrVlKlv2jZrnb0KVc34zNT1cI5DK6UA8ZWDtYRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZxLb6HaqAhZN230znSwykjWugwlXqAxci7CZs49Hy/sQm0V2oRM+ww/FI5p3KiRfeoueJZI+VwqowT6vbHeeCCZY+jqa6CesWUrSNqSx6cpTjFgmiKRkBeeW5FAWr47r0LUXYWcV8FiqgkP3DVZDvnR5u4LvNZ190UHDmFJN6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIPxV52G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RXk7J7oR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIPxV52G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RXk7J7oR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GABnVf3384145
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6uJD0ggfc48GnEtiXzgk2UThtEN5moTKbVfpjUgHoq0=; b=hIPxV52GYUpVpU1A
	XxasK5i9dJFQJTyYcd6Finpkm0iAuZaceiQj5VRDAIS+mgOQGHOlFoy9clysdBWQ
	iSpgHksO3JqMBTkmhEknsirkoQa5+tyglip0mqkWYSJnH1teg9JtFyDq488es0df
	ADOeNvmVve+CmKwqA6nqArls/ZgCHRLDbA9J/tMJCuOhbKnIO2zT4QFj/u7AKj7Q
	oI0nrX8hGpS1hwjqy9FZB//GBnVEwSG1FQjsOI4Mu8mi08LBaC3C4+k3Z27eOEOQ
	iqAfRaynY7Xv2y+QYetylp2w5Sm85V3e/dKEZL+cGrj9vXBVQPWDkWKHYGapxbD6
	3Sz6CQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ep9ew8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:50:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915737aaf0bso26012685a.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 05:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781614226; x=1782219026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6uJD0ggfc48GnEtiXzgk2UThtEN5moTKbVfpjUgHoq0=;
        b=RXk7J7oRneRsJgNXhvU/CdyMfFJwwZed99oYHm4zWVpg2uSorBFY+y6QgkJvnCaEaU
         8+nxVnFZUUUKMpGEMe3tTWIb7KssuaI01gaa5IxxbfiMfYLlvyUidWPkAlL+GTm10T4A
         iBeRzSnWcf1Pq1W2cPojRanTdEL/SdcUKGww11pFVyQFNv7vgByjS38VwZDhwelxQJu7
         JS5o3tc67z1MXe3JRcoo7qsGZ3CQAFh+l42SWERr/0diju8hAZZfIq9PS0s19AXvp8xX
         67rQA4KfJO+FIWf0o03B3K2RGHCs9KkGswaNKADqTWAC4mm4WZ10/IpggTHb6yW7kE52
         loDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781614226; x=1782219026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6uJD0ggfc48GnEtiXzgk2UThtEN5moTKbVfpjUgHoq0=;
        b=AZ6/aCmJB5udCzL/u3tUv+PC/kiZHX0V1yiFZBX0C5om3VezGJ7k7UqaRMf/YqBJhY
         tBErpcQ/U5TMAWcyEs6n8aqD997a6Zr8J8n5pRyOeOcCU554k/3wczhS6A6CDh0EBkig
         wF2b3KVvx7xnCfZKVjUncSR/7Kro6EkhlwZQ90TnpPTDFHgjUNQ9OER3twyeFkiuswSf
         h8Q5BkCKySMkH42caH/YCQ2llGNZEBSv+0OflQq/ezpjYMS08PJRBfvqKdXl79TAL0ec
         Gf8gfrHN6WF5MwCuzhCaQkR/VELjlH+nygUrjLueT5iQG4ElaRH+pGvUP9w4Dz2Ha3+h
         SMtA==
X-Forwarded-Encrypted: i=1; AFNElJ/BFNGvaYEdLiBqma1WYrOFjHSOQKLkSuJIrMfSzAu1r0ksHtV2X5KGhJGsiHj+NdL8CNbyXD/DVa+j@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+XsGyKkZLS+6PGly8NtE9kTLnqMKzN6PK6IULSmmgkeLsWc7W
	2zLs8L8Sb3Zhhw5vfenHVBS4IHcslMddU7PsbPyfINeje8727KqwJhTIO8Zy8XfFCD8qL5Am6qS
	aLOlHuweeIACQmXkdVPb6yUPrnU8XNKIgEKgSCdzUh2OUxvs+M0FdPPlafJAXLyX/
X-Gm-Gg: Acq92OGM5YrIFccMSZFT246i0bf7cRXqRbvzrBoL040Lo2wWpdW2lDtIAEP1CiqdLPO
	tk9IUKwc7Da6LEltXtQjc9rY0on31Q+INV6uA6viBKkqEF+ycM/es/v+18jPBhwRwu1kBCjiflx
	kZBt2zxisv1yRciDqny7qJQx6sejpWLym4wmDtatnW+DMLx6+eP3Jc3eOAmc6uFlMFPLiqszg2I
	W54NCWtqDFbsHeBN9RtmKIUEHzS+2ByQfu6C5CIvGOnVFWpVzeDUl1aWwWe015Xoo3RiUqp4//W
	pzQ3yo/T3YCuaHPtyCS7ZWRfc564HfvhdJVgkW9xN2rRMQQHfkZCuG6kAq92GgcoL4KDFiw0SlO
	nOBRah0TAYhTT13bBxQ1AGP7nygv6HEdGOoBAG9l8wDcXBQ==
X-Received: by 2002:a05:620a:8006:b0:916:10f6:765e with SMTP id af79cd13be357-9161bcf523emr1677821585a.6.1781614226428;
        Tue, 16 Jun 2026 05:50:26 -0700 (PDT)
X-Received: by 2002:a05:620a:8006:b0:916:10f6:765e with SMTP id af79cd13be357-9161bcf523emr1677817385a.6.1781614225873;
        Tue, 16 Jun 2026 05:50:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e162222sm3544928e87.17.2026.06.16.05.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 05:50:24 -0700 (PDT)
Message-ID: <b75a19f4-eecb-43e5-9b2a-325264f79029@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:50:22 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8998-sony-yoshino: Drop extra
 bias-disable
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Luca Weiss <luca@lucaweiss.eu>,
        Gabriela David <ultracoolguy@disroot.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260610-topic-june26_dts_fixes-v1-0-2e0c953a6c08@oss.qualcomm.com>
 <20260610-topic-june26_dts_fixes-v1-1-2e0c953a6c08@oss.qualcomm.com>
 <2229ec5a-f89f-47e0-a489-9d127528e4e3@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2229ec5a-f89f-47e0-a489-9d127528e4e3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I/ZVgtgg c=1 sm=1 tr=0 ts=6a314693 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=o_LvGBUCVDmNgIntDowA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEzMCBTYWx0ZWRfX330A5bf8lYBY
 lAzmh7MLF9CjB7CSirnj7B/e7x3CH7Ge0ShsJKUAMnb51ljfgUgS+hofwmNOHPgf/dXAZ+ooGD5
 YtLzMTWW+51vcGCsI7uZYHnhSUh8pQc=
X-Proofpoint-ORIG-GUID: ZKYY0c5iX6A7rYp_2b44cl9VnUj_fSgS
X-Proofpoint-GUID: ZKYY0c5iX6A7rYp_2b44cl9VnUj_fSgS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEzMCBTYWx0ZWRfX7LqFyfyIGxol
 6gbHvvfQkAgmyodvGpsPU7yA+tPN0630ThW1BkR/9T4H9LjkdTK2NIl97zZjw7yd7r9okgzqEop
 SRtMYnhHjYKgsQNC48JTE99vt4u/VjipSSQBCCT6DSG+bxKhKxo4IECZW0yH7hCvYzRtZRXMkxl
 v6m78+UBpV2MEuuWJtWP2MQox2+VMLosSu1xhNpU64Ko8HXc0sOjt0jbrorZbRjpWSVspLFD4Jy
 2H15m2FCvFvgBI+X8RuRFIUUJjLTI7/r+nooFOoN+31E7ZKwMYN9MY4RmHsX0lZvsWCyLaJOSsq
 nxWJNqqs9XjGhOC/YlNsJXxtcVEajnsjqnE9PrAIMLXKsdowgmRorw7vxfvqOMoultIBpSNf8kX
 1dpDzJ6HXa1nDmFDPeIDM7b2naDZwasXbtEAngTFDRHMFILHfJhR5rmffW0X+IpeEEeDSZ1+Fhr
 pdiFnrusRjFZiWCfJEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160130

On 6/10/26 2:00 PM, Krzysztof Kozlowski wrote:
> On 10/06/2026 13:43, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The msm8998-common i2c5 pin sleep state is defined with a pull-up. The
>> Sony Yoshino DTSI attempts to override that to bias-disable without
>> removing the existing bias-pull-up. Remove the override and use the
>> common definition to resolve a dt checker warning.
> 
> Maybe the bias-pull-up should be simply removed? At least you should
> document here why you chosen that way to fix the warning.

Seems that way. Unfortunately it was yours truly who set it up that way
back in 2021.. but I don't see a reason for the pull-up to be there when
the I2C controller is disabled. Maa-a-aybe for some obscure wake up
notifications but that's beyond me.

msm-4.4 sets bias-disabled for all sleep states for all i2c controllers
and e.g. msm8998-xiaomi-sagit overrides that back.

I think the right thing to do would be to set bias-disabled by default
and that's what I'm gonna do for v2

Konrad

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690F93DBD76
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 06:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781591444; cv=none; b=rHT3CI9/GyQ+2O19bCdgXYHO/bVmTyCWwPJseEsurqc6O8dqryyX3QgNTHAAqODWRoVpmc/tKHS5ZfpSpEyo8XeXMSendX/ru7vnLgYZ4qaRzLGO0g64fmyZh+FYs2MLOtot3UAIE7qN4T9F66I1y6V7Qh7MgTp/jGbTqtdU7dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781591444; c=relaxed/simple;
	bh=d0PyyVSRbSP9Kr0Dy6OM19mxr39eIu2S6iW1opMVtVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CDtvbYXuBsSGPF6qcqFE+ejZA4ZkWPn5eYkk89w7BPNmyPDoTkvwCpAAafLl36h7BGA0Zkv2d4HU7in8ulaKIWUJNpMHTIruCXYiFrfaGtXd2+N+l70BM0LjEdPYibsUnd2wAqOy1ZRcMeyXUJbKFFGak6eCLbmFcT16RARf1F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6yjpPt5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e3EcPiaX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a6yjpPt5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e3EcPiaX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G64J3g850419
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 06:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ut2EE7DkqBeuZRCzWLedDy6SAnUsmxkY3D+ggtgilwo=; b=a6yjpPt53NxJBjEs
	ruOxtILPBDDXb5vZ0nvoH0Cim79CbVXAHDVuwWsXC5l6Pzthzrg/xMOaFEB4hUCB
	3qRQgpmF7JRzJF9wuFvPPh2SEGmcagW7+mGFZe0OS8oVPOTtmZK47e64TGkZ2vDm
	rctL5a/k2wX7T3rN9KkK6UA2S3+//ERqQwCCvRIKiCEsCUMMh4ASFp5cniF74OwS
	ruZANZ2C9dF0o3ss9QVU0/6ozPF66P8c+wMoTv4gMUt+OAhb+QmYN7DR1gdXz5GP
	9/Y/vsS3tVMgn/HbnY3eT9p1W1vdCPjENezooyVdMuGrCYmrubADyKbqQnRWbvtZ
	Gz7xew==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete985ck7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 06:30:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf1dece2ecso42975415ad.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 23:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781591441; x=1782196241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ut2EE7DkqBeuZRCzWLedDy6SAnUsmxkY3D+ggtgilwo=;
        b=e3EcPiaXU8H6yewOphwz3JU5Lpf6VVP4wK5FgoT4ypbIP1/XQgcBJkTV90ixqqxe7I
         7GHdoM4rI/8+Dg792iB9wmdo4w3DnFvvmyxghY+7IzJqzL2yukNEGKvBwt48q9pJzVWK
         3p6bN9bW1YJFQIVc900+gfpUn9fjbYhzRFTcbSOiAfIkjdBbRix3cGuV9Mixp9cwqmy3
         5c4O55frQRHMrrToKpqJ/OoOhhZQLwe6g88Jwln7RKLAIU0V1Bo1X4Ua3Mp6Yg/NHDaO
         do/4Q/sz4Za1vrIVJIBdftxDPiXVONCPypMZii17t6r9ChaPyA9SZltHdWM0z6b7VGCl
         jyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781591441; x=1782196241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ut2EE7DkqBeuZRCzWLedDy6SAnUsmxkY3D+ggtgilwo=;
        b=JxWDdAZSQWPLroexyJObfGeUkiwHs9BypZBS2CclolLX1PyNizT2YcolN05J6dsNRh
         DctAfaSRQgCgu8jcqMcp3ZxWqdHTOss/D2s1S/M1/4dNEW4hWmc5BlGTGGT5w7owyeAL
         7t/1ysC2t6Vpn48GkhZeG1oCzHMJ8O4aQd9CNcNqJY+c4fR8XBRPBVXD30mnshcScqtg
         1At5jd9uItDXPDF4To2+/eV2YNptfo+9NsJ0ZCsjyi0FmJupxtWPu7aYT1GnBQZ0dB2H
         Ae8vPz3FhE9MGEdF25H2NC7dFgS58zhoU5x7i+XtxwmR7lIbzQld1h1wGWbUVj6AUr4m
         2cag==
X-Forwarded-Encrypted: i=1; AFNElJ9bwuzH+34dUMIUXbgeTI3RtpRwHkOUKOrOu5C21YR3CUz7qR7IpHCFR6PVL2WcE8JtZykp5DOGR8KN@vger.kernel.org
X-Gm-Message-State: AOJu0YwurO4JjQu5KTOK8hDCl7A+rGSzHMH4K2UJ+ZWm1is3JPxurx4Q
	UbhwPaH73MdVvNvAETpMqY0o4Zx+FxulXlakDGOw3oc2deRCqSTpIjNLWrZ/R9D5n2JBK685cL4
	f1ti/b6hESuTJYp+QDsqGtJgRl+1/cRC+qtXujgYYGOfGLwHuWK+mQvyXx7VweS4z+jgKx/lm
X-Gm-Gg: Acq92OH6V4DrAnroPGse7pQibKmGwdF44i4tJPOIuxRAkU4yBOD/UpNL/lG+rW8krbL
	YdrG9dAyqPcHl2j9fYUvxtFl/B5ubKt8odTPPh1hwVgiWDV8lIbgA3MkcTvCja7bgIsxoFxMyMh
	OZGsHYS6CkVjIlnAKeD8Tm4rjIr0mW8VAuxl2yrfZ1MDLNu+VX9QPdgrt0RRvGJBrwxahl9o8tu
	vxjjuY+gOWMvLaV3tTUDlkkJXlwD4WEev2PoLS3m41iJU2WFLwF4096GoinuTybLbJmxHLOWb9P
	Qaei7jm5Ve5a1opl82XLZ6y1yR9yizNL5Pm9i2uzj/4s7Rvur76j6298wGlsFufEL+6BptL8a+X
	kBYs3WyXQyefi2aheC3p9yLZov5e5fiKXjw6bCleWNmrQsQJrcw==
X-Received: by 2002:a17:902:ea06:b0:2c0:e5ee:f56c with SMTP id d9443c01a7336-2c664271b0amr151324755ad.20.1781591441073;
        Mon, 15 Jun 2026 23:30:41 -0700 (PDT)
X-Received: by 2002:a17:902:ea06:b0:2c0:e5ee:f56c with SMTP id d9443c01a7336-2c664271b0amr151324535ad.20.1781591440688;
        Mon, 15 Jun 2026 23:30:40 -0700 (PDT)
Received: from [10.217.216.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328a47f8sm113848585ad.47.2026.06.15.23.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 23:30:40 -0700 (PDT)
Message-ID: <259de024-a1a8-4d0f-8290-fcf5c01919f1@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 12:00:33 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add EVA clock controller driver for Glymur
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-3-b61c7755c403@oss.qualcomm.com>
 <67d7280f-54e5-4e16-931c-92049bee3e00@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <67d7280f-54e5-4e16-931c-92049bee3e00@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a30ed91 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=DWGL2ng0N4RBUu-NxngA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 8ELJYvfJiWOgNJKmIbyy1AiUwFueXRZy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA2MiBTYWx0ZWRfX4b7u2+WkjxtJ
 EbodRTNDyim0Zjl0lmz47CRCYc/7vStFKMpa8rMZ5yYB+C3KfkjzQTuKOpEMBXwow04rNjArIop
 b1KsCENAchgMYw7sVMrooU2eJp1ODbU=
X-Proofpoint-ORIG-GUID: 8ELJYvfJiWOgNJKmIbyy1AiUwFueXRZy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA2MiBTYWx0ZWRfX6q7KbxWQbOVK
 h4MYOdkC5jiYxyXcov/UKlIkrbhDW2FgPsw7BdjwiU4/KZyNUytUWJBpYJfQA75FpjIoKpKjkvL
 kQO4j9iu046p3Fq0g7VMF3JubUUS1udmVC28W6k1U6Fze+vb5peog10lxEHlyCEvU28F82/Cz1x
 Y4MrqKRIiMaJWOwLpiNjwZOAy3gosvtSgrr8ncFVRIOCjiaE4KseHSdRVAktbJym69IRI9Mexuz
 8dQafV5Hnu6EWEKmLJi4AB8iWo2ZWek4Z+HYpBJiHOVRyJUwsUWa73Fqa6d1a7i25gunqo62zpN
 rs5L/YmryaQ+EMBge4/42lk1bg6kDDHC6L/3KRdjEnF2SFVIQnktnEVQc2ao/zhrdlEDxl2CTVK
 33KzL12smisq/6yel3bKH4Dd39KF2xZPQwDrhSIW65sm5ixBXcLv20cfYFDOfYm3gAwHuv360o+
 fBFPRIvszsLvYtcuI7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160062



On 6/11/2026 5:30 PM, Konrad Dybcio wrote:
> On 5/26/26 7:29 AM, Taniya Das wrote:
>> Add the Enhanced Video Analytics (EVA) clock controller driver for
>> the Glymur SoC. The EVACC manages the PLL, RCGs, branch clocks, GDSCs
>> and resets for the EVA subsystem which handles vision processing
>> workloads.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +enum {
>> +	DT_AHB_CLK,
>> +	DT_BI_TCXO,
>> +	DT_BI_TCXO_AO,
> 
> DT_BI_TCXO_AO is unused, will it ever be?

Not really, will drop in the next patch.

> 
> [...]
> 
>> +static void clk_glymur_regs_configure(struct device *dev, struct regmap *regmap)
>> +{
>> +	/* Update CTRL_IN register */
> 
> Is there any better comment we could share here?

:) I will update this as well.

> 
>> +	regmap_update_bits(regmap, 0x9f24, BIT(0), BIT(0));
> 
> regmap_set_bits()

Yes, will update this as well.

> 
> otherwise lgtm
> 
> Konrad

-- 
Thanks,
Taniya Das


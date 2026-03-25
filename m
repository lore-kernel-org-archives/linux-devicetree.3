Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CD23A7F61
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774437106; cv=none; b=dzDL68aCQmpw640eIvnIL1w+y6RKzE4j5Q6k3Bjf4PkZr4I2oOVZSVovPfRbAoc6vW/bgt0F8tGWzn4I5uUi1qokR0Xd+Om1lvwGIQrPnB9Oaaj1nZmlcLnosv5stniFjDOc3KsEyISl1CU4DoG1xnXGLDedGunimo12Ij3CLZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774437106; c=relaxed/simple;
	bh=Zf4AmoMpNCQ+Jf635aSLjwHyUcI58E6olwIri5Zu2bw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YZEvd8J44taWVkj4EGM8U6vs8mFkRfyxtAUQAp5GKARTTDut4xAAXtUIeDFUVkvp4W7EX3RsJIhXiIvcqi5sbmSPRwSd0xOwPFCC/jtvojuODBM6cGBbScsgQRp+sEyuyVnA54bGAR7Zm8u/6FguOtOGYflUff+84MYElXip/U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJuAi33e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N0OL9XaU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJuAi33e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N0OL9XaU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PAQUXx2884729
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QgnThs1pPIH+xWuA4iDL/UeJHsTD400ryps3PwpmI94=; b=FJuAi33egFEdD6pr
	/ZG4u/qku6YwGLJJS9uUEQRUsVmBEObmKdEw3jaO+1rFhlavNp9gtVKuS98freVi
	eWewLi8G/xBoxrmrUCoIaVqF7gfcjC3/Dh05VKe2i439XcjhTy0rlSdaKkHmZD0W
	K+3ZsSLPSaL+Ad4ZkSHcEbqDOTFj6TqEdgMdJ9DnrVTZfa3jNKAoK3RlPUAxhjPL
	oLXnssfO7CBpN1rEfQ/zkVNpKkjRkHWrpX3kZpjI7KZd0UuoLK3AnlrkmA9WgSY0
	x80zruvCVc71zdfSoLCQgRhKSIMcKIOeBPrAhL7R/SPudsaJlimbz8gN8bbIN9Lo
	y6z7kA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dy4g5c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:11:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b27636835so55906741cf.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774437103; x=1775041903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QgnThs1pPIH+xWuA4iDL/UeJHsTD400ryps3PwpmI94=;
        b=N0OL9XaUBoN/zUK701EywzGW7/gu3lgzdRUpkeptv+DcxeQuB/sc7gO+RjqSRTfwpJ
         uwzI1Vq6LG0eqLxjfooXUPwVLxhSJ26zFplIBancNWOUFGcl/FjuARODxwFtGnra4i11
         OG1W3CcrWIQCN5JrzpFrZYelcc9A+VItm9StFCL8BWbLC2xkz64Io+fAkl/Ghokm7cZZ
         0ZLW9VNDq5Z5NZvh5ZyrjwUxienHQ+n2SpI8SW+YLI98JTWZjb7W3Zgd2ovkXA0Ea9bL
         3JUlinb4WnrL6hJr6rnOeRQ4wdYdjim5Nl+hk7ZUKg8xJcDJAYsU55M6/SpogBhA55mu
         H0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774437103; x=1775041903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgnThs1pPIH+xWuA4iDL/UeJHsTD400ryps3PwpmI94=;
        b=RPdK+YM0vMJ4/obTzexE7++M2vwEDfwPEbUbE9GOUcdMTy3/UG6QNdnR0GSLhUhpjY
         x0V+1BfFllbGxjNIxAlZhnaqX96DSmRBd1ZfI7PLbb20O1Zh1wTrPeWt+5nsPsth9J5K
         Se6pVMGFvuQjfaHkeds4Kc4p69GwZ8RkZGryg9tkaQ5tpUjnd41sAZUkrAFSdRFhYQoq
         9iJpbbQSwfOc7h/YPlKWxvlgA9evO27gLcfDiwQuh2ySdj2owIgvPauEJWbhCmUiS3Gl
         g3GoL97+ZXWhldw92Qs3ct1NLFm3medWcvm6gTTUZiDIgvoNOKa4+MCorhHGVLB2QfVt
         1Ykw==
X-Forwarded-Encrypted: i=1; AJvYcCW+8hgb/DAZlEkaxj3stvlZPqmL+C9T9hPIh09uiPPVB3H6UDQGR28aSEjIX7FOrHBV9b9CdmCbtQ7j@vger.kernel.org
X-Gm-Message-State: AOJu0YxwhRVmzNTk2OGfhp5oxH6Nj9hftJINSCPdEQ2/pztbYeaDUk7q
	UPrtTAe+yKNbspH1KUyOjdG7p5smLZCto7DYVwW/g4APZI/6TmDQsKwI5YACv9oqMDQqxZVhl4y
	/HBCzsqoeou7KSLQbTEPDRIuRDVwgVF3dJaBaK5KCETi51AyxArjlpfwzQYxLfBMB
X-Gm-Gg: ATEYQzzgkPyEU1tCxPHg2sAiFX0tv3OiOVmbJA2tBgoDgylJiNbN0hWc7a83SpQ1KAP
	OovGI0x+cIYHnnohMg6uEW5QwWXa1KINLq9hInEYbYKG8C/RQ7o68bm4biGwv11opkolslTSLHk
	ahIwbsjFGAi8WxCTn+nhg9H6l7ymJs1ffz7TRM310JZDDYODUDm2TZhvLnJrRNZ24WToj9r7YpG
	kM10S7oG0u6x/leMeYT6EdeA8nVsgtXJUvBzR72OTPoFfc3Si1Pc53P4/Jfff8/Q0BDzPCM0/gN
	MplVd5yuESmosrVoqJhkloLkKTsTCP9x9NmiI21HsdNVzjVBR4q/kNn4XMOdrFS+zkG9Gf1EP5G
	l7RY0faa/KkFDUV5jLwZNGA0tq3AIoXx7fLgiRmRGuAxXp/JNld2KIyPJ3j/P4x83Bz94dK5ObN
	kjrkU=
X-Received: by 2002:a05:622a:1145:b0:509:219f:8e34 with SMTP id d75a77b69052e-50b80acaf59mr29402051cf.0.1774437103613;
        Wed, 25 Mar 2026 04:11:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1145:b0:509:219f:8e34 with SMTP id d75a77b69052e-50b80acaf59mr29401771cf.0.1774437103118;
        Wed, 25 Mar 2026 04:11:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983387085fsm781041566b.52.2026.03.25.04.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:11:41 -0700 (PDT)
Message-ID: <d35f5048-5ddf-49a0-8af6-974c712598de@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 12:11:39 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: Introduce IPQ5210 TLMM driver
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260325-ipq5210_tlmm-v3-0-3a4b9bb6b1fc@oss.qualcomm.com>
 <20260325-ipq5210_tlmm-v3-2-3a4b9bb6b1fc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ipq5210_tlmm-v3-2-3a4b9bb6b1fc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OSBTYWx0ZWRfX4vIKxesPBeu6
 /35RrTK2fJGTGO+fg5fte1fB7Lin7HclzkxbGhZG5wtxca/3URcoX3BXtYM2T0Jms5TLShEFrUr
 /6jUrsHM11qtc/oFSXy0MP3V1Wp2wMNx27khLWN1fpSzkVk2jOAbY8Uw3lRhYgDYu/kJqaHToDv
 SZ1TE1abwndJNCTsOpmzkzFxlQY7wBH48wBKgD4D+2cbXnvPr32pKufO7+9faNJShpNmaRoWw9d
 Hdeh3YQRgNGhnZChygLUKqeeDy7RBmWIeoXTbviFYdlNBxxbT3AULDawoaXZRpJbvI9dGcJzJqS
 ogCV+aqRa0gHM1Wek0pr0A5KhipNVFmNIZ3aUjPZhJOR57FfDv3ISRqmuAXjHhsgxQ/PyrACyuf
 QvoVOdOnz8h6Dtm8Kjl7ZYow3DT7LjVkyScZxgIgltjadpy4+iTZMZ0rXTCTq6R5LkBAodScnpJ
 6F0WOylkmQ6cnCFEeHw==
X-Proofpoint-ORIG-GUID: hCtqZEC5LVXqnxIJ2ZJY3S5Tj5MT0019
X-Proofpoint-GUID: hCtqZEC5LVXqnxIJ2ZJY3S5Tj5MT0019
X-Authority-Analysis: v=2.4 cv=eeUwvrEH c=1 sm=1 tr=0 ts=69c3c2f0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GNHHtjWgAF3xncG93AYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250079

On 3/25/26 8:35 AM, Kathiravan Thirumoorthy wrote:
> Qualcomm's IPQ5210 SoC comes with a TLMM block, like all other platforms,
> so add a driver for it.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

[...]

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

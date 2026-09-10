Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E573DDAE6
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028053; cv=none; b=Cu6tWzP8hWMScSTXciBpvwgx1zQhwgAVaRnCjhkw0+wygfAbiyH4fJ7obdj3OHDCBOaGC/1gXOBl0//vCKkuR6LDC2WufPRmyqhetv4S3H6KWBnl15ntzjv8G1lOabAm0bMnK8L5ulnQS8c1fhgiIShJQAdA/a9EiukRCRpf7es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028053; c=relaxed/simple;
	bh=xvZomGnwMIpd1clhQ3e9HrFkUuPf6zUAzeHN758cNi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a6nK2vbqZTd84UlBh1S5NHs/wAHimOUcFBV15IMS6wErApogllXeIK4Y055m3FX4s1x3GI1+ZfOx60erXTL8PR/GwAavWkbJekCVu832M1IBguV+iFEhVsEU5TNaj39a5wH1/gwjwOiZBf5vJ9axD3gx6gnxjxZlD5CEhqpF+04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UMq5Kw1C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TQj4RR2s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UMq5Kw1C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TQj4RR2s"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A7fEGI642158
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0oMGTFA8dUvLOZmzkmBtn+iUh09E6vfKjirLqmSxcoo=; b=UMq5Kw1CBbFc8XP6
	fCnb2lfReZ0SgJxXVlPzfBpzBztGhEuz/5MDtH6HQnL5We/KbEQy70MShGBv9J6k
	2kqJszVYPJgrXVI2s6ahIKEwFTxxqIDV1d3wx8SDnRvGIsVdlRX1nRKQktiPMCNx
	VnYKYlkSjm6CtmI0qd0D8a6doGpSFckan9yePfrFpqjI3LdDa06Rjvb4RS0y1GDA
	9z6e7rk3a+LB/GeNGdhiLsJ/SQ4duZtiJOiQKHK+eDs8Uf4l1XEau9Jwl7rboNeM
	LJs3NAZOV8PNffKM67aLd8fByFA6ed3HVXZOxfXJ7Sg9Fb97CJQAlslRboEtKyyM
	3tQE3w==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrcjr3tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:14:10 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7ee59eeb8c1so4918765a34.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 01:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789028050; x=1789632850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oMGTFA8dUvLOZmzkmBtn+iUh09E6vfKjirLqmSxcoo=;
        b=TQj4RR2skXYq+qUuRScuAXgrjOuq7DXfm3AK09VouDT8OJxrDQFVB1qnaO8qP2t78O
         dikfKziRCwviJyJdUmNXaUMJPhdXG1y4bJqalQ1PRMC2wp26uPwuFfo5q/P9A3JFKEBb
         grXwGPrHa0IFUyEukj07pTtu2+m9JRTgzoYBLFnluyaa92LeTHnxYnVVgetqRhXizq2x
         XjlUiAfEc7tP1HuMTLx01ZrSa5goywAir6oNh9QnltloQ1fg3657STZigPgmYb71tV88
         bPzKMFq77Ui8n0MAXujJ/7Wy3X3UrTkNYy9SQlYHOl/Pifw1Un243qF7uH2kfu6ErJXP
         vGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789028050; x=1789632850;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0oMGTFA8dUvLOZmzkmBtn+iUh09E6vfKjirLqmSxcoo=;
        b=RxK9QrlSf178hE2qSQ7Pme18x7O5e+Kw4u1ORpqwqO9AZzsBkGgj5tbxCzu6UpcD14
         4Minptez83RxHSDOBDNPJHotnuF06p/zFz/6cSbc6IP/RfpU4jLUquCETaJ73FMRySS+
         eIiFgw6yBoAYa6lxZX9+Tls3io6d2p4Qjwr6mwoBeR0QVMYqCGXVZYyo1fM0SDp4eniB
         f6OvtBiBQWTUaaEDb4rg1CjP8T1F3xS9k6KFfMch+XhugIrFuJLSr8pT0xYxjrtOiN29
         Rw2//27dCIrqyLBSXp+iPHoCceDLTWQ/eEzfC1BxUDle63pIctYBmdvh7FBnbmbriQmV
         UiCQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6hmnFb2r4w9siLH/9bxQ5224DFsiaV7j3FVEDTsbUYiaDb69WFiU7Z7ElrssvCH475D1S2i3YFDmz@vger.kernel.org
X-Gm-Message-State: AFuF++l25vU9AB8MJyoH9m06KBfhqWU5BW9YXxv3SMjYlVVNx4Qet5Gx
	b/M54Q3qOZhomgUWi+OXuS52/fOv5UVeEXcUCVOCkG4Ri4IM/bNrFAvlX5g+e7rB1IutKPr8tXO
	7mIaoMdy8cdGUYh3AElvQLeH0tVyoQtao2a9HJvN+u5J1njpy3A6qtwV2RqnT8k6J
X-Gm-Gg: AYBFou0/z+LhsDLo3jNiC0QrXWEqZdgEoQzaAMhAD113kqXo1XBUk+R0tQ2Mwb/dfoq
	p+STQzlszpmQRgqdAj0c6nUaUmJFG6UHJEY+kxEMwcKqvjQqZQ/CRs2cOOoEOBqCTgvX38gMEM6
	TZJ5q0yKRaF//ePeDE086Lj+FKSYpSM7/YrJlAF+JA4JocmhxyAHAMse/21B0mTCPSz+pSew3MS
	iQW2/Rhd1/UJM/OgtMg6TfJSMyfluPHuSPR5V3R7NGF+1Sp9cYMDdWywwz5R+BSgbkUpdTePSaZ
	J7OsvW/gRD2X/vtzQUgJ5xOWzJsu4OfYuhjOST7K3hZcWEzapwNMdMZtMRHiU5KmZJrPY8lPZA4
	B01JPqFtNmXTptDEYAKv1DvmCL6U=
X-Received: by 2002:a05:6820:f00b:b0:6b1:24ce:6264 with SMTP id 006d021491bc7-6b6fe3af760mr22792387eaf.30.1789028050115;
        Thu, 10 Sep 2026 01:14:10 -0700 (PDT)
X-Received: by 2002:a05:6820:f00b:b0:6b1:24ce:6264 with SMTP id 006d021491bc7-6b6fe3af760mr22792357eaf.30.1789028049628;
        Thu, 10 Sep 2026 01:14:09 -0700 (PDT)
Received: from [10.217.217.79] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm47603650c88.8.2026.09.10.01.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 01:14:09 -0700 (PDT)
Message-ID: <f27b9dba-15d1-4c04-a0d9-7a0773ce62ec@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 13:44:03 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] clk: qcom: Add Nord DPRX clock controller support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
 <aqEaGuCwBRnld3db@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <aqEaGuCwBRnld3db@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5MCBTYWx0ZWRfX1+NNPKi8i+oR
 HABkmmyWFD9n6plwicLpP3Iv7+AR3YM4Sv5Sv359TGQ6IPR2Po5szc7g3GLRnTu6kjOi9kDmr5i
 NqEu+spnd0tG17CApHce700U+E6bxLI=
X-Proofpoint-GUID: QpqS8tKb7vB_wezfk9TUWubZ4z9If_Gq
X-Authority-Analysis: v=2.4 cv=aef0Dhot c=1 sm=1 tr=0 ts=6aa266d2 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=-cX7WTKAfXPw2pp_mdYA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5MCBTYWx0ZWRfX/q+AYqpY1wec
 W5tugkO1h8W7GkKcTrpoV3CRB8nLq4xUmGh+WXC+3DgqoeYnT+dIi4zBinU2W+TJQyvkh7FMfRJ
 Js7jrt5tBaJlTfR1SkGy47ZGBlBExSuoWtu9vY7p3C0k2RvEP7qE7czJlcVkBxOVwwmfCQ7v54S
 6E5wIVoazEx9L2Bs1SCUONooGJMYsDetGijPO0sc2v184J+CYcqR/4KbVPcWAJbiuPTczgUStO8
 cVGqarPKxY5LLQtMm/+J/uvpYqQHaJ693QVai2d7mXWOiheaI7DgZxAGS8397jgp2URgEq+SkkI
 TBufkLnYVO+z8D+hQtxBFBN9pqhagI83RciE3FN703xCIKn9Af65k+vaadwbQQIsg0Ez3CosOit
 zDlsoRq9mXFffPKaLEVTcHc7odU06kTE7ouWqQaF2ONHn7+Eu0VI0OKgN2vmC08uPeSxEjjG2s4
 0szEMRD0d6lCnaYshOQ==
X-Proofpoint-ORIG-GUID: QpqS8tKb7vB_wezfk9TUWubZ4z9If_Gq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100090



On 9/9/2026 2:04 PM, Shawn Guo wrote:
>> ---
>> Taniya Das (3):
>>       clk: qcom: clk-alpha-pll: support a 28-bit ALPHA_VAL width
>>       dt-bindings: clock: qcom: document the Nord DPRX Clock Controller
>>       clk: qcom: dprxcc: Add Nord DPRX clock controller support
> Hi Taniya,
> 
> May I ask to be copied on all Nord patches? Thanks!


Yes, surely.

-- 
Thanks,
Taniya Das


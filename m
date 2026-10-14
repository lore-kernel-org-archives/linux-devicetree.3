Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABB8475338
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791965970; cv=none; b=D+VdA9N0hM312uHXCkTZYNsM4Zwj6grKr64zgVzUkBz6BNL6OZ9dq6ZKoJRQzC6dBjERcSIIognxRdyKPSUEXz2+hNyzdtX5aFZALdvayG0AXvt4euoQkeX7zsmoxt9haYAv9mTIkBwfrAEdNiaffrkZoBclrzWZy46tCST+sD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791965970; c=relaxed/simple;
	bh=AF/M2QUc3HS0zAXZvg7CLpXtwc/riRp7CNR+gaWg4ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ri2II8HOaKgvP4yl9+DxBCqkpP3e6l0t4AUguOBektpP+QcoQsp8RyHI9dMBt+QIa27dVVQV8jArWBQRDwIAJr0/tN90LeS2cfocvIfVAZJinu1fZ/gEzpmoBkxTiAd+QfXemuylkyJ9Lnvo+NG250A92MH6yYTayBklDY3RrXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WAng+t0F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aGFOwaE3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WAng+t0F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aGFOwaE3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E435qc2222175
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qF1hH5RPHrSegmpy/X2YYmZ6AEanlyV1H9Uz7n9WGuw=; b=WAng+t0FxI76CvQ/
	/DKpzWOnE7txhKKnM+yvoKkPopUPuztXagoq8GUOtOhweA8r4ADKMwYTYUiFeMrb
	G9H85mgZrcLfOr3jf6L2QRmJy5Laja2HbNk4OyyNewlM+7dFoRquqTZ4Qbt6wNDN
	Hy55gQQraKu4iDc60m0ZYpgBcoMp/1gOHGOOr1UKnBSPPtuhVESqKhdZ0QymHMmD
	SRqcLGqgLDZ61dYEHfBvKH1kFPyuFxz/F5kFxD53EvMZHQfbzZhBqa6vrwOO6OU4
	NQdN387amfZIfVybxNmFDRA+a74VT4QwFNSveM+296nbEHpWc1vUL7Rko+w8yFQf
	Qccx1w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsajup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:19:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso4809784a91.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 01:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791965967; x=1792570767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qF1hH5RPHrSegmpy/X2YYmZ6AEanlyV1H9Uz7n9WGuw=;
        b=aGFOwaE3SJYSrbaqMIifURgrluPkQZduB5DsUZUYT5S+4eN6IOYnE9XhyHTmLrNTp8
         SoH2H0thT4OeMmBWXIhqpTxrAfem5beko+5cYygJIAfKFCDPhEy5/+tuLlffKSGCGcKP
         9KFBkom3OsSVOCkMl3jiWEm6qFkoM+/vz/1bqyWSMhwYbkMfgpeRInSp1/VRCwDb+h9F
         zErshPCNT6L5eW21nxdQnpmdi5Rj3VX4Zc66qGeI2ERAfU+gbqZsSuPWhSje7xcXFV6g
         bbiEis+kO7swzi4sUQsOh+tNQ/gzoZrrqbC8S9wJgtsGJUK88j2zrZrGFi3szjMK+FBs
         aeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791965967; x=1792570767;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qF1hH5RPHrSegmpy/X2YYmZ6AEanlyV1H9Uz7n9WGuw=;
        b=wVEsXAe39ISDgLjSHPeIvVHnV0u4XIjwg4qt437yI53YAwqA6FGLlB7+cGGxjUHVKq
         cH91oUHG6Tg+M5RnOca4PQijPdqRDjkSQvfSRi+INFeDBKsPAJgvNQ3nt7rc7cnesPcj
         AsRhgne4GWr0ij2FYArAMrZpiN8clpOJBbd7hf4qXnaZjVIz4h+DW2zeovIykKJ0uM3D
         gj63JWVMPrWJfy1lMuiX30fNnnsNUHR1hB6bOEnkWwL734MTM3/E0As8+n9VCx2FfhKk
         rLa9HIMREEyE7EDWvCziTlJdg98MI4WYr4Dt1GaHLk6NPUYySXeDb5bpvdH6t+mk6ytP
         Zkag==
X-Forwarded-Encrypted: i=1; AKwUvBzKH3DiOn9Uh4Oya4vkZsf8wb3jVRZ82PDOgAufpneU5HlsnKlvVeBzG9TdhfKBTrXzpQJvzUzVbNqg@vger.kernel.org
X-Gm-Message-State: AFq9FYKXLb5oSps4kZpuNY9cti+/U8TjhjTtt1vqDxZ5Y4gOSZ7NjPRV
	Snqc4eektWMTuih/IPo+vtW6X+sG8KNYlFbkiCyYyLxuYqnFMhKM/qhRkbHiYle+gZO3phpaztC
	S8xMiQ4aSXHgo/YPc2ou0KxpKzEtN8YPuWPqmb7ZlMLOAV5Y8TO/hcdfKvORJINMi
X-Gm-Gg: AYBFou3bdfHo04iIQZK219zVJvechZ8na2qZgPsvN8q6+octQojTUTD2O8wBwerLKHc
	SVhkBd864/OegMwwm/V86BpQoPWvquxhzPNcKF0CS5W5Ywb9wRT9oNOS31vV2NcCf26dsiLpnDE
	AaXQ82qGnFocoj+oHfnK6IV8oumKfExyMftO0hBb9I4DwelKJQW2Nz+ntGkVnL5RCkTVuLIo3X/
	s2Z8CEroR+L/0fZlLSvNivLfeozkFg8TskxRr75JbpXXApn5J/sDZX59Sq6CkObESawXrKE3GUz
	Uu51K77jHtwipmxgkhqpiTwqHlqvDN8tt+XW3NuldA0IOo/mmxclXGgJ/r38XhmUiNM7BXglak8
	B9j81nfthJY6O3UVk1a9XW71jktwRIc+9KBHX+fJAyypQ5fbngC8ndm+1oNmfmoY=
X-Received: by 2002:a17:90b:2d86:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-3ab3a60eb9bmr12305265a91.19.1791965967500;
        Wed, 14 Oct 2026 01:19:27 -0700 (PDT)
X-Received: by 2002:a17:90b:2d86:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-3ab3a60eb9bmr12305251a91.19.1791965967038;
        Wed, 14 Oct 2026 01:19:27 -0700 (PDT)
Received: from [10.133.33.80] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm3310846a91.17.2026.10.14.01.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 01:19:26 -0700 (PDT)
Message-ID: <2a6b9567-e07e-40ae-a214-2a4d6bcb29d1@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:19:18 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Switch CPU ETMs to MMIO-based
 probing
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jiegan@qti.qualcomm.com>
References: <20260922-fix-etm-probe-issue-on-shikra-v1-1-56d25e9bbe17@oss.qualcomm.com>
 <3fe1ac52-f69a-4288-88b6-edb5717dd315@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <3fe1ac52-f69a-4288-88b6-edb5717dd315@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMiBTYWx0ZWRfXwE3sVx1/2CiW
 cM1punfzjjvcQ7YIeRhS9YdLq3E49gO/0KWlmV4cou55TOZfdXWuUXJxX+7sUWAK4BcbBfUXlXL
 4pU552gfxxKIz0E/k/t2JThElOFGHBVAXCC9FqRTyySWCbn50RX48TZRiFQlpiJAWxcbHTTGpt5
 wb8wnubZpSAEdMkCz6FqYV9motPJPzTCe4W92p1njxsIrG/ksL1PVsZ0eb073QYF9EYsMWoBzam
 UrDrX1O3UTCfXXbp5XNrRg5mzGrnSMDYMRwID2OO17m9WZmtlP8h0NSfJSO952RL8tyuIK/QG0i
 xeEwT2CKu/cRme6fo6YuEwTrtLA/N6V5wI//G7qqW/IFM6xOLRG/Ez9Ta/7HCFQoGrAF6q+qhqC
 4+ZvNdZrgihnrDuFPYaWwagvVkoGczQC3BHXrm93jzS4CILfxSCOR7sgMlpHRO1sWjx09JfY3iw
 GyhDkkegGvfEr8DaN8g==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf3b10 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Udf1bCXIbt1WAqPULBEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMiBTYWx0ZWRfX1eQFNq+M1S9r
 Lt5C7cb3YjIeoWXpdoR20XHzCVvVctt/tHqOHklMm5WawbG4ZwV9ziyVuWy4/g4J8cFC1j5ZhG/
 MMBeCnKjJi0mROrD15ZqrDOAIuJ73A4=
X-Proofpoint-ORIG-GUID: JeaWnzC1Vdx-uBtSEnV8nu_YXlE7JAud
X-Proofpoint-GUID: JeaWnzC1Vdx-uBtSEnV8nu_YXlE7JAud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140032



On 10/13/2026 8:38 PM, Konrad Dybcio wrote:
> On 9/22/26 5:09 AM, Jie Gan wrote:
>> The etm0-etm3 nodes are declared with "arm,coresight-etm4x-sysreg"
>> but do not implement self-hosted system-register trace access on
>> this SoC: ID_AA64DFR0_EL1.TraceVer reads as 0 on the affected CPUs,
>> so etm4_init_sysreg_access() correctly reports the access mechanism
>> as unavailable and the ETMv4 driver fails to probe with -EINVAL.
>>
>> The CPU ETMs have a memory-mapped aperture, so switch each node to
>> the standard "arm,coresight-etm4x", "arm,primecell" compatible with
>> its MMIO reg range.
>>
>> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
> 
> Do we still need qcom,skip-power-up on new SoCs *with* MMIO access?
> 

Yes, we need qcom,skip-power-up for all ETM device with or w/o MMIO access.

> GPT has concerns regarding whether we need to add
> arm,coresight-loses-context-with-cpu>

This logic to be handled by HYP on Shikra SoC, so I didnt enable it in 
kernel.

This property related to etm register save and restore during pm_notify.

Thanks,
Jie
> otherwise lgtm
> 
> Konrad


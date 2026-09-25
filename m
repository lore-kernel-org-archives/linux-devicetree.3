Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A0E42DA4D
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790330254; cv=none; b=OorUuW/yIx3Jfi9MinspH8PfTbswtIhuOtXt0b+cX80eHnmIe2xb8MW+sEQJXZkhYWTGyQfOTGjJRV//NAmIfcBuwRPB7/i942iV8AxuptiTHyAzDET5khdXnuaYeZNp5KE07I5rMrqynSUg4w2VDKYfFs53lVwD8m+e9wyaptA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790330254; c=relaxed/simple;
	bh=CPMAN8rLvPNAB9hxiHU+WCbw2Y33iCG6KeThPLTYFM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9Gl5se7KevJmLy0cOWY+/Eg9uGktCAPkOYm/wIKOgulJxpqa/37/rMNDtYp/ORIYWZGcbfoQDNPJk7LdcgKw0IEsUkUVydO/mYJMt3NDIkh1luWBatyRRQUanDYM1ihigJDNEUnyXFGuGg5enT1L5+wsuQF84DXyLLj9pSuR4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJQD/4QR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LW05qzYa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJQD/4QR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LW05qzYa"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YvxF290278
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Us7OV6hGUevVELE81ITsqhco5kYotxbVZybbw/9clMA=; b=HJQD/4QRz7prCBkz
	CtOQEHS8DXsT+z613mTaH/ADpPVmnHoNEA+QlmqZSziTjJeMKjGJDfKQ/R0+ilhc
	2GObozO4ZD+WKNH5c5B9kH6XrKUX6Cjup4V2qsb0i4xZPJxuKrPxZ8dQkSyEOCG/
	AkghD/tWEH5gMAMRwzbVhsJXODbDenxSXDEGQEQjLjzW2kVhM5ALWBkzdUM23ePa
	Xi6S0mVZPK1BsLVsxprOEsg6W+g8UuyAWsVP7W2C6+WyDDOZIBgmk3lAWNt+iGei
	QwyQ7M1r4F52WFSsdnxPiFflvBl5y+8WlGH/DmtA2s74220v474McscKdo743yCV
	+5lCjQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881u0x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:57:31 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-342217d8d53so537894eec.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 02:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790330250; x=1790935050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Us7OV6hGUevVELE81ITsqhco5kYotxbVZybbw/9clMA=;
        b=LW05qzYaDitrF9T3M9qHKb0qFFsOXb6jF9ByT67Z+Vd/WkesR627YNHqwu3gcaNRgy
         pv9JA/qBRivTfgHp/DMg3PnB+fsYnEXOzwFFe/AzDLjN+NdLSE8MSmXG4/T9u3MUiXmR
         akTiKRLIP6GBAt421nszfpAScLti/MGJbxo5+3OeZWoISYw193J9g1435hBFS8xYOZg6
         BdnH5mwj/qLbg6lwFg29DP+FjVqu+TiX6F1hTSfIW8pdWbVH95RHMHA7f9eOjxgXi/TG
         fPPSACr5OXlGiJ/MXTz93GQ/mJTCzDx8K4NFge94i9u1kr03F8LOGyNL8jpsBPTwdbzS
         2J6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790330250; x=1790935050;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Us7OV6hGUevVELE81ITsqhco5kYotxbVZybbw/9clMA=;
        b=ac8dZ4dBUMB6eTgpcSE5g5gLuU5ckOnA10NcFayY+szePtaA1qupgNl6NLg4qfCAHG
         MalDnXy253KOvu4bOvyEJnk6FZ82nWBBVnepgjlT8VSDPiUNUVAdw5fvzfT/sDCqcSnX
         NJw6PJOZm0RlUZxxcrqd7yVxG1XSKdfQy05aA7kQpOOS3qIb2k/JV/5T0zl4FlIxo7aI
         O27zK9y+kszltlT5L19/mLTp7TUlKXsgnCVpoJZ/M7WIBM0SFSKsFPOe5TNKk/y7zX1A
         WBxIB+93gPMfXdhjVZ1dy4CziYM9h31YIDN2O0aQUwM/HwTfM7FF4AjcUDZYGAbNMntg
         0Clg==
X-Forwarded-Encrypted: i=1; AKwUvBwK2CJfC3STIX/b8AdmhiwWQ7iQ7lz8FwbPof1Dg4YhEUQBPNz+WI0y2KtCHxPwfJZ1QAbnEGfrOmtM@vger.kernel.org
X-Gm-Message-State: AFuF++nvjp3Wv4knZ8mk334YHlYhiJBgMVm3hAiJZ7C89gxtBaFtqSbn
	SyWpiuFn7CG7t9rFt6B+z1VJIHCZIvyhDTp9a1Z4MGzMbx9KAChoIrNZvsdA9ZTI0+Y4AHB7gcp
	UJsrl5n69VJLsis3SvLZzADIG3FGU5GCO//tXLm8qpzciO0HACTP+eX5q9xkUCDBfY4dV1bQU
X-Gm-Gg: AYBFou3kWVlGUzq3V10Va2j70sHT5ALeYEuwcMEkDZeBEYRCU/Krkj3wgSXyAPERQUn
	ehaPtobD1a7pX8SAshv8TVTDYVDm2u7Wov/dJHqUVHFySEh1Aet2zCbjpxTobD7sGy1cJh+rzhc
	GDX+7JmIt4B22OMxK6rApoZJniHteHmxriq9SZdvQFfiG7bz/NqmT3DspWD3ZgGETom39C5JYT0
	VlyAFPvGdEQl3d/l325Jpyrc2Ibb/M944/ToBALX4t0Kfha0Z6CHhABGd+N9ZJBQsrMUdkUih2b
	ghA13jcR67mZ2XekhAnpRYRdr3EAnCKUNny9xklUY2W01wvz7PnKVWYcNRLL0ClgJHWWZ6+msqM
	2eKI7xiJEho57V04=
X-Received: by 2002:a05:7022:3a8b:b0:13b:1bd2:38a2 with SMTP id a92af1059eb24-14503fc30camr5160036c88.18.1790330250130;
        Fri, 25 Sep 2026 02:57:30 -0700 (PDT)
X-Received: by 2002:a05:7022:3a8b:b0:13b:1bd2:38a2 with SMTP id a92af1059eb24-14503fc30camr5159934c88.18.1790330247829;
        Fri, 25 Sep 2026 02:57:27 -0700 (PDT)
Received: from [10.204.65.250] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adbcd1bcsm6475668c88.14.2026.09.25.02.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:57:27 -0700 (PDT)
Message-ID: <69d69906-eb85-4fdc-ab53-1828984dbf07@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:27:21 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: nord-rrd: Enable iris video codec
 node
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-4-94428761ec06@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20260919-nord-iris-v1-4-94428761ec06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab6458b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=yR8J6TAb7IqefvQR2IsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfXw4/OT8eZszU2
 c7LViUah74frauGKbcW7CaWVmUTZ8ewCiFirtXhcdLaRV/iWWSL+mibcBxjQqJAx1OvaZ50Uh/P
 Wfh9C5bBMov4uXEPwHIV0eZzVUWSegykZJv5UnVuF67F7ottfyVMVW6+aO+UgaAfOUdmJPXGOY3
 zEIO9KXL989kGd2hAx70YG/JaPDYwfWr8jmk91jOJXBzbMqcdG55VKHsZ1d+fQyoaNRpXYAPAyv
 MmT3xlj3z2KWJOfHN0jjIqiNUIq5MTrNhzlRz513Fzz7ARsvRvDLs3OtqUjITO9vSKEpXxQnLVi
 /9M2smiu3FSl2J5JGVnHqBfnwfEmse9roRlDedfBEmqm67tBik/uMHxH8X7Ro1ZSN19xl4YoLIe
 PckRME9qsMOdhVS1hjBwuN56XLHcIrSD9upkN8wFYPTA8ZBRxtqJu9bsOOGDm44rtJ/lAZw/bsM
 hWHg7ST5OxIavWSQzdg==
X-Proofpoint-ORIG-GUID: 2Re_fIC4EuxKvrWiEhT-w0aSy0dNw67P
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfXw+GtFhsoD+fB
 G7K8tfPZNHN65k9reeSWmSYTWBZqinArKVwm06SlIm6xvvIYX6R8FGPxU4ZMvllhM7nh/wdd0Ng
 UgwjtMlYDB3eKzbbwkBpD8O7f+ZUoEM=
X-Proofpoint-GUID: 2Re_fIC4EuxKvrWiEhT-w0aSy0dNw67P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250039



On 9/19/2026 10:14 AM, Vishnu Reddy wrote:
> The iris hardware block is described in the nord SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-rrd.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> index 802987da3cfd..6e0b7a54523f 100644
> --- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> @@ -415,6 +415,12 @@ rtc@32 {
>  	};
>  };
>  
> +&iris {
> +	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
> +
> +	status = "okay";
> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> 

Reviewed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>


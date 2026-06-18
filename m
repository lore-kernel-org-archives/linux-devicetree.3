Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E0540D59A
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787418; cv=none; b=T68z4PTic3TdaQo/D9gqQDE7+BTH7wuT9C2y2ylp4Bzva2psniBgbBRcJ09y3BvV0pWiHPt2iQKorWPmg5byLL8iKm1HxO5h63CskuJ9eOhRkrxCLWYMI/QJQcqUPCEjoolrWoCRCNjllIurWuaQ0SsH4p7F4NDuaOTkFc8TYus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787418; c=relaxed/simple;
	bh=8fdZQo7lRazPimkK/IEyFJO4uQFrMBrb163SXPiEMGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=H65TN6SrMbjkwldeTwAJAq8GrXpYpoMGZspNdss6ymtbs1QoCoBXhtFYMlR4ZU9WxFxGPWPet6zyz7X0589+agKhDIblPvP6rGCMFolBzDiSx8oYxSt+KS9PQHsIILq8anxmntylUuNSWzJHW38OP5OxioMeG2+oAWMyv1lT+tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fdhtkbIX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLwg+3eI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fdhtkbIX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLwg+3eI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ICrxM72876927
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVCMxHHKQUltq8E4gzpZxnkh4hh4WngDoJwaUW1WM+w=; b=fdhtkbIX5UxByliu
	p3b5zYZ109coCVovWd6L0ftAog1+/1dMFu72iTQY+IQecU63p+AtCFLVjuciT/e0
	9/NcVFdPDqOS/IDLXiT1WhrO189j9ZbCGyTPUiV2S6A4xlBMXg/SwIGe0HuWOOup
	kNbdy5/v67w8SUEYm13CPnbLpsGg9puOCFicDeuNIO1n2pWnJEtkeRinQSXoIU9o
	Sn8/Qnm/fzhLl7BDGyn4HoeEu+nfYJGNrHGEUIgqkG5FdwwTBw9pdx/pwBBIPCPI
	rIjWbcJ3Q1zRNNxzgg44wRC5IfcAorD8LUAOYk4AA31IDIHQqSVDpL2y71XDlQBE
	iBqG1w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evgtmg25u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:56:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91571f0d3e3so12496585a.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 05:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781787416; x=1782392216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QVCMxHHKQUltq8E4gzpZxnkh4hh4WngDoJwaUW1WM+w=;
        b=GLwg+3eIBefS7G+Tc2Qu0WuBG8I48fk5+xNRoDuBmp01SYP+/yOiKrj+VQqXgojzr5
         tx/aXQJUiEuLn0MSPFaoaGccTrKOtqqA/udb6ERCi9kMphmzuayPxp4nlwNaCxXCgJI2
         YwDjUfWmnRSwGU/PP2IyY7w6qkEO4CBcPzAjtDkJyMJ+of4Fr9DdrKxAeqwnUVbxr3Fu
         Z9ZmFCqEhAPwwjTiA5UJm0+amdwMA6YAbcMbzMaqwp/qkt7KEc8nArFtcRWuwhi6F/cu
         QKG9kDcZBBcdR1q/JrXbPBIbMpqpENhGwyPRcSm/syn+iDnCPp0t+i9gW/se5DbokewI
         eEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787416; x=1782392216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVCMxHHKQUltq8E4gzpZxnkh4hh4WngDoJwaUW1WM+w=;
        b=HsOHMHgzIf+OAoCxSx+4xbFTwx/invpQk66jFx4osJottDmmi++ZXSJ20Z2xp8QtbN
         UHcEOYsMARztlCVeOOkumUKsynng5Y7BGOnRLo405/v3fliRjOYrJh74yFQnrxB7CwHP
         YT/Y/yYJzdxMbrNUQAm+eIypaSwZNYOrPzLB+F8rxPhFKIwrCgK4vuobkKsH/t53UME5
         hVSGdC4soWAJwvaHJZf9xbBpbRgC0CviFyNWAvfC5GKfbtbeDeMbBfk3LheD3bwMfXTU
         MuLmyggPp60b6V5EYj4tXKdcX5hk+Yw0zfTfqKHPkp4wykIQFdYxEbS53tnpKaE9knWf
         s4mQ==
X-Forwarded-Encrypted: i=1; AFNElJ8J6hNsHSD4tz5EIScUffesZvJV2tpigIVBScRsITpbl8Alxa2Oi2j7TsZ22LgODR9FPH32e+yp1+9Z@vger.kernel.org
X-Gm-Message-State: AOJu0YyRMYFZvonwWLzIBv5eTC5kytXwRQdp5jJ4vOYpov5gft1ixExH
	/d1tNrgb2wg7GqvuThsjcpp9fHgdIddUsDNNr+kUhz7HfyO3F+5/A2YQ92TIKDlAeNUVCRp5IYM
	b/ArEmGUvcIELPYwgz+qjiN779Ir/v4bAULOxtMlDXeLTUFXEkg9iCDxdRdwnzSDz
X-Gm-Gg: AfdE7cmpgpF0b/f1naNHyifLe2bBopk78MA0570iWotmb0w1VV2pMMkwVJ4gSBesc3w
	1uKVvklMCFANHygUsbUpmpSXdx9UkL21xZdf7EYq2leRFwOyieTV4vqpnDycZJQeBESqARMslSx
	0EuSsqPMzeuFHVPgKztv1AZe+Ns5qItUvL5G+yUW3AJpY7W7B2XJ600ujewFJZAnYJw8XyMlJfI
	0YOrxjQoDUv8zGp8sdYZBxSley1+/orVh2dfc/gsGu+n5dNDtDsHce2d3IsEpr4hMfGvG2hN7v1
	N4f3AtxA2uaia+FqksfqrUixr8F5bNGBBE1qERhn3mieOVbW6zkFc6p8o47gyvcjljTypTqhtIs
	/GEDuvqhapIuE5daaUgPQ/H/twFbrnlp8u3I=
X-Received: by 2002:a05:620a:d8b:b0:90f:7ce2:3019 with SMTP id af79cd13be357-91dbd008667mr776404685a.7.1781787416062;
        Thu, 18 Jun 2026 05:56:56 -0700 (PDT)
X-Received: by 2002:a05:620a:d8b:b0:90f:7ce2:3019 with SMTP id af79cd13be357-91dbd008667mr776401085a.7.1781787415606;
        Thu, 18 Jun 2026 05:56:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb531896dsm937074466b.27.2026.06.18.05.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 05:56:54 -0700 (PDT)
Message-ID: <637b1276-cdf8-4298-8622-234db41c50bc@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 14:56:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
To: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavan.m@oss.qualcomm.com
References: <20260618124700.2001191-1-sarat.addepalli@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260618124700.2001191-1-sarat.addepalli@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 69FFFzHJcZgR8jAlDOT4KiJc4rtP_4g4
X-Proofpoint-ORIG-GUID: 69FFFzHJcZgR8jAlDOT4KiJc4rtP_4g4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyMCBTYWx0ZWRfXwmQuLmbK3MVy
 j5PM0ucnpO/UOk7PmPydK7+B/Qj/9wQzyrBTCG9M5EWJFMivH6m0e7ykM1BB19fa3AI/NY7rIRI
 e5alLkQ4og2BJK4mG96cpIJcFOy40jvdfMlLMlJDz7eikEyW7ARftxwlELW0YdI7yPRgb91Ue+M
 7oiXnAo3VbS0iLSfxKjG+N3G9Ybh8xtQa2hn55ROSCquq0LI0WokpN8XonfeKd9pR+QH6ET87BR
 OdbteJudYd7mrp1tMTy0bdFygDb/LcgIHHOvuqDhuLAdXDoayWbCq5xXUISJ5WCr+37LkpJun7/
 tOLqrLy0Lo33huxTv8OY4UMwagAab+0MnY1kHuJY8O16szaPCFYk49HZimcpsZ+jOg15irPDfCX
 RgzSwg7T8iInE2gmn7WucuLYEN2DAweYukW+TAOraLPSpA+4VqTDcRMPF/fW8v2JI24dy2nD0S+
 hKtkYjxr4Ce5rL5m3sw==
X-Authority-Analysis: v=2.4 cv=Qb9WeMbv c=1 sm=1 tr=0 ts=6a33eb19 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MIFvbQSmvuA8yh7qltwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyMCBTYWx0ZWRfX1ZSgvOZ3QTR+
 uwLuY1rRaWBGVQEalgX4M0OmDA2SONYZN0Z8YI2bM6MxoeZhJmU6yN+eulh3vh9jv3JqjQFJCmN
 Y/rOEdvkiGD02BrQb0Q+4S8P9U/hv8w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180120

On 6/18/26 2:47 PM, Sarat Addepalli wrote:
> Add IPA nodes for Qualcomm qcm6490 board.
> 
> Signed-off-by: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index bdc02260f902..fd1aa26e20f1 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -619,6 +619,13 @@ &gpu_zap_shader {
>  	firmware-name = "qcom/qcm6490/a660_zap.mbn";
>  };
>  
> +&ipa {
> +	qcom,gsi-loader = "self";
> +	memory-region = <&ipa_fw_mem>;
> +	firmware-name = "qcom/qcm6490/ipa_fws.mbn";
> +	status = "okay";

Please rebase atop 

https://lore.kernel.org/linux-arm-msm/20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com/

Konrad

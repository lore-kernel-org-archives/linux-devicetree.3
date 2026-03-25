Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF330332919
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441264; cv=none; b=qZwh3cgpx2y1IDIZxVmFFAKxYCRzXolXIGjy362B1HkE/BDwqNsbSxGdh6MHQ/al1lyopZTvNY0No1KOnbbKZtEZAcI24L8qhDKMyihtC5dTHcVFf64fA2bSu6SUzP5fI0onSaggilhdhVzAPTtTYOGFHHP/KTQYHPUrxHy/k0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441264; c=relaxed/simple;
	bh=CASlOad9Jz3rR8JWN7C8Lo7+MS2Ekj1KXi5ZFFnLDNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOVdP7HE+hfF3QbIaGxnPBGf05QR5VVDGRzxgJ09B6SZXRhoU38oHgH2XsQqkIKJ70PyGFp0NdtnG8ztqGNNEqsvXtzHFY2Ynz5tGFGhBsJb3kJFnLy9Tcirw8f1HIlb5Hbeyt73/5uQawMZo0cXyWOkik4MOob5i1LRo00ory0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V7GGU5ZR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YYnlja05; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V7GGU5ZR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YYnlja05"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGEdS4091257
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ij4ktEkghVXMujOAQpvP2x/I1y36LCkTpjVnnIT2MWs=; b=V7GGU5ZRS3OyYkDd
	Wy1M3r6SIDNq1O4jYrFdCwfNdDQCG+n0/6DEkZ/FjGIGKeRVZziiZn64/z9F8zAP
	WBC2RiIuPTICWoVbKk7ewZBbu4+TmAI61tiQeWxb7y4KThD4a1/SeOFskXJpZwlt
	TXIfSlI4Qf1hFM2mIGNM37umA/BhdZxjEug8rrYl/G2omLbbaMPlIhr1GKS715fC
	2rKCztLmYLZtMuBG8XAwkwp7B28iZXppapNjOd3YMS9r1oiodphIBo+6S7O7dZEF
	00r+2CbNk3YKxK+1Rx4RNQa9QSus4P0bk7uxfsivZDcPsxeeRv1P2DkrXG5heD7G
	8WlA4w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d414133aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 12:21:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aeb90532f6so39909505ad.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 05:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774441261; x=1775046061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ij4ktEkghVXMujOAQpvP2x/I1y36LCkTpjVnnIT2MWs=;
        b=YYnlja05E8CBpz2FHKlkczuyjHgA/kynlgYlGQO2z1HdKSnzL3fHdHGYWHljzfdklU
         o+l2niRH/GI05YX5AMu68Y5dfnWIGdQIfGVWstTWsBjzxdedCI0i1brp4onFQQgEeSER
         gg2vqDeZblJVNHlszz0kIXFJ4vHUB+vkF/wBHN2yQKUgppnXWNLRHRIVcfz+b2+uDrPo
         ZzuNTfaB1AuoZj6Y6h4Abp+MoEe6co3D4PpFmCuLQP5fBDH63XKkV5cwh6V1H9X1KayP
         7znAFqnTq5Qruv7htN5T1hysR24MqpNPgloFhWTtLBqVHXmBo0dpKVPF/hMud1R/xtuL
         el3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441261; x=1775046061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ij4ktEkghVXMujOAQpvP2x/I1y36LCkTpjVnnIT2MWs=;
        b=aOD0AHztRPH1MHDmoPeP0zCcw0ng+DqssN1gsVbqCWAg0PBqbcjuUo7OzsYlxL6Op8
         X8dtR/pBxdBsqte1fuP8LOCEVfNx9GQgUT8xDiV+qS6HaRWdQlhUDlmxpnMT09ndoeoT
         1CU26cfmB5M66uASu4d8B4+SxMDpdEko3muG4lWQn5/eeLE2sLxD/n+4XRDyvDxzacdz
         qMv2I47hA9sWTmIPVRabkzKjR0UmMglJIACJRpcDbYySMLJcVrQSpf8IIfpEBZ0muy8N
         yKh7ng6Dp314tDp0G6ZLogLJ6qbPa/9lM5LCsBJv2iF7dmtPnvEkyAFR3C6YDv/d9Lel
         cX6g==
X-Forwarded-Encrypted: i=1; AJvYcCWsR4wPmTKXk0UvILywPb6jvOUtbxHYpywIgycKnoJaavm28FO3Un5riluqwkTqkzP8eRc0Hgjnzo9D@vger.kernel.org
X-Gm-Message-State: AOJu0YybT2PM+nXomKqOaRVmt+NHTA3656WkwtSWfEr5NtLeYE0J2w7i
	jeoOoIRThBVBCVSZfrfdHgkBtnzgBNKB2XgujCnw1WLjNZYNILBDUoRZ/YSDMdj73Msa9PRjbiD
	0ZEpZpRhwa8ltt+HTxrDEiTULo/HSHtg2JcqVc8nC37g9YC/WvfWmDrgbR1ajYGZd
X-Gm-Gg: ATEYQzzo7Y/ygaoUmM5z+2gVnN1bz1xtNxX5Uw5Mt1DEK7Lt3sSDG2o3BKHZjfNylVd
	EWxQyU7wP1oNWO4rgQbkyzEYWlxJa0iGTP5q5PEjYMdpmFyM013xXhlb3mvE/JGmlBH2/IJz3uS
	EdrutIFAZQHYZtQuDWyc3FyQn6QyCcrM9X6+CkQbqk3mDvSz6BN6t3bBcGDBoqBTYVSFD3y8kIJ
	UY5rjXyxx2McRBJ48GPhsx0rvD1XVhuhcRTqbAAc2zy1DtUPeZnNjftM5Nkiel5hNIX4Gmv/Sbz
	1ZmOr9v7ZHDeCj+/CG2ht4OyP5YfPBa3oGpS+7hPbM9xB5Ydll9Jnge1evk3fuDAIphpyRmOHxH
	t0PVk28TnvD7RYMmrue1IyO4qjJBLPxEgSCcXjoDdK8lA04gUXmZU
X-Received: by 2002:a17:902:da91:b0:2b0:6e4a:1c1c with SMTP id d9443c01a7336-2b0b0a1554dmr38685995ad.19.1774441261499;
        Wed, 25 Mar 2026 05:21:01 -0700 (PDT)
X-Received: by 2002:a17:902:da91:b0:2b0:6e4a:1c1c with SMTP id d9443c01a7336-2b0b0a1554dmr38685575ad.19.1774441260987;
        Wed, 25 Mar 2026 05:21:00 -0700 (PDT)
Received: from [192.168.1.19] ([106.222.229.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0835161a0sm221170325ad.10.2026.03.25.05.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 05:21:00 -0700 (PDT)
Message-ID: <95d9636a-63cd-4691-8d72-c1bb59c605f6@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 17:50:54 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
 <20260325-add-driver-for-ec-v6-5-a8e888d09f0f@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260325-add-driver-for-ec-v6-5-a8e888d09f0f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c3d32e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=EBd7WcfsMYPMwvoCMWz0vA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=v9AdQsT0JroIR-EB4BMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: WNzFf10qW_E0UtWfItus1JcnVjvKsP5W
X-Proofpoint-ORIG-GUID: WNzFf10qW_E0UtWfItus1JcnVjvKsP5W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4OCBTYWx0ZWRfXwQS6joE8kVTf
 fvYwuKV1ia+7u+VQbUwJUik3Op/gGYERyeqI6Tk8h+S6rffzBbXzGReo7czzMJ50mZ9eoSbK3tw
 1mGx72kjTEO6fe2ftnOyHqvCc+Fuv7wbRWSC6YjS7R6gnGky7mROwao1qaf6YM9/OENdst/LMJL
 Q4AGbKcwF5z9bNAzHsc0QRRtpiC6UEz/JjMLy38XGRudIV7cNZsIQ41bMOVGV5RsEm5gScuPaKD
 SLu2aFZ2PnF+VTm4145IoHbv1dJdeeAat5AORiC0cD+Svazut84txd8ZIqWY9bwtBvDejIHJfAJ
 65OVTFMkptvLovpqKAt8RobyHB0ucRtt0cgVI36JFPaKeO9wVR7FyyGjiyYgsqIwUSiho9y9yO2
 z0E9y2wglJrQkvam2czUOW2905ebiYggq64PaAG2g9nGPqFsOCYXerQCQDNr/uSfJVbVgHJvd8z
 VLcEVYnof28PIX3Bx1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250088



On 3/25/2026 5:09 PM, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add embedded controller node for Hamoa IOT EVK boards which adds fan
> control, temperature sensors, access to EC internal state changes and
> suspend entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index 460f27dcd6f6..a0d2ccf931ec 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -831,6 +831,16 @@ eusb6_repeater: redriver@4f {
>   		pinctrl-0 = <&eusb6_reset_n>;
>   		pinctrl-names = "default";
>   	};
> +
> +	embedded-controller@76 {
> +		compatible = "qcom,hamoa-iot-evk-ec", "qcom,hamoa-crd-ec";
> +		reg = <0x76>;
> +
> +		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
> +
> +		pinctrl-0 = <&ec_int_n_default>;
> +		pinctrl-names = "default";
> +	};
>   };
>   
For Hamoa iot evk board, i have also tried and cooling nodes are 
reflecting fine.
Please feel free to add:
Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Tested-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>


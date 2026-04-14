Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910EA3B6347
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159686; cv=none; b=Zg8nc8mhpaSQderOZVNMP6y3Q/hLIJKm3IsqG2Mh1HFIZCcClIsyuSLEoW7pfjqAspHg39XUaSFiNLs+6/S7j7h7S2UEZayDcX4KPI16FPf1jq7k1a66axg7UqEECR4QdDP6gh9DL0bMur4PlAGV1+Ap0Ohp+n+BhoGh1z+WdGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159686; c=relaxed/simple;
	bh=MSMc+Vupw6OBt2TRATno1Be0rh1dgFO8N5/ngx1YRBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gXv/EJW0bVwCEx0S2D55Z9xzSOJfFWupuMSkK//owXGfLOtybgpuRPS73dDAlj35ZcJfIIRKDKDTdORilXJQBkvfsIAs6P1Z4VPKWRc2rFJx7Fznjr4jt2EcXQ86BnRGHmJo/qGiECHlOy74th3a96ctf9U7U6jfiAjNXdxbrRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzyBjo7F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ErkE0Flu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzyBjo7F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ErkE0Flu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6RI8M280834
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxi6YWyMlUMtQOxgVUNZ1znAX33hkHtx2uWIFxQzWfE=; b=hzyBjo7F+6LH80T1
	jScrahL/p/ngMgccM5cZfU0DYCqY/ei4+RNgaDc0WGLA70gCk91bsCXogbf93tks
	s1b9Ij0D07WdFwBskx+RBbOLlwnIRP+zN6GRbzex/mzw2RYYo1oj2VmLzWHxlPxF
	+hILN5uOi6vbTFTHd7j61elkhF1srUIf4OXgQKHleXLfdZ/2ZJYMX0icwWWyqUjh
	IdyDLyU8y5YdXqtnx6uTvu63uEal15/B4a7tI6x3wSO8stfAAjJUeGoyyIWcLdW/
	pPeactPbDoQvGmytjgIynF2xWfDCCtb08eC+EnzUUX9EsdniNcDgglSPLCzqDgVK
	2M44Vw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vj45s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:41:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d7128e038so13221371cf.2
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 02:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776159684; x=1776764484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fxi6YWyMlUMtQOxgVUNZ1znAX33hkHtx2uWIFxQzWfE=;
        b=ErkE0Flu/aRSo7nDgWfODyOAcCKjreVKmshisl5jfL9SMXpTzqNz5BmxU7UseuyY38
         MiIKqpwsMSQJVs2O6CUmOemeeFDu89S5zWCNWcbpYAGnw+9CcLCIGsqSVYXoe78OE5at
         f2+/rb+Jiu2jsNvNzeJJgEyaQoCoTpMIPVqGUmnaxwYDeeZ9wk0jYSiAwGn0MkmvZVPn
         SUTlBqB58XoWVQit8OhEl9i3sU/EJWNDGIGKZToZMmk7APFAl1GIA2EGwF6kV1/kbNMT
         GmQ82QAe4Jxq1YxZRMzrdb0lc40yKEcKCISJ/7AkRybZvKjgLvKKhXIRKum1hbQkssjB
         CYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159684; x=1776764484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxi6YWyMlUMtQOxgVUNZ1znAX33hkHtx2uWIFxQzWfE=;
        b=Fyf90Ck6GIRdly0PKFEIDS+0FyjsRsgjYeeS7lBf+7JaXhq+o4USkSzaNhrSL4Ffin
         ccsh+Xy1srr2Eyufvp6FUJfQmscYQvR5dVfqFUYgVIUNWVECFctd5FPgTd8HHOmx+3uu
         /x8r7p11lgxL3S2cihhAQreLdnyCCO3yRqPMIHHieOKzgKaxXvwrFC4eAt+BRgl/THcH
         87sF0hm34YKShmkTsee5ugZn0WsfLYLaeh34nCv0iArHWcO26JS55cDXgpDc0su1i7YU
         ZSZumX9PcMbqHLRXA+6dvrIERcVMQgGiqjynTehMfR5y+mM64wLVTSpQLsRmSisXnMVK
         7YIw==
X-Forwarded-Encrypted: i=1; AFNElJ9/dZUwqB1yRFb2iz+hk7c+YHPsWeDz1SesTNVnMP/5VbcOa9eyZL0l2xx077NZ6qoUvDf+3g2vpdWb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3gdHN5LwqaoLDuwqUzvyRTQVhtTqNtfBy0PcyXYAGuFoxX3do
	tgdN+Ye/GqY0nulqWL8RLfATnXHU5P/f8avOpcQ9UR4oKFrbUBNR+zHqorZR4CAV8UJvWcJHE1g
	MK5Q0Gi1Uv4JLjEwzJdcXQfq5RF7+L2Z8AzV/pk96CuD4NhLrnmTmg2oUWuYOKJHp
X-Gm-Gg: AeBDieuUl90xpeYpLJpLWjef3b3KeOFQfcyZgdZHoP80EAy+l5jk2kZaOrOfdqg6EyY
	ohFsKfesbC9v3WLQ5R4wT7GkBnF75cXxJKY3ALKu70oE66w8yj/5l3ulU6GzuUx+WBlfq4f3eVa
	zyV2UrAML4mn9o5yYQ7tNd3xJqOgCsfBll5DH9yN0v0GQZEs+iiTXcWwa0nlZWhJAo6xsGMXsDw
	1EW4puQ7hsrcumDcL2jpmkoXmcI7yHxXL+52O5TrCmZIx/hPa6tuvYgPdJpslz9hi6gBkxS5kMT
	UsiCe8p6GqQ7r1bGRtuUQbtUHHzKs9K/px942wqzRDYZItRd8Gqu+OlVyLOL5v8tSDAXMxiIW7b
	Zblnux7K4cGSEX2q8ialsiN7NAervgtacVPs3B65XVLGDMiGszyvFWXh3DNapeUOtnI0bvNc6bb
	arobqkCHQknXOvWA==
X-Received: by 2002:ac8:588a:0:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50dd5c4f080mr171301331cf.6.1776159683846;
        Tue, 14 Apr 2026 02:41:23 -0700 (PDT)
X-Received: by 2002:ac8:588a:0:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50dd5c4f080mr171301091cf.6.1776159683256;
        Tue, 14 Apr 2026 02:41:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c89fasm384601666b.49.2026.04.14.02.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:41:22 -0700 (PDT)
Message-ID: <db41fea8-8738-42c7-8575-ddaca999620b@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:41:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] ARM: dts: qcom: msm8960: huashan: enable Wi-Fi and
 Bluetooth
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-10-007fda9d6134@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-msm8960-wifi-v1-10-007fda9d6134@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HTYs_8W21Jf4_XZCY6TtPdV18G-3tBT8
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69de0bc4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=wxLWbCv9AAAA:8 a=EUspDBNiAAAA:8 a=6yk2MuD3qlwx9g5reDkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: HTYs_8W21Jf4_XZCY6TtPdV18G-3tBT8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MCBTYWx0ZWRfX0X5ePR09IawU
 UJvCm39VRpFcDeBxvVRXXwFWNBixwLjDg/T5M2LiC3kn/SiBMtz+x2P2yXAF/6ap9C36KaOSLce
 i4xygk2R7NPRa9TwKBWAh+CADA1ryHAFV4UDp5SUjGVRJo0ZYSOtjuR7SZj614waOqJhnQce/hs
 hLYCCXVM2iCdIhWqMcMU05IdXeEq1b558rd6He1EfxTbw1HQET3UnC+y/4UOVn+WoHWT5pLHtGQ
 jN1L7VxDWXDnME5bd0vwD7J7jvIENJgvBRSkH61qUR5+gtJMWnSx/JZt+ogmVNZchpf2fdmhwcG
 fyddWi2TxbUwoPbsCAF1c+VXDW4jeAohDg8tZLrCPuoNdi7p7Tej/K9hm7yU2u0XkxjcdPjUZDQ
 DrZFJpgX+FS7wsXlBPihSN5c0vXgvL1V3weO/cw2JcP8YYYWAiXkPbC7C3ugJfkF8vGUVYpzU/Y
 DqqxFCq4dgVUlWqdVlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140090

On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> Add Wi-Fi and Bluetooth support for Sony Xperia SP.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
> index 591dc837e600..79fa9bd038f2 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
> @@ -95,6 +95,25 @@ MATRIX_KEY(1, 1, KEY_CAMERA)
>  	status = "okay";
>  };
>  
> +&riva {
> +	pinctrl-0 = <&riva_wlan_default_state>, <&riva_bt_default_state>;
> +	pinctrl-1 = <&riva_wlan_sleep_state>, <&riva_bt_sleep_state>;
> +	pinctrl-names = "default", "sleep";

You can probably move these pinctrl assignments to the SoC DTSI

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

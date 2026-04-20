Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F076C39F165
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776681831; cv=none; b=N4FfzKAfZRIhAqRjOOHJzl6ieuzvm2IQuObjwEjlwcCtYmqZd2/YKwTO52+DVGew2HEUxiUra4j1scacE0yI5PSH2fxoUNTPhesi+AVIPaKxYHauuuN053t5eaim2UiHFSmINYGuC4veaKwSEBn7lZv0p+uHC+HO/gS5zTS/4rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776681831; c=relaxed/simple;
	bh=A/8KwbflkQboGdPx9Be7plburoC2MMh+V4Gv8+upZik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZ6/H6HwLWYMP9JdPFPIStIRApET0z7cjA1d4aSrr7IjwiXoAOz8JjCLn/l113tre3wcdCSMX02ZYVR0w/KzaTShpb49qfIiXU37XIwx0DDCKteFCtNqC/V+GfiPH1K6Qu0jeaU23+fb3spr2RKGCmNF604Y1qoKCsul0QmE7ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExsZEK8y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YArBiY0O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExsZEK8y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YArBiY0O"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K70J0L3212158
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUzi+s6xh6/iuWZ0wIL0wAZ4vO/RXr7dThEg6jVHUbM=; b=ExsZEK8y+geZAxGr
	UIO8aQbeO44tX0iTGbAFNy4yKSwvqlMnX8xZ986rOD9jsZSYCX6o74kquCaswEEx
	LATiNahkXNBhqclp054MLRG2F91a41YksN42YkldrSAEyA90Yfdb8XQ+b+f2OS8b
	PiTBNKOorPnMQXdibd0XH372b1YazyuZBSdZmuyr+AGi+JUG0cnDuvyI3A6MDzXy
	l7PoTnXfEje5w5FFG5DWl5B7E2HZ2pE3CJ+9XSmA+5AuxZiEpD1zPKrJ2RU2C02b
	DZBcv30coG3lS7cnn3FK+erEyHagKC2t/m+Lr8GjIE/HpX2C0Qvk1YP1eVeapCyl
	17HWsw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfcfh30s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:43:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b241be0126so56053385ad.3
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776681828; x=1777286628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lUzi+s6xh6/iuWZ0wIL0wAZ4vO/RXr7dThEg6jVHUbM=;
        b=YArBiY0OMlZezVkT1yyZAfCLK1VDHQQrGhWQ/BPZmqN26IQhHBdPnj76KMOYzEvy3a
         P0h63aXXkycVL3CRIyRtnO1WXYPqiepkvAP0dEOVJkwqDZ80oZ34ixHyYb3VaEjIynB0
         B8sf1/onKVXDSBRm0W3txTbELegsylFLPtYF13F+tH5uUlC11EdyxKPdZl1NN+8EH3QY
         JoiCx24qkjmdlOeCc59+1TparfiWlx61unqmqhOKeE8mLF63pdmJlS1tcSyNJotgiXQG
         LQDrLKmOnRr35PAZQ/Q/6b262jaJKWHcTdY+Zrgn8I+e9rL5VGAjJybd8ixaRRqHz0dm
         0KHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776681828; x=1777286628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUzi+s6xh6/iuWZ0wIL0wAZ4vO/RXr7dThEg6jVHUbM=;
        b=WT+I3H8e16S5o4g+luTIIETX4zO3IP/HfCbN0qDc1Mazk4OMa8UvPwXJzaJ/cVwWHW
         veMWiegNXxJ+mYO4pA+5wKuofRfbYQefkP5AKN0O0S+jr+Mk63UeNeUUZxdZS5gLjDPa
         1q0iTf2x0+vdvPFwLzpPU4BoeW7JWYrPHfzML5krB3FbYjfZJuHAxSJyNpCYXGN8DiCs
         Fqzzy4x8EFfFPRoIHLJ5CK3W3x0sAzuvAAjoMbtCkJBlkId4YC4EJkKYz/MBCn/gIpCj
         1W6glOh2H5MTZ71BC+0soJerNGMntFHBnax3nEOHSg36RBrcEQRec46QYUdVYCOeO2l1
         xesg==
X-Forwarded-Encrypted: i=1; AFNElJ9VXEbSWTzCBv/Nvpia7BfWEM+URRPRDHr/tnNvmjyuIr3tyQB5v/HCx7moXDf7NLDVKVKNFEDBniTF@vger.kernel.org
X-Gm-Message-State: AOJu0YwnJu4yCMMqlp6gnnDaXD4Ojb4owAicNxjgObeKaebzTMGVnxbD
	Aqi9rcJ6g4jbX34uYBX1h1UnXshG3qf8XvnIA/QiB/ZxsWRSyinRlV3QVG9QniJm2URQKuKwPqM
	txiLvIULbRH94FFFrYvrX8EJ6E+NBM7ewK194tWN8FK+Pj2hojUXcZ+vJgvu8TDnK
X-Gm-Gg: AeBDievTOFp+q03xmwRpE2s7YwXbakcuiJJET3mZpXnWx3Fkv/qiRB4bMNpXHeWyXhD
	iEEzQMVEmRDKVyxSDCPZlA8Pr8aEO+SwdTrLhrkgDUOq+ucAMRDUIW8XhaKU5Ih1saPQsgzRCZt
	OzmXYSsDqXVDWpW26pngmQqXoA7RlLlciAylScyWCvviiHhniWYtm+DuufW5ON6STXS7uj9VGyI
	63ehawyEHAGbRjUUdKe1kfsyYJO7qkuTLN9wqertm7bCS3yFNKObtKRmuLWMyP2rugkT7KSx0zj
	qjNM7gTVRBXNcwy2lM+VyC0GdW4lO+s5b3AIApyPijpDxtYygqqJ7vritCjgvRN4LLtypZPm9gk
	odrTTuvim0k4HxS88D4aSIxo2i+TSoPi3OKzsqilDKzJzgJGLy8KMmAA2B97P
X-Received: by 2002:a17:902:e746:b0:2b2:42da:25c4 with SMTP id d9443c01a7336-2b5f9ef6877mr157919135ad.14.1776681828032;
        Mon, 20 Apr 2026 03:43:48 -0700 (PDT)
X-Received: by 2002:a17:902:e746:b0:2b2:42da:25c4 with SMTP id d9443c01a7336-2b5f9ef6877mr157918885ad.14.1776681827537;
        Mon, 20 Apr 2026 03:43:47 -0700 (PDT)
Received: from [10.204.79.66] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa1739fsm102350905ad.22.2026.04.20.03.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 03:43:46 -0700 (PDT)
Message-ID: <94253a08-3a4d-43f1-88cb-1f3ee07e8545@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 16:13:42 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm660: set cdsp compute-cbs'
 regs properly
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-0-f6c7ab3c889a@mainlining.org>
 <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-1-f6c7ab3c889a@mainlining.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-1-f6c7ab3c889a@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEwNCBTYWx0ZWRfX77Gs5WgJLsRs
 vraPoYhyYCVLWLpGZE38ZiwPuNScNdt46rUEavO1C8K0obrNkfRRjzHyY0TAUa01oaggjcK7kRy
 hnDDTINJwXY2A7jVo+Caze/gARE6ZeZSKEHhqp3+BvnKOR7RHNNiiilc+3NWVU/oBi8+wjUmHlM
 +SQUXwNmyGXtv8MngdnPa9VCNJ5zAcijhupmtj4tmuvyMm+7oVplCHqy4l1mmQymPH99A9Zz5ky
 reMdRO4+45E9bBERHwbGVO6F7bUqzpauyVjuqzwQoJoS2GQLPg1Jary5AAcJfVp3bSKcjDGr3jM
 lsWEexn55ySfHEpKOTfPWUCczpLDwHsmpx2dUhIvr5l6kNyNQBdFK/5EInfceg4yLsrSDFkNm+q
 Ouj8i1+r4UjndpmQsBJjB7miDzATmL8/6oSMkAW1lkFQa8ck2lvBQ1PxoAr6iV35kLW4aaCQOvH
 fBdvIpEX119SewqHC1Q==
X-Proofpoint-ORIG-GUID: 7MLv9qjmCgE-BGW6gTdkHvRPc1V6gXza
X-Proofpoint-GUID: 7MLv9qjmCgE-BGW6gTdkHvRPc1V6gXza
X-Authority-Analysis: v=2.4 cv=L+ItheT8 c=1 sm=1 tr=0 ts=69e60364 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=WObRYmeZDjoqXjhBP2wA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200104

On 20-04-2026 15:12, Nickolay Goppen wrote:
> Changing FastRPC compute-cbs' reg values to matching iommu streams
> solves SMMU translation errors when trying to use FastRPC on CDSP
> so change FastRPC compute-cbs' reg values that way
> 
> Fixes: c0c32a9e3493 ("arm64: dts: qcom: sdm630/660: Add CDSP-related nodes")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm660.dtsi | 36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> index 3fd6dd82a992..0fca9662c64a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
> @@ -350,57 +350,57 @@ fastrpc {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> -				compute-cb@5 {
> +				compute-cb@3 {
>  					compatible = "qcom,fastrpc-compute-cb";
> -					reg = <5>;
> +					reg = <3>;
>  					iommus = <&cdsp_smmu 3>;
>  				};
>  
> -				compute-cb@6 {
> +				compute-cb@4 {
>  					compatible = "qcom,fastrpc-compute-cb";
> -					reg = <6>;
> +					reg = <4>;
>  					iommus = <&cdsp_smmu 4>;
>  				};
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

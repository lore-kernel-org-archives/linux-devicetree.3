Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD94E3EEAD7
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784014673; cv=none; b=qdQdsZlhdSC320Lh3IbZPKkxEa06n6C+l8FWmgLNUfmFGrJMHiygKbznuGSl4rywYsqL/G26s1CfwymKOxmmuG6w2Y4EFePkiT8ssIDJi6cDiGBfIKnT3yiyrVF8vEcYrCqxUw/KfXAVEvw+J87+CDi30cN6JeBtFENzo/JGCyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784014673; c=relaxed/simple;
	bh=r99awxz0Gqs2oWlAIIX7XqgjN6912zD+998H0GUE1g4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPhcII3dqqzxqs5JfZhaR7lghbng1i2uUo8lwrxdexi3UflmHD+pK7If+zx7fhPCrN1xdRkSadV8PXpdiu6yyfEJVk7lLEshCAX6j2SvCz6WWHyYDWWxrOODLZ4FbdC2BHqErqVNJ78yRGp8eA9MkTsStZ3xSqyqnnSiPuu2kTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aNmx+RMo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dfm+vxwG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aNmx+RMo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dfm+vxwG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SSvf3740457
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e8cmj7ExWQJxMmHoSgBCeQ5Z4Q05ZEN73r5TB6NB82w=; b=aNmx+RMoc8YaPiPl
	KpDEzaVaD+36CFPjZCr2bHaRaz8o2c4ACkNhiVYr857qoXE9ShoGgNxWrFpFfVIn
	AeTDls4TRCMsHc8i8D8vX2ph4l9LQEVDmVMQ0lRBkBbiedzqcnD3Zes6bqBsbvks
	kuPz4rRWKWiJPmVeijiU31xQ8CqPwGCvIhW28J0uONnJ3qQ+H+4Nalthdd293fZu
	10V5Gy7SZt9TszFior6Vv223V04GAt4VWJWHsJ1aT2jf9Y34dB+TV1HzvUP4WkNN
	dst2lu5c/pAGuEeVop05oz1ZzpGZNMsGG87bSi5KJwvdAmeDThyb+H3r2AtsDxX7
	VA8mHw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdde08ure-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:37:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc5faecf01so76664695ad.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 00:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784014670; x=1784619470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e8cmj7ExWQJxMmHoSgBCeQ5Z4Q05ZEN73r5TB6NB82w=;
        b=Dfm+vxwGvOzkbHHmv2jL57vKuhCS0RiSuxcW1QRT1LieiAp03yMyRx7ebjTvjjHO2W
         7wTtp20s3A5wEotuySvPhAWep87071+giPPNwTr1+p1uTYlqVSW/keMgmvxyrBS4Xk9A
         JriV4ggbdnkIGNuLd7bZh33wvr7IEzSwpCu8wTeLg+FkJCycP7cF9jcCE5kUx7/VFkSD
         BHp0N8NkhG8C30gv81oHLv/qk5tZYlpc5GCFAypQWoPwSs3MTa/Xl4M3xMvjiRCv8qCz
         s0v35Ch81EDJZySY5SCe9nB74f7Z2jXVh7mzvoML1QtwIJuo+12G7o6yrwn/oBsSEGyJ
         2SSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784014670; x=1784619470;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e8cmj7ExWQJxMmHoSgBCeQ5Z4Q05ZEN73r5TB6NB82w=;
        b=Cb95uBjVdmSrXlK2fy4a/pAI9A6giFQJzMCBEieiolwuNuG6kGWTFlIHEgis//Wi67
         a2oxZo2RZOsupAzM0aFVYb66/ySrZ3FK9bMPKrhJvn1HgLw1KRrPqARbcZMp8fnG2qeE
         nBwVdMeLrD91AI+cjSwPPQBEboUzHebJWPWoYh0bcIyJbEvA6XTQHdsgnZdD7YyYmzBC
         rXuUD+0a+8cP8WyxW1uGVvHzPtwdnARO2CwcIX1T3y+gjgeJflrOPdPB8nxGXRiiHc+w
         uJVFuF23skzJeHPbSzPpFj+nI8ZmpCWoyQVKYogwbbpQjm/eZwoRbc2A2TwdG9scvi5L
         OrHA==
X-Forwarded-Encrypted: i=1; AHgh+RqHQsSPkL1vJiNI/WrpzYPdj5dO9Q6F7wLSIGZ7d6j5MxmXFm9j0Al9nibBpciukOHKVGTOHZvwhIjJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzWARV8jK41h2hSi6Lfff8Nz+mtc7CZVjt1Ww4UX4Vgmr0tbtAl
	v9BQCGi6p84Rf7oXQtv7FAFhD9fXqQH4CTFKDg/sKoczg9QuxGsddbMlw45l9eMZ6NjFgKr4k34
	GZg/Nk7TTonH4emeYDTdlYxYuTNSJfQN4qgwcKLfUVx2uTGGIxaZrYu0nN+91IbjM
X-Gm-Gg: AfdE7clDzM5xBLYLk1HLaWsZJrBJG+PCPRArCc8Sdus9Arh5o4X7glino51Z+GKw30l
	7EzCg1U2ukL3GwyYXIwmq4Zx3KqDPu/mUrrP8yarTKEz2fE2A3fCtSl4kJyc+nFMmPXz49BFH9r
	nd2joMD15lWy7OlIXvSteODw4iNpYmcSoA6szNEIxCtHjUp2zJjBNXNtDBsz0ojuyIj34tSHIHU
	+UE65CuGr1rVhvX7rOdyutJCOl2nuuvZ06AQikT9rMhy/eC5pByFf+2uXrYvxPsDogbRMgnddXf
	OwpYmyFGUEuOqf1hb7FfhIN4Hob2bioIswRbF0RkMbZGaXsySYHHbzQgOmwlb49T9V7fCjxoYbu
	dD9P6GeRidjHR/8M/pjNxL+s/2eMsU9jVW25xDVQDocK0YX8CdPbjStfXxs8BCVohWmPFnrtQzd
	z7I6M=
X-Received: by 2002:a17:903:3bc8:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2cee9a8bc0cmr26774875ad.14.1784014670576;
        Tue, 14 Jul 2026 00:37:50 -0700 (PDT)
X-Received: by 2002:a17:903:3bc8:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2cee9a8bc0cmr26774595ad.14.1784014670179;
        Tue, 14 Jul 2026 00:37:50 -0700 (PDT)
Received: from [10.133.33.66] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm111613785ad.67.2026.07.14.00.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 00:37:49 -0700 (PDT)
Message-ID: <f7996f18-b63f-48a1-a680-467dcbaaa5f9@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:37:46 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: spmi: glymur-spmi-pmic-arb: Add compatible
 for Qualcomm Maili SoC
To: linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-maili-spmi-binding-v1-1-80fc4b6bb80f@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260609-maili-spmi-binding-v1-1-80fc4b6bb80f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3NiBTYWx0ZWRfX9tTSOqemzC9f
 zbgFOX0TZhulqvTMZNH/Lq3aGnYBgPOn9OTZv8b7sNRPbQ1PUSQXByQRBJ1y5TZ5Ati8YGOXNI8
 PC53aTLCHBB3h9IeqEtZblzs3ZoCbd8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3NiBTYWx0ZWRfXzFfQVIafWe/0
 KjTwLexobPaCHFoT4NNEhi1BZ8NSTcnO2269zkVYeTWKKGz0kK0tgLcIyddO4Sghm6iYUar5T86
 DIYS75IorveAP/2C5qiAahLORwD0UYdZ76MQTTTCqJYBTVmRWxd9u3rwnBStAW/7XPbqFeodflK
 bYguN1309/PI32z4GWvpdN3C7ztCGDcCFcX9kf7ufYMOQjnGMkZg3TwTeEibWsaGm3r72v+tdgC
 Cgbwx7OpU/M9iSiVkNHCxhHPIIyUjjpTgCFaJEIUa9ODVySMT+Ffc+X+TqHmJiHGVgOWgWPUQAu
 3sGwCtcVawf568MLsYJ6qvGPDKCCANAyKYjNGo4Nkf2jh5BdYmc/8p3dFi69l2wI64IIoQZPzbp
 hC6T+FtRJ8YwV9iiffInmf09aC3fpTXLuykBLy3wxyvwHwmSBQAeXyPQAEHwSzPoJ/agxP97n6v
 lv7wJvnaoSCOvD8J+tA==
X-Proofpoint-ORIG-GUID: MccCH1v0JhrZOQadMd0GNdarLcVJff-g
X-Proofpoint-GUID: MccCH1v0JhrZOQadMd0GNdarLcVJff-g
X-Authority-Analysis: v=2.4 cv=F/FnsKhN c=1 sm=1 tr=0 ts=6a55e74f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fXidXHBQz6jtLiNKt2oA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140076



On 6/10/2026 2:29 PM, Fenglin Wu wrote:
> The PMIC arbiter in the Qualcomm Maili SoC is version v8.5, which
> is the same with Hawi and compatible with Glymur. Hence, add a string
> for "qcom,maili-spmi-pmic-arb" as a compatible entry for
> "qcom,glymur-spmi-pmic-arb".
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
> index 1593a1183a36..44c864fd5fc7 100644
> --- a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
> +++ b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
> @@ -27,6 +27,7 @@ properties:
>            - enum:
>                - qcom,hawi-spmi-pmic-arb
>                - qcom,kaanapali-spmi-pmic-arb
> +              - qcom,maili-spmi-pmic-arb
>            - const: qcom,glymur-spmi-pmic-arb
>        - enum:
>            - qcom,glymur-spmi-pmic-arb
> 
Hi Stephen,

Can you help to apply this change?
Thanks

Fenglin Wu
> ---
> base-commit: 3443eec9c55d128064c83225a9111f1a1a37277a
> change-id: 20260609-maili-spmi-binding-dbecf60b498e
> 
> Best regards,
> --  
> Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 


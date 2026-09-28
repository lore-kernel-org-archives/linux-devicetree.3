Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC53433A02B
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 07:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790579991; cv=none; b=vA0t559QhnPQ99uynFwKUsjn4OlBb01u+5aFJ1DMAdotD6ayrhWb7kg/znFiaNWgXxm8dWBcibct4HljFjKb5b5rb+hNz/pHBBuCVZ9e8hEFe3Gdo8OVfdDguZMX3+Rk4Sn+kblGR1ng2EskKU3q52kXZVs3b5c7mh5LnEjHyqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790579991; c=relaxed/simple;
	bh=Oc81tFYiQYxi/JREaRgWDxPfwdCz4yFGAgIplo85qqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KfYVqyOrC5N8g6zJoqGPzm8tOYP+OffI/A5ToRdZWOJxg3eG0U88jPNC6XdL140k8YaBeBTdOahMiRz6qaOPCDC4UY7OAl0vauqfxvHC2GtuofabSXt8j8roaPLcjg4lQ/O3B1Nz6CGCe5SZLD+kZ+K5oFFSBBAAwjJh++hLX8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mKeEsUHz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpYLJxVM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mKeEsUHz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpYLJxVM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S5P6Oc675163
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 07:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmnJtVtthIqX9DUYl2s3EI3XPV85YmtC5OAaXBbwo8g=; b=mKeEsUHz/eAUttQj
	JpHtat5a9VUaJslw+1MsDc0Xf0/eJXhpVMHxkU5QJQAdO1q9DKbTI6wwTwFwCh5Q
	ViTO2qhAUjg+KsKyl4ZLWV0fC/RcVuYnypO3Djy3AsxjIGqrqGRHf6EhIMkGP/jQ
	nFJWfi9YD72y8Y0wyL0DHPIK3LHLRuk4BivIT4KucM5aiec62RGXcPQDPWhFYwug
	CR2f/9O1vrq14PiLzs7Nc0b3ZtyI2wxOO41hC/oXAhpz6eiNgXVVr/HmIgo7vgf0
	y6Z5Ei/uLfweB9if1L0oYtiMRZqYjpUWxsG86Vun+vLCPeuNPxdO0bva+f4a8x4W
	bDwDcA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s0cdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 07:19:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so6218549a91.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 00:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790579988; x=1791184788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmnJtVtthIqX9DUYl2s3EI3XPV85YmtC5OAaXBbwo8g=;
        b=fpYLJxVMAT3Pgo5wQ0JcSA1OyGtbD8vUm74pqvlFxdsb25Zajabm0PXYtB94QMD+Vz
         h18QhlOcq6LicuMzgOYvwR5PbDQbvJ8ZBoeGmQ1X7hmAQls9PXgADK75+TYFpb4SzonM
         chJdtDR2Hy0i0Xzp3RBTbj5neU6Ivm6MXXGHGDAmDq8vvOo25q7LGVfgWKpw8PlAC06w
         vEjuFZPOYmNVtuJqsuLUj/7in0VPsQIerbHIFjIqq0cJ8kBNh6Fxs8Vaw5M/l7PUTxSV
         oKExMHL86cK8vhibsPPRG63tWZItGKQT+miPc1NWURwIPiPTPCETA6HFm3BSV3/Gdrt3
         EUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790579988; x=1791184788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmnJtVtthIqX9DUYl2s3EI3XPV85YmtC5OAaXBbwo8g=;
        b=o/jjP46uC0HN+RvcTgkqHYwLugKlofMfGvZCrqBRTWwIDMml5IY0KbgOnKZENM+dKl
         jmlQBXxqt7oyaG2TTfQb7MsyoUudd8EVnz9HQkIC9tLElCkEhoyhv7o/kPpwN2qlPyEe
         TvSpMfkuP8BCf16ezLy/X1hOudiPQ57hKMVTVoZ032tzkd33iIhibRdPg3h+va9F54xq
         NrSs2en6md+e2bJHjyPO1nYfTG2/KstYCgH3Qv5G3Nr8Se2wO4U0CzI27tZddHi7/5Tv
         eGNTPaemCqcsJz/glkCm5IfcvrvhghnYzyzm4ueJKAfCOTxxc2MN7J3KGVBYEZe96hvd
         RrsQ==
X-Forwarded-Encrypted: i=1; AKwUvByL+WOAmIEBdeBH7mtkaOTb+k4PKnmnl91YKC9gd2lSvDX4kD6ZERU3FLOrlCevFZkAnpCvmIqxvHg8@vger.kernel.org
X-Gm-Message-State: AFq9FYL6qfMRdwl4uX5ebgK8JGOqZwAWxuphvFYHDFQUQq6UUwJYWCE2
	+ZHaDDAhM5dQLE/S6Gji/4BCaBdSHlO0J3+UhTZBmGcekWjNPvjW53c3RsOqT4BxV07Ia8KB1BU
	mHonQ1NAOWDX6eKJZ5XkRUJZxngEAxgnql25Cyk5YSHG3I0QZ6CcUjkR8RH6VUrBq
X-Gm-Gg: AYBFou1y5kXgppapUGn/ftbQjjVUkAJoX4Bm+W0I0i9GVze0/aFRLOFy/cuXxQucv5q
	yqxEPzl+owHdJ8FdBELEGBXx6BUA6rBSTMBdqEAPPf3M3BrDR4e2jYXVQcDeRhnjzhPiMJ+LyAY
	Aeg+tIPFgVnRdITFww+YEZjI7Hy6LKHJlNSSliAbsujVqMYJxUtyKYxWrzI0k9HMgcjbpSC4A+u
	FtSFcFWju+hZKJdBcsSuZG3uALvTt0nvxkw7OADqss2N4rZbUnyn8T35naI/NXwFllo5NGDkbfo
	r5IzHD9IH4WDttQDQiXu6AWpNpLALOL5Cho0OtcpiDZyhdcelPs7G8O0WJWPSJ0et5yiNhp86HA
	xcoVa3IWSprSPIifMGH+k1jyzs1JQvWt58E8h84xZ4dAtQNWUWGD5BRsg2/vBMeJtsAMhAQ==
X-Received: by 2002:a17:90b:3a08:b0:3a0:7d5b:8d56 with SMTP id 98e67ed59e1d1-3a0bb599f07mr6886896a91.28.1790579988204;
        Mon, 28 Sep 2026 00:19:48 -0700 (PDT)
X-Received: by 2002:a17:90b:3a08:b0:3a0:7d5b:8d56 with SMTP id 98e67ed59e1d1-3a0bb599f07mr6886875a91.28.1790579987658;
        Mon, 28 Sep 2026 00:19:47 -0700 (PDT)
Received: from [10.133.33.62] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5d0sm27648298a91.4.2026.09.28.00.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 00:19:47 -0700 (PDT)
Message-ID: <31a59040-bb20-4cb9-9dad-a62b90a16c6f@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 15:19:42 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Qualcomm Maili SoC
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyOSBTYWx0ZWRfXwSmi5MvLqGG4
 Naoiqo69S83BYB5VtqsaygtDZoFSjKjbVWkOQD6RvYE1Hm31h1KLYBzheqKMEnJ7w+bs+Xrp7A0
 j5CDYL7QWI509mZ0nu/FJflGG1oudcfHDr0bcaQAJcjKYC6vocQVQBgxrk3NCNpnMoSqNauRJPs
 RU0YkCQzmO13Im+9UkI4PHqrm95dXv+Dw4TaqWk2h9/U3cj3KcqFCkQq/2QWAdltghDuQGTHRao
 hk3gNpmGLc/PvEqeXYfGwCqVxfTjwdc2ADZFxeaKXLvCWSmioYtTSxm9fgrCXsvCmDLJeayC0r6
 wccZjbiWefslfZh4vpB+yQLrIR4xacrN78Dv0Xw7X2yImttW1yAe5QMpzcgvW8u8w+jNonXI4Q1
 2EEKncKL+P8U3mkiQ1XmB6e69fO6NZ4gvGdOseY/IS4z0iBIqFNWv2kNx4NcZWkvUW/7SQugq10
 J341mADEynD4c4fXOoQ==
X-Proofpoint-ORIG-GUID: AvSuUDGnPwd3ti9sQD9lFPgOobUUrLKo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyOSBTYWx0ZWRfX632qguRk2Bsx
 RYCZdxC1PzVJnOLgBSuTGS5FpQZlxFeYXkYCo1scs6BJ0NPLI2AgQM0an4rKL2q2sO4yLDUEX0a
 wq8cQDdEpM+N5CDG23M7sHFjGcoVFWU=
X-Proofpoint-GUID: AvSuUDGnPwd3ti9sQD9lFPgOobUUrLKo
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba1514 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=B1sFI_uKEMQSKxwX0JYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280029

Tested-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

This patch applies cleanly on the lasted linux-next tag.

Thanks,
Jingyi

On 9/1/2026 11:53 AM, Fenglin Wu wrote:
> The PMIC arbiter in the Qualcomm Maili SoC is version v8.5, which
> is the same with Hawi and compatible with Glymur. Hence, add a string
> for "qcom,maili-spmi-pmic-arb" as a compatible entry for
> "qcom,glymur-spmi-pmic-arb".
> 
> Reviewed-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
> Changes in v2:
> - Added trailers
> - Link to v1: https://patch.msgid.link/20260609-maili-spmi-binding-v1-1-80fc4b6bb80f@oss.qualcomm.com
> ---
>   Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
> index 1593a1183a36..44c864fd5fc7 100644
> --- a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
> +++ b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
> @@ -27,6 +27,7 @@ properties:
>             - enum:
>                 - qcom,hawi-spmi-pmic-arb
>                 - qcom,kaanapali-spmi-pmic-arb
> +              - qcom,maili-spmi-pmic-arb
>             - const: qcom,glymur-spmi-pmic-arb
>         - enum:
>             - qcom,glymur-spmi-pmic-arb
> 
> ---
> base-commit: 3443eec9c55d128064c83225a9111f1a1a37277a
> change-id: 20260609-maili-spmi-binding-dbecf60b498e
> 
> Best regards,
> --
> Fenglin Wu <fenglin.wu@oss.qualcomm.com>


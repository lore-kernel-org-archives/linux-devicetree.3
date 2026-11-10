Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794290294;
	b=JFsm8YEqptgmv6bjEvF4YV4BBTwfzP7PhpopriQd397x4YAl4aoWT95VX0vmh/gPHgiX
	 IbAXKgigYI60EiEtOynx/Ac1VAyT21dL0CCX1wOFsD2dqpyczjZ/DqRu8RTPaabW0htnR
	 7klCd+XM6T0XPRBA2PM55oALGMfeNLVcyPNFTV2NS13s5/ipsxjdrQ2exORfdE07rzpuk
	 3OIBDeqIo/oDo3iBzifacu2wOIohP76y6AwOxW1S8t0B0TBp/CutbP9iUUmVV6O90xcJR
	 hpPhUwxJgPwGTex9rmd/7F9+3yNYnEBMwbUejLCPxufonNBjoukUP5ZFcsMCsLflKKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794290294;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S6dsqBWbuytPcI1KrzVKzFs9OzZoeTdst2nXpvOatVg=;
	b=slVOdOM7EzCRnpjjcXPWL6i8U4thXA9NSeowyR25rjGzF8x5cAf8t27NB1LqgSoegnW/
	 ckSybAIPA8kYEfnTaDcoSXF6ZHxsm0y6RRmoNdPDKtcB9Q9cIkw/7eQT4aic/942hYpuM
	 bl6KgPeTtzOhcmpvUjEE9Q1J9zIYavWqLESPTOM7VkEY08voDkbMF0pEGTx08cfG1mjTw
	 Hs4j7xMmG37Z4AcDDF3qHyzwolSzyVGjHN8dVQHPje2sIVvQzghDZmI46Ofl48d6+lLgO
	 VYp1UBJbPFJp5rUSO1TSIsag53a0t5Q6MG4FvC+FOMlitOnMT/RDfGdwQImWBTdZETA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kyt+84yc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fZ3Nb8xe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566A7606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 05:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 566A7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kyt+84yc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fZ3Nb8xe
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4AAtb2928593
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 05:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S6dsqBWbuytPcI1KrzVKzFs9OzZoeTdst2nXpvOatVg=; b=kyt+84ycqclKfaH4
	u7uAWPXvVrHYt/r/YSeTlrW3ppiLD15czffeAWU7EQADfuV2NGhhYPzhDWeTFfND
	2HMm6cMOWjzP8vw6ftiwAFEnUQYAYI49txSwOzze5zQlhTpolUM8Rlk43nRKECOw
	1s6JjkWJRjOj4DI13eSKoP1xRgZJySBOaPYs6P9yEuASHFo/e5F3sVMXw+TWcpLQ
	kTIviImO6HeIKL1y4SDM9igqyrZSBZa2SXowWbxcnxaSD22MGXJwv3ublnssBz0e
	QTFxOBSXJHlAO7tC8PCJQYyZLVf8RleaRDm5w9cpqDVuK+U+4DiVNGyJcIx5UHpg
	1SQGZw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx837uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 05:58:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so2638485eec.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 21:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794290292; x=1794895092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S6dsqBWbuytPcI1KrzVKzFs9OzZoeTdst2nXpvOatVg=;
        b=fZ3Nb8xeKpmXvBC/NUJo/FoAeGbZXyXiis0Ls9ns6+J+18HomUcG1sl4qKWYICZEIp
         j0eXq1HnDiPvG5dl/5FGZWRuokeZzbrIMGvMy1x46rLfsk4HMhJP6tKQ4o/UFo0q63+j
         T7ZS/SxJIFyUOiiY1lTMbNFdycvzBk4r3FFyC/83HPtk9opDS7mTaZ3jOSSjUmKRM3Pk
         mLakOvQhRb6/8USSw5UPNtESfiBkR7btyBWD/9DMl67CqODRMp/wEimJnGUFTgZ9KCYR
         IrSAF5W8Wnyl4SZda9Ho0M5TesbFl+8zgt/DVZCKQQDyMHjAi0KqmGXJZvE2wkTPwJ8E
         Sleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794290292; x=1794895092;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6dsqBWbuytPcI1KrzVKzFs9OzZoeTdst2nXpvOatVg=;
        b=a96jo4RWgVJVJMZbQryxAT2q6EvlrX09LGgtgafZ9HFrI2Dv79qwzHs2Cw2lW8NHf+
         /XR8/7UEhrEmxFqLGJOuEomAh9Oo2mvdCu9DR+rbog14F8wWmbS1QCOwYyT0hDQNMzVp
         IdI2iRve9m993uCGMsUE43cVNJCH+msj6iH/dNW+lojnOc/mXWKZW3pFlL7mLgtv9b7V
         DZj3u6khTskjcBfJIi9okm7QDtDw2ZphuLGxT2GAIQ3Ry0oTnxDPpC2AcZltRm1Bvvmm
         +FulXv/jz+3of6hvlDsWhp5t8P8U4j88/jcaE0zFJgoXgfR0Ol2xrw+1IOPvjRsVVyKA
         BDaA==
X-Gm-Message-State: APuU4Z9Pb+OoEfP1G374a1jSDhe2AQU+CGjILkW8o8PSUnf3CJiRT5qc
	36O+hWjI/KhEVEHyxYC+ifb/Lb6Olhr88ryHU07YyeLnxsVI8Ac2DHz/NPYWoegQvFLka3e3dj/
	Fioa0wRV5jZ3BxE7+8n3rL2K5iFN/V2R5+EozmxRS5hoCBZcmBY7Rv+h8oKvCdA735vPNgHfi
X-Gm-Gg: AYBFou0cvUbrGvq56bIiX8rfrrDz1RUKmPQeMZLT3VwwL9iKuxGbvRukgVxVj9wB7AM
	AaLsQ1EntrGLi46eQWbzCMXSI+dTYPqnEx96qKHnknpeA+4S/g2knF6b85+ccmkMu+LELjKm51E
	Rr8QTxL0blFgSNzoUf1ceFHwqs7Oo/Wl2EvZn+FKmyrIO3WFBk1QCIWGXr3UGiyGSDbdbHNM4aa
	ElmZC9KXIUBAr1Hjr532DXLHD26QgHZZivRTUnKRo1kapoK06B/0H/3X4eCb8Blk17nEcsLp0WU
	UBRqBeTL0E5tXqGkOc8/G3rcANFAEwhOndRIDXT3ssCktyWIOCgGEms/jJfN4OsO/V7wi7l2c23
	8uD5Sk8+monfTC4ndzxLN2CgMooSiWIFo38ifC8NJCuCeJCNUpS9iha8BPfaKb9XxN6S9slEv00
	q2
X-Received: by 2002:a05:7300:80c9:b0:36c:c434:b6b8 with SMTP id 5a478bee46e88-37520714c12mr2860394eec.26.1794290291527;
        Mon, 09 Nov 2026 21:58:11 -0800 (PST)
X-Received: by 2002:a05:7300:80c9:b0:36c:c434:b6b8 with SMTP id 5a478bee46e88-37520714c12mr2860340eec.26.1794290290761;
        Mon, 09 Nov 2026 21:58:10 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060dc0csm4553504eec.14.2026.11.09.21.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 21:58:10 -0800 (PST)
Message-ID: <ab03eafc-05ba-40d8-9e5c-913a0f21741c@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:28:06 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: remoteproc: Move iommus constraint to
 SoC-specific bindings
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261104-shikra-el2-v4-0-97e7019debff@oss.qualcomm.com>
 <20261104-shikra-el2-v4-1-97e7019debff@oss.qualcomm.com>
 <sashiko-outbox-197413@kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-197413@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af2b275 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=uBLy8x19ab8aOH_KWq0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: FQtceCLs02oFuZvhZtjPHf22Kg1ZjjOP
X-Proofpoint-ORIG-GUID: FQtceCLs02oFuZvhZtjPHf22Kg1ZjjOP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAyMyBTYWx0ZWRfX3Rao2pPj0Usr
 0XHd7nK1hKx4/fnBiihoaTa+EbFKSQB6y79COs7dz+yq1bPp9NK7TA5MP+qQm5mJSCz8cN08C5t
 XMl10ogDfCWf/CYKx9EU2XFSjJJ0YWU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAyMyBTYWx0ZWRfX2+w4rO4GLVER
 G0EL5FzOXkQqUfhI1/d/fkzvHMbGoH0MEWuq/RYh6RZE+CDrh8MC+HUqRKFYIBrXrs52CNxV99h
 z3Shsb9dQZbapULdySV7jrD7l7HC/A1T2++yJk0NImGqJ3Rn+GPXd1BA4uDjChVQY/B9wnCRjqa
 co2fTKjXrwfxKFy3NczLD0YTxJFdoqzxAkpc5uvrDmPWRqH8ayLJbIuDTWWPKFXlJbdGcVNefg1
 B0SBS0OlZJsKaPLMXjhupu5R89L2DNUDmrFm0aYTNTH61MyQmFIVZ0c6SbPMYcFGCsS3f/geEYU
 QjBDKxZUZEKOKhbGXavBlWi1Sfl9mqZewllY6/JW2HP+NyWiriZvi7VdYvCWvaFJ/GuiGyzKcGm
 2pohwl4j9NZ0UFWCEYS0TQOOBR3u8DFxrvWf9HxINcD9f31wWlgi8jyucxs2zOADktva8eap8W1
 C0WM99OzSbnDGcuyCBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100023


On 11/4/2026 7:43 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] dt-bindings: remoteproc: qcom,sm8550-pas: missing iommus for Glymur PAS
> - [Low] dt-bindings: remoteproc: duplicated iommus rules and unwieldy conditionals
> --
>
> commit 95697c560209b6d85ebaddcbbc163e85e3f0686b
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
>
> This commit removes the common iommus maxItems: 1 constraint from
> qcom,pas-common.yaml and adds per-SoC iommus constraints to
> qcom,sa8775p-pas.yaml, qcom,sm8150-pas.yaml, and qcom,sm8550-pas.yaml.
>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> index dda2d144b7206..711c2f723b179 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
>> @@ -106,6 +106,8 @@ allOf:
>>             items:
>>               - const: lcx
>>               - const: lmx
>> +        iommus:
>> +          maxItems: 1
>>   
>>     - if:
>>         properties:
>> @@ -126,6 +128,8 @@ allOf:
>>               - const: cx
>>               - const: mxc
>>               - const: nsp
>> +        iommus:
>> +          maxItems: 1
>>   
>>     - if:
>>         properties:
>> @@ -144,6 +148,8 @@ allOf:
>>             items:
>>               - const: cx
>>               - const: mxc
>> +        iommus:
>> +          maxItems: 1
> [Severity: Low]
> This isn't a bug, but since every compatible in
> Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml matches one
> of these three allOf branches (covering qcom,sa8775p-adsp-pas,
> qcom,sa8775p-cdsp0-pas, qcom,sa8775p-cdsp1-pas, qcom,sa8775p-gpdsp0-pas, and
> qcom,sa8775p-gpdsp1-pas), could iommus with maxItems: 1 be defined once under
> the top-level properties block instead of duplicating it across all three
> allOf branches?

Yes, that makes sense.  All sa8775p compatibles use a single IOMMU 
entry, so there's no need for it to be conditional. I will move it to 
top-level properties in next revision.

>
> Also, in Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml and
> Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml, adding more
> per-compatible if-then blocks into allOf makes those single binding schemas
> increasingly unwieldy as variant differences grow. Would it make sense to
> split divergent variants into separate schema documents rather than piling on
> more conditionals?

For now changes are small, only a few targets support booting Linux at 
EL2. If that number grows in future, I will split divergent variants 
into separate schemas, if maintainers prefer that.

>
> [ ... ]
>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> index 99e9aeeb4f62c..dd81ecdb8dc49 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> @@ -317,6 +317,18 @@ allOf:
>>               - const: mx
>>               - const: nsp
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,x1e80100-adsp-pas
>> +              - qcom,x1e80100-cdsp-pas
>> +    then:
>> +      properties:
>> +        iommus:
>> +          maxItems: 1
> [Severity: Medium]
> Does removing iommus from
> Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml while only
> allowing iommus for qcom,x1e80100-adsp-pas and qcom,x1e80100-cdsp-pas here
> cause dtbs_check regressions for Glymur?
>
> Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml also covers
> qcom,glymur-adsp-pas and qcom,glymur-cdsp-pas and sets unevaluatedProperties:
> false. In arch/arm64/boot/dts/qcom/glymur.dtsi, both remoteproc_adsp and
> remoteproc_cdsp specify iommus:
>
>      remoteproc_adsp: remoteproc@6800000 {
>          compatible = "qcom,glymur-adsp-pas", "qcom,sm8550-adsp-pas";
>          reg = <0x0 0x06800000 0x0 0x10000>;
>
>          iommus = <&apps_smmu 0x1000 0x0>;
>          ...
>      };
>
>      remoteproc_cdsp: remoteproc@32300000 {
>          compatible = "qcom,glymur-cdsp-pas", "qcom,sm8550-cdsp-pas";
>          reg = <0x0 0x32300000 0x0 0x10000>;
>
>          iommus = <&apps_smmu 0x2400 0x400>;
>          ...
>      };
>
> Should qcom,glymur-adsp-pas and qcom,glymur-cdsp-pas also be included in this
> conditional so iommus remains evaluated on those nodes?

Yes, confirmed that. Removing iommus from pas-common breaks dtbs_check 
for Glymur because sm8550-pas.yaml has unevaluatedProperties: false.
I will add the Glymur compatibles to the iommus conditional in next 
revision.

Thanks
Komal

>


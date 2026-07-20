Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A4D433E74
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558525; cv=none; b=qQTeB4ug71KIU1OLl+Cd1lr4UtCkaDswGtyMYS+FcoUudy+z0Yz1s4ir41TF4mIP2uWRRTAbQwlE7KMCjsUxGdAfRqKZGr5mJsjiyVUc208zyKDhYwIqQDgFtWdlGfbVixczPpkxRILHBnv4R1u6cyY1VddGOmtkVNpx0SKlFxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558525; c=relaxed/simple;
	bh=bID2FSRrvzZ/HOE6eJxJfAYUzIhLUTI61YUfrj7oEg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uGHEmlwtpIsNTEMPAtE9xMsC6NYxzKfInvoQHKZkNv6rlI4rrobT+c8ecuk+4Zd4g+vsVfJ7WQ9VuODtdTprmDLe5kun8oi+e9SgLaPtOThYHOrwESW3ZqsAMM4JCvNlcrhKwe6tr6VM0CL56tTciPyU2BCa3nhPzwdJcOsqhPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=guJskifD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OtFDA70w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="guJskifD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OtFDA70w"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqtKP2852686
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2BLpJJYIssKHWV80rmLOSVdZoUsiqPhLQXr2/gGzEvo=; b=guJskifDDR2Z1q3c
	7aEtzxRzBofasED68rgt1tMhjFdEoEj5jAmWxrwsC+KdRr6FRCCQf82A3I36Ng8s
	eSwRECIMDOJ9otlOKE9g68m3hKLA9NSSNgHeJGWsliqfheRZERAueTDamhIp5yZb
	xGxsScQvmOcuFKU8aLE4Q/FxbFFhAOVjmK5qgG/77o8QUlxlBkNb8tn9REWRj/JS
	UAzwCc/3vC43cxNQKgVoAIyFeUkoJswZ8Ye+PTS6OSv/NMMDctgZh1nxdROfDQMy
	mypGLgZ9JRnp+ujkV4Yqh9jWeHTJ+DeMuSJ5gX8Xf85bojW9iqCggeuzWnjISAU+
	yTLJhA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhhgys5y0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:41:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c9d953b71so11418541cf.0
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 07:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784558516; x=1785163316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2BLpJJYIssKHWV80rmLOSVdZoUsiqPhLQXr2/gGzEvo=;
        b=OtFDA70wqXVa+euq8yfdDofrG6KjphdrcZnIawQt633EnZC8M9y04jiJNSQKUUTPsk
         8coJpvKGD/meFOlZpC6BV/eInc5sPzdwecq30FYsurwfa80tBZ28UBRS4frL8SL3oqEa
         6ziTyRhnnh481fgozp+ZSl3GM/aLYqI9s6YG5Ihaa89tWlKMaPuWAst7PkyEQEFmfWEp
         0NxpWi7RGXu9qvYSXgJDC1M/SbJlPjFQOIXq+hEMCpVbPOqKZnDFEZiBCYuNJIQ7ntnG
         Xn7Qhxx90vuboKSmDShM7sekO6adgkru2SbWzl3lRFdg79XWK5VVfWFVgRGeGfj634ng
         3PAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784558516; x=1785163316;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2BLpJJYIssKHWV80rmLOSVdZoUsiqPhLQXr2/gGzEvo=;
        b=FeAPAUYnpQO7Uu6xccw8SwxqRWIZTwuL6eLRR6K2xwocP7DIgkl3Wx9BKFHVs4xW4U
         w19uRXNaZFMp1qBB+MIio7ArTUtRCs5XI+w4LFPg3/yiXMUp+YJJFMTgK+whHEtMZsJz
         +EWQs8ENczR1fq8R/RvftASvs6htASeIDxO/gXOdIqfBM9D5Bk+sl6K4q5sh1lYGr5ei
         0MJ1qRqkmXpwWjuMSjB+c1X2dy0gEu+Fia78a8oIOWE9wrM6Mj61RP6jl7wCKBeStKtf
         m4wshLvG+CJBwfd6hJBe/nVB1w0G0CO5WuNf78balDvr6CweAotIPhtaBi8K8cH9g6tD
         pwoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4qzes3YKV2G0r9aqxK7U4zHMWUvvzELOp5wOTrCPEMUOfhiiizTFYRJaI5riUHWe+Ek66qY059q5N@vger.kernel.org
X-Gm-Message-State: AOJu0YwsPppTAba3Njt1WsASzxlFeulMWJx3MNc3u3z9EmYFWrjzy2fv
	KhfP/fg67F+kELU9iHqMqSCCZKEuF0GrEeNsnB67Ww5cbn3JfA/lEPkdAvOULIE/ueY8qvdKRXc
	sK2A68sW+9yKHuEIKqZEed7b6ofKrgFoU1L3LkUBGk/XTqN+lXUulpWH3KoWK188K
X-Gm-Gg: AfdE7cmQuB31F+Pfw0SDBiblQOCKXu82xL1PIGk+A9RZdXn6Xw98zAC6EkHNjcS/nyw
	WxXdDvJwI+7xPqfXfupsEr9bPrhuG0nRUP/qeSQ6DLKW5osY97bUyk+PCDDUBtuAxxQso5Tj4Zj
	CK3NQEs5BYw5gSOEA3EvcgI8zruhXf0bnVNVQtpxTPfIKfBC6WRc1XdsO3d14OHqTf2EmrrrMSB
	Sr3P3BIZOVQy8jKO6OIsUcQayGgZaIF0N0gXQ1UzwBqeLzhFxKMOA9U6LJkYTgtxM8GY2X/AaF1
	13+DO+vnxi+XYBS5XIkiAQGYhAX2dbBAlF7CBepactuUO9Vr+ZpvHtonqUYnRhX6IGcPbJApat+
	C2NxOjBEOY1jMnRLGLHGud+tq
X-Received: by 2002:ac8:5d8e:0:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-525fb957e1cmr8865141cf.11.1784558515472;
        Mon, 20 Jul 2026 07:41:55 -0700 (PDT)
X-Received: by 2002:ac8:5d8e:0:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-525fb957e1cmr8864731cf.11.1784558514897;
        Mon, 20 Jul 2026 07:41:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1734b1918asm466578066b.43.2026.07.20.07.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 07:41:54 -0700 (PDT)
Message-ID: <a0e78c2b-0ff6-4018-9a64-229e7f68c0ca@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:41:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1E
 description for USB4
To: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>
References: <20260518-topic-usb4phy-v1-0-71d827c49dca@oss.qualcomm.com>
 <20260518-topic-usb4phy-v1-1-71d827c49dca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260518-topic-usb4phy-v1-1-71d827c49dca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2MyBTYWx0ZWRfX9xbmXHO78uqo
 kYpRiD6j0iZXNm6XAFy/Bx4tYwn8I4UqMuF3ZZtMkQ0jioZfkZZHOzwjLxFT5zrE11wh83SXvQ4
 JxSfLD4aTlAK5MS834hz1EjqmQmyvYY=
X-Authority-Analysis: v=2.4 cv=LK9WhpW9 c=1 sm=1 tr=0 ts=6a5e33b4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=u94BZUI0yVsv4lWrxd4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: SfBLIEMWv4k2kC6I1TgHTTmg3iq61U5o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2MyBTYWx0ZWRfXwZPUkzK9DG3h
 3GK0m5FkGVi3CQ9eRtlJyPe4koqeykiiaDbI8Yny2Wi1pxsXkz8RJJvvWTxjoZFBwWqETmlxj0l
 IflLDleC2Zxt1OAGQtDmE+ys+Mtr4alcW8/9M1dE2JOrBzZcOm2eh4sKjwO2Q0JD9M4oZMRdN67
 eHIZWMfiRooEl3j0gE/oAaK1GYuSl/GXquzg53044mkX6neWIaRTbV1R+jCRnbijFc6t0a21Gh5
 K93KW6Weabu1AN4FKNUVjR95tNIpQfybqOlUd7UKS2FYArhbRbkx3VJtBV3pbb91IZ4aMsKrmQm
 B9PIN9sRYgQP/71zVl7GqemDEpYYZZ7HJyANPtYqdtcHdsrC6pMXakZTnhAp0y2uF+T6t6yC/Hn
 pm6n0BMrhbYL3CpJ0TZd2Js/FQL04cvLl6/FzB2v48iiIV6crMr1CrMw2Glqnp3uNUuy5o8RkhV
 B0lfTY4R1B3nzFSWTfw==
X-Proofpoint-GUID: SfBLIEMWv4k2kC6I1TgHTTmg3iq61U5o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200163

On 5/18/26 12:29 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some instances of the QMP combo PHY (called USB43DP) feature a third
> functional sub-block, responsible for USB4/Thunderbolt 3 communication.
> 
> Compared to the today's state of the binding, one more clock (P2RR2P -
> PHY-to-Router, Router-to-PHY) needs to be enabled for the PHY to be
> able to switch to USB4 mode. Allow that for X1E.
> 
> Also, add a bindings define to let consumers access it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

It's been a while and I see Vinod is picking up patches.
Krzysztof, could you please take a look at this binding change?

Konrad

>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 3 ++-
>  include/dt-bindings/phy/phy-qcom-qmp.h                                 | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> index 3d537b7f9985..eba4bee474fb 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> @@ -52,7 +52,7 @@ properties:
>        - const: ref
>        - const: com_aux
>        - const: usb3_pipe
> -      - const: cfg_ahb
> +      - enum: [ p2rr2p_pipe, cfg_ahb ]
>  
>    power-domains:
>      maxItems: 1
> @@ -186,6 +186,7 @@ allOf:
>            enum:
>              - qcom,sc7180-qmp-usb3-dp-phy
>              - qcom,sdm845-qmp-usb3-dp-phy
> +            - qcom,x1e80100-qmp-usb3-dp-phy
>      then:
>        properties:
>          clocks:
> diff --git a/include/dt-bindings/phy/phy-qcom-qmp.h b/include/dt-bindings/phy/phy-qcom-qmp.h
> index 6b43ea9e0051..1c3ce0c02b0c 100644
> --- a/include/dt-bindings/phy/phy-qcom-qmp.h
> +++ b/include/dt-bindings/phy/phy-qcom-qmp.h
> @@ -16,6 +16,7 @@
>  /* QMP USB4-USB3-DP PHYs */
>  #define QMP_USB43DP_USB3_PHY		0
>  #define QMP_USB43DP_DP_PHY		1
> +#define QMP_USB43DP_USB4_PHY		2
>  
>  /* QMP PCIE PHYs */
>  #define QMP_PCIE_PIPE_CLK		0
> 

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655CA38886F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352781; cv=pass; b=O+5NT/BzHIOWtRjJMFCQqKTmSLqhFgRZ4efLFyLSCmY8QFVSzQon4P1MiqZKU8LtfPy+YUNzE4FHyLuXgMzdnVGMlPgpgkBVK5H1GYX9YTFcfYClP0Xo0l7PXgUNzaTi+TamuerSCTrpWTIYxJrrnLahqs2X3RGUxUOGXmdoOjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352781; c=relaxed/simple;
	bh=xYmENpXmDPnuMk1/CUycyFr+awBe6nSvTWePQTudzMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ACAH7P64XwGvrIPTs0y7SLdKjlmBZu63Ta38FdQmsn/EwVvKPNZ+kL6Iq+cdKL8bVsuTEwZ6K8WWpAD7JAyLvXD7mInA9WzKf/C1QVzOPLDoRRorhGARnC7618DF7klI6QKV3mIMMpyRUbroKkptVLURmsgCdapnwdy7sv5J5Rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9FVMwzc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cSc7OtdE; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f9FVMwzc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cSc7OtdE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF30j981455
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 15:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uVwNgSJTtVTKbtqSaGAFbxzC9Mmpfk3iXq7vDmyv9os=; b=f9FVMwzc9wc9WH3J
	3ZYb/ThuiVXqY44vE4KUHg6xeqe81jp91mkfL7mgX9DLHYzUYGYEm4PO7dZz1ilL
	0gvJe60fMiXXNO4lEqDAUO3X0/1HCYNTarknepb1BpqKfC2+wsOYkQh8hs4hNZO1
	iSwca0GRi/JWuZs93mkZ+sYJrp+DhR5Qldt7BVRLz8g96ogI/izOelcEGqTdYkNc
	2vQ1DjSVymWlSg5ubVSwoXIdh1d3i8W5dRLKFB12GwcWR/nJT8GJDETarCTU3igt
	8JMfKnzurbm02wJghc9s+LwdWCpTWBwXbmGuhULrNdBDZchkK2YI2Yy5x33cxPZ1
	ssewjQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgsqxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:46:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ee593a5a2fso40405456d6.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:46:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783352779; cv=none;
        d=google.com; s=arc-20260327;
        b=lsSJ6dpPwY44Pk3FuiAq6dJNNi0Em0ayVqPCugUxBhTqJ60SjsKrIfgTqqzT9l8h4e
         lxNLo/OTJuM6WfRqcuygFit8P5De0KPb5858uoSMGdLWnb02mEbVHkF5iumyIeFhzK3T
         xfkV6xH3qItq9ayHoPsYrO4xuTYuWnDcUlzqqJtW+5+6P3Tp+u+AWWU6XwbQUDSwlpHY
         yt9uQgmNVuCs/6AcxWBd454AS7tuV4CL9/jxTlq3VLGlkpGsHjbjocwfn6Ip/pIbIZMl
         CxXzLVVZfaWv4mb/blqYw5C5f0cjXiZqxGpSHLQrOOAEW142sgH3XYdBTPmVWyJeqqSz
         Lqjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uVwNgSJTtVTKbtqSaGAFbxzC9Mmpfk3iXq7vDmyv9os=;
        fh=6BnPPRiE1YRPmzxg9oA3S0Mlh6ZF8N2CFoSHBJOV64c=;
        b=TxPhoBcs/vjgAXJ4mb4ynaYHvAw8N5xw16gKJcCFUAkX07dT2vMjKbkfJmkt0uqqNz
         B57Bs+jyTMv+kUon2sp2VLMhV/QmjZBsADoOXYdQeBTYA69agw/RZmD48bJniAxxJNaD
         xBQhswlcB5UFjdNIlJz3nDjDHVUce3TYDr+bxAmAryT+AqG2watiXMWXspTUhhHGYWoF
         0HQ568cbVpsVfsArb6j8RnE6No1Asv6K3XkVSvx0UvZ04KLhJmA2k3mUEbmV5Bl+F0dH
         xT5TQKEloOHJka0fhrfcC7ab2NT7gNX3WkSRxwm7Ri2LJgq+6xBB2z/ylqnXI6Lnu+dF
         PWDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352779; x=1783957579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVwNgSJTtVTKbtqSaGAFbxzC9Mmpfk3iXq7vDmyv9os=;
        b=cSc7OtdEj/D6sTFnLut0kEN8oKm3MC03H7HQNG7u8zgByQdO8MBaEuJQg8ZbcCnl2b
         /N575mvT7uq8qFXYQCaWzXOj9UquLeJwtP/yub74R5o5B4Iz/ZlQupk7UGr5MAf1wHFU
         osH4kTlv3NVN2fEDTt1zYNWTU9C15pffIVeCqbAfHxThaQtYbylUukfOmnf7Zc0n2VYU
         BggvbVDfyCHzDi9Ru4j3ONu8FO7ddPQqshfTajjosVEuSEUQVotUH6qqTMbO6J9/Lb63
         x7btj9TjjqUyxotNusIs8k1NvsjYheZU8kLXxfnsAk0+D+40XH7ANoBRekZ7JgPU3Svr
         1QVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352779; x=1783957579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uVwNgSJTtVTKbtqSaGAFbxzC9Mmpfk3iXq7vDmyv9os=;
        b=bpA5svAbqwRqokhTrHlgYlK+/8bFBe76bU2xzKYODSqaPVaM8m9akYnvbfblrLTzbV
         xzbh0gi71pyhr2LcpdBjpBonMyUb/yJ6vi7BEDKcFBWS3C96bNofnW2zNGOPOk7LDY8w
         r0uzJbUC/eIVkh4WsTJUa/JcOBo7e/joQ+LnIA1f4fgq7PlA2bMU77gIPaM2Hy5Y6+SB
         MMFMburhBMXNRgeJse5m1ujyKtPAmjDbm/zIcUqL/bn9fG2nULF7jxI7cBclyqI+SwaT
         trctTgirc9o8LKeBkWufc64xEEogOQfr2wclgRrEZG6j64Fb+FyI77fCVD/ti567cdQn
         gOsg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5TZKK07LUXgrTIzQOr43PlIIJUz5zutWfbZPyvhoeFfu8xmkPiIG53R9ZGD4FSLESNTdSReDCqj3n@vger.kernel.org
X-Gm-Message-State: AOJu0YyuzxYspKmOaDLA7sCubR/fKuc+b7RyPiGkXRMuhptBoV2qE+uH
	3CSSrozK1TtPW6pDpvKDqdZKEB4ubg9wwP55qXNDVwYRqv0yem4GXSCEPvJ8rtbVawYqq32ovZ4
	mwVMYrOigpALnPo7E2JqK/LOhgYUBTAt7zmqPlayOFFf3DeH+z/t5rNnZRm1wI84xXCwVS1mbZZ
	JfcT87iQiK8jOzWHgxIK3B80IhdHcpYrdp5Kbup1A=
X-Gm-Gg: AfdE7cmXkyBNE6OKj/T4cfB+0+wKFvwaJ71vUn9Vtqp7uIdrYSWeQ4b+QotWnReiwkr
	Gj25fFwxpI4TDFIesK4hXXv9RMXfDPzjiJ5E5ZaJaljzHn62h8nSJo7P9oopMouNsvcE+ZZCdOo
	tFpbn/YD2jaCoRBX9D2ityoRjUBcbPGoRRmZviQJyYYxQVt81nCnr/3hdxYMc91f8mWnXK
X-Received: by 2002:a05:6214:509e:b0:8e9:cd74:87ab with SMTP id 6a1803df08f44-8f5bdffd9e9mr220890696d6.21.1783352777366;
        Mon, 06 Jul 2026 08:46:17 -0700 (PDT)
X-Received: by 2002:a05:6214:509e:b0:8e9:cd74:87ab with SMTP id
 6a1803df08f44-8f5bdffd9e9mr220890016d6.21.1783352776811; Mon, 06 Jul 2026
 08:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com> <20260629-ice_emmc_support-v8-1-1a26e1717b85@oss.qualcomm.com>
In-Reply-To: <20260629-ice_emmc_support-v8-1-1a26e1717b85@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:46:05 +0200
X-Gm-Features: AVVi8CcMiaMIm1Vvge8nZlP4c_CpSIP7RoUq2vlhL8_0iLB8z8z0FY5gCTSjriA
Message-ID: <CAPx+jO8t_kQ5q4XmNJoJ1nR4Kro-2M1s_Xj93qxuFUW7VPQpTw@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: mmc: sdhci-msm: add ICE phandle
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: mbFesJ2C8enHaogimtUffyL31qvqr8py
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfX3v60VtXWlkvn
 Uja3fn6LLC2FlXYfRrJVZm5C4Hf3BJnbBf8fP/CLkrykw4yCJfU1GemFgAQtq83tHIvYhJscUlL
 aDrHau2ku3fDNd8cULqTCRmcIzXzbmeGcPCWmI0eRyaQiFPDQOKJQKqkS864KylefhZj1jBQlaE
 0yekAxFNgdcuKBhPBHFTgM/BwWtD0E8L4qLL4FBLKCb1QxMhzffSmGLhHWobN3KYZF9vQf+ChW6
 aTGf8Bpz/6Evz7TesVnNF75qYnWYkHi1ALZPW95GvtEWDLNQ/Mpn4DJ04dL5ri1AeT+6qGC13Ov
 94hXcKtG84eqnFRuDx5ctpXI28oT6VjLbepj1KvdIwj1jx3zUjg7v5b/AcAfagpvGYmin549Lgc
 1sVErj1MvWtsVQ0UrwZNtVYSZiQEuFkrEVtxsyQW+RZCfi4eXQ8o1fVHXFBs8uZfyDNjTCnrs0V
 6toGZGRKWq/ot7rDIiw==
X-Proofpoint-ORIG-GUID: mbFesJ2C8enHaogimtUffyL31qvqr8py
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfX8ykPwfH/AaY9
 K7tCO2aaJOumPrdaojzF/5WOdeO6z9BoM8IH/swB18n88p144PBesN7iPPIS9A32NUMePDTNMNZ
 aVSylmytZDbYXVWQdHA7Nkk0coSt4Ak=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4bcdcb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=mKE6IO2wa0aNAFb1U8kA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060160

On Mon, Jun 29, 2026 at 9:36=E2=80=AFAM Kuldeep Singh
<kuldeep.singh@oss.qualcomm.com> wrote:
>
> From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>
> On newer Qualcomm SoCs (starting with sc7280/kodiak), ICE is modelled
> as a dedicated DT node. Add the optional qcom,ice phandle to reference
> that node from the SDHCI controller.
>
> When qcom,ice is present, disallow an embedded ICE register region in
> the SDHCI node to avoid double modelling. Older SoCs without qcom,ice
> remain valid.
>
> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Co-developed-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  .../devicetree/bindings/mmc/qcom,sdhci-msm.yaml    | 95 +++++++++++++++-=
------
>  1 file changed, 67 insertions(+), 28 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml b/=
Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> index bd558a11b792..b3fcc1673c10 100644
> --- a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> @@ -145,6 +145,11 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description: platform specific settings for DLL_CONFIG reg.
>
> +  qcom,ice:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to the Inline Crypto Engine (ICE) hardware block for this =
controller.
> +
>    iommus:
>      minItems: 1
>      maxItems: 8
> @@ -198,35 +203,69 @@ allOf:
>              enum:
>                - qcom,sdhci-msm-v4
>      then:
> -      properties:
> -        reg:
> -          minItems: 2
> -          items:
> -            - description: Host controller register map
> -            - description: SD Core register map
> -            - description: CQE register map
> -            - description: Inline Crypto Engine register map
> -        reg-names:
> -          minItems: 2
> -          items:
> -            - const: hc
> -            - const: core
> -            - const: cqhci
> -            - const: ice
> +      if:
> +        required:
> +          - qcom,ice
> +      then:
> +        properties:
> +          reg:
> +            minItems: 2
> +            items:
> +              - description: Host controller register map
> +              - description: SD Core register map
> +              - description: CQE register map
> +          reg-names:
> +            minItems: 2
> +            items:
> +              - const: hc
> +              - const: core
> +              - const: cqhci
> +      else:
> +        properties:
> +          reg:
> +            minItems: 2
> +            items:
> +              - description: Host controller register map
> +              - description: SD Core register map
> +              - description: CQE register map
> +              - description: Inline Crypto Engine register map
> +          reg-names:
> +            minItems: 2
> +            items:
> +              - const: hc
> +              - const: core
> +              - const: cqhci
> +              - const: ice
>      else:
> -      properties:
> -        reg:
> -          minItems: 1
> -          items:
> -            - description: Host controller register map
> -            - description: CQE register map
> -            - description: Inline Crypto Engine register map
> -        reg-names:
> -          minItems: 1
> -          items:
> -            - const: hc
> -            - const: cqhci
> -            - const: ice
> +      if:
> +        required:
> +          - qcom,ice
> +      then:
> +        properties:
> +          reg:
> +            minItems: 1
> +            items:
> +              - description: Host controller register map
> +              - description: CQE register map
> +          reg-names:
> +            minItems: 1
> +            items:
> +              - const: hc
> +              - const: cqhci
> +      else:
> +        properties:
> +          reg:
> +            minItems: 1
> +            items:
> +              - description: Host controller register map
> +              - description: CQE register map
> +              - description: Inline Crypto Engine register map
> +          reg-names:
> +            minItems: 1
> +            items:
> +              - const: hc
> +              - const: cqhci
> +              - const: ice
>
>  unevaluatedProperties: false
>
>
> --
> 2.34.1
>

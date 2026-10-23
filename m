Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792768606;
	b=XDHfNbTOSrYL989m4qr8zb+y4RPcHXAwMqm0AMwcPFzA65VQPRDsScnp6UZtKExyW2rZ
	 XXXC1vhXbAN7tRcKAA9HD2+VGv/LTG+JqulbibLcydM7Cb3c3f5Y8NeDzKI6pGxxX5zup
	 LQrqNdkGKsRl5kFiJ230021z/8Nimhzo2tNlE/QoEw4K4CYKVEdaty4sLxbEVnm3qwtiN
	 QeS/lla7uIbw0eRkxcDvC3O4UBrvcCD6d9KzNqlWuWVDV2Tetxh665WH8+v3v4GLDqF09
	 MGHroW4DmPT+oniaK3Nfa7jLhRUrQkznbyMaBVTvX1/GJOl+60zsSQiBxpKDKj5vNOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768606;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ntGLFzlDvuBFajhsf5fvpyP7EbCcLO7E8qSpRPn8wxs=;
	b=whLihUovw3v7EzJH7s7MOAD+kVYEb9aMuhvIBeYGbuAApea20pfU5heQZnbwnln1NofN
	 2VkVcdInd1E/B1hdHFC7aqp4gfvBpeCcEPBiJFi0FAXENKY0ul2T/DP+r2bzBxd0v9Aps
	 nCuRx3HD3cdqr6aIooN8laqI5mkfnHVmrbbofVH01JZN06FEuK7pheh8CwXl/8/gtKT1I
	 SxmUv4QFGmk/c4wc4Rc4TktoY/1WGNwrT0kaVLmiGTToOdlW2XCZsWg9tENwz1/AacU7M
	 waNl9M2T32GnSYQxzR+Z5yMKEpcLbU26vZGU4ejuwG1TZVPZb9sOinf9q1ai/RGklTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RuZfbKXK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="L/3gk0HD";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB598606A31D
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB598606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RuZfbKXK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L/3gk0HD
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6Pbb3000350
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ntGLFzlDvuBFajhsf5fvpyP7EbCcLO7E8qSpRPn8wxs=; b=RuZfbKXKE7ctzwuv
	czGvcZJqzCy2XCLn0xdke+X9ts8FAcun4WTZQCudkdJKnb3xdFnvARNiR8w9By3I
	NwA5f19bmPM0F4/1N8NdyKMtmcsewJn8V8CTbPlcN5jFBP0GZaF5wiyzsdocXvUS
	xcjmTXDeIeiuipdkZxzWk07LUQizJOAFh6S/jElNl3n7/mp18BKLuVQ1wp+bgk9l
	+FcF1qB2p+MZRT0ltDw0JQzJxLrzFY3qx4BmkwskNY9DfkKwOgNAhobCbeqgzD3C
	K4wGWwxI6rnBtUmB7j1FsuYzVYhAGBUyEOeSjKp4k/YEspItviojK8felV6wchif
	2pd1KQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn0net-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 15:16:44 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-55bf11583d9so763668b6e.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792768604; cv=none;
        d=google.com; s=arc-20260327;
        b=EZXuYpjmOKjkf0zfTdCktse/qP1Rxzqd0f/OMsTfvO5oZFozlmVUFTfVhpowNnHT7z
         Yd6GRlUUb+mFyxFn4GlDZoEC0/O0LNOfbYK8IFoXPtQm18KDuna5bZGUj4nVkDvFdY0+
         0Ewgre9ZjoshSkWFe3fg5ZBcO0WlP8M19qQvopWk4NYYyzez2ZcEALc6Be3dS1PU2vC8
         01dkPkaSnwSHLxg/Nws7KYTSY8DsaDlsUWs/pMXf3iqiQ8mcGzVQ++0H16rRVP2PhFEF
         6SC4+ippm7tNU5cQAxGA4FEgs05LlSDuSPUbERrW1ok8xmMWyJ6C4F/wRxY7xYe2+Aqk
         pHCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ntGLFzlDvuBFajhsf5fvpyP7EbCcLO7E8qSpRPn8wxs=;
        fh=A79t0J3K38Z9G2mNU1EtAfi5NE20LgDDo/PCfdD1wag=;
        b=qEsL5dGoRepjKT+JbEOjGmd/1TgqjbJ+L9N6eddvFzs5crxyjQ+bDR8x1TtkiJoDDX
         whloFHEoHPzUHfkrN6hcQXeZ3nap3tTqYQodbu/A4uTVvzgSsp1cAx9L+oIfJmh/voBM
         m2ZzF7Y4YjfWpaIQp2SwXu+ssFaHiZcOCYpMDLbTq3/127JTO9vSP4d4OwbUCj6xakoF
         +ZrsxWIrlwsSID+R/Mje3wfWbyvLH/1P87Nv90Q6QWc7hSeKinFUzztJBc+LVWkSr4d0
         TFXe0zKn6bPafzVEij6VQV5bLsKcOx4/h0igkFl5OnunfpeqWk96W0P8wxboIq5cq9jA
         ttUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768604; x=1793373404; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ntGLFzlDvuBFajhsf5fvpyP7EbCcLO7E8qSpRPn8wxs=;
        b=L/3gk0HD6tLj0ZMPDOtdsa+nHmVehU9lqltl0YMtrsiCyjkNKDAUGtTK7TidLO0J13
         4Glq+DZlulePmP8lbSje8FLFth+Kflvb102fMF+2QL3K2UPB+heJ5IyelRUFwQ2oUnrW
         zczr4NRYMDe97XpWM3OG1uJLgQmKpeub3DBya9SLloYZ5t7oOYQomwu1QIsOHjiJh+xP
         L9sybaznrBAP7jvBIa0J80WfrHJ44b0U2l3t2lkDLCXFClMMbgKX3dNDXCytRG2+SVqG
         JwFEjOMn8DLU96XThSZW6bfSylys1yjMUXUNePQ8vSeFzbRPbF2gNDeiiMAEf3fn1EyU
         IQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768604; x=1793373404;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntGLFzlDvuBFajhsf5fvpyP7EbCcLO7E8qSpRPn8wxs=;
        b=sEWJ8syIH6EvCPpH5YgC5QFJ/G9QQyNPMuJ/56XWD3HOd4jOOYPDOvpQN9ydjWaOYk
         +G29YlB8OLit6EhQ6m6ZUOMm9X7K8QuzAyv9lZGvGLZ2BrzFVLRVA76dNWdYjHu0V0xF
         pqoBXtwriyJzDSa+yUFo4Xqq/362jQP80ccz6yaWGQgylxozZCOXyXysxJgt6SyowIKY
         ClwWgy9qN801GHsiNFZg2E44CfoSGlSX2uvAHkadVsDOqQMsHeoXT/uzWcKu378NKzMa
         A4FcPTMokSIYShmeYK1jc4VAQRyIxG5iHdsfZJrp3tMMKQDZMLhZ32Gq+BEakhQGMoOD
         qo0g==
X-Forwarded-Encrypted: i=1; AKwUvBzkvZknVYGLQNmYe2IhblXiGhy+pFlY+yJQp+pHXw3LxfJXV0YcrQluQEDhALVfoEL1CLmd64DFT2lr@vger.kernel.org
X-Gm-Message-State: AFq9FYK2YjzTXMnJgQj6bOdO9nUS6yyL/U4Vvkt2R85JChrToTAb8Ar6
	34H1WNmKR/2+ovg5P4bW8PaLHtmnlVOsM2VnWy7nW3dGZkjtGm66J5YUJj0/P7JLUHUDU4ODurA
	PvI0vQcRTT0b1JgfZ47/y2xp12/Od/cANFrS1ip9Yc6nNOceEguMA3ktUiOJa2HZkprhAp4g3+m
	fiLkjZ+hpvll+Olg2n/LvsMu4pt5YxKynPSrTP+Dw=
X-Gm-Gg: AYBFou3sE6BTO3nPtMyWg8tVbebaNKRuSPGG8vAy5fuoE78zgzBqjTxddabMp1/lRHw
	vHh7HxRzPdorKkgt2MEWPEcz6cl9VzrnhGvfrUUphtSNmHyRB1MFvoYmKRNOM82HlDwiZEpHAz9
	3L4giOndjF6q3jU2t9yF8mH3Tjy9UDO6OgKvY4hbcPRovsA5YqKr/VgZDCS9vcPYl8A28l8EK7T
	DF547ZDCPWlRl9/gv9pVYnoTXTdutcp2MpvSGdmTzkJ1g0BIFJYOUlzGDBpzIABcxiEgb1jM7I=
X-Received: by 2002:a05:6808:6f86:b0:4b8:4703:db91 with SMTP id 5614622812f47-557eb47d075mr3061847b6e.26.1792768603782;
        Fri, 23 Oct 2026 08:16:43 -0700 (PDT)
X-Received: by 2002:a05:6808:6f86:b0:4b8:4703:db91 with SMTP id
 5614622812f47-557eb47d075mr3061832b6e.26.1792768603405; Fri, 23 Oct 2026
 08:16:43 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com> <20261023-camss-isp-ope-v11-3-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-3-0c2937195298@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:16:29 +0200
X-Gm-Features: AclHuK_gI7FsS6nJkI8EHAiWfGIfmG-kFFxZK8IqQe2rUZA0KJsBBIIrHA95LyY
Message-ID: <CAFEp6-04RVyYG1M18Dh6Z3J7MycTb-WdMkHxyyVPfyiHVK0z3Q@mail.gmail.com>
Subject: Re: [PATCH v11 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX51eGIPU/fuXt
 zC63m6NM/YPNaxNen7DfHXqpVllkT10XaAvAEG45zYtPsZpGDIyJVrbJ89Vh0VLRyflKMlfvu6b
 iZiJ1aamU6DqNaOpKH+oc87qDqyn3MquexekZwh5xDhFHWiRhlF1+i+AMbVmN+NTNllNUrTJvjm
 Xf1NlnUcVCfLVJGaz42kf8D4FbwPRmw7WiAUJ/6Nrdxi2J5IoCIacROIpVXc91AohcgBL7FL1CC
 h915YSx6ADQwEem44vs9Yaz5jJzvim8VBieh7GiSo/KL7YamUOffrNgtCpOQsIAFBps67qrnAvJ
 UPl7Ae0d+0kfRkiVZg9JQzwfRNttMfr8C7Q4Dj0OqVsOKkQfBm9TBuwd7zq2Yi1/t/afHG6PQ1H
 kPbdHt8QZtMVAhjPh+zHF5lCw0TmyMOATkntD5N377PdNFYyjMLUIzGZtPn8jY/F4HKP6GDhhkv
 BYHi5vC0twFtxBE325g==
X-Proofpoint-GUID: sbC4NZcJuJscDCVnyvhGAsD5Hp_dLDX5
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adb7a5c cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=43rrA-HyjK99Vs58VTYA:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: sbC4NZcJuJscDCVnyvhGAsD5Hp_dLDX5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX/evGW7owW0mx
 Y0C0OBP76xkKWtq/2113/Cp305oppM4ABSq+w83X3EN9tcKkgy2orGPXmWPXygiEJqyRjD5HM4U
 Ta5+SOKnA8F8KuVipSaKQq360yC4nyA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230059

On Fri, Oct 23, 2026 at 5:09=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>
> Shikra uses the same Offline Processing Engine hardware as QCM2290,
> add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
> as the fallback.
>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Note that I missed the trailer update step and therefore did not carry
over Krzysztof's previous tag.
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

> ---
>  Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml | 6 =
+++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-o=
pe.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.ya=
ml
> index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..3359581bfb13e918bb4efb3bc=
41749e60d772ef4 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
> @@ -19,7 +19,11 @@ description:
>
>  properties:
>    compatible:
> -    const: qcom,qcm2290-camss-ope
> +    oneOf:
> +      - items:
> +          - const: qcom,shikra-camss-ope
> +          - const: qcom,qcm2290-camss-ope
> +      - const: qcom,qcm2290-camss-ope
>
>    reg:
>      maxItems: 6
>
> --
> 2.34.1
>

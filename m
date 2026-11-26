Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795690384;
	b=GbEUiBPflM6XYY0ZjYnXVyfcQhSkMNA4N3CVUA+PHP9Ed27G30BcJ6KX97xYse0mPT7P
	 H3S4UiezBJsBbUFQX4Ga7MWyWWkgNqjzU5wrxZ/hWXrPCrLQy4D0vrOBRaz/5pkmHzZIT
	 HHnnwBkqonKjBKaKriLNQPoKbMaQRZsmeDMOuVtRGu6LsikADydhhpxWDtvZihRVeooZ1
	 vaQFi3cdjtgr4Y68eoaygumFOkJ60faJtkPv2uawJ6C/rCJEhfbSXnncdwLMzeb65xsBT
	 +3SjoyVgvf31DKdb7k3ZOzP89g0WsfrOQDzgP56nhYEZmmyGz87QHC8Fu9cJjgMTAIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690384;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ni6puywMMHNYeFI1EJ7o+kG8F5OQFdRdjsh/I+X4uqE=;
	b=VoIrsochDYYH74eD4kHR1z0QAYkvih+h/zwxBNiGTPURDkmxo1Aw/fwliqYEaMQy3DUw
	 3Js9gxe1TtoXMrubMRANb9w+J1Kxu5K6TsCrTIyF14FMXycZS8Tc7SK0xyRwfRxAE4Wjh
	 h1Q3lHE6anLN+nQuiVV/fhTpZUHEXZmBXBKEn7mlCRnmdX0rqy8LAXuLI5De3PS/RlYn6
	 mpoze5+k43aTK2TA8gjjNP3ef/moTLbufj2tJpbKpUV/b3v1dS5EgWDTQNr/Z/bJAakjZ
	 way2KQZZoqiBNtfz+W3Q+j7jnCFUv0KpL3Q+Sjhz9WAKRJ/Ff7ZwI68O9bw0tj6uTkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ENWuQwNF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=exVlGjqy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373FB606A31E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 373FB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ENWuQwNF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=exVlGjqy
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAY46B2661031
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ni6puywMMHNYeFI1EJ7o+kG8F5OQFdRdjsh/I+X4uqE=; b=ENWuQwNF1PEb57jI
	VZKSA3QE2yjQY7SEbjn//krCUApWSGEsKWnN2OBqjPoTBcZFX3oVVhdeA02I5h5/
	cdfLurFQiPpgSy8c9/WZKqp0Gf/fGPURfmzPccY2GN6IqxKNlcGUXlFUPSg3gPlI
	uF5SoZdOzKcgXWuIMDQJxVjvRtzJR9vNISwI5GQw8m/yZOl+P5TrX86AKZpvelRH
	W8/y6hKsbE0XNIdkWJSgU8RYyB6Uhr0Ze+IxVTQXWUSJNvfcu/ifCF6fdgw8Sm+N
	CiRznVhxs0eFNC0pItmKmD+ka3DhIQpkKpxym5d0ACMxDGT2SntI35eebUs1J2eM
	OJ9D8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfak96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:53:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so1499006185a.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:53:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795690382; cv=none;
        d=google.com; s=arc-20260327;
        b=FZAxp+e3QopDZBt6MRB4nTJZw96KNeR/9MaXOgOt2LQMc1oKcrZN5cs9svnvDHsa6y
         FbGPH5tbuOg1tSLFfYzoipSr8cSJqJHr+9ZzvsUn7tCKPTdUzDNcMYsI5n7jWsUOM9tV
         pgtlqo8XOPpnMdo7uAcmb2LGStJQ9UujnUoQLf9SSd2oux1HnXqNOMO7kWLB/7rPONAW
         ftxDyV/sUZVk433zmKc1FPS9dIEBU6W5t5c1oP8RylqbtKVsE0SM/Jm8pim9rtvRy5IG
         HVfQM5HX8sdUZEduk2OgVcQ4+vTnaRcT7nDjCLXRAFZwxtEqEwNhYIPV68x8DqPO8NzF
         sUOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ni6puywMMHNYeFI1EJ7o+kG8F5OQFdRdjsh/I+X4uqE=;
        fh=TyeTpkCA0Ob7LYbPAQtxD4Ehg0InnB0qxyqR8JeOiWo=;
        b=bIGYcWjFh8COBsfxOo4Bn6xlda14cqNdC7HS4gmuDedAgxUEGwu11fPG43/gGGrBFJ
         ZnUnQYoYFymIcqzREd8o2L6/I2KsFiFBmfAF1Gwg3+47bzgeUfEdKO9hTSofwPDbjRMH
         OiqonkdcVgVWKftZUjpJiKFRWBJVtpToPSip1fgnvLzDHk/GSrCRSq3VOrb/p+ie58Sg
         cRImps/QczSmBZ7VW6so2dZ34vrrjhBl2VPeCzEzPjH17y1/Rn6X+CgdXYIQ+bZB2YZQ
         5rrS0IM4QNJU+WldLTRYFRRo+CxmCqbYr0Y3Uqojnc5P8YXnQYaZVf2lzZVkgRrjfJMD
         GQwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795690382; x=1796295182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ni6puywMMHNYeFI1EJ7o+kG8F5OQFdRdjsh/I+X4uqE=;
        b=exVlGjqyVQX69gi5pMCj+rihqHe/tzXd9plbloIjg4AqQOtaYMwnJfynXCHwGLKGuI
         nP2rzSvjJE/Fjkb8jVylE4dc2VaHnxws9iKXRfcvIv/S0gE1WRg2yg8SL1v4/ZVfJnA9
         NU7RUr+XGvtFpvUwMaI82DGkqVbSu22gwehNo22ns7YNhWh51UxxDv1WCyOA9P2viUeN
         Pv+YD+U5fthQddEg3pZujIOZGquHWf71QPRnysTSKjGnfa4tZsBQI71CaQdIvsshAWm4
         AqrJdTCmcclUUeaxbkiTFAI9HplDTr6uDESa+/cen/fXzOMc3CPdxeJvHutvFcLV1dWF
         7ObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690382; x=1796295182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ni6puywMMHNYeFI1EJ7o+kG8F5OQFdRdjsh/I+X4uqE=;
        b=kyANSItOJrkKATplShHxn9MTc5KJD91zkmiZsWoEzscbY0d56HQ8L3vlPCkLQjWtPj
         zqcrYTtzXqmcO51a2CKZyi5JKCiTVlJkc4LkYDktewMKgVkqXB7wb4+pvAQoN5cc6Ci4
         EweW9JMX7INbLY0C1FEmx8Mj2PjtPts/f6anoO4P8wpd99NgiZTOQta6LlW1XKrfk9tk
         eP7ApDAwUoJavy+kMobypsyxWKojsAHd03Br5XP/J5tWGd9sb6HLdizVbLYqLNl6aRvL
         7fG/O2OZJ1M0jVGuuqfr5X/o1hYl4bYXgFt9BGiSct3EghoswV0SXATI8gfLsAcPqDqp
         dsHA==
X-Forwarded-Encrypted: i=1; AL+hErHmTCzJr7T2RdZGSZ2+GH9M7ZFrGph/Gbvz+8VUOmSVwXbnkN5t0y8TPIOFOTcb1UrS/f6G06iDDF0W@vger.kernel.org
X-Gm-Message-State: APuU4Z9nx6cZrrToI2vB/WfEpf19ntavxEAABEN3/kXL2vNv9O4UUjXL
	LgW7tL5uREWHtGEhlUPH+62g2lhk4U+ahyfr+FmPSACQoP21hJriNDn0MYY1L4LLTRjNw9JAi1N
	B4SA8bYvk19DJilaUQGas9TVk5JJptGnAjOLTs2/8D3LGxMwoQchMgdO5BmfKGEQ+XXOJF313je
	DDBUxOUm4tj1PV8jyqigYk+fOPUL1nwGk24oRrgyU=
X-Gm-Gg: AZFdTZdJg1YTsYyaaHpmLVgEo2o9Qp7yluz0WY4jmWFNb1372BL9GFCvAYmcKdKZlqF
	SRtEUxdRmgf7KLdR3vxZd5TlC3daw5ckd6TLWc8rvXfdCILe/d62fsWs/DBmnze2c+Q72NLm6eM
	rmYvCOVHQSiY4letkh8yrzpbIhDOz6Op4sjNFUO/25kYFfu2mgHStLrmVMzkeYgCvQ2Qn4sPtRb
	X+oexIlanfdeaevY5ffLCz55jDq4/KFAmqwQAl5AEMhNNguVtrpgkQC1kALxkRmSgSN5TgA3g6J
X-Received: by 2002:a05:620a:6496:b0:93f:5519:5e87 with SMTP id af79cd13be357-949ba8483edmr3214746185a.4.1795690382321;
        Thu, 26 Nov 2026 02:53:02 -0800 (PST)
X-Received: by 2002:a05:620a:6496:b0:93f:5519:5e87 with SMTP id
 af79cd13be357-949ba8483edmr3214744285a.4.1795690381901; Thu, 26 Nov 2026
 02:53:01 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org> <20261031112203.545319-2-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261031112203.545319-2-vladimir.zapolskiy@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:52:51 +0100
X-Gm-Features: Aa3M54qyoulSiyCZ_DIY3VLySWTTm65Hdj2w3I9NfQxQcNY242sH-YfIpWIKr_c
Message-ID: <CAFEp6-0Ykn4VNMMAa-WzCDcJ9=Z0x9Vd5e7z8FSNf72gGL7c2Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: media: qcom,sm8650-camss: Add test
 pattern generators
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: PS5YzY_PqZ_eNLwFy5kbEyH8jw1dMwL8
X-Proofpoint-GUID: PS5YzY_PqZ_eNLwFy5kbEyH8jw1dMwL8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MiBTYWx0ZWRfX0GiYDptNED2r
 Bsvt28N3k8oukZ9p8cd82zpW3cNHTXlUmNDMGOa6n/TjLyUFkteAYHld7EmJz8Xj8E0z0ZxTven
 0HPW8TN4evFrfPDXIO34Yb/H2yuHeds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MiBTYWx0ZWRfX/2YMF9avCa83
 /DZIIyd0CuaRcbbts2P8dvU0LHhy4P8vu1RI+o90FAh75qx8Zfgj1W/AtFl/sED1w3VnULRiUAm
 xhDBxXnHad+IOCEe6yobcKjkhbgwI0c+1Ms6lmZJEOgpLDKjUqm3450uAEn3HVdyUAb6jSJtm4g
 D8DVQWoXBR2O/YZuzC0RYl0rwvx7oKS/7Hi+ootwRUGsL9jHdTz5ckWM6WEHdrvZHFwPrnBQhSe
 NNZQ5KL27gg6gs1fXWazIiA8Q3swNcwcdaaRxjYg4pwxVo+nAHujeUvuvnHMBExnx+dRmSYEvrn
 9M8KVGzQ2PKrgCwbZDcQXVVLM5Jkw/oOOg62bn1+ATMjnEqQAtayy0fWgVUxYo4o/Jhv5kNTqTr
 W4ZZKH/JClG2X9Sx9tCduZEXgRFBB1svyVs7CnZUJeRSPueNv2rCpaAB5SlJKIj6yUT1Fl28Uxl
 z05Of49sA8H/YhyXRKg==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b080f8f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8 a=hZyePdzDgcEG3UIITL0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260042

On Sat, Oct 31, 2026 at 12:22=E2=80=AFPM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Qualcomm SM8650 CAMSS contains three test pattern generator (TPG) blocks.
> Describe their register spaces and the non-real time CAMNOC AXI clock,
> which is required to get TPG output frames passed to VFE.

Do you know why TPG support requires the non-RT CAMNOC AXI clock? Does
the TPG perform any memory accesses?

>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../bindings/media/qcom,sm8650-camss.yaml     | 24 ++++++++++++++-----
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> index 9c8de722601e..50ae30cdcb82 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> @@ -17,7 +17,7 @@ properties:
>      const: qcom,sm8650-camss
>
>    reg:
> -    maxItems: 17
> +    maxItems: 20
>
>    reg-names:
>      items:
> @@ -38,9 +38,12 @@ properties:
>        - const: vfe2
>        - const: vfe_lite0
>        - const: vfe_lite1
> +      - const: tpg0
> +      - const: tpg1
> +      - const: tpg2
>
>    clocks:
> -    maxItems: 33
> +    maxItems: 34
>
>    clock-names:
>      items:
> @@ -77,6 +80,7 @@ properties:
>        - const: vfe_lite_ahb
>        - const: vfe_lite_cphy_rx
>        - const: vfe_lite_csid
> +      - const: camnoc_nrt_axi
>
>    interrupts:
>      maxItems: 16
> @@ -226,7 +230,10 @@ examples:
>                    <0 0x0ac71000 0 0xf000>,
>                    <0 0x0ac80000 0 0xf000>,
>                    <0 0x0accc000 0 0x2000>,
> -                  <0 0x0acd1000 0 0x2000>;
> +                  <0 0x0acd1000 0 0x2000>,
> +                  <0 0x0acf6000 0 0x400>,
> +                  <0 0x0acf7000 0 0x400>,
> +                  <0 0x0acf8000 0 0x400>;
>              reg-names =3D "csid_wrapper",
>                          "csid0",
>                          "csid1",
> @@ -243,7 +250,10 @@ examples:
>                          "vfe1",
>                          "vfe2",
>                          "vfe_lite0",
> -                        "vfe_lite1";
> +                        "vfe_lite1",
> +                        "tpg0",
> +                        "tpg1",
> +                        "tpg2";
>              clocks =3D <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
>                       <&camcc CAM_CC_CPAS_AHB_CLK>,
>                       <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> @@ -276,7 +286,8 @@ examples:
>                       <&camcc CAM_CC_IFE_LITE_CLK>,
>                       <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
>                       <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> -                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>;
>              clock-names =3D "camnoc_axi",
>                            "cpas_ahb",
>                            "cpas_fast_ahb",
> @@ -309,7 +320,8 @@ examples:
>                            "vfe_lite",
>                            "vfe_lite_ahb",
>                            "vfe_lite_cphy_rx",
> -                          "vfe_lite_csid";
> +                          "vfe_lite_csid",
> +                          "camnoc_nrt_axi";
>              interrupts =3D <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
>                           <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
>                           <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> --
> 2.53.0
>

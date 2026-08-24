Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65055429038
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572592; cv=none; b=UhceGcFNhvt9nlxAHpfOab3+wXd4ZSUJ1HKVcuLCGh8IBsGVAAhYf6gtwErSk77LmHcTEn1e58XB1or0glbBq8yiy1n2CHAU8kD7rfXfFqg0I6srjuMxYJF6Q1XkjTfcU3LtwClbCD/qBb/ntieNXRW4suu6h4ONTNG8CSehGCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572592; c=relaxed/simple;
	bh=67xdo98Lw2n5IQ4QNQeBtdkFwF9GpDdKirBYMES5dEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sw4fvdzeXbOToa593tyfrP24cA12uVtHzJASV6mGcOjdI1Cer0KQP5hC/+8pgi9/Mh+52ZhqwkmiRjtm0V6vUK0F2QTTaHKRP9Et195M416HNQDmLUKd/pYuXfip0G4tv66hvO890KycYM2QmTcEvQzxo7FZpYTkbeeMjcMNSWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKJAanxk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JwHYS2Gl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QKJAanxk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JwHYS2Gl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMYH01673198
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=; b=QKJAanxk7tw5Pe2J
	vEb/1vntPDrL046mvmH7b2aVD/L7vuI3+tsstMemRTI8v52JvTCOXNMHBuKnj94H
	vCVBWKOZj3tLIMReVfUelhihFo1n3OJ/VjjaSPuipuR+W6XNVdpKrlq4pf/XSxlQ
	GHiMBoAMQPosXkcmsulVcGJhyeYKoOhPNcj0xCpWLYaGr/Bwt29yhHxgK1UIQsq3
	rb9qLIAo77QfL+CGh9O+FdyB4xIHcM/uOnf2ZUhr00+EbN/g8PDT0u8LhroUlpO9
	Zd08eJJOr2Sl6hkdQt+7hqemrBnKl4V4Przj/RrPc3hh7sTCliM2qxr8RbhX5OSG
	otQqCA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf11e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:56:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f113592bf3so63242486d6.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572589; x=1788177389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=;
        b=JwHYS2GlKL5uswswk1SjejowxeoUNv0ZZSa+oTmJBMrdkZ3XOODeJE3Ei+Efkl0dSR
         w+VQCZEb52LOcIDtavtIqW12R9eIHItcnJRWja/v7XrSzF625pmkyhoIKIHUB74skVaa
         6NS5FshqoOrFlliIfQBWe+/AYnb9e1+Y2ANzfQ69cFM7H9SOXmYSG47ubWXAagFbFNIe
         Yfl9iuyrnlPfTGEr2xhiVw4SKhMgYcwpawPOQdesxzsV1Pxb/JLZakxPife+2BYiFAtK
         d/H+G0r7T6JD2VosSCIrz9AcVkdFnsqFgHl1RvCnkI6JsVitbchT7PSKvHyqW8WIGIZU
         xinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572589; x=1788177389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=;
        b=NIc5X7LR8ZcMkPIeMRs5COtgBXfEi1Gt1hsj1rKSyoIzsc94koqqfgY7Oj9b65+HeV
         NX4Ih0YeLFLn1wgqS4Bnn+19LGckEoDezCNDLZcuGNhBF1wiQFjYm3EIOEFPrVP6F5Ti
         f2+DQhDJxFqZIAzvdNqJpFmyUkZzjm/rdZY2RocdNYyLhU+j8Pfle0H+vfD3OmZxsG3D
         xnJOa9SjdMxWoHsVwSDkTjUpQPyVSd9GLmHd5IZZtuEVgrJ50mMn7pcIRrgfGI6DEAOH
         pKGWof26tIJhDoEeGwAfenFRVycC/a85zkluodPeIL4o5SiBGr0LgYFTla3wb/H4Lt5G
         VpKg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5y/iUYB6VWOeJ/hUbydM3MI+EhEAXyw2ineoYaba+7KvR6js7R1PQNMCgdx39USe2uYgaop4B4RmB@vger.kernel.org
X-Gm-Message-State: AFuF++k0Vi42dTbUn1xwcOWlJ18PhKTRtOxksNZ1wCggUi0D5LRNf2UN
	1wDadGPMuJgcyZLnZ/854PFD8PFHf5QXf/A28gbZz3m/Scyo/TkAmHLWLSNOh/FMKZSs77b5YSO
	yA7fK49ud9WGmWXf03Pea/0EaA3i00vNwJd0trHWaAo5Ao03T/YP1Z+VU8x2U/IIh
X-Gm-Gg: AR+sD11SP7EX1nF9QdrItYw4tsC1RivDRMpk75t0qCZaMJVCqCIyHv66m/CJHa+nGHM
	IcyMr9Xm1twvk9UVI7Zxesa5RjR1Ol/5Zmx/Y6moq+4rvtob3eYcvyg/+/A5fc76E/gJEp56117
	kQlhp43gA5eOgfkqDgpebbZTndYAXungDgEnoFBng5E5bT7tp6osEFX4PM+mS9xVjZQPhPgoQxt
	V013e3hCs2YAiyLyjzVPJlerHj/wR/PZWwoNAFD5afDvCmsq8+iJ8Vvh6Bvoo1lXJzQ0qqcIKhc
	R9yINaJWw4VbBbEEQnRmiuwpP9wzIahXNQxPWdph4nI4n9pC28UJ0/+2jrL0N6vsKCr7rhHlBW+
	tmFNoxJ2Z
X-Received: by 2002:ac8:5cd2:0:b0:51c:1568:3a53 with SMTP id d75a77b69052e-52df5696dd2mr214101501cf.16.1787572589455;
        Mon, 24 Aug 2026 04:56:29 -0700 (PDT)
X-Received: by 2002:ac8:5cd2:0:b0:51c:1568:3a53 with SMTP id d75a77b69052e-52df5696dd2mr214100971cf.16.1787572588857;
        Mon, 24 Aug 2026 04:56:28 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:27 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:23 +0300
Subject: [PATCH v3 36/47] arm64: dts: qcom: sdm670: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-36-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=67xdo98Lw2n5IQ4QNQeBtdkFwF9GpDdKirBYMES5dEk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDD4th83vb+iaDFw7h8AA0eJ+ytMB116I9nW3
 g4NbrOrjuyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww+AAKCRAbX0TJAJUV
 VvHID/4kWEoDANlf8jQJ+bmqqsp0huQW6H2ir73t2FMh88pXnRkAD4LsdmRt1GmjB81M67Ntvof
 I1QZ22N5yT2jV5XHpXmhe+xMdm/YwjsKujiAD9FZIndPLazmZBVtBdoQrrYtOfhOv6L+/9TEBo3
 4OCoKgfbvg45fFkeCiPFrBxCN7D5xIxjPLbco4eelv4ZJYONUtuGGkiUgatAfeAm+tovZlEdOnu
 Myqrz+FXX87aSuEwg22eExPEtg4o7KpvUR303wMF/O91ou8zkcBSpnGC2aSYzG/pvgwRt28D7Ug
 EB/qFA14bEZTd61suU0YhVGsZcLgIwTxZQEmOwvpR0GgzTmD+GBBxgNT1JVpnHuIvwv0L5N24PF
 x+aoXs4vs06Y0exJ/x/KnJcHGNoB+NDt4L0lD0QJft3gArvYlEJFfKpeGG9G1xY5KrQ5cM1slF4
 ZGJZeWunbc2L/hv5nTKLLGtCV/1TwcH3ihersO8yANkCfI0fGeXgReQDo0PIeG974V4rtsenzUC
 bFOu3tFQnJrj5ZaVPglt/fP42TuDO3oJQhJCLGjCwvrLK/ZwqxrrymtHlYR7FV/LrMTzD6sKKYS
 CEeSiPG1N+1MGBld/2aBC8Lfo9DB4uJS9ypzOgnLusfacc2+q+Tg16ZocH6qYsgpS3AqGSrQx9L
 WjLtf53PHNvAuew==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfXxT/LuNue+kDg
 D2CkPpoTdc6PDfkOmG8h+lRZRPYR7o10wWNkROzBAxNMixm1YP/lRoF5RtmhSdXD14O/Py5kmUZ
 yy3YS4eN8d+3yxWCM389zBRkzegyj9A=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c316e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=82sHzFGN3NSTCjlL1roA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: fT-cX6RpTlmftVEtx7FJKRgSo3vOb0qT
X-Proofpoint-GUID: fT-cX6RpTlmftVEtx7FJKRgSo3vOb0qT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX0mnOzmruOQnW
 B8+PDTasS/Vk5I8tsO7kD/Nde3T867wnkK4JcwaitLG2ItIEAMqlcIdSh+pzQF0JlcaKZK641ET
 UGHBqasCjtHppIoMtBkZIZ6XBK4T8PBBZGLG4gyLKRF3ZTrFnw0GX7ue4ijRpzCSUE+2bnzQt2V
 XzUoVx7FPRK3JFE1my2aAHmWnHd6/cs4Qdvkj5jV9CDTHTBJk8UjG3AtYk6ynvN0hES7f2u5eWN
 HkrtCzj1SDp3g8j/kFV3W58p6isyQbCxghTJpaiFICbTatIIA3b6cdNXVmmdXVuEY1LYvjg7KFC
 I87LcgdetPoVQ+YGq6UIYYBYwUM2GE+ZSW5kMXP6F9NnOfYAE6dMC8Kr8jhe4WN7jt4uFHTUv/t
 4n8j1wIPKlIt0Tba3VF4AmybsJZ9QrrGxD/fxU9+nit0m1F8Qwt0Ya+wmyDWc1DH0pGB/EZvnr6
 MgcYPnrwKQSSMzwVwng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240100

The GCC GDSCs on SDM670 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 5c60ea36f04a..1978a54db23b 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -626,6 +626,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd SDM670_CX>;
 		};
 
 		qfprom: qfprom@784000 {

-- 
2.54.0


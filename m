Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D605337DE8B
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318533; cv=none; b=H5LL9G2C8/DPyVRr8k0GlXZQbh2wN7R7lMCc+xBB/ja5x4jcVf51cFL3K50iHZ2hdv5/CWLIXyuUh0VuaCiAGem+XIR+D6yXWRVCzxYkhbqbqLC6m+/XttnWsDMAq/TuQVuGP3kriBkWeNyIIZ3TH84ioMPftY2vd+q9PGsEfF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318533; c=relaxed/simple;
	bh=xt8fdY5E19585IRxlf2tv2dOaGtOy/UcGSJMOtFMvaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mcibKxM85eG/Zk37sIJvc5k4W2eU1C55vn3gdL7jLAp3wkMY8LU75cN0BrODUkialJWm4su+KywSz+J44CmcdAR257HMEcEsQSKecvbC+zSyqrak0ZRNwODYGa8jpPvGLNFs7Uocol0g3GgoKC6TtKa9UQMqqjrGZMQefj1HPK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OJIMoIjx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kc8Bclsw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OJIMoIjx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kc8Bclsw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518ddUf3563820
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 12:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KOu0AHZCj/AqL2PiuNRn2hpGRFubVPT4lIfFRQyrc2M=; b=OJIMoIjxIzA/L4sB
	97/pa2iikyaBV4O8xPnn05rYy0pJ00F5uOeoN4VBJZ3t240iq9gRZx0krIr4SDi/
	1YmR8jjC1ZFXnEceT3RXGQBDzC9hzxmbGEnRbX5PYH6px7KOfBWeG5XICx4Aetz7
	LOwfcs8Ld3eaM36BC2aeAhsH5GbGYz2aFxSaKn4W4/o/d5L9Xaif9rThLMXRYt5p
	aaMrMTbFAQa0Quc1HFSCJ9nWrwgUzE0PscrANgbCzZ7GDebFBIfGejcbFfMsa3qn
	DubYsV8JU20isDF+a3CxrsbgzWT5i2eU7plSgaCrDtk5uA6Lnzb1yoJ3lwhU/sMr
	IzQlag==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6rxs1r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 12:55:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36ba98cc003so2631182a91.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 05:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780318529; x=1780923329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KOu0AHZCj/AqL2PiuNRn2hpGRFubVPT4lIfFRQyrc2M=;
        b=kc8BclswHPOIE1IYkrhlzFTl4ZVn5uyZoZ96jtvf4mS+rO89dgUSSKjIf0TCNN9rjw
         GZpnLf4KShsS3FNxsisMW7rC4fvz3r3p6ADPfa7H2iia1EoaBnWxBJE6HYAV70QKsssN
         i3oOKyQMdJIq4njqYnl0qgwRr/Ih2A+wyyifv/Q4orAIVHED31+SwstmLkiC1gocyzkf
         xhXQBmUGjSLTJZ1/IpTDfnGi4GHsI3BKAAZTH64/1nU9k2okesWeExRyIjjWfYr+kwmp
         GGYfpIpbT69bAHYM+2FobFAo+yaeun966mzjYug9jF7paugzfN0cRNdmoS9rFp7VZdqU
         UGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780318529; x=1780923329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KOu0AHZCj/AqL2PiuNRn2hpGRFubVPT4lIfFRQyrc2M=;
        b=rZMP1Jbm6gsKhbvoAyY66blI4kcYgWbIXFwTD5lHAm2BtFL9OZYDROs7CgITMKOsZT
         mSOUYCEckYEZZUfFv4bBidoeCDk7i73YsYaXCtXN8Udpaf0n8ADQJdlbPgLb+pIIR7/4
         A87WFUJ952PMWZx9uta+S/J8UBIKQqF/I5K2ZanqNQHrJYLA110D1M1uSX5O0DG7Fvei
         pc6embwEDdhGo+m5mHmDQIfzecAmiVOALEX3LC7W/jlMmdgDvLSaRJO+duxc0sEAovxr
         M6Ikq6ofpNDJrDRVAgPhr1TwDLjR8fyi/sL0qqgktVHN8I6j9eRTADk81Wd2n2bYNXC+
         PjMw==
X-Forwarded-Encrypted: i=1; AFNElJ9WOCB50Ll1Jyzl6JqYPuEUvm0BuyEO/FM8EdNebtwMoAOB23O+cGS5NyM1ivWdJPYyUec6qgAADOeU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr6NSkMGNaKCUCX0PLoSnNYl3KvlBkmeBwmy0+M9KYlRvlX3HK
	EXLGtPuKCFoZ6Fl9YH7acxJtXqfxdBLWlTxEr1k6Z3jEryB6DQjwUYHlQxPw7GsskdBb4GWaO35
	1AU3DCFS1TyAXWYXa1aka9/cnO1refWzZJJ7kCcj+p3S6muQdK8dnvr3fJ1/g0enX
X-Gm-Gg: Acq92OHUR+7bo9JDIDt5bagR8kFKYloe7GyTsM/JxsquHhnPB6zzezRvSndQ3rnA2US
	T7H/O2351AR3s4tL7dsNvilVJSRIHUh5pLqrMHt/HR019bvk0vIg+8jGKbxEKZjvzztvH5bxwXo
	VWNug5ngcVAEii8qCI1Y/9q+ZCjACj1Whx8CdvlQvmPU77k26O4XaYtxdqH/giW5L36/77sNXEy
	ZUsomIjUxVQZLA7UUY6ZoRt+G/Q3Bg29PDNrSS6HLodWkZFxMW/VJgpwSc85noPOFIY7wsvdTlV
	DitsqVwjCAPDsdm7X67mfN0ddP72OFXAghjlpOHV9Hl5+BNQ64kHNL3U70tfMnNtGGc7UnkolXA
	emm1VoIfkgcGB269iD1CGung+7Ehe23TVWnj6RbF0dX+4O48=
X-Received: by 2002:a17:90a:d2cf:b0:36d:649b:ea46 with SMTP id 98e67ed59e1d1-36d649beaffmr8911256a91.2.1780318529577;
        Mon, 01 Jun 2026 05:55:29 -0700 (PDT)
X-Received: by 2002:a17:90a:d2cf:b0:36d:649b:ea46 with SMTP id 98e67ed59e1d1-36d649beaffmr8911221a91.2.1780318529159;
        Mon, 01 Jun 2026 05:55:29 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a21f0bsm98584135ad.34.2026.06.01.05.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:55:28 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 18:25:04 +0530
Subject: [PATCH v3 02/10] dt-bindings: interconnect: qcom-bwmon: Add Shikra
 cpu-bwmon compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dt-m1-v3-2-0fe3f8d9ec48@oss.qualcomm.com>
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780318512; l=1062;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=MfVD9NAJt+YvcfkJInifeQ/jWKYZMhdr3T/JUeWSDbk=;
 b=Uh7PrrReCvRpFeh/qvXNKGwe7u/r50mXMD1tIfFec/rxJuCMqrUOlwaHmejsbTKAshqYyokLu
 FVl2tlCbJ6xC+UQA0MDuG6T3pp2l4Y+6jSWsMQY4Yvvj+S5pnHSfhWu
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: fB9IhkN-71k-A2s0DcgaO2vGkX6SSMa-
X-Authority-Analysis: v=2.4 cv=dsfrzVg4 c=1 sm=1 tr=0 ts=6a1d8142 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=s2Q_muabT7T23weRVv8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyOSBTYWx0ZWRfX9+p5NibT4O7X
 lhvXYTl/pgZH7BScwdIITnwkvilo0gWIlq2M1P6YXkDEkVNkuUC+Qn6f39My7C9zY6pJQQ5HL3n
 chx/KBJGaXz8aUdliPCIVSIjfqJzExLlF7gvu84rqFWYNVOWSMMiok6CenFKOAaLG+/nEVZ9l7F
 yDFt8cciutH5cmTCr5nR99hiWynOb3KZt41v0ssd7/0GeSbAJzWzNE0FMFYgs8g43m0rWQznvvj
 AoiLjlOGNnqKJKEFjwkvaSgwYK7hJUGQVm8YpkUUiLhAlZVvxV6EKfIAddJ9x8Oh71qJO3Xn6Ci
 29ZrZIS6cafyNFI0XgZpjMixnp7ASW3fM6tSKiBL9rAfxq4jR//VNlWJFG8O2VMZxiHgza6/BFR
 I5ErnnBMNP6OZ3Uwqx3L3Z628A0fBuDUrSkTOq69d2/snFyKWgEB0//2UTyQiOJthmZoPMMK0Zj
 QpevBAtq1+aNoa1M9Xg==
X-Proofpoint-ORIG-GUID: fB9IhkN-71k-A2s0DcgaO2vGkX6SSMa-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010129

From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>

Add the Qualcomm Shikra SoC compatible string for the CPU-to-DDR
bandwidth monitor. Shikra has a BWMONv5 for CPU.

Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index ff64225e8281..8f6c937e44ce 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -52,6 +52,7 @@ properties:
               - qcom,sa8775p-llcc-bwmon
               - qcom,sc7180-llcc-bwmon
               - qcom,sc8280xp-llcc-bwmon
+              - qcom,shikra-cpu-bwmon
               - qcom,sm6350-cpu-bwmon
               - qcom,sm8250-llcc-bwmon
               - qcom,sm8550-llcc-bwmon

-- 
2.34.1


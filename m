Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79038386C14
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257539; cv=none; b=TEaQlnHyKlxzt7CDBmbDRfFqtQrKv4nnB0JQyJpknTJSXl5T+hb1w6Dl5tBjUe2cPx7yjMzbfqf8YXCTstdoQgHBbWTp/lPrBIWnQkFFt7stLLpHM0ay2y85vEtAZn83jVporJkhpzc4dIQr9ijlwKSZ+0gSzThm9vIUXSetFLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257539; c=relaxed/simple;
	bh=zSf5B+scx1LHzF3C7LbBC/eyKMhHBwfouTQryzgofZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tftFw/0gCUZYX0VzRa2HosmvqfjBAC28kQclOd2HcsB9FSPk3WwTaX/WDuWfVLfMAhP2qhHMOk3akyRaTd6JK/V4id1p1jL+dAFv0n+oYWYMac41SzgDct0eDIt922kpnG6K2Qhm9KasmyuPX876SIjs48S4gTQjA4k4tGVNodA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c08vod+7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B+ZyICMU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c08vod+7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B+ZyICMU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7BVir1229777
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxOtgD2NGLF42PFt4g53gf0KWjA7/Alkky956K2USm0=; b=c08vod+7aXUZjxq5
	mP5rGz0KG2Iv3ICJ4p2/BY9yUkyPnYLys4qen1FcUiCmTPYuO3jdOGwMUeGkdk2m
	uOWBU69cpHyCmcPY1Cj+8/oq9Ny8BuwlMNQnGwmQDRH+IZajm0x28Qq2pDdQaNn2
	9tdw+7BbduaNchvYl9ZWzR03PV4YKlw3F6VC0R6pdmhAuPXCFqrlb1HehH5f3z8c
	tZ3My8H6XWeMzLubIBxZh9y16jGp8I8gAXYy6j4sroSvDj2QR9Ds2DbtWIsbnjCJ
	B733J4ZzSZ7XPQrpWQTdkgaNbaFBnTmcp2WCyr9otFJxkc5GCJRDKRkxdpLnWyr4
	m7+naw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghcj4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:18:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35a0337930eso3906894a91.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774257537; x=1774862337; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pxOtgD2NGLF42PFt4g53gf0KWjA7/Alkky956K2USm0=;
        b=B+ZyICMUAaEybtWLLx76IPt4heJ1KsZzU3iA3wP8mF15EdUKb/W649bOiqi7ciqkEY
         ISBpjjQRxPPnBe+luX809lUC+V/5LSK1FrlawidqUQgiu3K5zriktM8AsY3XtdHLctS7
         z0tTkC351tNZb6a44N7Ml4bkBqnHvsJipLpIsnVcQJhqILJFzS7his0FaIQx/Yu3L560
         nlhIgG2tdFj8DZj6+poblvVyUXmXXU1OZg8syuagpkYxez1Ed3r9WhEU9CK/73jW/GlQ
         xfCUw1d9li3qd3elw076vepogCsqPicS8LLAMyU1Rb9YyojwzVkVWCs+EOHEIHk1/hlL
         7Onw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257537; x=1774862337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pxOtgD2NGLF42PFt4g53gf0KWjA7/Alkky956K2USm0=;
        b=raZqRHZU3Krh0lN9Sf9jzkpq1paE/ZX2AQktqwseI3pk2oENA+xgWRrFef0PjxyGR+
         zYwXHuT+/SWDXzliLSiRN0TVwJs3i0l4ihn3aTyfC3bSjbJLjUotWpfQ11YU2KUIWDOU
         zeqHNDmQ9Kqid8pGwSqfZ/DOACTH9+w4u4+jS/kZvqL9rxJ62YxL/f5nnvg6QLm+K6In
         XFvlyTKWFF7xRvqJfD5CprZExrZjtqIfDgHnkfJFc42rJAvZudodCUtLKiNicN9a01Am
         zemsyzkipztMeOaajL+HzAXupA2wqgk0MBDtFWCpmZFl87J32OWl214UjlEtnvUhFoWo
         AOWg==
X-Forwarded-Encrypted: i=1; AJvYcCVXhw6nrLuX2lbrD+pgGjMXObaXJ5+60gegQS6Rl+UE/Vmi+yMQBJ+nyLSWHuD9mUoXh8qrYcgiH5Pm@vger.kernel.org
X-Gm-Message-State: AOJu0YwpbvyR80m/F1KLpvEZFiApf3OxW7rIrNV27ryz4+ycrjiNFmLs
	Ak/QMl7bVkhLtSb9ImE0lFDCfM67GiPnWkzIhD6+s23ly5P5c3SipXeSvkzfTp7s4ftIotzqJF2
	lJWWcrCWMoOVEBOn1N1Or/5c0I5mCJcq7FYI43upOe6pVUui5m6f70PD4pGQkCTOx
X-Gm-Gg: ATEYQzy6RrnqBhfTdmjiWSjRGDqcCBmF0/AVMSfIsV0/5/gBZW4V4DckELDypJs7RbD
	8vx86b4izddI8KjcqdXWU7qZBBpq4pC/p7bhqsMFdZSQtp0sG98sUqfjfQvjhjea31gz5YEXwIw
	eTpuuVRRZFgWm4RI6ziYQhCrO/Yb3ItS4/KFAwGpwPRNE6BCSAZLv7LnsrQu+vnuHB+EM50xnwA
	WoQrnXJrN7Sq7vJZV12x5QG32tPeDlSfXZuT1qZ8SRNADoa9UZ8tv00pMZyHkVLdLMl2QMD1Ptp
	4xw/143iECszZJaw9Wya1jId3C9+7sg85cFar9SzVqQgN/AOnz3xia1ogWUQxqFu93dF6cGUne8
	CrFuYXOFX6xQb3ykEAwS1PqxBkZ/Fi6ojfCcdTH3CDs6di6c=
X-Received: by 2002:a17:90a:6c82:b0:35b:e4f8:7cc7 with SMTP id 98e67ed59e1d1-35be4f8d75dmr3257272a91.17.1774257537111;
        Mon, 23 Mar 2026 02:18:57 -0700 (PDT)
X-Received: by 2002:a17:90a:6c82:b0:35b:e4f8:7cc7 with SMTP id 98e67ed59e1d1-35be4f8d75dmr3257259a91.17.1774257536589;
        Mon, 23 Mar 2026 02:18:56 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd358b5ecsm3923448a91.5.2026.03.23.02.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:18:56 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:47:58 +0530
Subject: [PATCH v4 05/11] arm64: dts: qcom: monaco: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom_ice_power_and_clk_vote-v4-5-e36044bbdfe9@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774257482; l=1516;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=zSf5B+scx1LHzF3C7LbBC/eyKMhHBwfouTQryzgofZ0=;
 b=KE2Bpeyxt+9POWeOYoFJl1S7PQnufeCWHtYVTgveOr+XvgBnLh9rgpPsTldA2Gh6Vp0GXWmNS
 Xe8uo99AM0wDLgJw8n9TK2D0vSedbmuBcBoLlrc+fMymHylZB4Bo2fU
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c10581 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: NMXEsM_t0rqd5pmzDu_l2c6_CFYeEi7R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MSBTYWx0ZWRfX7Ur/t+Bl7Mvu
 yMp4FDi8j12y9fnNZyzk0k22xBvRoxo2xEUdUKVhQZZeGAjXxWZHrdnjrSi1YkqKS3aNnt+HM31
 +CZmIAjr0pnI/8Z6oUyIJ226avcgdQ7hk7jJ7A6KZINqtn4tO4d3hB+5F22lX89bqCXW58zy5lJ
 qjm1UCWw+QwP7rDc+UmOhE8Mn5k8jnylBuXHZ7sC4n8GNNn8sG7h67FRQTBwwHgX7MD4UrvMEIc
 niRAiBbL0bq34IXiMjDy1QgCzGSt8WvB4VYr3S4Ke0vvM1FxMyd+F6H7afKLGzHexDFqNBKgciz
 Su1hrpFg2U0Xy2DljClvuv6TYQ2lwap1DnNQXJ/PJErGfhvlD2adtDSYLchj1ZJbASHzTszXXdA
 ib6k/et6eg7j2FMB/0f2Da/iQ9jMeoHSZOvbn1dbR9n9aOIGn8BVHUe9y5ZNPW3h2JuYqa1/a4J
 sBsvF8M43/n9yq6CvLQ==
X-Proofpoint-GUID: NMXEsM_t0rqd5pmzDu_l2c6_CFYeEi7R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230071

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
monaco.

Fixes: cc9d29aad876d ("arm64: dts: qcom: qcs8300: enable the inline crypto engine")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index f92fdb1cefa0..e408f102a8b3 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2725,7 +2725,11 @@ ice: crypto@1d88000 {
 			compatible = "qcom,qcs8300-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x01d88000 0x0 0x18000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
 		crypto: crypto@1dfa000 {

-- 
2.34.1


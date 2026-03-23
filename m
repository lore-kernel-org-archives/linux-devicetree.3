Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41DF3876B7
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257558; cv=none; b=rlccvkUnAp04AgFaeZlMC7Zaf6rULRAj2GsufNczvcqfbRSYdPJPtjeegb85Y0lkeh3o4p+OTdeBJJFrckKXQPhxBxqtI+i2tN2XXHZEOSsx+tpMUUZ68Z/wBd/oNZlcP+Pw/5S4QqHNjOTi9xSN0dNx3/rG6rENhbIo8aoSCpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257558; c=relaxed/simple;
	bh=LS4FXm8KnlrTRJlZxpGWlu2f+zGJuXdncoQPyY79QG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cRuFbfR1RTXGhNikmiO4LtI7itf8kZir5nIR00ccCVABS3ugsAcXYcw3JHcNjGGqAZr6wHrl+8SJvuZipIns5zYVoKCE7eQQQaC1KciEReWa+fOUU4AZ2oTERTPhHoAA115TgB9q1kchbml5f9TAr3skqQ8/HsDmkR5tI5NT5Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CfIH5dAX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AkunuRhL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CfIH5dAX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AkunuRhL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N72EJx075280
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0kPiIhTgCf9OoUIvaI3Ju9pKAKStgsxqhL0qjTgECzE=; b=CfIH5dAXHmJjhTex
	A2CjDdvi7Cqhz26WgkPJR9mELbgvlucLaeFaF4vlWSbXA4KtzF24Ti3/e7iEgZab
	f0EWn+7xsRDITPZ9W64SnnVg2LtowA8pLmZafC6CDgpLpHwO1m7IzA2IOiL1mgDr
	JhlAUhWFNE65Az2jXX8ySzPHzcF88bq3e50qWf6pHdokI975EObzp2Jro0QMTKGO
	jrz+yYCZOu+ACOOzQlB9wGpmfkiSMOHswWVlnw5VpeSuhjIbvdHivyX5EAyOk2jc
	g4AGQyseUEoUpEriRsoiDMXG8uhyiQdCSflYR+ORjaUHjwYKo1zs5wVef/I3fUVM
	FY3mFA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e4t9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:19:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3568090851aso5100077a91.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774257555; x=1774862355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kPiIhTgCf9OoUIvaI3Ju9pKAKStgsxqhL0qjTgECzE=;
        b=AkunuRhLk8zN9R2Oc4hrDEOzuzBnRpjogSqgyf+wPDSuyIgGQsd+S6u++H+bu7erXa
         8JxNZayJFOt8EjIuVYCKQkHsWGG9LX7b45xChrq60umJMOHha7eYZhS3nZpQH8tIhF87
         i4GUKvZqEHdDlVbChstF/3bAxtk5ROI4Ivrq2yvClaR7EVK0Jb2fxosw0sGey86sZhLl
         QpkUHMKHOEgZyuSlPCZHX4tQY36C2F5ruxMclSofgUYtTLvdsZbC+NIwPpbvvNHoxig2
         uSRYTEb62qEnMgPSUSKyPq2+aWU4Y6fnUZIiuRoMdg9bvauNJqG84+uM5YVOCP+K8kjW
         RHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257555; x=1774862355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0kPiIhTgCf9OoUIvaI3Ju9pKAKStgsxqhL0qjTgECzE=;
        b=lYYb5m0kMjweYoESw6TJDl03lvoyJWdw+9tgB9MMusHkvllV6b2biqQUvoo69T0KY3
         ot49ZCMO7041JtQOe1fyl85jqdx4A564C/2Pnw+uW0YFIQvIugUrJED3nEzexnoUDNJK
         alBSW7ObmhUxRPSaStOFqQWy6p0YxWM4+Mn/lQoF0Kg7RG7qtp2MU6JAmLQnKWv2xq3C
         Kum9EzTF4U4Om+nHMqfl82vLz6/W22BkYfYN18uWc2Q+8xM0g4hgwLV3CBdY9QlyOmQG
         NvBayiu0FGKHvoBwgWSgO0kkI9WWRSNWIzFiG6XmrwlJCWlzb/2HboTyO507dUbAExDv
         uWiw==
X-Forwarded-Encrypted: i=1; AJvYcCX1THq3HibKqkB7zVdJO63F4fFaz7515tRTpEaFntcvlX0SIaw7oay29smwd2BVkOkpUjnmoy8sQmtg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7NMh5E/cgTJl9e857CgkKt40gFcYLmzBQC6UWKj6CQeYz4wmR
	twN4FPfvGOv0QalOSepofWj9gtj856mhAOPMa11zx05jvgEPZuVkqOiTkNc6vuXtju3ILbKFaO/
	q3R/+pCDOmoLrfEqeHz9fupU65mNHEUqN9zCzewNmf6qeUafZfEE21gSyxIvZuLlT
X-Gm-Gg: ATEYQzyTxpefQ12Tmm6ZoTWHePUW2/9k4cX4xpcoVySaJ74Rpmbwq6PzOzqlPBN9Vp1
	/tJ9x/iCgVsh+ZeakUh+bYwAH9KSVXr+YpmrpwlNKYuBWqC5ELnc9VI0Jj6sXPkGU4EoTplh+1A
	lKsTJLw23+HStjgfW5wlOD9Hwjp1YXGoyQvNtRKUq7dwVG0tQrODnwDBNlyQjW6s8c+YRyAGZ4V
	pJIf+oQVd2LW0RKyLOk1t/xaysB5rDKpGBR3sc+L+egOw/yrASi4kv2CSqweMrRyQoPX1JzSFT1
	ZNwvqschWYUOW1+vMQXdLgyf10MFHp386+4WxiDKzxZQwgPADOOoBfqJaY61CjTq8ydLwLQOD32
	Rtp3pirGtuznabilniRpB3U28nbSpkz1YXXWdVrL1xz5vOS8=
X-Received: by 2002:a17:90b:35d0:b0:343:7714:4ca8 with SMTP id 98e67ed59e1d1-35bd2c69ef3mr11216529a91.15.1774257555422;
        Mon, 23 Mar 2026 02:19:15 -0700 (PDT)
X-Received: by 2002:a17:90b:35d0:b0:343:7714:4ca8 with SMTP id 98e67ed59e1d1-35bd2c69ef3mr11216507a91.15.1774257554914;
        Mon, 23 Mar 2026 02:19:14 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd358b5ecsm3923448a91.5.2026.03.23.02.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:19:14 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:48:00 +0530
Subject: [PATCH v4 07/11] arm64: dts: qcom: kodiak: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom_ice_power_and_clk_vote-v4-7-e36044bbdfe9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774257482; l=1513;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=LS4FXm8KnlrTRJlZxpGWlu2f+zGJuXdncoQPyY79QG0=;
 b=biRYorjV9jV7YU0YAsnA5858q5QwIrCqCidA4lchyItfLEu9ysEGLe/XL8uHLOG3QJl06gLZ8
 YklGA+Hy0nqBxf57auSkbNCDdiMjzxsQMdMCc+jIs/2ibF5OBOPFf/o
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: X9FL6e5WySynT6TlFjqLWJnJN15eYJPr
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c10594 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MSBTYWx0ZWRfX67SUSeIij9Mf
 4+RvnYD914aWK6ti01tLPMtfUUB49z5sMy0uKjhwiml6uFpeDziigUqbH0fi2AYW+1Klq4t5TfX
 j8uf2Xcsqo+3FFZInLK1MfwkRYHXVFpRQA9m1kz/mlIjqacM1+wnkxwVSjy48U32++IfiZGxsm3
 /oLqAgIfqxTqgxudFLM6QqWzKv5pCO5BBbuRy8FQ4AZ1tiwCxJgbybSpicdzs43ne70X2+tVBYu
 fZj1gbjfV73Dsnv0Nq0sqs9p4fkDNmksfmkMrwHcdGSuHrSnJWFQge/6ATO8C2uj8usDe8ydsGJ
 3F0pTlQzFiJaPkkOdWI2IMzwWX6WfbT28zSr5SJDfsReKPR9P/ssUDUDnIFQyhkR3+N7gtLyHW7
 BPu0+Cw1qkg0zptjmkxF0HxRWOtRu2YXbiirvkwf3LCciscgjtkijtnj8UNDHLF5NKA/Nrns4xQ
 zXxE2XDR0xMktSjswtw==
X-Proofpoint-GUID: X9FL6e5WySynT6TlFjqLWJnJN15eYJPr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230071

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
kodiak.

Fixes: dfd5ee7b34bb7 ("arm64: dts: qcom: sc7280: Add inline crypto engine")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 149954a3eb7c..9765bf361db4 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2579,7 +2579,11 @@ ice: crypto@1d88000 {
 			compatible = "qcom,sc7280-inline-crypto-engine",
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d88000 0 0x8000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1


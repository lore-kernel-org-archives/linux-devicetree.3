Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A06386575
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257585; cv=none; b=ZkXKkeFzsVzyj1jX9jmxGmkyrZhCDczWcCIcnzVKl0RIMXXP5SbHhoKZAeYlfwvCNIfgzKqrk4v6XtQcUm1r1AmwO1InnJrsFphK0Bt5ndTBGYp25pMWIil877DUrQlfbZaDWRs4zBSivIpVCBRNVHSD5Nl8ovDdmGD6w4Ds+oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257585; c=relaxed/simple;
	bh=Fih3H3PK3peo75HwJmlC27QMm4Iy3NsQyUEJpIpUgHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UgBNJly6yQPZ1HA8ewBx4EHBn64GtFFWXEp9oZckTXdiNtVWlV5a18seAvd3rBAlqzk0GZ7YeI/xHOeViUFDWnnhOnDfDpApyKEXkwy2wPd22dd1BcuctKBAeFDmpn2jDMHJZaVInQA0gMka34PEcKp2Xf1bNq7AS6lkgpNd0pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYtVPsuH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XduWYMLG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYtVPsuH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XduWYMLG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7u2mZ3468345
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aalq/tAtENNGL1pl0pufJMN8+g9gmCvXgFs8/ig8bUs=; b=dYtVPsuHfCu7VYOt
	OD37JqTZ20nJnW9bZUtn1iQASHtwouxAQu8wRsfIUvQO7/KiibwymhQFN1cgb/1r
	gZN4r2uxXifWlWZAasf35iMfdaMnXDqOpAs7VP4dn4Z5KlWTO2rVRYKYUnngQ6Ce
	Dt5ZQGdxSt+V9Y+mAMrFScTfb1XsMp9iHILS8W1m7ZE7Wz/Z+JjbFR769/yGbiX1
	/VNVnXhC8W3/HCpar2v+7SeM4NDu09Sn2C6hxb3DBV848LKjOWbL+srw+NatMNtP
	vb43Fv4CRSeyJVw5LVQgnx09C3PrVSx7/HW4CO9B0GTzKkQqEHlWvn1HXIBUQcMu
	D4200A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgg9ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:19:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3594620fe97so29638293a91.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 02:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774257583; x=1774862383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aalq/tAtENNGL1pl0pufJMN8+g9gmCvXgFs8/ig8bUs=;
        b=XduWYMLG1jlvmh4s+1CghyU6d/QFXGynB95x/UR4b7oPqDvN17/oFFJtCeZ3BjOvGP
         1YImmbV3IlSL04ZceZNP79JCBAxJR0jZqatLWSayfatr5DWQ+6pK1M+DN95gSI+8W6cz
         vkDMCDCWJH+O+scItguq+G1lL4EgahBhM25AcR9DLGnbL2koaJi4oZhs2Q8wGnvT6o6S
         +/oqsVxZNZXwZSsZ66zhFZ2GhxJDfMYalKi2+UNiOJ9xFlQXjeChJ53UA4nygyMQkDmY
         ZXEH7bo6IEGlE9LJeaVL+fpXLy83eoNhfXoOIuJxJ71sEZyYDXIZPoERUnoYLywVyGmX
         E+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257583; x=1774862383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aalq/tAtENNGL1pl0pufJMN8+g9gmCvXgFs8/ig8bUs=;
        b=KKNeS2cnJ60LJzbqw5k8JUKD+dtMDN3DmP8Am+U8y5tLz79YV7djs0tdRTyJstQ0hg
         6K8HMyP6+GDmN25WkDeq1VQWlTZQiSOsrOKqfeCXgrc3Hbc9FPIE8BgjFRIMmXZ5maVf
         zqwV4QZLckeX2dqTRu63jP1XjEDGqsfnyGuYazwJ1fca41ecbOlDpgGGlOZwYH2MZKRa
         4HLyivR5DX6NE7GZH9Pav0U6EkJ21hY1lYUytVXZYAqRLh6uIMPzywr4igvp+nctqZeA
         xq5Wh2ZofaZxIzPfq51r1k66UeVKTDLSEdCesELDfDQ41mvaof/UAxbzhPVP5prC/qh9
         Urgg==
X-Forwarded-Encrypted: i=1; AJvYcCURXeAkELlE1tRNkU/KPq4hy6xLLcZUXeKUHF1lEnsxdl+pM7apgS5MwRZJABzjZydEVxBCK2uOPoJF@vger.kernel.org
X-Gm-Message-State: AOJu0YzDpp3fA2yUL5j7on/HdjwHc53fUk8tN1ey0nJBsXaFO+xoECGu
	e933KI4vl0kYUud/WQRLbk8Q2+fNUlhyU1OcsGEeP0lMWh/mxvOyQlRwhCWE7HB+MqUUUT7Pzh2
	cguhrzT9JRBHr//osWPSRKgUJN+aGGNfT7ZDuaywESAFp2nfzdKFyFKw1sWzI8f0t
X-Gm-Gg: ATEYQzwobTJEaMHrNhXgQtoOnbPxN/6EjzM1+iL0A2hemy3m7VxKPbeA0iLO21+xNw3
	CWS3RLp/D7Qm3NVRebmX9BdRuVrjCsvgd1zixK21M2Syd+o3K/lvM0dIyVsqZFWREchIvkVs2Xg
	HEqvmOInYVrCbtUlbd6r1VMWC4p1fOxwAVOBQTtf49+1ZNTRNt1LKBhZKJ3JfmgEFzMhbhld0oy
	caSopoILqngQlZnEbHIm0RKb/UIraCQFOf9UQK9nit71ZVJtxrUBRM824vnrkl6gcWNb0TgMnmr
	JIFpYiq1L1ROMtwLW2ugDTpYiTYRTu1pjXLh4G4oiE9+GYhqlGOZ4yQacNj7rTXPxPUqq8tJWbn
	tkjupmkF9dhexs/BJuI8/VtZeuBIWbms5qZ8M6OhcMzDs1r4=
X-Received: by 2002:a17:90b:1dc1:b0:35b:e671:a527 with SMTP id 98e67ed59e1d1-35be671a6c5mr4626576a91.3.1774257582758;
        Mon, 23 Mar 2026 02:19:42 -0700 (PDT)
X-Received: by 2002:a17:90b:1dc1:b0:35b:e671:a527 with SMTP id 98e67ed59e1d1-35be671a6c5mr4626529a91.3.1774257582223;
        Mon, 23 Mar 2026 02:19:42 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd358b5ecsm3923448a91.5.2026.03.23.02.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:19:41 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:48:03 +0530
Subject: [PATCH v4 10/11] arm64: dts: qcom: sm8650: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom_ice_power_and_clk_vote-v4-10-e36044bbdfe9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774257482; l=1465;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=Fih3H3PK3peo75HwJmlC27QMm4Iy3NsQyUEJpIpUgHE=;
 b=p3n776ssmKlC9hQM3oCpnh6ItzEMnUlx7FtzWZVKAA5x3Rrj4zsHHqFZpu5sRP/TN5y+FNP2K
 jCw8dzrfM2QAs9JrQtClgAVCafZwDj//YP8MfBe/I4GmXSp6SxLo4OB
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: 3F3StE13_j5RaHeHINR3WOMaSVesZAIM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MSBTYWx0ZWRfXxXQ1gu0qhWsy
 koNXL9vx55gOUeBKHLEFrndpPdFfSofbjUGSi/hQreIXpUZxZBrUnIueoXDXgFKHfJR4bCnUgq0
 EqbK65gUY20Y6ZpRTMyqDOimHGY4eCBULx270VsMJHnHUfNvBGevwEiGqzr0XJbyynVMp2IMGRM
 Lx19THhNJXJ4G8/eptfUT4YDMO2Qm4j3PrwUj7yBcOuRq1YpcRFWXOaKVPDILR/FDuk+FVYGS2Z
 RLM313SWK5pmEe+ifa+D+TQZXfz+d+nbj4n9o8VjTO93fsB5MI1v36ZAhJUytcYvF6vGO2Qop7v
 KjyqJCXtUZtPdIQaGrQsLkep5ydJA6hxsqXkZFTWdyr1vfiugrV3WsRUoNw43u+uMvgeEGOezQW
 DTD5snlX1lmv731QtXmbESGEWRDlCD4Y+K4yT2D8KMB1674lXAG88fyyH7xSgIpdKdTfbqzsA4n
 WVuipYvj6pe1rwBio4g==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c105af cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 3F3StE13_j5RaHeHINR3WOMaSVesZAIM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230071

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the UFS_PHY_GDSC power domain is enabled. Specify both the
UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sm8650.

Fixes: 10e0246712951 ("arm64: dts: qcom: sm8650: add interconnect dependent device nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 357e43b90740..d211bd94fb41 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4081,7 +4081,11 @@ ice: crypto@1d88000 {
 				     "qcom,inline-crypto-engine";
 			reg = <0 0x01d88000 0 0x18000>;
 
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc UFS_PHY_GDSC>;
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1


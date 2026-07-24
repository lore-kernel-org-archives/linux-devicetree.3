Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F78542125E
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888083; cv=none; b=iYN5BVf+7aXebmmypkY7yEoUpdPUGwRWUYggp4DAV2NdHkSWR7yE6bW8BqyxDUJ70r/dO39pI7eYREED9n4d0RSwVisKW2cA4OORySClxgT9Vlsy0KkpRDTeTHjDBawugzDtb6gBq7oRzzGOWcMbx7xGg432j+a5G8R23XlA3C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888083; c=relaxed/simple;
	bh=+DLG9qcyUgwzvSyAJXIEFOR5biL+OffkBbsNb2FLaPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A6Y8p9bNlWIU0wKPd0R2/CKcHFsynG+w9d/yNf08FhF/LNeev8PMjgRYItKSof2sOiobZt5AbUq8U0LwQ3DIyta325/CfdVZphgT6+6NsdAW481GuF4Jl5F8viSVcMlGOn65etZBfwHCERgIKcWb1wk55BcIqjcBsMCrvQ9cN38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GbcLrGBy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fQudZZyb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GbcLrGBy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fQudZZyb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADdep2720909
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	owz9GHEUOfqCkUnJifN/Kj4c7LuavhIMaFFfbdF4YJI=; b=GbcLrGByESg9q+Jl
	Tx+xNgOGT7O/x5xMDBRrZAsgAo/nH0XuYYFP6d+ApsP/Jt0c0gFbSu1yKwPe9f+o
	fl9hwpi+TN4IuOgpr8RsIpnas8Yf+zaaE4jRekDfIXk/R4W2fGz+58em1we9ai1C
	/Kn5zfbLGkOUiCSKX2wtwsPausGNqeor4acfMk4Mg6Mp8UXWlak+D2WEcORbijPB
	bsaaB0/ZgcG5AXPIFoWoR1DVrcjgHHqqzoeXrGKN+/jAX5VrGghM/EfBpi0KU29M
	TWdROIcCoc1kYXHTjBG9Y4ilbVxxJjQHxNPF3cDX7fnrLHX29NuEWtI6yk3rJ7FN
	Ys1Eqw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5yag1be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:14:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb6823efcso3109105ad.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784888079; x=1785492879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=owz9GHEUOfqCkUnJifN/Kj4c7LuavhIMaFFfbdF4YJI=;
        b=fQudZZyb0C/JkLQA8z0O05/YhSuydkG4WuwioTT/2gDuL7nQZAbLVoMRpGQ6BDxP3D
         I5EZgJ9M/i10xRAtCuN1J7Mpy5AfgWP4unl83AW4VE5FsB6Dr51pgvXH8BWSylF7VeWm
         ECpC+YoEpRwueD78wMCLze+8R+j2AP3yIkhHvoWj+s3jIV5Q9eR2MC4/7LQG4G12W+vP
         POw6w7yrJsplEaMBgi/a1H1eNHDGHILMjkZdYAa2B/RXxp/m+lBFk43j/on9veZXfMj4
         A0fy/H6avoWH3I6iS98qKS2BdyvmWKHN5hehpr0xtYh4RxMZNgomPNdvaoul9a8jpUT0
         bqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784888079; x=1785492879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owz9GHEUOfqCkUnJifN/Kj4c7LuavhIMaFFfbdF4YJI=;
        b=shT7M2r0y9tGTcbaSrEiJZ03XLhYDCiuig21ETGFlwEUXDyf2nOq7C4upCqXy1G0Hj
         xb2/A/vSdHbVTZpbg0+5ibBx8HSoBcXo3M2PUa9bIpqDtJIKujYLZsxdXRu9C9Bj9E1E
         76Okk6IbYTjD7mcYzk0XXGVfn0nEYk6Vg4fUgHdfpOHw21uDTxaNsBXfVFlxKcMWFOYj
         p3BM4B1UvnEdvav2LG2Gj7GUcjy92QexCrx2so1Va5ursNZIiof81JWkiMDpQxx/wcyJ
         J4146tGKXng06TAF61Bfg+kSPAYuVtZ/G/0WN5/z8cDxbsJgJIi5To/J7+JtZLcrhov3
         yhiA==
X-Forwarded-Encrypted: i=1; AHgh+RqLEKBx+km24BRs5BvqUdir6f1DyuXLoPPEXHIyZfcCjPCnnSz6n1fRfQBOi7IZV6mi7/m2WhPPfK7I@vger.kernel.org
X-Gm-Message-State: AOJu0YwtNZjJ75Zl2BN/SXfY6jjzngbSuNEXR2bpAeD1jlov+yDqHXHV
	uvGUQFHdz8Tq9nYVpwPpfw9emEAIA871vtUeHUzsSQxvgK7FmcMr3pRGAOENVj0+MiF95776nvT
	K1nA5Tec07caWSNwslAlATsoSmaRDmO4kHQuWUFjYf4dT6M1EDKeEI2RawxnBH5s=
X-Gm-Gg: AR+sD13ThIrRgzpJXGq6lBerEgmUIqpYc2LhLbdd09N8tHKinBZLMMUMCzD4z0cxD45
	dDl4Dm8HVm8u37MoHucK3tzRaa9B/4KIS+9O4AMbuVnEasdc1q7jLf+7yXGBhHsTewXnzHJ3QkK
	GwGiuQKU/5K9JTkKGUrwd7N8Zk3Wkf9KxZg07BxO6YzBt4sf5mI+ij3k/hyPBxYLVnSginH2qAx
	6aLsKAAtkK2ZMJPLgJBCW8woHEwfeR+X89OQG5sMFOtGmIJzDDKzYLo4r6RlQ2VeLiJOMZQJlJo
	ebUcozFkDBysab0V14/aCTyp7mf+ROctenWlZ/EkqvJ20dn0vIB6ljiT3GJP5ErwPA/OA08FNpm
	ROk/CtxtNPFaqvCseVe07a9LMqJmC+Q==
X-Received: by 2002:a17:902:f709:b0:2cf:b330:e0e8 with SMTP id d9443c01a7336-2cfb330e151mr49854115ad.10.1784888079209;
        Fri, 24 Jul 2026 03:14:39 -0700 (PDT)
X-Received: by 2002:a17:902:f709:b0:2cf:b330:e0e8 with SMTP id d9443c01a7336-2cfb330e151mr49853915ad.10.1784888078820;
        Fri, 24 Jul 2026 03:14:38 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f31f14csm48486575ad.63.2026.07.24.03.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:14:38 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:44:13 +0530
Subject: [PATCH v6 3/3] arm64: dts: qcom: monaco-pmics: Add PON power key
 and reset inputs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-b4-add_pwrkey_and_resin-v6-3-41acc214d93a@oss.qualcomm.com>
References: <20260724-b4-add_pwrkey_and_resin-v6-0-41acc214d93a@oss.qualcomm.com>
In-Reply-To: <20260724-b4-add_pwrkey_and_resin-v6-0-41acc214d93a@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784888058; l=1614;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=+DLG9qcyUgwzvSyAJXIEFOR5biL+OffkBbsNb2FLaPQ=;
 b=mHE23l/I/hfbcybrBtTJMrbVqMqusxmSm0T9DB2ajaV6smgNAF/ZLn+aQ5my5HDb0cwbBCYlJ
 Tc7LHdak0TgANNctHsnEnaEtyyYj4+6tm34LE3Yq65EytZMssFHLaz/
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX5Mwa9R1br0Hy
 /PmP7//ivmS0hlzx5ZYmjMT+sNkqU6I9kXEgNPCyCyR0IHJb/67r1glCH4w+vV9HuwwIx56yLrj
 YSSMHniUsDUu6zO6stb0yDLETC1XU8c=
X-Authority-Analysis: v=2.4 cv=Rtz16imK c=1 sm=1 tr=0 ts=6a633b10 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=f3aK1VMAgMfWcFvZUCoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: frPICY0m1jOM7YoQN2LoUgWzyrv2qxjz
X-Proofpoint-ORIG-GUID: frPICY0m1jOM7YoQN2LoUgWzyrv2qxjz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfXw00XPa8hVqzQ
 Lk8SlazzeI21teYyrtv1kY58xPCPNQFYYdT2GIPIt+XxyjpS2lCpU9mu5Q9HAsQEJX0pFODeEiN
 gh4ICfUEHla4LqirGnHkvbZlYvLI14rP/ZbIfrrhic/eR1+jnNkquXMNPhIA6j59iXi0trOdikz
 6GzH9/+cBbwK+bAWxaRu+ls8ONG9v5w7s6Zn/eP3ayTslFogd3sgDzgPZBIOiNTDOmZXzH94o7L
 5T9YlHBG9Dh0Z404yiiy/G3eOHTmwSsyC0f+Gr7kAFCbOzgzSxyWPxW3QD46cj746kYYJ0MI/rN
 ummshdyvuu22GUgF9kUW7bYGF0vORBenVIUD5gq6sgY+iutlkA9kdCmb2ft7HjMBWoWFUiVLmpr
 tsfZWsptGaTMRKsCKuzyUoIyCmvk2+k/GO97bFf+FiETywS6jblc14qjx9jLR4ZyeHmcfaOMtEY
 fj1A3i/MEFf0ghGwYIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240093

Add the Power On (PON) peripheral with power key and reset input
support for the PMM8654AU PMIC on Monaco platforms.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v3:
 - Disable the resin as suggested by the Konrad.

Changes in v2:
 - Add new PMM8654AU compatible strings as suggested by the Konrad.
---
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
index e990d7367719..af4c38309efa 100644
--- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
@@ -13,6 +13,26 @@ pmm8620au_0: pmic@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmm8654au_0_pon: pon@1200 {
+			compatible = "qcom,pmm8654au-pon", "qcom,pmk8350-pon";
+			reg = <0x1200>, <0x800>;
+			reg-names = "hlos", "pbs";
+
+			pmm8654au_0_pon_pwrkey: pwrkey {
+				compatible = "qcom,pmm8654au-pwrkey", "qcom,pmk8350-pwrkey";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x7 IRQ_TYPE_EDGE_BOTH>;
+				linux,code = <KEY_POWER>;
+				debounce = <15625>;
+			};
+
+			pmm8654au_0_pon_resin: resin {
+				compatible = "qcom,pmm8654au-resin", "qcom,pmk8350-resin";
+				interrupts-extended = <&spmi_bus 0x0 0x12 0x6 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				status = "disabled";
+			};
+		};
+
 		pmm8620au_0_rtc: rtc@6100 {
 			compatible = "qcom,pmk8350-rtc";
 			reg = <0x6100>, <0x6200>;

-- 
2.34.1


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA08348822B
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450905; cv=none; b=kMAj9pGUsBvmT/330HkLFAaVUtlWnd0v6dK2hCyuGOU2xJaWbU9zfuNYqMLPfiQuwd5N5xIJVHfr7k0A8HiSzgrEZ4Q+S7zv4Yc1kI6oQnxNDBBB/DTljBCAp5NhQkxc5LBhVHcIg/1ovWGRTOMIkn1e463sJ0I7uYnLf39X+7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450905; c=relaxed/simple;
	bh=YeE2Wi2BUMtF7zA5tzrBr0/JR/oQEMbTew1TtJW2Z/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wi2gGx8yVZihF22WdIM7oIOJ8giXK0Q+mBQWMX+u+x67X3UJLKVzUJB24LnrGaZ6vsrSbMnyhNZDWCz70XTjHYZm3t5zm8yIeUWzKsuJyRYL4IDD+lj0EeynRY6o2PEGQqmtalK1acnFuN1BWOke9qodrMiukmCd1zIPxI0qFP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OEqh2Hjv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LT8u0FRk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OEqh2Hjv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LT8u0FRk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K9x81574548
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 09:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qH/i1UCq+7xtnWvdiMUFxhvdLZWNFzfO0viM2WFgZWw=; b=OEqh2HjvmrZI1S4C
	uW5eo6a5iIYMBp6WPLjz+QTs0xeo+4Z/vrkLEpdmx+VKcB9FbMcG3P2bXHs6KTbK
	6c8wZnj+07T0os4dyUGr60pOE2Pd43Dpq39ihUmxWK4LTq4KJuuaWg9jE6yV6ajQ
	vSdOA11Im9V/phrD/TkigHxQ+xcGG3fqGj5S1XtIBoizikxdnhTp8W4YAhwTkon+
	v/pilv1nRo+Noy3EWSxnBUpaJudBUqMgR3vMnGosqOpgt7JVoy3A9KxLiBhBIXWl
	K7TsiesciwymtSi3xdG7I/ZjRrJyATkXXFouolQKs0qxUnQwVSMGVqXoOWseta3q
	bYDBZg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe524x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 09:14:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34d49d8dee1so5345232eec.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 02:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791450897; x=1792055697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qH/i1UCq+7xtnWvdiMUFxhvdLZWNFzfO0viM2WFgZWw=;
        b=LT8u0FRkbU8qAo2McipRDcbUS7dPIAHbVexFUnV0ZA6rjzXaDF9QCDYuviPS4pqV2j
         JHejA5vcTJfSLzKnQq9zhrT/jyw4A7u6va7wbUbBg4p+ix9g+0+ejHvvF4m5ag7SXHYZ
         uY0sh2GuPwwCyQoWqQQtk+EmcPKzHH9XZekQEQgb74Dd/xWWo36/zd9O6Y51P5Py5/x3
         m0RWqqfpPJYhPdZUpUgl3lWC3YrMgEVn0HEiVoyZKXvKCt9W04slwKZABopuo6/ke4JS
         J0OJRFY9hlmFjkzaXlA8t93UQ/9x+Z70q18QX5oi/mgLciCWRW9cPBJyYxMHKu4bvYZI
         ArcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791450897; x=1792055697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qH/i1UCq+7xtnWvdiMUFxhvdLZWNFzfO0viM2WFgZWw=;
        b=mljy0Juke+BFcMo8zX0SIz589HNxuMvfe3xMjzia83Xy8yTcGDI2BiXyZlKlKhl6gY
         cqQiyK2CJb+fLIxsotLRmVx8j28l/+tTVWErQ49gzIV5vv6iVsOLTsneItwO5zXA1iSE
         IkBV5LS5CKlA5f1Kxdw6cYf8sdRwl3MLzvfvkFmi3J9GIOH5GAwS2EqW+adbjocoRX7F
         oOKoC2KQyOyNQh7by/Q/ik+rlTDqxGur6Rb8u8Io7Sp4vqjdnyciLc5JleWzX2/NFiZs
         2px2kd+4+gRcW4yS8h36OtWme7gCycyPZyv1PSXxCzJAiYvKz5MWfo4wYk1+fZxqD8WH
         Sl+A==
X-Forwarded-Encrypted: i=1; AKwUvBwjYrcpO1w5pWndeBsGryn5UeA+LiRctokP29WF5tcu0SdNZyuQZGilm8uGJwy/N85jKJpr4yhjkQLk@vger.kernel.org
X-Gm-Message-State: AFuF++lJFF5xjKPMmGoFCwb3UrCClNDw3WB7oyY42iPz/F4fLurDy9xx
	lV0bpuQ1GMWGGwVfYHr6RdEfIdDyLJ9UsnX9DDh4SQQTv9JX9BS2lhF/Q95ZzM8LOGjPIr8Ifc+
	/0slTV/u6z1PxACsJkNrk1ccTe0zXVNWfi5jozxSM+B6Iffqoqa7sFMdWnyU/4CNd
X-Gm-Gg: AYBFou2W+9ykvwYqqbIa91HW4OmmIKOdWvFu3cme4Tmr+3pTced4k6ZWVSpk2v18gxQ
	z7Pr4SoBnpX4e8lbpgPn0xyZDDVJCWJ+u5mc6nr5HkqzKAyCApa+SMZlF3gjNE3q3mij9WjqW9x
	BXtto0V1bqQd2KKf9M/kRpzwH9olaxD8BYYfsmVTWVa88J3Cl/C1SBg1ZZ207cBKNn16pXblgvp
	QSIf3F7aI296fbZU9Ny3z6FEtedH9EdLsdilBDcMyIasYknsqa9m0w16uvdqzfR15kkEYfbt3zs
	dV2TAXipTY1GocEdt9wLaM/VZk4SVmvB9N6E/SD+HYSNeVeG+q2Vka9kdrYzAhEYlEiRKS922iF
	bWW7YmuzSKZ1ST2+UQ+X0TbOSkzAJlD08BVetkTIIuwDOHYGUAlFU1ZI3QJRfhK2Oq1NSkVJITu
	Gl2adwzddQZ2RND0kQ0UhXthdjLtCl
X-Received: by 2002:a05:7022:150e:b0:14c:1f57:3ea9 with SMTP id a92af1059eb24-1620665f626mr6023208c88.26.1791450896872;
        Thu, 08 Oct 2026 02:14:56 -0700 (PDT)
X-Received: by 2002:a05:7022:150e:b0:14c:1f57:3ea9 with SMTP id a92af1059eb24-1620665f626mr6023176c88.26.1791450896338;
        Thu, 08 Oct 2026 02:14:56 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm24456045c88.2.2026.10.08.02.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 02:14:56 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:44:26 +0530
Subject: [PATCH v6 06/11] arm64: dts: qcom: ipq5210: Add ICE support to
 SDHCI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-08-dts-v6-6-f9c4ec8664d8@oss.qualcomm.com>
References: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
In-Reply-To: <20261008-08-dts-v6-0-f9c4ec8664d8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: W_1QRgVcoY9M-hi_1uGPFXyp3EtMDVKC
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac75f11 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=oTQqOnWIMzOobJ4mAXcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX8dASFiQWYcEH
 TJwab1skODyih7M7qVElQK3NkpSFwYpjVP3gLfDBDQtE78dt9aV0Ic18tg00mOc/CC8vNHwx9D9
 +QuJHClnVyLXYJYHw3E8pQxKJIk16Ws=
X-Proofpoint-GUID: W_1QRgVcoY9M-hi_1uGPFXyp3EtMDVKC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNiBTYWx0ZWRfX+2Djg5gfWKe/
 BfezUqEZvt+bK8lVOa/y5KzJVPoRdFUT9Y1agBZJy+tbDydR1OEuhCN5pWrjxPQstfuAc8sa9ub
 Av/7pDFKMjE/wyzygucvGnhufazsvs0v0NUIHVArtIEaT7eXJVN8ONy4Sm+pKUE4ksEqYKSLWMv
 PzEE5N2Xqxfwld8ape0HJwu7xDtwc/r56geVngU0nxIDYI15Q5f7xVp1G/34ZUm687qzSnu1kd5
 hqzaOC826O3ZKzs1rm3bAlmcXFDDHU4u1SLPYzVofxqZlMva/C5aqI/Z+JenzncsTGHynqs0lUv
 80B5JZPpQsPj8uScIKyCUeFFC6bImThVGVxYpJ8w8XqlSI+7uodnkR36bu/tjV8ZF5KtcIf9q1w
 dsM+Cw0pvPWtmNYiE3E+IHU5pEqXYGwTbhz73Re7AeNSZFjor2bb1u4gprnHZTzvlLfpFVSiEgv
 zs+U+eYV0J5+0+PgJmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080036

Describe the SDHCI ICE register region and clock, and enable CQE support
for the IPQ5210 SDHCI controller.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 331589a9c1ff..bc9502328738 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -416,9 +416,11 @@ uart1: serial@1a84000 {
 		sdhc: mmc@7804000 {
 			compatible = "qcom,ipq5210-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x0 0x07804000 0x0 0x1000>,
-			      <0x0 0x07805000 0x0 0x1000>;
+			      <0x0 0x07805000 0x0 0x1000>,
+			      <0x0 0x07808000 0x0 0x2000>;
 			reg-names = "hc",
-				    "cqhci";
+				    "cqhci",
+				    "ice";
 
 			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
@@ -427,11 +429,16 @@ sdhc: mmc@7804000 {
 
 			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
 				 <&gcc GCC_SDCC1_APPS_CLK>,
-				 <&xo_board>;
+				 <&xo_board>,
+				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
 			clock-names = "iface",
 				      "core",
-				      "xo";
+				      "xo",
+				      "ice";
 			non-removable;
+			assigned-clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
+			assigned-clock-rates = <300000000>;
+			supports-cqe;
 
 			status = "disabled";
 		};

-- 
2.34.1


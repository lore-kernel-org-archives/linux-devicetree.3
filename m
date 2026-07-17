Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4984C43F0BE
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 05:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784266337; cv=none; b=LJd867RLh5Q8YAxDmOyKx5DuURI8nAohCDM4zWL8VjO+y0sblLwhUG7GkdGVb6/DgjbO8yGNeTPCT38PjmBfb5dHDKVuNzoifITK9dmpqluyUSRZ2ny3W44alu35xqOlqXTGfEmMtlKs92E1Q/QTtX8Zgcyz3DWb7M+aKtCa97Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784266337; c=relaxed/simple;
	bh=Vrq29aRX/6IcoQWJku5ttZIZMz378bhwF8V95noopMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ERLEaTULvzfFczAt1j6RmOexFsf8K0XXLfVKsOBk3WzA0zpoLGoBGmCyId7En0RTqxIixi9wBE3WV51DPM2UFjUkwGVIZYviQUzEc7zBZiDPl/WJ5l6DZWe7g9ISxeDzc8qAJ+duzwK/IjupK3THLjyuYadlvm5OwSC2hxivtzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBtOKXSy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K9h3hlH+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBtOKXSy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K9h3hlH+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33nhP1617180
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 05:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z2v8+OC56PeMGr4eGEr6Q4zuebXtUQl24KS2e3bDzx8=; b=RBtOKXSyBdwMUHLo
	9ATpPyETIAdEvhnaYBbnyCPjpDkeljd+33DETQL1ClhyZcvey204gsg2rOt0U3GB
	6giiEWLdGArdU5wYec1FCGQYN5NpGd0vtpOa2kwjmQ3OOdHejShokuYrDRPK14xO
	YQCtk/G28srie+MSZ5uyrlwfNvPk4Hkcb50LfehYKiZZZGVTepxd+mtA2WtQGSMO
	K8DcDZBSSyJ2PLuplefpFcOe0rqRhnm1/HO2rfHuu2H8I+AtdeyqQLlHQWGsoHD6
	pgLKC/l4OkezY9YldymM/EykhAEFAl+Sey5fiKdzNrlnbKJNj+Rtw2fUsei1vlu/
	PvhWTA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6j4rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 05:32:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cce02cb769so52723185ad.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 22:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784266335; x=1784871135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z2v8+OC56PeMGr4eGEr6Q4zuebXtUQl24KS2e3bDzx8=;
        b=K9h3hlH+BKBSb13DA8Tm12CO/BqOkEyh4NMrsT0wdrX8be845ypXIuc4oEOQJTYHhc
         4HbWFHA4+zzg1M0sWRQwyzJBM/6dCwZ6t8bpoj2EAmNzf8OqRCoS0iMPReYBcxonu1Sl
         OvGK0rawYndnmtd4Cns8I7MVSBmonHajSnzkrJPPCPMsvyFVK3HhWbd8VgarPdJvJF9M
         0WcjzSxaJ31jxWpTmucJpFuwPrihhHy3Gyz60IwYXD6T641cVUj7Huc9+ZvZvcCvR/rG
         Fkq5ALgjpONuhQEg4NdUEgodP3ZDF7YCqbtUE5wPDZkPPTFZVEADBu4QaajVMgkPk9FK
         C9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784266335; x=1784871135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z2v8+OC56PeMGr4eGEr6Q4zuebXtUQl24KS2e3bDzx8=;
        b=FNboIW9kd+b0T2vUtu/xmXDAFU+BE70de0GWwuUPI/9h4VO8ef1Rrq0gz8ZqWEI99L
         k62+5LgyPcg0eB7It48VRev8XuTW/SoO9CJ1a30OwCN4Gqrojh1s3DN39YuCvf1yer04
         GIM3hwT467wrKxEYY12kkgwJHb/jaCvW8jgxQpYtmEO+RzSp5bIMhu3J08k52BCC7NSy
         wdTdkm9vRLv1oHFQmNWm1711uRMF2948ZUbOvfx+D8duAUHxAPeHKLXBi+CCqf9UPlUe
         VuqE7Er65VuFzqD3Q6A14+bdyuARfrGG/+6U7ossAPV2fjHOLQRFLR17CtzfQeFEymMK
         HzHQ==
X-Forwarded-Encrypted: i=1; AHgh+RpE7jEzZsdidmCNLUpPFzLHiwPhZx7P0dkR/taJxrQxWeZCCglRKPKCmy8MDSd0LyZd3yWpVdUoqJKl@vger.kernel.org
X-Gm-Message-State: AOJu0YwMtFR/u6bMxPxu7ISXL3zoDP+xYzYFVKdZvoLbyEgNZ4BJ0hnO
	kHLr70AulfrusJ8cQKf+EixVGHZMNXhuvSzGJhP5MbVeZRJ9hRBA4CWB2tn8qVGJuGR5UwM6OB3
	VRUWD6z1btMQyoUsOiX8HJpPUWPJ00JZgitA/A0ZKp1HGlZdEvs9+L5b+5SwQSLU=
X-Gm-Gg: AfdE7cm9qPuIRtbHDFfDj1n3FRXBOSvxe4soEyD08XqaiGvlLqB3dl/VV7nzBq0xA++
	QrAy6pCiy1jJGK4v0iqcNXsaF7u0YGw9h2FEdFTf3oyEux2AsrIFFFYlcxxAD6Z1hVW5Ls7a+a4
	tnneDsOzxuAUdnpGyVKOtqPlh5fPXoGYFO7k5heW9SCfslSQwcUWEBSNQylKO2z6cQIlqqeWhVn
	a0lOC3HY2FbyvwXmoUiTfObrzMLh1kLU9mjDZrgRx4iglJhrefBb+hcElhKeWV/awK4N5sPZxxm
	1Rk9Z+O0/+QDj393I8HB/kKLJX89jycnyFPBWEJGBcsdd3gl8s7QlP5zFuCXKAAwPuZUyYrRisZ
	JNERypQIShPSBGc53mZtO6r5tGl8Fhg==
X-Received: by 2002:a17:903:3805:b0:2c6:6424:c79f with SMTP id d9443c01a7336-2cf34850d13mr12768115ad.8.1784266334698;
        Thu, 16 Jul 2026 22:32:14 -0700 (PDT)
X-Received: by 2002:a17:903:3805:b0:2c6:6424:c79f with SMTP id d9443c01a7336-2cf34850d13mr12767755ad.8.1784266334125;
        Thu, 16 Jul 2026 22:32:14 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ef6asm4189885ad.9.2026.07.16.22.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 22:32:13 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:02:00 +0530
Subject: [PATCH 2/3] arm64: dts: qcom: qrb2210: fix PM4125 regulator supply
 parent mappings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-pm2250-fix-supply-parent-v1-2-a6213a42a3b5@oss.qualcomm.com>
References: <20260717-pm2250-fix-supply-parent-v1-0-a6213a42a3b5@oss.qualcomm.com>
In-Reply-To: <20260717-pm2250-fix-supply-parent-v1-0-a6213a42a3b5@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784266321; l=2902;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=Vrq29aRX/6IcoQWJku5ttZIZMz378bhwF8V95noopMU=;
 b=FANAdxF9acmB7V21krtw99nFcjpubMymbB0mDYr/MWzn6IzMsvePsIwBwlrydwFLuTXtqmkZ9
 v/K5wL1cFlEAPLZ1YbS3q7CZ+nZLcF9Z6Ly2aakiQamqwdqpLFw8JtT
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA1MSBTYWx0ZWRfX6S2tESY+i0AF
 an02iFs2b8AA9IbP2mj5/WpEjAXl49oiR7ctLxTgfpsdEYcvHGBmHpUaV9bOFnMlRUzLt/I6lFw
 9xkoLH6IGTQq5Fs0pVmwPFirNVahOYOeghV1JcMCepjUmt2PfOdQaK8xfJdX/HwgLv0VPl2VGr0
 LhLyDWwSbQ3lIVzzFr2AapNBB4nJpWVkqnxl0qON7lLuUrcd2dUUZRcRAI3Y+4qzXY+agSo5Zzz
 PILKDMtT/ZWToYt8jfJym0Pri6Pzeh/SrQN49A9cqODh0uVjn9/anDd3mlWlXUZnS8xYNKmIDd6
 Ne4w81i6i1BkHmgNfDOJDJRBnE2tvysCZJgNx/WZnC8T/L9KgOPhMZnPa2CBQ2gGjnDI/qNwyUu
 gIhHTFa3tSatQLICRwuammwq/vOPlMtYJ9HOvSGx2XJc2gUPMIXnMog84rAF645NiXGdnf2Ec+H
 lj8v1Zjt4V3tBNUvdYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA1MSBTYWx0ZWRfX5wrGa016XjHk
 33j4rdDRlo0ddsmRCONqKu4ff2fXMYKtr+RNVzp/RQlSWkY6D7WXFVm7kAr0vov2QtHJs8HIKVm
 lRkv8gmnJ5Vr+lKMCF2IEZ1slW1aA3E=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59be5f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=srU4aMJgQ0IWwv6as9EA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: OhQkkHczsflBabS02solAf5GVRrXMr7p
X-Proofpoint-ORIG-GUID: OhQkkHczsflBabS02solAf5GVRrXMr7p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170051

The qrb2210-arduino-imola and qrb2210-rb1 DTS files used coarsely
grouped supply parent names that do not reflect the actual physical
pin connections on the PM4125 PMIC. Since supply rail connections
to PMIC pins are fixed in hardware, these grouped names were
inaccurate descriptions of the hardware topology.

Replace them with the correct per-group supply properties matching
the actual PM4125 pin connections, and align with the companion
driver change that sets supply names to NULL in the qcom_smd-regulator
descriptor so that the correct supply topology is captured in DT.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 13 ++++++++++---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 13 ++++++++++---
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index c472e13fceca..90e6eb284a66 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -262,9 +262,16 @@ regulators {
 		compatible = "qcom,rpm-pm2250-regulators";
 		vdd_s3-supply = <&vph_pwr>;
 		vdd_s4-supply = <&vph_pwr>;
-		vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12-supply = <&pm4125_s3>;
-		vdd_l4_l17_l18_l19_l20_l21_l22-supply = <&vph_pwr>;
-		vdd_l13_l14_l15_l16-supply = <&pm4125_s4>;
+		vdd_l1-supply =  <&pm4125_s3>;
+		vdd_l2_l3-supply =  <&pm4125_s3>;
+		vdd_l5_l6_l7_l11_l12-supply =  <&pm4125_s3>;
+		vdd_l8_l9-supply =  <&pm4125_s3>;
+		vdd_l10-supply =  <&pm4125_s3>;
+		vdd_l13_l14-supply =  <&pm4125_s4>;
+		vdd_l15_l16-supply =  <&pm4125_s4>;
+		vdd_l17_l22-supply = <&vph_pwr>;
+		vdd_l18_l19-supply = <&vph_pwr>;
+		vdd_l4_l20_l21-supply = <&vph_pwr>;
 
 		pm4125_s3: s3 {
 			/* 0.4V-1.6625V -> 1.3V (Power tree requirements) */
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index bf6fb12ad990..3432022274d8 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -465,9 +465,16 @@ regulators {
 		compatible = "qcom,rpm-pm2250-regulators";
 		vdd_s3-supply = <&vph_pwr>;
 		vdd_s4-supply = <&vph_pwr>;
-		vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12-supply = <&pm4125_s3>;
-		vdd_l4_l17_l18_l19_l20_l21_l22-supply = <&vph_pwr>;
-		vdd_l13_l14_l15_l16-supply = <&pm4125_s4>;
+		vdd_l1-supply =  <&pm4125_s3>;
+		vdd_l2_l3-supply =  <&pm4125_s3>;
+		vdd_l5_l6_l7_l11_l12-supply =  <&pm4125_s3>;
+		vdd_l8_l9-supply =  <&pm4125_s3>;
+		vdd_l10-supply =  <&pm4125_s3>;
+		vdd_l13_l14-supply =  <&pm4125_s4>;
+		vdd_l15_l16-supply =  <&pm4125_s4>;
+		vdd_l17_l22-supply = <&vph_pwr>;
+		vdd_l18_l19-supply = <&vph_pwr>;
+		vdd_l4_l20_l21-supply = <&vph_pwr>;
 
 		/*
 		 * S1 - VDD_APC

-- 
2.34.1


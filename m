Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD5E37C926
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154016; cv=none; b=CfiTzC8zBYj9bhkQ8gYJzzRACU+8Dt0+ABhDXDuSUOf6koaPR935N/z3rdlr5c8XTSch5TNdSG2DwNr6DMu1JehCM9M+uWGsYUECtexDDb4snpAgjqZr/uDuotVu29Pd5b7puLhlboOsL16IMqQSpyJUk2bMwO6oQuixaLrciYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154016; c=relaxed/simple;
	bh=FnMF1gdIBBqzcGyw/Qftg/BoiY5xILkioEGvlCuaMr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qOWTlWLh0kwH08YdcGcdUQmIhjCtvZqNVbFp5BXfLsVAwCk09bnX0jQNE5rZ89/wVy2MdYaK9Kqia7mYK/+FqpTjn4+TF2RBTvcIOdOfx2CXVrRYEULvWJXc9KiejahnwLFZyw8q27R9OPY5PHGxO4+4hV6wCXCblcLUFbYBktk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pt1dX46d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvVwDK1C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pt1dX46d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvVwDK1C"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0Nrm03184148
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/YZ0aGKsLxrgGER/RxB6aF4pHWuCa0SmOkhq9nYOjL0=; b=pt1dX46dq1QknpDu
	3okQUhqNiFXZD+9gAFpJSAgpGEU/v42A47FTQP1in41m+hj7c1XGLXEN5gry/z7p
	4AxSEplF14EpbrMGpkaZq+w3vyxdRlisSsclUGwSzjucH0NWmRlrR26GHJe3mzwt
	9ZGUq77si6hfgPn58xPVZA/ZzW22UAWo2I/aor858tY1A4QCNPBO2mTR6QmUNj73
	a4RrsrDmuPiVyplwYoJvvap8dtbnzSPB7xAXj2JsG0ftqk4nPND/vaLbfmU28eVW
	otr0fjOkChip7RYDihTDCUZJuSFIttt5XUxq3T5s5Xp/tlzyjv/X9wV/FEkSF02c
	SEfyNw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u1nmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf11699875so6511855ad.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154003; x=1781758803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/YZ0aGKsLxrgGER/RxB6aF4pHWuCa0SmOkhq9nYOjL0=;
        b=KvVwDK1CgZyrEVapaZ8yMOaIDzlItPMm/b6DdOeKFHBC9Xq8WZTVIqhQqoU8wEn4ct
         mN3j7825KqTV9Vijl1oSzqKMyK+r3EZRW6864C0KFcNbNuIfvDFtykHlxfMxmyo6JfVp
         DJrihQfbr9zpPWG4jla5oIHIcRLRBnRPE0sZdtt/+LEA0HLoG71Fmv0QXFpiteGxUSeD
         7AWd47TIifggRsNgeFIyn3qB7ndw84Ji5bA+AD9FHkBRFB0EV9YYPIMW6AZH7U92t6Co
         7Qs74lAHNgQndfJinAAv4U8MOTMM5QEP5NU8GoVLA3qabKyTw2i/Z6pv+pMyMN4VkBRj
         Jn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154003; x=1781758803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/YZ0aGKsLxrgGER/RxB6aF4pHWuCa0SmOkhq9nYOjL0=;
        b=F1AX8/7tHzC1lhBZdJxs6I+kcgasToG+MSRo7PKPll6VoX5X9og9KUvUmedNTT9c72
         OyFJANLptmiYR7aC+wSbLmLfavRKlosm5dzJETagnebhTZep4kkRDX+nLcLfXj45pi2+
         kv8BUcSn3Xp4iO/u5B7QW3Rsec2bXHG8LBrFTLhAmBBvbUemTP3GXCqEl/D1sgud2TEY
         /KJBTS0rYEzDeHX4cDAczSjwBPrbb/ILFWmBd40Zl09/a0qWOglkxYt5zAowuQAcOJeS
         jsyG/xt42KQ70RNwILfdCHbR8t49HqdXBJLr54ZnnMRrTCLysffbAHJnDkRd+rPShDL5
         Ya+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+HFbLELzyloM+OH3cQwy3qZ3g6EuuJvTVREtviy6JwauMgKEfCS9KPIVIhvXe6gwJWjE1vaWB3H6Cg@vger.kernel.org
X-Gm-Message-State: AOJu0YxI+N3YkUjXfvg9SnYZigkovGML8SbZmly1SvMRc0wVdSR5Mjg8
	qZknV1Yxi5t2aut+W33aUKEWL2a0G6JNLqFvcAuc6HB4plap5PVleovv41p4zGFCxEK/ZnZY/cF
	9vARc0I3QE339HCagSUJgLr5XT7yLzrIVC+4WRdp4MdQBAFXq8fqQklI1j+6Mj58p
X-Gm-Gg: Acq92OEDdYGqkqWkdG6g1OCLbThy5OFVUGH1CeeaqizLrhuQFdgpcFDUM8khwY06orE
	pzhM+gfT0t/KjAtrrTHSJfHvpaN4U0gon2jOJA84T26moT4XgkSfcoXoVK2YmgEjNeJwrQP013H
	aTkZFe6XMqV2coUBx6CK99zMnLgXEfybqKuewQ6FDKstUc6hJJ791evC/FCDSCyuJkcfksdTSg4
	MarNMgXZhgDhx5BHqXqTJJQdkJhE1pyLz6Y83b2oldVjVOagiIk+1ab/dgFk4Vmo4mH8ZxkI6aU
	V/Nj/0dl+zBRIHWf6qZVjdpqLA1xjhbcesFgl98Wwqo+sB0ycaPovypeSsnZqUsjrihGYYEtAVS
	dN5CI8ciJ5KvAc4akhq0ldTUPXmstMMcXsoQ6dcLpwjCBXm399+IY0DYDEcWiAAAiPt8=
X-Received: by 2002:a17:902:e752:b0:2bf:1aa9:6c8a with SMTP id d9443c01a7336-2c2efc57fb0mr9281365ad.12.1781154003338;
        Wed, 10 Jun 2026 22:00:03 -0700 (PDT)
X-Received: by 2002:a17:902:e752:b0:2bf:1aa9:6c8a with SMTP id d9443c01a7336-2c2efc57fb0mr9280975ad.12.1781154002417;
        Wed, 10 Jun 2026 22:00:02 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:02 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:53 +0530
Subject: [PATCH v2 17/37] arm64: dts: qcom: kodiak: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-17-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=3509;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=FnMF1gdIBBqzcGyw/Qftg/BoiY5xILkioEGvlCuaMr4=;
 b=15wuX8JRz8UD0USokUpXpyMfhlRDaBFk2uYD0To+uVmrw8iRK+RLcD031zvTMpzI1IB96mIPc
 6uqTDq5ivHqAeiQjwdduD6LbA2uj/waYvvuw/SpR4tkm2mccKnlaRaI
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: YTJEjzgmz45msoAMKDAztAAeh26sBzfq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX3ozPS6AKZhAq
 smUv/zUmXW0KnSfgVGESnAK/xpSJgo1t1LW2vJOmJ2Iiru+hQBMIjqGMkIMdLt29M8/XJdlPJHW
 AJPbcsM7Sa3Nw3rFw/s7Jr39Llxs9n4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXz1OjxW7coO3Y
 74DzJ9O8vAiqk6TVr+SyTI+8UgkFcfiZOX5sjVzqRC420cZSRc74xnaLKowBxD22+QheTwPaeVW
 f87HmanM5z3wlbRoHNgv419YHAiW8fhow5obNVMBViZjxyWMA8XVyD0rH/BS9cfHoWo4A+0oy6b
 Sb6ZhwYR1pCIte2SsTPjBoHel/a7SsF4USpAJI8mJBwByQyO9X38wP/OCCcdr+eLrTX4qQWRzts
 DetSrEEcNC5jzBndtbn3V0G4jYwMpbYJ3xKlfwIPvbDLkBJZPOfJ8TgNxJ/Y4e2yoyvL78p8ucd
 Ha/k0DuVRTTr3AMiam4RvAzQwkJp95TC7MbPV5PtMXiOVvyWuohgDQ6hDa/CzKpI9CqUHJW3M7I
 9BvksTeAc3jxVs9Qa+5ge2Zbey8Hct3DAUEFNdV9Gkt9achjEC5FqFljwa+Rt5BPQotKkOxwrC+
 C1VYKnnawC69eRstZPA==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a40d4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=vzsU3dzRAwCoIzd_qrsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: YTJEjzgmz45msoAMKDAztAAeh26sBzfq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         | 2 +-
 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts         | 4 ++--
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts | 4 ++--
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index bf18c4852081..b1ad1d7c346a 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -546,7 +546,7 @@ &mdss_dp_out {
 
 &pcie0 {
 	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_reset_n>, <&pcie0_wake_n>, <&pcie0_clkreq_n>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index bb5a42b038f1..3a9fbef89aff 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -523,7 +523,7 @@ &lpass_va_macro {
 
 &pcie0 {
 	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_clkreq_n>, <&pcie0_reset_n>, <&pcie0_wake_n>;
 	pinctrl-names = "default";
@@ -540,7 +540,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_clkreq_n>, <&pcie1_reset_n>, <&pcie1_wake_n>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index a5ad796cb65d..e0275430ef82 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -685,7 +685,7 @@ &mdss_dsi_phy {
 
 &pcie0 {
 	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_clkreq_n>,
 		    <&pcie0_reset_n>,
@@ -704,7 +704,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_clkreq_n>,
 		    <&pcie1_reset_n>,
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index f47efca42d48..681a9ff5ef77 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -813,7 +813,7 @@ &mdss_dsi_phy {
 
 &pcie0 {
 	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_clkreq_n>,
 		    <&pcie0_reset_n>,

-- 
2.34.1


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5844A381B1C
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784376393; cv=none; b=RlzN9w+ddOIlK1IUORsU98pBWZREheaBHI8LtzRWA4Aq3HUHa55I2qTyXbI2XAWgvuUxeIma3XOnwH2X81dJ8Nltq+QQifY6PzFBX34gXnUVaJNQ+jK5anZHO8ETT7/8+tNkAoM+L+Y5fPa7l2l3JxdK5T3QLDuFt/UPwmz2ib0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784376393; c=relaxed/simple;
	bh=TzedKeXLAra0qSDuAmNNbQ8B9mFMFD7tPwtLylk0Zr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bBM3egl5zpT+xavu7tOwkjROcsPYvlnhTEaknJcHvn33lUzTLsrAbi+tmENgIP0sVDHLg+Jw2IyWumwPeDvbY9L0aJxScO1i8yzbe2wzrdRSCm5UpNeCTThOrtkCxh5hRI0niJaLkkfvKNWpLBVcGnDZXwqH99p4X+YIrj5DIV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMo2/q2k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JcMfzMNZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMo2/q2k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JcMfzMNZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAIfxh477271
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0YOdxBIZwoWE6E4CSFecEE4QoWdP1KZFLggfwv4koXU=; b=aMo2/q2k0gcq9olC
	+RqAgM7mIzd3E5nWEnLTUmzw4wW+o0wOs2o4j3Gw13PEcpM6ipwmfoa2vPShixwr
	MpnAOjsDZ36umqjDYkUd6bcfPDIupIbpOo29keMQv298TpylBQDSyXO5oZCYNlRl
	wIzqUrbH+MFv9USVo1+jQXDq3QRkGwWcStYH4TO2lpGIM7Q/jdRXOFyZa1QcNWu7
	hZVpDpyAFMxGpsGatR8jhFjN68dCLr/jZ9WXp/eo09Ggm9y4XQJWvBTEmSB3Hcpl
	+47rOHYkwrAeg/LMzc/L4Vy5nC/pz/ucSBnFArluy37wyii0rhHPKIPNKE4lnxAg
	7d5Www==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bngq9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 12:06:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso1238709a91.2
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 05:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784376388; x=1784981188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0YOdxBIZwoWE6E4CSFecEE4QoWdP1KZFLggfwv4koXU=;
        b=JcMfzMNZi3CkHv6IAHKiD5u21GrV10F50c0E/qQUXG2XNbaU3X0tZQqMrZYO9VtPPe
         nRNXty38WVEz9GWUnX0PsQyJPhHPvNlBoprfoyjPEPBfzSAoZnLy0AjB1hcu/KcZWjem
         Ojwkt8j1eq0+gVX5Xanf1FQeJkKXidssoXjxaXiSrXrD3YjZEkNysCcr3Rv3XbJuSQtA
         z9iLwvIMVwZjWJm/z3JezKV8Vr7CA4wH+xpkOr/cNa4ssQfGun5ERY//qg6kIzckpBis
         p5eSXXDoBocQn0Rlt5GfAapPiERSkzi2Q/+Tb0IJMuBeOX28CmbiihD/dA+z+A657pGh
         OlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784376388; x=1784981188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0YOdxBIZwoWE6E4CSFecEE4QoWdP1KZFLggfwv4koXU=;
        b=ilKhTjWawaDvxhLMDQiSdP8wBGrUFKgVonn3yw+dI5pmB6M3kccjQgwaiajnpDK09z
         DhbtFDu2YXYhBiC60Np+PZI/GcURIu3tHdc7/E82xipe9hcjCElH3ZRXRsno2MD5KG7J
         /rejAyBuKLC9Dw2nIRHImeHyJmsE9lI5ACbu6fZ/kQ3tj4AX1GKXCLplRCe6klQ+6QVb
         i/DMQM6Tih6jl+BRC+6OTVkH/6Kr6akG2+7nFzdGocbIYvPsiVBgIB8IeAMWegtH0R02
         EtcHHRrvGk+zBjxUJ5aD/LFQ1P0KSJvLU9KyoBCWhNK4x1Spj6IsWIivilj3jFK4/PNC
         tQ4A==
X-Forwarded-Encrypted: i=1; AHgh+Rq5dWzDUB6TFZqxj3EiGIaJ87/pSCf/cBcnvRBiKc3Gxz2BNkVgMggI4D+K5QDzMEwEMPkcEN5OiGFV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5wygDnKN3MpzBdqnVuHT6metbrpMv2E7QhMejnKu8Moqj8ts7
	UCdG6xzZxzaOCqiFK11tACGKXOF/y3QuHtdrFDrvKFB3FoK+0s6SR+RpdkJzk1jhwN/QaPD+czt
	Mp5R49j9slwWa7rmrt/b+nzvRFRopYPhyOAcE3I6XbHdWRUIZ1Wg6y8/tJt8WEhL2XmJO+eXJ5W
	Y=
X-Gm-Gg: AfdE7cny/uHg23bHEy991IH9BJMJwJoFoeXGFJ11I3G9qnMC4LPHaqvQGw4SgPYufVj
	cJHFqg0yVIFavNtjmhPF97+vy7dQ6gJxF4kiZQVUlY+sAOtDGI/IdIE9+ArmtQyfDLvbqFkSW7q
	di0ba5BUnQxgtiGtEmac1H2D+k9LnN1TKIoV5X2HmUcGi43d4wgyo2rnPnq1nmkwE8/a0zNjsR8
	Zemq1CN2PYp3VkAUmzHO92CGcG/VJp/yPYfIrCzp207OMJTYVqj2xa8WVh1kustoxFIK/8B5cFJ
	DUb9njda/9mvJUbai4IKBM1cl9HaMHcKNR21Mai8ndAhTcdFpV4hnnpyX+HwSzj6zwyUQOl2SnR
	cK7h4m4hGfTU7qk3TFQc3Mx+H+Wg1WbM8V05J1ElFPq7jvK4J/VTR5FTjVCDipU/Y
X-Received: by 2002:a17:90b:2496:b0:38e:6497:ca45 with SMTP id 98e67ed59e1d1-38e6497d57cmr1034249a91.39.1784376387914;
        Sat, 18 Jul 2026 05:06:27 -0700 (PDT)
X-Received: by 2002:a17:90b:2496:b0:38e:6497:ca45 with SMTP id 98e67ed59e1d1-38e6497d57cmr1034218a91.39.1784376387314;
        Sat, 18 Jul 2026 05:06:27 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429cf22b3sm17666314eec.0.2026.07.18.05.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:06:26 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 05:06:22 -0700
Subject: [PATCH 2/5] arm64: dts: qcom: Add Kalambo SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-b4-kalambo-crd-v1-2-a1069b5a2757@oss.qualcomm.com>
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
In-Reply-To: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784376384; l=1899;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=TzedKeXLAra0qSDuAmNNbQ8B9mFMFD7tPwtLylk0Zr8=;
 b=oDb6ubnUbGZfNlz77xf3rrOOEG3fNj+RNlaP7aXCLvqvG4Kkzv6VLVg0LFlgHjW4WoXIWtDJJ
 9TpRInqWyaRDFFCPboSM2rNBsboiPDE9wd18xN8gV69uxXxW1FoNeSu
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfX3ludDso3sVPx
 1IDPWu6in9Y/WAP+KaqaxPq/Wng+EOXmIQ9qnna5g1rC18qpA2UbhILJIrWngDts7pfnIumoV0p
 BOo/IIRShRN2Wu8JLHhbntcIKbPy6B+jqi4UGG6Ew9icERD4IoAdEjLoC/oF+esOrolc51XVHhp
 5nfEJaLSVbhWkopV1lO4a4Yn4lqjEd8lmNlEG7UCuGAYNx49JXu8eAMG4uL6x7S/ZcuMdMeKfNn
 3mut2G6oVGr4N59wHoqxg8fVnBDe6X3uryeWxHT4EUzoCJ9d8zrfu0w4Doe7X5idjEnZr4qhJII
 Vw9NhvRfBexQCHF2yDwxtxI4htLFRTz8W4IqDy3d5CUeUpCJtQSkvRCbO/JY27JFjyEVh5HVkRL
 H2/5BUafi46xn4P/6JZDcvwW7XsQF4TwF9SdzydOigdRbEjyxf5xz6tBVNlSuY3JGdGLV4Q7qj9
 UBn4+kcqpfTsegsXiZg==
X-Proofpoint-ORIG-GUID: tongzNwdetfYJvqaDEyxfrsHg_WB2u2d
X-Proofpoint-GUID: tongzNwdetfYJvqaDEyxfrsHg_WB2u2d
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfX0e2o0zuCuYE2
 NxpRPxyo3O4n33rXO9ltStirQmS2fi00X1ClmNGP4uUalCgKW9F2+oARvCvMfVX4Ex3lOFRtx9+
 l+/lsNePJ+7/Ou5SI1eIQSGe8Gy41SE=
X-Authority-Analysis: v=2.4 cv=deOwG3Xe c=1 sm=1 tr=0 ts=6a5b6c44 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CupqGq-JItAhHe7bgGQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180122

Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
with CPU cluster 0 removed, leaving it with just cluster 1. As a result,
the PDP mailbox and SCP low-priority register windows are updated to
match the reduced CPU complex. Everything else should work as-is.

Add a label to the Glymur cluster0 cpu-map node to allow its removal on
derived SoCs.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/kalambo.dtsi | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 55d91c696a3a..f2feef362be5 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -275,7 +275,7 @@ cpu17: cpu@20500 {
 		};
 
 		cpu-map {
-			cluster0 {
+			cpu_map_cluster0: cluster0 {
 				core0 {
 					cpu = <&cpu0>;
 				};
diff --git a/arch/arm64/boot/dts/qcom/kalambo.dtsi b/arch/arm64/boot/dts/qcom/kalambo.dtsi
new file mode 100644
index 000000000000..a56ff68b57b4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "mahua.dtsi"
+
+/delete-node/ &cluster0_pd;
+/delete-node/ &cpu_map_cluster0;
+/delete-node/ &cpu0;
+/delete-node/ &cpu1;
+/delete-node/ &cpu2;
+/delete-node/ &cpu3;
+/delete-node/ &cpu4;
+/delete-node/ &cpu5;
+/delete-node/ &cpu_pd0;
+/delete-node/ &cpu_pd1;
+/delete-node/ &cpu_pd2;
+/delete-node/ &cpu_pd3;
+/delete-node/ &cpu_pd4;
+/delete-node/ &cpu_pd5;
+
+&pdp0_mbox {
+	reg = <0 0x17610000 0 0x8000>, <0 0x1a980000 0 0x8000>;
+};
+
+&cpu_scp_lpri1 {
+	reg = <0x180 0x60>;
+};

-- 
2.34.1


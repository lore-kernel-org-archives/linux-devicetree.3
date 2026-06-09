Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8BF3EBF35
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 08:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992049; cv=none; b=eqQEnCoPaD5BzionB/oTAR6SSNJ09FBNkrVKJK/Aszb4ux4pYaD9amABxnhhLBEkw1XrKmhR21n2yJ3qaxO5e1uqsu2s9T0z5aU9NcOPUr/COo9FaXHB8U/Bgl6Nnwv1KwXXdmjZ9u5jdBSKK0kNc559WE7qu0bfsEPNkH2zlwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992049; c=relaxed/simple;
	bh=PZ1XNXCW7b9cydEjIO2vFBBFLv79PQzEbNvAVpI5+nU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EGYsjG/HMJVkD5A8QxC4YfMlbzy8J+9rL1U3qZLwpBvBcS4uLqrh/Nbtq4TRN4rJ061Kj9n853uBzs6/amKsOVuMSxZOgCZs4QROjQ+qMf6r5ZXhvSi2X3dtvAqd6CcaXDt8neER3r1uwmjuTlRwR+XFRrDBRvmcIT9AErRucaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iVVnk9or; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQbhrXFn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iVVnk9or";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQbhrXFn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rhmk2034898
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 08:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+8CaWce5TrqZ+S0f4vMpdI7oxRpV1Eg4sjuMXi8VkGg=; b=iVVnk9ordRiVEJdi
	TkXH9pcHH2bFdcCpOiDmbwhmHPRtKc38AVRIFvKFOwX3QLj9sKxLAI+MchABGjif
	/sbrGBgfp+YNhpFuyP0Yj0lr1npFDuiqImSH+VUQ8p8z+INAN91YVjwHe61WMmlm
	XqYpCegs/OoC7CtkRtUKkZ0H7rkz5cLqf9wy5cfHGwLbJfZ3i0x8Nqqn+JmVLSD4
	h21P1V9vPxqFR7B76S446uN5YV8QSBX97uDQNlCqRQYFiTVWw1GurqZDr2RiQzYH
	pPIdTikfIziwi+9MYpYcXgIx/osAinz7iVaJpRul6qrKS9UG7Jvml1vEHITGQZnK
	XXrEDg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeear4e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:00:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5178fc89b1bso66898951cf.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 01:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780992046; x=1781596846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8CaWce5TrqZ+S0f4vMpdI7oxRpV1Eg4sjuMXi8VkGg=;
        b=DQbhrXFnGKcfzLIkTa8S3GV88iZYY5GTnsE33eAd32wghziM2ENXC08EWWoKVqc42z
         454f+LG+Nu08lruw3XgV9A0zGyJHCONhvfN4PZhxrHPQ3GxIYeEse+MoUkKzZzr16zGH
         ylmltW8GR7kX2qonSNWyL/0LM3+Ub2WA52KAl/MoL0huTXNA5bwrOWmCnxrC+jdFYRfW
         7HIsNY3Cua7Pyw/T73W7Ou4snf34phy55AMM82BswqHgZMX+IdscVpKKasH/KhguUJu7
         gAGYn9rT9T8tl9DxiBW1BLwljJzvmYyEHefTDOhktlI+2tz4bFUZ3SlCXwt/+Kp09yK6
         8Z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780992046; x=1781596846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+8CaWce5TrqZ+S0f4vMpdI7oxRpV1Eg4sjuMXi8VkGg=;
        b=JrOGsifUmcUchszLLRYl7mkIBE37dK+g3QxoiNPjEoRqemaPs5BTlY5eyPgQ9aN1F2
         ezHqm9fpQHrYtuEp6JF3ING0iBZn6omE7ZjcN8Qh9E5RMFMoAeI6rC9aO+NresnP0I8G
         K8f/RYT/eFydNwM2HsDAyXXBwii9+IZAtaUeh0+7SQk/OIEiKz/u3fnmX6NwHDs4hXft
         x4zbKpbd9r5L3TY6Yd103lqJDjhA6RTM8rt1ovRdeV6Uq6GKM8wcLc/8F4uMfe+Wr2ZH
         +5TYjuRz302hQM1zqeUWq+qz6KwwecYMcaXggYBFm2DzNhTxU2SccYW3eEyIIBVla9Yi
         Wk7w==
X-Forwarded-Encrypted: i=1; AFNElJ/TD+BLpoeNvK+xpYByNnuG3IXcKh3OVStmKoVUp0EFR8X4LvCLch2U1QIBM8yRtaMD8URqm+PSyzDK@vger.kernel.org
X-Gm-Message-State: AOJu0YwunLVtNWs1uaapNoT6jObBlk1DTnaSIEB80fQrVaqTKZImcUSL
	98Ch501X5FV+OkM+gBI+W8/NiRNV8RUilRwyEn2PG+reKapG3LFIebImYnCHCBTcGGy9rxMvjfo
	++YIrkrVSHI46TL7MJR+FU7oZ3csUNDOT+Kz0d1q8umW/K33Z4wvh3VUI+nQHIr7G
X-Gm-Gg: Acq92OHSIsHm+qALnPcQlLcK0oOdxhakgUXTVvyVRX3r2eCbkjhf33/Ou410oVyLmKi
	TGWLHnHBrYL2zdVGC1Pnsav/NDfYG6a1lAXD8bXNhR8C+lTwTor8vuPlFRnE8s3k7twxWsefINN
	VUroh7a4koMpz5+J6v2fR5DpZ5ZVs2Sr6TD0iU/tc0S1H3upjy9Enh3RqyeoYfoAvD+N1+pBwX/
	ZbwqoLYHv1lQuNVWwUnbE6C6meWwRPlqFoeJtI4IB1qSm2uhmgf3fB6vJlPyMo5qNCa9jZO2V2w
	9b8kARbYzK5V7PYosSmdGaxOFDcQZfLV5ZB0+27K2969beUqIHs8tGSZzksCipBJ4Vhy7a6KmWX
	m44C7KCrYBljEugx5nNMK+GgfiQ2ZiHvjTne8
X-Received: by 2002:ac8:610f:0:b0:517:707b:14f1 with SMTP id d75a77b69052e-51795c09df1mr268755411cf.46.1780992045796;
        Tue, 09 Jun 2026 01:00:45 -0700 (PDT)
X-Received: by 2002:ac8:610f:0:b0:517:707b:14f1 with SMTP id d75a77b69052e-51795c09df1mr268754471cf.46.1780992045226;
        Tue, 09 Jun 2026 01:00:45 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35fb24sm63605930f8f.34.2026.06.09.01.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:00:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 11:00:19 +0300
Subject: [PATCH v3 3/3] arm64: dts: qcom: Add Eliza CQS EVK board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-eliza-dts-qcs-evk-v3-3-b4e9b033a6dc@oss.qualcomm.com>
References: <20260609-eliza-dts-qcs-evk-v3-0-b4e9b033a6dc@oss.qualcomm.com>
In-Reply-To: <20260609-eliza-dts-qcs-evk-v3-0-b4e9b033a6dc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2559;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=PZ1XNXCW7b9cydEjIO2vFBBFLv79PQzEbNvAVpI5+nU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqJ8gklr8OARUi9R8y8321shMsV/7g80fXYHSNU
 FTK8NnNqEqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaifIJAAKCRAbX0TJAJUV
 Vq+qD/42XZ3BERArZHooRt8+ArPuKu1NF4ncj+xIkUeJ7dYhHZ4jCNmROqZNKeYkSM3dPEvPJRG
 ePA4AfrNJqMJCo7QiMo0WD3QSGMkowkyDZej6Nm/MmcoB+ng7KnSTIFkHFd41l//HfZ5Vg/rNT2
 /0snEi42UYYPFoMYEPc9SEYX6vPGilI00AjuCl0ksnEIXs9e6uuDU/tHlNK/v+CGFRWNeSFZInb
 3q+eIVhh1APoeS5NdNbXw1sK404KzdkK+19gGjoHJ12JCsgrpcd5pG2NXq9jIqGKl1dT8bNVmNG
 5U9399gWVWhATBDtg1naCObSo8xoNZZoRMpZyYFUttwRyNS8xbit47p7/5E3DSlUC9NY1Gn94by
 aY+lgZ9Cbn0njqkzN9+4noneZ65oZMimyfBV8vHSkUed9T4YEUln4axe8oPRK4rY2csJvDjDkk7
 pQrUDJKVmH1q2zAEqhLQDmS7hYNyEF0KDZd8ihD6U/Nccd8KoTPNc3/SNbKEx/EKnAJHcmI2w0Z
 WN2nlEpFDaIvSDUdM0XXzxyaY60YCNbBKPbYaJXKYDTullmUvsqM2M5rudeBanwnLfUxrtzV1Ha
 lZ3ShhC+lW2qN3tPkQbxu6sTe9lTuHv0jTZHr0xzej+GbOS4RhgHnyJ6UKSfRl/+YVK7xhdBf9v
 WCSthHKm5X1A9KA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: csny29IbKsSFHpC1_x3PtOYCZKMLYyfR
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a27c82e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nfd1YeTbQLvsyS6wM0MA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NSBTYWx0ZWRfX/JRZvuVTm0vZ
 qripte63GtpfC6RZ8Hezw92n//DtHOiCqlZ7btHpQOFJOLhys9GkMtWlTmJURgqRPk930mZ7zLr
 fUTfcCZDaLUsbcYLyUvlmH5VMQldi7PRt7AU58NAIbkGNAcD1lb9iAGACf99LQATBDdBmtSgheL
 cz9DlV/msc1A3qo1b5U7JL/pS+4rrAPKWEEbn3oikhXKcM0k7IUM+q0aFyKAVx2pgDtjZsfkt3Q
 oE/BOsRioiVfmTpNtFvK2vUKelwP+z8LWlABx0FmnukaZfBobCm/7J7JKVgxlfvCCsWyI9okSHk
 j9b4XMbX5JnyFrrfLfJYc7nkXLBtoASEMFH34xXA78qgeUEobEteb7F6ynpVi4CDRHmcf/AhCIt
 q04Kt5CKIBiZF8j3NM5yE9FHx2OJsbMLbXmS8qKz6l3VTX0nqyaITwtS9xs1wMNTDS6IFUTnevC
 R4ALNVaLDvHVFvuN2yw==
X-Proofpoint-GUID: csny29IbKsSFHpC1_x3PtOYCZKMLYyfR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090075

The Eliza CQS EVK board combines the CQ7790S-based (Eliza) SoM with the
common Eliza EVK base board, which provides connectors for different
peripherals.

Add a common Eliza EVK dtsi for the base board bits that can be reused
alongside other Eliza SoM variants. Then, add the final Eliza CQS EVK dts,
including the CQS SoM and common EVK dtsi.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile          |  1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi    | 20 ++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f33c4e2f09c..001e18cc4bc3 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
new file mode 100644
index 000000000000..43d428a4ed2d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "eliza-cqs-som.dtsi"
+#include "eliza-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
+	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
new file mode 100644
index 000000000000..e47b24f8b827
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/ {
+	aliases {
+		serial0 = &uart13;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart13 {
+	compatible = "qcom,geni-debug-uart";
+
+	status = "okay";
+};

-- 
2.54.0


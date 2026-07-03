Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78F93438BA
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 12:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783081907; cv=none; b=p22V0rHfWwIS7kiY62oHt0cgCcYC15nCOxLEgDK6Sa3FBzy6iFCf1TbPn5gUNaLwnFEHxYby4MHHOtOUC07fvsXmk4N7Nn/X103uI1M6xj2AqK8kFqSuPg1CGwDp/C2xnqZ3Y5FUDbqvW9AWPcaN9YStuqguKJ/RPMkF7yZm4l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783081907; c=relaxed/simple;
	bh=K630DEUTV191Dc2qesPz0mTnQpvjdlnARO12sy8EzHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AYdmHdURMIM3EaZhh+mplappR6PpTYqm1PAwVINX0iBB2gLicsBZgAms8HIl824HfoKnnSykjUq3qOEOEYYMdcCgvlC11QfNrrmGJhX0Nu/e/l7rBsjSK6ZU6mNuKUA/bPLyyTlGHw8cS9jRGsRjywJg0bE/k2pAHZvphi9evqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCiXXfj6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=joRIQ7Q0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCiXXfj6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="joRIQ7Q0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BAjSV3136311
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 12:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f5gceR25GDxCt2R/xD4eNZ9chDQhURP0qVt+vjHMpG0=; b=mCiXXfj6s/wbPan2
	IsFCSR91R+q2R1ow2ZiLIilUCKeYpzzT7kE5xOlqZELuOlKyDvukSkClL3YJ6XXT
	dGLkx2Yy3XFTxwBb0/GVOmnQsgzaFTeFH2KgPasHhZu8FW1QT6bwzZ4mYArYNXbL
	9p79xZZFFcV6j173jW7RDx76u+XerlP++9oN2JEzfXMph0fI5jwR6JTgnJ/ysm8W
	nJ0xwMCJhHgpsqrupWkB4YkP5sqvtlA1Wq8pmxtCq8Tu90QTT+tjsSdUhdcUIdTc
	DukVJ0nXg624yiqfzpytdPCrPJLor40ia8ohnuNPU/oXi1rCiP/LUQqdROqXNtQi
	QYOGcw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5ab2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 12:31:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so954907a12.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 05:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783081900; x=1783686700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5gceR25GDxCt2R/xD4eNZ9chDQhURP0qVt+vjHMpG0=;
        b=joRIQ7Q07GiE7AVugw2AuuCQQGJYeuF0TVdZ82H5fnn9Zr8AehO9utDuh31hAB6e1S
         QjtiddDSOlmZap0BKev3sScikKqm6rwpDZmt9bF/N5pTXfH3Al5H3I+e571aUUK5loip
         bt9cRAacY7/xWzyPYG+o+eet5gcETgFd2XFRFPJZfLgUyya/lObjyU4BgxUnpzaDT2GP
         xCIMghuDQJOgkrOPzxsXeY/8IrljP0xsecy25S9WS+R7jrE3+yGj3lUnE+uJfdYdwY9N
         6Fp/OIYOVxx7QTg8kyqCqEj7recyBDQcYLmkWE5mTagEFFaNycsNohBGxk1s8AfAxSQF
         DydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783081900; x=1783686700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f5gceR25GDxCt2R/xD4eNZ9chDQhURP0qVt+vjHMpG0=;
        b=dwNUHrdCogAxzZmCxe1127xQQNtSi+mlnz7PjcFzmLyIHe9AnOif4ixinCYdgn8zS/
         ewZni5TXfdtQGDkbSyTKyKLThlrNHIvskT7AZYBGm4bnSjyZ8cInreB6FscuK7ndtykw
         KIPjkm7tCqQ4NlgmTRIDL6THvYbxo2ipXULctmFqewNZwofnXmLE7xvzGX4rRsGV3ZcU
         vCAtPeYf1hVSeHqi8yQVq4N6Lv+uVgHYdJ3twcvRWewuwjVP1Hc9Rq0gxyXIO6jydpmF
         dnhFd7qE+eUoo3wtT7bF1UnIBbCt+ogLmYzFACNzrwcH84wS21Ahihkb/8NZv4aKHU2a
         J04g==
X-Forwarded-Encrypted: i=1; AHgh+Rp9QVVIeckL6WuqWtNois9YBNW+tCagy7ILKUUG+bxwdjGsariS2E5bSqXf1TgArFsfMR4sre70R+lh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2JqkkqYhbLlpgKcOPVNA5oGcqSX52VV+Ofjmmf3/9iIm7k9KI
	3A56bACqhsaFaM+e4j6n6lnuVZIdX7763p3PldblwVHic1uzppTqR/mIPXl1s2JMuWUcr0YCk5F
	0fyaCcB5ht05uKyyG1i5NKG35FfcqyBUObqMuuxFRqvCm3ZEmotSUx2m87aWxORtB
X-Gm-Gg: AfdE7cmjkRvZdoXj2/VTLZrotbqQtaCmnUePvikK1pK4+Jw71C8zW5QFOLnxzzbT/za
	MP6Ge0EEc5aDY2tu+U2MJl4APx1b08zasFg1Rh08LxrwGsfHVfHJX9eBbmc82kQk4tReIqH0LhV
	Tpry9Tw51QRxpITCkr3r0wsJwPVtU1Vr9ScEUhWQIHqI+RYM1rpavZg31ZQDvzENbyC6miwgASI
	VkB83VUyKze1XHX7bdZTuw0OcSzgvlaRaaHQxaV9W93OJKIWbJzxpIQkRBk5Nszw5KxO/b/HCUm
	TVy7GSe+G85vzEJPhNZe00JqQHnzM0xDfnfw1GSaV8iQ4G44k8QZscvJAQWk140xKKkim49ThLg
	HY4Ou9S/KXP74Y6xmH/w/GDNfTJ/3ZsISZ/epnKCv9siYFNGeNj/zZeQawoeS
X-Received: by 2002:a17:90b:1c06:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-380aa09a404mr10133014a91.9.1783081900188;
        Fri, 03 Jul 2026 05:31:40 -0700 (PDT)
X-Received: by 2002:a17:90b:1c06:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-380aa09a404mr10132973a91.9.1783081899548;
        Fri, 03 Jul 2026 05:31:39 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd223esm20949375eec.21.2026.07.03.05.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:31:39 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 05:31:13 -0700
Subject: [PATCH v4 3/3] arm64: dts: qcom: add SoCCP DT node for Glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-glymur-soccp-v4-3-b706c4c9b3e2@oss.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
In-Reply-To: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783081896; l=2909;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=p4NFAc7UYqZOf2Vhd5hWCbhRVXgxqVSfX1RnoN8Hnjo=;
 b=5zpjbDkcSFTosziGt9rFJPCWbhZl6r+iXwOm63BXvLpO1Y1Z2MdtGb+rEVk6uNcR4rSl5N+yq
 fywu2wKWdylCOkNzu4iNRrpoaGMb/k/cL3JehcDPOW4156SzxByY2pI
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEyMiBTYWx0ZWRfX+Dkbxy6T5XeN
 qRTqL3M/xKH70x58N6eX13jyCKR7F+rOkXkPyzI1fQ5ZiJZKL2/unqstvwuYhK5Owl34SxSa2YQ
 ZxsLxSbwf9JGkzZpKebzIG0ECRFTPkE=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a47abac cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=9f4fzsQZ2b4kEiPl2jAA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: _Duuj4y9_8cj_Kk4lw6R4v43B0w-RhML
X-Proofpoint-GUID: _Duuj4y9_8cj_Kk4lw6R4v43B0w-RhML
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEyMiBTYWx0ZWRfX2MsNvMHsaMWd
 HtPUISwne3xcHgpiOG16jgCz1FOGMZUez80V1eVMqa1lQQP2qj6Vqg4c7HoNYoYVrxzHpU0c/Nt
 hWYORwHFZOWdvG7G0/ez+vmp1y6AuRAFzCumTNNw8w+BWsa35tNdt5eyyZmgQeP7PXn/2r288P0
 DhC0xq+LQj6tBfRK7TUhk59BDxXpq7YgSaZhuvDA45fX9q4kzKiq4keQILlPjYmCo9fdscuC/Ih
 xWDTJ0Rok2kfJC5y3hSeKgQ6OztlAVEpzM31j9t+L2cx5HHAIXjxrOFqO2HDCLbFY04a3xXudt6
 uxAnvta6wcHHhoFrKN1KTN0n54M/sggzaTg+1gj6cAiMMf7kNlMZgXkeNLGeVztSuUNPfY2H/7o
 Ce10QBXh/6CorLRSWGPwh9eME2raoO+f64W5S/e+5NkWjtUJYUwlB/clCtNHjrS9DNnPbpZ9rCx
 v3Of8So3X++T2m4RNvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030122

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
USB Type-C, battery charging and various other functions on Qualcomm SoCs.
It provides a solution for control-plane processing, reducing per-subsystem
microcontroller reinvention. Add PAS loader for SoCCP on Glymur DT.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  7 +++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 44 ++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..328eb513140f 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -585,6 +585,13 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/glymur/soccp.mbn",
+			"qcom/glymur/soccp_dtb.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 5f44f68efde2..bc259dfbaf0e 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2297,6 +2297,50 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		remoteproc_soccp: remoteproc@d00000 {
+			compatible = "qcom,glymur-soccp-pas";
+			reg = <0x0 0x00d00000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "pong";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "cx",
+					     "mx";
+
+			memory-region = <&soccp_mem>,
+					<&soccpdtb_mem>;
+
+			qcom,smem-states = <&soccp_smp2p_out 0>,
+					   <&soccp_smp2p_out 8>;
+			qcom,smem-state-names = "stop",
+						"ping";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_MPROC_SOCCP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <19>;
+				label = "soccp";
+			};
+		};
+
 		usb_hs_phy: phy@fa0000 {
 			compatible = "qcom,glymur-m31-eusb2-phy",
 				     "qcom,sm8750-m31-eusb2-phy";

-- 
2.43.0


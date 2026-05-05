Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A08B41325B
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976634; cv=none; b=uLY6DUH+dxQ5Z85Om+N4gSZvTgcbEGrY9AgQgW+el2Nw0v4or7r1jTNEOM0mxChR5lyHPSs5L1SyxUiR3sQAIbxuuRE1PWbsIP5w7YB0dIfA0OPDdQ3cYq+MF96Red6r8cbGAoe7VRayYZ5+EFeExoiE1utIfotqNDLeUePfRaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976634; c=relaxed/simple;
	bh=RpjSjjB4pjZfFcbB7XVzwzy4YMbJ9NXUiyxiX8xJI5E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BamvO2JBUB4a0tUKXXxxHuLOD62u9eiSQiBAJ4dioDcLMTZL3TlVxXJNX8VVIhLSniC8bBIF3qiGLALjRxb2PQWDJgYtj6gVkmP82Io0q0OE9IC5rLAy5B6XfsmjU+bMStJ44bOfOM4ewvretiihqKI+7Sqfw9nU2f4mdb00kEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJV9UjwH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W50NIdfB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJV9UjwH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W50NIdfB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456u5V5331067
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 10:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PiAJ979ctt8
	7jli43AjJjSavikAkdqiFGxXDSeW5JsM=; b=GJV9UjwH1tw2DMdKgVk6P36gbiB
	LotfKCO82R9ie9tO8aZfYBYr6CqRAH4h3YcpR3ys7pp7OYDIUpkZDeEu/DFM5oOW
	3xO+8lrVQDqODegUyXsEWHlT8gtwKtQT3HW6SvBHLEnG7GhqI66CYE1fAFVwoGN8
	nKlb2f5aT3KfFrukcU8L34fomR9RGtK7vOA9i+G4jjMrhPUWlvrcHNw2EwmxIz1s
	I4MZUpqyCYfIVcGfd3IOtbb7fXrZ4hesCu8h44LPT4iBYXVnWSnb4rgWnsYZb2dJ
	YJkFHulA6C88c3D12992l2RVHJno+hHZcdj3ikganP8aXXAYpRcutQpwYjw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvr1c07m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 10:23:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3651991d0bcso5307435a91.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976632; x=1778581432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PiAJ979ctt87jli43AjJjSavikAkdqiFGxXDSeW5JsM=;
        b=W50NIdfBz08PvBme4Eq1VH8SGMuSRhe/aInYgobxDSX6WbxCvPWNB/kpV5oxYAZg1O
         l49m0D8NPumQdbwm6NmzogMvyDSM3qHG4aZhZ9ATHecEsDDevcOL2vSAUUQatja9Rz6s
         /tCnCZDs266y1GKfrShAhZqBb0U0A8B5vdsLksblRG4ExA4y9QhYy8T6q8uekGAY392s
         sNJkjIlmNWGgFE1b65sCtLYFO31+XOAXzely04eAZuhhHv38is7CBf82YphkfSBFDL5H
         1dhVp17woQeUdqUXnZ3F8jV+hCJKQDmgyTIRs+Dm2eeyyUFTKSD3I8K3rRzItudAmMVE
         ML+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976632; x=1778581432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PiAJ979ctt87jli43AjJjSavikAkdqiFGxXDSeW5JsM=;
        b=hUjdOi5OiX796BhqUGyxt+9NElHMF4UB587i6MIu5XKG6EW6HxmdaIJG7TyF3kMZMM
         lO0N6waoIozpGFP98OovJckTVEHiip16ODSr7BlLR+KDWhzkLe1cICn4bOCRol9yNteP
         5Xm5/vpR4b6DPckqCpaEAEhmAVkQ/qT7dQDxr+yEpyBHjYruFPn/EYS24jFs4XT8KPsn
         GPsPXXcarjWjV99MdqcC+iypuItYXkOHt7wS74kx3VZiOHQgsxcU5PWHPRH9jE01YcD4
         Bh+QMdOW2qEZ7Qjtp4nRrxrzwe+e0OatgfI0zsXftvdF2erK5hKSZuTcLqyowRvMNTcB
         ZJ5A==
X-Forwarded-Encrypted: i=1; AFNElJ9CUYw6UPxkhiEAyPLYBJrGXCVX3HqgL5tVAnjc1Y/fBuWydYOFvdVicQqjzAwV/CmJPhdh1YWMBrbK@vger.kernel.org
X-Gm-Message-State: AOJu0YwgiCI0HEDFM+z3izxiGUQVFfnFrnpHOWv4gRn26AQmi1FbvqJ4
	DWYV3j8kwFytkqKyGHawxgdQdsvTEaaBhsXqjFa6/Sdwg3KRRHgfUpjM8d0nTk1wmGogwBItNHj
	oImggh9pDWE0CesFuUF8vKOME4FTdr3YSIdi9NDdjt6hIJzINJbDyCM4MV8vstqN1
X-Gm-Gg: AeBDies1Wq7jQUljuVLofSiEcB03+3FeknbKCqdRr+mLt4eiVxtw2MIFdXrwqMjPHKe
	f0l208nemGC+a2ktJ4o/HwiKc1I/Papcm9EMkBmPMnHtVtO8VdZu87m//7ZSISIOciRraQP+9wI
	YNhDqX/W2pdItfBptDA+MHFhT9P/D6uT5cSrxhhLSPn9rzI6YbvjkvbfsOkDfgClzyBiSP4CBIH
	Cdw2zF6fjY5m76Fd2HT/4PIJbo/9KxEGioyWRwZo7FOcj9nlnzWGI+IdE5Lk9v3FRilOKPVGBfJ
	N8COgWdiauuhUacLYza3XSmM65PA5ZBEZpe5JnoPCumP76r05KEmlNIsIyZUM/UScQqHjPZ3JRS
	04MZlY2t4DBU/lwxZmIxZPfv75GydpRQkKqbBFTIdYAmtjm8IaQPXzisgUpXAaVf0r1wZAW0o9d
	4PknTIY/b8LCYiCW7SaXiYDgdKXJ0/JCWLsQeFeO3mNEAjDIvWcfarjpdUwFTzgg==
X-Received: by 2002:a17:90b:588b:b0:35d:8f3d:c554 with SMTP id 98e67ed59e1d1-3650ce8ebb8mr12021962a91.13.1777976631694;
        Tue, 05 May 2026 03:23:51 -0700 (PDT)
X-Received: by 2002:a17:90b:588b:b0:35d:8f3d:c554 with SMTP id 98e67ed59e1d1-3650ce8ebb8mr12021923a91.13.1777976631188;
        Tue, 05 May 2026 03:23:51 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3656ae05d30sm3299333a91.6.2026.05.05.03.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:23:50 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        manikanta.mylavarapu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v12 6/6] arm64: dts: qcom: ipq9574: add nodes to bring up q6
Date: Tue,  5 May 2026 15:53:10 +0530
Message-Id: <20260505102310.2925956-7-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xsdoLDOsKH2xCvwtz9zUDnbX8imiDWNN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfXwReOH1W3VbX7
 pjav9LfjJ7m3xHTaSAhihtHzlwyLornor8elTdg+Rwp5Mjn9/duRHnAyMWKeNBoipZkR1xUDsz/
 VvSjxVsCaH1KIaJam40fu/SJwsde5qFI4a0K7XDVbtixJlGpezQ3rAzEwdZsjmunlLQgcHDVgcA
 hKKceRhU+4CVodi2rrupPdqD1k2sm4rGxHcKHDjTespTlmIlId0/S+DVBAdXRYu0elDLxr/MPnx
 WQKd2M88rYXvLa39WJn0FBFAMnmOYkA48fx8qlVJlosOqHoJPLZmZ9s0WVCpbXLVKvNDmgyaGUt
 O2ZtiGcLk98fCRihtE2H3ntFPM8dNPLKfGaJDFcsxMHHMblCAvrnkRuiME6+M/0alWlbdsxPsD/
 +15gyU3fqKImXrqxdc7i1HM7TDCvPM6QBl8KKlPb01Tifps4U5IvnUSqyEKkDTdYVfoI6iLhTyW
 1hEirA3OSdlBvPL4NEA==
X-Proofpoint-GUID: xsdoLDOsKH2xCvwtz9zUDnbX8imiDWNN
X-Authority-Analysis: v=2.4 cv=RvL16imK c=1 sm=1 tr=0 ts=69f9c538 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=UqCG9HQmAAAA:8 a=VFxxlfVBB3dI8x85gZMA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050097

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v12: Change Manikanta's mail id to oss.qualcomm.com in S-o-b and Author
v9: Add R-b Konrad and Signed-off-by
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 60 ++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 622cfa96ed2b..5c828c855c98 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -3,7 +3,7 @@
  * IPQ9574 SoC device tree source
  *
  * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2025, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
@@ -222,6 +222,35 @@ smem@4aa00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+		q6_region: wcss@4ab00000 {
+			reg = <0x0 0x4ab00000 0x0 0x2b00000>;
+			no-map;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 322 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		smp2p_wcss_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_wcss_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc: soc@0 {
@@ -914,6 +943,35 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq9574-wcss-sec-pil";
+			reg = <0x0cd00000 0x10000>;
+			firmware-name = "ath11k/IPQ9574/hw1.0/q6_fw.mbn";
+			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			qcom,smem-states = <&smp2p_wcss_out 1>,
+					   <&smp2p_wcss_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@10000000 {
 			compatible = "qcom,pcie-ipq9574";
 			reg = <0x10000000 0xf1d>,
-- 
2.34.1


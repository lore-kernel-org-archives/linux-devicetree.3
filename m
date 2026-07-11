Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640A723BCED
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 04:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783743641; cv=none; b=CuApUrkYuupY8rivTF38q48tNQmxiwB3kYSp/14N11gcms/JRRYHcImpEB6qrZaHE7uV+nHevajPRSbhDPHHGxXH4oj7FV3a5k9kIjoGaTB6xsdwqtKFatO/p2MgxaT6POnlaiMv3jsabG4pWMKc4nxMPvoVXl9y5PpsiM12Tqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783743641; c=relaxed/simple;
	bh=NKr1AKgUDdEeQiIrpLGJtXvRcBzklGP0wTV1XmgZN4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fUq+ifWqy5/cLYWzCPmB9wUBX9IXHbz+hROqtId2ihu+ySXv0npzAaZiZTA+jJKk1/2E7bCEp2uS+PJ0XjnLoPu1lNBoEj1tI14UAtBO4zmU0PtdUpBtRSCZO5dfiSJd2NldGkkCLQofG9naotEoj5YR7N4TXNe1Lx1nXjqgKwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XooQqI6r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UFpMz354; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XooQqI6r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UFpMz354"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66B3nG5v2810852
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 04:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m8eMuykTYfIuguRt2w9yVz
	ZwA1GQ7CYMANsq/rQlM68=; b=XooQqI6rf8IKU1iAInqu+EIzXQ76PV8ej/geOZ
	OB/I2qKtrOTJ5pYaLisTpdSQ6FAgKjM+JeOBl8fKRMQ7DcLytv2OB7dHLGBKou0X
	ycdgm4KquA7LLW7gopUQCk5DWpVXGPZyLSGNw5oYJCWyburp6xDePZwvBBH0KPk0
	3RKdWuVBcKqfn1VSK7NaEEX6lehF+ViP6Oi7H3Cauyz1jkgm0uCKmVM6hCN6zQki
	C9oRuVc23/28VNr762AWH6wO4yf94hq4jLUZ+pPtXCJLUOtr7ft0cthqbx0igYO1
	EvxGcyUr68PXeBt/0EXXyLI0aReh8YL5fjGXp4c/q9eQ1bIw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe8v81q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 04:20:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a298cd62so1268489a12.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 21:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783743639; x=1784348439; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m8eMuykTYfIuguRt2w9yVzZwA1GQ7CYMANsq/rQlM68=;
        b=UFpMz354Hx0n4sys2v0Ah/11+qGj8qYdZxY7wZAq6wHaCFiPKbZ5LZzTni9zem0YWF
         zp8NlQE0RjoFsscdhPiXu7bPium25Fo8dCsJfQ4k/I+iGEmDi3xN7P2/fxxjlIwzsho6
         2hq2iiuK9KzKnaRyy+Eq10VbgAPJYfIbb0LsOXq75HNtz2j428rX5jYfo6bTeJGszcmG
         +HEexH8IWb+nFyVI1YlExd1D6FqK5Yq8eiLTdgzeeB57fzQgmwLXDrMqRU9bvwqW/Hbk
         2bC4RxT0U3NKU1DkZ3cOsxgiBG9xo054zMjUruhWB9rHNviFEixpT3v9eCyMrW+e6BS0
         Z7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783743639; x=1784348439;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=m8eMuykTYfIuguRt2w9yVzZwA1GQ7CYMANsq/rQlM68=;
        b=ktjGiFXKm2fuleQG7LfYLDWOYviqP9xefw8umo6eYI2rfncOgcX/pF3WL8gWHf1E+m
         yRNpq+/QwUCQwTWaBceWnI/aqMX6vJhkzqandZlSmEiaHVhJVjOzqyobkEezwRXn5ebz
         6XAT338z+XRGjGzBAkeFHQPuionIy2VcGX+WCiK988ZYpXtLSRhnsHpQh4/fpbdWSD9K
         MQeHAjSNOp+o+JmbRfQR+qCUFQHdM4GAEWQJ2o66m9TIy/ocOeT5QVAwDsxMm0s7txzi
         bmCAFRbh1Wllje3/y9Pg67cqT3elz0BReYfPRXb3awfH97j+Cbt+zfW5XIj6CATGBSr+
         w12g==
X-Forwarded-Encrypted: i=1; AHgh+RqjHZDWAdOYXRu1jMTHIh90xU3YcqYuqOZYAIbrvlMn4N2DqwnR7NQqeyGpzLc7j2mvz+4Th2hGFDpt@vger.kernel.org
X-Gm-Message-State: AOJu0YxeI0MtY2lK5GnQmElMva6RD0D/ym892UVThpeGc1L850vERA9A
	WdZpyFlkdjD6Ak7+2zihK3iRBHaqSN5WUmyOOPOq8AVOGNF4LiZ8xVPH5o224lziWXR4RHrWnfp
	TZ26jMyKY3toj3jmFMmgAoOhtE19bmbVmhrJzmj6+WkMVSVyukRSadk+jVZvCGQBc
X-Gm-Gg: AfdE7cnL5hKWt+oo5OlivZK2faPkN5AmQLmyKs2zkWIrNaJ0bMcgFDyCCMuVcWRIN4c
	UnlOrOQLAOtVOW7gwNM41OdRHd+sqph9N5CGfcjoT4XIJnRS2Q34fu1mvqyrgi/MSCpoL/vGmxv
	QKpycod+L2TEnhwS8rxL+typKttbClLVWLgu2g3b7/Lme84oGQu0287vAzCyGutqoTghaLNN0a4
	ZotdRhcFARI6JDCePbHX4XTKM6DDB6OWKPFGVA1EdaD2X3qjpzkg8qqZJWlUvNlaTVibXdrX3DR
	1Q+q6FK7kTndOCm3ACW2oaP9RFuf03pIij9/VYWsyNHCr9t2VLZvVt+N1imzAFFNlVd/OI2fKaN
	zgjq0ptGlHx7ve9816DgdCxb0ElmfULoL/3erR3XJpM0U1bQ=
X-Received: by 2002:a05:6a21:9211:b0:3bf:7eb5:9459 with SMTP id adf61e73a8af0-3c110777a37mr1813373637.20.1783743638904;
        Fri, 10 Jul 2026 21:20:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:9211:b0:3bf:7eb5:9459 with SMTP id adf61e73a8af0-3c110777a37mr1813355637.20.1783743638434;
        Fri, 10 Jul 2026 21:20:38 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm43455894c88.0.2026.07.10.21.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 21:20:38 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 09:50:17 +0530
Subject: [PATCH v2] arm64: dts: qcom: shikra: Add BAM-DMUX support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-qcom-shikra-dts-bam-dmux-v2-1-d5b33ee32138@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIbEUWoC/3VRSYoCMRS9imTdXzKnqlbeoxHJ8KNBy9KkLGzEu
 3ccGl3Ymw8v8MZcSMGcsJBudiEZp1TSsK+Af82I39j9GiGFigmnXFNNBRz90EPZpG22EMYCzvY
 Q+tMZTAzeOR2d1pxU+iFjTOe79PfygTMeT9VhfDy+DKrfTV7y9k957T3kQ1+v320LcNpKDDFG4
 Wg3KfKe7klWXD7JKzyUstoJUJzbiDK6JqpuEh9ZjL3KQDAqtEYqqaXuJvPZRr0Rega04QG9aDi
 a+IzmbEGoM/Vp7GYaG6mcd6bxrbKxFap2oZK6UBt54bnTIZhGkttGm1TGIf/cf2Ni95Eew9eY/
 w4/MWAgRaCuHskwLoZS5seT3d0yzOshy+v1+gtJV/3m6wEAAA==
X-Change-ID: 20260603-qcom-shikra-dts-bam-dmux-7fdcbb6fb662
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        chris.lew@oss.qualcomm.com, stephan.gerhold@linaro.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783743634; l=5620;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=NKr1AKgUDdEeQiIrpLGJtXvRcBzklGP0wTV1XmgZN4k=;
 b=Qv4qTtzRftilleMFXeh6SyVjuN3xN+oGggROpZ2VFBa+68bG+8JyjSVVhQx9aYet3sK8T4Mx2
 felvEmyeDqDCB0J3RFURByTm8Uvkv07EWCgqidtZBmVfnZBxS5TNOWz
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-ORIG-GUID: SW2rwH0rAbA3ypZCcKHHz8hYSmnESiHa
X-Proofpoint-GUID: SW2rwH0rAbA3ypZCcKHHz8hYSmnESiHa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDAzNyBTYWx0ZWRfX+61IWE6DOLgi
 FamXpgoub+ey1/KfjIU/XVunzb41kwY8cWERGYiDHf+C64bSXBAmv6sNiQPXH7BvvcY1DN8+KGC
 vP+VIVuL3WxDXG3qj8xjcMMPdBwNj0E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDAzNyBTYWx0ZWRfX5SeVNMIOKYto
 k8t3cRVX2GLOBDtXYMTvcy4MoA4ZKKE9l5XJWTRQrH1H4yy9m+6F+zRRR++626nP7rDYQwa3fkw
 cordAallf7JkehTlNy2x0lkn1l0QhOUCUd7J4QyvfnvACP3i9w0YdE/ij+3a7ZBVvVl3SlT/Bhw
 m9myFSwV8IGY1KAa8VEJXv1C6M5DAz3+w0kpS4YsZNW/7JrEAoFiIFmMumAiANJbV0cMYC8FZyo
 2X1sSd+vzJmvDpbpftwmT9jdUOEpoZFikDZ09fxFWY0aF95O08ZlrbTUff2Yx9iuckqraY4Xnmx
 U+q534Yq4eY6M3xI892BQ0N/sLOdS2/JTOQSK+rn35cOqiPezeHp3SUXYsPCjqW1e4rkMFARM8F
 kStU2msBf5UsuTUGvcYmxoqwsM3F4pgpQv7R+O2aEK2+WK/s4l770kVoFQ2SovObgpl7bD0zNWL
 jnBuUeaKPf1fbDies3w==
X-Authority-Analysis: v=2.4 cv=WONPmHsR c=1 sm=1 tr=0 ts=6a51c497 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FrY2Icr_-yWe-lCAmnUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110037

Add required nodes to enable the upstream BAM-DMUX WWAN driver on
Qualcomm Shikra SoC.

The SMSM (Shared Memory State Machine) node provides the power
control signaling between the AP and modem for BAM-DMUX. The
BAM DMA controller node describes the A2 modem BAM hardware as a
standard DMA controller. The BAM-DMUX node references the DMA
channels and the pc/pc-ack interrupt lines from the modem SMSM
entry for power control signaling.

The BAM-DMUX node is placed below the modem remoteproc so that
userspace can associate the resulting network interfaces with the
owning remoteproc via udev/sysfs, matching how qcom_q6v5_mss.c
already handles the equivalent node on older SoCs.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
This depends on the "arm64: dts: qcom: Extend Shikra device tree
with CDSP, LPAICP, MPSS remoteproc PAS and peripherals" series [1],
which is still under review and adds the "remoteproc_mpss" node this
series now attaches to.

The corresponding qcom_q6v5_pas.c change that makes the nested
"qcom,bam-dmux" node actually probe is being sent separately, since
it has no device tree dependency.

[1] https://lore.kernel.org/all/20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com/

Changes in v2:
- Move the "bam-dmux" node below the modem remoteproc
  ("remoteproc_mpss"), instead of at the root, so that userspace can
  associate the resulting network interfaces with the owning
  remoteproc via udev/sysfs (Stephan)
- Add the "shikra-dt-m1" series as a declared prerequisite, since it
  introduces the "remoteproc_mpss" node this series now depends on
- Link to v1: https://lore.kernel.org/r/20260611-qcom-shikra-dts-bam-dmux-v1-1-43d0b43d41ef@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 51 ++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 205814c4b349ae19b605688357c6bd71e1ee61e9..246ea74d1fb1e293f0428d342301886dc52cb179 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -498,6 +498,28 @@ modem_smp2p_in: slave-kernel {
 		};
 	};
 
+	smsm {
+		compatible = "qcom,smsm";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mboxes = <0>, <&apcs_glb 13>;
+
+		apps_smsm: apps@0 {
+			reg = <0>;
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smsm: modem@1 {
+			reg = <1>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_EDGE_RISING 0>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -1864,6 +1886,23 @@ glink-edge {
 				qcom,remote-pid = <1>;
 				label = "mpss";
 			};
+
+			bam_dmux: bam-dmux {
+				compatible = "qcom,bam-dmux";
+
+				interrupts-extended = <&modem_smsm 1 IRQ_TYPE_EDGE_BOTH>,
+						      <&modem_smsm 11 IRQ_TYPE_EDGE_BOTH>;
+				interrupt-names = "pc",
+						  "pc-ack";
+
+				qcom,smem-states = <&apps_smsm 1>,
+						   <&apps_smsm 11>;
+				qcom,smem-state-names = "pc",
+							"pc-ack";
+
+				dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		remoteproc_cdsp: remoteproc@b300000 {
@@ -1990,6 +2029,18 @@ glink-edge {
 			};
 		};
 
+		bam_dmux_dma: dma-controller@6044000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x0 0x06044000 0x0 0x19000>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING 0>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+
+			num-channels = <6>;
+			qcom,num-ees = <1>;
+			qcom,powered-remotely;
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

---
base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
change-id: 20260603-qcom-shikra-dts-bam-dmux-7fdcbb6fb662
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v5
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
prerequisite-change-id: 20260524-shikra_epss_l3-522afe4fb8f5:v3
prerequisite-patch-id: b5d7f75df02fde56181f576a936baf09d0a72276
prerequisite-patch-id: 3ce52e07ae57139c2e2b71a29ed7d7250f6fcc87
prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v7
prerequisite-patch-id: aa4ff7fbddd4c8836ce69aab89f2f91430194fcf
prerequisite-patch-id: ac83151a889855498d36288ddd36216d451340c8
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
prerequisite-change-id: 20260525-shikra-dt-m1-082dec382e7f:v5
prerequisite-patch-id: 48ecd66c06c4fad81f91283c26ec57d95bbde29d
prerequisite-patch-id: 7d92e5a301d09616840e54dc9e4a81f30a64383c
prerequisite-patch-id: be1a16f53e23dd5ab90210a056c9da3559c6186d
prerequisite-patch-id: 3eff04500c55100c763aeac1f1f8c5768d500500
prerequisite-patch-id: ab22c5fdb2fa65b78ffef76bbe4459c8d5ffe7b2
prerequisite-patch-id: cb24efedb648271ef5c60ace96e2366d89254e8f
prerequisite-patch-id: 8be7df0395c5847a988c7e814c7db878b5932b11
prerequisite-patch-id: 0510992d022cef7317b6efee6765ac78c0225356
prerequisite-patch-id: de4327fcbe81f92a337f429b74e8220969a5b79f
prerequisite-patch-id: 968bffc36646412f8289b917f37e762a4297bcc8
prerequisite-patch-id: 35944403bd4480caad12657342da15ea71c6afbd

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470589;
	b=w9OInaUDTEYmYeMBwQKHZdlhEGXts4O3JTmLwPMwy6tkHh0vzuhjwMBP/kRbbWVuxhbS
	 NqIBPW3P1ctIIxXHki61BEeUloeVIr2YM8kaqyd3oluACEmLK98179GK8CFGYXYTqtkws
	 heEL+yKQiVlRKQ2gR/5c4r2CFz1HexKkNRYkEdOXqggXIWk7nCGtiHk2lBYOhIa3uyWIa
	 XV4g12ftrZF+bKZbZFRTnaEo2Xwusq0iUljqHExJV4qD/+rt28D1e979mCbsCoLfhxs+e
	 yic6bQhGMevnp5q9VN5feFCn98TH1SeJjAu9nrMWydAoPy/+JXNvL7N+HefRoHbqJNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470589;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rvQVSnjuRvfSMbKrL6njJALbKeTjghQ0+1Vsab/TIsk=;
	b=vZT0p/LuQ9ARajhLZ3HOKwlaCb8IEd1b2um3X9OP7h5ul7mvopJtoYTAuUIunIZVxQfs
	 Kl2A9cUCgF1KZceyQYntNz4q+UKbcVofe987CePGreodu8Ya0py2+SRorUabtftFbYiUu
	 e4Az2paxDEKa01BdamDaLOUuNoUfeRFsgu2FSMz23Ikmai9C4Ih1yaTRisQ+PCVsXS5Fs
	 q8uroJMHuj7EqNqjcr5xQkr8ZnfeGA13KBYXVCbHI8xcbLYaUS32vZtCEACPr9Y3yVb4T
	 ubChS/iwTlTqgF6N8M8t1TYcadY/PcOakxRw+ioootTdKY+rjQWTrc/de1ILmV1mHQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iEGdmiJL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BMHIXFln;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C82606A881
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29C82606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iEGdmiJL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BMHIXFln
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZgCI3813026
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rvQVSnjuRvfSMbKrL6njJALbKeTjghQ0+1Vsab/TIsk=; b=iEGdmiJLdsk76Nvw
	f5yUcmYzngENXKTM6zBc7+ZysiIOH8nFujDieiVRI5tK8VaGA4hMFs0n6XsMdHGs
	7UF9ugoMGEmKCy75pb8XAOST8HALLcZiQ4nm/W2WkyB9/Mnn+Nk99wZqyp3gzXNS
	tLx9lIPHZ2kJB1FWBq2IbulmyhB3BdIsZkvTJ8eOf0Lg1/KNFNagxOJF+sTcm7FU
	EzNhX+tbXME0VZPnHvFlqqWqMvNyW1HIHzSPUjirVWC3sQjHyrPZIalsg4XLF3Au
	OxYxCOn8RvfZZ2Cbn2HXnsLLAiNdLNICpsLjJkxjymc9Lpa6KKRjaVIr+RZ3cg3/
	O26eig==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvvw0juex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:03:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso519918a91.1
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794470587; x=1795075387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rvQVSnjuRvfSMbKrL6njJALbKeTjghQ0+1Vsab/TIsk=;
        b=BMHIXFlnT1mS2raPDZ76Tgt1soopI5yaQ0ViAqcm8fUZ/vyuF77pqZrNfIvwCsmT7y
         XufmU5+WYeC8wC/AdzTTPTE7vkcT4r7v1hZHvbDnGLAGp4Of4V4C2bQx1w8Epvhivrc0
         M/NzdKV5dAB4Gbk2HZ5CyDHWj2Wqo7uCEdvcEm7D/XrT9DkFhv37vfNlkwBRrTbvggaX
         zxXFYbhzihIXsdqlao3VCdm5FYxERf2AvY5gX4yxgFO7iBLtKp+MzvCyo4NHUFSswSiN
         Fa/LOBVlIxep/gyUqrz34khIu2WY1AOrDBi5X+MAt1h6gUyVctRUn2AsSPlcqIE5buy6
         fmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470587; x=1795075387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rvQVSnjuRvfSMbKrL6njJALbKeTjghQ0+1Vsab/TIsk=;
        b=XdjAL4B1iCK5pXCdMK1zNXxeech50rBFTKc4c4CrIYO+WvToGMOsbzV5nWkMJ0Vej1
         Xzpia6Z0g4oo4BbBCFFCc9qt38A4YCjPVRyiLvYfNdMk5ms1rt/eGiZqD0kosp+F125p
         VSS8dQJ7OZNTne8WafEh+X9I6g9gHwnU7vFkRuncJF3rKl9N6wNu115ypRzHlmxQuCW4
         sKZJiI5akKPF67Ft37BoYeQxiB7nBjmFT7hE2cjQW6K7FKbxswN+JpZrNTOwtX7lRRmj
         ngxv2rq2IliB0ek1TZ537Z7dMqiHRZCDCyO7nE64o6hIaFB/q5KZtWPGQ7ErUuaJtT5W
         vZyw==
X-Forwarded-Encrypted: i=1; AL+hErFSllMvR2YTfi1VTjFqaACPGFowRXdPWYw9iMleGkmwhNsUoYTa/bNx6W7fFu8v/mDbi3hcJxrvb0F+@vger.kernel.org
X-Gm-Message-State: APuU4Z/WxqfnVE3jhaWn+1crkrj/QAVgQ+SFMB7K1DQj1peN9SrU2+l+
	XAdcbUbauLPZJCM4xJtDeVx/8oT7UEe5NYGAt9gaS4fN0PABTzZvzd4IPCpkdUXu7yCXsMF30Dp
	YIjmfsyGQP3HQxzDWPvmtBFqbrYVT/H7A4wx9NLs1kLgTDsFJZS3pPyp8xnBegxJ6
X-Gm-Gg: AYBFou0UKlbgZTACz8VuSm6Ojy91JmtHqbA8xYuc3c2vut63KRPVse/xUvHZaXenjdk
	7KpB2SJLfAMlcgp1YYhlxeE4NS5rGSE7OOWtOinBeVXNMp8HJwKEyaCyOZxxZVEQhR1TUWXxYg8
	O+DR8YKoSIqgfmMZ2wqcJUpyPJvLNRMgBriib8kKbPmdJ0aFIej4664XfyF7oWJzHgn+hy16bL6
	+xCRySmZbCsMFDydVGHOeo5A4umLxHqeo9+6n2xV2Lb4hCDMb9ZSVKjweVa9eRbaeS37h/aFf+y
	sENp2b2bpwKg2vrM5eZ7qDHEBZKjBU2ZYbuqFOG3kijzXR4Hd50Qs3LHyTwhVJSoFWazLfbOIHN
	TFl26A6Fx9xBjdNI9CHMRwx19jNDspNRG7uhhwQW58clzAA29KrlobrePbHG8m8pSynhjRA==
X-Received: by 2002:a17:90b:1dc7:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b197c81836mr1185580a91.8.1794470586229;
        Thu, 12 Nov 2026 00:03:06 -0800 (PST)
X-Received: by 2002:a17:90b:1dc7:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b197c81836mr1185551a91.8.1794470585650;
        Thu, 12 Nov 2026 00:03:05 -0800 (PST)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182e3a74asm3722251a91.4.2026.11.12.00.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:03:05 -0800 (PST)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 13:32:50 +0530
Subject: [PATCH v4 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc DT
 support for Nord
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-nord-soccp-dt-v4-1-af6e44e9f397@oss.qualcomm.com>
References: <20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com>
In-Reply-To: <20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: bYJ1q8kMp85LdF9xutrW5CPZO3LdZ-K2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMSBTYWx0ZWRfXxGNQwU/HOqpz
 zb3jxP+ddOXeJhwMWz0uUIUD4xtt1Fv8WgURh4mevDm1uNGRuxTxhRmAx9TcCEGy8PYboapxrky
 QiVn9o5IRH6HirWtWMfLeyroKEGyhJN7RETc+YHCwFVshtl185W4y8DeABO9Ohv039p1EWpo/cY
 Gbx0ZOORODiViC7zLnUwDq/dL1VMYTCWmXY5jd/6gugax+ASVH26M3wl2hKbqefF8RQfh7Mxlj/
 JB5/jd+i8apYk/fzfNvmZ+Wfe92sP7/yajj89dU0+FI5r/kP1VzXqEF5akKgoWGh5PIZIChJ0RR
 DY1SblaCfZEYTDs2Y2K7r81UowKLrPpMV+q2wCbAVAhrMfrODlaksb4b2ILMk6sfNe8y13lsARx
 FnN+wsbD5IOhRsqe9bX3TLTXcGU2tZmA9/y431ooAHAZ4oCmc100B+23yBxwqOQsM7BS5WA+0Wx
 qqnFEpfH5jXCWHC0HJw==
X-Proofpoint-ORIG-GUID: bYJ1q8kMp85LdF9xutrW5CPZO3LdZ-K2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMSBTYWx0ZWRfX+Kn+9X8QA1II
 ugSQ2F6k8eMN9gxiNGdKgLOcUHqso49fcnOfFOmZrl4vmxQvoRpT2RPbKAsvxPmoYUhXYgleiyT
 s/IMGTbKeUlI0Cw/Ho6zC4adcofrVZY=
X-Authority-Analysis: v=2.4 cv=ct8OAF4i c=1 sm=1 tr=0 ts=6af572bc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=DvZID761xdY0-bu0Qo8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120031

Add the SoCCP (System on Chip Control Processor) remoteproc node and
its SMP2P configuration at the SoC level in nord.dtsi, and wire up
the clock and power-domain dependencies shared by all Nord embedded
variants in nord-embedded.dtsi.

Move the SoCCP compatible to nord-embedded.dtsi to fix binding
errors reported for the Ride board.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 10 ++++++
 arch/arm64/boot/dts/qcom/nord.dtsi          | 56 +++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 5a1520e436c6..2211171b8c4c 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -464,6 +464,16 @@ &remoteproc_cdsp3 {
 			     "nsp";
 };
 
+&remoteproc_soccp {
+	compatible = "qcom,nord-soccp-pas";
+	clocks = <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "xo";
+	power-domains = <&rpmhpd RPMHPD_CX>,
+			<&rpmhpd RPMHPD_MX>;
+	power-domain-names = "cx",
+			     "mx";
+};
+
 &spi0 {
 	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
 	clock-names = "se";
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 617e5312f4c4..b66db8019555 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1029,6 +1029,28 @@ smp2p_cdsp3_in: slave-kernel {
 		};
 	};
 
+	smp2p-soccp {
+		compatible = "qcom,smp2p";
+		interrupts-extended = <&ipcc0 IPCC_MPROC_SOCCP
+					      IPCC_MPROC_SIGNAL_SMP2P
+					      IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc0 IPCC_MPROC_SOCCP IPCC_MPROC_SIGNAL_SMP2P>;
+		qcom,smem = <617>, <616>;
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <19>;
+
+		smp2p_soccp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_soccp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -1587,6 +1609,40 @@ uart13: serial@a98000 {
 			};
 		};
 
+		remoteproc_soccp: remoteproc@d00000 {
+			reg = <0x0 0x00d00000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_soccp_in 9 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "pong";
+
+			memory-region = <&soccp_mem>;
+
+			qcom,smem-states = <&smp2p_soccp_out 0>,
+					   <&smp2p_soccp_out 8>;
+			qcom,smem-state-names = "stop",
+						"ping";
+
+			glink-edge {
+				interrupts-extended = <&ipcc0 IPCC_MPROC_SOCCP
+							      IPCC_MPROC_SIGNAL_GLINK_QMP
+							      IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc0 IPCC_MPROC_SOCCP
+						 IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <19>;
+				label = "soccp";
+			};
+		};
+
 		bwmon_cluster2: pmu@1014400 {
 			reg = <0x0 0x01014400 0x0 0x500>;
 			interrupts = <GIC_SPI 739 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670235;
	b=jAnclSKwb5uHZ87PQrNl8E/kJ+zk7xplJvM+kQfDlLsEvMNwiVaewFCIF4GxVf8alahG
	 SKx5D6kzYbWhDwmKolYUv4JduKvjkGI1jE5TlBo5DFOd0IE/e6A3sXZaiRyk6Hqyl5g3q
	 1LHY0p8ThdV0xetyDVJRsAvVBO5Ea5NRhM5cWIwAdEZGEQIY1xyO39l4Mcx/YdGhUNgN9
	 D4frvhB9ZhsIvphsIP6XtZAv+vAX42oJHGk6dGB9NRhSLMApNj27GtNodZWYx8+4S1ajL
	 N4AjxzWVi2Kcye/kFlRTPP9Yfje2zuosqITR84I2PlgoNPhJF8U5nRNR/VuuIFpAhKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670235;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZX/imN8snsMFGOyxaHOdJQjxhDiqi7Lv74M9qV9Oy1E=;
	b=babqKSAYVyEgFAM3QjZAp0tj97J2S6bTrTgLCMm3JU6w/CveFe8b+KdiwAbfmmAnsPI5
	 WAz2mqmRbujmThLVcRRclK4y1MMBj2RZXAbTQSLayt+m6Y+kBzcOkfFztaF4WmJEidgnT
	 +grtPKMYpntEKqENdIjmCxD4iHeOwRIGJQExmboedB5ZEvglxVhGufM/ShMG3r/STe+JY
	 y3T21S/66Sab5/yX8MX+9QgzMFUK0s/aK4rd1opjfau4EENwX0h5zccjRf0MyAf0jWNOd
	 1bqMU/sckrmi+3UtWSoANln//K28RfJB4eUd2v6DySfZthCIQzc4vmOj7TB/Qg9sNeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RTDfUdMD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XuXCzIeF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA23606A31E
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EA23606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RTDfUdMD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XuXCzIeF
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xp38346100
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZX/imN8snsMFGOyxaHOdJQjxhDiqi7Lv74M9qV9Oy1E=; b=RTDfUdMDYIJpOVU/
	LuSA8ohkpGW1wxiLOWMK7mgD3qs4PK7KkkM0htvf8iNzhlrCRYvsycaksRuSqBK3
	i8kN0RnL1zd0A345THiSss7c0aR+UMCd0WHXeWS55DFd7Q+nIVTN6Bs22kfHMn+w
	WZPPgKs1O0wf1LzSPko3A9cbQpFJsws81Y0MG9ZrUvF0cZtK4D5FXyy1AGUZh30Z
	5kb70XBwqips1e4UxJF9WKunutQ0uBpe4D5cTzvHjATIHfwhqj5Mz+/X2oKryVHz
	LVBlP/JKYuZrtrVcMgFsNtZ8yYNBMzPQqio7oQpIIIHGbky3GUTDQ3a73ZpkB4Ly
	F7ttgg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93dawqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:57:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36637676140so2936280eec.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 04:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792670233; x=1793275033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZX/imN8snsMFGOyxaHOdJQjxhDiqi7Lv74M9qV9Oy1E=;
        b=XuXCzIeFVJs/+8JCS3sHZb9aqIFI3TNt4ckou0D46cc1j6DY0oDnRu1G28/wl5ZMvX
         VF8MK6E/Rj+d8hlqKf4ShSjH1xRpd9pRfikA7rfIoqr/I74+Ees1muJRb3+RYwf8hqSW
         2sM4eqJLQAQsjv4bd2QKMuxLpQeC/zsg2RGvW61H84J7O6rD1/MGOD6SoMrJnlQgzSVB
         XYeoeqq/hh7InUK0zUUbAJs9c6ZQ6UJwEhKisb3Tj18jQqTbEub6Cd7CRlbNNZPYJ4Xg
         +CQg/JFZbaN73X/4kJUVbDNJ1PW4joe4jiYK0UiUNP8xNFhZAXYoVpRI2y9jzFuwxrvz
         NEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670233; x=1793275033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZX/imN8snsMFGOyxaHOdJQjxhDiqi7Lv74M9qV9Oy1E=;
        b=Heg3LeD//f1JMM49mRsa12R2g1VdNn0ap/x75CdGQ/FikG+k+G64B2FdivBE0qwpFg
         DOwqTVoa5/ChyI1JttV+10yeaFGu5WcY/PiSlnFha52W4bIQuzXuBoXeL4/gSmkEG1VE
         yw94JVWZ2qwfj8TlU1Tw7OcbU60yNOX/qSznH09KL2kPuHS+vFhvS1VjiCYpyK4ufjhu
         vnYYmp2L9UJUFqhBIF4yBPmY8F9Hg+gqWE9PLifESMBekLUf5C/IW+d0MAiwVesMAPlr
         5cg/WKYW32F6tRtB/pvOx8a/z3PjxC8NTOC8D5uLdJoNSO7v0y1LjZPMfp3PjRkFwOoU
         huew==
X-Forwarded-Encrypted: i=1; AKwUvBxk5Fo8SFVo2JnjVMz+XjBp92wbuJDIdnlelMB7Cicir0EWPjGadRi5QdCW9NHm9lnFGH0v1+/KAqb5@vger.kernel.org
X-Gm-Message-State: AFq9FYKYGHnS8FG57sL9stnxh+twbSQDYJnhCmPRn2lsuX8CsH6KTZrf
	PttfYKA/ioUqJhhTZQ17lxNLcBmBHP5Ek5Am04C2WR4trQ7snU907QVQ2gfaNC07D4WLjH4UwPL
	4mDlyZE+IOnWpiz8avXZxQQ8ItkJEL6ykOLN5Uau7MmOD/ldqO/2f2NJmpfVENIJt
X-Gm-Gg: AYBFou20heZ95OH1VqZ3s9QTUa1FTFGANtHEt7yRYITx7JnNm29/Q2GET1XOUrGdJmo
	dLF8I1KUK9CHTZY53qvKI7gVU6RlLbrWyU3YPFdRNdpco6RmwfxOy+XxwzwiBbfq4Jmkv6ihG86
	5T6x73Bxk8OVqJ+ANgKBhUDa7h6wNrbrrBJfiPHw6BQj2kkDv9UJKsxWc/vxpwWQFwjYvIsv6Sw
	dhJqsBvgXIwWUa2oAROQRjO7hhH/26b3EGzqQzJGOKKUIzEFR1L24rL5FCRL+2buYH/ENUWbg4S
	+wlrSWU/bbwZt+B44etBjR6jzYWXyIz7jzOfJ0xuIBT1Tuw6xOcAsY36aDKfcfHEfudcnkmt2zi
	srL0O/stsz54zgH74dnvjIIJEEnw93rY9Rcc=
X-Received: by 2002:a05:7022:485:b0:18d:9eec:e0be with SMTP id a92af1059eb24-190a0612732mr9083359c88.2.1792670232724;
        Thu, 22 Oct 2026 04:57:12 -0700 (PDT)
X-Received: by 2002:a05:7022:485:b0:18d:9eec:e0be with SMTP id a92af1059eb24-190a0612732mr9083313c88.2.1792670232128;
        Thu, 22 Oct 2026 04:57:12 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm14508007c88.14.2026.10.22.04.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:57:11 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:27:01 +0530
Subject: [PATCH RFC v3 1/3] arm64: dts: qcom: nord: Add SoCCP remoteproc DT
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
Message-Id: <20261022-nord-soccp-dt-v3-1-1a69a4d54c42@oss.qualcomm.com>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
In-Reply-To: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX1fAY0aly+ENf
 acs9Dbn9PnWlYToVLEmc7I3KE1wMZASmupa4ohIiXUaWxw5sPNTKg2Mv+9slCUnbOX54cwsmM2V
 +63DinCUf2g699ZB8dhPtUWjyXYQRKY=
X-Proofpoint-ORIG-GUID: 8sEUycHwZsyklfsavWMOW3_M2Z5SS0nK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX0Mr7md8jWvWz
 VV3NwUdNgCvBJgeKML99T87psZwyamKvzoLxt1sARuEP5JjMWEXwD46WkxZ3+Q0TrphLfo9JJA9
 +o8Pn2AUElzF3t90BED6H4xpFbzf8rDTp6jJt/narIMwtsig7OHTrkQm5SwVosOmLDPPewcnqRt
 RTnzyPBGXmK+TqIrLU31zhcLWk/W/Uw8uI+oWMwsho/C/WKZ3bzf/FSKhhgLRpeSGcskVBifgup
 dNysEnStDyhAG7WBVav6xKHIljgUPjLyqxsKMH8yXAfeh5nzYWvsoDq6wBgu9NgAFopm+DnNyab
 Vhp5CAxEgDYgQOpvOecwB6zItVkyO2dKu3+hH9cB1okE+rM8KsfVReStAPC6hEt6YudgqXgQPE5
 Nwd+Vobej5YP4exGQSFP4hSr8Ujb3H5gV5Ipm+LoYwVFMoVxBWZr3X4qg9t290IzZBJ2Zo+1kmy
 250noakiEPNjGib6rNQ==
X-Proofpoint-GUID: 8sEUycHwZsyklfsavWMOW3_M2Z5SS0nK
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ad9fa19 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dPIVYjRPlg6xE4C8lnEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220047

Add the SoCCP (System on Chip Control Processor) remoteproc node and
its SMP2P configuration at the SoC level in nord.dtsi, and wire up
the clock and power-domain dependencies shared by all Nord embedded
variants in nord-embedded.dtsi.

Move the SoCCP compatible to nord-embedded.dtsi to fix binding
errors reported for the Ride board.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 10 ++++++
 arch/arm64/boot/dts/qcom/nord.dtsi          | 56 +++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 6dc4c871f41e..11317eb45e57 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -430,6 +430,16 @@ &remoteproc_cdsp3 {
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
index dfbbaf94a7ae..441bfb003f77 100644
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
 		rng: rng@10c3000 {
 			compatible = "qcom,nord-trng",
 				     "qcom,trng";

-- 
2.43.0


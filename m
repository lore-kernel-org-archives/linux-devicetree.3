Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C423EB7F0
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011879; cv=none; b=Qt1Ssc7sLkqjruJeeXtq3jhz/StDrL0DPB7KCIFE2lbhAXU4LyVewpMlTmH5ORhQi3SGGJld3pI4SuhMIaBDVU2XuocskEeHEWnU34kGuXi/ZB75+62J1RCJhcVhHJ0kVel/P2dvDMVYu89MZPfaoe3S/khey2DikWEXZMQyXME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011879; c=relaxed/simple;
	bh=Vh4n8Sgr5gNSfRglqpd18y6NIZg2YpujOU26V9Y4p/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Sx19lW7exNIUR+3BDvtqvd9Qqf0NE7c7MW1TaIppXUWEeQkTMa+8wp7AuDYbq+CITWAVxCfhfab+TiUH8r/G5CHeHeY6br2nXIzKFTCEL4Yb96IOSe5AFv6FdZooANcQg6DULmc9DJAnw2+OMY1uMJ4R4U9LfLhceJbnPPvgw+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyV4dXbm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jd01Tfc7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyV4dXbm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jd01Tfc7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6T1363946716
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aPPVXlUigs1L66dAlguIlM
	9pcFrkBinFiJScI7IqTjI=; b=eyV4dXbmhJiJHbMu2EvKSFAfH2UGbr5u7gC0Uu
	Iqks7j9FbGgYzxYgrT7BRqL9+ySU0Fs9T69xGX1bvkXcg/euM4c6CaIKAWUFlVdr
	MRtZvrAtypxqz17DkDjUCl9/Wg2HOM9N8XIzFuyqMFLIt7Cvb59yE7OKAcS8KLla
	wAxNJQCJWh7+emph5Y+/dtKff2ja51AaEtxtOIiajIoC4bi5OxHtslhmOtEiwU1u
	ff2T155LxlT+uCRBzoUqbbW2dgeN/CGKv48zYBCpN25W8OyZfGhT/W7tFtcbaESn
	jRG3It833EXy2nyZn+woNty9lclOyrsPJEZHaHBPSIfk8T1w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda49yp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:51:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-380a638fb5bso895704a91.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 23:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784011876; x=1784616676; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aPPVXlUigs1L66dAlguIlM9pcFrkBinFiJScI7IqTjI=;
        b=jd01Tfc7oIY02HjjvrWnVrL1pvLqxLO8b+ygGlK3dcKelTCRF01phnrCf8ibq79Lrw
         xToA1ZAPNPiuGs2AddLW36w3blnMz4LDoXKKhg3q9oTLw7IQe7hI1yxzkKpJ9rdOf0KB
         B5AaA9G8sOyDyN2EBFvRVzS5g0RNzVXmrEjwDFD2azTdlGLwHqUO3nwoHLdOOvlWedlv
         Vj7UkuWmnJROatwxkZBR/C+o3XqSbk1uiUKTWIW8QUfkp6bSnwavkIRfHS8DqVTG5tPs
         hTqTX/yHOFfcIC2CjmkuR8HkszEnrolW3+2btSNqM/MT2R2HeghYDRTu6D+J97rmV1d/
         1DfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784011876; x=1784616676;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aPPVXlUigs1L66dAlguIlM9pcFrkBinFiJScI7IqTjI=;
        b=YHo/KZ13VuDkcW/XhDtnS2uLSt8yT+ClnlOPWm4RUsw6zAP8UYXYMq9RIJ3aKQrdvH
         vzWyBbtlHomrRp+ndU2gWBfkTmG9DzaFAW3zfpeKQzfKDULyhG8yjAEILDXssv/6as61
         B6v/3DnmOuyagkC2PULoWJdFE0TUULF/0euEjvilD40aqNAydtZeMbUS1wa+BGZSMXM+
         bq67VJ+2tS8SISpefaPjwOAlcpo1rjIb/uud0wgprJb0k2/Rq4hnmI8HikAbXSMMYMFu
         Z4AiLhmEEs0kFWmOSXfjUpCZrNMTkbf5IGeH1xLMQt11j1ZnTcSu6WxKgkMfKgy4F96K
         kd/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrr2a+LThsifyhno0TzCDcpridCkdvJZM1Iz36nss2+iulytRWkvPw5rkCmyIdPc2Np/zh2yqXe9AE5@vger.kernel.org
X-Gm-Message-State: AOJu0YzUijxFZH28lOVFfeknl1yGxcytvrhSBpLt6Cpi9LIBWw8e/Zle
	niG3nB5Hwv9TS+SQJExarYlgLvnnjTJZUMq/FtQukczTTP+AWinAOQxFAV3jN4T1CeENh137c+q
	UIeC2jJ+Sc4PYNAg1Y1ixJ8/z6cPAdsDnlfSyntz/dmGo76qtsfEhkREv/hlsL2Jc
X-Gm-Gg: AfdE7clROLy7VnDUHw6t5M3bxKKd+osnf8NyBYKUZYDF6MNLul685LgGwBNLvBRxYtp
	zCoILRFDU2cfz+M+NnkQ5AlLvCGZ7PbM7fEjaImkO9tstrxa8B8SRgNCPYC1He5XTcNqBceEOZG
	65Ox0k+nyynOrux3Bjy7BJ1FZaINBbxtlZo9Y8A4NACei3Z1El3zMSbL96HpVVcEARd07Wu1Yda
	DtWi+Ssf7kXPyuUqvcDDBB+HiSkC/1+YRG7Boh+Q26dnv5nY0pYHJCEmr5yeddOP433ClouiLAF
	03BW+N3Z+grlUjdefq1uHqZ5cf+zgjhin4+O4rz1GphZmfyZqJCwOUkTsRI47fAutE6iC7LilvH
	WSXJh5oIU6uDXLm0AD1k4u61nK0lkq9sL/z4GjimMaca6fwltbNPk35mivPcW8EmDDTFVBx7bVA
	==
X-Received: by 2002:a17:90b:5545:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-38dc74d0274mr11602352a91.4.1784011876004;
        Mon, 13 Jul 2026 23:51:16 -0700 (PDT)
X-Received: by 2002:a17:90b:5545:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-38dc74d0274mr11602317a91.4.1784011875567;
        Mon, 13 Jul 2026 23:51:15 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172b6ce6sm975368a91.1.2026.07.13.23.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:51:15 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 14:50:58 +0800
Subject: [PATCH] arm64: dts: qcom: glymur: enable ETR and CTCU devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-add-ctcu-etr-for-glymur-v1-1-791de63c0713@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFLcVWoC/x3MQQqEMAxA0atI1gZqHarMVcRFbaIGHJVURRHvb
 pnlW/x/Q2QVjvDNblA+JMoyJxR5BmH088AolAzWWGeq4oOeCMMWduRNsV8Uh+n67YoUvKnJubL
 zFlK9Kvdy/s9N+zwvGMzPRWkAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784011871; l=4057;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Vh4n8Sgr5gNSfRglqpd18y6NIZg2YpujOU26V9Y4p/k=;
 b=PK52gvgEvIJ5/lnI9jyXonvvwXscpjteGU/qKTx2vk13LplIX8uhC/K5hV7WRBdTvhIeFdR5X
 xs9ix6Xd8isAcMOqGgDhLsiscL/iN46TEs9yGS0YzTU/WgTvCTQFh53
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA2OSBTYWx0ZWRfX2mdolaR4yMdg
 /xRxC1u13h8lJdHbxMLs6vfBPsO37tW2Hq9ztly+J77AgltipEKPanEfWK+5etENPC0uUTdz4U6
 czuu9jhCpTUveOG1AOCH9wRr8cyjPOE=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a55dc65 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IA447Ct8CvcyBBeIGyIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: NO6WIR_14vRQv0qPYlPgEQgUYkP43Pak
X-Proofpoint-ORIG-GUID: NO6WIR_14vRQv0qPYlPgEQgUYkP43Pak
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA2OSBTYWx0ZWRfX6qeG983qsHO/
 xCjwjt8K2eyGKRSxeC4qHOBDdiFJ0jD2GkHlrFIu894LlA3gVT01AtwVamBgzWiUT1pLKJau111
 YKRnGoQx+0NiaQ4AhQP+i38IYCMOiGbhsEWXiPzwaQerKO6mrnHLDigA+hd3g9uRtorJidAhGGO
 7J22mfZfrxGteK6stfKWsYHQoSzxvC43mzjhyUcI9eI5ku9Z8KwrkUXXsNGGJ1nGX5seghVTsSe
 SfUCJrW8U1BRDC8V34z0fS6DIjgds6sc87r9qfHDLlviU/3fj6jz+W8Q59pIrQlzkmBQSRCCos4
 5t9qXeZjKYIZ2KBz4wWWq8QPU9F68Tn36NSo9cH5vFO7NLyT/Yh5AsWLI6GtsuxjyMulEhunU2G
 davViQZYuhYNOyGNhVrWmZ9mZIOC6IH9tTolZK5ItzAjNNeXd32kmD2HcidsuwA3nGUQjdnJCEp
 B8H6/D/OyvUS9ytQsJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140069

Embedded Trace Router(ETR) is working as a DDR memory sink to collect
tracing data from source device and the CTCU device serves as the
control unit for the ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 152 +++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 55d91c696a3a..5f5fab830efd 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -6266,6 +6266,35 @@ rx-pins {
 			};
 		};
 
+		ctcu@10001000 {
+			compatible = "qcom,glymur-ctcu", "qcom,sa8775p-ctcu";
+			reg = <0x0 0x10001000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ctcu_in0: endpoint {
+						remote-endpoint = <&etr0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ctcu_in1: endpoint {
+						remote-endpoint = <&etr1_out>;
+					};
+				};
+			};
+		};
+
 		stm: stm@10002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x10002000 0x0 0x1000>,
@@ -6379,6 +6408,121 @@ funnel0_out: endpoint {
 			};
 		};
 
+		replicator@10046000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x10046000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					qdss_rep_in: endpoint {
+						remote-endpoint = <&swao_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_rep_out0: endpoint {
+						remote-endpoint = <&etr_rep_in>;
+					};
+				};
+			};
+		};
+
+		tmc@10048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x10048000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			iommus = <&apps_smmu 0x00e0 0x0000>;
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					etr0_in: endpoint {
+						remote-endpoint = <&etr_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr0_out: endpoint {
+						remote-endpoint = <&ctcu_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@1004e000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1004e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					etr_rep_in: endpoint {
+						remote-endpoint = <&qdss_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					etr_rep_out0: endpoint {
+						remote-endpoint = <&etr0_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					etr_rep_out1: endpoint {
+						remote-endpoint = <&etr1_in>;
+					};
+				};
+			};
+		};
+
+		tmc@1004f000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x1004f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			iommus = <&apps_smmu 0x0100 0x0000>;
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					etr1_in: endpoint {
+						remote-endpoint = <&etr_rep_out1>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr1_out: endpoint {
+						remote-endpoint = <&ctcu_in1>;
+					};
+				};
+			};
+		};
+
 		tpdm@1102c000 {
 			compatible = "qcom,coresight-tpdm", "arm,primecell";
 			reg = <0x0 0x1102c000 0x0 0x1000>;
@@ -7144,6 +7288,14 @@ out-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+
+					swao_rep_out0: endpoint {
+						remote-endpoint = <&qdss_rep_in>;
+					};
+				};
+
 				port@1 {
 					reg = <1>;
 

---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260714-add-ctcu-etr-for-glymur-dca08d663ba2

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


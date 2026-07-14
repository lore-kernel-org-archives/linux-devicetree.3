Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACE23DEAEC
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784016350; cv=none; b=KtFGRfN0XmRtUBKICofvYD10OHsAVUsaAfl/cKOtU5fiSytTqjgLXil2TgvjF6HBTeXLlaMi97AQ+m18VoOwBUuzdvnWKYw//ciiwEJ6BTJtkjXMGJsek+T/TTI6AHf4llHuyv/N6yDVv/MPjdvtZuqo0qSOUBMRUGAX99O+y+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784016350; c=relaxed/simple;
	bh=0vCBMdkYAOlhZ2IrpZTkidKTy/r/g4NHUcgQ0bc9EKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Y4KAeQjiTVvVB0z+FOqiHw//TXKYKUUQPuKcUm0ONffcfgmV1x8OxaBOSM1aWk1mG/8KdOG+7zEXA5gHUt/oQ8JZA3PVd+XkpjzfXsR7/tACjIRc+kqV9n1cSUC09WztTOkWZ06CQzah7I1MZoJHgKXD8+n5EM6WBj8PqabBUDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jX6dNk/F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bDtsvu3U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jX6dNk/F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bDtsvu3U"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SNvV3718200
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fxGxbKSyYjsm4ASc3fnh7q
	cAoK3RjS4NFUqIPd0lMvA=; b=jX6dNk/FnIerA6eSsvGDchQqDU1/j1/Fgzq4EK
	RQM1IoPdqWu6UCwDWLV2DA4/5bD/pYKTT/4RZ8lOwkAm/tCep43GgAvuvWojAcEv
	qBNi2HGz/E2gRTm+lBxg1eWY29CvV21vCUg0FzOoHZHYRD/AXKrXuut0OFbLlcAu
	XHb4FORXmaOpB06PTWo4cV3FErf9cqhVTfTC4MIJbO0r40jBNrr1Igjj7/LGgeIu
	YVqepEy0YCoxmh8T+KW3RypI1II9mwgBXJBVpZ8bA2d8rYjA6q0ma7gBhbJxDcOW
	lf1xnQvZib2uYU7ZXjCNy0hIuB51tnLyLzqSH6FDu+s0riwA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd7gvhy4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:05:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cae455cf6dso57213675ad.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 01:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784016348; x=1784621148; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fxGxbKSyYjsm4ASc3fnh7qcAoK3RjS4NFUqIPd0lMvA=;
        b=bDtsvu3UUPD8phKAR6pPuYNkzQ4b4I2a8RroQ5MNmn7pVt/Y5KuY6lFCD8832vxmSc
         SwF19mMN/KebfgC8RzgfKUJAq/GqbjtkvNnMByiNp+rnRwPQCsoKWKNgQFt4OenOKNxY
         shkSxBdjA0cICNlaUNMDoFkwcQCkS8DGzXIMDKjr9dVdUaGZl/oaGUSApVMIoQu7iW2/
         kaOal8c5dw1kJ9xQu1YfHP/qilZlFi0TxMIlxS//FM2KNmwNp5FbdKiHZ7LABi5LRblV
         DRpRqFkshg/Ix9NJnylfzz6LB8OQQmpC458vlg/5g8L/yhRfB3/FKM0tWZWexwjBDqvR
         aGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784016348; x=1784621148;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fxGxbKSyYjsm4ASc3fnh7qcAoK3RjS4NFUqIPd0lMvA=;
        b=YCgXchYRFITF71mWJ6U92iiCdHYYbPQptXtEAbX0Py8/6TcByfxQbNqjT6SajorWZn
         7vJDAtpvEe1/HTJHXKHlQwqpXC81/HZsQ1ITBWRO+zsVSPaff9uSq9TiESQ6rrbkmZ0S
         7qrAuLkaavrWNUQrPi/ps1Jgjs+arxuR8bT+3dZ8ZVZ04HQ05VFBWqywVUqpO/jVZJlj
         tQMIK4vNGPoId33psbX9bVqRna+YfIUbZ3cjUI71yHSEPO3RipvEJeRT/LuXhB8A3ljc
         xGw8OQG533AxuFcXfYC+v3URxqNwMtmaR8RU5zDyaqoX4+XHNiAF0flHyxGUrea0uwSx
         ESmg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4Nz+NAZuXQW/tCCQA4FDFd/vwIjhP8Ia9H3naOHGPuODROfpTSaSn62+Pbwn2kC1gvN3G1VKDn47x@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq825+cH6XGwZLu8XzSp5fx2FhHKKEKx+swoBfnsLLDPd2rXJI
	a9QKIsTWTJAI6lxF19BB/Pbwd3+anV5yzPRTwEStv477xhjEtKbOvr80BSPuAMQmTMWjrZhhvRt
	yPwr8ffo1jVXyr0Eleec400ok0LHfLxGhCUKlTFcg2qffEP9b2bsCgb0LHWzYJh9C
X-Gm-Gg: AfdE7cmMNIAOyre7GvqzveI3qKiyH9Zn7gsFu/BojTFpOHe/xotrzyhSTSMqncOqw4B
	oCrVTSEr9BsOygXAgqfYAkS40czD4CPI5+jqyqCrUwCIlysiPUQCkuqeal2AfNH9r6ik64xOOq8
	XrQRk0kFjzkizRUjjZQMvMq8W080G83PVWyvJqvv7c1GAD/z6HpVVHn9Y+zMTWuGiJga2GL0ek1
	2Kv8fRKVvawXJX/5s2LFe1l/4M2P+xftirdRcTlJp8LLxnr7qCyqhqxd+dfa7H4BBI+eNEnyUVE
	Oc9SDG66Cg3SD4I1t7xB9ZLS6EXqyaPqFbhHQLMTuozBl3Gr+tO3F4cz4qtdwt2OkSOXd9W+DKj
	9/qi5ZW671jg45HXGv+fisnvG0Z/CYFrzCdB5fvDr41ztQz6lRb/3W0bDrbsoZ6K1Bis8QZyBhA
	==
X-Received: by 2002:a17:902:c950:b0:2c8:2808:3ec4 with SMTP id d9443c01a7336-2ce9f052b0bmr124254645ad.24.1784016347695;
        Tue, 14 Jul 2026 01:05:47 -0700 (PDT)
X-Received: by 2002:a17:902:c950:b0:2c8:2808:3ec4 with SMTP id d9443c01a7336-2ce9f052b0bmr124254345ad.24.1784016347131;
        Tue, 14 Jul 2026 01:05:47 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1ea74sm112259425ad.41.2026.07.14.01.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 01:05:46 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 16:05:29 +0800
Subject: [PATCH] arm64: dts: qcom: kaanapali: enable ETR and CTCU devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-add-etr-ctcu-for-kaanapali-v1-1-be5cd7a3c656@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMntVWoC/x3MQQqEMAwAwK9Izga0iNX9yuIhtlGDUiXtLoL4d
 4vHucwFkVU4wqe4QPkvUfaQUZcFuIXCzCg+G0xl2srWDZL3yEnRJffDaVdciQIdtAn2RO1oemt
 t5yAHh/Ik55t/h/t+APCjUwtsAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784016343; l=4651;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0vCBMdkYAOlhZ2IrpZTkidKTy/r/g4NHUcgQ0bc9EKc=;
 b=uvitfdh3/RzwHNC6N1xw9SH9Khw/wWOyK34qdpGeDe4u/o7h7BxvDtcmNAXr4u6Ew9sfruB6O
 TsS/DOaQ+n9B9JufAP7ghGPILeg1HlFo4JjAgj9r6ukEWajYOZRwI5y
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA4MiBTYWx0ZWRfX8cERAUYBxhBW
 yz9zzG/t0JEYtsN05FYfV37VwiZTIRQEBWnqS1iZ2puTAgrBbpHHR11LhUR6cBgZ8Yq2XQQr4g1
 xsKuYTHanPbHI89sxDlxAHqVmN1zXYHLxzXRQI1uG16uj2h67gbHLiWOkakCAPlPSnrkmaFgKRW
 61kUGuvAKJ85/qVbfWlIxWNBFyfiPiVc0yfGyeiR6HmiOK86u7P1XGgToKOr8u6MqCNJS7xhT1Q
 gttad+rlye8c549dfxisPZiyPG9C1bLCqw28XwhtW0M7HP5G0XPXhii3+ohFep9iqbBXjbVnKRS
 8DJoQuA1g2mvBXY48FMs9yJPBwL8qHqxZsWs2ZgRSSX37k/TlJ9pLfaCwOV4M8WiChsTEzhFcct
 hMc+zWXDOSJ+Su7V2E6ZXmSeeT46zao3G4/K9oDxr06D8wcHvxbJXDJJp+gb+y1DAjPJbMANIss
 ha4smxNq2t3RvWedT9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA4MiBTYWx0ZWRfX97BtiCmDp7Ze
 dWIEZFwLu3hZTScnplo4ALcQ8u4mPVggqRSdm7McmDUnp7Q1n2hyPrzVm9p9DnTY1/e3VnYLcCY
 qZbWT3ymHBOP4JoAR3LvS9VyEf8Kjeo=
X-Proofpoint-GUID: aBQ-ITfqkelrFRAI8Rrbx6kAlzBrREHc
X-Proofpoint-ORIG-GUID: aBQ-ITfqkelrFRAI8Rrbx6kAlzBrREHc
X-Authority-Analysis: v=2.4 cv=NYjWEWD4 c=1 sm=1 tr=0 ts=6a55eddc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kFQAvpsttJVeTngcj60A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140082

Embedded Trace Router(ETR) is working as a DDR memory sink to collect
tracing data from source device and the CTCU device serves as the
control unit for the ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 176 ++++++++++++++++++++++++++++++++
 1 file changed, 176 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 0bf664cd4b40..07a0b00dfb62 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4984,6 +4984,35 @@ card-detect-pins {
 			};
 		};
 
+		ctcu@10001000 {
+			compatible = "qcom,kaanapali-ctcu", "qcom,sa8775p-ctcu";
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
+						remote-endpoint = <&tmc_etr_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ctcu_in1: endpoint {
+						remote-endpoint = <&tmc_etr1_out>;
+					};
+				};
+			};
+		};
+
 		stm@10002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x10002000 0x0 0x1000>,
@@ -5123,6 +5152,121 @@ funnel_in0_out: endpoint {
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
+					replicator_qdss_in: endpoint {
+						remote-endpoint = <&replicator_swao_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					replicator_qdss_out: endpoint {
+						remote-endpoint = <&replicator_etr_in>;
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
+			iommus = <&apps_smmu 0x04e0 0x0>;
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					tmc_etr_in: endpoint {
+						remote-endpoint = <&replicator_etr_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tmc_etr_out: endpoint {
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
+					replicator_etr_in: endpoint {
+						remote-endpoint = <&replicator_qdss_out>;
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
+					replicator_etr_out0: endpoint {
+						remote-endpoint = <&tmc_etr_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					replicator_etr_out1: endpoint {
+						remote-endpoint = <&tmc_etr1_in>;
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
+			iommus = <&apps_smmu 0x0500 0x0>;
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					tmc_etr1_in: endpoint {
+						remote-endpoint = <&replicator_etr_out1>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tmc_etr1_out: endpoint {
+						remote-endpoint = <&ctcu_in1>;
+					};
+				};
+			};
+		};
+
 		tpdm@11000000 {
 			compatible = "qcom,coresight-tpdm", "arm,primecell";
 			reg = <0x0 0x11000000 0x0 0x1000>;
@@ -5937,6 +6081,38 @@ tmc_etf_in: endpoint {
 					};
 				};
 			};
+
+			out-ports {
+				port {
+					tmc_etf_out: endpoint {
+						remote-endpoint = <&replicator_swao_in>;
+					};
+				};
+			};
+		};
+
+		replicator@11306000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x11306000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					replicator_swao_in: endpoint {
+						remote-endpoint = <&tmc_etf_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					replicator_swao_out0: endpoint {
+						remote-endpoint = <&replicator_qdss_in>;
+					};
+				};
+			};
 		};
 
 		tpda@11308000 {

---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260714-add-etr-ctcu-for-kaanapali-9aa6b297778c

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


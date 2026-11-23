Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412630;
	b=fW2VokyDY337SizEyiXdEelyskWOnFhh18uyI9hlbp8UIQ4h1LmSiUomDEAMFUt6JM7i
	 5SqpDsLhcw61pXd6rjDipMMz1UuyuNuLXUd63l5PsmCEa30RtWH1W+2xp0YufhrLk4PSd
	 asn6hpPFghucuMgFPw+sKBOs6YhZbz6f821CnqGkozp5f7xr9rjET1PtUzBjHBelYsGXG
	 BqNA7/P86FKPLXtHMFYlRHKYgNcEI+O3UwQ+sWaXgJQJTsIye+ltTMofJk9BcZGS6L3KC
	 iFtxZC6EKoWPxFUzvjFCdZzCdyKVnWKwzcKAsL6bTGTlP9EnnRNerf9HX1ue/OeayfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0osmgC1DstGd1y1nAh7cAxaZuBJSwuhjcMY0eVtO+uY=;
	b=kLT+NOlSOj3bdMG4moMi97RHUVvHQ7SigfkUo92dR3pk6GMb4f9BlyX//vYt9QNGzIzL
	 ISmzlng5yG8DdnFDwss9KEhWskMJgNZXYdy9sgf8Djz4ZRTzwSGYztVpw8wAi/2Kxv4/k
	 vuFbhZDj5hGjlZzA2o5hj1otdU6nR2TlMdLExvam+U1sbIdGUGm82l2sR5XfBUjp/cThN
	 ojmfvwCnQq3a6dhGaXl7yBBZPKgKu0VC3Rj1pKivkwdXtryYbLyS7S2gm6NAT+FH5U53h
	 ui+BOCVG6GaoSoIlgG20emNizpHbxQiuA5tjft2NuiXbkU/DJwqBV2E4gdjw6kN57pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gj7PDDGl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ChALP+Ld;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67828606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67828606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gj7PDDGl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ChALP+Ld
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN51Mrc2924214
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0osmgC1DstGd1y1nAh7cAx
	aZuBJSwuhjcMY0eVtO+uY=; b=Gj7PDDGlAPl9p99rK++oP+UK3dRX6sjFkBTMLV
	cXaX6DSsZLw0cg9OFh47Dy/VuLALtyC7p8RUkp75y1khi/RQpMcSoT86JFTRcniD
	X0pzsztd7V+LjrUzJeXveYNGfX0tuuD5zDaRq4eOrxkTaBzCrAi9lC7Ltkp8JOSr
	ZtAihU8UR28aksVyWByF5QmMk9LQaBQSwpWOUaPnrbuxm9cwKlmtjCWUoHVkn9mo
	MkpEBpCuYRhFxfB/uKd/NFOoXiPZSWvYNkG2jntgMy+os1ctJ/E7uCXqdTZjtcBy
	hlJGTsFk1CTqFB/v+WaxyDyvefuX4nn8izGBvOOms1PXqyHg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsg47w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:43:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so1582177a12.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 21:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795412628; x=1796017428; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0osmgC1DstGd1y1nAh7cAxaZuBJSwuhjcMY0eVtO+uY=;
        b=ChALP+Ld6MLqOLNA44lAvCHCal34as+RGr3/9yHs+3hGvDDZ1dktE6y8d4o5haLoMY
         Yw5+eIYaGqHlINdchNTNOss+PluUrIg0BsRe3VASBEzkyIuWVYnlSjIZg7/VPmw2vr6C
         08EQumryj+FH1wrrOVgVDxiqlYocyZUhc8J+9t06/a1OL19sd+GZccA/YMCF3/YDHDgd
         2mDAWidGdJUHDLHfat/XINF6TzotTN6SQBff8Z4BQTCKyiJ2jEoZ1tFznMC8jUbpAg3H
         erHEcxVEo4zMzffKtcYe3cdxDkZ7KR6ruL0CxljBu3MJG8qPWychDc2D9soYe4rD62d8
         YpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412628; x=1796017428;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0osmgC1DstGd1y1nAh7cAxaZuBJSwuhjcMY0eVtO+uY=;
        b=GwWV9pfrs5Uu2jJ3uhSJE7lCw1QXz1eT1pHh0JXxyEnAxjwsQVNK+538y21bLl/eFS
         OpGpc722BaSfDJ2KE6irHI0Bp4dFsGNVF/DIjD1Hjk1saPBDOQeJmcWKj1upd6M2CWb0
         gyFgmE6h8HJH1jcnPVbGOunyCqu8JdWFS2KpC0xO0XCGjUDA8hBfmCQ+yY8DMuLH5x+D
         X2gCUG0ig+AKrEploq8wW2Qlbi1Cyrmd7zi2ac5uU+IbeRjfpF0SeLv6PgE1z6Ex+A/k
         rEqDxYPUIoWnRrbWQd3twrIu5xYY2EWmjiOdghKVs23Hqgp3unZbtWCV/R3j4FhE9wq/
         qWjQ==
X-Forwarded-Encrypted: i=1; AL+hErFljnNvRisNdKAW9/sk3+VPAHr+Abe+NmRfwQtX/PiHVBkoaGpsHN4S/CfzjVc5uVBZV9We+qH414er@vger.kernel.org
X-Gm-Message-State: APuU4Z96qeQu1TprhgbmqCPJwMe44CdnfqMS+G6gcZIfFH49jm3aWwIU
	jBzz/pxe5zS4cMr+ExMj5xKWw9pk70Rsl3HoRld86HUZF2OX2SePfoKovzdF1dSNtPthSDVhpQP
	rCacgIcQtOZQ1cXYxuwbP4TXvffPCiYUqSSYVNxgYWLHjNTOkzpLmIvrO4uBol+w/
X-Gm-Gg: AZFdTZe3omQQrbWDqbiSRFm4Uj+bEJvsmeX2UX/XK1hP8Ga+Gz79zEKjBd48MPrX71Z
	4E2fEHs9SQTh125L2aUTETEgtsX1p5MQKOPc8fXOfU4PEyA4Q3KsvHRdMM76FrQ1IeG9J21geyj
	9QBUeE9nON7UL9y7IW4nuMKqVcZB9r4bqSYROWmnq+W2//YK35GRiEHIhCJPrSJGEZGWM4YhS1A
	kxuN9RsgLmkMLUjRvNHAN7UYbKMtH3i4/tirC/ZFh4Q9KkGYCZ03q7zqLpaejSKVsuHYzW1hear
	jtxam9HUjiUVvtLCoNWazVCeZVzf2Zc4gKm4KGcirYorfA/0Fs2pZHoplMARIGk69tbcFJuXTiI
	0axCNZgc+HWbMLxfjB0s+/sVQ6DYaUP2X1hubps1c8PdFmR6N5MclqvRJSOY4l/5TP5BCLaPRo/
	DaYluna2w=
X-Received: by 2002:a05:6a20:c887:b0:3e2:8b7b:ba77 with SMTP id adf61e73a8af0-4014c75736amr10292972637.21.1795412628251;
        Sun, 22 Nov 2026 21:43:48 -0800 (PST)
X-Received: by 2002:a05:6a20:c887:b0:3e2:8b7b:ba77 with SMTP id adf61e73a8af0-4014c75736amr10292953637.21.1795412627789;
        Sun, 22 Nov 2026 21:43:47 -0800 (PST)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0332bfsm4661196a12.22.2026.11.22.21.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:43:47 -0800 (PST)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:13:36 +0530
Subject: [PATCH] arm64: dts: qcom: maili: Add memory-region for audio PD
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
Message-Id: <20261123-maili-audio-v1-1-7dc0152eb70f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIfSA2sC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMD3dzEzJxM3cTSlMx83SSDRItkc0sjI6NUIyWgjoKi1LTMCrBp0bG
 1tQD4VgG/XQAAAA==
X-Change-ID: 20261120-maili-audio-b0a8c79222e2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795412623; l=1797;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=6evcSWnAG6J2rcygiHErNQlDy9pm04mHhsO8vl8iHbU=;
 b=SpBrMNlIRUPyZBrBiM5XIJoS6tA/uHOmV0Ebgj54k2alaQ4B5VJQKSJi49cSkEDW/jd4SNeqd
 cQ6qyMQFTWGCYb3jVCiqxzInNjIigREifwArQDWNZrKzfPoia/qUPot
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b03d295 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=xTAV2kzwEx0x-571GnoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: -bDTf-BevsS8hwbLY-66kKRXWh_JnJ6z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMiBTYWx0ZWRfXxwBzsCiPujLu
 jqTVeHdDsXKMbaGr+5ZvYfI+SxvB86XRMHfomG20OtlL+5FDQU2vkwlDYVnziGYFzL2rSsUnzsN
 h0w5JU2WS+Z05RKUeTrLBYfxr6EAW8AiT7V5qdVg8JfJ/pAKdE7Tu10hL0uUztO6SNoPitFIM7u
 ZTkR3rcprzl697JCHG1oX4lByuSKHOa8bWRagTupovH0wcTA4P+YTWmhV4qc2mZxNLHGSFcu1zT
 7x8l7kxNaneqiu72j6pAO2XSRqSKlH0FSBJJbsbWBfuyCOhDya7MVZDN3H0NRoSU2Wt4FC4o9pB
 /yHnlOwYG7iEPVqKRPsx/4SqPWm2uy3de5NzSEbC8UDFmX4aptrhD+KF8BDG7Ew4RFIZJHD6V9z
 PHNBKjXBeVprGi+AXiqBlLmlOK5AwFbtFA7XYTyirK/CGLQ76xkLAssOAjIPChxcfn3O6yZe2cV
 jVRBLac0U7fI62b7iAw==
X-Proofpoint-GUID: -bDTf-BevsS8hwbLY-66kKRXWh_JnJ6z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMiBTYWx0ZWRfXzSFJCSdh0Caq
 Qkuj5WY43ku2z+f2VunPt7z0X3igH85LPsXRIgljFUAkaKJ9AessAVUQBfBSaU3aTOaY7QnzAqe
 oI9RNiBPAxrAthkyG8Os/0rQ/jclDP0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230022

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili.dtsi b/arch/arm64/boot/dts/qcom/maili.dtsi
index 0aa5bd4ea21c..081cf052c77a 100644
--- a/arch/arm64/boot/dts/qcom/maili.dtsi
+++ b/arch/arm64/boot/dts/qcom/maili.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,maili-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,maili-rpmh.h>
@@ -429,6 +430,14 @@ mpss_crashdump_overlay_mem: mpss-crashdump-overlay@bd500000 {
 			reg = <0x0 0xbd500000 0x0 0xf00000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x0 0x1 0x0>;
+			no-map;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -3917,6 +3926,9 @@ fastrpc {
 					compatible = "qcom,maili-fastrpc", "qcom,kaanapali-fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261120-maili-audio-b0a8c79222e2

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>


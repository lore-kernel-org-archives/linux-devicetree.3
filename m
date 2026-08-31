Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6483DCD95
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 11:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176082; cv=none; b=ZfFl91yQ6vcKQBeWnEuYB2l9nqzNzgL3zia0QeOMt5UhjI18/qDsHffxr0npgzBNRjud3NgSFlzm+zfhMlvIM2UVUDMGupPPqFg+/mP5jFaFZLxUlEo6qE51nJlFM4bkgSm9zbityZAo7G24Cs0xkDVap8CK3q1CG5J67zJKE6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176082; c=relaxed/simple;
	bh=ryOMUFZ9Uglbr1bUKqUyfzjq248YalN2bF2V0PgZCjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AWsxR8s3k15WA+W2jLaJ95OMmlgLE5QOj88gu8OBmfZxPS6sqegxmcVwvB+EwwR7+lSnAV6WWIKISmA9InLJPoQDC2uNxkPWSnLdHUzCIAQaI8rhpLhb31lebVOMPkjUHF7tb0T9rG1h/6Tp4nsliecSvsJ5Ge8xrK3Jw3P/D7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pf81K4zf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y+oVHuIi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pf81K4zf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y+oVHuIi"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBAKUD3600911
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 11:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=syW0iTRoeFFKwthizofT+e
	v+SoMKo6exPLtbFmYURfA=; b=pf81K4zf1sK3dygl1UwEouBdku+2n3Hw0G7ut2
	7kcU773hlDW7p+o3WGgvqbpEsjdKQ+ZrvXlavCkLiam+wWtKX0M3xZBABtl/lKmJ
	1+IYPTRbY6Hjde62TVQq/o2wz9hQ9oGF1RFdgMCLF9fLt2dB6lhRmT2sD1Dw1osQ
	sgdWlnIqSfkIshNR6zYAd0dDg4X9noZ9BQMUkcfjPTwr3hzNJV7fGCXhnGcloosd
	lhgqFJrzKI2VHrGbIFd0QTqMgSRppkRx6RHHUFazIdXRsO6lHvTcyBA9Msg458fT
	rwId/weXzNccWGkoWfWZ7GlKr522viB5dWivU30v7w9rIldA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6jggjhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 11:34:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-854f274dd69so5404596b3a.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 04:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788176079; x=1788780879; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=syW0iTRoeFFKwthizofT+ev+SoMKo6exPLtbFmYURfA=;
        b=Y+oVHuIixWoELezg2EsUb9tJLhJnqjmk+yAn4MeHU/G7ymuRnVoWC/9cmSdhF1Fv63
         u5falmaKdSRTJ0ErDbKQCp6e2dtrbABRT7qmK7gkPV62qzTkYTWrOySPtCbHWp/1wOai
         FBaSGuxwHPc0CroCw+eOJ7rd7T1lw5fFGigUh2fOYw5mW2L2+jT3SQQ0J8eNhlQiotzO
         S9y0HzfUKW7MEPpX3xHB0gLmhrAUwI7jmgfSYcU5fQm3xzcaSPvh00p+as5kVFCnGgzi
         thiea/yk7ijTsxUD77xfcdfr5Ic9hXrxJRPdulb5DGKwD7fFtZe6fnpXLbSi7NoiGc3s
         tlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176079; x=1788780879;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=syW0iTRoeFFKwthizofT+ev+SoMKo6exPLtbFmYURfA=;
        b=Q5FI3Hpt2akfaaazJ+jP7EDFRDZvUMPJW6s7XvnRAc2q9W3S5C/jqy2gT8Sh4IUIPb
         f6zoKYTbZHeQhWFdjaEo8qyCqhkEN0Zy1vMh8QC+mv6XBMT7zAId4COYnMUGm5jykmi5
         c6DgjPsH7PaUPw8tzGly6xQwfScWDLrFX3ivH4mQYbgtRz2W1wwwW7Uxzru32tTAfjNe
         CAz74/LWRsDGEc5w3djPkokwrmnHcICnXhCA9OBPK8wA1FWEMBZQKfv+y6wX0LCbzwDg
         AvJdlmKfGG0/zMaKXS8dDCQ2Q5HjA3nXY2JDTgWhPZFJvKSchBsDvPh9QTNX2d2Bxa2x
         loJg==
X-Forwarded-Encrypted: i=1; AHgh+RryEcb5MciJCutqEroO/4VL26ZKsrX5bJo7fsh1+YCGh9vvVodvrSDlzmr2gw3ibIn7QDYumQ3dggdY@vger.kernel.org
X-Gm-Message-State: AFuF++kj1Qy+Bk7V8OCYs8GpSMD2asLvQLSBTxhq5CyvfV7GYjGRku1j
	ykM++FItv9iGsoQ/AQZRxkOYwL13aWydNzHjbXvSdPI4EYSxVR8CrA1E1NN1mSCYClrKZA1bbqm
	1kE7ZzXUnxCfqZwRaQW5Z7b2eiPj0lQj33JvbLTeBLCx9nMMRhs4I/tIzSCGbV6Ga
X-Gm-Gg: AR+sD122hkEzqdl+MvjC9LKtTt41ba9mDT9M+T6h/TKRBSRJv22DHCgLHRkZmBjxhEG
	qhMDPqIjxlWVtlJ9RNSQLctg9b++/bsCkl2hQ9G5cMV51QdwB9O45P/g6kZfyCyPTWLak4pVkt7
	n5Byi6LnuXXhIRTjT3S5Z91/Dz+kn0nqyqzf7ddEbUQmGo/nMGGE0AI/AId0QHhbJDfGiwCWOe7
	v+gT6/6b+6PbArBKIGcWQUielElhoQFxKrSLnIXy0wjTXvC3e9wwCqBGa7DxZWDgRkJt3JQk3up
	JDGvZwueb+1qoNOxExW4xXtKbaTpldqAXwx5A6qDZ1wMIgSjAm77OstcOPmiCNRrEGRCkvddonV
	jEBVr2P7c/bvGtTX7t3PFNRRTwXLVr4fMscnmgv20na4TkJAIIuXgV0qwSZyHUog=
X-Received: by 2002:a05:6a00:3397:b0:857:727c:a1f1 with SMTP id d2e1a72fcca58-857727ca41bmr26904544b3a.19.1788176078995;
        Mon, 31 Aug 2026 04:34:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:3397:b0:857:727c:a1f1 with SMTP id d2e1a72fcca58-857727ca41bmr26904469b3a.19.1788176078565;
        Mon, 31 Aug 2026 04:34:38 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a358e66fsm3631463b3a.44.2026.08.31.04.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:34:38 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 19:34:21 +0800
Subject: [PATCH] arm64: dts: qcom: kaanapali: enable ETR and CTCU devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-enable-ctcu-etr-for-knp-v1-1-8dbd3ff15ed4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL1mlWoC/x3MQQqDMBBG4avIrDtgohjpVUoXMf3TDkqUiYog3
 r3B5bd476QMFWR6VicpdskypwLzqCj8fPqC5VNMtrZd3TeGkfwwgcMaNsaqHGflMS1s+7Zp4Zy
 LBlTqRRHluM+v93X9ASXGDWRpAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788176075; l=6703;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ryOMUFZ9Uglbr1bUKqUyfzjq248YalN2bF2V0PgZCjc=;
 b=eguPfiBNNavyXb4xVJVKU4c0O/85vdv+1nFAp3D9Hf9ul0pVfy4IEAcHDdxoauvI5/K/IEpxv
 fvHyxcfeKwgAAmDvgiSy5hk58QBtaiUjXv2RDSk+1zeuT9Olirq53e5
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: JwXqQ1VmbT7BIbwEPaSkTkeDp-X6zBW1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA5OSBTYWx0ZWRfX/fjzxF08pBA4
 s8jbD7hhRTxJZ+LRC9tievP/LS/IieOUekSsyL7JaGGBYOCXGlXuGZsfyd2SpXkO5fIKwq6rYOg
 NzXT1xpCLCMsrL3aNkkPL8yvWAEjpKI=
X-Proofpoint-ORIG-GUID: JwXqQ1VmbT7BIbwEPaSkTkeDp-X6zBW1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA5OSBTYWx0ZWRfX6ALvf3ilIWlq
 gD4D4Kl3H1Mzsw+xOAiWr+qvAnQrG4OKNi+sdsVePlxtUKmnqWQP0K376P1hbshvOVmaHs5CXX4
 xn6FSeqtoqd/cJnwNV0wXXTEwGXbcuFzqMi6tQ4NTBta2MWIdkpfc0nX506dYf2Dm5Dnu3V8sfd
 D9l5jQWfMWsoAOpMi1H9mqPac569CjTzQA9RpCRGBI0+wGW7UHUrvaeJYGUxBfGIlyoQTy2VKky
 R3DhY6pKXBGn1i06hwIRZLTmQI9hMlGlmGrLOu/ntwWPMNOUSQSgenDponhAwI15TGoBiUV+TuT
 5dkB/07VKF+jmkHu4DOJcfOYnUkQ+hEZCv2QJdlXbUedjCrz8e1POrNSFxLocITCs02DCETk0x7
 CXdygK+ELjBm5OfERYknyK6ceoikP5l1v/MblNlX4SOKi8fQ/1nshbLlwnyR2meE8mv3zlZQvOM
 dsIoKPB75RbS14wrYqg==
X-Authority-Analysis: v=2.4 cv=YsY/gYYX c=1 sm=1 tr=0 ts=6a9566d0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bewKKRWVTElbd7WL6u4A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310099

Embedded Trace Router(ETR) is working as a DDR memory sink to collect
tracing data from source device and the CTCU device serves as the
control unit for the ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 181 ++++++++++++++++++++++++++++++++
 1 file changed, 181 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..6fc1399a7e5e 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4421,40 +4421,69 @@ cmd-pins {
 					pins = "sdc2_cmd";
 					drive-strength = <2>;
 					bias-pull-up;
 				};
 
 				data-pins {
 					pins = "sdc2_data";
 					drive-strength = <2>;
 					bias-pull-up;
 				};
 
 				card-detect-pins {
 					pins = "gpio55";
 					function = "gpio";
 					drive-strength = <2>;
 					bias-pull-up;
 				};
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
 			      <0x0 0x16280000 0x0 0x180000>;
 			reg-names = "stm-base",
 				    "stm-stimulus-base";
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
 
 			out-ports {
 				port {
 					stm_out: endpoint {
 						remote-endpoint = <&funnel_in0_in7>;
 					};
 				};
 			};
 		};
 
 		tpdm@10003000 {
@@ -4560,40 +4589,155 @@ funnel_in0_in6: endpoint {
 				};
 
 				port@7 {
 					reg = <7>;
 
 					funnel_in0_in7: endpoint {
 						remote-endpoint = <&stm_out>;
 					};
 				};
 			};
 
 			out-ports {
 				port {
 					funnel_in0_out: endpoint {
 						remote-endpoint = <&funnel_aoss_in6>;
 					};
 				};
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
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
 			label = "tpdm_modem_0";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
 
 			out-ports {
 				port {
 					tpdm_modem0_out: endpoint {
 						remote-endpoint = <&tpda_modem_in0>;
 					};
 				};
 			};
 		};
 
@@ -5374,40 +5518,77 @@ funnel_aoss_out: endpoint {
 						remote-endpoint = <&tmc_etf_in>;
 					};
 				};
 			};
 		};
 
 		tmc@11305000 {
 			compatible = "arm,coresight-tmc", "arm,primecell";
 			reg = <0x0 0x11305000 0x0 0x1000>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
 
 			in-ports {
 				port {
 					tmc_etf_in: endpoint {
 						remote-endpoint = <&funnel_aoss_out>;
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
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					replicator_swao_out0: endpoint {
+						remote-endpoint = <&replicator_qdss_in>;
+					};
+				};
+			};
 		};
 
 		tpda@11308000 {
 			compatible = "qcom,coresight-tpda", "arm,primecell";
 			reg = <0x0 0x11308000 0x0 0x1000>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
 
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
 				port@0 {
 					reg = <0>;
 
 					tpda_aoss_in0: endpoint {
 						remote-endpoint = <&tpdm_swao_prio0_out>;
 					};
 				};

---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260831-enable-ctcu-etr-for-knp-28434e777f1e

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8204418E4
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 15:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017439; cv=none; b=NMpfwNkmbkZkFvs2OkptMaDYO+lwhKFvDDpQVyGE3GRpk4lKCzkE5M8XheaDDJjTba9d8IxRAabW2ctbyqouVwl8OFrv/iQi6foU6WdmrBcVImkQNWke2SD/BZBzadTMGHhs5gm3DppMuUooko+0pNoLHssQ5Ob00byDV6ZZsyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017439; c=relaxed/simple;
	bh=PCD+i7SHH1Q3aqP1kDg+0xqXQ0lxVY9bSo+70E9HpZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pZ/5wlrnGsg1EY/uI2ZUceqTLzyBxtrnDXNHte0UEuePAwoA+9tcNg0TEe0H8SNSz+oOgtrejNJAKojRUo0v0Cfw/5xTAG+RMbMkwTUxop1iw/FzlcVyNqoyKhff6qtw2moegjEj4dZbOKP4K3dVqHGp8axVz3JZhhV5ECvycVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljIyuDQk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOx0zkb6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljIyuDQk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOx0zkb6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClGFL2251529
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 15:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jJceXiho06Og9O7kMeh7deoGHJJPmRDg1rHXj5YMqGU=; b=ljIyuDQk9FzaHl6O
	K7gOjQJNj8g4pkgmE2oy+jqjEeOF0kZt1kA7vjugP+XWDux6tWhxK6opWPLIHSDn
	8RPotDBHnJb5W7qNQo6AhyajCSqfcVRB0rweuVrqWE2hDtMUKSCq2LojZ69k8dxW
	PrTVbzlHgs9LD+JAiymYgliKxm1sDkj1VtIQx0yAqgpy1EyIEm8//CF+mwGVdeGC
	C9j4zEuGr4tJT2eYcL1aQhN8rOmDf6+p3hFFqkOovLVB67Pvmj84i4RPUi0oXaKw
	7+BQE+2PagrtuI8nwmPh756efZaRMTiBUKxBDKkvcrMzr1jzyLLSUJj3FaW4JQ9R
	rg0BoA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgj1r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 15:03:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d98b828c8so7434999a91.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 08:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781017437; x=1781622237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJceXiho06Og9O7kMeh7deoGHJJPmRDg1rHXj5YMqGU=;
        b=NOx0zkb6uxbE55uzf56vfhHB/WeVAQUogYjZ905C+SjcZNQIAmma3kWvaeyZ0LvG3F
         hLFvPEn1RYMLLPOOUxeE3G2awi3AVm/Whrxx22ERIbbxEbOunYeud88qv+0BKs+bjmBR
         Bvh235XY2M1piKToxjfQRX2mkBrUyge3Pc2gb1ZLG6Z0RZnEUUNNfSVh0f6wRYtQG1go
         bypwHGLxcTEWPihFrxesjajVvrPxHJnEUblSuQBp7CZyWHuK1mQbb1dW03d76oYhGO7p
         /EEtgLvu4dVQCBE9XqMPD2Uthx92MsN3yZXkxUcmJpKxWgRbsUDwVJmMe+/ZIcZdEVrc
         isHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017437; x=1781622237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jJceXiho06Og9O7kMeh7deoGHJJPmRDg1rHXj5YMqGU=;
        b=JdA23/FkowhsrL5hb0DFfTqCEIT2Ktnm4CPdRHC8GFaUGML8gU/2E6j7aB6RQtLcrW
         ru+sqVLBBTQZkHhBSzWWDlxPmmW/6VRUKmFU+i5D6WOkgdNQw5Y0xy5INrt2bgLtxRe0
         RFOlexeShH98X++qb7IKEkNodsAwit6gixcjPDc86BK3GqQCpo+UK/dEtgPJoCDw64Ga
         GTVMwfiyJcEaHmkZZESMuUxKR9DqQWifikXl5E0CrJgZsu+RfInLI4EIFrQmnXpI/3f7
         ewJbTzQWiPuhSeIq1ZtkHpj/bSsB1+5qkQYs+45P96pI+uG/RQbPHAMU8XnEzo+ijJI3
         9Oww==
X-Forwarded-Encrypted: i=1; AFNElJ/RxZwk1cyliBCCrnd3eXdDzM9TpzXBAkrWDzJnpKZZPcA8BXBxvLs4/zTlExMIpMAbqi+ZxnBx3fAT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx45ztzSGtaATekaiM0GOIjb1AyYNbl0d5pgA08RuA10qELkatv
	LENQBR+YkxFsOseodh0oZ0u0vWlgQdAuJqkUE603wxePHXZbM8eARBOxFa6VDBY7aogXiDQzlVb
	Eq+jU0PQF5PUEdilLA00MDqjY+W+EIrXQCJfsrJPFN/eetktD7mD27TVy/4u5sZL+
X-Gm-Gg: Acq92OFx7HX1kfKLJSA4TTl8VvIfbCfGHkUtQACjY4RaOXnwO3jJ4ke9lR0HVeXu4MA
	vuZru+OgWipa9AKtedAH7FPMxBctSZk/FbdDU+ULv64ElbmhFWjHMWsyMExqP9YofQHgiIxRhQv
	9jW8+GirONofYZW6MnUp17i/i5hSJbC0DeAY0K7mSCBl6fWPzJv8uXf0NWYDzpMxkEPUSX+jjuZ
	Vz8zgayjzJnZIaVkLeXFkPSfCW+lyyITNfLsTIEa2zYu1b4Vv/xCsATtNSce8zsFtVeiBE/mGkL
	tquin/nVqp+WIJwYy/0as7pTdv9qTG4F940trbYaI6aYUVmHLIvHXYUMaqlMUeUPtTY4xi4eOMn
	IjWz2+sqEzG0aHJcsnxTHskdD1GHxlexcDvuHx5FuTahUGFm4ARGLR60O
X-Received: by 2002:a17:90b:394e:b0:36a:aeaf:ab2a with SMTP id 98e67ed59e1d1-370f0d4c33emr26138417a91.19.1781017436516;
        Tue, 09 Jun 2026 08:03:56 -0700 (PDT)
X-Received: by 2002:a17:90b:394e:b0:36a:aeaf:ab2a with SMTP id 98e67ed59e1d1-370f0d4c33emr26138338a91.19.1781017435965;
        Tue, 09 Jun 2026 08:03:55 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm26987659b3a.44.2026.06.09.08.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:03:55 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 20:32:58 +0530
Subject: [PATCH v6 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
In-Reply-To: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MyBTYWx0ZWRfXwaCUTcqeaeT2
 e3S++2+1z3t0vo3vR/4gTGKk2pn3wL4CJU513Tyzq4qmt2JyA4CPD7A/zw+zVOU4wcqN6EFS5QE
 IosF9I+GdLvDnXI1D7ysLygoIceNCy+/nhOkcMsfsrE9lRy+0TXUnc78OYk9Q3ahiyAoxDCwv+C
 ooLoK5PJSCuMzu8iaQrh/JV+3kecHFvng69zJE0eas7yz1U5pcKSOGJP6JnjrDWRid2cKI2PWPH
 Xdi3Zym58Q8z5shu4Z+4mYKin0bKtVFVASHZ1srmYpdR9ufWo0QtQbLjMQTBG/qqDPuHUxEoIms
 swenpxQHrtW1F6JYyObWMW5HJENMsHwbCFemnhQLgg0PXvWTIf/xRIjZL8kmwiXToCl38ELXHF0
 J7MSI0hxK2/lsmig9m1ls5Ihp9pF+ZfD0Lq2aN8AFCgZ8BrSJqdQCh7i07VZ+/pj43SSOhJ1xP3
 UzaB51Zczqc4WuNnRiQ==
X-Proofpoint-ORIG-GUID: Jn6UhaVnKkAi9jSZ06JWCEw6g-TJBRhd
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a282b5d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QpH9IB84JAnPMoRP7PIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Jn6UhaVnKkAi9jSZ06JWCEw6g-TJBRhd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090143

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 61 +++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 977de44b816e4295dba89ecb77c6df60f6f08d15..c5635f22e2a7a68fe665a5b5236901b17de6983d 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -4,9 +4,13 @@
  */
 
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,eliza-camcc.h>
 #include <dt-bindings/clock/qcom,eliza-dispcc.h>
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
+#include <dt-bindings/clock/qcom,eliza-gpucc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -1779,6 +1783,19 @@ aggre2_noc: interconnect@1700000 {
 			#interconnect-cells = <2>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,eliza-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -2657,6 +2674,50 @@ mdss_dp0_out: endpoint {
 			};
 		};
 
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,eliza-gpucc";
+			reg = <0x0 0x03d90000 0x0 0xa000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
+
+			power-domains = <&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,eliza-videocc";
+			reg = <0x0 0xaaf0000 0x0 0x10000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,eliza-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAMERA_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,eliza-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1


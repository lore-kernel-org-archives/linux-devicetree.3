Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799BE381AFF
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776665607; cv=none; b=psKLy4Gyb392ILQmYgpg6U6O+PvQYSoSX+13J9rpkeC0vEdGL7imkiswrl/Tl8MDvixAbez3gBd0h8IKlexvoTtkBbWy/vd46XU8QXFFz/XLUJkw9QPqg/i9SAQ3D4V7kXok8NYc5pJHumzp6rnVStvV04LOP1N6KiCUtLbrfy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776665607; c=relaxed/simple;
	bh=zGGHbFoLuQtJKA32X9nqq3tKPosuz+r9hAZ99dLWEwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VSpd1nDF/Dk8on6y710jDkw2qMVeYfHFukQRrrcfw7gRzrsDEKSUMNte8WLcmNlZH+mCiXqLP4ixZH2+Drb2ViMXTYXEAZ5viXxSwvy4gL+PlDjPzTwAgBFbhhcHIZgi17vKzMv5x4oKJXEsebc72RnNfrCyayyjDtxlIAZ68Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GccHsOiZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jAGrj7O9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GccHsOiZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jAGrj7O9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K3gPxh2542974
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q7mY8lTSQrgYkXdkCqcNJA4iP5y3VqBUOnbRE3q1D4A=; b=GccHsOiZLsjB6O0i
	P3c+ffb4Iei40nQmDbO1ReZmb0ZOeln2WrOr5sN7PP0SrNCiukP0OvYDwRtymnF1
	H0rcXir+1wHdqgwkcmh3Z7JUeZo9SsDOT42f+eyv3IbfaaamLSBwX+gf64Wiyqtj
	BTAJ7zXWt4d1SwQrp+lggUM9WBJNYNVdLRXM61Kk2AWMhK53QNLCf+2CRRuDt89k
	+n0fBPA78CWTinj2HunTN1Hp7QzhWGN9vRvGYlyEdaQ/eZ475coc4w4mzC0rg+Q4
	PZ5iE40moqA3/J/uwSVe5i8r/S+NuNTLee0jVJrfQhc74EiarFOJxrFSTvtpB6L5
	h+HdCw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm261vawe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 06:13:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7963d8d167so968279a12.0
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 23:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776665605; x=1777270405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7mY8lTSQrgYkXdkCqcNJA4iP5y3VqBUOnbRE3q1D4A=;
        b=jAGrj7O9uVA8l8y5IVJhq9lnP6XQDZV8RMiXH4X86H2UHQMC/e75rMxVl22XMQkz7I
         OyNZhFpRKYYnNrHn5HWxcM00HrlZC/ZP2oWgiiTcqujUu/dsJ5AKpmFU/Cmcy080Myed
         r3xBKmNpeYc4bzTYOX+IQuuo6M7RFyVQNKSFlA05BDTOLdGy7EXMkV2uzcA7Gsoewr8q
         s9pud+peUWHABG/RZUpJO0o35PQWdn2MOn13V0+16TCCejqckq9bt57Bmye3ABYOy0dG
         FRTDNo1zGSZj92moxVN0KOyHHIYiDNRFgHDxvCT8p+XuNEACBbDRcdu7d1x7MuQ69J89
         GGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776665605; x=1777270405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q7mY8lTSQrgYkXdkCqcNJA4iP5y3VqBUOnbRE3q1D4A=;
        b=BdTSAWipj9hktJDP+Rdp3hEJierWecYysCrVZ553wtRT3YTvV8vgZuZ4+APrz7PR6e
         vtN4iEkckzYN9iz6lwYfDrbTR8f5jG/vBu51qHKSlgZpyON+RSyj8Osv+SOJeF8IppIw
         dS73YFA2S95PRUViYWfEKLBwDuTDFmDUP29EdC61tkEnS+kc3BrdZiWRkESsmerB6Cu9
         lEnDR7w4x7aIhs4ya0Rhd4CgfIyf2rrAJtpzaO4BgkQQIUiLWSqEQ7VPQ81lUZWBfPiC
         4hCFzBXbEdkOj9MPWwIgGcbJ19DUW5zdjcZN+seBLuTmSVroCjEKmKtl6p3Td5I5eKcx
         Gp4g==
X-Forwarded-Encrypted: i=1; AFNElJ8+YzqG40FgstY5PCX6ybY7UvPDTd/57P5Xd3TNAL1BoGUQPkgusl4/ZDCGOYK4/tCFYmFzXZ0AOXRg@vger.kernel.org
X-Gm-Message-State: AOJu0YxuVcKRxOgUPuscBC/zRv56dk8vomwb9NIz7Z+rplSSG6AMgRig
	0Lzq48ynZrQIhK0FmmXcQuEvSCwZM7YzGd6bdLz+aIHe9DC5mtnH99d9S3rVMCmkLsoiTKIpHUC
	Fulz5gFCp3azC+WVx1Qf8PkdPwYdYPVQ2LwkRtccrn/YmhUS9bTXwtjehEFDrPVzo
X-Gm-Gg: AeBDiesDIYaMr0h3vCyxNCGwvgsThr7EQRzI//NAJkdC1tse6C0Clo/h2zx4Jc5r5RL
	TX3rRl13tLsZ9Ft/4ANNVS5GGCOnA8t2xOvvEvQ49GhPowzlNEXVr123sRn14WJ88+4CGMk/amX
	ks2PBb5nWIbKpv8y4EQVmF2jT1/0Rl1dsCbDDlDKmeYgTR9ak9K6uIbO+x1+9ANvhJ2Q2ttJMIv
	i45EHMEOgj+lf2EIXHuCE4hUxcpVDkpa4LdMHkM/Qm2IRkxno+j+AsVXc/ZaiwL2AZzPs5ikVz0
	II121su7XGA8TAmS03zMmjF88bgvBVeuHljQCY8Iw1U85gFSCNzarfja6e2FmHrFVh+fEheMQi9
	vjZa0lVk6GuATDuftB9Z/Ish31WxlmmyxzAqH5DmWDeKYNuJIWEveAuOmq1N6Dcm62eui
X-Received: by 2002:a05:6a00:ab8c:b0:829:800b:9fe with SMTP id d2e1a72fcca58-82f8c99a9a3mr12866431b3a.39.1776665604880;
        Sun, 19 Apr 2026 23:13:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:ab8c:b0:829:800b:9fe with SMTP id d2e1a72fcca58-82f8c99a9a3mr12866406b3a.39.1776665604415;
        Sun, 19 Apr 2026 23:13:24 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb28sm9018034b3a.13.2026.04.19.23.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:13:24 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 11:42:51 +0530
Subject: [PATCH v3 4/7] arm64: dts: qcom: talos: Add QSPI support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-spi-nor-v3-4-7de325a29010@oss.qualcomm.com>
References: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
In-Reply-To: <20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776665582; l=3120;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=zGGHbFoLuQtJKA32X9nqq3tKPosuz+r9hAZ99dLWEwI=;
 b=90XKx1R6+e2A9l0NCBIAtA8btFlf60e6u5ouuioK/dcl31az3v40i/HkgGB1Ul2NHZqbUFFIm
 2VNCx3t5EI5BlSoiMoaL6OAkheNa2QNp2Z1D0JIJ2CpJZVnXFxySUFu
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA1OCBTYWx0ZWRfXzKjXkMuN0V3L
 A3pOWEFNuF7oFtu66ZvyKJoAw/3Z8dls7jGvzDCM/IITFabExVtXaOeEbLTJ9sfDhcs0loTExzp
 VVqJTZRp+F9vuH8pxGeViTIdl4dk7bPBC+l4mJXQCGkHsIWJTWbXkk8AXgeY/Zgy998rb/vKFrb
 6AokcHZQEG1UqrztM41GGpFIT2Cnl/4hn4+fwpRzGoVPHJKVYb5VYRbEMaNUQVZ8mPZRwluTPkK
 w/RBCzpZ2nugzA/UGL1vJQOMziVmK0oaRf2c27H2M3BLW4IVbPsM685hzeejAmAS0EvNbgdHZ68
 T4bGF/XAna0BWmxB6vaqFr98YZuPGOaf3hK5ussyDbCLU9B/dTqDweNq0gx8bKVLgL6vvlpw0s7
 /tVlGsPc8Ltr+0CyBXdxZACmhGXXzo/AZTtg7YqrShs2r4XB3emAeVPtiJn1vpzKgwml02esBIN
 bZDKSaIzqkJcGRXJzUA==
X-Authority-Analysis: v=2.4 cv=dcywG3Xe c=1 sm=1 tr=0 ts=69e5c405 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=NWNfpJqe0LLSB_FnjTEA:9 a=87zslcl0W4pG1hMJ:21
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: Z0xiq2UZyfzf-_X8qcFE2zow3UCfiTcm
X-Proofpoint-GUID: Z0xiq2UZyfzf-_X8qcFE2zow3UCfiTcm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200058

The Talos (QCS615) platform includes a QSPI controller used for accessing
external flash storage. Add the QSPI OPP table, TLMM pinmux entries, and
the QSPI controller node to enable support for this hardware.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 80 +++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 75716b4a58d6..4b67b3401615 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -530,6 +530,25 @@ cdsp_smp2p_in: slave-kernel {
 
 	};
 
+	qspi_opp_table: opp-table-qspi {
+		compatible = "operating-points-v2";
+
+		opp-60000000 {
+			opp-hz = /bits/ 64 <60000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-133250000 {
+			opp-hz = /bits/ 64 <133250000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-266500000 {
+			opp-hz = /bits/ 64 <266500000>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+
 	qup_opp_table: opp-table-qup {
 		compatible = "operating-points-v2";
 
@@ -1553,6 +1572,34 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			qspi_cs0: qspi-cs0-state {
+				pins = "gpio44";
+				function = "qspi";
+				bias-disable;
+				drive-strength = <6>;
+			};
+
+			qspi_data0123: qspi-data0123-state {
+				pins = "gpio45", "gpio46", "gpio47", "gpio49";
+				function = "qspi";
+				bias-pull-down;
+				drive-strength = <6>;
+			};
+
+			qspi_clk: qspi-clk-state {
+				pins = "gpio48";
+				function = "qspi";
+				bias-pull-down;
+				drive-strength = <6>;
+			};
+
+			qspi_cs1: qspi-cs1-state {
+				pins = "gpio50";
+				function = "qspi";
+				bias-pull-down;
+				drive-strength = <6>;
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				pins = "gpio4", "gpio5";
 				function = "qup0";
@@ -3682,6 +3729,39 @@ opp-202000000 {
 			};
 		};
 
+		qspi: spi@88df000 {
+			compatible = "qcom,qcs615-qspi",
+				     "qcom,qspi-v1";
+			reg = <0x0 0x088df000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+				 <&gcc GCC_QSPI_CORE_CLK>;
+			clock-names = "iface",
+				      "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_QSPI QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&aggre1_noc MASTER_QSPI QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "qspi-config",
+					     "qspi-memory";
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&qspi_opp_table>;
+
+			iommus = <&apps_smmu 0x160 0x0>;
+
+			pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data0123>;
+			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		dc_noc: interconnect@9160000 {
 			reg = <0x0 0x09160000 0x0 0x3200>;
 			compatible = "qcom,qcs615-dc-noc";

-- 
2.34.1


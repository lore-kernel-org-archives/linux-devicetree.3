Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46774AD7CD
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 16:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648098; cv=none; b=GvjZ/vqJ2w1HLTCSWHkP0vXUyglrvf4VNUyblT7+R6mTByhsTlH66f8+t9GH3j+5dRH4uefTdLuFCWQQGT3nK74drBb8+yiIVzCh4QEsoDrJ6gm7JFTiHt03C5owVLQNgh0Qr5NoISZXNQNVPmyjpvecdWfrr84O5GX9noOi+rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648098; c=relaxed/simple;
	bh=O/mwPTGxb7Z5iK0S3e13ry4ne/HCup9vhqrOmsfhbQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LNsrahEbXw4chmBHTvr0tAFCx9IPHNxd2tpiA0anLme9TlgPQFBszdscVUUlUalbsFF1Ap6HuTTJnK0t0MAQlddDyirJ7jETph3OWdmOwgwAYUlsZJChpowAjBVK7ixbRxlKWkwBvOPpdSzoZ0I2cw0pSYUhSNhGIip8vm9cFlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b6qa9ve5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kkoq2H2m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b6qa9ve5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kkoq2H2m"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFPYEA3709933
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 16:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aB7HIxGBOwgAfi43a2agTiC1H63IqRhV4118dz4m73U=; b=b6qa9ve5YdAhkkL9
	NKC3/HoJArYK3eT3JChgz+/Ui4tp0keUU45RqUB2y6euNZIzn8b8+y0kkO6878Ny
	xBwiL19rLKMV5VNoNQdEXPTe8hBi/iGLcXfsM5klxiF4+f81p2+TQwpr0iOec+1B
	ROtgAM2/dhhq7PMTuiPN/AKZA3OQOGVvlplx1Vih0lVbyMuoFXtGHZm6/MMq8SnV
	6eHeVubuS3e6yrlCxF+1h6DdzrJDnyts58ofIZ5AV8mu5C76slzw7MGtZ1b7MC2g
	lLtVJ2zgTqSHFiPsPnTWmrylBI4QL9CvGVGCyjarz+XxLe75j2GBXYD6MKmegUQN
	vCFQEQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjh76g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 16:01:34 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1665200f4c2so971874c88.0
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791648094; x=1792252894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aB7HIxGBOwgAfi43a2agTiC1H63IqRhV4118dz4m73U=;
        b=Kkoq2H2mDo5PnK6mYkDF6IS//xz1IHTKZKGowcOfx5AFSDyV/AuCgB+vtsSYAPW4yN
         5/0XId/7Z0xPXTnByAaUvyv7Mg4kI/QzHZkWycCchUQfJ+FcQX5wf2p7BzIV84Dxk7p9
         M2wcYT9aM8DFL/eE5g3MUGrjlz/99dcpMjJT1QjArDQgz1Vc/gEBjriJ+MwICjPsF1uP
         M4P4vdvU/U+Ndui490iW9c17gOWYK8mpioQB2In0VlEBi49G5drrccIkWJTbEHy7P6K1
         rPn2Fzksgiw2LLKPDJ3hnfg+MMS3og0434TTopakmoJ/Pq42oUiAcKoFGwIG/Rs2Xrds
         CWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648094; x=1792252894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aB7HIxGBOwgAfi43a2agTiC1H63IqRhV4118dz4m73U=;
        b=UV54g8wWOq9vz3jRqltdPdWhSEwV+N3RqJpu6hRXTJ+ixiiBJIRpz0D2BGhgopKHT4
         fFN/yLaLDo4cnCwfxRGDpVMwtrvmtl6Yc8fMFZMyGm6uXHDooa6weWjfUawpug3L6rmw
         ltxdJju9xyyxTHfhqMn9ZS+lkso1M+yG0CVxFP1evmjG1dXWWa4Dof4SVuoEQ3TMfwtW
         c2aHFgMtD0+rvaN5zgINhy3VSSs8dOec/3V90h0JvEYAH0SqZpM9BBe4Cjv+DsC0E6A7
         4+7tKXFfNhICY+XHvKpePsO4n5gw0g7snDjeiSGSdg0we2DjarKo0EZrkMQQdodH/R0o
         zfhw==
X-Forwarded-Encrypted: i=1; AKwUvBxUUN56p8Vps2MATtUuOj4uoCZyxTPTpP1FR28TV8TSkF2+amvIIVCRiVhpkuM3J+xfdhU5RHa5t5u6@vger.kernel.org
X-Gm-Message-State: AFq9FYINHyIT6o2KZo1otm7fqp8LivaylaeP5QsoTYDpGCspSG9oGgG3
	VyVFJxQLgKR63qPGRygFTy4Dp/Mqw7OYo9CsmSzEzqP0Nu+86p6shsITecs9O5ugCc/E7dd3Jhu
	tgWMQmyczLF2143s0DJ/CpkdsUKVDSIBR8vn+WtjbxzLDFq+GvffGZcwDloeaM5H5
X-Gm-Gg: AYBFou0e0AyYlMncCtl8v9isElsuTJK9J19Yy/TelenUj2HKdFNH7t9wiCuMBfL5G8n
	l8edQr79YM3Qno4iK1MP+bdZEAHJqCOI44RCKzNOhbwboi9nOcU4UMOjI5aOLDFtWBaRFGY8vzS
	h9mzbMW1WNHD9Zbq9RzSTCkWuP9ylfCCWy6a63nTr1rTtzuAjXtaVjrR57utHslMDORctB06JWg
	tfqaKI7gAVb2tELgmdCPtl5TF7PMRU3pYuddCDTIRGp/insqOLsWqelV7E54USxirPJifQQwFtL
	hn1zHTH+gcR6oud7xqA5HVqOal31hOM21AtbLtDk8yYxpNs9Jqdzq0Fc007IUmY232HtUegQwqE
	1cnML+RtuIF9u9ydjIPsnCuLAxhuvU2U07IzJnI+YS6SJlZtFB7ChZMTNIJ+PP+ld1uZBMkt7vY
	tgsDePmoNXCA==
X-Received: by 2002:a05:7022:285:20b0:15d:f053:18b6 with SMTP id a92af1059eb24-16a5adfbebdmr6047884c88.9.1791648094030;
        Sat, 10 Oct 2026 09:01:34 -0700 (PDT)
X-Received: by 2002:a05:7022:285:20b0:15d:f053:18b6 with SMTP id a92af1059eb24-16a5adfbebdmr6047829c88.9.1791648093304;
        Sat, 10 Oct 2026 09:01:33 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm30786022c88.13.2026.10.10.09.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:32 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 09:01:16 -0700
Subject: [PATCH v20 11/13] arm64: dts: qcom: kaanapali: Add CCI controller
 nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-kaanapali-camss-v20-11-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
In-Reply-To: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX8eOmu6B9NpVP
 6ProcL2yCDDBXchNrxF0Qd6S0a7SgmS4RQGYbUAE+3dMrfWBbRXc8XpmTxnLJaOmK1lktUpb0/V
 iYlr2uN8Yj7aLfiBX7T7yuK+sosWZhNjs4pIL2+TBAVddfJIMEZo9++0PgX5bL1sb6+ZoGHpJkY
 5f8jrgRgkb4OyxWkuXTS6sZY3ieZgh1Ugf8SCOl1p6WN3YpNLvxolwr/jTcacVuCZ6SYYV+nvC8
 6XwPirfxCuwt9h272n4zylg11rZfAjmnmpDUVQW3bXhsXPjAOu26qcQYYu3suxmuB33aTWeCTsL
 +WZVr7WM/RAkeuHnnFpQZ+a3X7vR217raQqnOHW0VbcKBIdZWGGCqkiBZhwEa4bR31azahDKfT5
 HHB5rK63WlF9+4G3nTwy+BNGVXbUEVNLr/UYXk+OIoFP4aRPmxHmdcZxVJVNcAZA0/U4FoIS9/M
 bGBPWSzmh5YVzZruFkQ==
X-Proofpoint-ORIG-GUID: FYvnBTN6yS3clQeYNNy0VJc8K1Pz23JS
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6aca615e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6uyy3mKblwRlHw_pSasA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FYvnBTN6yS3clQeYNNy0VJc8K1Pz23JS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfXz7h6xLbCJuaK
 zzsDA/l5vt/zvwkAdmH8yYhcK6J+3caKdyCqPd8lBjJ0begs1mNR1QSAwMuMfLcU0CDCJNn57JT
 LAZwIUbENXRddtHZ8ZcE0kX/2wB75VU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610100063

Add the three Camera Control Interface (CCI) controllers present on the
Kaanapali SoC. Each controller provides two I2C hosts used for camera
sensor control, so define the controller nodes and their pinctrl states.

The first bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio109
cci_i2c_scl0 = gpio110

cci_i2c_sda1 = gpio111
cci_i2c_scl1 = gpio112

The second bus has two CCI bus master pinouts:
cci_i2c_sda3 = gpio113
cci_i2c_scl3 = gpio114

cci_i2c_sda4 = gpio107
cci_i2c_scl4 = gpio160

The third bus has two CCI bus master pinouts:
cci_i2c_sda5 = gpio108
cci_i2c_scl5 = gpio149

cci_i2c_sda6 = gpio115
cci_i2c_scl6 = gpio116

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++++++++
 1 file changed, 303 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index fb282be07e07..62f02bff0227 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3749,6 +3749,117 @@ camss_csiphy5_in_port: port@5 {
 			};
 		};
 
+		cci0: cci@941b000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_i2c0_default &cci0_i2c1_default>;
+			pinctrl-1 = <&cci0_i2c0_sleep &cci0_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@941c000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941c000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_i2c0_default &cci1_i2c1_default>;
+			pinctrl-1 = <&cci1_i2c0_sleep &cci1_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci2: cci@941d000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941d000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_2_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci2_i2c0_default &cci2_i2c1_default>;
+			pinctrl-1 = <&cci2_i2c0_sleep &cci2_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci2_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci2_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		csiphy0: phy@9523000 {
 			compatible = "qcom,kaanapali-csi2-phy";
 			reg = <0x0 0x09523000 0x0 0x2000>;
@@ -4537,6 +4648,198 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci0_i2c0_default: cci0-i2c0-default-state {
+				scl-pins {
+					pins = "gpio110";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio109";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci0_i2c0_sleep: cci0-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio110";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio109";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci0_i2c1_default: cci0-i2c1-default-state {
+				scl-pins {
+					pins = "gpio112";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci0_i2c1_sleep: cci0-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio112";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c0_default: cci1-i2c0-default-state {
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c0_sleep: cci1-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c1_default: cci1-i2c1-default-state {
+				scl-pins {
+					pins = "gpio160";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio107";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci1_i2c1_sleep: cci1-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio160";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio107";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c0_default: cci2-i2c0-default-state {
+				scl-pins {
+					pins = "gpio149";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio108";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c0_sleep: cci2-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio149";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio108";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c1_default: cci2-i2c1-default-state {
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			cci2_i2c1_sleep: cci2-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
 			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio66", "gpio67";

-- 
2.34.1


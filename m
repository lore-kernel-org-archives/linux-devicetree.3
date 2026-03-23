Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E802D8385
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 06:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774246807; cv=none; b=MosYA9nRswRl0iINwU+Poy9xVvmZ9vw/wvaSmDrydiATfIBYTgMdlQOMzCX/R8j+F66WJWkX4MhPFMVw6ftWsw8BoPaD71UP/RW1xvTMo1DGvafU72ycpwCkZr83NdfkngJ6/9pXReaHOB+7/XXpjqjeIAvRufwbmdDBqSLCfLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774246807; c=relaxed/simple;
	bh=2Pd0viSFy/ivykY48jXmIuciuPP8RhKa5t+d9xQtS9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PKZInWTme4uKjCzGu2LzHLuExzIMBSoiWgxE8lDaeERyzf2MMQH09YiN3pslBqVnlkzCp63u4m9a3Vi/SEEhWLzp+bozlt8ukkSNU5rdIwro6HsXIU9TBSMr7jWI7DYx6BEWEKAqKSzAHUGlpSnSVZq0q8jBISbQ+czDFm09zZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nvM7TNoa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E3YfRz5Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nvM7TNoa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E3YfRz5Q"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MJfi5S076239
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 06:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HBxtj80p1xDnsojAw8SdlQgeLCAPBPwH8UGD9BD0sqU=; b=nvM7TNoaRYQTeUT9
	OCtZuWjAR4FqmkksGphpA/Cp4NvePQPHFw4zGjoNXl93F8bMLKwVnfe4rLDcrZhV
	nRvkBL+BF2HWdrgsmmnv2FGaD0g2qCRnTowoYRlBmhFnJxbuTte126TeABf6OTtt
	+f4niAyoxWqhQgUftWgQls3rIFmzGVebXwaHg0E+ZNQRAbuWfWvValmnhb4B3Gs7
	eyUnDLSK63JgcyPXU7f8rxPiuYNvueT15Hfka3q6uy68XuwEXxLKoRh+xP03w3jq
	poI20mPWAlSvVNxUZlF0KjKIzH+Y7JZ9Djd57XweWz4SNUgcZzZZqvShcWXFpKC3
	2n1mNA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kj1kw46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 06:20:05 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so2383893eec.1
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 23:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774246805; x=1774851605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HBxtj80p1xDnsojAw8SdlQgeLCAPBPwH8UGD9BD0sqU=;
        b=E3YfRz5QkHCPBccKE0F4o6eQ09T7qLX1lokK7nlfRgme8+AP6slBXRBB0ZfodK75ZT
         9KBHG5LJ30Tg0iuJoM7ZZg3YPmSCa/Oue2eIC0iqGje4bi7FV4RCvaqt2RzsDGZkDBOY
         fiGQQa4oLCr6kNU2zSMmp1hPjBBz2klC0NDUGL1rds90uuWG18Odp+pUz8668umBja+5
         96FdXwJG4kDvfdxu9u2Zv+XRsc+gyeM9JBBSl2opjv1V23Fj7bqEhORuHZK8YOfSRjCE
         fBKiek7o3xOBid3+9tGxVpC2T2kNZhekTZDmLP3uIy2cSi0xoFvacZGfib9URMaeICL9
         Cdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774246805; x=1774851605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HBxtj80p1xDnsojAw8SdlQgeLCAPBPwH8UGD9BD0sqU=;
        b=cZ3HBoqSeEGIxeIN0xU9x59FOQT/ZsD2mF+dclBF9vJTVZgmBQGKgRS9tOD+9JxGcw
         yKa2iFHewTQVlarqNtGNMriOQgXSQnDPS9MIEhZ+GnsXlUv0/J/L8xZccCHm0BsBMhB2
         kCqyuEq9cL1A4fliGEzwk7eP5IoB+BNDGE4Wzlsh8v02JONSLp2vNwTLeD4M8rJwwZ2i
         Nmw2H43eYBO2tLuXdyfasPKpve0TqJ2/CXC4GijlfLxVDfVQEFrHaJWoU4LBamZPfTsS
         ftGDJg43Q3WBdhEjc58nYSbd5UGm1jR9hb3t7ApfPHqQs4ALZyVoCj0UHoJxWFV6Q7fl
         0n0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqhheAqtvAFtDGy3JwirvlYknS8ogAwvpfqhuMKIZ+HHgdbDjRUt7M9o6Ivse/gSeOBQXMO10b0gXf@vger.kernel.org
X-Gm-Message-State: AOJu0YyLmLfgswkmiYuINXW7bRta1fP/ce+Scl77rdVirASM8ibJ0PAz
	69pF5limryUh65ZjC2MGFuafIxrybWoXcHfh46G5x0ttEi02u4g4gbnA87ANKmPUMJGEZ6THjqe
	GJAZpggIUUmcw5XAM5aRiQ9bu0Txwvp2NIcPXNhGzx099jfABG412kLjEBhROuwtT
X-Gm-Gg: ATEYQzzvKqF/PVx9+Zq8wXFiDmRISej87MI7ISgN+qY9Ayxsg572xyH+qsJO0D651sv
	DUlKlLtb2Ayj81LYJw4Qj1OV73GCcn99fLY6wutTHe6cbdjelHG7IdJgN9let9m8QXLoKcEsp4I
	O8ZjgOFzm0LRtkITpIiqn74veouW9RWaE3RorFBlMOLj1AEyME36Iyk4RqoiUpljV5bwz9Z6dAk
	KjQdTeXRmXNiIAuVVxuyvyxd/U7syg0aUhMh9OjtyQwqTwehFouCBhU4nIOyphNQO4jTr1jExFC
	4Q64DAG348+mzT4LJj9yIbRQIJwTmmMJRs8OWg+k54ESWJRI1QKr762iXutmjIQtWHBNEk8KjGy
	R6toYRpwXvjvK+IkcQDHEKYQOCxSLVB2GNBoM07oy6gx/yNbg/f9o4lmK1p+VCaAAsKCEsU5H
X-Received: by 2002:a05:7300:e788:b0:2c0:dea7:a03 with SMTP id 5a478bee46e88-2c1097ab203mr4408099eec.32.1774246804969;
        Sun, 22 Mar 2026 23:20:04 -0700 (PDT)
X-Received: by 2002:a05:7300:e788:b0:2c0:dea7:a03 with SMTP id 5a478bee46e88-2c1097ab203mr4408076eec.32.1774246804409;
        Sun, 22 Mar 2026 23:20:04 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c985sm11389751eec.2.2026.03.22.23.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 23:20:04 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 22 Mar 2026 23:19:42 -0700
Subject: [PATCH 2/6] arm64: dts: qcom: kaanapali-mtp: Add PMIC support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260322-knp-pmic-dt-v1-2-70bc40ea4428@oss.qualcomm.com>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
In-Reply-To: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774246801; l=3720;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=SvSnW70Sb9tWX5TuvFgft189d6cWJVAOHmqQa4Eukjw=;
 b=fJqbwWyaNsR1hRnl9DoSN5vwcpd/+0BZqPxCbXsZBFYWv7UOq6BQt3ICyorTiL92fnDt5Dw1B
 pUDS872JS2PCnBrgSILFxKmudYiWbkljhfnPa84ObrEFNqSDuYP7Mjc
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: uEebb4JVQOOQfWyL6n-FRxLt0Vq_YGEU
X-Proofpoint-ORIG-GUID: uEebb4JVQOOQfWyL6n-FRxLt0Vq_YGEU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA0NiBTYWx0ZWRfX6zgRz3WkQhY4
 kXXZ8200ivAlfRLbm6kSwnHvEyfLFOO2hyxAjqTYBmeXtJv+kagGJ4IEAGyeqF0LMoxeb4vK6lq
 Z1xyd+r1NBjFZBr79qwaUq9oT2heEjbA/NHSglNQa3XJ4ANDAAeYa/v8O0Ha+cO5E9IYTxsydFw
 QjkbzjmJcvtw7g+UDq51TfWtUD1U00jdxtt00z/F4BRSknNfBUdEOucAlgXfft2s3/9L8JHkNU7
 hYnG5SDJ4NYbmPplzSlfcAqwLpCZsHFOVqrisVIuvYqetJ85ZU31gWbtHN7vc7e8iSe2TvS0MIR
 9r4GHEmkPdzsIzgvfxQAqF+zQ+Oq/0OuyLfV+18ndgSI2m1nmVm1muMrlzmuz867Kg7iIQ13Bxe
 dn5vmoD2R99ztjlF4mGtf7as0WTJbO+ALrwzXx6gfO/Dg7BAQJerQaPyK0pkyFwXbeohPPuZSEP
 VPOfh73zgQMw4MOcAgg==
X-Authority-Analysis: v=2.4 cv=dYiNHHXe c=1 sm=1 tr=0 ts=69c0db95 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yaPpH3l5qGelCYd3kQ0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230046

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Include PMIC files used on Kaanapali MTP boards. Add configurations for
keys (volume up and volume down), RGB LEDs and flash LEDs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 92 ++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index bc57935c042c..5054c5933687 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -5,9 +5,21 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "kaanapali.dtsi"
 
+#include "pm8010-kaanapali.dtsi"     /* SPMI1: SID-12/13   */
+#include "pmd8028-kaanapali.dtsi"    /* SPMI1: SID-4       */
+#include "pmh0101.dtsi"              /* SPMI0: SID-1       */
+#include "pmh0104-kaanapali.dtsi"    /* SPMI1: SID-9       */
+#include "pmh0110-kaanapali.dtsi"    /* SPMI0: SID-3/5/6/8 */
+#include "pmih0108-kaanapali.dtsi"   /* SPMI1: SID-7       */
+#include "pmk8850.dtsi"              /* SPMI0: SID-0       */
+#include "pmr735d-kaanapali.dtsi"    /* SPMI1: SID-10      */
+
 / {
 	model = "Qualcomm Technologies, Inc. Kaanapali MTP";
 	compatible = "qcom,kaanapali-mtp", "qcom,kaanapali";
@@ -53,6 +65,22 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 		};
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_vol_up_default>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
 	sound {
 		compatible = "qcom,kaanapali-sndcard", "qcom,sm8450-sndcard";
 		model = "Kaanapali-MTP";
@@ -801,6 +829,63 @@ &pcie_port0 {
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
 };
 
+&pmh0101_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		function-enumerator = <0>;
+		color = <LED_COLOR_ID_YELLOW>;
+		led-sources = <1>, <4>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <2000000>;
+		flash-max-timeout-us = <1280000>;
+	};
+
+	led-1 {
+		function = LED_FUNCTION_FLASH;
+		function-enumerator = <1>;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <2>, <3>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <2000000>;
+		flash-max-timeout-us = <1280000>;
+	};
+};
+
+&pmh0101_pwm {
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@2 {
+			reg = <2>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/kaanapali/adsp.mbn",
 			"qcom/kaanapali/adsp_dtb.mbn";
@@ -940,6 +1025,13 @@ spkr_1_sd_n_active: spkr-1-sd-n-active-state {
 		bias-disable;
 	};
 
+	key_vol_up_default: key-vol-up-default-state {
+		pins = "gpio101";
+		function = "gpio";
+		output-disable;
+		bias-pull-up;
+	};
+
 	pcie0_default_state: pcie0-default-state {
 		perst-n-pins {
 			pins = "gpio102";

-- 
2.25.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590784;
	b=WjDdG1/BqB8z092H0jDLpUD7FAg8pexy5rs6L7WSPj4MxlIH1b6noWpwgI7plZ/bCtnQ
	 iYQ41nEgS+Yobq9Fz0tHH6WDideTF3p7TrDdJFWoK8VC6O+cGmUJ+R/mL8R+NaOVvUrGo
	 FSB491129moaMXoAv9pZGsCDKVW4hO7Um3i0dAHqDHTftj08ovEfA7LrtiMjtdo+j5gFt
	 FsJMNQFITkolboYuGXlkH/G+LciADFNFEM+NntFUDAsxfBiJPqG3g1zp3UqwJlT7GjUF2
	 cjn1I0R54jXyMfCOxBQsbpKtgor+wU/KQ0qBfcGNcK8cY9RMa8g//wVkfVxIsk6kTBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590784;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gPjw1xtHWAs/xNDsXrmoiy6x8JhonHhuXCnUR8V7CdQ=;
	b=eG9EnPLQsD8C/ytjGiBIuiAfVhxBHTO/wx5g44DVa2IprEYCo6ldHS9nHcaPdFPqaHXT
	 9VK/BfA4+PKb8/FP5MofRUmJEOflkwX9i5nhdMA+9GjQSKDy6lwlgRWjKoiZi468rlRUI
	 rqDnrwGD+YR8JMZ7huyShWhCPsUD0tSgWjAi6CaqJSjF8G5lX0MUtZ0iY4DVf8O2uKVjS
	 V0azdZIFZjNRfWKatxCi6ItTiUbKJPRcuD+6g5hz8lGRmYhXqz2FZ3B5Hlkd7GFj5VDd7
	 2vO59v3STtcTPZ+tWm0bYsOBXronHy0CdtS/hZ/g8F22JXkaA3Gu2BQOUr4U3GBgFoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XZKG9h3Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eCYmTRJP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C01606A697
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 07:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82C01606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XZKG9h3Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eCYmTRJP
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68YAE3534220
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 07:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gPjw1xtHWAs/xNDsXrmoiy6x8JhonHhuXCnUR8V7CdQ=; b=XZKG9h3QWx0Vs/q+
	rbWbLtDn5gCVC6sWbVEjzhVRxaanfckBgqEqUL5Yg82g66QAnzQIJosS7MaDTRRB
	pQj3C8cZg7IOKhohGXIdssLf5cY9w4jg+3E1nXdpQguzJw1ssDqpL5bnT6UmduTH
	/3K8Jj6fp8CZu+Glx7fYWY0TLQXZbYnHnt4UROezU7jbEyOqu2BK9eIG9gxGX4LC
	O7BUJB6QGEUgVrdNKZVSO3cWsD0D5cbBHNo3lTr0Hkf9yy7zQNc7h7fgEa+TnD81
	sEZsBpT3xBDpcwAbxgB0ogj/Gr06Ad5wM2P2g3cc3DZJ7z1BkWu+iKCLHW29soV6
	duqfrg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbhbqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 07:12:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so3420843a12.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 23:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795590778; x=1796195578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPjw1xtHWAs/xNDsXrmoiy6x8JhonHhuXCnUR8V7CdQ=;
        b=eCYmTRJP6YVkwWqHVk3xMT3qqHiLECzkmd/HYpEqPEEgfq86BuwFA+sO+zuMypW2/a
         kHcQX6TLBCe0i6224dJ9Fx6PO2ZZpTMr6McvmYfXcNPbkP4ggakD9vGCUiUNwi/ZKLMm
         s6fq1xK0sk7zqkz3yQ+/Dt8BVofKFlXLlmCnR7ZZNF0HYE4P3ELYe/ulqmdGOOc4aleI
         Ju7cZOS12QgR65ACMCZ7ZA1eViigYT9wOplmJZ5zRuxHMC9Ndlv5dZB6hii2S+ItMsv7
         mae7nUvZjttepPeNG6ymph/zL4NcUSS3CiOYYvIBKINFMn6XHYl1cP5KBlZrrMNnfW7r
         dGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590778; x=1796195578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPjw1xtHWAs/xNDsXrmoiy6x8JhonHhuXCnUR8V7CdQ=;
        b=oTGE20M9MAmi1O7XCgYIdlUzIGOD7lH58NCDidNCp6tCu+fybccTUBLCA2D31NH3vE
         tyR4isNLCa7N4f6lz2SHAuHYsRK8fgUwdx72FaV/BT8n3YcKHpaNpJKyvmU04FeKHVPa
         Ta+ZTTSKiLkE1c8VHO/WiRHqqrL9CYm0C8Sk3NynzTkpt94juhlUWCtq0OdChq7Rf3Fg
         1NLYlk/OZLMtmDRhEg3TaV/BmHg+x5qz64OIr2Yctv47LotA9DaBzN6idpyc/A6Ume2s
         H7wfbQyRh6on51avygEE4csPzaXJQdf8K+zMuxEnjWv5hdNxXr0C51U4fvB5k0Ihq9Tv
         WAuQ==
X-Forwarded-Encrypted: i=1; AL+hErG7xSdFS0S/bi95LTM6cIyZ2jxzOEQrIcNrQd8fzjO/T+Jdx+DXeUd59GrkCa6g4Mqcvff6Q0R3rLT5@vger.kernel.org
X-Gm-Message-State: APuU4Z9lhnck0YYJ0DwLhYvpZx0PFzQLJWDKxn1ZMCiz2TlU+NGL4FYs
	CIkfBYLsdHzVfbnFcwjkAckQTy7TSvv1Z2pYQ//GvRecenORttsL6op//O26yQojVk0dNyzk4XV
	2Mr2Uaa9jJArhWiLNcj/fscfmUn+uGp0Na2Xi1WUlx01ZMFuxnhE8Kv4XgEck654T
X-Gm-Gg: AZFdTZf5hFtq4opnl0Ew5/ulv2+40kkK/O7ImkdseaqN0v+DW1Z+eT3e9IfdjDbC1C3
	K2MhsVrw/zgtF/1VmrrILg6/19gSAMZqzsIupTNOcMvYbRIiEodr00HDSP0qfqA2rurRbKE5rG9
	DeOlgzm/aku1oyccNhI061nInaEXGxB1Lg1a4F4J7AqCqM2D/cmkCPS90tn3xzfP7C15ieG7xNq
	T44iuJqfC1sE/6pQGR0/7VvSK2V/HC4Uq5fn8QQepYqR4+f9IxbuhPTtrGj/I3gClm5mSFY8SBh
	Sp2qjxqQGOsGAsqxzSA5klFNoVI/hUs6isfz/RXcBCM2lz1FOUJ5LWXXhKoY1tsk1QG0N4KByDZ
	c3hsVWG9BcV946ucINmt0YxaJd4QgcH5rVjTWC063K26ZLI2Z0qfRWYtst7WHzUPK15apU0I=
X-Received: by 2002:a05:6a21:3a41:b0:3e1:9071:acb6 with SMTP id adf61e73a8af0-4014c257439mr18382586637.46.1795590777963;
        Tue, 24 Nov 2026 23:12:57 -0800 (PST)
X-Received: by 2002:a05:6a21:3a41:b0:3e1:9071:acb6 with SMTP id adf61e73a8af0-4014c257439mr18382549637.46.1795590777455;
        Tue, 24 Nov 2026 23:12:57 -0800 (PST)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0575d9sm8224496a12.25.2026.11.24.23.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:12:57 -0800 (PST)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:42:42 +0530
Subject: [PATCH v4 2/3] arm64: dts: qcom: talos: Add Talos Lyra EVK SoM
 platform
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
Message-Id: <20261125-talos-lyra-evk-v2-v4-2-73d768714a5a@oss.qualcomm.com>
References: <20261125-talos-lyra-evk-v2-v4-0-73d768714a5a@oss.qualcomm.com>
In-Reply-To: <20261125-talos-lyra-evk-v2-v4-0-73d768714a5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Sayali Lokhande <sayalil@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyOCBTYWx0ZWRfX3tbY6nGafjOI
 fTFEMfarrLHINSjtkRAsmbjo+hH45M6clJg7NSMwuDUUyTquMqXK3q5Cxku/cATHMVUGtit1Vg6
 kgg2tMoyo6mu9JYRR7opvexHN9QUBrk=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b068a7a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=mHhvTSb-yjX7SZNcwzIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyOCBTYWx0ZWRfX+A3hlcUJOkZX
 /kIPQZP1MlbZr/WsH5enwOxeedvgNU9/nsEahaBI84qqJGtFLuRC40DkqMdTOPcQFuus7BKPAXP
 9RSCTbhQQmlwl3SNmbvJuAE2c4d3j9x+WKA4pbeqyrN5swlQ1kP1sE8NnYKpq3DMKVoBaFxsxf7
 LrZMdU/WYMRYtGQdkXCdkaAWhHEc0IrbMHb51Dhd6FWOfRfxUX2dBFth4M9obW7ZgJoHXBt8hTk
 sBCWj7/ePGeq5mC4ER6uVkJl4cd4bYlYMlIk8127HKVMaHqWqReZ35bRjsBxyVAadqRmn1Dky0L
 MhZWrWb/ytks2OKLhoIlwy4LRsp8h5WnivW5JlujFOQL9j0FN+fXEjGlhX6HGnhicwOlRd0QsvY
 HXU3y7QiawJSFsqmZB0ybQlS535FLpCJBDVZ2CgyxBlY7FU+T2gBZ00AEBtePHEBDQOxR458Z1D
 oInBB1IK7moyDZV7G5g==
X-Proofpoint-ORIG-GUID: gPnjHUg__qAScVnJzxnz2Dvkl7OeQnAo
X-Proofpoint-GUID: gPnjHUg__qAScVnJzxnz2Dvkl7OeQnAo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250028

From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

Introduce the device tree for the QCS615-based Talos Lyra EVK SoM.
Lyra EVK SoM is a compact compute module integrating the QCS615 SoC,
PMIC, and essential connectivity, designed to mount on carrier boards.

The initial SoM device tree includes basic support for:

- CPU and memory
- PMIC and board-level regulators
- UFS and SD card storage
- QUPv3 (I2C/SPI/UART) instances
- ADSP/CDSP remoteprocs
- GPU
- QSPI SPI-NOR flash
- EEPROM (atmel,24c256) with nvmem-layout on i2c5

Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Co-developed-by: Sayali Lokhande <sayalil@qti.qualcomm.com>
Signed-off-by: Sayali Lokhande <sayalil@qti.qualcomm.com>
Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi | 311 +++++++++++++++++++++++
 1 file changed, 311 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
new file mode 100644
index 000000000000..94bf2e73889a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
@@ -0,0 +1,311 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "talos.dtsi"
+#include "pm8150.dtsi"
+/ {
+	aliases {
+		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+
+		xo_board_clk: xo-board-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8150-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_s4a: smps4 {
+			regulator-name = "vreg_s4a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1829000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1a: ldo1 {
+			regulator-name = "vreg_l1a";
+			regulator-min-microvolt = <856000>;
+			regulator-max-microvolt = <856000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2a: ldo2 {
+			regulator-name = "vreg_l2a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3a: ldo3 {
+			regulator-name = "vreg_l3a";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1248000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a: ldo5 {
+			regulator-name = "vreg_l5a";
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <975000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a: ldo7 {
+			regulator-name = "vreg_l7a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a: ldo8 {
+			regulator-name = "vreg_l8a";
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1350000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10a: ldo10 {
+			regulator-name = "vreg_l10a";
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11a: ldo11 {
+			regulator-name = "vreg_l11a";
+			regulator-min-microvolt = <1232000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12a: ldo12 {
+			regulator-name = "vreg_l12a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1890000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13a: ldo13 {
+			regulator-name = "vreg_l13a";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3230000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15a: ldo15 {
+			regulator-name = "vreg_l15a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16a: ldo16 {
+			regulator-name = "vreg_l16a";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17a: ldo17 {
+			regulator-name = "vreg_l17a";
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs615/a612_zap.mbn";
+};
+
+&i2c5 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c256";
+		reg = <0x50>;
+		pagesize = <64>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+	};
+};
+
+&qspi {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <25000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/qcs615/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/qcs615/cdsp.mbn";
+
+	status = "okay";
+};
+
+&sdhc_1 {
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+	pinctrl-names = "default", "sleep";
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	vmmc-supply = <&vreg_l17a>;
+	vqmmc-supply = <&vreg_s4a>;
+	non-removable;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	pinctrl-0 = <&sdc2_state_on>;
+	pinctrl-1 = <&sdc2_state_off>;
+	pinctrl-names = "default", "sleep";
+	bus-width = <4>;
+	cd-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&vreg_l10a>;
+	vqmmc-supply = <&vreg_l2a>;
+
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 123 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l17a>;
+	vcc-max-microamp = <600000>;
+	vccq2-supply = <&vreg_s4a>;
+	vccq2-max-microamp = <600000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+	vdda-phy-dpdm-supply = <&vreg_l13a>;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+	vdda-phy-dpdm-supply = <&vreg_l13a>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+
+	status = "okay";
+};
+
+&usb_qmpphy_2 {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+
+	status = "okay";
+};

-- 
2.43.0


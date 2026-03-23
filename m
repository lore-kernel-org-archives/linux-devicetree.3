Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E431C2C3268
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 06:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774246807; cv=none; b=IgIbvuwsBLW8oV7sxi5nODgK3UBNE9d8ISJf9S1aoht9Zhy6YGZmxONl4ZVCwES5LCOnwvkga5SxU60hnnEVSgqPG3NC2wqRG63f9gTbf3AUzV26upyE16OgNc+7pB7a9mbnejN7ccTbBtbyhfdLGQMtJSUCPUpmDp1A9LWjKtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774246807; c=relaxed/simple;
	bh=6YGQeXXA3L2Rv9GWa+rDevWdk+8pJMoxQjexH4ZgFeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EFphf4TqZAMSB/2sDnHR1QJ8FoFSWzPG/lvJ4BMCD/oHklQdnzLPKS064Ffs0dacCD4aNJKyebPYqrFXzNToR8WoZUy6pcvpS68QCW97qvPWvACXzqlIA96IGP+NpdtZeioDrmBBQVu5fiSMe3FhqRRgRcQ4d05tE2hScfCQZWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJfXT1JD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YcvDR0px; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJfXT1JD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YcvDR0px"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MLrjlk1001396
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 06:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aa+CrjcCv4BPzFRCyFU+z+daiibqbJMtPs26p/eaicY=; b=nJfXT1JDGLkmS+0L
	eLcGS81RtId9utJw0mCyDVPdr2K4TbCSYQnMfTFXcFtFqK9jS4sNQiKDioH7+1Kx
	zcHZn9RzdIme/w5iTEVXe+OsKee0d9ozhFPPOmSzne2UJ1JTcsthUkujc5hIylTQ
	p+s1FG+Jj49m4vBW605f74sx2BRDALAZ8yV7hDKYW2gPjGUXy1OVd/lbKGmyDS0D
	e5/KGHR5NrzC9VayddcIgtt6/SvN3UzgSCiJTF6Aam3YUf0eSO+THeFXr6Mq1i9T
	DaTZW85seHeicYO1IRcKL3/Uu49Zt9moJMZzNYDdOPM+JhmrRvzKxLumMOLUoYLA
	Vcb+eA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1j9rc0q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 06:20:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so2383889eec.1
        for <devicetree@vger.kernel.org>; Sun, 22 Mar 2026 23:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774246805; x=1774851605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aa+CrjcCv4BPzFRCyFU+z+daiibqbJMtPs26p/eaicY=;
        b=YcvDR0pxP7jGuTOOxBpTQ/HQZc98PQH+lDJEw2OjF5OqCeR537nw8kiBxhaTQy1nr2
         +jeeCwhZPsFuic7gg0dXSvuBCxXrn26G/6jqNXuXM0VQCdeIzqUOUw0LwuuoTpHi3+5c
         QiCnocE7m46ZsOPFgmGXwsQzLgkeL9yrfmozlcFBrJwBGy1aYoq572hOB2wUfym7tbX6
         /pBk8FQNU9+1Nni1Q4V0U9q8LrZagHHymX7YLrudNb+5G1N3LJz618txE6Um9I0vJrnV
         jWpMOpW6Y0fM+wjAGDiTmGkulqh0BVIaWARGpm68v3xLkliC9D2e155d3dzM1xq7KLFZ
         ioCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774246805; x=1774851605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Aa+CrjcCv4BPzFRCyFU+z+daiibqbJMtPs26p/eaicY=;
        b=nyZWvoa7Vu4pvMeyH6tclJiKlmKWl9HHfNHrYL4/as/JjGQYuM3+rYyAMLM1ug0ze9
         nj2e1QPYpXTQTKFsOgswRDlmSHiTmpddmAJ95sOcqCAow8IiTeQ7CYNCncraEZvOfhIk
         LQy1XDIeCUuTArB05LIpHG9QZzRD8mL3qoGgse/GDCnhE6J5Q93SKle/jCHlr9CwX2Ir
         zNM9pqFfQW19JWW+1ZU3Oksw2Ph2Vm0s6uSQT8WDjZJflAjeBIS7LnR7emM0Pn/7Rqb/
         PqERpuHGZAtANGmLesDw22qILw9HXhAgK+JS8eXofyYmCT24/3AhQMtb7ZYlzcUleA0q
         TD/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUKBci3qtjUYoZz9HAqjNg6KIZPw3C0JSbAgOAV36GJ9n+FqPNhkpq4sojZpPUr0rpcW0XlUTGNn1m@vger.kernel.org
X-Gm-Message-State: AOJu0YwG7Yzo4OBKq04Bp85h6esGpQSLepsKxh3ca4eMJuuACYyScoXA
	S45RAit5HeIy8POifgliNCjCK2OfI/xnymcG6k+3p95MiZwObmjVerug7Do9ruN6/SKmkWcqgCj
	94zRlaChnQJ6sdkK9zUbMZjUMhZM/YMRqZCrne3hjoLZ+WWEWWw1ybM4LcQu7k84i
X-Gm-Gg: ATEYQzwnrh3ofuCriWmOM3MADYZR3EUCWNIGCKuLwx9Do6zd55b+ngoYftGXT0VwkpC
	mNT3ommQLItJGDMXmDhTmKJYmDs1aZ1suQI5qgFAft1GPuPbdQ6rM6ZlkRpUJOTYRqPfvH9lEFl
	TDPzeoTCy2iSoe5+q/0efUsr5kuON4yx2RZLd5hQtYN/SmE7UQC107cJthxGs8RI4BXVBezez0R
	bp/LLL5v6mi8HaHlYUZMBjQ1l4xrQ2aH2yhfjH6CjabD6Np4r3FZr3wA9U6BEmgxdUea1jFovlh
	QbvrC/m/9Fp5YE7DtNb3wIRNb+AqXrub3SBAOvjPTze95dxT7pY8AwMjeU5qqVr32UqjDzNxZKH
	zmOpw6wyRQj++Ln9vHhWHHrEA7aHL/sN1imTN2vJWn5T+aGnBSxRAhZhkSbP2M1hPe1Mvs2uW
X-Received: by 2002:a05:7300:2318:b0:2c0:c754:cd86 with SMTP id 5a478bee46e88-2c1093d166bmr4254904eec.0.1774246804215;
        Sun, 22 Mar 2026 23:20:04 -0700 (PDT)
X-Received: by 2002:a05:7300:2318:b0:2c0:c754:cd86 with SMTP id 5a478bee46e88-2c1093d166bmr4254894eec.0.1774246803562;
        Sun, 22 Mar 2026 23:20:03 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c985sm11389751eec.2.2026.03.22.23.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 23:20:03 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 22 Mar 2026 23:19:41 -0700
Subject: [PATCH 1/6] arm64: dts: qcom: kaanapali: Add PMIC devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260322-knp-pmic-dt-v1-1-70bc40ea4428@oss.qualcomm.com>
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
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774246801; l=16546;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=37fDihGdeRigBUzrYy2lmvQ4AgFn5Lzlq2yB7+qZV9U=;
 b=5+Mab14OtCv2Ud8iLeNiNerODwEt8Xn1BBwKVZ8W1WwICcVZRYjkHh1F1Um/Ah9TeTT7a59ej
 vs+7VayaTQqCtOwJMMB55nQ1VaRlIeW1tWSCWcM4JddonJ2IRGAKDsl
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: pk-i0yKHSfz-D5OYalJB559F4UWpqAeF
X-Authority-Analysis: v=2.4 cv=ZPDaWH7b c=1 sm=1 tr=0 ts=69c0db95 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ozNiz_YJmLBSDaAKB-YA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA0NiBTYWx0ZWRfX+urZ15qmKe58
 AdyoyS8NCMKpwwCiV7uxCk3pkr8GQ6XSg3vQhM9yymdX8vf8ilPd2zDx+NraKJP/F5knWo9+Osd
 kxQHc0+xJ1lK3HCiTy3bpHU7YTppcS9D6/ws7TGAo0pdQXRh7hYiZ66ui07dtoOL9P3URgzcbuU
 AyVcCMEmQf/B7mBEbTdwMbROJsT1586gs28hgBSe5RBKC1nQJmHSj5rEKfx1Md9QBxBKtTLLjJz
 5cgWih04NgKWBIs5m+aFuNZniuTQQY/4KUt4NLLT9XF3O/eLMhT3UZRK+mSYSwYVaRciFMktCZ9
 q19N5FryMrqSCR19KDpTnIGgYFuttmjcHwZFP2oUoGfp1Ok4mTrOmagxeBGQhu9l/XfjqW/Z8Rv
 Vp44pZ3nP9ctWbI4+unzTlV4FKZ7wnVXqdZKEKbxi4oxymAVzQWtMOTNG5wI+7v+GJ2Qttc8TvL
 7ksqm73IFx/jso6bUAQ==
X-Proofpoint-GUID: pk-i0yKHSfz-D5OYalJB559F4UWpqAeF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230046

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Add a spmi-pmic-arb device for the SPMI PMIC arbiter found on Kaanapali.
It has two subnodes corresponding to the SPMI0 bus controller and the
SPMI1 bus controller.

Also add dtsi files for PMH0104, PMH0110, PMD8028, PMIH0108, PMR735D
and PM8010 along with temp-alarm and GPIO nodes under them, which are
needed on Kaanapali.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi          |  47 +++++
 arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi   |  93 ++++++++++
 arch/arm64/boot/dts/qcom/pmd8028-kaanapali.dtsi  |  62 +++++++
 arch/arm64/boot/dts/qcom/pmh0104-kaanapali.dtsi  |  63 +++++++
 arch/arm64/boot/dts/qcom/pmh0110-kaanapali.dtsi  | 213 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi |  68 ++++++++
 arch/arm64/boot/dts/qcom/pmr735d-kaanapali.dtsi  |  63 +++++++
 7 files changed, 609 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 54d6c235e1b1..f0de06b2c20b 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3316,6 +3316,53 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			#clock-cells = <0>;
 		};
 
+		arbiter@c400000 {
+			compatible = "qcom,kaanapali-spmi-pmic-arb", "qcom,glymur-spmi-pmic-arb";
+			reg = <0x0 0x0c400000 0x0 0x3000>,
+			      <0x0 0x0c900000 0x0 0x400000>,
+			      <0x0 0x0c4c0000 0x0 0x400000>,
+			      <0x0 0x0c403000 0x0 0x8000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "chnl_map";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+
+			spmi_bus0: spmi@c426000 {
+				reg = <0x0 0x0c426000 0x0 0x4000>,
+				      <0x0 0x0c8c0000 0x0 0x10000>,
+				      <0x0 0x0c42a000 0x0 0x8000>;
+				reg-names = "cnfg",
+					    "intr",
+					    "chnl_owner";
+				interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "periph_irq";
+				interrupt-controller;
+				#interrupt-cells = <4>;
+				#address-cells = <2>;
+				#size-cells = <0>;
+			};
+
+			spmi_bus1: spmi@c437000 {
+				reg = <0x0 0x0c437000 0x0 0x4000>,
+				      <0x0 0x0c8d0000 0x0 0x10000>,
+				      <0x0 0x0c43b000 0x0 0x8000>;
+				reg-names = "cnfg",
+					    "intr",
+					    "chnl_owner";
+				interrupts-extended = <&pdc 3 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "periph_irq";
+				interrupt-controller;
+				#interrupt-cells = <4>;
+				#address-cells = <2>;
+				#size-cells = <0>;
+			};
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,kaanapali-tlmm";
 			reg = <0x0 0x0f100000 0x0 0x300000>;
diff --git a/arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi
new file mode 100644
index 000000000000..bfc58a6589d3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pm8010-m-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm8010_m_e1_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pm8010-n-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm8010_n_e1_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus1 {
+	pm8010_m_e1: pmic@c {
+		compatible = "qcom,pm8010", "qcom,spmi-pmic";
+		reg = <0xc SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8010_m_e1_temp_alarm: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0xc 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+	};
+
+	pm8010_n_e1: pmic@d {
+		compatible = "qcom,pm8010", "qcom,spmi-pmic";
+		reg = <0xd SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8010_n_e1_temp_alarm: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0xd 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pmd8028-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pmd8028-kaanapali.dtsi
new file mode 100644
index 000000000000..db4dc16a66e7
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmd8028-kaanapali.dtsi
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pmd8028-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmd8028_e1_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus1 {
+	pmd8028_e1: pmic@4 {
+		compatible = "qcom,pmd8028", "qcom,spmi-pmic";
+		reg = <0x4 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmd8028_e1_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmd8028_e1_gpios: gpio@8800 {
+			compatible = "qcom,pmd8028-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmd8028_e1_gpios 0 0 4>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pmh0104-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pmh0104-kaanapali.dtsi
new file mode 100644
index 000000000000..d009c9a9f59e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmh0104-kaanapali.dtsi
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pmh0104-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmh0104_j_e1_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus1 {
+	pmh0104_j_e1: pmic@9 {
+		compatible = "qcom,pmh0104", "qcom,spmi-pmic";
+		reg = <0x9 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmh0104_j_e1_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x9 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmh0104_j_e1_gpios: gpio@8800 {
+			compatible = "qcom,pmh0104-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmh0104_j_e1_gpios 0 0 8>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pmh0110-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pmh0110-kaanapali.dtsi
new file mode 100644
index 000000000000..15d9cff246b3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmh0110-kaanapali.dtsi
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pmh0110-d-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmh0110_d_e0_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmh0110-f-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmh0110_f_e0_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmh0110-g-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmh0110_g_e0_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmh0110-i-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmh0110_i_e0_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus0 {
+	pmh0110_d_e0: pmic@3 {
+		compatible = "qcom,pmh0110", "qcom,spmi-pmic";
+		reg = <0x3 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmh0110_d_e0_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x3 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmh0110_d_e0_gpios: gpio@8800 {
+			compatible = "qcom,pmh0110-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmh0110_d_e0_gpios 0 0 14>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmh0110_f_e0: pmic@5 {
+		compatible = "qcom,pmh0110", "qcom,spmi-pmic";
+		reg = <0x5 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmh0110_f_e0_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x5 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmh0110_f_e0_gpios: gpio@8800 {
+			compatible = "qcom,pmh0110-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmh0110_f_e0_gpios 0 0 14>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmh0110_g_e0: pmic@6 {
+		compatible = "qcom,pmh0110", "qcom,spmi-pmic";
+		reg = <0x6 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmh0110_g_e0_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x6 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmh0110_g_e0_gpios: gpio@8800 {
+			compatible = "qcom,pmh0110-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmh0110_g_e0_gpios 0 0 14>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmh0110_i_e0: pmic@8 {
+		compatible = "qcom,pmh0110", "qcom,spmi-pmic";
+		reg = <0x8 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmh0110_i_e0_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x8 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmh0110_i_e0_gpios: gpio@8800 {
+			compatible = "qcom,pmh0110-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmh0110_i_e0_gpios 0 0 14>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
new file mode 100644
index 000000000000..b73b0e82c3d3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pmih0108-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&pmih0108_e1_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus1 {
+	pmih0108_e1: pmic@7 {
+		compatible = "qcom,pmih0108", "qcom,spmi-pmic";
+		reg = <0x7 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmih0108_e1_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x7 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmih0108_e1_gpios: gpio@8800 {
+			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmih0108_e1_gpios 0 0 18>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pmih0108_e1_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,pm8550b-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/pmr735d-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pmr735d-kaanapali.dtsi
new file mode 100644
index 000000000000..d0dd5e078cdc
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmr735d-kaanapali.dtsi
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pmr735d-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmr735d_e1_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus1 {
+	pmr735d_e1: pmic@a {
+		compatible = "qcom,pmr735d", "qcom,spmi-pmic";
+		reg = <0xa SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmr735d_e1_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0xa 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmr735d_e1_gpios: gpio@8800 {
+			compatible = "qcom,pmr735d-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmr735d_e1_gpios 0 0 2>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};

-- 
2.25.1


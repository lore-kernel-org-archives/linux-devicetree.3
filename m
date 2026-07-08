Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7006247F2E1
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 18:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783535149; cv=none; b=Ux012ckyrrq0hdj/zaKdoSTSwZ+MNBkuqva9ZxLNKPqCPoDIMFqD7DOLdKR4C19Lyc7PkF1RAMKe3Tc9OKpBIzVx6PUH+r3LpaZnpmAxHgrexaIxLxdZvXrd5FnLX+pjccPPi5xSg+rSYyvRRXDuqng1UZb5e5sIXncigL3LHHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783535149; c=relaxed/simple;
	bh=3K6L4c6OZp3Eul3Ri9W31RQJgrKQhggB3UWIGCxKmz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dGBevCfjvI2RtyPj1cRD1vHr7f8AxolTPjQiL7hLX9E7lB2pWJwGyZfeG8sDkqCWcCpGlgrAnNYR5+hu+EcUvAwybKK5xW0SKXdqm2lfysIVYqjhij9T20GNPVKVkEnyF+Wh5mEMxPj37A2lBl5D0P2rS7KePqfpbLLUUtdu6BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i37blsxS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AVNVHskQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i37blsxS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AVNVHskQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668ILjw93578740
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 18:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SBzV8i8B0VApk80w48yOX5U8XJD0eQ+y0RjEDHih1bQ=; b=i37blsxSEiIOBQl0
	o3rlLfUvYnTwH9VGRR4PxuJM5kdFFj9+JwdPns6MvYl/HTcR8VAoP8MMLSoSgUE2
	VPY/V1K6h++w7UVd6Bk4Y3RduBslVac9KTJTy7E8y65drVwgMvnYVTCKNQnXkxRx
	9a6DUCqeD57We9+EM+VL0PeYVctnZVUOtpnLi905uR1zfvLGQVKvEdM8E3FKLhSf
	haZkXg66CC7easFoXsGHG7mAPwYUDbPNR9CdUn2x4+iuc7EomVOdnwscKjYVZoCr
	+WsnU1oWyxwszDGb27DxW0uOVAmOMT9iOXM1Ed9KXyvLsOONXOdpl6OHNPGKmWPe
	AdPH7w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvr0fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 18:25:46 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso111296a12.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 11:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783535145; x=1784139945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SBzV8i8B0VApk80w48yOX5U8XJD0eQ+y0RjEDHih1bQ=;
        b=AVNVHskQwIR3pR0CvpcOhx513VVmDNXj7qQiBLvMXTDhdqA+KNhethIl5ia22FLJ3Y
         iqFrYjAfmBSAj0bnpPWWEnVwNyFqObauifTMQ4S5wzJMAnwHrX8CZWxjhuuharngTXyJ
         J8E7tG92L5Gys3GziKdVlsdfJWGtvcxgKs971Dfze1stkDlFa/miSjI2gQfqH9wE6tfD
         E5ZwGivWMua8kkyVTcw6PUVO7wfQlsDjyN+Ud7pD7RkKa+v3r/xC763Twhjvbw7/NXzw
         jtgc6MG9zFlG9mFjQh5zli4As7SwbgLXSBSustGT6NCPVSFRpAQm+8yCMyBCWbKoyCxs
         uOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783535145; x=1784139945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SBzV8i8B0VApk80w48yOX5U8XJD0eQ+y0RjEDHih1bQ=;
        b=D+qEWr7ZBjy6kWGHxSsFkMZEfPExOx2WWhduzR4Q4NYFb0pjcnzlFNm14xmJEg5q0p
         g1pjZ8Juv1bw8ZLCQ/PHZabn5Z920RgPqEuCp3Nr/50NgHEP7BsVlskhUXv05nuSy6Km
         +T7oSkHz4NA1C2/3YkHyQmKkfG1084iV1RYpOc4qxK7GPTKjXwGvehO/46P6Jl0+Ejr+
         T/TRsb6JVxHRE5Z/gYdpDNE5nJ9JFJYnbfqLaJbsmzTDZ7Q8aNTj55KftujnXgAysx3s
         xOOFE+9rAXxZHUPYQIsbVS8Je4/YVC3EW/0ngjaOnNkYfef6oV6ZQff6Fp5zAAfEvLuw
         jtSw==
X-Forwarded-Encrypted: i=1; AHgh+RoddEsxyLNQg73BVFHl1c/lWO5z/SzLFn/owvNlxwJ0REFYkbkdzWCz3Oy5udRxTxqoWQnw4Ub5HgmL@vger.kernel.org
X-Gm-Message-State: AOJu0YzT6Ml2NR0e2NyK/EJbKL/wmvqB7aTk9xSnGCP5BZ/XvECaoQzk
	n3p7N50wOcV7pt3h//AxZxSvPMyotRoemdVDgP7ag1DXRF7hHa8IWmhd2OKA2fQKd9fal4y5aCA
	BVdjpdNzcTaIQqZ+j/2IV6GvVMNWHAVFtjFTbTDOYQD9CGVtz7BmooCHNWwkw/jPn
X-Gm-Gg: AfdE7clgGjlS1VxD57jDXlbYrepQdLCU3/PFHU69ryzvWy5oy9qgGtdD5X6FCELoEVJ
	X/blMrRKDB3+e9JaHBJGkBGn7cRVf+cPrIV3lMFAO3ZxX7y6GqQTcdR4xmEj+MU3g14YvXoLYfR
	caRlqM8RokFUB5FwMHRSR45QWGRezt/YrC0xVnkRfmY1ye7WU1pHNDm0AlVMUYYDfjHTWIHzIuH
	Lm2v3zKnEQI7xgHbwUZBbI83+rkr1hAoZ0/K8QkD9/mGVWZ/WJP/q+GRTRdXC9wJMPypJeqaLPa
	MOrH9FAb1HBUOQS8B+Ov1dPkYvXVHFYx7YihVXUI+OPIA454bU6UHGbmcYfdBrtw+GFFCXFAPl5
	q4J1wUFK9r6Kw8RlG9VfH3MkGc21anla0J9FDwleh0A==
X-Received: by 2002:a05:6a21:62c8:b0:3bf:aa1a:d2ef with SMTP id adf61e73a8af0-3c0bd164cd0mr4158488637.56.1783535145403;
        Wed, 08 Jul 2026 11:25:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:62c8:b0:3bf:aa1a:d2ef with SMTP id adf61e73a8af0-3c0bd164cd0mr4158449637.56.1783535144873;
        Wed, 08 Jul 2026 11:25:44 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d5946sm2671098a12.7.2026.07.08.11.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 11:25:44 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 23:55:08 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE3OSBTYWx0ZWRfX2nUKPymHhv3N
 ip9bNmeKomZ8KlxPqg1bYjYpRBdag9sB3y6VB3DoIIvvZIl0Z1AIK8VXcBYe9nK4piXB+Ds+5+u
 qjX/EdujCqLdPSiBCACp4X16brqL/iU=
X-Proofpoint-GUID: P25iG5htF_NsyYVopA-IJYMvCjbwiOXU
X-Proofpoint-ORIG-GUID: P25iG5htF_NsyYVopA-IJYMvCjbwiOXU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE3OSBTYWx0ZWRfX5mznqULYkte5
 sEmVuzlVQPOuroVi2b9taijRNZrR4TEZ/RDvGcFXW8qM8dtij6VoygokFLlDiXU+oM5XDMXI4h9
 n0KehMrlkHg54m4SLJQAPdF1pKd7tHEh9VnmOeFOFuzgIC5ojcC7Q7LzEJUifh4KL44unqXMxvb
 mtm3EDxfa2tAC0CkUdnyoiVeWt3fceRHWO9SC2ppDiBb+3KttZfyWLEOBWh7hq8lB//RbCY8LAH
 14tEMsceBBnkkvrF5v525Tohef4B0qquqSY1IQaVjjL6tU2iC9JXIJcguHLVH+aeJeHECYRSlWb
 brJt2hFZUO/KO9ICTBLQRRQGYnqyFcenf+WYVzzzWj3U7DAQ7RB9KCtbBCcSeEV/7BAe7BYDr15
 5aQX3w7kQyuyfZ+QIDcw/wwrtCf62e+Ft35Ps1tfu/w7efRfVCqrP4lgICT1wl8/M3+HgZxxiOv
 Rh7wbQszvs6lQShjjwg==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4e962a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=3-fpjux48RbdSrvt_gcA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080179

Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
differs across Shikra variants based on Audio subsystem enablement as
follows:
- CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
are required to be supported on HLOS.
- CQS variant: The QAIF driver runs on the Modem, and required clocks are
handled on Modem, so from HLOS only resets are needed.
- IQS variant: no soundwire codes, hence no clocks/resets are needed.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  8 ++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  4 ++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 18 ++++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c34d371f5ac23efe59d1c9d2723f4..2d56182a6aeb3c36f525fc32dba7fbcd75103984 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,14 @@ chosen {
 	};
 };
 
+&audiocorecc {
+	status = "okay";
+};
+
+&audiocore_csr {
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7aed3121ef092df684b19a4de39b497..46e1d8b718af30c095b2535eb4f7fa6e60157c2b 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,10 @@ chosen {
 	};
 };
 
+&audiocore_csr {
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..c008a836251fcf96e8376bfd3fc17ee994e7250f 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
@@ -640,6 +641,23 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		audiocorecc: clock-controller@a0a0000 {
+			compatible = "qcom,shikra-audiocorecc";
+			reg = <0x0 0x0a0a0000 0x0 0x10000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&sleep_clk>,
+				 <0>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
+		audiocore_csr: reset-controller@a0b4000 {
+			compatible = "qcom,shikra-audiocore-csr";
+			reg = <0x0 0x0a0b4000 0x0 0x1000>;
+			#reset-cells = <1>;
+			status = "disabled";
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1


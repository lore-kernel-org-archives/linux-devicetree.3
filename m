Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FDF41DE0B
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377579; cv=none; b=KLl6QnsobG0S6FM1Kyy5mnx14EkfnjqU3iCH15PxJp4Q7MpY/KFfpclDadUW2vohnSMUxUI2phvCl20Lp7vboGmqCOslnQlloLrZ+8J7SIE2A562H7Ub66nIVTbCsm5BjE4+5k+e1BmmFekZNN21aI/5I9GTPG/RzbfElgGVktM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377579; c=relaxed/simple;
	bh=fSkX8OdWeU3pGfO7HStszCZC77NkQlbmjVVlJRK3mGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uKpr8G4db/tk3mPnCwivy3gEO3WRmpgjZPrNhsYTS2fnbcXE/vybUDCdUnwakM1cjCSKvpvUfPVmyCmR4EF5sMLJbaXIXeF3+oOTLDBLImY0KivyhmQUlCYjUZ3FEgH/ktfg5UVU26sCunolky2Vu0LYfRFfFiDU9wQdelI7DEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfpSF1tS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IwgRIl+O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfpSF1tS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IwgRIl+O"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E7xxAi3490234
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNx/6t9Rj1wnxnTLwWUAone+ovr1xkhVB37Ez8gD+tM=; b=gfpSF1tSe+WqvACW
	L8OZmT7uijrA4+iaMzag+y3X6e7qCDWy6/rjLQBBozCE3U21KitUth+vmPFp79sG
	vvdtfysEv51NRX861hQrpFQu1PEFOUx2B/REc4gMvKR+aYI0Yr1SPBJFUAbNUYCh
	AXje1CZEN/sNgzyr49a+WjpzCwb3HyY7SPR5zEA1Qv2xyZscX+O/L6A0Tw6thnXM
	KDVxRd8cB9gXXbr1h0IkE8AWcJCjfhtAv/dHFXS0QsMpd6usOjenBrsARKkQ0feF
	OhesFe3JGPQBpKPVNiD7E0EVBHCHMWLDnT/3IQDX27dLD1SiqN8l6aWXcg8H+ssN
	BY305w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f08q3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 09:19:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1c1910b2cso322487a12.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 02:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789377574; x=1789982374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FNx/6t9Rj1wnxnTLwWUAone+ovr1xkhVB37Ez8gD+tM=;
        b=IwgRIl+OhZ+w7WVnSZi0PdMNUQoApJP/QsIB1NyJjI/GH3NZeZxirKF46F/F6ZXK0V
         cME4KviTPHMqSByfC/SmgiTG4hpc1vroZcENtEfmmQpXnPPYvn0sRt+nWgnFRjst9OmO
         Pm31WbhfnV6IEPi+hf2HEljHBxF/xs0m+zVIdREC8fIFZoSNlki1en37GJK9iolZnpF+
         SzQS0Lz7c0zolXI0azpXZKyMB7o7AleJtX22w7dWU93jtkM/WzUKtDlf9nIz3ioObY6G
         0Z2aiWtj28GmtIRuBYEM2vlVucDBMQEP3uHXOvKly6JNLsIUlLlY0nrL5Rc2BpvBKLFF
         os0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377574; x=1789982374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNx/6t9Rj1wnxnTLwWUAone+ovr1xkhVB37Ez8gD+tM=;
        b=EWV/rN2GxY341EpjB/7WJLSFlOy4Iu4t3Gw//NmTTrbJKGKeWvHDdVKpWXGUM2dT9j
         VkHZKXZ+qER6ovGa5IBTxYuLhjRs+3VabjH7MSRFdkrKFaANrecwXMTS2GlZYl02BOC3
         weh2Oqh4eJZeww16oq009u7HvsWDk4fRLVVgyV6dcO7L11SYFN9R/kSWSJ+7RD4zPDJp
         xbKdsQdD7JrXNk7jXksKsk7rJvNGndtRrp/QD5k5p8PB7FeS3YZROoTt7q8LKRawRY0s
         2UGL+YbLR4QDkN7VY6BHElwDcQcXRTPJhkwD7hvEV0AGjf5U0vckymy7uJPxHpXhVoNM
         sJzA==
X-Forwarded-Encrypted: i=1; AKwUvBxSnzfBeXABp6KVVZJKIi8FwGtV2zmynH00dSM76AW7K9/KjH8iZiCqCqO7EjHL7chGdxydnYddaNL8@vger.kernel.org
X-Gm-Message-State: AFuF++kEI67D6wvRst5vPedMNrI7J3bt0xGLfyJPQAzQftOHdxtllkiB
	YkIuMZSEi351Sw1k+f2V7LryeDbJ2v+WevZva0yCTpIimwyOoe6eSW3kXQJxBa2DR2XY7wM/dU1
	bqQGFEjgKLnDSx7svB7WNN7T2C0JQYOJIYcerrK+SMQMXRaNHDYjvC6skQctm4i2/mVzkdjWn
X-Gm-Gg: AYBFou2RTYDfZ+WJlZV29pK1M7QOwWlCkTKRoWUJ2wjY71kVuDk12IO3hznPK9P+C5I
	JIAa9jwizocwC7zYqS79h2/g9GBYKiQzRhtNrhqe7DaZor3G0qqkRmCtcJjUvJSqZa7Ku/iNbKy
	fZdIsRIsszvtDQm18gwWvZ4E4KvoeM5qkt6lQMij6TTRs50Skf242jLApw3pUWnBAaN/3DahEbY
	EgHxb9akxvm2rV50ulKS8qEpumrcJjQO2phsOBRYoxk3pMXOhAUtsU7bPHV6C3GAyDrgcuFSVIM
	8OTZ7Oc4S3IFTBy86fVbKtnCSoot04Kr1Wjq8yLxEKFsWsHh3+oQeJyVA6UBhd6X2cpFXLgln5Y
	Y173CuMICEq2ufAJmlY2CMOc=
X-Received: by 2002:a17:90b:4a82:b0:398:a2e4:c784 with SMTP id 98e67ed59e1d1-39debf7303fmr2476837a91.1.1789377573875;
        Mon, 14 Sep 2026 02:19:33 -0700 (PDT)
X-Received: by 2002:a17:90b:4a82:b0:398:a2e4:c784 with SMTP id 98e67ed59e1d1-39debf7303fmr2476812a91.1.1789377573491;
        Mon, 14 Sep 2026 02:19:33 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4b1f409sm29416837eec.0.2026.09.14.02.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:19:33 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:49:14 +0530
Subject: [PATCH v4 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-monaco-evk-m2-v1-v4-2-dab83b048d03@oss.qualcomm.com>
References: <20260914-b4-monaco-evk-m2-v1-v4-0-dab83b048d03@oss.qualcomm.com>
In-Reply-To: <20260914-b4-monaco-evk-m2-v1-v4-0-dab83b048d03@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: r1WixnutNhJFXCTUX7Nr6LdgeNGKla_W
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzMSBTYWx0ZWRfX8h4Vjxw+HEoL
 pC9fNrRJjfTUG+Jg29ekkIBqhtsfV7B+cOOWmI8fWwgmxPQOzH2y1gckkkKkwoapMN4nI/7OlFK
 Ryab/4GXv3TUBuWFtKG8YJ9IjXuq3QY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzMSBTYWx0ZWRfXyvETf09V2HMr
 hWrwdeCxPxA5sFFKybZ3dtDjqCWILs+/D59MB5+sua6BrYJ+4O4rx/k/d+MjIxuLqh1EVVs2Tto
 5v6nfVoKil9EyAacvdDUgPRvDAMKNAf65mwWOBO/inT07tv1hcWOrAomZYwGZGR7WBf3fQOc2mb
 bP05zTePLglwdJXiVZRESzDI+znF9Vmc4ShFVnT4V+PjeW6aoV755AIJvvyOqHlNv0Jemi924Er
 uqkiy861S+TmNLzwSPXM5pMn/J07ddQvbqZ6YWyuBGXSijW7rMN6vjG00jcsNJTun+/a8NVBA5N
 vzsnd/2ogVNT2pgkd4hLTGNbrGEMzChr78MYlPO32dMGg4fJGJuK/gU0naYvTsrRGmDCv7OTeeO
 xW9ccg9vnGTYrl1SbU53yQDkCQ18WPX+t4c+bhCGSU/u5X5UZRLjRsAseHCNDZQWzb/PjpxjiKS
 cItkuvpU+H9xlwx3aHg==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7bc26 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rHbtwcfoZ064LjEFTuMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: r1WixnutNhJFXCTUX7Nr6LdgeNGKla_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140131

The monaco EVK has a PCIe M.2 Mechanical Key E connector to connect
wireless connectivity cards over PCIe and UART interfaces. Hence,
describe the connector node and link it with the PCIe 0 Root Port and
UART2 nodes through graph port/endpoint.

The port/endpoint nodes are defined inline in the board file rather
than as empty anchor nodes in the SoC DTSI, so that
of_graph_is_present() only returns true for boards that have an M.2
Key E connector present, preventing unintended pwrseq probe on boards
with soldered wireless chips (e.g. qcs8300-ride).

The connector's 3.3V supply is described as a fixed always-on regulator
(vreg_wcn_3p3), which is required by the pcie-m2-e-connector binding.

Also add the serial1 = &uart2 alias, which is required for the
Bluetooth serdev device to be enumerated on the UART2 interface.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 60 +++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..2228946a05c1 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -21,6 +21,7 @@ aliases {
 		ethernet0 = &ethernet0;
 		i2c1 = &i2c1;
 		serial0 = &uart7;
+		serial1 = &uart2;
 		serial2 = &uart6;
 	};
 
@@ -47,6 +48,38 @@ usb2_con_hs_ep: endpoint {
 		};
 	};
 
+	connector-3 {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_wcn_3p3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcieport0_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart2_ep>;
+				};
+			};
+		};
+	};
+
 	dmic: audio-codec-0 {
 		compatible = "dmic-codec";
 		#sound-dai-cells = <0>;
@@ -91,6 +124,17 @@ usb2_vbus: regulator-usb2-vbus {
 		enable-active-high;
 	};
 
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	sound {
 		compatible = "qcom,qcs8275-sndcard";
 		model = "MONACO-EVK";
@@ -644,6 +688,12 @@ &pcie1_phy {
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+
+	port {
+		pcieport0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
 };
 
 &pcieport1 {
@@ -862,6 +912,16 @@ expander4_int: expander4-int-state {
 	};
 };
 
+&uart2 {
+	status = "okay";
+
+	port {
+		uart2_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};
+
 &uart6 {
 	status = "okay";
 };

-- 
2.34.1


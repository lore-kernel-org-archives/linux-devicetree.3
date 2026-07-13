Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913803815FA
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924471; cv=none; b=JA5tmhA15x9Be+7mhfHw6lrvAG1vdQaz0oHklJibqnDh1UKl5pA/V71Y+YUeXSTcgLj1S3ihIeeOIkXrc8+N1LoPiSdfxlIWjsBYe7EtBDY4Y+iAGOPuzlZv+7YujkLhoEaZ1lsT7AYHffJNP8wDb/nHHFH4os733eVQCN0onkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924471; c=relaxed/simple;
	bh=brxIpqPCyyj1oaN+qhNvUDOdACfPrZSmd2/JBPBe7vo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DFeuBXc2cQItS/x8tlymGhldTOZyyzMF3Mi1b1piCArnE78Xx9Os446BqJlQHscqV/4O4TFhRVx9E0+pOdXYXSkQoCK69sNlA7ca+bZLYHVN9Tf7kivfVWBdk8uXkJ9tPonRLj5RYLIUlD/puUSYlVDb/mCRXLbmCm36aOw0eKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jR5UZPQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMlhBFmg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jR5UZPQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EMlhBFmg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NmJM507315
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0U+O3fwdDfUgf/oZd5O3M9qxqUrf8zH1/Xr/udfAXo=; b=jR5UZPQT+yIjdhNQ
	ncFjAMAU4Ka0GYcfL3zQ0Bh0yVOPIYOFu7/JVpwXOhVpXBLrzgrgcwG8iQuhlh7a
	v929PiGtR+RRxHR4ANAM6Y88dbYFi1kuqgoMrMhidJIBlfrJUVhnv75iwUltnExm
	ofSHGrEUY//RIpfzmThXYiIjoK0eqM4E59/aEuw5ViPMJ5F7UK2WlGDZLM5L6n/l
	XYjHoEnu4TleJ2Ga/B/nSnHjhCnSNYDJpxsqp7/PkXxjbaHzdBmp6dHdWvWSeb8q
	ti3D8hTXJCLF9fFRRLAh3xsydNIa5ZxCc3Nrz22YXpsNyQiTNQdRMIycwgTpAZKx
	xoPbJw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8g4we-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:34:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso4714295a12.1
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 23:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783924394; x=1784529194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U0U+O3fwdDfUgf/oZd5O3M9qxqUrf8zH1/Xr/udfAXo=;
        b=EMlhBFmgdLW7MaXyMlb+2ZsZHGrkOuRYB5zUuM5VDgZpy4bpFTI6DqxhEWj3Ok00Gg
         nI2A6wIkV1T4xqT4xHwEEaYrD7k87cvMG78WIPCnoa2Mg3+oE4gUKy/fQ2tfoP+P5Utk
         csWBIEpmtFfVzhT7FvyOv6NcD004NxC2cnnt6b2vET1KUkjas5Deg7hfS/3GuJdDIpMU
         qKbDfuyrevGhshpw/3AxckNgVGRKJ51liJbkvDDXIizsaVznkjTF0mXA1NjkfFV6aVKy
         uThN9B6Ln8dwhVZeAP4zlfULWDloNtmeNqXLwsIJ5kKRO0WU+Ydt9YL6kpPeox5hWlCw
         oMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924394; x=1784529194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U0U+O3fwdDfUgf/oZd5O3M9qxqUrf8zH1/Xr/udfAXo=;
        b=SJZb7LtopClgYktbCg4QJnkFWg2HcWzxzl9asbjZ6sIAmgBUygiy/jk7g1x5nSbdQQ
         rT+XpHxwSGw+gDCSEWAECkJ9a63BBPnYCs/1CkM4Ezv1GtJldoNNFkZkag3WSD1cjnDT
         tHEdrnwZX2ypEgMiMMVAQNDJt9mKjYTOSLH7R5kCCF1PJuO9Y6Nw1lX5ig1iFedhpzEk
         75a5CDTyvzGxYrTO6n/WoTkEeIGoUlRmK9NEePhiqg3SKhPqTg4XHliUDlsKSMuXURDH
         aRARKpawdXOBHPpcZa+2+YkV5KBUwx6okcf2S2DUjulvNScHY1Gj6coL9v/3+XfZoo5i
         /OcA==
X-Forwarded-Encrypted: i=1; AHgh+RpSmJH351Mzfb4BV3dn3sjeV2D9Rwt3PmCgC2fMsg/XLJHMX2t8i+0kZD90fIODEE8vVxK/cX0aKLyc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4CiFhUU1dUhCSpNjyBXAjCB3eqgp91v6K0bLDIBXVacOAiJT3
	/+AUYgxVmSH4DqvnIW2AyY8R4t7MLABCfjgEPNQmbXGWRZq5ohj/Q9mqq0Rl7vcBkqabe51hMcC
	gYe//UrDpIhUvIXWOVYoEGyEopEdSNhMaa7tmy6dEHso/X17S9FLCfeAoLU8C8Bi4
X-Gm-Gg: AfdE7clWN++AJ8lMxe8hHNtr1WjizE5E1wuMiPHad656mwfKC05OrcNaynAd76x6/uC
	xzCdlECkg3nRpwX5fMme78fNf4CJYLO3c68yF7GyU8d85UnCNW00NFreSmKkEBAoqZgPfM8wAUT
	hfqD16Rq9/YM2gqzOe9y3ddBAeMxjIFuAK3iS1336DVopF6XVR24Bjvz3Usc/abCkiVlKgXbi0g
	9D+1FfE2U7njOl+HACDgeFyUNXCm3ragmZN9tAZjzNSjbxPBofaJw0AD9FVRlQc4128iM3X4XnX
	WER9VRJWsZ+gjOn7p/qEDCqgyjCCOVvF1QHl6ZlbGNazbrzQAspaiAPdrqo/JisvswqU2gob7LU
	bXD1a+DjzSTbX3Yj8xsicYyS1t89JnCGowMkSqNb3zkeexuQtgY83J5+YKtztZiIBlykjIVIvDS
	5yQChL8VUYW9YnCiNi+2l4NaZDw6MXG6n78h/iBQde
X-Received: by 2002:a05:6a20:12d0:b0:3bf:c223:4640 with SMTP id adf61e73a8af0-3c110acc806mr8297029637.32.1783924394438;
        Sun, 12 Jul 2026 23:33:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d0:b0:3bf:c223:4640 with SMTP id adf61e73a8af0-3c110acc806mr8296997637.32.1783924393861;
        Sun, 12 Jul 2026 23:33:13 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm25435361c88.6.2026.07.12.23.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:33:13 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:02:22 +0530
Subject: [PATCH v13 6/6] arm64: dts: qcom: ipq9574: add nodes to bring up
 q6
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-rproc-v13-6-41011cbcda3e@oss.qualcomm.com>
References: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
In-Reply-To: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: HQRcFKegtt4KnxKibfxvFTUMuj1qTvNE
X-Proofpoint-ORIG-GUID: HQRcFKegtt4KnxKibfxvFTUMuj1qTvNE
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a5486f4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=VFxxlfVBB3dI8x85gZMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX83FEkChhbk+s
 QlhyFdFbclFjNUBojfF2WkqamJ9QsrFDfORvA640R/WEtdJtSwAKPf83yMu6vZ4ffJU7g2YJvlt
 kQ8+5f4vIDj5Szx8NzO1HQWYHX/qSEc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX+cts1crlnyrk
 9Ipdcyi+iTD6pdu3iwL0MiwHS7rFLpIhtxKMxzDwwc42XFeicKCkzAm9XgBrDsFay6O2yLc0etp
 ELsyRike2NbKefH4IwOAh5mhnTeKfcw4CcISfS8TyDogogdT2ttYqtWgh8uVLCnRb32C4W0wans
 JztS+k+qZQ2hotCkN314bf04CItAIFpe4RaSlDhmr1V1BUBDbKPrQxUFLRe/DPvCWRzL1b0kjjt
 B0YFqUKXNNbvgcLiJHVGJBeTrODfd7vzRuDY3rmZFf0TeCXRk03CoFbsohrjCOQXMyTOQDCYvEp
 bt24imlXMMqvYWOdZ4Qvw5yf34aQZiy86Ek1J9mVukUwP0L/7YAyk/7UhbcQAXlfQ84ysYMVC4I
 CEu78LKC5fFIkaUHNlGjs18BDOBBfzYJiR8jJG/HXn+RDajfou3hlg4aL4DLzOl+f4qn6u2JatL
 XkBcrYnD2m8o9Brs1Vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130066

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 60 ++++++++++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 451c2076f6a7..fd9fd801eb98 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -3,7 +3,7 @@
  * IPQ9574 SoC device tree source
  *
  * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2025, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
@@ -222,6 +222,35 @@ smem@4aa00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+		q6_region: wcss@4ab00000 {
+			reg = <0x0 0x4ab00000 0x0 0x2b00000>;
+			no-map;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 322 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		smp2p_wcss_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_wcss_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc: soc@0 {
@@ -924,6 +953,35 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq9574-wcss-sec-pil";
+			reg = <0x0cd00000 0x10000>;
+			firmware-name = "ath11k/IPQ9574/hw1.0/q6_fw.mbn";
+			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			qcom,smem-states = <&smp2p_wcss_out 1>,
+					   <&smp2p_wcss_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@10000000 {
 			compatible = "qcom,pcie-ipq9574";
 			reg = <0x10000000 0xf1d>,

-- 
2.34.1


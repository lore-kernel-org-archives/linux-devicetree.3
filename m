Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D8D3B27F0
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783665595; cv=none; b=V31JiEoiT/g6nIXYQDDAztyC41HuzJFy05oFyst6ItUE3jtkkOapbzQwOk/8OKNAA0zWZBZWoWESK8Gn6d2Ajk5U4zAXglJUHQaokakVUXtgcuhcOdhnN7m/inx7FNA4ei4r9EYlARk3tWnGm3lbqYoK0PuftfMsVG7DjvCGTfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783665595; c=relaxed/simple;
	bh=uIKuN2DhESGYYTSnWLEE+bvH28nd60e+rRXXW3rLDZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IDzmkBBOpl9i+TUoTl92vSf4BEmJRjhcJ1HyXz0+f+rdA1wGihDS8SH+kxDnFpgTjrxoeB1La8MNwcQslv8/36U1EWKqgSVSg8ym+R4NT/vlQ7WI33B+RVlJVDcDb35OVaBnyIp9+CfmWezkKoSVNk0U7yp2tisUs89rzpILhIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fy163lwy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HtJ//J/D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fy163lwy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HtJ//J/D"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3n18F3722077
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tpTDJUt/VZMP2HnF71tbN+Re+WLiYWZrbfb4/qMHWNc=; b=fy163lwy+GS4k5xh
	bYymREjX7aaH5R37PxuPYMS+/Ki/jtCWFJ6AIo7y5vP71DOZ8i/eJRe9ot/bqHcW
	a8xdeu7YpFkaYAK7lSjvIvvYmct/a06PaeRsf5bOOuzCc1CvRE1esHq+21IOUMN1
	z3EZvzAZsu5kcgJbjU5eXYVhPDDin1DKG12BisJH1UNw1Y8irRA0DRntVc2wGII9
	devdoLZFCCHCtS58uK/7V7lzhBijIvN6ZNn2xFyzXEhu1dAUbgngoIV1uR6GWPPN
	V6+57SAZkIIUdt9XD+buvfqWadEzNo3tNeMaqNTYScZUizpF3tnO7/jcQliImxAp
	TuKBFA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajwt9r31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 06:39:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so942487a12.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 23:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783665592; x=1784270392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpTDJUt/VZMP2HnF71tbN+Re+WLiYWZrbfb4/qMHWNc=;
        b=HtJ//J/DCPvMyog7Lwg/4NDAH6TMuUpfwMQrOP1Bo8mKdarxUnxzCM01TzWQdCHhcQ
         sngLA4L772sRlXRn1WKx1cYt948WpzaGoUrmdfqTqlT6l5+0Jj2GRArMO2oR9VAOlT90
         yrO8Rlo6wyXDvtbsPXZJvDqfjvvNk4OlAN19D84y1D2/hQ+O1oTznQjO5fUjl57SKxC6
         ho9fkDLIyFmKEwWTWP81dOFQXjmUHoNHiZOPQCJXcfY8KkfkgTgnSXGDO82dm9N4o3XO
         9tKXgaHpRXucQgpFNc2pWDB6JpxdpRfFJIj2yXbhNLMxPpwEPYrYMuFnKTGQb2MJW5y2
         dyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783665592; x=1784270392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpTDJUt/VZMP2HnF71tbN+Re+WLiYWZrbfb4/qMHWNc=;
        b=A4shwTv8plwbIPHHz+5lH2zRPhOfMKtbS7e2rEHBGvaaSE7lpyY3BeE/7kIXckBY1Q
         bzTS2zDRbraymdyeVNYkG6EIr6NP1EH/Irn9NdFXEZd9CLBYS7TAij/ymCtlHe5DCfM/
         dm4Km/jCv3pNbC42zWI+N40M4nE7KMqtyYTqNTChio7+m2sOD5WvPqQRP6SqyvuqGAAI
         tRndv34hzwWcMqm/xTNbuoWdLuAUuZMVQT5pRI1ZBPcp9tJLBql4/pgVxyJ0KejrmzhS
         HLbi0HMXxTOCD+8zfSCyr+fl+nLvlRQR6H3z1f7UmVMe5AAmtCMXXfz8Ve0DbipY3A1V
         bYyg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8E5DNSjWpHjQYRu5e8z9VxrV0VhAnjqFuGD1F5S5LimJthtK4nwj7b49M8V2Y1LrDO8YmHg+vCjgq@vger.kernel.org
X-Gm-Message-State: AOJu0YxB7JisDD1JWVKml6I8H+PzB/6BhCbxTcPrVwaghmrz1INOHbiH
	n6H4FVcEHHPXDlpeu1nr9aiQ1bOX2DBFh61YL67og1X08mPvzeOwe5YZ+o4x9scFvDo110ZDhFg
	43c1zF1j6jrTA+cpqESeMlmVEQrX0o23tKCXL+0UiWNuO0DFW2jyZy+xgukw/oH6B
X-Gm-Gg: AfdE7cnk8Zo7rQS3LMAEniWIqPbLBRx0w1xTFA5AHYxmLzsxzK3A16/kyhH/D+fv/ma
	Lzxmi15206GPqWAjam6jhh+UPcJ7H1eo8LXFAIcvmGB8K6ai7cqnsDDIvvWLQLUcVU6+RGLFcNS
	+wdNZthESIDs/9L4GOxFSHZsrV6v+QJuMOLQmeienoTRF9pyhwrW7lgaPCJu/ZlN+TpTcKC9B9i
	KfxBhbOVRECLtg0JnhA+hWCf8zPRnxyTYT5C0k1zXV77GdjjYjeeIuQR/CyGS+plm0E30FXDoeN
	q6L/Yu6AgcVtMR8337mhZhz4EUAwxTCObm2lZsEaHLsG8uVY++iS/D7L50+pV+h8V5gDDIvO+hj
	ORm7Cb1BS5NM6dzZbBCVQI6v4iErxlF/MVpC9/er3SRQKeVzyhfM7Qv4jN/T3
X-Received: by 2002:a05:6a20:a123:b0:3bf:97e8:a026 with SMTP id adf61e73a8af0-3c0bced45eamr12612786637.25.1783665591633;
        Thu, 09 Jul 2026 23:39:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:a123:b0:3bf:97e8:a026 with SMTP id adf61e73a8af0-3c0bced45eamr12612757637.25.1783665591150;
        Thu, 09 Jul 2026 23:39:51 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313af819732sm3578090eec.16.2026.07.09.23.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:39:50 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 23:39:45 -0700
Subject: [PATCH v6 4/4] arm64: dts: qcom: add SoCCP DT node for Glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-glymur-soccp-v6-4-16f70227547d@oss.qualcomm.com>
References: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
In-Reply-To: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783665586; l=2804;
 i=ananthu.cv@oss.qualcomm.com; s=20260327; h=from:subject:message-id;
 bh=GuTuG7Z8xppC3L/Jo0WpEG16+Uij7ANSxrp2vi6Xp50=;
 b=DgflpKW8sSQw++S91xTR8dJ8xziNWrOytCBtRhTUOMKYtoAZUUt89aJQZvQbAgYQXqYUgx+aE
 3lpEyPqYx76BGFs0ETy1spU+EcQ+ozcxosFViUau+tq+l7J1WnCm1a6
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=Yyv4ldZGagB5zyqtlYRdUX/L9FZ6y/INQAXO9L3wfl4=
X-Authority-Analysis: v=2.4 cv=XOYAjwhE c=1 sm=1 tr=0 ts=6a5093b8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VnJQUHybGrZeNF6u4BcA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: _oV4MgbWMgvhVUqDT5Yj137AfLd-H-kT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfX+WlyUdat72Uy
 ho9iGFxnDDKpwghe08TzohYFoKUr0DH759r9PX8VzpB/MwncGHXqG/uhOyIt6ChQfvSdMBT8zzt
 lPDGi2Hhzzml0xeskIeAy+5NJPtmiy0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2MiBTYWx0ZWRfX63RbiRDqA/zo
 VnyLe1S6z9UXhqmdbLCCadiVv1lwGuypa4+KmmPMv4Wcv+y3nwaJXPkE7CdG+6Wrvarblg6DS3z
 LEt0Bw1CW87x1DHk3+jH1FZMamYCjy0r/4ylSmiFtMCC8fiBpBWhP5nxKlvY0CAXS4KkewTzBoT
 xgl16o2xGL9EFz8WWhR8VvXsCeGURe/JKhNYtiK+jiAM2erGUBX8UJaVBS4jEMs0u5ls1EXaH0V
 EnWhimPxide/8C/OxCZ8R+NVPMq96wOgpc4sN8NyDf40QMxtAq52mdXrgT5k2Y/jv6QgmdS5qwL
 7lhRgnzPygjuEwtwvSFQuaKIcY3A6YiH5lRKXeMdnPpo9njYpz98nq3pXXWHH11cXv0pytgDEu3
 6XEoNYD3+1BlN1+uBk1XA3+e41ABRaOhmsELtVxDM7xGDKdzUGHIOfs2LEoETBiSmpGRrqtThjh
 CicxxR489QqpVHJvkDg==
X-Proofpoint-ORIG-GUID: _oV4MgbWMgvhVUqDT5Yj137AfLd-H-kT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100062

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

The SoC Control Processor (SoCCP) is a small RISC-V MCU that controls
USB Type-C, battery charging, and various other functions on Qualcomm SoCs.

Add the nodes required to enable SoCCP on Glymur/Mahua SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  5 ++++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 44 ++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..d728478f0a11 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -585,6 +585,11 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/glymur/soccp.mbn",
+			"qcom/glymur/soccp_dtb.mbn";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
 			       <10 2>, /* OOB UART */
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 9ec7c256b80a..f4569d49dedc 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2297,6 +2297,50 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		remoteproc_soccp: remoteproc@d00000 {
+			compatible = "qcom,glymur-soccp-pas";
+			reg = <0x0 0x00d00000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "pong";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>;
+			power-domain-names = "cx",
+					     "mx";
+
+			memory-region = <&soccp_mem>,
+					<&soccpdtb_mem>;
+
+			qcom,smem-states = <&soccp_smp2p_out 0>,
+					   <&soccp_smp2p_out 8>;
+			qcom,smem-state-names = "stop",
+						"ping";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_MPROC_SOCCP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				qcom,remote-pid = <19>;
+				label = "soccp";
+			};
+		};
+
 		usb_hs_phy: phy@fa0000 {
 			compatible = "qcom,glymur-m31-eusb2-phy",
 				     "qcom,sm8750-m31-eusb2-phy";

-- 
2.43.0


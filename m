Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F39332ED55
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043946; cv=none; b=P+GtNF1FDqH/ETLBTZSTpug6a6FgV9/E29CUTGPwVkefpM+263TRhpDhzJ8a1s2MTl2WsxSmV/LH3HCid6fAAUrJFgPlo2p6+iH7DiIjvo5QtzzP+fRL9VJOT4OZTSVRqCrd7AVKoG/I36X8WWKoSSvvfVmdBP6J/ZnsGe4ApgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043946; c=relaxed/simple;
	bh=lhWUtyxtSb9+AzL65uMEepXGAnX5bvba2sh50dD2gk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kKLzG80GE2Vd6l0ik74MeW7PUMXzH44cv9as4aYH788TBWjhQFHx4CXnRyT9z5uJqyTuOp0l4N0Rb2wPcHYidoobnSC1RbURqXpE1KE+fVXDSsTBkIm6cNCrsmVqPfR/zNWc0/8YI+MP19nTqtQ9Ooi7yspOd0AF0z1LhXL0ZZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WDYOjk3u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bTQXyn45; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WDYOjk3u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bTQXyn45"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BPcM547386
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6Pk7pb43Qvq+nmHrc2yfkX
	ZNK2t7qCsLr1PmUWZP4O4=; b=WDYOjk3uH0o5j4aLNXTYQgaL27FvjW8RcKvSpF
	yWpX7K8NEQp8A9P28hNokIeQBQEJ4hxT6oI82d4e+8uLyuZU/6qLo9g/jy+8xn1A
	9t/32uIPCDA0DEitCvSdRTFOgs3iwTO9RvzEiDexTken+LSFakrDJB8LkoJkKpg1
	9oADHck8QUarPjE6PbVoj3PrOriptdLqBvsbN7Pnsbmik8lnaZ60xOq2vzxCv9zj
	t0GdLlKEGzbBC9T9nC9a97fZSrW7sPJ6Wpd+BWz3GHRcTiuUkppvpYiMtI1hnSjI
	r/v5OAOvQPLvVD7akxZ7SX9neE5V0dzTW3lHgNBXfBPIuFSA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p16u1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:05:42 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84f7002f9afso3862384b3a.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787043942; x=1787648742; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6Pk7pb43Qvq+nmHrc2yfkXZNK2t7qCsLr1PmUWZP4O4=;
        b=bTQXyn450BArdovxOVIV8da+VIUaYDt5WQmCwMfHMG6K4/+wJkDFjToiu/VW7w8XBj
         Gkf22BhGtNUAqsDuEN089p+x3Zco12GwOalBNZWTcM70eSnU6vlSeGW47+NQrIjlhiEb
         RbYZtAfzA9ntEYJs9n5rdslaorDzmacb7dNoh4fbKDdgb/vArwC5uniycQGKM2l+yAjT
         2WrTgeEuRpQDT8Q50yGRijfQC97uIh6NOlriekeCYS/t59RZbd77HwpabawMu72R2PB1
         AlRkFarixa6FvTkdF2dBa/XLDzufCPuhGVA0eSKZARZbwi+3wJkY+RWuSbA0CfaYQuH+
         Dbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043942; x=1787648742;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6Pk7pb43Qvq+nmHrc2yfkXZNK2t7qCsLr1PmUWZP4O4=;
        b=r1CNgfGtHrcHiNTS+NVsiMitxkOxeJI7Qgyh6pSY+/DDqKH5KHfTWILN91AEStVXeu
         F9qFK6DMZxfavRpLf31zLJ+M97UcAQtpSIEgV8xDshQICNaDl0Z+q6uHkI1CAsxRA/LF
         mu9dDYUH8GTUb56p4oql2jboWm0zceNC6ElWHiKrmD6UW2YzuZlZmZEKbzXJlDZ6ynbZ
         vajfLNP0Ob585gfX4HqsYC+ImDXVWH4Z9AeKdVa27gQOPn7/UlpBO+tqhw4lliwmknpJ
         mOA2xHonvPTsSxuytE66PxgjKtyeCbFZ2sNjh3K/MdiXcbkFNBK+Mtl5RBf04QClCCy/
         oeXQ==
X-Forwarded-Encrypted: i=1; AHgh+RoSttR596FDEYF+/QTnjoyXgqxhqsiuJQXWoW8BeAPj3lRwQmP2MPCBNVziqEsm2XjEJN+VR0wZiqM5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5CRt/uY4N4sw1dhSaaMG8ReZTUvBdSF3qXXcxm0Cii6Dsu6Ao
	Qjlt1mhPQwC9Qo5aCGFhh7WPUwWZvhf1MzW0lI6Fg0NFy8TJHMTskcOKFj0CGGLN0d8oRYEB5Dl
	frNixtwvRP1GDRSK4+hB5pIAuplhGKfv8zKKT1rt6YkDPMKL7yNod3iaod9GTA8hd
X-Gm-Gg: AR+sD11s2Od6dwmY7JpscOXwnS9uKEqIX38c6bhZeUH1YUik2kD4aGLZMUiZu8eBBOp
	JtLE6UOBHYPOEMeyi84111sk2ps7tzUJXgobUQ7uZGH12aS+nrC71ozk4pvlICaqopApDlagLyx
	8lxnDJ9Ns2v5GMwRkNneFbcNw8aSEWfKuuZ8XIQMEkfsG0AkzsCB7LPQvFQCcyPQAFHmIVQM94F
	e6FRygfYM8ufphDGVfsYhjTQ1VvYDXKTNodG9zPoPFYv7v9qWHWAgIJgYkBxlhT1ukHMbqyNulG
	8NkuY2SaIV+k/hQNXQ8wW1Y4h1a1q5qvP0+QqFrzdhwhr3F3CIklrU/+reu4gu7RGtKZ97F9Vf6
	j4km/xkGehykgb+VsGMGV9sSBLd2WJ+zWhxW8py45MXTdHucXw7tXst+GuJSQtr4LLLtAyw==
X-Received: by 2002:a05:6a00:4648:b0:847:97a4:d6b3 with SMTP id d2e1a72fcca58-84fde2363b3mr32808350b3a.16.1787043941902;
        Tue, 18 Aug 2026 02:05:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:4648:b0:847:97a4:d6b3 with SMTP id d2e1a72fcca58-84fde2363b3mr32808196b3a.16.1787043941370;
        Tue, 18 Aug 2026 02:05:41 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b404f349sm1514442b3a.24.2026.08.18.02.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:05:40 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:35:26 +0530
Subject: [PATCH] arm64: dts: qcom: shikra-cqs/cqm: Add Type-C support on
 primary controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-pm4125_typec_changes-v1-1-6e6ede93db19@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFYghGoC/y2N2QqDMBBFf0Xy3EgSl1gppf9RRKIda9q6ZYy0i
 P/euMAwcOHce2aCYDQgSb2ZGJg06q51gZ88UtaqfQLVD5eJYCJmCRe0b0Iuonz89VDmO4JUSHa
 Oo4IFYRITV+0NVPq7zd6zPaMtXlCO69ZBGBis8407RhpAVJsv9S6HjlOLBcVav42ik1yPURkFc
 BZJFUgFtw7RH6z6lF3T+O5dSbYsf+4px8PWAAAA
X-Change-ID: 20260812-pm4125_typec_changes-270965b03486
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787043937; l=4140;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=lhWUtyxtSb9+AzL65uMEepXGAnX5bvba2sh50dD2gk0=;
 b=IQ/PJ4Bx++/kGaMZ+T/tXKhSzsw2z/oVUgqI/DaVcE+Ly7BEa1ZaMfE0RDOwCcvfumQn+4vtV
 MM5qct4DVPpA8rgEAWjpSn+okRSpJIckVC9rIpwcYzRMSb8GOal2nMR
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: VEbqE-D7HefhIQmsX4ABeArq9EkHEwJM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NiBTYWx0ZWRfXx9fexwlDLgc6
 IgJYfULU7moP3zPWfbT88zOgCJish1S+MNvr4rxtseBLVfASQLpkfONnv81hXEOQrhSLqfjrQY/
 56wjy2scNe+96uP3QaJuNbdUfSknTSg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NiBTYWx0ZWRfXw5xpgMjMAoRQ
 rtIpzO8jXNNuPF1RXU+9ftbx6y3x0plT3epTSEtcEihlxKXuMZtPJnQflHYnxnx0SLz5P9p7htl
 buSwAjXEGUvsd87rnvlt3YtO5GY+UOW2rakaTaWsvoStGR8v1QV9CPxWsNAYzGtdK1YF/Y9nWnw
 YeFekOKTvmgF/7HWDIa95ke5RQmFrD2tPu5cv8A/fW8q+jRIu+mdamtlxxSVVnvwZjxjazO6WzA
 +6zcMyMzMRUI7aUBm930VLIwdEo1LIkY7SPcLAv2e3dXv7WrxImvYCkQJ9AabqINuA9AhXOIGly
 F66/k1doASsrwOzhPtmxspR0Fpj5hnKC/jBTzVu3ICc1GhmGp2FL1td2yMH4swVEqwG2rz6K/EO
 um6oT/2E4ATEdnkUIt456vSugzlQqm7ScKEQXB3Pr/17r0lN6FIwNUicYagcxIrRkTZchYNp3vT
 lLnHPlk52nR4ZgEEVGw==
X-Proofpoint-ORIG-GUID: VEbqE-D7HefhIQmsX4ABeArq9EkHEwJM
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a842067 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FuVrwu6O1lqxZhQAOtgA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180066

On Shikra CQS/CQM platforms, usb role switching and Type-C orientation
switching for primary usb controller is handled by PM4125. Enable the
PM4125 Typec node and add remote endpoints appropriately.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
This series has been rebased on top of (acked series):
https://lore.kernel.org/all/20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  | 20 ++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 41 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  | 20 ++++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 3866ab8b0faa..286ea46d0c36 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,14 @@ chosen {
 	};
 };
 
+&pm4125_hs_in {
+	remote-endpoint = <&usb_1_dwc3_hs>;
+};
+
+&pm4125_ss_in {
+	remote-endpoint = <&usb_qmpphy_out>;
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -58,6 +66,14 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&usb_1 {
+	dr_mode = "otg";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pm4125_hs_in>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
@@ -73,6 +89,10 @@ &usb_qmpphy {
 	status = "okay";
 };
 
+&usb_qmpphy_out {
+	remote-endpoint = <&pm4125_ss_in>;
+};
+
 &usb_2_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 8ac42ff625a0..7c4be6294162 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -89,6 +89,47 @@ &pm8005_regulators {
 	status = "disabled";
 };
 
+&pm4125_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		self-powered;
+
+		vbus-supply = <&pm4125_vbus>;
+
+		typec-power-opmode = "default";
+		pd-disable;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				pm4125_hs_in: endpoint {
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				pm4125_ss_in: endpoint {
+				};
+			};
+		};
+	};
+};
+
+&pm4125_vbus {
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
+
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm2250-regulators";
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 34568f1c7b63..01400612d147 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,14 @@ chosen {
 	};
 };
 
+&pm4125_hs_in {
+	remote-endpoint = <&usb_1_dwc3_hs>;
+};
+
+&pm4125_ss_in {
+	remote-endpoint = <&usb_qmpphy_out>;
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -58,6 +66,14 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&usb_1 {
+	dr_mode = "otg";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pm4125_hs_in>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
@@ -73,6 +89,10 @@ &usb_qmpphy {
 	status = "okay";
 };
 
+&usb_qmpphy_out {
+	remote-endpoint = <&pm4125_ss_in>;
+};
+
 &usb_2_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;

---
base-commit: 72d06ed137fd7c3a6628577ff4c3bebc7932937e
change-id: 20260812-pm4125_typec_changes-270965b03486
prerequisite-message-id: <20260811-usb-shikra-v7-v7-0-753e928f37ae@oss.qualcomm.com>
prerequisite-patch-id: c6f8b2af575482db2b63bb1050f52b21a7879e0e
prerequisite-patch-id: b9197f0bff253726d4d5a1d4e0a5e1f193265e6b

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>


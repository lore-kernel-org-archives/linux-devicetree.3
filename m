Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595866;
	b=RDeQqr2VWYxjo+IkjFE1G/GYEZFtPIoX3/k/44mwisqIO4xKIUqK+o91b5o2GQfVGga+
	 F1yNXK+Zz8dVg+acRqUYaJRfxFh8Op0p/nG/r/K4Q3/dd+TLMhIJvNqZlsGPxjYex0fcj
	 qpoSfVZ6AqGZEBnDLeA+hbPe3OjZrrRRP2QeXUg2qaM0wAw2Stip2/4x+hZb4A+sv0/jb
	 O8Fy59wxBaiwIRMQafhgsOlM06q/afkU1fdECaDIPEH7FHzWhE5wl1xb/fKEzS2qUQPeE
	 SFP1KUsFOvZGNlLV/UgjIlW7LsIp67CgXUBrqLMjQ5innTVMYHsrJbXSuHJbF366LXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595866;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VsNPFcVHAGUVN0e2Hq2ckPVw9HP9Dj29QyVKGoAqQNE=;
	b=DdQC1zvbWnjH+S1AOp6XmTq+T3k/vETbHKwUME5D5E5plXOmCuW/Kaq52J3Br9SDgakL
	 tGL0bdDf1CKt2d/kB081na1u6oHCwZ5UDQj8DidQDuJhe/Gm5NH55sYrR/D+mhmzeJGeU
	 EHXm0P4DCmqlh7FBurIerA6WJTzbYgd2EumjiEJX2ck5GauFYVC9AJCM4UgyDvcLdKloq
	 K3TF6vtZgV4kPLRtS/AhZZzDpHQ9lrapY1xxtaXn0uGxr6Qz8JvB7KGQ8jbZzKFH9gita
	 87p9kcVkWB14lbPvWReg4DIT42psH3Hlll+e8yzdpxOG9O0d9As1n0CeC76HlmDTTlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6T02ydL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LIxIrNvu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C75E606A335
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C75E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6T02ydL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LIxIrNvu
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEEwjq657186
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VsNPFcVHAGUVN0e2Hq2ckPVw9HP9Dj29QyVKGoAqQNE=; b=j6T02ydL//Q8S078
	kUngjU4oZAzoRfXAYuzFVRh1i5xj5apfsUtC8t9nwK4JaQhhV3wbegcpR9jvUFDP
	2ZKXfh1HFjTdxw1LHmH3B2EGDfIAyAFs/MCdFvm/+/iPoTENLAOxJEbxXBRsrc+z
	3PcSSv5C4Gxxeu60p3Z0h33znQfhtXqrzH/gEb6m7hwYzxXKoPxOJQU96z/wAlTo
	v4muCzfWi+AlIbawFD9tX3Co6Z7P07aXx0ofnPO88TsyfCm3SrrZ/N94aJ7hjLKW
	9InweytC+M7Cxs7jL+MkDrJkEcYFDcmPg/G4VUplOvtGFOh6jIiwKJRBzBsFdUw5
	HspCwA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v4nxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:17:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so2160957eec.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595862; x=1793200662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VsNPFcVHAGUVN0e2Hq2ckPVw9HP9Dj29QyVKGoAqQNE=;
        b=LIxIrNvu6UL/k9AZQ3I5t32tg/oHgSlMS5a+BaC2C5qIbA6vhhfkeeHI5o2MmVsJL2
         9je6dHMwFoMOQkNE4yJ9USqJ3WCIrp23ECMGeV8uu5IG6zIdNhbi9jFzbXld+924ghIL
         Q00XQT9PbwIErqGJgwUVeIcfQTzPkBb8RJMha5uC/eyKOVek8aW9SoG3baNaR+Eos75a
         eeZEb1XtxOTZa0deasFBGve+gVwEaeA4Bqr/cV6A4Luh5gnwE8GZRPyLiyjEqT3Rvgxo
         FmWkZ7L4mw3pOt2Rlyr3YxjT65igjJpX7CnF1ivIbeuQEY6/l58BxwJmynauaGC1HQX3
         U54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595862; x=1793200662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VsNPFcVHAGUVN0e2Hq2ckPVw9HP9Dj29QyVKGoAqQNE=;
        b=EzLiT6U3x0nrdFR8FmsEGwO+ECB1WVaTKbE8TOtYNBi5n8jwgbLbVD0ow9Zr5rdeIO
         kBmQtMH6xp/zc9qgP2Tbfhx0mlZhvYioYbvCk9/4r3jFyWLOvpwsMPsxI+I8xLpQjur6
         4W4VLQTcpgOrtRGRUhzyKYogLQfpDggYZ/IMSe8ta+Wc019ulayiz6HpYmTq3tqU5p6l
         FiaNfJGe6JDIQtugSHu2q7HTv+D5kzqfxcLj7YnIZU+ync0lRy+Fngshc3DLBWXGDoLB
         bijHaWoF2MKmrlhkPjyInb72fqQJY2WAWGom/Ekc7bLw78m2iPniHZwQGjRtvLBkJPgf
         IUPA==
X-Forwarded-Encrypted: i=1; AKwUvBzFA4WDtSlxicIpUGs0vLFgxeDSI9iOLin1mnpyNEsn4hRLS1gI/uoHLZDgiDcDSuNUFnn9YTFjAQp+@vger.kernel.org
X-Gm-Message-State: AFq9FYKA9VJcUA4lm5X9kkHUyK8oWmQzHwrcpf/ibZXFeDuZWzBQ1wBh
	9Jy6zM9MEwysf5XXcJYT/VXUxIPeqqkHpqVlEBWS/oM1X5LsO2Nr8uhmlgsO3S5NN/tdeqiwINi
	nnELC9pxM39IWAY2edvmnaVxJ+ubtjBNRJGkS9VRbLSHHCIFhdDLRQlLSK/jik2K7
X-Gm-Gg: AYBFou30M87SHIOiIDTDhuwWPclozYduYvgbgfJklwNlhZd1pVMeXjRXWcvl+jbNMyF
	no8SU8JHpDI54wxaOb07/fGvio/0UTb5ZfW1oI6lV55MaBDs0fOFmn4usGE7YqFRv8GnPJibc/I
	UOLlJyGfwW7uMzCz9GWrvSuDaF26TaibGZNxw16DtvB37Ue6RdxTkKI0tW590OzLojy978EqhT1
	WYPRo+mYKODiJkuqh6320NLQyPjQowEuOwpnSzFz0H9U+mRHysKvJ8A8lDBCZ/7bw3mpZ6Mhqk2
	E03GSx0Lmm/BCFunSVV6AMAUQS5qlOINioZexJM0++ESdLNbIxsSjhwsjqiMZxjf7hh1B6gWNTs
	iZmh+4412L7HJ+z422VNQ6IQN4JNOOKRU
X-Received: by 2002:a05:693c:8942:10b0:34d:96cb:d75e with SMTP id 5a478bee46e88-3674e3571bamr3403377eec.27.1792595862128;
        Wed, 21 Oct 2026 08:17:42 -0700 (PDT)
X-Received: by 2002:a05:693c:8942:10b0:34d:96cb:d75e with SMTP id 5a478bee46e88-3674e3571bamr3403342eec.27.1792595861379;
        Wed, 21 Oct 2026 08:17:41 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:17:41 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Wed, 21 Oct 2026 20:47:25 +0530
Subject: [PATCH 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI
 bridge support
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
Message-Id: <20261021-lyra-display-upstream-post-v1-1-585caa39cd7c@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=3427;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=ZxgrAd6nafolyG+/7GE/vBa/duxEvCqREClsUHxUoec=;
 b=kKaVoiWy9u76Iu3oh5yB6hy5Toxfkqe7KfqzADnMEQkwgLwX8J/n75fSu8ezTkeNBsWxBQ4sz
 kfD8BvytvZCDQMg9niDMfamu6MRqNExRW0hGmaK3Zbvjf18292hO2+O
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX4qUg5XSkhvgW
 +Rup2/fKSpPtyCq92N07yUyI/5hc//Qkqic05rWpzNKCNm0fRnrkissjvKRW/KWJTtt2T9pOa02
 WszxHpyrhwXXIoP2nrGJGWaSthkoOoI=
X-Proofpoint-ORIG-GUID: NuR-E6zbiLq2f9DExArhJ2kci85CIVOc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX9+ydmobqVQly
 EVe2OLZMnZFAFhZo3PJvnTCafSf05FIUfVK496f+5PAG9paDYh300egQckx+fKBxKMvfPP1MAIF
 BO7ebr46LXXcRH3JOZWEBD7pcH4RozVclQQVhs9RpW5KKv+ERtgjclrcn+3QMLWf1QCbYia+tNC
 uyZ5tl/H6vgcy6jmF5kdnQO8PRuItUM48S+d/kvCGpv8dyIubuMWq+RK1QDxfldC/f/ysnAH8Hn
 L6RupOSOaUuzxPUEDMnGC565NoHZDmEbwyCYASmB93hYDzshQoJvAnCSLoXqErCiXh7tKovzpsJ
 E07CRrFHY63OYek/LUP+4kRs7TqWRqkmDc//ysrEJ9h1r/+Sm0XNzhyctC87serXsEeIBVJPcrF
 zh5Dx2O5kEwWDPnVsPtnRInxIQG+MaCEOIl+HMoX2Y/bEnItySYQnA6FqtLhQ27n0KWAqSDBG/Z
 dLCjJPAMYrzIRUXW1NA==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad8d798 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ggSE_kt-BB5Ld93xFnEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: NuR-E6zbiLq2f9DExArhJ2kci85CIVOc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210060

From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>

Add support for the Lontium LT9611UXD DSI-to-HDMI bridge, enabled by
default on the Talos Lyra EVK base board DT, to provide HDMI output
on the DSI0_B2B connector on the carrier card.

LT9611UXD is connected through I2C2, with reset and interrupt
connected to TLMM GPIO61 and GPIO60 respectively.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 105 ++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index cfb563658fe0..ec5c10a40521 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -4,6 +4,8 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include "talos-lyra-evk-som.dtsi"
 
 / {
@@ -11,6 +13,10 @@ / {
 	compatible = "qcom,talos-lyra-evk", "qcom,qcs615", "qcom,sm6150";
 	chassis-type = "embedded";
 
+	aliases {
+		i2c2 = &i2c2;
+	};
+
 	dp0-connector {
 		compatible = "dp-connector";
 		label = "DP0";
@@ -25,6 +31,65 @@ dp0_connector_in: endpoint {
 		};
 	};
 
+	hdmi_connector: hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_out: endpoint {
+			remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+
+	vreg_disp_3p3: regulator-disp-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+
+};
+
+&i2c2 {
+	status = "okay";
+
+	hdmi_bridge: hdmi-bridge@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+		interrupts-extended = <&tlmm 60 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vreg_disp_3p3>;
+		vdd-supply = <&vreg_s4a>;
+
+		pinctrl-0 = <&bridge_irq_pin &bridge_rst_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_connector_out>;
+				};
+			};
+		};
+	};
 };
 
 &i2c5 {
@@ -74,6 +139,23 @@ &mdss_dp0_out {
 	remote-endpoint = <&dp0_connector_in>;
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&hdmi_bridge_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l11a>;
+
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
@@ -135,3 +217,26 @@ &usb_qmpphy_2 {
 
 	status = "okay";
 };
+
+&tlmm {
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio60";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio61";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+};

-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829766;
	b=vFyVGflUV3kzfdPg83EtM8fuTKLtujJc+xY5GfdL837D3Gu/uR6V2flgc6qBadKNdkWM
	 Ny8yp9AaRG2u5C4Nnu92y3uXZZ+zKPgoK5Av86AsSZX1NXnq3Ym34aMPiyGCYqSK57Zd/
	 s/Jx1duWSScnhhSe5aiAkeph8aWPpOfoTct4IStgFaHb/svzs4B4Cyy1S524lI8rV0eAI
	 Opqw/YBkMMf7b0Ow8p8RdQmQpviPdm01yv/pKjuJ6M3047xl1+vfHmrWTwll6VD2st2R5
	 LXuJ0pyZ/VjitHIk6MLipLE74Qv52XljKA1y5JY5hJgajmu3m5zP5tFq2+cK5frWGtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829766;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ibqxhW40RmBjwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=;
	b=lXw3SZfwIxJkBthwMs8eFD+BMhaAk8FyHGOYfzAHGGm1jPdSiomOkuKjfLABXjvgjHRQ
	 2gCeALvBvNlSpwHfcETako2h6g5NU49laM0CL4caajfsj3yX3IqsalQgObxxAVltZzkN9
	 iAvcKJXjg29uW8MQ4H9427pYbOCo+SCyLhtPcudruUeS75EWmOVcOUHkfKdtERJPtzNAe
	 5pf+SDT6T+TqezMBdNLSMvwltIydOxJnn4KVXL3Sk0o7nzWN7TBYqG9OCjRoJqZQix3HY
	 +fEGAO5UkyFuAXiR0VSy3iulkoVpVOOLxyqz4QFxuSH4s7V8CkSL8nIS6ucAsmkyyKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jFaLEiLM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ReeRdIxW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59255606A330
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59255606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jFaLEiLM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ReeRdIxW
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBLR7V1016200
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ibqxhW40RmB
	jwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=; b=jFaLEiLMC8vWMriw71pNEsMdwI6
	cYqSJLISN+Y0TLPvXJ7vQElyBXrGyBX34tyHaEb8J3GPnTD3WmX+j5byxT9thTMP
	KV/K4T7RW/YNL1gAIwRTEKPNmiT5GCMvLZtFInoqjRFWc8JuXx4VxnY/hcsfCeTU
	d/ZxtYpwjc4VjBx3uDBvZWgvps+f9DRJIT+WUzZjtEIagsEQKE+0TMTIrxELYT3b
	X+z28Y0EpbOJpjjWkYZtb/Z+xKDO4vYGal4FtH0w+sWPL6vHOrwc8r1G9XeHrBok
	khpIjW7xTZGdcRGcIz07n8aNW/vjBagdD1Kg2Tvd9N75UD51cAOuTK63xLA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0003g9ve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:49:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36efb506f29so2788775eec.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 03:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794829763; x=1795434563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibqxhW40RmBjwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=;
        b=ReeRdIxWWwvADvkNtdIOLMoL3SIwzEga0Kzxl7+C5Svl5RN2+LRuZR/m4bLek5zYQs
         snMMtpz2XWRbxQ3nxFemg6qhZQIfZ3t/+txX8wLsWkasXYUHID7+C0lBL+cOYh8xXrx7
         skIPVqO34V+KR2CE6sBx357LYfUj0ojNjDYThIzAOBXF3jQQP4Q8LWAIMAkK+GCfxEAK
         43hiQxPnlqnhuE38KJKofFdu5FXmpuB3A7evn6+tZbte9CL8ONfOYqbtW7UGBl8jZPSK
         vRVq0G5fCc3fpNF7YxnPYZJoHan8yXzYHKosAnvq/YHEGVLTA/jP/cErfMdhGdi5owlN
         bVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829763; x=1795434563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibqxhW40RmBjwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=;
        b=h33niXRqIsVe4/jr2rk0U/MxhPsc+tXV/Zv0XclVLLi+r8z2vp3NstLbW9JSi4MEda
         sIQJLrOEB075sO0AvtJZ0AVJc7Ew1nPvooF1KJjIJoIQ788C6chzqiqMs8cAmRTPsUG7
         7gKEJ3hKYbdx2xn3xfc7oID/JyT9GNuAxbpj585oCD3Z5r3kY0XJd0NEiuLF5ZozHMfU
         FcfDF6ka5hShvsxmgLQ6fKRwkNFKdM2Ms3GPsjVNChAVpgDJ8OU8zhBW6sX45Aj2K5Se
         I4tJsBqBrDin5X2vf8Pd8VQt+HeiFi+w5jFD25AGeLoxj3vztUjSkrAuhlVzcQY917E9
         7Q9Q==
X-Forwarded-Encrypted: i=1; AL+hErFw4XxzPO61Lfcv76KbHTymmsDdZlv84CEKzZgJVm57qMQho7tYMBj7Bb6B8MW9w1jAT9JRQypy9QmI@vger.kernel.org
X-Gm-Message-State: APuU4Z/neE341TxnbBYSHdpbbyGqnEuU0lWYwbHTt6zoZ8yPlsT1n2No
	9d3R404nFtfX+yEB8jntndXETP3mbTb3AbzGgG1ezrCDqaFTscvMDRe3UvzGeE7iD7cssV7AvNH
	xzyxnlVB7/fUO63QU8Seigog5ji3JDq1Isa8memExl5PSyJgRtb96zP7NGLxoBNoR
X-Gm-Gg: AZFdTZcaPrmFL+ATxmitrrc1Pb5KsWDTLoV48kGW0rh4d0q2GF1BKAr9YQ6Zml9xyeW
	GTPSk/RBeI11u/JjG5JGVhKZaL4tyK3gKURtiYqUMubrMMuptQc/sHmNqHrdyi5DGnWFnIWLxIM
	aK5U+d8X0qdIPg2Iusrksvf3pvKQvLPtSiZFjTm3C4CSuDT0ribZhi091EkAUhCxDWGM+7m7nfV
	UndBjroXlYVsNaODM/xogLeBG1PnQAO0nO3f5g3eYvlSmUC612m6FEIL4YB5AAtGnl759kisXqz
	UF4IUuJMHKkaW4Q6IwnS3oCzNgHqm030y8ox5AUquJzQmg2zz5suwIk77nh++BpY0AbDDItvmsp
	24+qlPKUwUbmjn4OG0+rGDsjJe4lQsqlikNrVUmvBm3pZkTwwGmD6wqwGpbvNap9L/b3EpJQ8mq
	mq
X-Received: by 2002:a05:693c:2804:b0:37b:7bba:8199 with SMTP id 5a478bee46e88-37b7bba83dbmr5244731eec.6.1794829763151;
        Mon, 16 Nov 2026 03:49:23 -0800 (PST)
X-Received: by 2002:a05:693c:2804:b0:37b:7bba:8199 with SMTP id 5a478bee46e88-37b7bba83dbmr5244704eec.6.1794829762580;
        Mon, 16 Nov 2026 03:49:22 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm33802844eec.10.2026.11.16.03.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:49:22 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports
Date: Mon, 16 Nov 2026 17:16:41 +0530
Message-ID: <20261116114908.1701258-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116114908.1701258-1-akash.kumar@oss.qualcomm.com>
References: <20261116114908.1701258-1-akash.kumar@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GOSyfhDsGfPGBdMERnZdUg7OnGnRzZVO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfX8yqpGlXOeIHw
 4hBz+frNQUSeAMwwCWN0ahfvotrvmcwLtmrk0rxnxODKhyFFuwuJJBd/VYDShHilTV8xq3y4iur
 VIR/Oq2Ty9OoKbjCvKCAxpO73aptxeE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfX+OxhdtYjUVyw
 yuEvt3IjLp7B48uHttQoY6DikvKL34XLrnCjgR8lCOZKRvk9ygUmkEktiX6KeUQbuHtKFeQK4eY
 8eC/bnQU2EdOhdiGIeC5rF9ymXvrtgkhu2fooPrw+AhdfkThpRzPC4MljUPL/6psR2XhA4iZj4G
 CdkLMz2SmiPIdG9NKzF4flJKBhixEh4KjgJGUsTWjZALUlzdUS2sh0rzzKpFiAYsZQdFbLHh8+3
 gcRjFGG8U1FHzEfkdXT8JrzvtYoDe8ku3ySz088Le8UuF973GacvroWId7PItf2UgquKVDkMErd
 eqt4wcJVxfQ5W65fnOQQSBkA8gHnx4uArvQkwovLVBacXXzJ9ElgYz6fyuitMc6xLO2kvBX0tj8
 YRGi3QUiExRUBW03OXQU4erLtzQL79M46t8ITeB9Z/EaiW/03gB+gi+PMypKpQKtC6eDV/xxYiG
 etQ3z/YMCHocapGFOKA==
X-Authority-Analysis: v=2.4 cv=Z4N5j3RA c=1 sm=1 tr=0 ts=6afaedc4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=1-dFLm9VQVe0kl0r4fgA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: GOSyfhDsGfPGBdMERnZdUg7OnGnRzZVO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160046

From: Akash Kumar <akakum@qti.qualcomm.com>

Add the CYPD6129 UCSI PD controller (typec@40) on i2c5 with its two
USB-C connectors, and route their HS/SS endpoints to usb_1/usb_2's
dwc3 controllers and the USB QMP PHY. The PD controller, its GPIO86
interrupt line, and the PM8150 GPIO10 VBUS-enable control are on the
SoC/SoM card, so they are added to talos-lyra-evk-som.dtsi.

connector@1 additionally routes its SBU lines through a GPIO-controlled
SBU mux (onnn,fsusb43l10x) selected by expander0, since connector@1's
physical Type-C port carries SuperSpeed and SBU while connector@0's
port is USB-HS-only by hardware design. The SBU mux and its GPIO
expanders live on the carrier board, so they are added to
talos-lyra-evk.dts along with the TLMM GPIO64 VBUS boost enable fixed
regulator that supplies the USB daughter-card connector's VBUS.

Switch usb_1/usb_2 to dr_mode = "otg" with usb-role-switch so role
switching is driven by the PD controller, and add the supporting
USB1_VBUS regulator and pinctrl entries needed by this routing.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 .../boot/dts/qcom/talos-lyra-evk-som.dtsi     | 121 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts   |  42 ++++--
 2 files changed, 152 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
index 7d9a08471906..ed3a369dac02 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
@@ -31,6 +31,16 @@ xo_board_clk: xo-board-clk {
 			#clock-cells = <0>;
 		};
 	};
+
+	regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB1_VBUS";
+		gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb1_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
 };
 
 &apps_rsc {
@@ -179,6 +189,87 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcs615/a612_zap.mbn";
 };
 
+&i2c5 {
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 86 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port_0_hs: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port_1_hs: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ccg_typec_con1_ss: endpoint {
+						remote-endpoint = <&usb_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ccg_typec_con1_sbu: endpoint {
+						remote-endpoint = <&sbu_mux_in>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pm8150_gpios {
+	usb1_en: usb1-en-state {
+		pins = "gpio10";
+		function = "normal";
+		output-enable;
+		power-source = <0>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -229,6 +320,15 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio86";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
@@ -250,6 +350,14 @@ &ufs_mem_phy {
 	status = "okay";
 };
 
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port_1_hs>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
@@ -258,6 +366,15 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
+&usb_2 {
+	status = "okay";
+};
+
+/* HS only */
+&usb_2_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port_0_hs>;
+};
+
 &usb_2_hsphy {
 	vdd-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
@@ -279,3 +396,7 @@ &usb_qmpphy_2 {
 
 	status = "okay";
 };
+
+&usb_qmpphy_out {
+	remote-endpoint = <&ccg_typec_con1_ss>;
+};
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index d4468e609911..020ce7db4241 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -4,6 +4,7 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include "talos-lyra-evk-som.dtsi"
 
 / {
@@ -22,6 +23,30 @@ dp0_connector_in: endpoint {
 			};
 		};
 	};
+
+	regulator-vbus-boost-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_vbus_boost_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vbus_boost_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	sbu-mux {
+		compatible = "onnn,fsusb43l10x", "gpio-sbu-mux";
+		select-gpios = <&expander0 12 GPIO_ACTIVE_LOW>;
+		orientation-switch;
+
+		port {
+			sbu_mux_in: endpoint {
+				remote-endpoint = <&ccg_typec_con1_sbu>;
+			};
+		};
+	};
 };
 
 &i2c5 {
@@ -100,16 +125,11 @@ dp_hot_plug_det: dp-hot-plug-det-state {
 		function = "dp_hot";
 		bias-disable;
 	};
-};
 
-&usb_1 {
-	dr_mode = "peripheral";
-
-	status = "okay";
-};
-
-&usb_2 {
-	dr_mode = "host";
-
-	status = "okay";
+	vbus_boost_en: vbus-boost-en-state {
+		pins = "gpio64";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
-- 
2.43.0


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412283AF678
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269963; cv=none; b=ZMFqgATnwR00dAbMdcWgz5CyKwsBOcB/dJzc7ltzLACkdqqNiItlfYH3lcUX277EpXetBOCUL71XFoEv0noc5sqgTqQTIGFjVuLugIq5B1Uiu8z5LAeYbZriTBevPmhIASbNqF5btYCg/q/hghg1Ctc0GLL2VH6lxl2g1wdFvaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269963; c=relaxed/simple;
	bh=fCVtkWGaCzcd6oD7xUuIczhdltfjodINW9Bm1UkPecI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u7iNfYHcwFB8m0b+1BZEIAmvUPhHBDLk8fwZN2LJS+Cij1EoNsj+bdfquteBqHN6LCzMiROX39Xj4is7TN7GN4Q47YFCFifqy0x3d3QXvTohN2vcSb3Z1OAa5fkehWuaP472RoQci9HT81AMEWB9yqxPKxZMMyQu+nC/rVY+a9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jhlgwpdi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HkABHxes; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jhlgwpdi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HkABHxes"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K6ebmH2143802
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Uuua3KjK+Zo
	CopIZ43xbqZUEKr2+7zx5nC3pz19xRf8=; b=JhlgwpditmYOLAfmURlDLqUhcyr
	1o2KQGNICi7Md6JQdkQ28oW3A9bei5ptwvOKmpGKhy+K4qVwtA0vsDipvz7ITTc1
	AZBroVUjukr2JlFzrn5vFqsRjhEYFgVJyPRb4CFyLuOjCTUpMfy7Bs2xNsm7c1Vl
	8hmqHOdJ/sYV8Im4xgFSiZhEI2DTFCAEGXkDM7hsD7vtH7YhC9fXLHbnIPpOErwV
	aJROh+jaUszkXJvpCJ4oKisw44V9Uu1QPWeWrOnJYRMA/ytA/Hy5YthZ/fWLkOPR
	WIniRyBvrX1RIU8FGjE9TeEjw1yk+9q0og3cN0Js/8oIhoathM04DQh31zQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3tm3mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:39:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba718173d1so74906535ad.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 02:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779269957; x=1779874757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uuua3KjK+ZoCopIZ43xbqZUEKr2+7zx5nC3pz19xRf8=;
        b=HkABHxesyzHK0XnG3Q/kW5lzTVoH8PwMht9oVk1KELwJ/3OMN6EeY5BET9MJ8cHx1l
         GMkUYmsOCkk0Pxsc3M7tMdsTpzPljmO4wUAbGtvni5rF5QKO2Eitgp4s1VGk2gzI0f8O
         j1pJX2P2RXXRYWDDAd353dZsiGPDkRESI4VOk8FA+XxKYPpDC0KHODJOwQdHliXfS3jK
         6p27qGQxp9Ksnv1iUbTiczHLJeC6bGFaLaxvz2uPZrB45WpVhZr2oKvxstB8j093RUiz
         jr+EclV4YMI1SoWVwjWFOMkAztVeQ51fy7KxweQ1RI8C2N80V+uwhnqRUOEXaAcBuJb7
         luaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779269957; x=1779874757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uuua3KjK+ZoCopIZ43xbqZUEKr2+7zx5nC3pz19xRf8=;
        b=GyT/mKQmeXAJBH81m99hZvv2pxiKqqBre4aklzygsh7WCDe4MuUBcV3KGuYHaHrXo4
         VUzBrL8zu2H34fgaXK/C6ZmaQmzUbJwgbqC01Y2DWVjXcifI/afxYAw86ZsCEFdlq4/B
         xxukbkPqXOywe5PI6DZ7EFi3TvFohUbM1Al4i2t/zf9pC1bKNTwOSh6wCBXJJYjKS1Kv
         RYvHam0qcZdEFwW3oxzU/N4p0laf2RDHgZJtJIAxlcPLVh+u2jqSyfE/6Kd0H0ihaUyJ
         4YHisG/W+EdMFvOsBMSnIn3fO++DsxlbmCbKSXURMa9mGOIX7tiZbEl/+Wly4obKTiL+
         Siqg==
X-Forwarded-Encrypted: i=1; AFNElJ+OtmT35fTbZDdXZfeEJOX0E3aqAcjHzDOT9BnkkY+KapUSZykcpPI5p11fFouzKnzI9SOmLFQOgFvc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6pnnh1+0Mwa9Sz5mZ3eCB3lvckryJ2xmVSUE83DMyldUYsXZ5
	XtaPCs9qGiDxbfW0S7cE9buoff0gDh7dVRjkGoEzcY7ZCP6bjs5bPhgbgmNtvBz6tDeoA8Isx5k
	B1ys1xBh66E7ZneELjWcyFysgt8RA997bKNsqj7e/bir1uXkPpzK/ZJGjo+ENF2WM
X-Gm-Gg: Acq92OG1KstAc0rtUuP45qdpHL5T/UDHkEKHy65+oWLAizZZFWTBLoSsfKXF4A0XXjw
	1dzvvdcOSk6tyaGknZ4rjipX7ejadiOknSZS/4MgRBC1eaatcvqG6g4Lzi096s1vlovqLmq9lSz
	V7O4S1cdMdDn0cv0hRb6AXuLaC0TKkfobM07j3VbX8r+9g21Df9Km/bpmqPkXlp9iLuC9HdyuMH
	LJmgW1OZQHBI+v4G1Hu7/KItSQslVNtENTyftLKb3mJW2r8gHD8r8xOn1GrPVc7HFg4ZKvZISw+
	YZWuTbgF+VN1kfudk+Ll4ch1LAU+VX2QE310ogPgDut7VLQrdn89rWCjsvga4ujxS6n4I6hWaq5
	GkA3Fpxt38JArgH+Rg7iuLQZI5Y9mwb8XHWp4jxWxA+UYbta5tw==
X-Received: by 2002:a17:903:22cb:b0:2b4:63c8:ce18 with SMTP id d9443c01a7336-2bd7e83176fmr253997355ad.12.1779269957105;
        Wed, 20 May 2026 02:39:17 -0700 (PDT)
X-Received: by 2002:a17:903:22cb:b0:2b4:63c8:ce18 with SMTP id d9443c01a7336-2bd7e83176fmr253997055ad.12.1779269956587;
        Wed, 20 May 2026 02:39:16 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8baesm217052215ad.47.2026.05.20.02.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:39:16 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: monaco-monza-som: Enable USB0 DRD mode
Date: Wed, 20 May 2026 15:07:33 +0530
Message-ID: <20260520093902.2064730-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
References: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=feCdDUQF c=1 sm=1 tr=0 ts=6a0d8146 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=UkWcZxrghjed5wiBs1AA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: jPh0G5adXWZA2iu4d8Fr7NM_MHIcGHN1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5MiBTYWx0ZWRfX3Sdpr8ejad9L
 UbklRWs6KDXVHt1yM6tzp0lKYP8LCww+qd0rhuzkiqiZEPPVWUfD3AcyWNOQH/iJ/3xsHJfDYXm
 k3dmN1HrcmaXufdwEkDQYfFEwqGN4INfdllS+X5PYwdDTZ9A+EbaRwXpyO/XjKZaHnrNV7AxB8W
 9vgwOQTPU8b9HrHeC2B6T9AoMnmuCxUSkq+vSR51x9jmP5KRmJlet3tPOg4VAkZUh0H/ZWmUDZh
 9oUZ+4uWRsws9XemE3b0PYUJaqskx6/FAK0GSGmU56SZfNZCp1eBNpeX5LPPekP6OK56+e0kXuJ
 4HXVrWQPpg8Ty18Nm1hiCmMwpQynenVvPavUvJVSZ1kAjXTHu/FJuSnQupD4QpXnzSPlHwyOH3S
 gkbyPaHVK/yObxFQp+0jyFdRsvGBtWgICvdhApzD1kDOrOWilaiLp3PboGyTOHSzTkbpHCEb8Hy
 qE4Qu4rvN021DSbopPA==
X-Proofpoint-GUID: jPh0G5adXWZA2iu4d8Fr7NM_MHIcGHN1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200092

Enable USB0 dual-role mode on monza SOM using the Cypress CYPD6129 UCSI
controller.

Switch the controller node to I2C12, configure the required pinctrl and
interrupt settings, and wire the USB2/USB3 endpoints for the USB-C
connector.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/monaco-monza-som.dtsi | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
index 9b5ed55939b8..8e3af6018dfc 100644
--- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
@@ -194,6 +194,52 @@ &iris {
 	status = "okay";
 };
 
+&i2c12 {
+	pinctrl-0 = <&qup_i2c12_data_clk>, <&usb0_intr_state>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	typec@8 {
+		compatible = "cypress,cypd6129";
+		reg = <0x08>;
+		interrupt-parent = <&tlmm>;
+		interrupts = < 3 IRQ_TYPE_LEVEL_LOW>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		ccg_typec_con0: connector@0 {
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
+					ucsi_ccg_hs: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ucsi_ccg_ss: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+			};
+		};
+	};
+};
+
 /* PCIe0 Gen4 x2 */
 &pcie0 {
 	iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
@@ -227,6 +273,11 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&qup_i2c12_data_clk {
+	drive-strength = <2>;
+	bias-pull-up;
+};
+
 &qupv3_id_0 {
 	firmware-name = "qcom/qcs8300/qupv3fw.elf";
 
@@ -295,6 +346,12 @@ dp_hpd: dp-hpd-state {
 		function = "edp0_hot";
 		bias-disable;
 	};
+
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio3";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 /* USB0 HS + SS */
-- 
2.43.0


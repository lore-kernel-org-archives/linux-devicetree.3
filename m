Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CD0426689
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 17:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655211; cv=none; b=uzY+6OgM6tyYbUYTXAO6dyy1sNjWxhjRTk7YhNHJfU+ZOMzEO961LSERLILP0EHZjTUErG/o8LUuzfaFBmlPOzdZmZFXCOEsHXhSIXUdK+gRdZgdU+Ad0jez/J6jTlW82gcFw0FWUtAyaKQxOil6s11VSJR3GIDyQvZnHDJrdfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655211; c=relaxed/simple;
	bh=6JM6P67fIL3JFqTkarnSr/o3rEQMX0AqvoNb7WENFzs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N1H/SKzYtJK4CmSESaMBUaCYopJEm+2DAJH6O8a5uwV5L6n+hGyBrcfASfWl8wgjkImugex3o4vkgYmnUXXFbH0qiI2l7XwPAJ+uvjXjnkAWQvUmruCJoy18B0lRDMmVicdSM9nBfy+vAc7/Celue6lytbKLKkiqaWAqT7MJW1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gjKSu3Zs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jxq7EVA8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gjKSu3Zs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jxq7EVA8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLk6F987850
	for <devicetree@vger.kernel.org>; Fri, 1 May 2026 17:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=15rwOOVjpjC
	8zHr4qmTaFvFtfoo5O5r3leDyOlmAhrc=; b=gjKSu3ZsOtVq2NV2cNIQxJQtv9p
	6casmzGBVBIsmy+ch+AjdfliJ+cXWkHlewx1ybOWlweR13QgOFLyigZjIW28OgOi
	Fn+2Zzo6CUbCFbneF9PS7+RVKXQZOeHnD+0/TpH30Yp9T5W6tlxUdP2fnSyuDe6f
	ADZ3//vXABU4siW8eMzDEbcM6/mXhLl3TI/21GDx0+PM61BcyWueIr8eAb0npyw1
	6Zgv9HSQfGqbbAwMfpqMLCXCWv4b3bTakJ5TT7UIHMknQOZWtm3XTNgUFg0GmHij
	2TSY3L7EdhId9Y/Vr/t14sjoyjaeLzHSRJorxL4dK5O4PvZJ9uoXk8RPmQg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvjhst3mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 01 May 2026 17:06:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2eebb099efbso1829653eec.0
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 10:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655206; x=1778260006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15rwOOVjpjC8zHr4qmTaFvFtfoo5O5r3leDyOlmAhrc=;
        b=Jxq7EVA81vR9z6cH0IkodKNEcP7S3YEVXF1xuA0P3ETMmX9Lyb3H2NOhoBtsWACrLU
         2IFX6yq59H66DaFnjr/szE6V++hGH1MxV21SMgs9oNwgX/sjChSsUl2X41qpB5o5cSSd
         FL63BfNGF5SpUNYJqGYxi66pEsHwJH1peBQs4Rv+XwdIMIHRrY66W3wl+a5ukiW1z9Zq
         mUsPXy8qEYtG2KFgpdHX2V7SZ4TXTKLsvH3MHZ0hV5gyjTz45jTkWWNEsP20D04gDOYz
         vj+a7dCnLoYyFZSMYlgDs4uo2sLCQ3mEM5ibWuO1Y0K0zaaYDXUhjAVC2+lK4cHkcLYc
         a+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655206; x=1778260006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=15rwOOVjpjC8zHr4qmTaFvFtfoo5O5r3leDyOlmAhrc=;
        b=f3BSDCgGDzDRv+PYFtNlr8NFXS1i1QVKwXoVLh6G6iwZA0XbrDlvG9CXmWf7NNjIPR
         KKTWVyIJwxqUPxVY4xQVY+5vSMP+M7fpKEBaJt0A5dyiAOHi7/sy8JjToeel4YbPTmxh
         FSiJglE29f4gmhtkRypQdRWSakpm6x7Jf2UicdI36cOQ6P5oInW1+MrgrN8/XfL4zcCi
         PBUCYyJnCNR3XZXMnsYvc9jFhsDhpp5JHXZcqsqi4wgU9ZpvzSXySiX3YwO5zC9MRSWm
         VXyV9E4wY6n8KnBaOrqqZJeTROaAKBxl0sWi+90gGBO85w1MRyv17pMFCei/KBEopS/B
         XAYQ==
X-Forwarded-Encrypted: i=1; AFNElJ8bPgJPYbm2G9t5HnHXVcyYIFsgI0aZM89RzTBq9ooWrhucVSGZKQzb8St1wNKIz+Ez5Z39QSUGKOL9@vger.kernel.org
X-Gm-Message-State: AOJu0YwG45xT47tki8ZI7pumzwQreR4V4YrBzpmbTFUrq7msLrTSQ9uk
	CcYKOHgA4rJk1oJdHXrMVdVfevH4/3OEvW09BJ44OpQAAcbzwJoXL4SCsafkICFS/tQw5nNljxr
	I3s5aBTTtrQif84OflreOVkqsjEUtHAVSyqV37p460en5XZLH1rnac3RA89O52Wvs
X-Gm-Gg: AeBDieuIQqFknbqI752uKAf9qT9eXUj8pTTlMyMuvTcD6XDEdFeYWcKiIfYd01klrAc
	QMHqrR2moUwbAvh8fWIPnMMWS6nwjILJDcGhCjj6wEzbcFenDZen8QUBxn3MjPidnaehtZQtb+N
	iJHfUwSvoYmxw5BdRb8ZDCEpir+7KNx3H9boGG5zngYFW9iDsnYYmp4UgEmG5R36BdEFVMnOJMv
	VzejYhxKbIlA1CwsmCGkQrTLr4dSl/J0mvz/+Vf96ecN+GjcS/U361JLXR406mx+Xue08jHLU3L
	L3hvXv+hIRrVDmDKc3zl0Ld8PxpUk3BeSX+TPkynYSsmoLfnzKOKwB1iHrr6jEn/jtVZ6XJjhrz
	L1SaFjdLuQ63xjDmM8ySSvvdr5a0m7TzgKr/BMyGLoDDgv4H6CYDnwlX3z5y4e2+69xi5pg4pYy
	178yp0qHjFeA==
X-Received: by 2002:a05:7300:5b9e:b0:2e5:5bf4:8869 with SMTP id 5a478bee46e88-2efb9a97fbdmr113831eec.21.1777655206214;
        Fri, 01 May 2026 10:06:46 -0700 (PDT)
X-Received: by 2002:a05:7300:5b9e:b0:2e5:5bf4:8869 with SMTP id 5a478bee46e88-2efb9a97fbdmr113808eec.21.1777655205595;
        Fri, 01 May 2026 10:06:45 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm6655978eec.0.2026.05.01.10.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:06:45 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 9/9] arm64: dts: qcom: Map USB connector to EUD on Kodiak boards
Date: Fri,  1 May 2026 10:06:35 -0700
Message-Id: <20260501170635.2641748-10-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Br6tB4X5 c=1 sm=1 tr=0 ts=69f4dda7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ZGDwSQe-amPQ6EBapEMA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: A3Sr0-59SwLxQKewajKVqwQJviGExJbS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OCBTYWx0ZWRfX91I64mCGbGtL
 QQJAXfKefzLbXl/sj6rCBNt2M64n6D8BPDd7iCQb7SiJbtGmEsl4CFmLHY0k+zefGBVcQuKRWWX
 9RG9K3VXcyApku/cngl6Vi8j6K36b5ercjKLuA66nAPnKDnY3TBjCTGd1BDxVgtOviC0BBXlAuG
 oLMEMbb+aADGwreeH9To/pzE+kYqqT8hVwfqwK17oPSm6YbLRNopfpVY6rOUV29TnYg+uu3q/5g
 XgsxQt/a2rWWlB0kfpZWE5pjbC9pYx3sulTQsWSMlmsqF/X5BEAn59/prSxFdTo3T2BD4bQ9cOg
 g5oWSZVsewm1bZn8yIeaNj4URrhJuKST9jCTraXixX3giDlFceGVjKy4VmGKD3UsXIktsi5lPgS
 gNZ4mxZjhd9AaMBj0imZIFDaPhZmchi2P2X0soKBahRnvUpcchCFSKM12MyXsBg3duLLxLDaWXT
 o6BMIGStIcGT4zYAABg==
X-Proofpoint-GUID: A3Sr0-59SwLxQKewajKVqwQJviGExJbS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010168

On Kodiak-based boards, the primary USB connector is connected through
the EUD on the High-Speed path. Update the board-level descriptions to
map the USB connector endpoint to EUD, reflecting the intended hardware
topology.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts     | 10 +++++-----
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts  | 10 +++++-----
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts       | 10 +++++-----
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts           | 10 +++++-----
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 10 +++++-----
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts   | 10 +++++-----
 6 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 04cb9230d29f..c213e06a4428 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -98,7 +98,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1478,10 +1478,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c>;
 	vdda18-supply = <&vreg_l1c>;
@@ -1521,3 +1517,7 @@ &wifi {
 	qcom,calibration-variant = "Fairphone_5";
 	status = "okay";
 };
+
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index bf18c4852081..e9c0463daa53 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -74,7 +74,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -826,10 +826,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
@@ -862,3 +858,7 @@ &usb_2_hsphy {
 &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
+
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 797f37596bf1..650c4fbc1606 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -84,7 +84,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -952,10 +952,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c>;
 	vdda18-supply = <&vreg_l1c>;
@@ -986,6 +982,10 @@ &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &venus {
 	firmware-name = "qcom/qcm6490/SHIFT/otter/venus.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e393ccf1884a..a0db2a2745d2 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -194,7 +194,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1371,14 +1371,14 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_dwc3_ss {
 	remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index f47efca42d48..387c38aa87d2 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -93,7 +93,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1090,10 +1090,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
@@ -1127,6 +1123,10 @@ &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
 	vcc-supply = <&vreg_l7b_2p952>;
diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index cb59c122f6f6..a2e160f3f46e 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -99,7 +99,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1440,10 +1440,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vdd_a_usbhs_core>;
 	vdda18-supply = <&vdd_a_usbhs_1p8>;
@@ -1459,3 +1455,7 @@ &venus {
 &wifi {
 	status = "okay";
 };
+
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
-- 
2.34.1


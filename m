Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C98A426684
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777379571; cv=none; b=VGzxK41deLM0Ekl/PVM6MF82zHl0FYA+ofsrFSsaRRKd9nYDHurCdQsxU43lj9CIDX+Sqwhs9N9YrHPaMIvZmnSLI3aGsBE/MlCToGl/Lqr0qmadR6ipnKYkTspJe+g47h/8zjh6+9JRgsnost7jzedli7eASHbADdu5mICVwL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777379571; c=relaxed/simple;
	bh=B6ohoI+p4dHy/xUCsotP6MF75KavVp/Y+BZEzWlGK4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jLlbklpCo3WoPb9ku500J846JttL2Q0i+OFbq8q0nLcOuz8Z5F9dffRr/QYXFVze/ruXJVsErFVkNkT/Je4L90zg6gH9yO3icOJnXvd10T9t9LXO66fPNzHXKZiKsnsqOkQFFfilYMzkCll+YPdfvU6F6Wj0mWOTSW4lihBTv+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pg520hlz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X2Wtb/dS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pg520hlz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X2Wtb/dS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SAhsGV820261
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CG+IEgRHotytIBiUFrLBWN
	4lepexZyApqAnCM0uB9Aw=; b=Pg520hlzBkDtvhPImNl+UkaEZUX3UpiVthR1u7
	RyY7HibnkYpR8j/C1FaJNOZ0kXrnj40CJpiTOZOzOCG9unjyH81NTSXsZQNiIUTn
	c0oprREGoR3l/RpqNgzQf84Y5/MH4uuvqH4PyPIKj+UbnIrHEEFTVu4SIRCmMalN
	CDHv+5v0yohJIWD0jP5PiQfX+3lQDYtBuHE7Hvu38cCcuye6UpVCn2+iq269+hhM
	wvjh6oPON5CN7QojNa/acrJaZkiDQ6ZZ1PukHGLGkOh4fKxAHh1ZOigq52iRG/Lx
	PGN/ChoGng5UtB6kb+88Y7BfTE++aroXS6oJ9Yw1h3DOavFA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtud20c30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 12:32:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fba8d8c40so133601971cf.3
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 05:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777379560; x=1777984360; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CG+IEgRHotytIBiUFrLBWN4lepexZyApqAnCM0uB9Aw=;
        b=X2Wtb/dSa6FGqiuwOhMhOGTCka4AvzWDN04HyPuix4rKGQ+6r2Py4twU7qm6RkpwPY
         75uJcoop4C0wpuZs+ijGHY9+ncmpGjmL8UkWdRz/7B6EPJ9oiI1mMNkczcruIh9PULAG
         oftbmqHg3gryF01NF9366feNnA4CNXf7Gv8rtKCgds1dFOA0fNestQdLehhS/AwSFF9K
         G4sgEp8AHSFgTUuBaoGh/cC7dwwFT/CmR+GPqRs6zjpSm3IDpkeRWFrey2ZgboN4hbM1
         k34oWnKp+q+FtUzalst2FkCPz+tPByDkzfLjceiqeL20iAANFUefE5FmCmbT6tlWPsD3
         /eEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777379560; x=1777984360;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CG+IEgRHotytIBiUFrLBWN4lepexZyApqAnCM0uB9Aw=;
        b=hdr1w8bbFndvw8QCF7MOddjNsP++AY5XcYwJXxJ2OYUb5rYfv2oey5q9ljNjqzqyrh
         mnxJ7HjQNr+2bcROqMj3J4btAv7OxglFXDXPTvXXyASad3mRjPNZprbG8OAyx3V4oj2k
         rXEvg+RBllzilmn9NMORa3pnU3Ja2mOlH2eC++dUKAi8+hpNW6a5LIJoCw3UeANZDjVQ
         OF9xzOcG1/HLagNJan7DC3sU1uHnKkPrW2lEQPf5kaWaFZYwidYvI1a8x7SJFiIY5qAq
         y2DVZ1bfCE7nd25XqOSOpS5VALiKSLUm8kAzbIQNdDFx8eLwLuXEq8f5GVGl++8vJM7l
         M4/g==
X-Forwarded-Encrypted: i=1; AFNElJ8vzaKCCK9un2jeR+eehEe3yLvKiDHfblycOa5L4eJInpcAEiKpp9OQJXXi9fyi87erXfFlsYPSqtDh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2+ZObmSiXNVqGrvA+pCpAEYzFWe3Q2Wfblxs8GUEj8AKb0swl
	r9IvDc2xcnbmZDVTLnKqBW3/ghsUZ8/QxPqxyNVCqFiko0qVudb5j4LnwCCfGpCelHQl+FSbqO+
	yI6ReViLRePR41LgGX9Se7YT3H93TmerN383k3UI0kI08RuSfeGPRkoj+Wd/yRKur0ssDhfVP
X-Gm-Gg: AeBDies9t9oN74jehye+tMjHrMLLTXTw1GZj7Lu/kuEKyMRECsd89uHrx9kJJ8+7SAo
	NPDj3B3dMZuOgcajyku29lDeYWCV4EmaD3a57bU13jjc5NXr79Qkl2ubZU147aYoVxRdSRBoJgx
	M2a+Xkw6PA8/9z4gZ2bBoUKA1t3VZ0bh9hZdtOwuuXdwQOvyBwMBDnZsfFCCsg3WT5vfONW4uGb
	mAJXsGwXBB4bCgBpI1KLr9yZU4jsnGODZgLZsUVlpVQGir0IK8pAQiQeaOYHDvURtXCaimC8kRh
	mqbh2E9dLKzInOZsi+riDXFE10YZ74AUfXB5ksJjfFFcT/1ODQpnmqhvlypvrrqu3NQYWCgwnb4
	qVajpsLQCYIlsIAXfuvQp+OD8LohbDrCpN8Zmx14X
X-Received: by 2002:a05:622a:550f:b0:50d:8b23:4948 with SMTP id d75a77b69052e-5100e1dc544mr35013851cf.46.1777379559635;
        Tue, 28 Apr 2026 05:32:39 -0700 (PDT)
X-Received: by 2002:a05:622a:550f:b0:50d:8b23:4948 with SMTP id d75a77b69052e-5100e1dc544mr35012991cf.46.1777379558899;
        Tue, 28 Apr 2026 05:32:38 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a774bc5cesm34221405e9.1.2026.04.28.05.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:32:37 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 15:32:29 +0300
Subject: [PATCH] arm64: dts: qcom: glymur-crd: Enable LID sensor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-glymur-dts-add-lid-sensor-v1-1-470cc168e70a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN2o8GkC/yXMQQ6CQAxG4auQrm0yjkSCVzEuRvqLNTiYFoyGc
 HdHXX6L9xZymMLpUC1keKrrmAu2m4q6a8o9WKWYYoj7UMea++F9n41lck4iPKiwI/tojJ2kJrS
 pAVoq/cNw0dfvfTz97fP5hm76DmldP6CsJjV9AAAA
X-Change-ID: 20260424-glymur-dts-add-lid-sensor-e3da709a7ee9
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1954;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=B6ohoI+p4dHy/xUCsotP6MF75KavVp/Y+BZEzWlGK4w=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp8Kjj7GBF5dVL8mZG92IYGPXYjAwbwy1feM17O
 r0xJU5uONSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCafCo4wAKCRAbX0TJAJUV
 VovyEACo9SlO4Hoa+tb8xPbFgZP8sZ5yA+k8srPv+QSP+E2a9wkBwQYIjxfAMMh2VvHTL2RwLeN
 KgZ2jnP2JzDzdfm+44BPmX5q91a8ggMqs4TpS8JwpttffAlTtuGsG7e7UMFCsw2Jw71iwxldGt1
 haHeO++I8wAvHF0RKBOBgUXFSfXntnFyqjkyGVrX7rZdsici5sSFy8ddsifjV2w/s0NWX2MWKAd
 jC58QJmhjEyYpCVQKlwoJ7g+LQy2zjbNyDxTKEJN6U9blJwbrg5CLZsod8k/vy/4wa1YZPsgX3w
 TyWAwzCwAGUAa4osvyRZf1wbvr1468LddrnOzkwr49KZOIdGSBDSxWl0bf2tHo8s7f3GwwNTyDQ
 FW40ckMAWEhs2d/zWrqG7EjTQdUh4Dik5I35vtau/kZgKGe5VozNO7SabFyfcfjtEjs3taNT2u+
 ZiPJdnepq5Ek2LhyIBfsxLztSg32W2ztqjAvJM501gGmhtBsCA434S8YiN+o8C3Zs1VQJDFrZz+
 sMLfWMSzVy3XkYKFYIHBfQFnb4yXKqazd0NqPc4kf9AHhXYZC/qyyk+wQGy59IJHACd4uo41x/k
 TZzLLjlDeuq45BzSwPHYqpcGJ+730RQrhXLyBJjPIGLxPUO+saibF5usGpyM3MaBJcBz2QdUcbC
 IkU0RsU0xQSRwLg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=a/0AM0SF c=1 sm=1 tr=0 ts=69f0a8e8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=PvJN2xqvyYsZ1Jizr6wA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: kQkoPAxUEbpW8MCm0D3y8NH6kJ0Ct7o6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExNiBTYWx0ZWRfXzEEIkAyDz2mP
 vhCU/dZRK0EGbkVnvdacTg8mOlmmzRe3zJRLC+F/9llww1ErmxlbyNiCzKu4vL6preM5rqWqneK
 HcSzT5nGTlcp4ect6coqQAK9TydQutbDFvhlP8K8S5Mc4mhy8NJN6PAIuBhNS5yhWnlg+HoTbkd
 iy2Acz58sos4uW4fwZEybXUH2n1iy1FPBO9AAmYLFiVCXLG0how07leoDOSF4cafnDeLyxZw+4d
 NemaIE9dDeOyypWJZ+srgzpQblmAV2IUj2UFzMLzCRIHhHs9kJ1iGF6Fg9d7xEoVQCpbKrqNQBG
 hmh7/R9fr04WRIeSSrFDs+A4imyXdezSUqb+NmR+Dhe28BlBd+c2kzQnrfDydGjoUT9O1IAyCUJ
 MDrm6zNSj1GspCnSHz2PjRCHuO/+ZskyKyQBdaZFd1tRUNz9vdBAm9abGLX8wL7M9RHOkHuF20t
 RWTqQUPo0CP7s6LLlQA==
X-Proofpoint-GUID: kQkoPAxUEbpW8MCm0D3y8NH6kJ0Ct7o6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280116

The Glymur CRD has a Hall-effect sensor used for detecting when the
lid is opened or closed. Describe it as an SW_LID gpio-key switch.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 2852d257ac8c..357d4ad8380a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -10,6 +10,8 @@
 #include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
 #include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
 
+#include <dt-bindings/input/gpio-keys.h>
+
 / {
 	model = "Qualcomm Technologies, Inc. Glymur CRD";
 	compatible = "qcom,glymur-crd", "qcom,glymur";
@@ -44,7 +46,7 @@ sleep_clk: sleep-clk {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&key_vol_up_default>;
+		pinctrl-0 = <&key_vol_up_default>, <&hall_int_n_default>;
 		pinctrl-names = "default";
 
 		key-volume-up {
@@ -55,6 +57,15 @@ key-volume-up {
 			linux,can-disable;
 			wakeup-source;
 		};
+
+		switch-lid {
+			label = "lid";
+			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
 	};
 
 	vreg_nvme: regulator-nvme {
@@ -565,6 +576,12 @@ &tlmm {
 			       <10 2>, /* OOB UART */
 			       <44 4>; /* Security SPI (TPM) */
 
+	hall_int_n_default: hall-int-n-state {
+		pins = "gpio92";
+		function = "gpio";
+		bias-disable;
+	};
+
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";

---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260424-glymur-dts-add-lid-sensor-e3da709a7ee9

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


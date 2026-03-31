Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F220B3A7F6B
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953470; cv=none; b=YSGA6RhhxcpDiJKOm7qXRh7gKOC9szse+PpygWdfMUvs74/NCCRct/bW0KHSjaFBzU5kgQW6AYeQ+UGyvPEz5UssgdmoKY6sSWdHRlqyaFUOecajYK8ROstQKgErcSXq8zzbjIkzEaPaq8Dq4kBeJR7aYYFwE5fmJrhmCDss0zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953470; c=relaxed/simple;
	bh=b2MyjTh/0xz6ib4yHca0EkEfXepil43InwNbMtORt6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uYH+c0Y8pX7tsOyI9175brSSUYO5wPsMV93sv8YvFM/S3Ih2+8SbsaZ28qNAOt5qZpbjU+WDov1wjHqaOVdDxJmeaWNNwy3VbvSKBOy/fPS25HCkoYTMVf2bBpz1jI2jzPvjKUVl3jMiShnywQna4GgB+jjBw6jmW4LV4XaL6go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtGDVbj9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1lT8WsV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtGDVbj9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1lT8WsV"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8jsqQ2049373
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HOnD4xUigc9iMV67/Og7HQ39vmQgl+luQHSux3UUNd0=; b=jtGDVbj9CvgRGnfo
	K7ZN+vAoPMsmoOfr3zkR48X2jPMQjLoJ1aGJVLAQ6ePryH/qzrm1/2X7PP8WmUJl
	5lw/6mT5zCKuJ0lgW1E4cBO4yFtxWC7TahkSxr/TBJAsB2mzYFoI1h+RkPIrxVc8
	/lnR8iyCRBgMpcQGBaGCf8z3w07qjVQA19kUxCP8+PPNCICo7Z0hRJCbO1XQqnsH
	hI8o6wgYAlSRu6kQnitmMSfgNkVYgjvL1hlF1SJ7sX0JYAuo+QyY0c4Lbk4odNPT
	LVdqP7e+CVE94ciXUWPrYR0HLY0ZNNgnnJzngjl89RZOgcJ0KciH7eQ6Uywv0/VO
	aUXrJw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1yreg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 10:37:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b323c43fdso33284251cf.2
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 03:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774953467; x=1775558267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOnD4xUigc9iMV67/Og7HQ39vmQgl+luQHSux3UUNd0=;
        b=G1lT8WsVqM45cNKC+LnYAtzxpc46ToBQt46acZl3d+HtlnoC7df6iZx5FKl2PYidcz
         3xkvXe6BgFUzbtwU2v4mK7Nf4CSqCwzyBprWmfu/Tv+juApQ7TIp8wcDmLbGek72aZP5
         tXNuLovF/Kt90pJSbcvy1WT+d/c5JXHfQLXnoenLhjzCv8CGDnav5A2CYCdRrMlRgxoh
         4B7ubzc/ruDw2yS5+9YpA1DTmVRLc8hGzbDlrxP0R9kiD3wdyrDSIsojCLxDyURgZdlg
         rojjo1FHRh4pNMEOVRt7cQwQyBsRUCfRFGbdIUFDknEF7fZWXVY/bNcJY+Rs382hiiT4
         IpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774953467; x=1775558267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HOnD4xUigc9iMV67/Og7HQ39vmQgl+luQHSux3UUNd0=;
        b=XT/xOgkYbavkagfUHm0qoUtXc75u+x9KI0VbyEmE5Yuh+CIGFKWCp1n7DWcyJkGDf+
         l7CFmEoSMTwhz6Td0LF27ARU1n+wa11c3vArNM1gzRYCX/UUnwumJsTFpC6VtA80PwCR
         XoWbiPnFzabhPeH4ufP2Zd+H6kg2bffVliDoo5D2NBDeXHLJfHMQQZQGcwPKH9xltOGC
         sp7y/E44dKEfb7t2mreBUbv6sJ23Yf5t6tt71TYYqLVf20qSF9ZsiGlpO+J5Lwo2u7DU
         LhDJoSTiQT+hGfw3/hfXzor2FVkZhZTJJoQAOS6VAQZPNRGpjqwP1CAB51ERuni8/Jvf
         Mt9A==
X-Forwarded-Encrypted: i=1; AJvYcCXlK8oxzAZy2QYuoR+frzO7oFrI2GV90gsRoZQUs6GSshBONCEv3dNqaM4pYVUeGLx5cQATha/uWsEC@vger.kernel.org
X-Gm-Message-State: AOJu0YwrHi3VRjzUtNjNLZIaotxgr8Kgf6Ury8MLl8ffPtDzf7tT5SU9
	lK2FmwER8IAHvuyemF1yjJY5vQgZzSSm63Woac3PcTl7L3pVA72PHMh5qZBjxp9oyIwmB8QBb4p
	mhNoFKQlOeiDUnXEdZxzPxOsUTyyQB/j7MUa8kjikcToUwio2SwJ+GXUYssbsZUIHIrMvCEwY
X-Gm-Gg: ATEYQzxgzDLI1yPAyJWcCpay8XbZqQr3htoSXMF8pBoY4H5T4Wki39cpydru9zJbZr0
	OUUkJyUSagSpbcjfvHLdJ4RnHuGjbKw2rWOptuZfM9JIongE31J7s+7HLnXfcrINYj3TsVxOt5F
	xzTZeaVuEHtIDp7P/LIQ5AQC7hwk7/vsg0RKG3CjLBAx8/74CebhWZ6E1npy6SPRF9pue7eTs3d
	7LSBMb140wFqAjVzTzo6tG4K93egHkZTk45Jc0MvtgDkVwbYTXjEXazoLwY66kzhcxa2TBwLJzL
	Yn0yugcpcuPey+e9Yw0see8i3g8sSN8R9vJqzl/aR6Pe2kwi8vewZPRB2pXBPtmlQnr/1dWkPKa
	yHz3HIsy8YQfvDW73vt7qDuOGn5txBA==
X-Received: by 2002:ac8:57d4:0:b0:50b:4226:9250 with SMTP id d75a77b69052e-50ba38bd200mr208733411cf.44.1774953466947;
        Tue, 31 Mar 2026 03:37:46 -0700 (PDT)
X-Received: by 2002:ac8:57d4:0:b0:50b:4226:9250 with SMTP id d75a77b69052e-50ba38bd200mr208732991cf.44.1774953466350;
        Tue, 31 Mar 2026 03:37:46 -0700 (PDT)
Received: from hackbox.lan ([84.232.191.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887eb5aff3sm34178175e9.15.2026.03.31.03.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 03:37:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 13:37:22 +0300
Subject: [PATCH 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-eliza-adsp-usb-v1-1-d8a251be20c3@oss.qualcomm.com>
References: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
In-Reply-To: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=8882;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=b2MyjTh/0xz6ib4yHca0EkEfXepil43InwNbMtORt6M=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpy6PziWm1Is/ERpHi95gFqyo4G8yBCGA8YW8UG
 EVJQH1khYqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacuj8wAKCRAbX0TJAJUV
 VhMrD/9aByajC+Tpfc2/D2eIoc6L5l/leAK6kiCbsmHdUOGdplSIzLAujLctxGY2Sp5oF4+/u+1
 abv9HASjoquO2Mq3uhDqJEOYMOxCZB/xW/H6fTzQ6Yk8XGg+ilfrS4PreeWH3kcVgo2kpjFxiQJ
 gzUYLbzTjYYxhvxpIgEnMy9SLQLeYwB8GvqPW9HeKMzmNyeHWkB+muF29dvJVtDrxAcZQUs9JIP
 QBpZFIUfG5CAToDmjnbHLvyhNZTElwsGtY4SO8+xSB7IjUaEDcO98/qVDORycO/WSiAmy6c8+fB
 3pwYr5wCMWyXNsEECjAworLmkJ+3vXV3AIptpD1Ux3P8/pEi4MU6oi/fjQkd6crEs2+DGpEbANh
 jnW+zDKpV8QV4qpYnsh7uJEd1q87lV2aDl2fgByIyQ0WBVJDHctc2rGRxgmFxZZHrJV6Oezs0Uq
 m54SWoZqxw1u3G1PcCHeSHCna3i7pQGxH1hW9vQeGjTaKh9K2CiwhJ4mhsdKkBFOfllWUrW1+Hd
 UBKAnw4lzisKmnQuTHd6Cv5CBHaC3tIEt7yF1s0pjjzDHT936gQUcHoJIkPGH5J9Y0goyWkEQAZ
 SDvdbDXu/pPj/r3JAshIIS9W1JUjabNJmEX3ahFKxfunMjM2G00OkImq6x+oWGVagu2Z9JjYn2Z
 71c0hxrDhpjd7Bg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: SN3bnzljsvdp4OFDvIXSkaYfRzy6e_X8
X-Proofpoint-ORIG-GUID: SN3bnzljsvdp4OFDvIXSkaYfRzy6e_X8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwMiBTYWx0ZWRfXwKBMkovNF09E
 5y1uQorJLfn47C409DZFHruZ5xByJFLmBcqr0Kicd71TBFRrXfyczdhjgY3eAyv6fhtz0ZMiW5h
 59moch/AlHO+ucpdvai3IO1ONzGhPLM6PUi/Ivyi6QH9rilM2Wfs/z4cuOn7OPAXzEuKsaQEo01
 r+o/foywpdm5zvB/r8kXwN9yY3xqeroFByHgOzmcFkPsJACev8BwkgyfCFELyJHyUlQbYF6hQOn
 kHegV2OTOXGKiYXM+yufRTb3yT1v/+jgrH/8nTC20R92PddgONb2z/XU8Kr9Ca8n1XlB2OreMC0
 XIz0eUUkdjPUpW1gbWtBi23+3ajSMya+t5iaoufp7tKJlKCoBzCLG7gNb0qT8aP5eVrxSmY5SsI
 Qilp4Vii55uLuCVGuSoeKlN8VNra2B+QxcIBBAXG6jysR3OuWeFPqW3lkcnUl/thiYbh1bbIJzP
 Oa4p0JXHTZNzcY+MfDg==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cba3fb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=1UCgTMz9MQc3icybWezSFQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=0aSsbouhDs5aZSzchFYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310102

Describe the ADSP remoteproc node along with its dependencies, including
the IPCC mailbox, AOSS QMP and SMP2P links used for communication.

The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
combo PHY and an SNPS eUSB2 PHY. Describe them.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 261 ++++++++++++++++++++++++++++++++++++
 1 file changed, 261 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6..37baa4b240d6 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -6,10 +6,13 @@
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
@@ -596,6 +599,30 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
 		};
 	};
 
+	smp2p-adsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_LPASS
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		smp2p_adsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_adsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -624,6 +651,17 @@ gcc: clock-controller@100000 {
 			#power-domain-cells = <1>;
 		};
 
+		ipcc: mailbox@406000 {
+			compatible = "qcom,eliza-ipcc", "qcom,ipcc";
+			reg = <0x0 0x00406000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			#mbox-cells = <2>;
+		};
+
 		qupv3_2: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x008c0000 0x0 0x2000>;
@@ -862,6 +900,55 @@ tcsr: clock-controller@1fbf000 {
 			#reset-cells = <1>;
 		};
 
+		remoteproc_adsp: remoteproc@3000000 {
+			compatible = "qcom,eliza-adsp-pas";
+			reg = <0x0 0x03000000 0x0 0x10000>;
+
+			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_LCX>,
+					<&rpmhpd RPMHPD_LMX>;
+			power-domain-names = "lcx",
+					     "lmx";
+
+			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			memory-region = <&adspslpi_mem>, <&q6_adsp_dtb_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_LPASS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "lpass";
+				qcom,remote-pid = <2>;
+			};
+		};
+
 		lpass_ag_noc: interconnect@7e40000 {
 			compatible = "qcom,eliza-lpass-ag-noc";
 			reg = <0x0 0x07e40000 0x0 0xe080>;
@@ -883,6 +970,167 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		usb_hsphy: phy@88e3000 {
+			compatible = "qcom,eliza-snps-eusb2-phy",
+				     "qcom,sm8550-snps-eusb2-phy";
+			reg = <0x0 0x088e3000 0x0 0x154>;
+			#phy-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+			status = "disabled";
+		};
+
+		usb_dp_qmpphy: phy@88e8000 {
+			compatible = "qcom,eliza-qmp-usb3-dp-phy",
+				     "qcom,sm8650-qmp-usb3-dp-phy";
+			reg = <0x0 0x088e8000 0x0 0x4000>;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+				 <&tcsr TCSR_USB3_CLKREF_EN>,
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "usb3_pipe";
+
+			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
+			reset-names = "phy",
+				      "common";
+
+			power-domains = <&gcc GCC_USB3_PHY_GDSC>;
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+
+			orientation-switch;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_dp_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_dp_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_dp_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
+		};
+
+		usb: usb@a600000 {
+			compatible = "qcom,eliza-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x0a600000 0x0 0xfc100>;
+
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "xo";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>,
+					       <200000000>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			phys = <&usb_hsphy>,
+			       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+
+			interconnects = <&aggre1_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
+			iommus = <&apps_smmu 0x40 0x0>;
+
+			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,usb2-gadget-lpm-disable;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,is-utmi-l1-suspend;
+			snps,usb3_lpm_capable;
+			snps,usb2-lpm-disable;
+			snps,has-lpm-erratum;
+			tx-fifo-resize;
+
+			dma-coherent;
+			usb-role-switch;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
+					};
+				};
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,eliza-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x40000>,
@@ -957,6 +1205,19 @@ tsens2: thermal-sensor@c22a000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		aoss_qmp: power-management@c300000 {
+			compatible = "qcom,eliza-aoss-qmp", "qcom,aoss-qmp";
+			reg = <0x0 0x0c300000 0x0 0x400>;
+
+			interrupt-parent = <&ipcc>;
+			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
+						     IRQ_TYPE_EDGE_RISING>;
+
+			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+			#clock-cells = <0>;
+		};
+
 		spmi: arbiter@c400000 {
 			compatible = "qcom,eliza-spmi-pmic-arb",
 				     "qcom,x1e80100-spmi-pmic-arb";

-- 
2.48.1


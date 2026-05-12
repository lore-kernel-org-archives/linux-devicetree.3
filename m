Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B803388875
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588832; cv=none; b=b1v9ovZaBK37SPK22uV8mfvx5oPY50kGCrSW6hJvnqWrp+NIP8sHTFSQsEZl7cz07pwORi6mmoElM+pzyrDgdsUnYgSMk9be9PA/0eCvzyhGqwhVqhHtFVkf5URJmdFOqEbfN2jcZsHE/nSo76fEzzwC31KkCIgkmIJMVHIeUKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588832; c=relaxed/simple;
	bh=O3W9u6I/uPX9HhlT3a0kG5ilSUgWDIjADrmlLyLnLfc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LcSIxrUhP7U2BHA7BIirI2zVwxhEB2ZFiCqUu1ygX3VD4QLdTmKXwm2Iv405j+tWUfBA/tDFAvMvdHJj4B5rQe6tZBmabQePiuo+HsTI7mgM8fKs0Bm82RbzEau809/h435GIvUrJjOLop/Lh1ZL264FMSv5p0m1FwplHjH+UfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9MGkhgT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bOPYjeqH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9MGkhgT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bOPYjeqH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB4aUJ866468
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WjHOrThVTIBcmyJWVRfMmDMksM0DSqKXpeBnVeccCs4=; b=O9MGkhgTefvamtVH
	X8pF8Or2aX6CY0tRmt3ZDkuojhUkRhal2kcEWHzw559PocEL9pkZIxOXFqx5BqVH
	QftsW4i5cHcz7t6Ah8pB39uI6ho5WGrKG02RP417flcObIFDr1tdJj3WzvXWOu74
	rOFUmWR5NK0eNzeW8pAifdlNCRt2M5Q2zPtJ0zsr+fNCinDxmePJZeS1S5MbtCS/
	JCOxKG+++lHMZpP8U2wwa6/bVOpucWSnuBaWUFoVGn34b+8ftCXGR+BcWKlyc2u5
	oWW562TSiwuWtzS61ROV/w4MpelZd/GU6iDnhMUYIHl1KN/enAv4BlcKNWDJNsTr
	s6wr6g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv2atnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:27:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514d2b22e7fso16817231cf.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 05:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778588822; x=1779193622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WjHOrThVTIBcmyJWVRfMmDMksM0DSqKXpeBnVeccCs4=;
        b=bOPYjeqHdeQh+uPIQSTxX++dqKWP05mZXW//sDnuFHsFSXUkUWZsMbmH7T/KnpqYEX
         MBGKMr4WhAUpmXsZu4bJsurA47U9erpjoWjkxV41vwlcubSDdftqXNAfrgKanX44bD6W
         PbZoh6x6FWkd/iKNwYx2/09/VvWYUBeM1X9L2jEPpql3cFi+nhF+3eYmOsrPkT8cBugy
         2VVlIGtC8+di29uGVM3QsTWTUAdU9iG4uknzGAsO1np9fUVbEgMvyJLnYJUVeBDDmiOt
         UC4r4MrxDQ5Rr6V5EryAfboHSI/j+mT+bbKWnK+y7bZ88IiZtvYdLiQPNsmmXRlACp+J
         ffpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778588822; x=1779193622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WjHOrThVTIBcmyJWVRfMmDMksM0DSqKXpeBnVeccCs4=;
        b=Zdyx6SMyZnVQqPB2gF1niop81/Oq7U1vKauIII+h5M7AhBMlT80PhfuJKlc1K0OypQ
         Y4EJmjwhTTywytMVKUeD8fwcT+GN6ZHZAnpZYsRbW6RjqBicOoxIGR21po1q22oU6V82
         GMAP5xCi6oLtsaYRyUUvxJb3CEq2y8S/fMQSnhvGiqvBs27OgfTKYNqaexTD58ajzixk
         4HwNw1ZDutUl+rZ6ydFVmJHZsaPnpIS9E0NXvt4w21iuy9i2mz5r66KfYtwlEsjE5l+m
         wVR9wuX0sFJeaY6019wCYimopnxi6hsw7OHaoBMf3P5h3GXNTpKRDeb/gcQXgLeWxOYG
         XA5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9E12i7Fxgdg3RN5GgbYEcVIJXiIe9qWFNYAJyGcPlz6zs1QcnFEq04HKiWGpavc3+rr65Kg6H99fNP@vger.kernel.org
X-Gm-Message-State: AOJu0YzkVBGVyEhon8au8Zz4v8hF3/wU5vVvSutxaYdkjM4pH78rFy/h
	+7wMagRseNiIC/O3SAutmfj7TglkqejMcMBm9iqhPYvQNWEjNkjRpG8X1pqYhmRLDrIaxy4N6QH
	ijWfVqQqJHdjJ0orZVQ1ry7cVVBkCcgS+v2dQ237jo8eLZY4iwfQ2Ntql7tT6fIqc
X-Gm-Gg: Acq92OG+EFbV7oCECuz0Hsudqck3GjUCi8+jzfpwb07gPchVZyZl2oMBvKB85hm8vmX
	gCNwJ4aoGc3GyhobDURl91gHNqRMLGUUV6IE4kKmJaxA2dJ5BKsOqTpr3r2ayVPozJw3Oyd09KL
	vMq58w34e0LjGtLlM0YFPP7JJonORht4WRII06cFiR/aRMEv09uFNwz5DxLChegF84VxfNq+Pcf
	HQE5xwJHguzlZZEG76j8t+PfdBMtMGH+T7tL8uu4RqqKZUpxCp/sR2s2JLg+zSG6K/suIY3BUcP
	XCgnbCWYOpkbeAJOSvoNjD9BsuYcTk8jVRDZVXlr5LDDqMSHiXKesFqrRlBYQiBcUE9HzxvlCE0
	W2txcr6zSsbd7vdLrDf2rvgX/kluZyQ==
X-Received: by 2002:a05:622a:13cc:b0:50d:a3a3:e612 with SMTP id d75a77b69052e-514d1c72a8bmr38099791cf.18.1778588821336;
        Tue, 12 May 2026 05:27:01 -0700 (PDT)
X-Received: by 2002:a05:622a:13cc:b0:50d:a3a3:e612 with SMTP id d75a77b69052e-514d1c72a8bmr38099111cf.18.1778588820652;
        Tue, 12 May 2026 05:27:00 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e90681760sm43089135e9.12.2026.05.12.05.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:26:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 12 May 2026 15:26:47 +0300
Subject: [PATCH v3 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-eliza-adsp-usb-v3-1-6420282841c2@oss.qualcomm.com>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
In-Reply-To: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=9031;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=O3W9u6I/uPX9HhlT3a0kG5ilSUgWDIjADrmlLyLnLfc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqAxyNKB4bRopd6uVGaqjZ0L4NVlRoVcLs7ObZ7
 2RgxkiZCi2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagMcjQAKCRAbX0TJAJUV
 Vg/jEACFV+mjwqqC21c6UL9pXhvD/ZuYPxzQxvdj3odAjFPGejYKs2i8cgg5n6D7mkUeYyGJLPJ
 NyQfC99VcYCqoisPsQpadlvElVwzGUWXxVOrNkaXDe+kFkYv+bPh4WfxRECLLIv7nTb8y4pM/rm
 BNPH+7baaLl6hraxmXLLkO+it8dtlmCYYIEeeaJZh+svJcOJe8dX40GoMbpLyX69SzslbeQGlaa
 49WOqyTRyMTtJrVxOtF41OFqYT3fgsRNRk9U9Gv+4xBBieolElw2kvzVu00qY7Ea+OohTSczzlI
 euattgmYPndDoH7C1Vo5oSS24dJ2kWTimT9ptaaCZ7fm1MhIkMfXooyNssildpE4StCtT8PRlUQ
 ANgLyyb/mOQ56zk5V64dBJcAQz4xnSeiLbC0yf8B0JOs78WV1Yh9oKGg8FMWL4SmoL8eO00BoFe
 Dz/NclGqaDzCKgCekD/qIS+ptWYnI0modDYH/4iKSvLx18HM+rI6/u1Uj7yOprdK49YWqzFTZ0h
 nHPPrDMrIyWgG/uiiYgRSTH8AVZILnUHLg5Tct0CVB33XyvfBJcme/vMvRkstLvYpblFHI8l82y
 KPsoVfxhVEsmlmfsyh0fDLqe7xGQmkc3CrT2e4AJ03872+KV98/iB+XSlovdTiq2bQ83FzjxJey
 rGyXTs3GHsAHdyQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: ATISX4lbc6Pq48t7VoTA8_YGOhzCAe_y
X-Authority-Analysis: v=2.4 cv=Mv9iLWae c=1 sm=1 tr=0 ts=6a031c96 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0aSsbouhDs5aZSzchFYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ATISX4lbc6Pq48t7VoTA8_YGOhzCAe_y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyOSBTYWx0ZWRfXzlCL3WsaSuPY
 gxzzlmvGwt7bXx/mMRUpIh4M4l6WhRj4F7PHoYNmLFDKD29fYRbSduDnCJ8tEemdJltLzZadODN
 zBO85ywqfvYKE/k8LXKqLlReq8ABXnqGMv47mNnpFU5cmWpAAgLY9lxYHeeuXmK3gzlaZA61wu5
 Ur4m8faPxu07cbNPQhw+4n8O+Et/rygWR7soEwXoucyXRr8B1v2b1iVKwxvbBPdbBlCwl/e+5/p
 5tbAnqNGmySEtw6tGx+N2fkAy6Yu0a3bbpchjvbxshyaCpNeHS1kYQVIgWrE12RnYqUZYObjMM9
 6a3ihYH4z8H60uYjJKcwNBtRChHwwktCpbRMpH+We0KuCYbMwKKhkLJ3d3guWVE9JanYugB9o9X
 cK6CyK0Ayt0JQ00Ql9zmQrcMWV6U/2gWGRTie6LGbK2RDK7iATEPf0GCGmh59t5OjY0l2Ilmikj
 tu7ZJOWmceIQn9bUAhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120129

Describe the ADSP remoteproc node along with its dependencies, including
the IPCC mailbox, AOSS QMP and SMP2P links used for communication.

The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
combo PHY and an SNPS eUSB2 PHY. Describe them.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 261 ++++++++++++++++++++++++++++++++++++
 1 file changed, 261 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6..02df7125b2a4 100644
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
+			clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
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
2.54.0


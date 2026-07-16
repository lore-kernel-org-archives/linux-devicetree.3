Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D54A388395
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218742; cv=none; b=DSmfPJLLM4arjnw2hcH08oFSY7J6sawU0XcAulOsjZNJk+JY5TUS+E59p1PwR2gDXXO3uMNeF6dWZ4Krz8V56kureKht0tZaFquXDQ99O1EsN54T/1VvDG3E9DMGzg0x3HN4REEufg6JXpOEm9LdXdOwzM2Bxwkzn2XcqbZFs2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218742; c=relaxed/simple;
	bh=EILi4Z/HlIjZKXIC4ZrM+OocFMeGQtXeC7RenzsUUVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VeoiBXteOKJwfmC9an+7Np/TDOeiw/dGlspt0Ek0AlL7S3VrGfcW2GvwXc6f+Nzrs+w7rBIdDvlSse1jeg/pZM9Du9I+d/k48ZN3RB1vsLS+036fHIOPd6JkyVKY1hWXzo+q8ULNC7JPG+AMUNRMZJVS914lguj/1nqKuBquWjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c/rtDTJD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YthqtWeP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c/rtDTJD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YthqtWeP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJtYd3043345
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A3c/IYji9aAg2mwzDYhmuLrQNs2xKPwSpSPEjBK9EwM=; b=c/rtDTJD2bBUuIJM
	hdttu0V9zXhG5WmLieds7CmF3jBFmc5tJNz1pjRl487UTSU+uw3uRYydfFzSkqhZ
	c/Czndk/hi7/yUnUcl0RfatlbRBMkd3LU8YLsZlbstfG0L9idsCR06LcWQqwuE34
	AApHWciA5NMznkYM0E58V2lGQLnnjoxY31mZdBllmQVbVX5O7F0wtM4cVBPYgKKH
	zkiaC3Ltn0qRnxvX/5/gv0RMHkuS4h0Q7jqE/ssWa9uIn/xtXID8l7poUdphyT9z
	b3pMOC1ekGaOK2yEI9UM+j/HOLBSDkyfzMaGDf2HHyiPS7Q0Ag02nAqfLySMVeh2
	2uO5aw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf2c6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c07f25de2so44624451cf.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784218734; x=1784823534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3c/IYji9aAg2mwzDYhmuLrQNs2xKPwSpSPEjBK9EwM=;
        b=YthqtWePpi+QLwcmo0UlVsjHLio28YYGYWRTUPbFcYpCzMtrWEVOG3qF7y0oyT+RVF
         Hhml9PdrEUD2/KPVpuUAvJR5m9cBs8Fg4HnuEJBnqDdcSEpON+PcioPfo21uGNqUjJj2
         CSEbmGORx1v/TOXTPMqbqOPUrCTQzrkiYHmMJCP30LgvPAT/x463QPJVUiOqRdXtKgg4
         b6DtMv1DqbiDXmvbXOw4qTgvATe/E2w7UzO/QrHwyYP2wTDd+lWVFheBIvpWCDSJPsLT
         L25OVab6z/DC3nBnbJPR3h8u1eQHoOyoywI+vi0b87Y/VyBtn6n/SVMOYRTJbdOI3CsL
         pKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218734; x=1784823534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3c/IYji9aAg2mwzDYhmuLrQNs2xKPwSpSPEjBK9EwM=;
        b=fNkXJ4P6rDl23QJji/xQVB+91b+viAvm32nlJcOSsN7+Q8hwSfQaFHsIhjPUUbsIXg
         ypRQDLYAgVC0KdtPoKCKHnRn2Mb3k/ZgHpoQL1choyvifrJ7dDGF3Sa5G1uEFrVL2gM2
         X22IC5GKRNQV8Rah6Y5xERumKsv52raJZs9SW9rXHbkQO16Jgv67SC4N/LMAePjQMbCO
         3Ue5q9mNh9yuN1cflkDcKy4+4pda7uRQHgzThCea+dv0LFzilhhoXHgsiV7svRSVze2y
         rIuJKc68cyiJkz00UHH31tv45kSDVsQZ/idecNlmQyDhTN+CSwFagbQzqRMdzw5Lb+AZ
         ZCBQ==
X-Forwarded-Encrypted: i=1; AHgh+RpD0uRwVFAeOqxJRYHWJiVeD9bNuE+PCSh33MHRDOjGLIJTtgmh6coKoFGrFjznceSFWFLGhq49vsdN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Bzvdqq/epEJLQF4Z3X/RhZ76xNyuVL179LGBdRUEJEDCSg9w
	eLwSd4Zfzi7azODsLegvhwo/rqt6JZzpMy96hh2zNjTkAidZaZfuQafNWBgyKNhFHMwwh8Xv+8J
	Ef8Q8Ijhjy3VRxtALI0uYi3gm3Eq2OBNVFOgrNplRo1ZraJeZW7K+III8eQiHQRvG
X-Gm-Gg: AfdE7cn8yNnrRLsRmDlBiXBb6nIV8k/vRCi2jVGTHSlj8S2Covo47gDsbarUE42Iab4
	Bs4UfkNCJcmxm15hH+WwPDc+pUZO73QvQks8nDdJhucznc4oQca2jToFyIdkFQ0BbDAhgEwSMfD
	LiNhyjFWt3MPdSO37TsWJAbowK7bi9K7uzENp+547d2ifkRH5LK8pgwpFwrummk9ZHFo4SquL08
	JP/LD9khnm8n8pOnwjasPyoby+VVYFhy2kftx2c8bf9q0aWwldaPhS1sQIYt1u/4I6lEfCP0bpB
	uvacoiSx2AK22eeZTXUzQqQeCg5BsSUtj1UmOis++MbmApudB9THoGIPz3TP9vSaq7mn96vWMJV
	bNWThKT1imtPW6KY69QSFyWLAb/S6wq2/5PGpG+leNSwWHRTkearJfbDSupAWwYeFzvDlgeKZp0
	deWa1Nz4Ca7YShnSvyfzcMcNGZJTGdfOfPGFhDo6Fw3+ohlHaNoS0=
X-Received: by 2002:a05:622a:1aa1:b0:51c:c37:df31 with SMTP id d75a77b69052e-520bc709f45mr3031551cf.7.1784218733709;
        Thu, 16 Jul 2026 09:18:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa1:b0:51c:c37:df31 with SMTP id d75a77b69052e-520bc709f45mr3031111cf.7.1784218733144;
        Thu, 16 Jul 2026 09:18:53 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744bdddsm257262866b.48.2026.07.16.09.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:18:49 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 18:18:28 +0200
Subject: [PATCH v4 11/11] arm64: dts: qcom: monaco-arduino-monza: Add
 QCA2066 M.2 WiFi/BT support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-monza-wireless-v4-11-9b02e6f549d7@oss.qualcomm.com>
References: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
In-Reply-To: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: FomWG2wFki4YIde-f_t6buljQKqqJyOq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfX64hlux0Mb/U0
 Y7f6oNl0BO9EqbJjLwv0yDtbAiDgRI61wjyLt9jhu1vIdMRJuJBqwlbJQSHZd125v8dAOr+JMjl
 rPcl6ParrnknQNMcgjG8w+YH3xQEEKIx9heAZhhHkyFH4HGfRQeZ6KofUNCIpVjuJrrcUENzGhv
 fWFRxNbnT3tBVgGvO3FHfHx10cHsC3OsEMQPY+9Zbs03JWcfkxm9Be3KonoyHaVSb+GJI6UgrVS
 J4CNKQ0Kf5AdZiCmzexrR/7I5ZoJV/Fg7q76x737Mnroi/z2SB53j95oRD1ajtno8LhhLkdszT7
 eCkRl8yqtRYMjl+ShfEC3lADpLtJzbsXUCnP9o0EIz6kLL/37jkMpIKUJArkK6dO0wSrypcEl7X
 Wn11D0JTo6SNnUrBSTpwQqlqk3vd5QTsjv2XNctqaHtAg7xTC6+bKZUATJgS55LvZ2HvgQCVqWd
 wYOQb/p4MWmO6VX21ow==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a59046e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=EzCDy3pf2FPqfMyO2-oA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: FomWG2wFki4YIde-f_t6buljQKqqJyOq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfXzBP/8rwHHibe
 Chcd0bbAvZXD1BsfD5LRFOFELv5F4uxXm77mdKldsavO2QM35PQMH2qMc/eQ9qGvZKIrRoLIoOK
 OjuTMdutMdD7/b0cI2W4Gf16VbSyG5M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160166

Add support for the QCA2066 (QCNFA765) WiFi/Bluetooth module on the
Arduino VENTUNO Q board. The module is interfaced via LGA and is
compatible with the M.2 Key E.

Add wireless-lga-connector node using pcie-m2-e-connector binding,
connecting PCIe port 0 to the WiFi interface and UART10 port 3 to
the Bluetooth interface.

Add pcie@1,0 downstream port node with pciclass,0604 compatible so
the pci-pwrctrl driver can acquire the power sequencer and enable
the M.2 slot before PCIe enumeration.

Add nfa725b_default_state pinctrl for the W_DISABLE1/2 GPIOs
(gpio56/gpio55) used by the power sequencer.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 64 +++++++++++++++++++++--
 1 file changed, 60 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index f67a554adf956696aeac2348e478dbd0b74f0e62..5e41e637c1c705ce0f3847aa71b229261a1e3664 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -155,6 +155,40 @@ vreg_nvme: regulator-3p3-m2 {
 		enable-active-high;
 		startup-delay-us = <20000>;
 	};
+
+	wireless-lga-connector {
+		compatible = "qcom,pcie-m2-1418-lga-connector",
+			     "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vdc_3v3>;
+		vpcie1v8-supply = <&vdc_1v8>;
+		w-disable1-gpios = <&tlmm 56 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&nfa725b_default_state>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* WiFi/PCIe */
+			port@0 {
+				reg = <0>;
+
+				lga_pcie_ep: endpoint {
+					remote-endpoint = <&pcie_ep>;
+				};
+			};
+
+			/* Bluetooth/UART */
+			port@3 {
+				reg = <3>;
+
+				lga_uart_ep: endpoint {
+					remote-endpoint = <&uart10_ep>;
+				};
+			};
+		};
+	};
 };
 
 &cci1 {
@@ -409,6 +443,22 @@ pci@0,0 {
 		ranges;
 		reg = <0x010000 0x00 0x00 0x00 0x00>;
 
+		pcie@1,0 {
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			compatible = "pciclass,0604";
+			bus-range = <0x00 0xff>;
+			ranges;
+			reg = <0x020800 0x00 0x00 0x00 0x00>;
+
+			port {
+				pcie_ep: endpoint {
+					remote-endpoint = <&lga_pcie_ep>;
+				};
+			};
+		};
+
 		pci@2,0 {
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -501,6 +551,12 @@ max98091_default: max98091-default-state {
 		bias-pull-up;
 	};
 
+	nfa725b_default_state: nfa725b-default-state {
+		pins = "gpio55", "gpio56";
+		function = "gpio";
+		bias-disable;
+	};
+
 	pcie1_default_state: pcie1-default-state {
 		wake-pins {
 			pins = "gpio21";
@@ -544,10 +600,10 @@ &uart7 {
 &uart10 {
 	status = "okay";
 
-	bluetooth: bluetooth {
-		compatible = "qcom,qca2066-bt";
-		enable-gpios = <&tlmm 55 GPIO_ACTIVE_HIGH>;
-		clocks = <&sleep_clk>;
+	port {
+		uart10_ep: endpoint {
+			remote-endpoint = <&lga_uart_ep>;
+		};
 	};
 };
 

-- 
2.34.1


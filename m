Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C633D4107
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784534674; cv=none; b=OjmlFe3NAPk0CQMc1UAxu4tb0sTFoePfTcTzIzn7U6M1m643uqh2GPll1QvYACMxG8aKer37U+chC33hk9eQUj3o5pGCEOI/S2gmq/kGQ7A2+bCrCE0Sh3DTIjpPDimVqSIs9b6eq0e/UrB0DavgRnhlK7eK3GQWHggO6/gctUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784534674; c=relaxed/simple;
	bh=aKn+BDqCAE7bj2HMXtEyzQOTzNrYINfaywFfnH4EjTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ao3lt5PIOB4fyy+h1PEdEivGEKlap/1IOA8S6aZxbqFKAk8dcoc1AxoXD5MmtXv5CqE+YndVlq7VfG8fFPIyY424ii4b/FIAfT57QiT1JHIc1obrMQuCUL+8VCegRbZIkFPVp0viAE1r2S4rVtcE2+gyRqwiysIunWc22oEGkJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=INL42TvZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HiUBqbIo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="INL42TvZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HiUBqbIo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6Ro8Z1263202
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1p0kWGiPSRzk+9UIUD5rcX54pJsmPtFGx4DYvuUbpJA=; b=INL42TvZ4ByF1inS
	lv+kBeeFSQnhn5pcFZNmkypaiMO15lrp2Zje2RWjXwjQrJmt04zxAJIfnFyzbW75
	u7Q69HP1y6Z6E2hw6tYI1mSXXYaKt6B9+49onvqoNe1Fm7R/jxlpXRKepCtCltDz
	InJkwJwlImitSgfcYkso7vLS4QMTXaeMOJ5FlCF+mFl+RY62zEuPUAcpgMZPRELn
	lFGWnZrF6QLnCRsFgc4xvPKW1LHErkUZ9RGLKP5avRqmUoo/a9XKiahoOFXxFv7B
	IlfpzNVUp8sfB763Xri6ezOmVnWQederX4mcjRkyQvtGO7HL6mnWonHx8uQMcTyj
	CJ5Rjw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhn2nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:04:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-522de3c645dso48095921cf.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784534671; x=1785139471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1p0kWGiPSRzk+9UIUD5rcX54pJsmPtFGx4DYvuUbpJA=;
        b=HiUBqbIopCMq8KOaYpplnl5KFWF2/rpbnk8ruzC5MiKXenSArU23hJGk+xYeKNG4+S
         T9DJbeXuC4lv988oV1nUxgx8fac253NSrWLnCbjmJKBLENhuQwRwiRgJ5mcDXYeWbjLx
         1q4eOTmbUlubjv/w1pGiAhruC/K/6M9AaZsU5KXc6cO5npjRXXGRXZTev1N4Mv+4BC4X
         ThAaE49cIfLpxP6DIe7b9gjBj0QzT5mQIp6Dqn5V+A9Oz/BBujpeh+eT5z5t7z/UQhRm
         FOzGjtkIl7hYCsnk6c537bj0wmZQC24P0EKY8NhNzCdS1jEZRyZBN7y0qxLhP5egUFzI
         W7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784534671; x=1785139471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1p0kWGiPSRzk+9UIUD5rcX54pJsmPtFGx4DYvuUbpJA=;
        b=lWhCtk0o+y+AHNO5pdcNIoomG/lvNV7dRyYZtN20M3GzNhye7KQCdO9STBqoCvjxoo
         pohQ5JTOSKSEhECWwrq9Spogc5Xoi8jvNIECr2XHnIFyTHcm/4T32HcoVvrLmxAozH1e
         eQ5yr79Wb3ZU+BC+wd4w5ca6TtcdNf0FH5zXtzmItrLK6syMxONhDQKVWoh8khw0cpR3
         DwYzj+H3t/KaMtmhlu8sTQNvIVQrk6R3VOnkNSj6P74cJwaLsJW/bQ0pI0XjCMKUY8Rr
         vLn4a7SRID1nDhd2Th6QTgvP6+0ojfI+5GI3Q0kOW7lHp9kn14HZmyN3GCIfIEZIMsJ8
         Qztg==
X-Forwarded-Encrypted: i=1; AHgh+RpjYxgMh2bu3fX/uqvriG24JCxVzBO6VcJQMO2YDlDSv74Ln6K4NcxBtwoYAFWq8f4MaczQtRVjosbF@vger.kernel.org
X-Gm-Message-State: AOJu0YwKYTHbILkRcbwI/7LxHf6iJ9mKBNGFIk1dH/KlusoLNxvqbjtX
	cFCZoBMGxwKPnazI0CWTfCNyqRlchZiCj4uFlGiOrdqiQLxsPXT1KLuuaLs47yGlFrY0sDcE++U
	ucmdRES2vtLyo9lrfN3KxMDGTdIPG7nxyHs720PnGIEaZdxhIU8X9+Z37RoCfYCim
X-Gm-Gg: AfdE7cmftVInqb6KgQ9sBV3QG/FG0OF2SkK5zFy273/ykgtkChCq75YhGqPkZoTDGHj
	5Pneha6nfO7lde9BFokFMdJo/WxtRzcEP/nJxn4kizhYD7p0Uykec36Q6Qq8y31nXF8uBRpNMfO
	99yX5kq38Xxjer/YxzsfMgO5kgAMqDKsKlG4FqILM9uakbbQU8nlx+tRtb+vZrGIF5jywgHQoxU
	Oid5PnAXeJzDRyWnq64fTqTpDJq0RAIHC9JjP7Sr7D7WpC2bmMv4FZ2pgiu2vyksZl8dEIs9ils
	/dslU+hFUdg4Hxda8cQw6+92s0Uq6xRM7sTMu+Hg+HWmWDT29I67vIqnpTl44GCwwwpLGa1+7E+
	IGJjSaIHmLnNQFBxWrR8VLNAPmXkzFXg/N1iHGxWi8lRRW4UGXYu70MkC0YBHElmzht+U1Kcwuz
	hHNwVikO6NpkPMlIbAa498HS6r5ndukeDTHnoWxB4CeAvVGT+GaFc=
X-Received: by 2002:a05:622a:4d8c:b0:517:58f6:29c3 with SMTP id d75a77b69052e-5213ae554d3mr132426211cf.32.1784534671542;
        Mon, 20 Jul 2026 01:04:31 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8c:b0:517:58f6:29c3 with SMTP id d75a77b69052e-5213ae554d3mr132425861cf.32.1784534670986;
        Mon, 20 Jul 2026 01:04:30 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e7000c3e2sm4256542a12.30.2026.07.20.01.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:04:28 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:04:13 +0200
Subject: [PATCH v5 11/11] arm64: dts: qcom: monaco-arduino-monza: Add
 QCA2066 M.2 WiFi/BT support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-monza-wireless-v5-11-69ec6743543c@oss.qualcomm.com>
References: <20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com>
In-Reply-To: <20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5dd690 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=EzCDy3pf2FPqfMyO2-oA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: vGwgKc98SHIlfXnfzkxomZ-COSKxgwCo
X-Proofpoint-ORIG-GUID: vGwgKc98SHIlfXnfzkxomZ-COSKxgwCo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA4OCBTYWx0ZWRfXzHu8AH6+ukRa
 elZv9/PaEPciAWy02IJXJQc5O0CTgvfrTI6DSGlE0PSDfip44IyNo/hVK3cNJHMrofhjNVskVQT
 o2J82gvT1lcPnqUeJ9VI/aDAiTKjYcAKbxikwDciWs+su9VXc/dzHWdwkMTuTeIe3MeRp/cOHyf
 7qnMQRyuophPd7DkkdNw5p6fjPSD+UsB1M3Rw4VvaxFpavcSbagGf8MvJVUcIwjliwg68xXThqi
 SxhqIsySUQrAKCbg/Y6KgDXBY3jFoKzCSl/ii+spWtzalu8C2GGFTNj3YFcEOjfFNbEbHcMR6Fq
 1asRgBlpbVZ9oD77rrnQyDOVJiJSFkh2WjWWpviaql1yT3MH/xDpHZsechQBxnqK3rLDTIC3PGR
 gDFVM9RGTXQ7OxChnAEXY9MlaZja3lLPizIQWQ0OK1Asj0kF9DjIgDsLB7gqS9o5lMxQpDDKQuG
 OyWiDxr2bLJSqtualzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA4OCBTYWx0ZWRfXyp+QBVE5hTds
 6ZZ2q204qic/VHOz4IpdREDmA5+hu3ML85sfbEiFxbh4Ph0s0Ou44pz311xWyTQbG+uLkQH5Mbj
 Lp1fh6Ur5YNklQm7G4qvSGH8VNiWcmc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200088

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
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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


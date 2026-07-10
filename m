Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07544071C8
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677480; cv=none; b=pIh4BhuyavEtGPXYebmCEPD4yrk+XF9piICKqMzoQms9ZlPI24BY023Y3jdX7FOoefGBqsoSDRqwQZ++XALclpvqlTLXuwvFFWwxcbBPXx6LFsMYf8JzWjUHZmRIFBpIMZ2gUmPa3K4DKOakP3FuXuQH3ggnr2kOxLM6qgcmsYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677480; c=relaxed/simple;
	bh=6pXYbq0cnSv0KPQPpczNz5p2DBipwsIgwwH6Bmrx3y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jrgEZooyzTTH2k+dRWLOe2W2k/rUrxrIpvxxkpVe4+n+Dq+ZaxnYkfE+k22CnQHaAb5SnfVPicuxQx0POJ1a+aXpTW9nd2yMQZmUW6/0taIRskZ4kdZNGa86wemYqcVZz+OHTxV2wkIuo+YI+hX3Aq3kxXVOM0e3m/nPOMXs5K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ozl487vZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WA0rlals; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ozl487vZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WA0rlals"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dWJi4194194
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Vyq56zyV3kK/hWlhQpFe9/5myCJg+mLyuzZJXrDJPQ=; b=ozl487vZanGltMn+
	QpHgalX8RBnW6jugZr+4QR1ocqaSsPjHS55sxqaiRDh/3Z5mdW+Kr1N003XRGNwY
	tZnj7UUur6r3c0NZxInCQiJAJMc4dTnbz9Wgc0/wLSidN1kwA53A5hkAiXQ6N66y
	6EtyJ6C72Ww9kQPEv3C71mwt8C+YZDoH+693GWikPE0Dlw0BaZmrnc9THC794Jiu
	uNEYTtip+GZphKsdktaSSa/T2pxeBy0zxZjVrUrqh6hsjuPz6IxHRj8dNSCE2bqM
	Z8DljmkommMI518uUh6ryj06cMuopd0ZVvdSf/T1ZC2mTS55ifRtaIbQyNtot61Q
	U4hEzw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24uqe8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:57:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c33f48ee4so7625251cf.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677472; x=1784282272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Vyq56zyV3kK/hWlhQpFe9/5myCJg+mLyuzZJXrDJPQ=;
        b=WA0rlalsrE78wUgu9Y70T8dGyKZblV4tF8kxsU8TgTNA7dhymQRmkFHqgJ/R4iOp8B
         lbpvB2/V9KhjQeKj9B8G+rxUTZwysMoUfUdu21YJBJqBpTINCuOKLJ+nvpBJt5soJsGN
         iRYl9dvRXQ8xLXNQNePqtiG8gXSBW7FbECk8Xeoh+n+O1VkPFuTPqkR6cC9bL9DWJtgm
         F5RCZr0M8Bc/8iirsrk+Xq8ZGrCEt37VAXNy8ACHCpmPxDb2yaQ575rcS1mAoX4R2sY8
         wBceAijLIub1QJiNvCQtNyuxULQC1oQNFtbV3I2yV9XMymXR7DwTHPdiMcJ7wC/tjXu6
         BIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677472; x=1784282272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Vyq56zyV3kK/hWlhQpFe9/5myCJg+mLyuzZJXrDJPQ=;
        b=mRll2DsBDj3E9wIAPUQVVXJrycJkMGbPWtZTI35DxtWxUDb57wtKlUrM0S7xShHcVu
         Ht3xOJ98MKeHzjOJXRTpBthfAqu3qUbN6p/+1tSYCHAKKnyxrvh3klixO/Fd6aiRx3JW
         5D140hVuwNAg2F0z7ir75RlnNYYLTm/XLeOOYZxzO4n6zfGyGACmDDgd5pawqQAiInaP
         DUIW7hRXXTJfN0aablFyDbY3qk3lmrE3mFDLJoZaH588YboOLiCVaWcGfd1QoYKsOWN4
         LUUznQhEJk9cmo/3JWyq/Dk9z3FXfSmck4OLcocRs6xUhzOO2YDnx3J4ndMN+AHS5Cey
         c1Xg==
X-Forwarded-Encrypted: i=1; AHgh+RrXMF3+WFNgg9e8yh51eyfRfLuJ6A0ei7gyRsRtaJuBG4w63oBzvhDLwqLSRgAaC5CoSGLFW1+XZDOq@vger.kernel.org
X-Gm-Message-State: AOJu0YwZY/ilsLFKF9U9JyConGT9qGas559ipfRXtc98q40SRm6xPRfp
	uGutobhEHjjqhw5k/XMNwLEQaFmv8xyKnZafwb8MCl8dGf6DITfS1k1zT0jPuDB/Dt8fUkIaPWA
	o+6h2VGDQ/hvj0lxEuaG2vKGJBKxLpT9kKR7Vl420gIYodZyGr70D7tImXCe6s3XG
X-Gm-Gg: AfdE7cljs2KlwGHk8VmXicgeRk2gIhqQkWEQfr0eoJcqdZXbXEoBEQDGiGvnnqbR2YX
	MRkkftyL0HB2CEolH904h8I2IICnoIiY5J5T44ymUUOJpRPk4aVqzuB6GNHH8Dx7CTQ/xAya9Rb
	8VMUssJmO2IJ0kAJywZkszz5nXLdwPoqKC8e8yh33Bf/X/AtXykV6t72IBMM+3gQLm6XWIs4bkZ
	MHZnLQFJX//91oqbDllCVhK6VCi2WhBLoQyURzsHq5eWjA6DA01BFUNcrqpMOPxKIlmoU6JEJmH
	fHzYoreZo+3lx6Reze5D1IXE4UOv/h7Wdhd1Liwd5g6mwHJKlskv+J1sT4wgl2sTl+sPDmmubt2
	axWjC/ID0YKbJJe9Sf/M+EMc4wlPQwPgtgUmx4zX9/VXYegF7pkchF+kICIeDYL4iWZL3tj+ijh
	Y3AG4/MEn3/O/ZAaI70a4+9aLiwPQyh9g5wobHUNDwCMdD+lbKwXezhaPOxHx2h1r9jSjIEmE5r
	WlPyqHbIP1it4oPdmxx
X-Received: by 2002:a05:622a:1195:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-51c8b3ffca3mr110162051cf.9.1783677471872;
        Fri, 10 Jul 2026 02:57:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1195:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-51c8b3ffca3mr110161911cf.9.1783677471489;
        Fri, 10 Jul 2026 02:57:51 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm265357966b.36.2026.07.10.02.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:57:50 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:57:37 +0200
Subject: [PATCH v3 11/11] arm64: dts: qcom: monaco-arduino-monza: Add
 QCA2066 M.2 WiFi/BT support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-monza-wireless-v3-11-46253587af64@oss.qualcomm.com>
References: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
In-Reply-To: <20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com>
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
X-Proofpoint-GUID: IuVqJ2YjCFEdzrBdwGN3l4ti0uXcCt2n
X-Proofpoint-ORIG-GUID: IuVqJ2YjCFEdzrBdwGN3l4ti0uXcCt2n
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5OCBTYWx0ZWRfX06flp90/V8qk
 bdT9pgtcR3MyTjaOoEYIj2dDVLxbz+yLSsLIXb74hTKlRoTNCt7Lu89wHtW5HvF06C8dAJqyuz4
 HdX5NPp98X9/GSMiRb1ca+I+Q68tUkM=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a50c220 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=EzCDy3pf2FPqfMyO2-oA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5OCBTYWx0ZWRfX7+Hn4mIW4pqi
 yg8FPRWw3AeZs2J4rVdag3sKqu5urHqxBItjX+R5iFDqz6AsrMbsUreAAjTsiR1nTpX+3odEftz
 RC5h3WMUf8fOZqH/glmh4O/VLcTZSclP7xbDLiiYWKYXinMUTZdA7qt6ylrEKzGkrW0/BtzzhEL
 9wnc92UtaRYu9tX2p2amcQnlskTc2C+BDkVA1nfw69UnRQgbUZ+XNkW/RMP5Ui0HH/ShbLh4yk5
 JJiblrJRoudQ6AK52vgA4JAtNVLLwR8pTBWlx8bCnbVDlhxquvT/yPKwK8ejkwd5uoE9/HBMef8
 +EtONRZB1kTG3cLwKAlzL2e+hb2ndsjNJWACs98E9aZx6jwolgC4mItSO/7iIm6nPlpqF80dqSA
 J7hCXIz6c/DnDIcUYCYDwrhJ5iDMLOzYLHv7oC3U7yPlRAAPBZVtpo+l1kuQzTWCph7BO6Kq8BI
 wYqeD4C0HR10G5VifgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100098

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
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 64 +++++++++++++++++++++--
 1 file changed, 60 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index f67a554adf956696aeac2348e478dbd0b74f0e62..e3d3d68932efff494f3c7ab96d75869be24c4a94 100644
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
+					remote-endpoint = <&pcie_bridge_ep>;
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
+				pcie_bridge_ep: endpoint {
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


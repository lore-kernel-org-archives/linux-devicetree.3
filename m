Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429551;
	b=bwO7Lx8tp7xMd8T8CMo5qIlmwDifoL/aTBi0h5ElY7IQHJpUtrRuiHx8mVR2T09HJNLN
	 Ghfq991J0MgIua5U3bMdGDG357JW2jZJQIEcJtPUNolmM97g8Oy9Icqo1mXb7PeU8aXiJ
	 TBSe6dEvxZpdb1QM0IGJ+bSEI3PM/egpX+0hSGY5AqPWPEhFV26PKI+ymGwEKiStmYagh
	 2gWmh+acgIwxKa0VHXGVaNMoYNohfuQAKtvzasusbjeVd4oJauaflLv/etXO/4vD8tEJp
	 /gYaZg2MECBKSNTeaq2u9B/MHqqMZHeEKFMJBAwiVKca52wU2+4B5yBisLoFVs7HcFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429551;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=l725BNYLpyce4ybNAMMn0uFOEMIGFpqz4Kp5oSPcRaY=;
	b=2KwZ9vC7e0eGGC2YqO3UIbOrcDDBXrJ+a1cymVFj9aC6AitG2qamFqyjyWglpObJYkNJ
	 Eml6P2h1Z3wEY9if5PB+8herQDKRRy98+I1ZNNZJqZnqEpTopIxk2/OhP8em8Q9BwvOLJ
	 VN8UPBtOk04Uq6BB3fXkm2q1ziQ/AQfPE2NltC1sL1P55wpBbAvMnEqt7Ve+STvno4jTY
	 Kse+bDhFdTyRmrWP65DHuZK3q4+B6FIJVDU21mWkavU/VIxsBx83KB85JF2h3eA9wL09F
	 UU2cI57A5OG8d9NE+kXEvwGLNv7m0kAlTzDZ/1nr3Gh/8QlQ1cDB2fQ/u0IqzIBRe9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FCwEvqXU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e8zGynrN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2349F606A6BE
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2349F606A6BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FCwEvqXU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e8zGynrN
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9GQrK2074424
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l725BNYLpyce4ybNAMMn0uFOEMIGFpqz4Kp5oSPcRaY=; b=FCwEvqXUkkteeyjh
	1S1Ho07mY7+MKpmHGjEpw/u01sly2+/FTvEP3DbYOaNMFdyedfCc8KpP9x4lRn+9
	A9GvoI3DZmwdpWJy7r5424xDBZvy9bHCD2b4MJVnhGdPCaMGywtJC9FT0qyGlyV+
	bjZVkDxJfYFsLjwgM4l7A3g07KPRdR6XcdRDPUFjrpV4ADTfOqjI4cy2TRrxtL0L
	k0tF4GRKq+GJzOwgd3Yob6c3gzAJmcmbno9BC2LCe6dX4WZiMeOPxPjLe9DpAkKQ
	6wyyiVcFN7ERh2eHiLdm9ZmEZiukHkjJ1FJw+go9wSXTvq1YjNAf0r1CP0fvc5sn
	6oo4BQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p8wua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:25:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92101559a2bso56077826d6.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 02:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795429549; x=1796034349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l725BNYLpyce4ybNAMMn0uFOEMIGFpqz4Kp5oSPcRaY=;
        b=e8zGynrNkJF/Ka7jkUNs3W2xbr22U/K+qfrV82Uj3K2D5z1zhv3c1ZjhGXe66em4Er
         I3+fN7Pf1rj/xTgz1nYhQ6T2e/7LIQrMLycClEsS3ajg+jO1QmGWtiREX7s2epLFJSmY
         KCxqRpiEqT9eEc6Flm/TtoydTyEIqVe1x3iirasxDyKazg6nIpCH4ta+FudOJqofGFvn
         A4lUe9nVetnxq/c7qju3fB2b7vVy2dr+9CXpJSJhczi+qUgGW7pJ6SHb7y7C+wlMiRej
         UKzNcKOj/X5lUMq1JoYAu8dMhsyxXo2t5qeNCAWCWGxEOQF8sBTfB8O88g0f0HV5m6no
         BDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429549; x=1796034349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l725BNYLpyce4ybNAMMn0uFOEMIGFpqz4Kp5oSPcRaY=;
        b=CBTnELHO0JlCJF3d9B+BNslPIZp8H4jiXDvdQFTDSuQQZkRw5qP5uneBP6r0Fqyw1C
         Z2s/NpyCIBhb/uHjyezeNhfAzJL3FvujY7Yp+f6ht/y2znYNI92jv/aAwoD8iwxvtjSs
         +n9uq1RSEU/meQrnuUXQ/hHt7pyTzmME6YgruEuPcC/l8gm6IPOfj4fh6vvF2qu9lqjm
         AjJsWHv6THXdZZ/gdKmBe9w07Y7WcLoXCMfz4EP/gvKtXgFzO/aGWIPt9UMx3nb9H4TE
         4pUNOJXb1nqKWcE9bL4eIgo+iwvHv8VBPH+AV4riOLH+SbYPxETkOe5RraTOMIuc1aXl
         MFgw==
X-Forwarded-Encrypted: i=1; AL+hErHCh28OOxMvwXL01MYQ1fqHXnoYYtT3em25vSk4lhdaJm8YBmgMaLJVy5O4dwZxft0FghyrsimIGhP3@vger.kernel.org
X-Gm-Message-State: APuU4Z9RkmTQLLainFz89iHQgTthVcXjnvEF3frYMIlhmd3hC252mPzW
	ImmEQOzk2yEzvDNcafTTr9PAtlGCQjWOD5QLh7eqU2PREEvTy5PMwb4HsVyzaRJy4zgXwbjoIUq
	8VHDnKnLOsRbc5I9Q1seIhwwlh3Sd+a5by47OCtnmn3hCBHLrgz1bv7JsMxLYrhrA
X-Gm-Gg: AZFdTZfJzxzKlXTX0D2tjqiE0iDU43NBhg22ut5MhGU0MFfdCrli0FkQ8japHsRcW7D
	2tUKvXGzNKkzChK2pSgIoV7wTnBRKpGeRd04x4CduNj9n5b8yyTlaq76poihHV7nCJfm7IXmXCX
	hDmucA+/k2rXYQTtB+pSQXhe//sXN7Ew+BqqYxvYcE+7802uaE5zD2Q8iln4wUFk150fBhICgKr
	ZRas/djUOWz7+/Tuy9CvuvJF42OxSqSP+7LZf5Mf6AdbE/4q+fyDXpCDkUUr48m4fWdktZtXqx+
	UxiqAidZa+VW9QBM/Sci17Ofatd3gaGiwy88Fq4+D68p/T6hj7VvMvW7vguGdQf8YmYQlKHztOJ
	m/DEM6XAamBsxVgKvcBR/Z24t6UWN50M0w8MjbeG6LqLoCuJ9h+nTP51cftu2gX+sdDCsqg9H0j
	lubg+vtVM/WG9kLO44bkpWMDjdCc/F8fLqVOf1YB+oo3MQtAUa83e4JIOSbRhWfDFB88XmzkeJS
	axrLIAE9ZKfvNesdSh1w66h8H45
X-Received: by 2002:a05:620a:890c:b0:949:6e5f:7395 with SMTP id af79cd13be357-949bab350f0mr1756204085a.79.1795429549282;
        Mon, 23 Nov 2026 02:25:49 -0800 (PST)
X-Received: by 2002:a05:620a:890c:b0:949:6e5f:7395 with SMTP id af79cd13be357-949bab350f0mr1756200385a.79.1795429548752;
        Mon, 23 Nov 2026 02:25:48 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:58b4:dc38:81d5:3c3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm634166845e9.4.2026.11.23.02.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:25:48 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:25:39 +0100
Subject: [PATCH v8 8/8] arm64: dts: qcom: monaco-arduino-monza: Add QCA2066
 M.2 WiFi/BT support
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
Message-Id: <20261123-monza-wireless-v8-8-a8b38604be6c@oss.qualcomm.com>
References: <20261123-monza-wireless-v8-0-a8b38604be6c@oss.qualcomm.com>
In-Reply-To: <20261123-monza-wireless-v8-0-a8b38604be6c@oss.qualcomm.com>
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
X-Proofpoint-GUID: ah20X1C-5BBxr8nCjlRri3O9p4EEfOhk
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b0414ae cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=EzCDy3pf2FPqfMyO2-oA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfX49ANkqPorJce
 WxLMaqBbsakKavHK4KBOswomHtT6aZdl7/Qrc7DbLdC80KsjoXe6ZupD6Eid82+XRflD6Oa9Tk/
 4VxUAAhCGQ2K2bc3yv0BoslIessNG2Y=
X-Proofpoint-ORIG-GUID: ah20X1C-5BBxr8nCjlRri3O9p4EEfOhk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfX/I39u4tq4M3s
 crlB0Scrr+76Cf5XAfJpUqW0xYhF4VYK0AoTUhqoouE/avvm2lhcWmq2HSV1tuSRmlNkp+zFyTt
 SRkGUMHusX/Zwi3YeDdugN3SPy+slIH+yn7DEgZczg1owPD7I4tz4xd8EPeIfDgWAsSDYegTueJ
 TkQ1vfWCAS7sIk6WH0Nn8/+ml9nEZ9pZPsiFZacUhKf/5Q9BlGt/szJkoigXwpqLp3qabTEawdY
 dvRnNzXvVZj4anZq8jcGPNQ00Ek2KaXnjz9AqucF48hUW4zVZa39V/mANfWTV+36nbeQ5ACaHCL
 lje7DjxrJ5vTs4jaAXU3tPyJZriBP5E8Ghf8kTxbbetk0nNeqizY1PEUK7WcAhx84yO3J/3uIfw
 ea8t75OEm5uEmjXJD9LuNIs2aVE1hTCs++IxPgox+JNjC+atnHY3J8muVudizOufmsvl5BsUC+B
 KB5AQjZPEL/5Gw3FmmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230041

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
index 9ac2a04b302d90728d2302e81ed4b27b9467c23d..132f28df555b3ca3bbb411fd38155cc57f22698c 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -180,6 +180,40 @@ vreg_nvme: regulator-3p3-m2 {
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
@@ -548,6 +582,22 @@ pcie@0,0 {
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
 		pcie@2,0 {
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -706,6 +756,12 @@ max98091_default: max98091-default-state {
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
@@ -757,10 +813,10 @@ &uart7 {
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


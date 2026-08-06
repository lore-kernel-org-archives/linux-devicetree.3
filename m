Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B65231832
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 07:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785999776; cv=none; b=c9hg4R9Y6U66UBc37+mKDS/xfBzXy9iC7tCdtFbJ89FvTcM0xlYDu50rMS8cd4tFF0kM9YQhclpAhL92pqUBtbcP8/ohHOBgHI049DXH89nQyDxwkez/cs8Khiu/AoB6ZEn6aossknLSIQYZrEjsBRdwhemhDHgT6L4N1gWFU7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785999776; c=relaxed/simple;
	bh=a9Uuvxnh6ZCSM3JKuUBmksfHVLpBRtAfPN4ynlQ/SVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nUjsizfMmxaIw18UvPwgWCPUX0t0ZVV5z2zgH3TvfvZepu1V1uYx3rnS4BzKR09dKQSz99jtNkrMf0a+u5szYrhY3FQqi0ewYa+2AE1F+yT8e8UTB9vFwGzCDzJLLSud3ZmvBGhlLZC7lCZF8KQGEXkCeH4p67CoFby1yxwank8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JEJVdvCp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d3BPEjtr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JEJVdvCp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d3BPEjtr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675Nb24U4063193
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 07:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iAA6AR4Qa5OwiZACrTqpvVVaUaRfGGENSJv
	kJ2dCBlM=; b=JEJVdvCpn7TSo/tUb7DQ2mugV4MPchZp66kKpTaR+YYheHHouqx
	WXeG4U7PXDElh0L08utPqMWCSWMr8ErkUGfRtuGlgZ4z5ilXBM4qwl6gKAUfePIv
	dFWptz8VRN6hgNye32Hs2n0JbTINN5WNb6ET5UEq7hyrV4qUdnKR48sfO4FzvD+Z
	7Ktfx9h+Ltcw8sGQgNbKnsxJZTJOryckhdLekxKXK9KwTEvxhFM1ss0yaQl4vYYQ
	kMSC2kqxjqabfO/IbUBX1CB4Vucj5UdwyNyBK06SjotOWibesQWtLVfASq6sfiXy
	y1/Qd/2QgnRtWfg16C/EcmrZks27Vfg7OJA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5m2xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 07:02:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52cd0374265so30867741cf.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 00:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785999774; x=1786604574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iAA6AR4Qa5OwiZACrTqpvVVaUaRfGGENSJvkJ2dCBlM=;
        b=d3BPEjtrq/oHT5d5Iow0EkbxbmssFsP3jp3aBG8O5JAO2RlszflNNFhBnO9IlSCmoS
         2XaF7JrTVWS8hwLX8Helkg3w2JQEsSoTlhVQC5hVDL4+AogEHZXPWCcfe1ikUWbNU2n6
         bwGPsGFtGl2PBf9RU/y1WwCHtDuT9BobVuOnxjCnfTbAXYCV+WBaTwB7KlxkrYsiVajT
         ObfJv4hE3XusxQ8e8XmKZGoUnWM8LlQJTsobqoH1IVRF0TWAzYcUT1ICNVAghgAV56+J
         R67DJsLqJUtr8FK7gipC/cp4iZrVoOJGX/ASq9kXCeCY3+ak6wmQ11350yHHQAQG5P3M
         Nx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785999774; x=1786604574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iAA6AR4Qa5OwiZACrTqpvVVaUaRfGGENSJvkJ2dCBlM=;
        b=gpFRh/pTgCSjmw3RPqBpiS+7r0MpYwsBJuHdiVaEUk4CoMU7rU+Aq1e0P9UmqeKn/2
         +eF+j/1tFSf3UgCJQ3TftuwP6xqyolEMx1rfLEgQE0M1wbPIawK4JgKzXCgxOPPVRA28
         bpnZ89usaeVC1hg4m5hiUxUGMQq6yopI1Yg2MuwvQKhSW0JRpj5uNl0BoM7+rs0SOSOL
         imjVOq/21xhZrAX2XxxRu3NRQNM6HCHsSm+TtSszuWB4hgE9PdZV2kgwsdTduiXFpYIa
         SCI17k9oJ/2A7I5BJ1N12l3KlhlZcX+CqN0eZzq6mxH+tIAr5PJusmyesIrY2rBMCYNx
         1VXw==
X-Forwarded-Encrypted: i=1; AHgh+Rr315rO4mmUwcqot3X0P0viAtM+NgBalo5qXQawbhKxvCkg5PVTInCrOc644CdfVnMKO+13JB1h1EqB@vger.kernel.org
X-Gm-Message-State: AOJu0YyLVB6SPMII0D6Mxz17gMIPbcE6Xq8KHFkXbjiUpyVrRjb9IyjM
	uJR91yzKiIgDiSbvrjnUO6X60iL4gAo7smqiRZOIB5LqsulUfBm+n0UkZN6uL5wVVJ1qRAwiY3V
	GyeEs8LOKeNZbdCXriMYOnRJ91eU9sGpdm7YfXGKQiALa3edvX8ObToFjCXz21sDE
X-Gm-Gg: AR+sD13mnAwFYwrV6cn54uVJUhZ2BZ0IBsCmFka9XMNLzApZkKTwYXu0EzswR6pctc5
	V5SGQ5xCri+gmR9MzTGlHZTwdu+BzJ6VIKllph6QWclpaF7/TSm04M8mA5wPIjgSSKZ69UkUxGu
	UqbELhYutua538zZ0qhW4Tj4LT+oRYZv+VBb6bN2i8b5c3mbx/8CpP1RFmkFvnYYRnMSHxArY5B
	p65d12Ysb2Xn2Aj/P4Ex0iRS4/klMpdkdvPTxjQUu/F7nqK68sg6pUKGF5Qhhm7pB1fMjWY8hZC
	tve/UsOe2VD7wknRsT5HMGjZ7CabkcyT+oZnmYBMOXYAkUEwmZUwrxqb39JuyDGCK7C3MtzAzQH
	gvUobAr7J6U46K/0c
X-Received: by 2002:a05:622a:145:b0:528:32c0:8237 with SMTP id d75a77b69052e-52ce620a9ecmr125296111cf.44.1785999773583;
        Thu, 06 Aug 2026 00:02:53 -0700 (PDT)
X-Received: by 2002:a05:622a:145:b0:528:32c0:8237 with SMTP id d75a77b69052e-52ce620a9ecmr125295721cf.44.1785999773144;
        Thu, 06 Aug 2026 00:02:53 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49954246f9dsm45206285e9.15.2026.08.06.00.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 00:02:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] arm64: dts: ti: Correct white-space style
Date: Thu,  6 Aug 2026 09:02:46 +0200
Message-ID: <20260806070245.40219-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2041; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=a9Uuvxnh6ZCSM3JKuUBmksfHVLpBRtAfPN4ynlQ/SVE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqdDGV8ba2URPZj9v49PxHB2Btr1v5mqRTq53wU
 lOFbLEjMNGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanQxlQAKCRDBN2bmhouD
 14PZD/0c3PX8joGERiBJyVusn2EQNn1c80M1UefIck1b/DgmJc5WbM+DL49HqXDa+LqQRBOYYDR
 NRd7JC6lPlvQBsuaZUN9snsIfeilXLx8JzlPZDDwyBwS1jBJvH2TE8g7cA98IrUoJFXnsTjiTik
 QZXwerivwU9ki2GogZ9eQ8PC1VNo2cCQFha71JTj5GmSxcz/9F9ODyAM20b+lzqVXDJROZt9ekK
 q093A175pVudRUAV47yub1D+sNa/UsNx8e62WJeEplF0UczZTN9QNuYUd31sLN/KdlyfzFEASuF
 zpEOCSprZP5i9lD4K94Vmb1X3oaxAzobUXhqZq7Dy2v3wkQTRlaroUcGWAp867rpgQJ4EYcWI3i
 La23/9UvgmIAXpZovKk8RuisNTWmVc92B2kYUOwnbIBRcVWn5Lau+XFmdFisFXOAoxJtgbtdGyY
 WDnOuHJuLssH2inyoy0MPj57+O+NJuaNRxdYhPOOFMv/1vIKhE/jlS6NuKlClSPUWDS/OkvSK4y
 kUVW6dvzbwsJMH8zD3qu9X6XdlaPj9/uLuqX6rXx/C6OD57LK1VN4FleZV0wWbSHsC1UrOeL5sb
 gl+2kmQ2YDFipa9k52MD0bG+/ouViSD14fWQ6PaIk10rNTENJDFASbVJ1pqng1JhZdDMDaXfU1w JXbK6V0CD0TaBZA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA1MiBTYWx0ZWRfX0qA/T+Izos3e
 RoYdkPN22H/ULoNJ2mHTwQs+P9ltONPrAWx27i84RsK3n/gcX+G8ZjHMqwM2wpdfq1JfZ7b7mwZ
 GRQGWewfSU/ZYv4Kgz7ZuxQ4PZiL45GydIg6xdpQYA9gEn2q3rrUoDsJZKWLDeLKGzbWqizzr1g
 OPjxl//GX9h3K8sERQgy6tX7oqan52RIQvg5F7+jSeElXl+7jWO7Uaxhga/VeZxqs0E6oRd4k1E
 ekjrvXo4pa/fonk82dqvjCCg7dwFhq+0ym+TvlQPs/Zlo/ooNKeINNvLvnFdSDG1Sp6XwQcZ/7p
 m41FK4+FecEwzx5qqerUqphB+UI96lsKMudh6chAc7iY86zFDdpaZv9u+nbPcEzrXHcm0SXONQ0
 I9cVtRztX+Uck7nvwVDiYSvxWzzbwwyz2yRrmPdAPGdDx/00j/7RR4pKfQKbTBRDsmbsHlyuAeY
 7rJdziW8e2cs0OK+hnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA1MiBTYWx0ZWRfX4Gg1ZjoGuLub
 x2X12CGVtdPxaKqH8ufmwPnk2nvUd/LKx6TSZ2V6ZN7KVP5jMffJZdeqtEUfTVmcsbqSpmlt5HE
 ezhhqoS5WRr3GdGEhoQMQVuDHnoL518=
X-Proofpoint-GUID: m-VtN7wsOA8NKnBjdXENvlP8Qz0QpNNL
X-Authority-Analysis: v=2.4 cv=cIbQdFeN c=1 sm=1 tr=0 ts=6a74319e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=4E_048dy4KWIn0a4eT8A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: m-VtN7wsOA8NKnBjdXENvlP8Qz0QpNNL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060052

Correct a few white-space issues, like missing space before bracket '{'
character or spurious space, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. None
---
 arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts | 2 +-
 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts         | 2 +-
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts                   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts b/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts
index adf4da7dfa2d..a1a878d88e96 100644
--- a/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts
@@ -54,7 +54,7 @@ AM65X_IOPAD(0x01d8, PIN_OUTPUT, 7)  /* (AH12) GPIO1_22 */
 		>;
 	};
 
-	main_spi0_pins: main-spi0-default-pins  {
+	main_spi0_pins: main-spi0-default-pins {
 		pinctrl-single,pins = <
 			AM65X_IOPAD(0x01c4, PIN_INPUT, 0) /* (AH13) SPI0_CLK */
 			AM65X_IOPAD(0x01c8, PIN_INPUT, 0) /* (AE13) SPI0_D0 */
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts b/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
index dc0d3cf2f985..3e2377160d82 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts
@@ -143,7 +143,7 @@ &main_cpsw0 {
 };
 
 /* Aquila ETH_2 SGMII PHY */
-&main_cpsw0_port8  {
+&main_cpsw0_port8 {
 	phy-handle = <&cpsw0_port8_phy4>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
index 689ba2ff81f7..d66e71db4697 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
@@ -1068,7 +1068,7 @@ &dss_ports {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	port@0  {
+	port@0 {
 		reg = <0>;
 
 		dpi0_out: endpoint {
-- 
2.53.0


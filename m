Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D12373BEA
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782378827; cv=none; b=MKGw3YoqnWmqlteZIluG6Ie264RIeyrTdH90cBvovFzRn+favMsetEqWFkaycwOiKJN+J9lrOmX9bVOD/kEPzb4cteXrkigOyPgq2ncIgvOBzv5iWDNG15Ny/i457Lb566LC3yIBh0mFd6z0fWFWjCf55qFdcxYS3jVzeAj5VcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782378827; c=relaxed/simple;
	bh=l8GEHoorhaF1fEe6cH2o7fz4xeI2z+vO0aTX+zd6f3I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DELnnUA3BQy9daI9slfVhs/uDBt9Shj8V1TFa07r+CO65WYRg5gM+1i4E52fGssjzpkPp0M+8hwkECbOlVJ75mjbHGWIki76CitW9TcdDkEtQGnoPwG78DOu68GGtOnmF9vH9KiOx6jIPcuf+6Zw0QrbmhvR4cwhleWq4QBmhdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JU9Jgs15; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bUAbFDxP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JU9Jgs15";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bUAbFDxP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8pBLN1921158
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7x+x2EqIKOOwjkZEZOP456OBm1fIhjRi5Nc
	qRMu1zAo=; b=JU9Jgs15W7yICIG0oX8KVSV+GGKv7a269TG3lkiI3j95ZF8vEKI
	fRGXGxhA1ssGp5YQi6/maBNUzqxwoK3OPO3b9AbAViIxIYgdPrxLJSU3jduGL/iQ
	91OriA6xvsU4cdllsBuCz6EZAzAHpEfYQdgBFaIncufm+Oeya9ocJtYddxr6PThB
	33IPLNOtl5LXhZ/NNcfdVKJ36enSmOOKs5dAv+nTolgJckhnrdgbNvvOXCyoEemN
	rRoiuHXvjcP7OX3Tj0kmAkA9e9FBifjY+xktA+elX5UgtcF4+vhmplDUW6KmfEqq
	7HRCQzjleMUc6yz3t1BDZAoZQc2F2GyDEQA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uyqhauf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:13:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91576c147a4so437874085a.3
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782378823; x=1782983623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7x+x2EqIKOOwjkZEZOP456OBm1fIhjRi5NcqRMu1zAo=;
        b=bUAbFDxPv4n+SJ68FzsAXdyVscbPsk0F0CJi9PQhXuwd2/EwwlsWmkJ6xjCTArjtWe
         7NYTnz+05E0M1nEoe8X2YZ1IWTFlVO5wji1MSWSoHoRyAvt4eN0CJO5KhqU+12vk8EC8
         t9r52psbhpqgAmzGxGR7htRFZiH4So0blnY6j5yBByjnE5G7v+Z5B72CuSQQWfpfymer
         mmOiCoJ12Y4JWzPXAQnFcgl2vAkotPW9Ps8KaVrRleF0RSYqAaboNOMlFT5zwuPP2kYo
         NJN7qHFv98/Crjg4reb5mRTqhbEwH7WqnYAKiRzUaiJSxS/Q557ZDTAFBcWiPVXXo7AS
         h2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378823; x=1782983623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7x+x2EqIKOOwjkZEZOP456OBm1fIhjRi5NcqRMu1zAo=;
        b=HRNYEe6cI+c93CMRkYTkT5YH6u8WMsRCEdVKCvrbQBp4KFdgivdxL3jKwgoVGZx/ka
         AhP9bROGMh8QRp3tlXZyRpBspK89WdvR/QjKDKOOZ1y07E53NrxwNNScN34kZa3k0qMk
         gOeMj+U25m+aO+pfrDua4+dzS7wjZ3dnYc1H9eearcf3/9n+NgvzZXzQ34dsNL+tFA2D
         IW8tCC7VEKwrMIQMm9S9kQuQuUF5Zv2+KydZcsFEMCZdfk+1ZQqO6TKLOMeY9sm+rOS6
         juTWS3BRzV7i5ZPSemeAvceL5qejW/LPybefKlGTAWPMwszH6ZGxy5KD3Q8FzbMcrJHZ
         xPLg==
X-Forwarded-Encrypted: i=1; AFNElJ/uR2Xnc8KZKJCO13tzsajqWyc2G1Jr6XlONbvuuwFDRKeM0ju+b0qLcXA9cmiJokxnCl5mpH0dBeKo@vger.kernel.org
X-Gm-Message-State: AOJu0YzDKu4AXYdo6OuiEeQBWRHQc6PJIl7qd8OjG8EzAfL0UGHFkN2X
	sV+cnURz9agIo/+4qzdMRjeR2SsZ3zXavhYtUZGLATOHVtSgJq7p139fWeH7xJcjgfB5g4GfNR8
	KnWLav+F6dcO5FmBpsv9A0QKVM5lIBlCreqSzwIbYS3GcHCn02D2ECCzDOWuzIhhG
X-Gm-Gg: AfdE7cm0xRpT+5XnKtZ4IW6dacPIAaYFXYM7UBzPNYNfiCy/iZsZLp5l4/8ezod22zE
	mQ4DJoaJGf/ZekT7h2MuvkgQOt2w6K4t1GNopMtbbTNw2PzX6ueR2HQHjEoL9ml7GpQZH0t3xq3
	W4PPmBtb+znAx4COuuOBeSA0XtmLpUXM7c7rPNlxpT0a6KZeZ7mwCVDQywOCPHwCklgSMOxwExQ
	2+ZHGMHsMfNo8uPaBk9mHl3CZdPOVDOVEyZCDIjs/m+enzNulgou4r+F6qoh4Pa5w3S4O6iRB4+
	iXjVVeK2aL3OIz4CJSAomwDHemBIJJQVnP6l/45AoSBJAd380PYdV/RaCj54z5d0mP2hdLr3uaw
	hkz0lHyFWcjKFWYaqeP+yU7Ru9gg=
X-Received: by 2002:a05:620a:bca:b0:915:c4de:7ab7 with SMTP id af79cd13be357-9293d5b513fmr212350785a.35.1782378823325;
        Thu, 25 Jun 2026 02:13:43 -0700 (PDT)
X-Received: by 2002:a05:620a:bca:b0:915:c4de:7ab7 with SMTP id af79cd13be357-9293d5b513fmr212346685a.35.1782378822800;
        Thu, 25 Jun 2026 02:13:42 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492660ea064sm40413085e9.11.2026.06.25.02.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:13:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: hisilicon: hi3798cv200: Drop unused clock-names and reset-names
Date: Thu, 25 Jun 2026 11:13:36 +0200
Message-ID: <20260625091335.106951-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1710; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=l8GEHoorhaF1fEe6cH2o7fz4xeI2z+vO0aTX+zd6f3I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqPPE/7g1cmUqgKKbTB4HQAf8Vv22cAfJz8XxFy
 URzWElg5/qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCajzxPwAKCRDBN2bmhouD
 13z+D/4175rTmNwQKb/aAMasdYPQkIP61TCiEVWS6gKyTZmq5cmhHwgtOk9ZM3nTrWkAvdygmF0
 k4vfg7kP/o9+yVDzrPoNtGbRh8J6lJHhJA36L0tD/j9bXO7KVM9FV790IE9sgiU+LFO9bPCPTlu
 dUJPe3W5cLU6S7Gv1FjrausknavN2bEdHgV/iDgNe5L2guiz2IhiQB2jkbak1SSazStcF5VxAmC
 nqlHEhGfuzeM7K2ZUKx9/rxHCPXiUrQB47uzfW8TY+MlT9Pluy29LDisydcN9KIEmj9JQNm8KGh
 kb8GJ4NbYl0tkQbwQv0IeikQWT+fVs1pD6WydZceVaUisBOOG7EfZKRPYRENO+USBYho2I74KI4
 Yffvm+QaPdxFsXQaMP4+cdv5jSulgQNWXyPGCivmRA/BGdxI7SZ1BqYV6+Sg1PuOGLkTpMIOCxa
 KuOvqNY3VGRvmBUeYlpdNXIzyx+3z6FvB0rtzaJvymIzSrKt2cEJZs5PxaXPRAG6uV4Cce8Ljb0
 14TcSfgP28n8TD8YoGbfB69QR65PSLWKGrPK44lSB4G0idp5JUgabN0Bc7ZLK6Bc3wh1CFCTDty
 GWLGTx7llF5vgcwZM4jkwbGuiZFlxSPvNVdGTfyOQUKcoODbMTLMJAMbQs+kr7B+cyEaLeCPsIi ID1+C8h13G1SoUg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: H1JJtPkW7ZW0xZB5jZ3TrYE-wbBs5cTZ
X-Proofpoint-ORIG-GUID: H1JJtPkW7ZW0xZB5jZ3TrYE-wbBs5cTZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfX01WDXZKBM46N
 mZ490xc3LUivLqwYBm3DNk3EqHOATBK3LgIKS38yJcuRpWMFL/ikN14u+YyQhF1krbyDVt0YQcv
 wgaLrudWyT3v89HeeB8Y0JYdA/RM7WM=
X-Authority-Analysis: v=2.4 cv=EsLiaycA c=1 sm=1 tr=0 ts=6a3cf148 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=PoG0SKuk0EEFDSeeQbIA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3OSBTYWx0ZWRfX5PWiEMAIMR4n
 mIJz5FvgsZFjokFoJVli6nbS4DvOidZ/y7EHStYgihr3P651Tm+KT9IXmHFwHsDelpo6jzoS8yo
 w8UdxmBYllj34nb6r3MwyQQps3SEZYRcV+1PYukL0S6aBoLhfl4fb9cvt2KTzpiNwYH1b8JMLA0
 D3iV/NidjqMLQeYupnM8dKpHpAE/Ej55lHbZaunKAzwRYfulPnZXW4iDUq3o6LUFWow5GEyKzB1
 PTcDjSDWuP9jkiW4e4d6mNLlzBp1x94Z+2DtTih6HVHT+NGPG5hk7UwcH87bmyl2TsDt+caLaEj
 R49vm09KWhqTpC4yiE8lnjyKTAb/SCWQv8XnOPbWLudiyV+rnCuW5JXu2TuKHtGwhXGecIwsFws
 nE9L7mg6KJGvEPE/J4RODRnKTSBI35Rrsbc4k6+BMg2SC7mbs4rfN67UsvezrA5KfG+wLvwu+YI
 Aa+6JUiZE8bzdH5q+2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250079

Neither Linux drivers nor DT bindings ever described or used clock-names
and reset-names for this SoC.  The binding allows clock-names only for
atmel,at91sam9g45-ehci and atmel,at91rm9200-ohci, but not for HiSilicon.
reset-names were never allowed.

Drop them from DTS to fix dtbs_check warnings:

  hi3798cv200-poplar.dtb: usb@9880000 (generic-ohci): False schema does not allow ['bus', 'clk12', 'clk48']
  hi3798cv200-poplar.dtb: usb@9880000 (generic-ohci): Unevaluated properties are not allowed ('reset-names' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
index 2f4ad5da5e33..e5010c9d4c39 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
@@ -633,9 +633,7 @@ ohci: usb@9880000 {
 			clocks = <&crg HISTB_USB2_BUS_CLK>,
 				 <&crg HISTB_USB2_12M_CLK>,
 				 <&crg HISTB_USB2_48M_CLK>;
-			clock-names = "bus", "clk12", "clk48";
 			resets = <&crg 0xb8 12>;
-			reset-names = "bus";
 			phys = <&usb2_phy1_port0>;
 			phy-names = "usb";
 			status = "disabled";
@@ -648,11 +646,9 @@ ehci: usb@9890000 {
 			clocks = <&crg HISTB_USB2_BUS_CLK>,
 				 <&crg HISTB_USB2_PHY_CLK>,
 				 <&crg HISTB_USB2_UTMI_CLK>;
-			clock-names = "bus", "phy", "utmi";
 			resets = <&crg 0xb8 12>,
 				 <&crg 0xb8 16>,
 				 <&crg 0xb8 13>;
-			reset-names = "bus", "phy", "utmi";
 			phys = <&usb2_phy1_port0>;
 			phy-names = "usb";
 			status = "disabled";
-- 
2.53.0


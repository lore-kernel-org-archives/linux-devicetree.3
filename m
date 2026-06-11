Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8173911DF
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154067; cv=none; b=HMfW3+meSembtFxtunM8fL3bCy+QAfCQgM+6sgRfMEO9wFPiTTgCDDh0kf6HbYr8ovtPBtEAutkJBDI0VU0/lsFxrqH5N215CWvJOssdi8PitiDSBgQGCMdS60S6Q6oBMdcJZxoFKszbkdFp5J9HcHyFR5+Jw0IXmWt+9jOLflY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154067; c=relaxed/simple;
	bh=rO/iIGXGAzRV0bPN1Wdrf39uKj8hTElqX5Zi1YS8KEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AW3vZdGwvBRNyT95OKMifWVvxHUjStrKGYmowntz+zESJk++ewxSp7sjDzuhBNGYs3tndzy8zkhperwS4BRRK9ICLAEpCz2fyjaUYcWSx5CnSM4nOkGBqq2txCNjDKEpPemBRd903g0bu6Mr8Ht/lOJJa5YU8n6AvEHGrY5N9ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DuGfEhmQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPX0ICYI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DuGfEhmQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPX0ICYI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NTOA3184264
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I2Lp9Ym6oc4mGbkXcB2SPNJ/kf5iosAK5AHCwoCZxJw=; b=DuGfEhmQoIobA1FW
	uO+3c2pe2sgocTLxi94aX67wZBwMkxxQzvpvhmv9y3vQHFkh9Rv8vj5Z2JZlfqEK
	BJc+gtntWji2/vmJF0SfIp+br/TTwL5wT29H+Q6HkmqvqXviRrozf60uKnLpDRPG
	eyfdZp49wAhBWWAD+XU+LSSM7BpnppU8dHzm6h2w5NAs36BSCX4yZDR0lKUKYPPo
	1w2MzdqXNLYr72EtT5dMEwgNoD0Ui/KcXANO8PRwDpomEz4gSdDaHQSHXLu+kXTL
	qBPTlm7Nt/7G3RObl2pGjE0rR1p21Vqt+TwbPiLAgiJFQs/C/oFAyab0CUR8YBH2
	4wHMAw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6usnup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2beff6b6e74so76160825ad.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154054; x=1781758854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2Lp9Ym6oc4mGbkXcB2SPNJ/kf5iosAK5AHCwoCZxJw=;
        b=SPX0ICYInn/MVnBf15PVwHAiprFd8bFTvFXNAU7n87RdizLEkp7zCXq+EK3CdKrhua
         8xytaRewFW03c9RSh+/27OAlppo1A0E+bmVvLVsi141UXoedm6K/h+E/A0aBzRsJglj3
         f2C4/SqP3Gi4prrtIYyxwYoTLIm8+Il3I4IixSpHUr7LQrzi9YR7QouqJepKZcmwZS27
         I6V6AWbCzRPxiqrrsw5I5VvA9xUUJYu4ShAGMxE75xMW/1UnG7mnlcEuuBQ+W3lEvxjz
         aPX/dioTaI1Dys1hkNI10izu3qQ8vSUmmmUS94T6cutUZhLiXmm4fkviS1o54n5Kcgow
         Q8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154054; x=1781758854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I2Lp9Ym6oc4mGbkXcB2SPNJ/kf5iosAK5AHCwoCZxJw=;
        b=eEDK99VyWWcn88ttb5hNshqq8dtF005UmC7aVMvX1ajY69JMOzbiJq8qAPq8gwcPb0
         rHY/AoHQm6Bc7Cl5i4GHHHFgZkJ4jebJ2qlJJgrwf4SW43ImaX9QHGjic69/zbsrRJhS
         UYmovr8rQbLMAqZW2QgoyVsOeC0yZB0PCgMvXMmHfatwCn199ea5ZIK8H0b4xqBbdYN4
         ukEnuW1ucmOYmAaQJi+Vpz1Quxwj1jzt8cHXU/tg9pk9C5XOeo3gRReM7S5hKrGzUfeH
         lnWUpQVhI+5irz/K7Ig/Aqk+tb22BvuRTXXH4flcEUT76N6iVM1lloeue7OU9gzYzBdA
         5wCw==
X-Forwarded-Encrypted: i=1; AFNElJ97822zLuARBOUohj6kgmVmNY6+VQE7h1dHfTXaC3hjE0lxq0anRzD7gK71wYLahRFAbMdVXC5vA7t9@vger.kernel.org
X-Gm-Message-State: AOJu0YywiuTNnjk5a0xj/hZx8JvzWObfPuCBi0lUxaY7GLATZYv7Jyl8
	QHSGSS1un7pNoZbf4ZS6aLVm0j2aXQ/Tmetf6ifeZW54cHYGGKXNUqy7NR5aN7UdlbpCUITr4lJ
	cn7KAwUnjA/Ifn5iIkxoFVB+reO0wp0Z7J8Wy/U9xhgfQBzk9qmqVvpbKeleexNGS
X-Gm-Gg: Acq92OHbxpKaqUPIEhZTYG+5/dCCvAjBNPRZBFpMnZKyfvt/os/V4FFNatEU7hT40Vo
	+v88FoG/aFRz1WsbmEkTVSnA+0IM0F3lNUdjlZ4TBsyQ5pLpJzaYK1x5bIzxfg34XQJtjhVo9Cw
	7N9C897XFc+7vT47P/7Ut3xxAj/lz9C8Nx4eaFfOIXChVOmHq7n8SnN3HRlOBSy5RMEtBXxgWq8
	yRrzkR01QxqwbbdxfhlHbNJL7Y+jYK6nQ8TPTIL5TKHIA5d1hiJ3ax4vvXAanhUkPAwOJLnHdQj
	MHKHZkMFOgv1U+Vz5vGNGOAkZrnIQfBoOX8rzUXQxs+IWGTAm7N9LBKP/p1ih6TCmfsKPZINWXe
	RJEd6NBSr0AaozKv51yhE71LhZJpj3RKTvtY5ZOfix+EllwrTf8ISOfldzmtjbojd+no=
X-Received: by 2002:a17:902:cec1:b0:2bc:f1ef:2e64 with SMTP id d9443c01a7336-2c2f14f7c14mr14242885ad.12.1781154053665;
        Wed, 10 Jun 2026 22:00:53 -0700 (PDT)
X-Received: by 2002:a17:902:cec1:b0:2bc:f1ef:2e64 with SMTP id d9443c01a7336-2c2f14f7c14mr14242545ad.12.1781154053095;
        Wed, 10 Jun 2026 22:00:53 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:52 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:06 +0530
Subject: [PATCH v2 30/37] arm64: dts: qcom: sm8250: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-30-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=2967;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rO/iIGXGAzRV0bPN1Wdrf39uKj8hTElqX5Zi1YS8KEw=;
 b=8FOwzy40OiaaIr6qQt/4U/rPGV1MXPBh1cPWkhGpkqTdFfams5oOh87uK4U26MHebYFqh28xA
 gFjqb4UWW9nDEKorKyXMSxGv9SOigs6YoUoy5B5nm8UnetsuQFLquP2
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2a4106 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=xzbAzJKGZiqbpjPgTfkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXxpnPNcnOpI0z
 TtWRs5IHQceQeEQSOyD0dXKVwzEvLq3uYhK8VDqDSKc9AsXfq/DyiNqBQSIn3dDMTq+cfdcucOt
 fhDLHHFSobKkxheRruWiTBPVKqRCvC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX/op2pNoaCVL+
 RvgrcXfCl5IqKB55ISfekJ4XB8B2Qw4Ps2Rq1tc+ivBI7It4QmVAKaEDoAzj6TQ2pAv5Za/JwcZ
 EFAzveWVwgtJKl8bTC/WphDoI5+MUNATSXPkdNpDCpaPhJUJ+3IBZT4TjBR/7yPEXHafYeTObXl
 eQSe+WOuyPlqzizay5G9bdPLLQgrqHurVrnOuPG1ZxSiv9rmZLvl9wMBX3ydYH2FDJtKLWUjssE
 ZDxYhOjf7/YTgKicrSFAoeNZk2QCnNtPR7Gt+t6cUm5PP9QJhJ6rqueqKs0I6IkNj3ug4+0fkFp
 TmqV3my4BXHEKbStdgZhQmgzaka4OIRT55gYiqmZ9WxK+DfjWC9JG9exPZCdfiZrYJzka/PK0kp
 efroU/zoq5rCWYzmLY/X8yv3dpCKz/8HAc9UoJiREfwo6otc40xbcALk1m8rUnL+v0KKaQ+reYJ
 vjhxPXl8pPX/YfY/tEw==
X-Proofpoint-GUID: hzADuvawqFdWVZ_GlW3_lif4CdryA1va
X-Proofpoint-ORIG-GUID: hzADuvawqFdWVZ_GlW3_lif4CdryA1va
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
from the controller to the existing pcieport0 and newly labeled
pcie1_port0 and pcie2_port0, allowing board-level overrides. Rename
perst-gpios to reset-gpios to match the binding used in the root
port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index eca66d1c1c5b..a5e2a16f6213 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2198,12 +2198,6 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 81 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
 			dma-coherent;
@@ -2218,6 +2212,10 @@ pcieport0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie0_phy>;
+				reset-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
+				wake-gpios = <&tlmm 81 GPIO_ACTIVE_LOW>;
 			};
 		};
 
@@ -2325,19 +2323,13 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 84 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2345,6 +2337,10 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie1_phy>;
+				reset-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
+				wake-gpios = <&tlmm 84 GPIO_ACTIVE_LOW>;
 			};
 		};
 
@@ -2452,19 +2448,13 @@ pcie2: pcie@1c10000 {
 
 			power-domains = <&gcc PCIE_2_GDSC>;
 
-			phys = <&pcie2_phy>;
-			phy-names = "pciephy";
-
-			perst-gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie2_default_state>;
 			dma-coherent;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie2_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2472,6 +2462,10 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie2_phy>;
+				reset-gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
+				wake-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
 			};
 		};
 

-- 
2.34.1


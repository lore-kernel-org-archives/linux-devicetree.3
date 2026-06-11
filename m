Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3305A36A379
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154072; cv=none; b=fLgJCmfVlBE4BwEoScsMHTo58cQQ8H8jqOCFm370HJyKPNdnu0aqmc9zzcddxTmdkPxCeGkNUuMPIspAva7A4t7kpVRTi56K9Zn/n6FUPui+cpZYe4uZxbI70KF7S+KgJ8JAbTu+vbxHHnWzDnRyFOESBts6sCeVX+UpFDKj2Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154072; c=relaxed/simple;
	bh=gECQ1F+ZNXfD3+/6l7MNHIXwYTpjLIQATbfLDWsUKDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YxasW57t/s6b08zjEmQSpZOXoq/E29owKMK6x+htRUBxfSsNC47B/pXKrbwS77pN7teDOgVu454QMPHBMQLmagtgMFiprk1bKxNslJrQ1d3NGZ1IkULEN0KuXlLEj6na3QIXt/Jl/TTT4ybrwXBx41EsZhR+kvk/mSGelMIjED4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmveskAa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DPxcaQBy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmveskAa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DPxcaQBy"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NkkW3082865
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PDOIaZzQfqv4LwUZWfzSNmDzpohRCevXH1ufeQUqdNk=; b=kmveskAa1LeOHSbm
	4RO9fiPqrIUxJ+QoBNzPYEnZ+ehvnKbjqjygeMR2iKt3C9jHh1OYcq4+0AB5ZHb7
	Gj8JWjeK4LfjnsUgAuRu00ilrIJDrI1djeP/1ZiQ2nubeBtevpqNLIE/8soO19tV
	fHCP38IbENZnxbOo+vr2xKu/Za5iBOSvxQy4cbIOqw2nkgxu0qCZykDBAz77HJHQ
	s05+zQ/fArzEOLJPRHkCHOTR1s1sKkdWxK9QYjTLeb7BKD5pGx6Ebp2dbHgIOjMP
	slW5nX7KbanOAwzQUwTcVC1DcgIa9ldWgFw9DSD3nlKpHKuU0Bbqt3REUqORLKGl
	PFSEJQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u9nsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85c530ddebso4337038a12.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154057; x=1781758857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDOIaZzQfqv4LwUZWfzSNmDzpohRCevXH1ufeQUqdNk=;
        b=DPxcaQByQBLfwpq2vU2cgVPyh3GRYS+pwX6izNbYdOA7LNGLIEK6aB++KqFCoz+FNk
         hKCA/ncX8xcfP4NR1MdukdTNWNshOjdHfdUcqKeDHiETXmDkdJNpMJUuPuwAv3ZeGleg
         UIbuIeQZGdktbkCGCyTQGQZIie/Qy1cWinPgVkHHPMadRK1e1eVLyhu1qUAnJo5tFq4W
         Zewy9hpeRK9TCXaN3Jkn1N99WouDV3CNZpaClIrv6CgQ1/ZgDy1MEy64+xk9DI515byj
         JMVzZVGKXeMAxpn64lFJMFkg5T2Es9UiNPnN64g6ANVkwVBRiWDW+ZQ7XKoPuPyhaGgG
         Ic2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154057; x=1781758857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PDOIaZzQfqv4LwUZWfzSNmDzpohRCevXH1ufeQUqdNk=;
        b=Dk+CAMUdhwU1kvBIF4QDw0n0+fPNldDz9dzozqdfBBUdGf6hTqbaJyDDyWKTsS+HZT
         ag4nBT4BBShWspORpA5gX4j38vnRRJiyW+J0QfCczeMdtABPOXRtAkHDwHas9JmOLznL
         /nupdU5jC0L8LhAV2eaNNRi0VPg8NfRPXcbkbx0PkRjxsG9L/5pL1tQnf+bwfmxK7SVf
         CdnxPoLYhBPBcDY6VX8xsJbGCbxJe1AEkjxR4vBo3paMydZAxmvktT1+2nyU9qHggqki
         zbRN3e4/UiUhSkplhMR9UK2aDkGJSncjMbAZ9Z9OjqVwZ0+ESueY2S+FVCsWV8QBSR3q
         Xx5A==
X-Forwarded-Encrypted: i=1; AFNElJ/su5+/Nh9v3Zf2hPCj4BXqDxPw1FgBRrVTltOYZMWVSsU49ZjJfHsGWlPSK4rwkHBPTsfGQijAF2/Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwIefcK4Aq2NaQN06orsf899Pna2a8Hlvr/biBKiI0LKnv/+fMp
	THG3tyF8A/M4JJrc30LSIwQFVH4uihn+ygiFS40Hr905/g7RwxGk3RdYfCDPkiusUyjydEqmMCW
	N2G589jSuySovrONN6L3mMWtWKXi5v2CwJW43BX8NuYRkInf2J6cumHg6ibHzOPF3
X-Gm-Gg: Acq92OG21f2+nf9yAwuru95Dcjr5EmIk8bZVlJvrLa7LWW+ZG+g9IXK4BL8I/Ouso31
	39u02HK7J4Swob5WfyqWrkTRt2TKiGSafiQd9OBMflUAU0WPhqUfvxVj8KQRDvWAM15j8qS8bDf
	fhEgwLX0ziek65bOSj6Yk9asSwXYNwX/FmDk0YYxJeyx8F47PmaNU+y1tWEM0kg2n6Rr3Fqo8Gi
	6a2yUf1RHPPsIgefLRPWtHUOh5uVLG1YqlhrZNbkm8sESU3jpf6GrSohCsx57y+1dwbmR290Gnn
	TmeiX2+431IorJ+ztx6jXHJ5oiq97vz4nJEjTS4lVlAWrerJlYUDGwzQhs4F2cGDzor8dFJs1Mv
	z+vLNh+hO+0VIFh8JxWBQ12vU85O9o9fEgiE2yUfAOP0B+I1ebz4v6Mz2o1JxxD4ScGQ=
X-Received: by 2002:a17:903:1a6f:b0:2c2:2a8a:af74 with SMTP id d9443c01a7336-2c2f0c19fe9mr14030385ad.15.1781154057475;
        Wed, 10 Jun 2026 22:00:57 -0700 (PDT)
X-Received: by 2002:a17:903:1a6f:b0:2c2:2a8a:af74 with SMTP id d9443c01a7336-2c2f0c19fe9mr14029915ad.15.1781154057013;
        Wed, 10 Jun 2026 22:00:57 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:56 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:07 +0530
Subject: [PATCH v2 31/37] arm64: dts: qcom: sm8350: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-31-2744251b1181@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153929; l=3014;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=gECQ1F+ZNXfD3+/6l7MNHIXwYTpjLIQATbfLDWsUKDc=;
 b=zvjHN9hiLaOSsnf9OaFeQygjeoIm/0Q34GiTX1MdT7OlKRJOY6ZKwX04jA5D6Y8caQXBCZijH
 XvKK8jmK3QBAMqSW3ZmiGTWYyAQaZxNsd/qR6LYIXyFBu/KUzi5G58g
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX85baY7HdUTo5
 BTuR60ji6nQV8CM8j0WuUEsQuNYdvvdrwm7fPnhY040Vevyv8/puLVToQe4GcrMQqgoHELyz61A
 EEFMozVnyZe62xUyUvNDm7CkJUoCk6M=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2a410b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xzbAzJKGZiqbpjPgTfkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX1ksTGBnTz5oL
 4EjOJctckKrxd5AjurxXaxKtzzPxORXKnQgx1V+4rtV6H87xO+y6misBkeMTicsT7PbwTwgcjei
 CdYGKluHboqvRG+1pX6bTkJVN+yNtJv+qPpZTqzLiMoBpB4Tj/oYnWWp/TJSOpoKwGHLbndppE4
 GKBdOfx66P5qkL9MJ/Yv6pEVvw6wUcHpICz5IETsCzegW2ErxQr77gP2vhkpKQG2byprrJNEvQZ
 fpBEE8Ijt6sJgJMRKYzVwP/X+3zPsCGdIpjgjI8iVDzLlbEN1sjZVKg+Gt77W/QrqjLjzm1wmFP
 9bF6hIktHR429CCUOvHIIh7xJyHEYUVSERsVBvopLpe/AE7/HqbvDQGfFBGp6wWxzP1L3IBKDya
 Sjn35gd+fjYjqnj7v2qJEbMbI/O+hkXUZkWb08JkG/A7uMeWd8QLukf6N+iUreqRIIIZWZAg7vZ
 wc6uagMvD/jiDA+nbYQ==
X-Proofpoint-GUID: 7Tr_9blIUiQS7bg4eLyzyaTigxzbvm9o
X-Proofpoint-ORIG-GUID: 7Tr_9blIUiQS7bg4eLyzyaTigxzbvm9o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
pcie0_port0 and pcie1_port0, adding labels to these nodes to allow
board-level overrides. Move perst-gpios/wake-gpios from the
controller overrides to the respective port nodes in the board file,
renaming perst-gpios to reset-gpios to match the binding used in the
root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/sm8350.dtsi    | 14 ++++++--------
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 0897ed1bbc6f..9a14973fd972 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -493,12 +493,14 @@ &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l5b_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
@@ -507,15 +509,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	status = "okay";
 	vdda-phy-supply = <&vreg_l5b_0p88>;
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c830953156ec..4515a1ccb930 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1583,12 +1583,9 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1596,6 +1593,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie0_phy>;
 			};
 		};
 
@@ -1692,12 +1691,9 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -1705,6 +1701,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie1_phy>;
 			};
 		};
 

-- 
2.34.1


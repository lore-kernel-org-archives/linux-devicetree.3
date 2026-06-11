Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AFA38945C
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154046; cv=none; b=E0XqekdHx89CgVRmhJl89BQwA9ifEPvKVMeacpDbzUIFr96s3IiPojj7X0gDsRXjkcjOt+DR50BtAMMIuMMAmMtm/MOU4vsltEV2xGAR3Ld0vH8aczLmPPEV1cgkdK2biifyh+V9n9wPCHUEHofuQ7OZK6XTShdDSqdBNF59sPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154046; c=relaxed/simple;
	bh=JYCBxKue2je4Cmcypa2TZclpOE9DovouCbVF1Pr3bBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QUNdlp+91MyvCsqhh6DvJuxA2QVnx6r6WSdFLrKcS736IZ1bAec7kBiJoJ9DbGtfkeG93cZgz9BhmR6or4NHSCTZ5RhOj+wbfi3At7ocywrkQxroCu6crHVtOnKfyIpyapCiYNch5FbE9CT4cHwUgwdHsOW5ScUm60q9uzca5Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fjVHrvSl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fX0fsMzc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fjVHrvSl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fX0fsMzc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0PVNM3085771
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AulPtbKhKSl/jbs4Ey8L9/KWu9DlFR9KhR0INMBYR9M=; b=fjVHrvSl9ok0ZbYM
	ncS0rbg1b59KnUwZ0LLiP/VMGgDTew2I/3wiGZeRmoUtHP4cITJVQB2ZOVeoGJL7
	xcq/pr2ZJLoshC/FP1RFbKlMWUBjX35T/8dfSLHxlPaNWKvr3zXx1IfD+V5zhat8
	2j0KTt41GhPAnGyLzqqWgZpeU5crNOQuK3kdY7dVY2PWYUTdgOP8wWrHxEjUTccj
	2VLwSOm7uTVDV0dfSo5RkR297m4N1+6AEJu2+tfB/Mcg58wn9hIgzh3WKh/Lcc8x
	hed2qh8uDaqk9z2ZDa9G1vjiYToo1zhzj1GvFH25+RilQejz4lQec+L5TX7G3X/9
	eM60zQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u9nqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 05:00:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso129971635ad.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 22:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154034; x=1781758834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AulPtbKhKSl/jbs4Ey8L9/KWu9DlFR9KhR0INMBYR9M=;
        b=fX0fsMzcUu4iBNR90hPjM9gC6mV5Jx4L3prUFzI8HbmfTXWBBbLrpfqEb4HsfAMXDk
         R/g8EY97sojItSaIr7tmDnqjtKVpojxdZL/Ae+fbC501WWZGZf2zecRc+G/9yWbJhe6a
         Ql0TMAdQIJuYnwT/ew0nPA7aJWhYk70qC9/3bsGgmA/LY5l8i4659nZv+PFusAJ9oKiT
         UMZ25/NssN1nYIy8H+UgrMmojL5kEMoWJcUsfi7n1qQDk+v0KXREai75kPeQV33wbjmC
         VFIsdvoZo0KErsk/yp5Vl5YTI9omXXhF22by+QgNqu8Fv8mwVLYz/Px7f9oGs5qLGoHK
         0xbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154034; x=1781758834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AulPtbKhKSl/jbs4Ey8L9/KWu9DlFR9KhR0INMBYR9M=;
        b=slASSYNsqcTAmfltuxUC8BX80lV9jfpzfuEGYAvyh0xsowXBtIvzV+s0hiY+qUk5QZ
         SZ+beVVbe74iaJHXhYt3LM48USCKdqCDtWv2Da3PmRliBPIirtQ8+9PnpsePnpXcs5sM
         3T2jZw7kXhfLUebhXm0z+BrLa/TG79SFRJyu2kG41kfLcVJFSy+/CF0j6IlEVLagspOK
         2XgMKK3FfGX5++nC3UI8U6Qc5nX5whIDVeCIqRbWvrZZEGSzxyZ085idWQpK+xmX5agZ
         cJ3T0awOu/4WB1Wyw6XEr7GVnDF73g9d9pU9hkNe7w4fPlm3QkvN/6IT0OoVnAwOpXex
         fySA==
X-Forwarded-Encrypted: i=1; AFNElJ+IXLV81UzPUfh1yVK+5b89ieokTzPA6krkwGjMgY4c7dcRdWnKEJsIJaVVif3Wppc5Pjqxgln+2AbW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx01SRkWALSaP9geWtHZyCLbfLWDpBdx2CuMDAZKEYYzTiaJSIm
	ANwc70aOuvWR3rZ4M0BL1JwCMmE8v1O5TZWi7tTw9SJAJwj/hFwqY2S4ZXs18xNmJHUWaDMwghD
	wK6/2JkYcKGhKHIs56RfX+jHkv2LXIf9ztHrzc886KvTPCWm7rIfRB4IDC82Ja/5V
X-Gm-Gg: Acq92OHpMuEHhe5jqHlXd8CzLKCTOeAZ5DTGmMyQMc/+sxbXUPTlM0eXN9/7i6WiFjR
	GxScFbAIso90ciqsXCMBp9KoyzUb3RUjsXP8tsOs1i6Eu4Cq4wzk+JUI4oQAD4cc27lS+3Kt8Pc
	m4Rh1Z77fMx/zw0hPEYY2ZZsV1auwljbJYUvv6IRmKEuuDWrnSLH70j9cxuPQcPh7YxZrsEbLpC
	wPpYB6y9ccK3SNZsWRjcaKyaVk5W39iy7E+FrQIrXWhj8PaokwMMooVNZ3HNDbo0QsJB7PrHI2S
	SqP4Zo2jJsLC7azYB5jj9M3BWB10Q0VpevgaoFSnJ4ADilE/V4fReRTJpdMCcVOiLaZ5NlIwnSV
	/HhzUg7Tu+Cltboogr8o9IURHDbfE7kpr+5wAGHgdg2Qp4/HpmNXygPzWP2ThOfXq6jw=
X-Received: by 2002:a17:903:13c7:b0:2c2:245a:3368 with SMTP id d9443c01a7336-2c2f0930222mr14076355ad.14.1781154034478;
        Wed, 10 Jun 2026 22:00:34 -0700 (PDT)
X-Received: by 2002:a17:903:13c7:b0:2c2:245a:3368 with SMTP id d9443c01a7336-2c2f0930222mr14075715ad.14.1781154033843;
        Wed, 10 Jun 2026 22:00:33 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:00:33 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:01 +0530
Subject: [PATCH v2 25/37] arm64: dts: qcom: sar2130p: Move PCIe phy and
 GPIOs to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-25-2744251b1181@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=2554;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=JYCBxKue2je4Cmcypa2TZclpOE9DovouCbVF1Pr3bBk=;
 b=eEgY/3wI3+5IdOPwcE8JlVYdoFWiLvdzEJ4O4HDtnb2oqDTFj0axDzLPGCsGmvOWveRHR7abn
 RcgL44G7P5ICa5/1a7pdL9DZrbivFlZMw30xLXHl0B02ZnPqrIr7yTY
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXy8nK/NBOb15k
 715/co8CbWI1k4bnUUk4bjjGeh86hheLrghWRNhcWhjgzMJSldW7JLIuryY3ubV589rkj/K+4J8
 2/SintqAY8FsWUeWr8edn/UpKnLMzCA=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2a40f3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xzbAzJKGZiqbpjPgTfkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXxs3epB+lOMZw
 mPPdVRg+I0qgqQXwnwqjB+3Na/UWWuNRWJF8WXwUJ9RQ48OEXL+nJB9U1QHhNVKSK9uN7t6dphd
 jVOoNVYmKt7xLpMctI693c0TuzeVp6zHb0U9NG5OXBxFVf0QDzKTeKr5Ndd10L3jks96XqaDK2r
 EJA61/6qVQFb48RFMPzEZnTZ2U36PZIJPHzxGhW653U+IkOpJC8jemaOE5uKPg4W5EC2+/hXYKY
 Tr1UcCf9SLXDZeF1SygjO/Hh2Fk3uHciQb3tJfJCID0LeILi4ZBKi+lQ5Jc2ZElt676jKtsXMai
 8CQhQc8LA3id8rqficMwVqlQh1aUoEvvQhfPOufQ5merHTDEoX7UoLko5H8DAgXmaflvrW8l7jl
 NoPTkM39OMPl70RrOdeBZHJElf0tuzDGociJxY6Xwjt6jXDaIJrL9HpBaoxqXVwUgbaU5vsjfoX
 QLsp4xOqwn1RmDroa6Q==
X-Proofpoint-GUID: AOGsQ_aTzaPee-_RQfYXl-HsZlIxSXOS
X-Proofpoint-ORIG-GUID: AOGsQ_aTzaPee-_RQfYXl-HsZlIxSXOS
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
the existing pcieport0 and newly labeled pcie1_port0, allowing
board-level overrides. Move perst-gpios/wake-gpios from the &pcie0
controller override to &pcieport0 in the board file, renaming
perst-gpios to reset-gpios to match the binding used in the root
port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts |  6 +++---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi         | 12 +++++-------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
index 71a09e76b359..6e0557f1c14b 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
+++ b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
@@ -357,9 +357,6 @@ &i2c10 {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -367,6 +364,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index d65ad0df6865..804ccfbdb091 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -1337,9 +1337,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
 			pcieport0: pcie@0 {
@@ -1350,6 +1347,8 @@ pcieport0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie0_phy>;
 			};
 		};
 
@@ -1464,12 +1463,9 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
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
@@ -1477,6 +1473,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie1_phy>;
 			};
 		};
 

-- 
2.34.1


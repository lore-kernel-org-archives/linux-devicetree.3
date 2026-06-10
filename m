Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD2131B130
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 16:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781110716; cv=none; b=gMa/abDAc6eQdGChxM/EsNeThcDyA07lUq4o4xx8lhcfIl7ahQZk2/hOJeWgqF//1zS+EbFUvWccAYeA3LRc/Mxr+pd3vXDCCQQPU8Ase+4bpCUZn5rP5VEz5olRqWb82znFfreT2tmDFnCaBrlYLgLT4bNreqsAPb0OIpa1tfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781110716; c=relaxed/simple;
	bh=coutn8kHZx0KwY6Liu/+GJkAssj3lLlvauFhcZDDVxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BRsMCaUASmBa71lyNZew9rxEpiuqFD6bedBdoGukU9N8jeuIlAO+QgjpOES0eXzVu/UgD9B/OnFoOTUX46DeXRRwKTUARcQD5zjpMcytEyJqkb9RO5xd1LMQjzMvP4nIX81qHr9OUZXO4r5msAnmeSwbEXvUsGLozn05gcDT3aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dM9noVBE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W9SvX1fE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dM9noVBE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W9SvX1fE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AFwkSx1690269
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 16:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lEKTxMakFBBE2KLlDpCjm4
	7UTf/xRvsT8S1VFXuxhN8=; b=dM9noVBE+7ZK3ka8yYdw5aWUR9puzID72/G66i
	SmJvdr26bwFvnwPyiIagNnDeMGqw4ucMRp3hWJsOM5M5fptxcw57sq9VzQ+7m4C9
	7FNUrW7k2wqSKSSC+dQk3i+PK4HMLKe02YVNhTakkjh8DEYOyoC+kvKxXBjgWsFv
	WVHpcBCGnR3u2WMdW7wdingvrTnJoR4aDBbrVl3K2Zfd7X2lrp/3svHXbPYHIB1f
	kmN6M7U/hLEv6Yp51vOKoxn1WGZ7pWLHRLxe2BZys4KunJ0gMCBij4PWwa/lm3di
	u3JBAHomyAVKo62TPznMsCl4G4nycqVhr5HJ7jxuuS1cuGgw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1sydn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 16:58:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf1845bddfso80181235ad.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781110714; x=1781715514; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lEKTxMakFBBE2KLlDpCjm47UTf/xRvsT8S1VFXuxhN8=;
        b=W9SvX1fE8e2pBFPJj32Orfd+dyrRcWH0o5u/uqv33QEfCFdObseVV6nD7z6s+2f9T0
         3XyK4g/CDUihNvbjwJATpQhmnIFI3nnWsAlmcrzsCQUBUTsK1lk6wv6zMKrFeO9zLLiq
         4I7BAL3JRiaFInAwRZJyOkke8TseFCH/E6EYteyLyJCtQU6o7Mv2J7kiOit5tw3gRpkV
         sneBEWf+OYw/td3XsJ33wfmiki77dwUtzZDxDorQ9SzNjVRKQL4vOX+Dxz3rEMuR3Oid
         qE3nodtURZIhhGPpkoVzqi9s9xZpuBuw1JdS2uhFxWTjXRTPkVx+ZHXvzsINybEyfAcm
         jVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781110714; x=1781715514;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEKTxMakFBBE2KLlDpCjm47UTf/xRvsT8S1VFXuxhN8=;
        b=rUrFMhrp99+3/zRU9/veda17E/S8xiLkiAVpWi6JYMJ0FN7kb7POFBQiWUyN19kG8A
         AJCMvHMTda/XbI0XzqK7KmUNfPA2gmhzCGplFob5pEuMyrEr9Xpz1DKe125+WPkC+jlS
         dI8K2A9LD49vDTV9yQvsbkukDN0jmbGNncb79CzOfUqaVLtRl4SZDBxl3yF2sqxFTI7F
         WUF73g2xABBboOdTyK+lAYTV89rVukfKR+3L6mrWxHPFIT1b8aw/zwnSjpXSIDwQJfmU
         6c4KjiPO8peMLKos2RIxgkDTf6lkBTYAyuwd1UbOK+I6ZQ97uvLO6XVryPJkapHIkZzd
         49cw==
X-Forwarded-Encrypted: i=1; AFNElJ/IqO/vbl5HEg8eCnhIRW/Aq+t73OpmDyOzgdQzM5jmIiCKCeilm1SlsN8s6E5OHfA3wtBHxlrlEq4I@vger.kernel.org
X-Gm-Message-State: AOJu0YwD0x8q8QrAJ2ModDSjNAFqwtIL4vUVoPqjy6ZxbIdczZ0z9ssZ
	icY8oBSNtxaAUX+CpVvG4ixGhtpiwZ2reYIp2hAqidkuhKhoy3b+vh8lEDq0gOypXCqxMOKn2Ty
	VbyEKGNPUIMVXsMsiUbtm4zAFX5GL+e6tBmgfxaOaZjucgVp676TbfUGP3ZyzdoVE
X-Gm-Gg: Acq92OGNTRTN2d6ql+ooDsrHyd9oBdtm75AODGSL8A8+HatcuY9vgdgNS8zZGenIISv
	YEXZhNU1jan9VCbcK6b4WsvYbwSTlmQe9ku2m0xN9Srsl57+RBeukKepK1A3U5v6Ks3jZPxwbcd
	UFDyKUGAUUkJ4f4SXIrWNspUThVk2RphITU8xg6ES8bIGGYWG1eD7RyK95nsqVBedi2WzsoJ+nz
	bwRNDzSo9TSUoLUJSEBdeR5lAoLHkPVYpzfpnczmPZkm1+Xm88DmWWxvPbdT7t6MuwnHzo1wC3s
	7deICf6Sc7RMpD3YqjneTf9UTu6xwl4mykhlhZ4Kz7FhlnZkCb7C/G/UPU8qm+B8HZctXyJPBdq
	JbjSfc+ZLKqKSJnbc3NAGe9XNS6gQb+PhkFJWwsdRy1MKRiNtJK8qYSKASH7o3sRLNQansUDZAX
	8n92ykJvkJguS2+ujKDfmIxPGvo2YLnzZTe6e9X71/o7Pb/YlmDnB5kIHm+uaM+oklVjo=
X-Received: by 2002:a17:902:f547:b0:2b9:6458:1a2c with SMTP id d9443c01a7336-2c2da750d42mr1013065ad.13.1781110713712;
        Wed, 10 Jun 2026 09:58:33 -0700 (PDT)
X-Received: by 2002:a17:902:f547:b0:2b9:6458:1a2c with SMTP id d9443c01a7336-2c2da750d42mr1012705ad.13.1781110713248;
        Wed, 10 Jun 2026 09:58:33 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c166396fa9sm253963755ad.66.2026.06.10.09.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:58:32 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 22:28:27 +0530
Subject: [PATCH] arm64: dts: qcom: ipq9574: Add missing PCIe global IRQs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-ipq9574_pcie_global_irq-v1-1-6d6333b95c43@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALKXKWoC/yXMTQqDMBBA4avIrA0kUaP1KqUEk07tFNH8qAji3
 Y12+S3e2yFiIIzQZjsEXCnSNCaIPAP77cYeGb2TQXKpuBKckfOPqi61s4S6HybTDZqCZ2hkUzR
 GqKIuIdUu4Ie2+/x8/R0X80M7Xzs4jhNbSPRMewAAAA==
X-Change-ID: 20260610-ipq9574_pcie_global_irq-eb2838b16374
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: MIMS2yDnbjRXXMW5txa25dbISKP26pBj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE2MCBTYWx0ZWRfX5JbvjuIjItw8
 3hYhCLcbP2n2XBL0fLAyuUVextsHC3RlEPZhj7E6xEDESMLmY6Zh0clxhMiu8Q86goqqCcBUll8
 +mWvGBKIH36urPJIrjuf5w1eyWN9RPTGVb70NG5FY7do6A6SM4pDcuGfE9ccWOC6481+gyhIzIA
 msJPeeJN8fNlpc79c7Y0olfzLVSZYOm2TC+QaY4mI6ZTlc6IeeqjyvOZwJeDLPbIY9I+rg1jo6W
 JJNlOjUUrFPWu93SgSe5AMWlTGBkI1z6c2V2ZeDQwyX+ylqscz4P2hcX3HjLgOXEHn7fgpHcGeG
 eFtVYRxVWJcRF9vqEJorQ+AKdbe606I/i3raK1scfG83m7HXffOiS+9HCaynGuv81OXqWJMgW3P
 qss7dVTLfeVPTUlX7vf88ofEbOML9TIl59rF3zPi9wHnawI15joZ45pA1Bu+k2ReYRATJ4NpIUJ
 cZ0/xS0yGAG/nG54G8A==
X-Proofpoint-GUID: MIMS2yDnbjRXXMW5txa25dbISKP26pBj
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a2997ba cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jkYWTDicirnocBHR9mwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100160

IPQ9574 also has the dedicated 'global' IRQ line for each PCIe controller.
Add the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 622cfa96ed2b..a7e7115477c8 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -945,7 +945,8 @@ pcie1: pcie@10000000 {
 				     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi0",
 					  "msi1",
 					  "msi2",
@@ -953,7 +954,8 @@ pcie1: pcie@10000000 {
 					  "msi4",
 					  "msi5",
 					  "msi6",
-					  "msi7";
+					  "msi7",
+					  "global";
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
@@ -1031,7 +1033,8 @@ pcie3: pcie@18000000 {
 				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi0",
 					  "msi1",
 					  "msi2",
@@ -1039,7 +1042,8 @@ pcie3: pcie@18000000 {
 					  "msi4",
 					  "msi5",
 					  "msi6",
-					  "msi7";
+					  "msi7",
+					  "global";
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
@@ -1117,7 +1121,8 @@ pcie2: pcie@20000000 {
 				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi0",
 					  "msi1",
 					  "msi2",
@@ -1125,7 +1130,8 @@ pcie2: pcie@20000000 {
 					  "msi4",
 					  "msi5",
 					  "msi6",
-					  "msi7";
+					  "msi7",
+					  "global";
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
@@ -1202,7 +1208,8 @@ pcie0: pcie@28000000 {
 				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi0",
 					  "msi1",
 					  "msi2",
@@ -1210,7 +1217,8 @@ pcie0: pcie@28000000 {
 					  "msi4",
 					  "msi5",
 					  "msi6",
-					  "msi7";
+					  "msi7",
+					  "global";
 
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;

---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260610-ipq9574_pcie_global_irq-eb2838b16374

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


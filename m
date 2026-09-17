Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B954E2F0B
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647997; cv=none; b=jBT8grgRoGPPeRifCWhddKa2k3MF884ZD98JMS3pRzSBsW2ZMa8sWF6I9Ue3Wkb8ocFocV/72yhsHrlE3DPRVfdDtNtvyWD/vRYioatPZ/8ILS2byU0rGmr66NsdAGuMp8IMZvD1Z6DCr9V4+Vl1xLRu72jAZksPULNA3JFx1A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647997; c=relaxed/simple;
	bh=s0flBkiVgOHNpTfj2FYo9dSLBFYGhTFMSZ3MyIhPhvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OpMb38jkj9pps4MqM8xbxpp12IFx3lk9eTHCOWyBeKupmA+DmxPk3vbsjZS/gGcRY7+4uUrDW5QqDWMlC0Sod/NEcDKT2fiHXb4snLpDp5W7KJlvYlAF+Hg8b5SkB51UbxV0577s5p9bE/7LnUbnIJv95anjaro8Rsv03AfvJLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EB8OaabC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PhoIKx9B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EB8OaabC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PhoIKx9B"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9Zxck2211131
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GgztVjlEbNTbFa64c/dvYzyTdY90V5eFRhqBFdnL9n8=; b=EB8OaabCZ0I2psom
	XTV9H8U+7cNXO3Pyb7tdXj2CD/yK+oNdSRY9YXPGcIPzjTOHPgmsfIj5i6SNlW5C
	oSPVGxa1cgbD+QDSn/9DvDUFkfJF8sMHq5FraEWfNb1ehN8g7tQRNzcfy6jyWrdp
	gpm2plBC9OzkG/p/wOl2s23Gv8n3CmrbCiiuGf7iBZ3ymO7D3CeAU4xsmJOcAsfS
	xlAJGRQIGMI3QXzJEcf0P5jfcnr3/l1FLSMIyfjJt5k8pSf4LRONDG+JWjukZKr3
	qazZuTbdmBUeld0X62VE+D1GJehPPT5uwwAm8VV3cYt4kS9VbhO40JXE/mug/lZu
	NgDeeQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m28j6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:26:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d63bad3d09so13164115ad.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647976; x=1790252776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GgztVjlEbNTbFa64c/dvYzyTdY90V5eFRhqBFdnL9n8=;
        b=PhoIKx9BlPjycAxy6++6BWMAjEuiqql+Jpf0rmHmZqRg/Zz7qlsgsUER5k3OXm4yTx
         QEQY3FGcZX7zd8QHk0iP5eomEYm1B2VAPKUQ2t3hiTWUQ/mD/ukGKZHeasBh2kQDaCmW
         O7eyh7HNNb6z4yUoa//lJGfuXA96QbmD0IIq4rTAZO3/eHD9cDNZWYfk/g6fOfK3nyHD
         cy2ocWTTK6BMZP4AizZH8xlZl6Y+OarpQmt51LPA1WPUYLBfZqD00OjRobp+ddw5WVbt
         lAHmYMHx2O1lwA8JeGNEDuV0dLFd/n3+5yqCu5EqxwmjI9ydgKHJJ5rF2pLW+8IImiCO
         rx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647976; x=1790252776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GgztVjlEbNTbFa64c/dvYzyTdY90V5eFRhqBFdnL9n8=;
        b=PIxXZ7K2tqnOz+YsVwZXL/oS+7iI4v2q7z9SrAz0oqPv1kgiaZHQltMXRRGSDGL0M+
         tEHNi8lJHmH13ArdJCs6FkOhd24++66dL4pWQq1O6oOWBTXPsD+z/6D0kwK7qFCjDUaK
         u1QFZROdYuvAFUwZupnSlZcLN+4mCrQJ+aBzd8t2UH7PTZ2SvkQnnitwyud74qPdePFK
         Q/LEvmqpL0DzqojQdvHdpa3v4tjdVNS/t6vbTC6u2SGwM8aExaJy8pR+OHEoTFDnmsr0
         x0RvwPVACRs2kimJUgjwZ3mUVJspXI3xJPIkP24KjZFrVY0JkVzIZAt/l/IFmsaYq7sv
         wctg==
X-Forwarded-Encrypted: i=1; AKwUvBx5pFuifY0t7qIUIEs7xYoDhJmz28w3X/0OL+MaYSBFeY37Oz12GV33WM2I2a6Man31t0w2ruapmIwW@vger.kernel.org
X-Gm-Message-State: AFuF++k6XKWGWYVp6jYxhpZcYRwgjQKhkJF2ezKi6o2WKLKc2lMV4fXL
	XMOg/CcGauQ7dotw0GB0shkPNYRnG8+MpHRdbY494/NNwstpPDYjeMpPtQfsSNAbyXC7O98WNkf
	f/TRhDNo/+qs2jf0TkSGlex4J5pma9/DDDvwCZPWqNarPPaoVJs1pgAqftv01o2Hm
X-Gm-Gg: AYBFou3bt7at+PA8MSD0jKutr7IEY8dfiZyOM87PvMeWCJiD9nRS7uHdGCRs03oBwAH
	vgoHi9SVRPqxH4AG8o9DTwJz+JPA7UKjwKGStR7N2mPwrtj+hfHmnRha/cTe0jqyHPkWiHCeSeJ
	39p/L86LJSuApC6vxXPX/GSWcQpnOSlE6MJVtH5Ej2tBPeq/mqc9rD+jnEmMmQDg6HK9vxM04lE
	KXfLpEntMwSjAUJGsEtnkeJ65phoJMYjeMvdeHXm7SQIXsyClcPS/Q7XSL3om0NO9NIodUmv+CJ
	DE8BYwpZS6G2afDnzGrEyt06lkHSxuehS7VacaVYFBC4qO98JuXYMd4csHG1zjSmyGeAYby1Ax9
	UalTt+LhMhOmfK+As20XPqd1aS7xQIVKQKqc=
X-Received: by 2002:a17:902:f690:b0:2d7:2edd:d140 with SMTP id d9443c01a7336-2dd8dc03870mr140392405ad.3.1789647975359;
        Thu, 17 Sep 2026 05:26:15 -0700 (PDT)
X-Received: by 2002:a17:902:f690:b0:2d7:2edd:d140 with SMTP id d9443c01a7336-2dd8dc03870mr140391465ad.3.1789647974417;
        Thu, 17 Sep 2026 05:26:14 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:26:14 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:25 +0530
Subject: [PATCH v2 11/15] arm64: dts: qcom: talos: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-11-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=2872;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=s0flBkiVgOHNpTfj2FYo9dSLBFYGhTFMSZ3MyIhPhvw=;
 b=cF9I/hWsExkAiVbbV7/osNokxs5yvv51z0xwLwPgIRfvgP6gbsnI1/lgRPjLFIJGCus2wlWde
 B51WrGA7n/HC2rQuBVRdkGrHlsrvylK2617RcpGptw+etC+rmEFLDGZ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aabdc68 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bvY3E1ByFFb03tV5gjAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: C2OjTvTHpKQo2HBeYDRhdMS1njoT1oaQ
X-Proofpoint-ORIG-GUID: C2OjTvTHpKQo2HBeYDRhdMS1njoT1oaQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX6ApQiZV/txJo
 j3svLPL6/oZ+tX7YrPS0L3TMn+Xs/vslSdjLdFI/bw+VtQZx10Lu9B/PbqpfE8yJVOnApAeNWaB
 vkANZUJTFEeJWdU87+Xxh4mHhxy3MBbbeeExY7KeH6deXj6fAoAWU5GEbNcRmwHItiYfo7JrfJ1
 tUkJZXW+XKNJ4ON6fnXibAqO/0csTA5HfMToIkmUFzwlx7gFkI9XSovwk2Q3xOoCZpLYymAmw97
 GZ6GlIxHy/iIyeIt5PkQbiyQ73OhnQZlP7XCfvWBjdPEh65XGDTX8u7SAvmFMJ+FZPTRZmOS3o6
 GlTkEfdvnOWXNgnNv3pmBO6NPwBuwtcNFy55nI8UnJmfhDK5qXot93qAG4SuOwItRtkn2qU9tWO
 CX92yDX1xucwQFIkgQjcG/d18IE3grZcE3l/o2soL+LHoSw+54qVUIxkZqjB5xN5VsXbG6PcTvQ
 zctz13W8MDv3xcKL1Iw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfXxaYFZdLGJBh6
 AzWmrdUWmMbD8sEuSTTUYRoaLWZs0ckiNJbQa8Y/kgz6ny+KFViegHLvaLucmkEP+zvXs1glUeI
 YJtEmcJTf/mSCwl4sCEKorgbPtu/m/E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170174

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys from the controller to pcie_port0, and
move perst-gpios/wake-gpios from the &pcie controller overrides to the
&pcie_port0 node in the board files, renaming perst-gpios to reset-gpios
to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts    | 5 ++---
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 5 ++---
 arch/arm64/boot/dts/qcom/talos.dtsi         | 8 ++++----
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 43f110ba3a7c..142dafb04324 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -444,9 +444,6 @@ &mdss_dsi0_phy {
 };
 
 &pcie {
-	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";
 
@@ -461,6 +458,8 @@ &pcie_phy {
 };
 
 &pcie_port0 {
+	reset-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 	wifi@0 {
 		compatible = "pci17cb,1103";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index 198f656bddf1..aa2d9532d37f 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -366,9 +366,6 @@ &mdss_dsi0_phy {
 };
 
 &pcie {
-	perst-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie_default_state>;
 	pinctrl-names = "default";
 
@@ -383,6 +380,8 @@ &pcie_phy {
 };
 
 &pcie_port0 {
+	reset-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
 	wifi@0 {
 		compatible = "pci17cb,1103";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index eedfdce3c479..a22f78f5a5de 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1367,9 +1367,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie_phy>;
-			phy-names = "pciephy";
-
 			max-link-speed = <2>;
 
 			operating-points-v2 = <&pcie_opp_table>;
@@ -1397,10 +1394,13 @@ opp-5000000 {
 			pcie_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				phys = <&pcie_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
-				bus-range = <0x01 0xff>;
 			};
 		};
 

-- 
2.34.1


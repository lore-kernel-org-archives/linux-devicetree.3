Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C821A296BBA
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 07:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569511; cv=none; b=oZHHcMNKe6UTko06bSUiL295EOfRIi0MnyABKCfCdrJ4CM3Q/ZB7jpqqoYSNbkrdzbg06inHJoD8exdifF8o6+Gr3GAkK0Z7M0ISzSRmhtG/SvygbDoD7xH1zbywjcfQDxKCC/oyui04BHe6BZ/rqGAgYBmT+zOLwcu/yJRxQmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569511; c=relaxed/simple;
	bh=9vYix08+c4lv+jbQhuTA9yArZFcrbc2L01V9Hr3npI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=up4KwQ50SGZFN2tdgCMm7bRkzcbT9gXLonLUYzGWhgknCvQuO1UzyXPQWMv3Yzbp9I8bYx+nBVokyjd2UCRSIWrwZOZZmOGRPFMkOG3XRLd3QGwQx80n65mIN6jmkuWqNdAaSIHuaGSxPLAV1XsbjxFCMzu6giHXHOXOangVhVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fwk7LdVX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N2slaINL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fwk7LdVX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N2slaINL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C52D0j2186435
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 07:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9HfXpwITEyMUjLTal5dVmmvNNmwX9acXkHvucPxg3ZY=; b=Fwk7LdVXIYoduG26
	9EFBMzKzXHUZCKkbDUzwIDUFl8i8p3yPR4juVPaw0TAp24enrIRtGNglloC36/yT
	h97qczakkvRA8m9eH9Z+WQJVKJIdRaC4aUhMB5lbPFsN/rests6h1z6Je5x6hpm6
	+9dJlTYgP5BWyZoEFlNrRJ/NnYfGhRmpYyJSKRp26XW52TgifKEd1RlPZwng87h2
	Uu6rDsj8jNwDfxIVBlQAVfNUMy1PpjY7zzQnMLM8pjKeZCwVbL1JknOi7kQRy7mu
	E+cWy892VE8YN/CIK02E6QnClS4Cs93P2IrFv1Vf9wqfjl2VL+FKF88tL0J5x43O
	8pQGUA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv29yqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 07:05:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba224c3ffdso70307565ad.0
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 00:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778569505; x=1779174305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HfXpwITEyMUjLTal5dVmmvNNmwX9acXkHvucPxg3ZY=;
        b=N2slaINLusaES+4srAJzo7uCikmM4dMYpqDGb+Ve6IBazaShU6IwsB703KOyuoiwZ/
         bEj/ROT4cL/JEYKfGIfGw2Avf5tLFvcUPlB8Ais+orXaGf7+Xwpu5xXEAnYu3SrCf1y6
         CBkKQG0+f9Vj1/4WaU2IB9l+DtVcrp+xr3toSPOQLmU7eomr9S5ks7+7CctrDk0cBmyb
         cjrSCSHOXpNZC964xj97erGfuu9/vlM0Z8vOmuTHXtUstXswrd11hLSFiSIQ6HhviN+u
         txrRMJLPNqghH9TW/P0u3CaqnOzfrKS9zXcnPt9gCzU/FK/mmKMYj3pSSDOa7USbdaCX
         gaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569505; x=1779174305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9HfXpwITEyMUjLTal5dVmmvNNmwX9acXkHvucPxg3ZY=;
        b=qRUb63hB9nhTQhw0p4WA90SFKgP9GFcuSDTvkxqHM88VQSh5C8rhWuzrgeRBr+JTl4
         V2ruxRiOsZrAqKzoNxCaeNf/5UEZKXTaZwk7g2AIxTpSdc/OGG088MDxHo+JZrFPtBOX
         Rq5SHRa/nr32VzxB5LYynE3I1N3j92yOOZmQAmNrg7aNm9MdldOlA5l6iI1fqjJt5HEq
         mzF/G7Lu79mdai4h17KEctg7HojNwyB4Hm+bkUko8Z0JvVhz1C+cQveB1+cC4ycG6Gcl
         anYChS8aRv6FBznAHSc3VxOE03ahs900464PBacXxyP1mMYsI5N4Ot5+zhMp7HwVLZ+t
         Cf2w==
X-Forwarded-Encrypted: i=1; AFNElJ9AP2QnR1ytaryk5Kp2OP4OQjRUzsFwxnFZAA58T02jkPQDI7nrsmtFbq8G7SvaQON95HW+F/vUQ9b2@vger.kernel.org
X-Gm-Message-State: AOJu0YxjGSFSfEGL95WoGO93q2zRDmcz43pJaQeY7L8xH77+QHttdEuI
	17+nqxZBcmXM3jKUwE1GqUrOw2KbqZQq1vkNtQwiAH2N/Uqzyr04wB4CfRwjX+6fF62Wkfx1ciY
	/9bX8CBfLCpw/ir4iIldiJuG68S+0erJbQ+s3cGWit5BMAM/q/53Y6LgCoM8+qo9T
X-Gm-Gg: Acq92OEF1SeU7A01K98fTMUfX9avpVsT03w8v75cUwkrN/O1WQefs0i6UXDYuLKn5mb
	N0S7GlPN6i9bVzSfS2/HPjIk9D1EhsGBi3ZEXgJKQ/6cYhpIRVzs04QZ9SM8PhA41AxZ60iuDOA
	Xo652Ai3gtAvnYLrkWGlwi9C48oBOk18/N4Ch76iQjx5P8m9EwRj3qcwXdDweHySTB4NB9s24QA
	IeQfw72Y/3JHnwjCOkSdrDfSRSFAr52qnWbgggRkbBqVYlEp9lGASlGxxLgAYG3kOC/si+XrL92
	81qxY0mWJ+ionLuvKr9gemMFiwIk+m1L8b6gJPU6VdPAMf/SANoX+/H49AOyPmlja586Nu3D9ju
	PesgBv0icJ01iu3+f4SYNsDs8MllJe/q7SBjcoQOBiTsOgoN1svGHjtWpHq2JLM09b3rpNs9RxG
	38Bmggu4itTE0b+R3akqUIN8/2qY6vjMT99IG+lBNk97teHrM/LW8NZdng
X-Received: by 2002:a05:6a20:1590:b0:3a2:d79c:416d with SMTP id adf61e73a8af0-3ad99f243dfmr2250435637.43.1778569505156;
        Tue, 12 May 2026 00:05:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:1590:b0:3a2:d79c:416d with SMTP id adf61e73a8af0-3ad99f243dfmr2250396637.43.1778569504672;
        Tue, 12 May 2026 00:05:04 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267711b21sm11354488a12.15.2026.05.12.00.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:05:03 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 12 May 2026 12:34:54 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: ipq9650: add the SMMU device
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-ipq9650_more_dev_support-v1-1-c4c627351d80@oss.qualcomm.com>
References: <20260512-ipq9650_more_dev_support-v1-0-c4c627351d80@oss.qualcomm.com>
In-Reply-To: <20260512-ipq9650_more_dev_support-v1-0-c4c627351d80@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778569496; l=2416;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=9vYix08+c4lv+jbQhuTA9yArZFcrbc2L01V9Hr3npI4=;
 b=k73AmTFaPwJWclAuL31ijFSpc1weJf/xEAOVX9GDBcDOVO4asz1m5x1FAHMfY2BlCM9Gdk4Ru
 9qd696qTeixD2al8qiM0NNkWlP2yRIUMS6LvpXecQciEKRW8DBv4/Ej
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: 57VhXFBQIZ2a9qHC-Uy7XMJYLh7Z08bc
X-Authority-Analysis: v=2.4 cv=CeM4Irrl c=1 sm=1 tr=0 ts=6a02d122 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QjoPxeQpGguECTrdwR0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA2NyBTYWx0ZWRfX7MgClTD+7pdu
 AfMhdgQbjWfcYc1K7J9qdX/0MUmt6+C68ibFq/CvfVfBDjEeSVPAgUJYe458E5fKDeI1q2ss0V+
 t7ZKwoCwTB+S92tXL+t67SSuRdilnkZEaL1BdDCMEy9rLWd+D/NYSuu0LZT92GTfJOyPT21hdiX
 6IxsoCXLpX7/w8IsWCya4ZreJj42FZFkJcjVHps0stwA11j7wlmHjQ08lJZ3h2NfPgrJJYhWYYr
 9Ck24Ry3RHSXZzLHedJHNKKIGWUftVO4bgb+KNbjOg+nMO6+FseB+LdbZe0NoeB0TG2tyOUD89Y
 duM1+iBCg501tcc4OgylXtNf1UgzgB2S6O42dslol8X4xuHepX4vkZns1HzPW8VoaJjQi+odcW1
 clSnyHGJ/8rzEsSNNqX8CBgJkNiIJcCcdNFAVOof9d9X61SCLelPK1PEmRRpcwVHcekoj4uxwER
 0Z91PERpYh0NCFHNzHA==
X-Proofpoint-GUID: 57VhXFBQIZ2a9qHC-Uy7XMJYLh7Z08bc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120067

Add and enable the support for the SMMU500 found in the IPQ9650 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9650.dtsi | 42 +++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
index 88bc77009ca0..3e7527609591 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
@@ -364,6 +364,48 @@ frame@f42d000 {
 				status = "disabled";
 			};
 		};
+
+		iommu@15000000 {
+			compatible = "qcom,ipq9650-smmu-500", "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x15000000 0x0 0x40000>;
+
+			interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 646 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 647 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 648 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 649 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 650 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 651 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 658 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 663 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 668 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+		};
 	};
 
 	timer {

-- 
2.34.1


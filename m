Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75033AAF64
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 20:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786306553; cv=none; b=btd9pvDlN2gyZ9JkCWMcYyDUjhG5YQxb/jGLc5Ty2u19pWWmEKSkacPfvnGJ23G9n49C8b4d7DlKqDngXeLbsBdjVmrxvEgN8iJ7LteasXXMSmbqe+a7klAYyA8YdNOqR8eTw4TDwaJw6Er/tTexOtAPbb5lxXLJrHl63QfK5TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786306553; c=relaxed/simple;
	bh=uCse0G4tqb7yw8phAOieTW4riZX8EVQqZbUSnb6rt0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LgS+LdrO31RQ9gGqnB/ESnH2y/baRjab/6oZMowxpLFIdzOPrRofRGMjUbtwQWfSU6hKiTfPzgWFl2F+LzKhyftjo+pi0ocEEz/z8nISc6zKXfMop2ZjNHeHseoJjzF4VhWwufOs8gQ3VWYalql9ZjWDIfjAo18anLOk/HO7NdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MsDTcNBN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xp66vFd3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MsDTcNBN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xp66vFd3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679I9SOZ3975603
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 20:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IzizJPNPjNfA/xYYjcXya67+pr2fJ/V/trczrmnBD7I=; b=MsDTcNBN6T7lOxBB
	BCgqY4hefdTCOGraIJtlKPG/VMQ7Jo9Wl114R0ow5VMx95SnAwqMKVKifPXbX3O2
	3opRGPQD+67ITCZTN1agBaiXIdRowd5MafuHcX/fkZHALM6F4byYMyhbaPd7iBQe
	ckqWyhArELAfJVQdUK/V50zHJcv+ctGx4UwpRgbwDvwTD/H8SlgHdezt3/4UO9ZE
	9eZHQTI0kt4Km70aMTyJysccdL10M2LiIkeIZ8J50RHoKcUprogYC5rnUAndZzO0
	Ez6TpHk9Wacbj+3rXM95mVzk7wR5GaI+XtzaXV2OT32lCo9GWING5HbIh/KkDuwv
	ITT24g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwudqkjc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 20:15:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e934385db1so13964196d6.0
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 13:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306551; x=1786911351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IzizJPNPjNfA/xYYjcXya67+pr2fJ/V/trczrmnBD7I=;
        b=Xp66vFd3p5nGpeAuSXTmQhedVF3Dtb1QJVLoTEOtgPrv5WvJ3aP3e3QRstB3+cKCuF
         EvEIQTsxPhVIgArAbwCrlsLPvQSxfqJCySlxqrjNTih4qqcWzRfoVR6ydIwAbHpXyGrx
         JEZ18lBQ/Ge8ZgOj/7lzvfQNQvmEAKbHm4u4NskjaxCbs6soQct9oN+VsTgjvHQiPHpV
         7oINJbowhbY7KbpXdE2FPbunOATfxVr3lkvLSF2rzTFwvY0tAxtrLmxkJg4UXBE44Q5o
         ocITfjpzm8+iQchui39tHS0FCSxZIPuZc9ZY+PawUDCVsXk25V4LZ2CopOtbAw+wHvIQ
         YvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306551; x=1786911351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IzizJPNPjNfA/xYYjcXya67+pr2fJ/V/trczrmnBD7I=;
        b=VEg+WmgcMIu5vQeWzsPWs26V7b9pyc0jMpKeBTl+nApsk6yPb2ojCMPWbLj8rIL2t4
         LAKR434OMhTdRzsCrJJ2sL3n5XTBSrfckyIAzo2QojKy6JTY1nADiqzZnRm6FEH7yaKp
         /TKpsKoM5u71xQvt+sSobqfSsKYEj1Cwww2SeZCVeYXtJzPuvdryj5rBgVIcfbbm/zEA
         SZrmvEu4X6f91tyhn/YbAgcCK+Ca3d8wyBsl8/T4K77h7RQJZfdaLv5sANIbVKhiC01t
         4AmkcZTOdBPXiVgLEsAZBsATE/jJTMPZ1oO2Tq762KpLEz+rWH/OWqg8nUSvdXx5rQDZ
         zMzQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCCFQBBUEPCOqYroY2U2JwnraBu8Pm47t0DQyBVI7VvCUE+bg2cdRA1XF0e0OYt8cYAMU1UwEpJc1R@vger.kernel.org
X-Gm-Message-State: AOJu0YweLaYnH3PbBpMiuXuexxjShjHd1Xlk8E1e2XOS8gd7dJuEz71q
	QMHfxSvjy0DMQ/sS8Y7KnjbOpcJGYm/6SdmgHsB0Nsxuvfprckz25nxzFWzLIm27ySoOF+icpUB
	0PXDIXj92Zwi8DrkbBnlYPCz/rSqzw0CbkgHKmVRwBpsM3HQ9K41bEGiwpahHpz6G
X-Gm-Gg: AR+sD118p6509KGju3/CnSQ0fKpqbd4ErHnJ8KdzB4ecMEka88Poy6skjYLqdVTuXxT
	jTpb3KE3uONnUW+SoogVf8F/0GMBe3C+qi7Q+SHhSxHpLvstLj/OPikFxrFR1ZaNPoCmJcPWRQY
	Xv5i8/clCWeQ3EB7BDES+fMVZsE/ln5bF63xyLwYCLWOW2XbDgR0cqYJ1f9OFdOtfhHfagLOKaC
	kcZ0uzYBmlqoAcLgOKIxKIk3RB1QEwU6WSEBCyRHxxnL3leN+9yzJSUOhPWLaNeGM1y1pEEjX6a
	AoonvCwGNTgnteuaE2NPkm9QphHDf6TafMdrCw4uNLoSf7sUKeuMxxq2jKF2bvc/f43f8aHnRpE
	jkZIg1NbwO/02GlGjoQyX/eM5zjBYAHTs92Ab+MUnCCzV9QHXPHGuvkJx+jvwy6v6izigfft6vf
	+MbUjVHkrRmezotw==
X-Received: by 2002:a05:622a:4111:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52ce60d5ea6mr468766101cf.26.1786306550775;
        Sun, 09 Aug 2026 13:15:50 -0700 (PDT)
X-Received: by 2002:a05:622a:4111:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52ce60d5ea6mr468765701cf.26.1786306550409;
        Sun, 09 Aug 2026 13:15:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:15:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:41 +0300
Subject: [PATCH 02/12] iommu: arm-smmu: add global register definitions
 used by the QSMMU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-2-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2421;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uCse0G4tqb7yw8phAOieTW4riZX8EVQqZbUSnb6rt0Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeN/uOm5F41+fJk5lrC5TdNjqzxoqf3PLotfHc
 NBoDIXGCTeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjf7gAKCRCLPIo+Aiko
 1U4mB/9BkjLJ40OyMG0IH/Bav2udI9uSTLa2z5CQ/s6byYnQqqpJfmkKGapWsPPmTZOYi4xrwGE
 DH7SOwF7QybdC2czzYlfv9q4aganYXnX0yG7rheDfvDHXP2eIoiyBg1VD7u9g8vrfLZoHRUmOEr
 SzeGge2XA+1dWruNDf2P4NIJ6TRvGw51wd/ye6Pn7hkCfufp6Yz0ZFLDIwZcR4ERlH2n2x+UJJ2
 c/rBjygOzs29eHDg/ObTIX61fGFqAGCtuszCLfW8uy7JOtxjiraSvNL5Q2U+OtwmX9sqO7jSP8T
 wpNDypbpwympWONEQZOkL84Duewl2GrWQFXKPVK8VB1ZArWJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX8V1gRsRPtmMZ
 atIyVQiYjO1qjFkF/v7R8OiKwiOmAcyjcyDCdpEEmz4TQGcUAFfOcECZT4DIcvX6K9D62YPAVQs
 qZJOGlXyn4HgohsB8I32N3eQ1xTYQFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfXwtSouJcmvyVb
 c771wH36D85BT3JI2bNjzp7fAMNksC2cuTySmN5peamrGKuBQcdvNjdBS5IZo6xVNHomaI28Vw/
 UealmzZkz9fm0e8QZqgJGh0ojIMLm/Jb58UxWN5WrdP4rDlOODG7O3IjsDmnfc6fkdQawUL8RT2
 8zyyEKj8AKSMq9uV7AR77ZAcuZYb04+QR13VUl6N5Bkh+lJc953ntWj29JBnkgbtGQe3A6oVwnA
 21H3TsZI64NkDwMx+mZsHE6UmntLH1MiN626C/Sqtl7qvnbyShn59xUsLCXOSLYA3Dav8xOK9RL
 gw1w0PXxl9iqoSGAlzSNB3nHVykgFTZCmYmZ6fnaomn41Z6k48Wt1IJeeL5MiCqEQM/rEeR1uSC
 wxfXIDOQK3z2U9aNP/QYLvNwz63b/DofLyAkqW6Akg/FisZYS0KkYxCtqUbHPgix/gMvswhcFiV
 vtIdBO0Zpq8di/TqqCw==
X-Authority-Analysis: v=2.4 cv=BNCDalQG c=1 sm=1 tr=0 ts=6a78dff7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=M2U4UlAmMl8uHlp6m3MA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: evEICs1GPoH3MkVBD19Ps06vCzxYJ2lY
X-Proofpoint-GUID: evEICs1GPoH3MkVBD19Ps06vCzxYJ2lY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090183

The MSM8974 QSMMU support about to be added to qcom_iommu has to
program the SMMU global register space itself, and several of the
architectural registers and fields it needs are missing from
arm-smmu.h: the secure configuration and fault registers sCR2, sGFAR
and sGFSRRESTORE, the sCR0 SMCFCFG and STALLD fields and the S2CR
NSCFG and MEMATTR fields.

Add them, sorted by their register offset and bit positions.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 26d2e33cd328..49424d8aca6b 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -26,11 +26,13 @@
 /* Configuration registers */
 #define ARM_SMMU_GR0_sCR0		0x0
 #define ARM_SMMU_sCR0_VMID16EN		BIT(31)
+#define ARM_SMMU_sCR0_SMCFCFG		BIT(21)
 #define ARM_SMMU_sCR0_BSU		GENMASK(15, 14)
 #define ARM_SMMU_sCR0_FB		BIT(13)
 #define ARM_SMMU_sCR0_PTM		BIT(12)
 #define ARM_SMMU_sCR0_VMIDPNE		BIT(11)
 #define ARM_SMMU_sCR0_USFCFG		BIT(10)
+#define ARM_SMMU_sCR0_STALLD		BIT(8)
 #define ARM_SMMU_sCR0_GCFGFIE		BIT(5)
 #define ARM_SMMU_sCR0_GCFGFRE		BIT(4)
 #define ARM_SMMU_sCR0_EXIDENABLE	BIT(3)
@@ -38,6 +40,8 @@
 #define ARM_SMMU_sCR0_GFRE		BIT(1)
 #define ARM_SMMU_sCR0_CLIENTPD		BIT(0)
 
+#define ARM_SMMU_GR0_sCR2		0x8
+
 /* Auxiliary Configuration register */
 #define ARM_SMMU_GR0_sACR		0x10
 
@@ -80,9 +84,13 @@
 #define ARM_SMMU_ID7_MAJOR		GENMASK(7, 4)
 #define ARM_SMMU_ID7_MINOR		GENMASK(3, 0)
 
+#define ARM_SMMU_GR0_sGFAR		0x40
+
 #define ARM_SMMU_GR0_sGFSR		0x48
 #define ARM_SMMU_sGFSR_USF		BIT(1)
 
+#define ARM_SMMU_GR0_sGFSRRESTORE	0x4c
+
 #define ARM_SMMU_GR0_sGFSYNR0		0x50
 #define ARM_SMMU_GR0_sGFSYNR1		0x54
 #define ARM_SMMU_GR0_sGFSYNR2		0x58
@@ -110,12 +118,14 @@ enum arm_smmu_s2cr_privcfg {
 	S2CR_PRIVCFG_UNPRIV,
 	S2CR_PRIVCFG_PRIV,
 };
+#define ARM_SMMU_S2CR_NSCFG		GENMASK(19, 18)
 #define ARM_SMMU_S2CR_TYPE		GENMASK(17, 16)
 enum arm_smmu_s2cr_type {
 	S2CR_TYPE_TRANS,
 	S2CR_TYPE_BYPASS,
 	S2CR_TYPE_FAULT,
 };
+#define ARM_SMMU_S2CR_MEMATTR		GENMASK(15, 12)
 #define ARM_SMMU_S2CR_EXIDVALID		BIT(10)
 #define ARM_SMMU_S2CR_CBNDX		GENMASK(7, 0)
 

-- 
2.47.3


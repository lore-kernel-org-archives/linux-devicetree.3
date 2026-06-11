Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6102C3603EF
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153955; cv=none; b=cU+sT9HMSRhW1g85A1QIxpup3EHUPhaQFWJBP6HcGHBNvQoNmeN4ZOIV0bsJ0Q3TzmNR5TUZxiF5jY7j+yf8qQpUK2a9/peBKOQd84GqO4lI2KKdBrzAQbM69Us5tanIN5Ysuul3AB/VfkzMVmRPwZ4KHkxxkylN6sFiEImfwEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153955; c=relaxed/simple;
	bh=+8pvm0uFERW5lUAcvZeBTj7KKJ4hI33filK3T4PAcEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KOT4vlVgNirpr8yEacEAHL8+RzT18d1jxeVsWsGrHMnW7wmFz4J/pFlUlH/+QhIgASAqDoIxKVZAmlsiF2mPYSIC1zri1jcvnMWs8NBOe8MmxM07/pHmfU8TckI9iIH3pTRK9itPbYKrmg4KRkhSbCb6jvE5744dibWD/4Rmv0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Piei8wFX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tb41cWhf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Piei8wFX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tb41cWhf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NT7w3159483
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m4xEgo8KFQzUOZK/g2YyAF9vBNnCJ8+gelSNfCLkmzQ=; b=Piei8wFX6wStO0Ig
	dqP9UIK8eTy94NoK3V98DpLsnJ8d5M4p2+1Tl25kT/UvB7oq+15Y9lYdTyTSQNUF
	FhXXCKk/bvmJwxuvxPtcGo3K0HzkcTrhBsaSSUQNdFddeT8u6/iO4WMFoFGdHsMc
	z1/YWs/ttDghbyc6EqsvSCCi8LrZsseYnCrCb3bY45xMWfVp97imJ7u+l4SxznxS
	HDDn2WVYi4lp4p8WSEas1PUQEN6Lir2UtHu1w727H3Jc9pqoB7xXKmfmdNWr5tRu
	Dq+A25N9JQn4xqcyxcSc5ybuzlp7iT/gH9jk8frCA+nrMdC6xrXPhsldXyInWvXW
	Sgye4A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe701p3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:59:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c2c98c1be2so10321135ad.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153942; x=1781758742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4xEgo8KFQzUOZK/g2YyAF9vBNnCJ8+gelSNfCLkmzQ=;
        b=Tb41cWhfbVgovccrZfpWGY1AMC13Ifi56SOt2wCiNFR29yKXi9Tx1eQOtNehj09Wk8
         +rMkKvo8bBA+0Y54BRNBSjM61PzawLhRAr+cXaguN/kcEluYaQP77SsTTMLtAXYanNRU
         XRE2i8aEk1ElBjfo4MwFLJqfyQV1EFuec/FLrAIqDAIX+XGcdOtdOi5xAL/LoYfx/x9n
         waeQfyvrZoyoTkCczwF87cCFN9RZxkaYfF2ER4+XvR9vQwNH4PBdgZx062Zc+b5D0HXl
         gtw9MwI0l6vfOQZ6kLEg37AHPLrnK5ZMPLb0cUebNXX7DPuU8EQ7BQseebpY9U75CTrr
         uObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153942; x=1781758742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m4xEgo8KFQzUOZK/g2YyAF9vBNnCJ8+gelSNfCLkmzQ=;
        b=DzDWvblDnSMmhvkXAUk8lnjTtXjZLtunITC6u0W//Uf5N2AFy8TAzPsaWLqQpQu6pX
         2Z8q6XkIoTjUKRI4K7QWDE5OzK6mvhj8cRSjYnrEj75VTA7er9StmfBvjXfd8KhETgH6
         cJSuNlg8Zc3sutaFCU972oK0JclB3iMt0CM+bJKfiYA1WJIpACyABcJdhjE0XNOSLHgL
         Tlu4rGzNpGU4yFp0Ycg+FOXhrTOYvDplFibhrJrhVXfsrZ4r8PK72+Wz5uugCfgj7/Q+
         TCKWbIZCNKcEms0qxJsbR6Cg5aPJMd5i+PRPxxypkcqAevLJxspghAka1dMZ6Y1S6So7
         hk8Q==
X-Forwarded-Encrypted: i=1; AFNElJ8jzF6z4c+NaqCZYaxOViBbR+xgzp6/woo4gKCRvyyLdAV5kDZhb5M/O1MGSQVrkqj61hYZO77k07SO@vger.kernel.org
X-Gm-Message-State: AOJu0YwahpvEd1BUhfSL6iKKbBSs4zxg+pzAXnZJEWV77al5pCHKG/0m
	SB8LNaJ7rAZS0Ir3bz8vDBOTeJDwHkXJjNM0wz357WMLOoFO+EZG/a1GB7G69yA8Z1oa15Ey3aZ
	ltqPP700gbVlicoDk19v6iW0pCgYZ0vpg8wWq2LxXJ8kXRZkCyu0GmM4pw3sDH0K8
X-Gm-Gg: Acq92OEfykPjPgXcUn8uhCM1fZ2ckFvtMLZ9b0z6c/EPpPQBPWQhGH6+ZxQuxwu5glg
	pce3aEx21aGT3dBdiKYKtPAvSKRNwcPVwKySqqqWgrDkZcb0jx9PnR09OXdPrhci+53EQwY0UTj
	iOw37zicVhmEn810HDCmW1TU47a/78g6wM2ovAeCTobKqQtLLysLLhxUptqTSnSy9Qq1JegaUHd
	IKZYy4tM7iwx7XQZi56YuUOHo9WGx302pRhnDSnE+bIga0LKyClz3yYjjB9RMel2FMSwtZkLXqq
	aQ/T4SOQJdNb98tkfxdM3WwulR9ry1zpohV65RDJaNBUmyhTastOmYw/nCuCtwuBIDVQ5n/3XMC
	WIOYSY4weM9icvpbg5atrU/pqBUp6/qYx1sWpsPwbS90OT765RPuM9OxoBHLvksrxg44=
X-Received: by 2002:a17:903:2449:b0:2c2:50c7:58a4 with SMTP id d9443c01a7336-2c2f21a17e8mr13890495ad.22.1781153941818;
        Wed, 10 Jun 2026 21:59:01 -0700 (PDT)
X-Received: by 2002:a17:903:2449:b0:2c2:50c7:58a4 with SMTP id d9443c01a7336-2c2f21a17e8mr13890185ad.22.1781153941369;
        Wed, 10 Jun 2026 21:59:01 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:01 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:38 +0530
Subject: [PATCH v2 02/37] arm64: dts: qcom: msm8996: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-2-2744251b1181@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=1618;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=+8pvm0uFERW5lUAcvZeBTj7KKJ4hI33filK3T4PAcEk=;
 b=iI5CG7yXlGNMkrNHsE/Pix4KSaZG12sL2brN7x7z3n6VUgTrdpQL6BDticA3xYv35QxHRnqkO
 cJwe5i2BQfcDgBgVmx3NdQNagMpahZny/VdJpbpDTHMaeelTT7PE1GC
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX9JATbJus3E1P
 iMTKhlK5Uar3XgODJLpdee9ln7jPpyHA5oqDnm3Uq57t7i6ADwLWAhMaDR5FKLhhDzcZibCB0yt
 CrUry9zqIBAvfyIsgh5nPJbZH+Gwiqa8Fx0f6/rES+pUrQD8llBzQShsFTe6FfuGDUa+tj0Vyzy
 +qC0iCgaZSH4NcjATpd1avCqNOp8eYPU4Xn1Pw4yukMSWVQhg6JFHz/ZOqm9ZrnFmLbcbxAWcAk
 22qSxlMDWorFBAKxbNORTy2fukfYQkvKfeML7/oH/ui45Ia3YR4DYNk6qYlLH/xxwO1e5z4p2Aa
 xdjfiPUaId4fZZALptbBG40d0seK2wbRmGJVm/XtbIC00XuLg7E+Fuj4tn3qpUINv4nipHckIrr
 Pi4xqnWb9jQ7vFYxM88rXMITDCAhc4XO2HUXY2pFVPdzsw536oJmd7NgeXv5iiLCbRDeXBbtff0
 jjcgDxnWCdi4sxG5TbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXw/Z8P/waTxxW
 7nsHWrcb1yaAQM+pmAh9fthpoWT+hkd/RtjwhM8nDLu0Z9mqttdIS0IqUlQtZbMU3LDOrlwnjNV
 qIFpdcbc7zsso38zYVtJjgHsbLOZCKg=
X-Proofpoint-GUID: W5PuIz7T2mKc5OzjoGvMYrKgvhBsu1Q0
X-Proofpoint-ORIG-GUID: W5PuIz7T2mKc5OzjoGvMYrKgvhBsu1Q0
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2a4096 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
index d55e4075040f..5b42c266557a 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
@@ -192,7 +192,7 @@ &mmcc {
 
 &pcie0 {
 	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 	vddpe-3v3-supply = <&wlan_en>;
 	vdda-supply = <&pm8994_l28>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 77ad613590a3..2abcc733dad8 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -280,7 +280,7 @@ &pcie0 {
 	vdda-supply = <&vreg_l28a_0p925>;
 
 	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 };
 
 &pcie_phy {

-- 
2.34.1


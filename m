Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E3540B6FC
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784018049; cv=none; b=ZWmtElk5oVY7Ar9m5VK2zCxTl8FSCOzQSLK3dZtsCPmwbgnPiYwZRhtAUQ+H54r8Fzbr70q+OjiOw0xXn8BIDm05JEucz1uj6qNETNjPkyhRM7CtvwDakCSn8bvvqkqfrpKKq8D7ehNLSz94BK61ercbcHav9ilvMnf5ALNhIw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784018049; c=relaxed/simple;
	bh=4lUQOp/C8VfYJI1VFTES06lSH9aTmcjMZ92LU10souk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ot3ZRCQ+JF/b3Cmyl3p04HOZZbcbE0sBx65y4ghDolEP9Bx7UBCoMKoaeSFiylarvkSyP8rYPRWvAz7mMaDKhVO4jh4FQnNkJBfXJ+qzUUORRbLBXyq4aUnK93kHZr5YN9kD4RlzdVVZivkH4s0XZxqbDuDmV/tSBU6DHwG/iBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SHaJuTxi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MT0XItpT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SHaJuTxi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MT0XItpT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E7YGr04101708
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MAMVX1VRgFBdr0Gg8HpIio
	jVzkU07wjkxK2t5s3lHKs=; b=SHaJuTxialvW+OE6OUUYxm1AhUMN5IgK634AU7
	bPTSgKmcQCQsHptNFUPGtfjiqA5E5JRW8e5IsM8tA98XGr9DaNUqTe361kJ0ysoE
	eGx/RLWqkBcK5PrhQAnQOrrr4XjAeJXjk/Njd0bfBbf/HqkcxxnxweFbXfMxncnm
	L6Vya9QwlybHa6aityGmT5zS4PeCHatmDLcNQrFI9tn1pB6Pao1734Y973hVgDEd
	BaXBricGkoOO0GnKNFXG72EtMvgE5c2ZB0u3bdbhq0X5dQbRGgqfy4Gh1OJKN9R8
	oyi2NnRkCeAwlnDqeir+TVvUtT9K85Ste/pHB/CvJEjNUWKA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgudg7d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 08:33:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381ed6616f7so6639471a91.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 01:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784018037; x=1784622837; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MAMVX1VRgFBdr0Gg8HpIiojVzkU07wjkxK2t5s3lHKs=;
        b=MT0XItpTjUUBHyB9BfJidMrN0zucKlI7CDxYtq6YEyMqmOdzfSVjO3Mkrmjhoh1th1
         KM6PXOLjwGlZaDNd9fj5elKXkmFNgQDs2MVEGStVyeppKbSwZCYQ0SmLkM3D1JOkTbQ6
         nITel07MUd36Uvk1JWVEaBPexvQUjoW8uGns5xMcvHrOPsixlwTvjDE8tajSgSWYmFCg
         r5KLFMWE6z5HVJUBlK+5Xb+pigbf/3DHZnkeXlx1xuxOL1c5Wor0/D2vtZcsch4JrkA4
         xNWwE5o97s6wLee2z8jfmv5FfDAzS9T3zwHRthPRQixutcid5lf0kWqkSSiLyrIBUeUk
         EmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784018037; x=1784622837;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MAMVX1VRgFBdr0Gg8HpIiojVzkU07wjkxK2t5s3lHKs=;
        b=QfzxtvPk4fRgGETcSRRQfK5ARwrviwGqZ8Ti4dpUBtKJ7iihJYytsbPQ3SVHv6w4k/
         nM3GhSwrRQm8ynq88n5quXTQNV6t7+8Imcf37sD3/FcKOzlWWPNcIJFA3YZP8hCrTT+E
         NLodV0mNVNRh/wf4YR2z0V4kwhnmhMxvCYagwFBcoEyuLSRJS6Ob3GUZVPjr6OgtCxI/
         balLA1SpbeC30FwMBsBZoetxGEhjsVwoKouvvr+TwILwb95QOeAAmYgGo+Fxjw0Og52t
         U7zAngE7Ubp5fQTzBRwjNYU/fc4X4qOhJmOdNOAhCzhyeYrKUBg1KOk39iqKxBJXtvdi
         J7Ew==
X-Forwarded-Encrypted: i=1; AHgh+Rpqklko79/u+huellEnuXiPuAkLgyoEWKR7tEmWyQrzVOhhcDqDqeSKWSsAk2wheVD82JBMtyc2hvqk@vger.kernel.org
X-Gm-Message-State: AOJu0YzoIuKunh7WShG/zRpUJrrlDUhtkmtECmv31obZ/rAHmFnAMjgr
	7zTJIPKhD/QynunsGMh+MqY66iTRDUR9ZmpZe5nmmnrwDSyVw4LcUoApwL4d3L4y3JMYl7LDRr9
	Zqz2Sipcy/zNCBdDFq9n8tRD6TFrDFz3Tu0+TdRNHqrMou9FXl3qVZ9IihrAo7XUM
X-Gm-Gg: AfdE7cl2zpubsaJIPUt4gCNWxZ/sBMYob9ouJFfiOgIYp6oXwPCEn7RYYOMhf3JeGOL
	RzTNO1pHOtlQljmlb+Li8POirJ3W7K6ObI9aMhFegY0v+GOipeyJQb6IJGDtBzSFN90gBRF4QSH
	hc1jclT7xgIUXflachutby0xBLdzceU4/yroJZGqpUqWanL6PCXg6SyasRLv2LnU44ugIRtdiIy
	36xwp4EO+Ll9d6+IZw5QM3V8aoD+gTP8FEkd0N+0lbQiDtb4XVL/qCV/PS2F6nfWf+6WZCUdIGz
	t+FsSPJWVRGAPPxm6O4XWNaBy+9S95lwo2SKYlkauVZy21BreIYYLBYFSgrMlU6olYVG6E13Q1n
	/hWT3/1G2sG0wTkbfiG3HMg9I5kiWXZdROLUMIKSJfHaIU2s=
X-Received: by 2002:a17:90b:2242:b0:381:85c0:1d9d with SMTP id 98e67ed59e1d1-38dc777b8b5mr11810052a91.27.1784018037438;
        Tue, 14 Jul 2026 01:33:57 -0700 (PDT)
X-Received: by 2002:a17:90b:2242:b0:381:85c0:1d9d with SMTP id 98e67ed59e1d1-38dc777b8b5mr11810026a91.27.1784018036967;
        Tue, 14 Jul 2026 01:33:56 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172b6d37sm1103860a91.2.2026.07.14.01.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 01:33:56 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 14:01:53 +0530
Subject: [PATCH] arm64: dts: qcom: shikra: Add qcom,vmid to BAM-DMA node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-b4-qcom-shikra-dts-bam-dmux-vmid-ext-v1-1-5b19da8d7735@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPnzVWoC/42Q3WrDMAxGXyX4egL/xHacVxm9sGx5NcPtGqchU
 Pru85JCe7HBLj+hoyPpxipNmSobuxubaMk1n08tiLeOhaM/fRDk2DKTXBpuRQ/YwyWcC9Rj/pw
 8xLkC+gKxXFdYSo5A6wwC+2SdIq50YG3U10Qpr5vm/bDniS7XZpv34lM2dptKS/1UQBHABxkpq
 EGSTeNi2OuCD8Zw9fduNsWAaBIaI8dF/sb/nLfxO+Sf9wxeYVRBB85pXMQ/4NdvRCcHF1EJHsS
 DRl8JWnfJ89gp5NKF9itUPWIwTvVcx5isdomTQyd5kDYJdrjfvwHcYXRKsQEAAA==
X-Change-ID: 20260714-b4-qcom-shikra-dts-bam-dmux-vmid-ext-1b4f793e035c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784018033; l=6358;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=4lUQOp/C8VfYJI1VFTES06lSH9aTmcjMZ92LU10souk=;
 b=mOsBfhXmD2ghXGu2bq+CogWb9GMb+1h1js+PPHNEI0np6TyRjnS0v7inNuNmA9R3OExHO7mCZ
 msLoSHgnAMBBEGXJzTFnTeVMCdWjzqJEuf7xB3XbFMRN8bRNjV5TqE4
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-GUID: mavaEMz_tKWehtFVO-Vqtuk1Vl-6rVJX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA4OSBTYWx0ZWRfX8J9Imq53Hs8R
 GTDE8Fxwq7xye9ivdISEXYLs14Mbj1Wo1CWJXiMWp+SfceV4B95KwUlUOlVL866nl0aElyI/ORv
 xdpZ79M3ZTuBYFwxIUAhAuGOK73dWX9tQhCs01wG4DngSUXJHp6xB0l463184uIHlKjpk402Huz
 +mQqT8ub4lBwPxCe79EoKZd04NbVL1qfUljSp33W03FExbPXWMlPiNhbvflVoDlPFYpQa9SkwST
 /PR4/624+UCmnviSjuk4c84FI+7SDzxiZyGpOyN4JCUGlvduaG5sA74OouDFTQjpfIkI76VReoD
 Rg/Y7hFTeAE4K5BpUiIutvH6NHQJJUNSmknm3zcqVyyVshYVo7nxA0pBHBtIpog/8EMwilWKwhe
 TYb30AnY2xbC/BE+jL7pVU4bedIAKe62feJn8FvRWH618QQgbkmfDi04SIuZztOQWA3HaJTZiYj
 lVNzE8k6gVQl38B/fvw==
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a55f476 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TZ5DBgi2yJckd7957WIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA4OSBTYWx0ZWRfXyCwtqddlL34W
 crY3UhL1UaqogtnOo6a4QydTq0bUOV8/Y6ZdVjMZpxffPsUgEfroLWUSGCpa9sdJCfUSjPmOMC3
 gELgbqp8aQsOIG58x5Twm8GtxCXrQns=
X-Proofpoint-ORIG-GUID: mavaEMz_tKWehtFVO-Vqtuk1Vl-6rVJX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140089

On the Qualcomm Shikra SoC the mDSP (VMID 43 / QCOM_SCM_VMID_NAV) is
the AXI master for BAM descriptor FIFO accesses. The XPU enforces
per-region access control; without an SCM assignment granting NAV
access, the first DMA transfer triggers an XPU violation.

Add qcom,vmid = <QCOM_SCM_VMID_NAV> to the bam_dmux_dma controller
node so bam_dma SCM-assigns each channel descriptor FIFO at
allocation. BAM-DMUX itself is a singleton and no longer needs a DT
property for its destination VMID: the driver now selects
QCOM_SCM_VMID_NAV internally via the qcom,shikra-bam-dmux compatible's
match data.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
This depends on three separate series:

- "arm64: dts: qcom: shikra: Add BAM-DMUX support" [1], which adds
  the bam_dmux and bam_dmux_dma nodes this series modifies.
- "arm64: dts: qcom: Extend Shikra device tree with CDSP, LPAICP,
  MPSS remoteproc PAS and peripherals" [2], which is still under
  review and adds the "remoteproc_mpss" node that [1] attaches
  bam_dmux to.
- "dt-bindings: dma: qcom,bam-dma: Add optional qcom,vmid property" [3]
  and "dt-bindings: net: qcom,bam-dmux: Add qcom,shikra-bam-dmux
  compatible" [4], which introduce the qcom,shikra-bam-dma and
  qcom,shikra-bam-dmux compatibles this series relies on for the
  qcom,vmid property to validate under dt-schema.

[1] https://lore.kernel.org/all/20260711-qcom-shikra-dts-bam-dmux-v2-1-d5b33ee32138@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com/
[3] https://lore.kernel.org/all/20260714-qcom-bam-dma-vmid-ext-v1-0-cef87c57b7dc@oss.qualcomm.com/
[4] https://lore.kernel.org/all/20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 246ea74d1fb1e293f0428d342301886dc52cb179..cb824da1757921edf0befe5480bf489ee1d8c727 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -1888,7 +1889,7 @@ glink-edge {
 			};
 
 			bam_dmux: bam-dmux {
-				compatible = "qcom,bam-dmux";
+				compatible = "qcom,shikra-bam-dmux", "qcom,bam-dmux";
 
 				interrupts-extended = <&modem_smsm 1 IRQ_TYPE_EDGE_BOTH>,
 						      <&modem_smsm 11 IRQ_TYPE_EDGE_BOTH>;
@@ -2030,7 +2031,7 @@ glink-edge {
 		};
 
 		bam_dmux_dma: dma-controller@6044000 {
-			compatible = "qcom,bam-v1.7.0";
+			compatible = "qcom,shikra-bam-dma", "qcom,bam-v1.7.0";
 			reg = <0x0 0x06044000 0x0 0x19000>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING 0>;
 			#dma-cells = <1>;
@@ -2039,6 +2040,7 @@ bam_dmux_dma: dma-controller@6044000 {
 			num-channels = <6>;
 			qcom,num-ees = <1>;
 			qcom,powered-remotely;
+			qcom,vmid = <QCOM_SCM_VMID_NAV>;
 		};
 
 		sram@c11e000 {

---
base-commit: 3b029c035b34bbc693405ddf759f0e9b920c27f1
change-id: 20260714-b4-qcom-shikra-dts-bam-dmux-vmid-ext-1b4f793e035c
prerequisite-change-id: 20260525-shikra-dt-m1-082dec382e7f:v6
prerequisite-patch-id: 48ecd66c06c4fad81f91283c26ec57d95bbde29d
prerequisite-patch-id: 7d92e5a301d09616840e54dc9e4a81f30a64383c
prerequisite-patch-id: be1a16f53e23dd5ab90210a056c9da3559c6186d
prerequisite-patch-id: 3eff04500c55100c763aeac1f1f8c5768d500500
prerequisite-patch-id: ab22c5fdb2fa65b78ffef76bbe4459c8d5ffe7b2
prerequisite-patch-id: cb24efedb648271ef5c60ace96e2366d89254e8f
prerequisite-patch-id: 8be7df0395c5847a988c7e814c7db878b5932b11
prerequisite-patch-id: 0510992d022cef7317b6efee6765ac78c0225356
prerequisite-patch-id: de4327fcbe81f92a337f429b74e8220969a5b79f
prerequisite-patch-id: e13435365cba0b6ecfcea6d9e5ab72838fba23a7
prerequisite-patch-id: 90f78668eb969c16ed8c2485d75a60a183fc4b8e
prerequisite-change-id: 20260603-qcom-shikra-dts-bam-dmux-7fdcbb6fb662:v2
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
prerequisite-patch-id: b5d7f75df02fde56181f576a936baf09d0a72276
prerequisite-patch-id: 3ce52e07ae57139c2e2b71a29ed7d7250f6fcc87
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: ac83151a889855498d36288ddd36216d451340c8
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
prerequisite-patch-id: 48ecd66c06c4fad81f91283c26ec57d95bbde29d
prerequisite-patch-id: 7d92e5a301d09616840e54dc9e4a81f30a64383c
prerequisite-patch-id: be1a16f53e23dd5ab90210a056c9da3559c6186d
prerequisite-patch-id: 3eff04500c55100c763aeac1f1f8c5768d500500
prerequisite-patch-id: ab22c5fdb2fa65b78ffef76bbe4459c8d5ffe7b2
prerequisite-patch-id: cb24efedb648271ef5c60ace96e2366d89254e8f
prerequisite-patch-id: 8be7df0395c5847a988c7e814c7db878b5932b11
prerequisite-patch-id: 0510992d022cef7317b6efee6765ac78c0225356
prerequisite-patch-id: de4327fcbe81f92a337f429b74e8220969a5b79f
prerequisite-patch-id: 968bffc36646412f8289b917f37e762a4297bcc8
prerequisite-patch-id: 35944403bd4480caad12657342da15ea71c6afbd
prerequisite-patch-id: 65b485474126f4a2ab3f69a0b8e146b3b04c2c1a
prerequisite-change-id: 20260714-qcom-bam-dma-vmid-ext-8a3bd3c5c00e:v1
prerequisite-patch-id: b61d337d6c8fc4b20bff5a057b3f3335d89c57c3
prerequisite-patch-id: 91d3d344ec3e35ef7a3cec0a2ef90fefaf10a039
prerequisite-change-id: 20260714-qcom-bam-dmux-vmid-ext-d9289db310c1:v1
prerequisite-patch-id: 9e23abde2db60a3ad3a00d060bfb91f68c0aa798
prerequisite-patch-id: 4fa3350725e5b9d442247756d2b51d03f99b86bc

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>


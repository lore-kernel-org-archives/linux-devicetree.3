Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538676;
	b=ITKCyEslQwfJRuFOD6C+4Id2YG2mMxf2zzrjZaSdpNzlthRZ0ird7iQ843WvRHL0dI3z
	 GCH+Bov8OzOkxPtO1M2zm/KIOWJFApNmMQ5ZI5pU2lXPnFvhFVVP0WMfbQSFez1qpG1lc
	 pamkfg4zzN3mxki/dxBSIZzYLicJ0u3C229QUyNpmUKnFfh00op1b+er0tGgd6m/L7Pwj
	 1pmY9ljv22q7L3ddyYzst/8b5aDjitjwVnUhiRhR/OI9/KYHlcXR0BxKhqY4YMfSssjBg
	 vy+AmKKlD/hhkCtSVqVOX9JJsV7lxX2ElDYdyMQSSC8x9G28smw43k8UtuGIY1g6noA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538676;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
	b=CyanuSenNswlUYFvjc9zM/4ueeRT0vUJZ+24CginzQi0SkjhmII1ySfz1tEjNovFizbI
	 BUY5iHSOsOe5U4iGs/LLdl6jcVIKglWMxOupkLoYSjMDoKzglRkuUHHi+D/3VyuKhazy4
	 nEKvxEnPyHmVcWyEf0x3D6PbUiPQeH+cpsd5PdkyyrIF1+UJtLeVcD28QOSGwCUHzCXYS
	 AHPOiyUunSTBv6rN77gSupVwAIeDVwufL8l+7/57U/n16LqanYM0VwWHxO9x0Ia/SKxVf
	 XqDxTv/Wom0xso4ThaWRVjj02zTzxZaW+AjY7eoRNaudAxH8Sr8inCTqEbrrIbG8ZxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mNsXZNol;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R1q37ZxG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225B5606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 225B5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mNsXZNol;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R1q37ZxG
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL2uP1183808
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=; b=mNsXZNol8vfyPhsw
	zeG5WqVZWU8/sAWBWY1u8YuTVKLvRYKLbjpx39IdL9MS47/6189Zrzql4j03lnXh
	a9skXeD9KxOwpG7w+91RJ++4l2PcjKX5W+1bFacaR0qZDY0kxz9mvvUyzFuKq4xl
	fcI+vO6Ds9H4QU9JaxdQeVT7PvjjPQuFIn5i7e2xDYMEKUOWGpcqR9Agn+/JXDNc
	yZxTe88XEg/42K9aeb+OHvypqYaHcb7kiPGVykzdmsTPz6VNWkLl7AOrKi2MfQmn
	scmT4O6y+tVSZfFMUJVWYmjCBhzzWnDcZeGCjADJR7oR4/gHmjNWBLyXn4T4469I
	6Kd5qg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky3r0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:44:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3846d5f54c1so5867853eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538673; x=1796143473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=R1q37ZxGRQMGdD7+DQXXTZW1QyuOGRzmz0K7+R4WJxfp4bE+1kPlxj3Pxoggs/FRTx
         3lcuGuqKL3Af/M/9J/jKE/keet01KXMAv4WlP3VI/4P9ADQjvEh/NhowuxvVm+GZ9exR
         D9jwx6PaNw7B7r4Evq0AMoqFrtAGxyng0zV03tzZrIhxXimZ7Ir8kipZQ+NuUH1DdJt/
         QnS4Rx1wTRywusg0r0xzsmrB8+3dZRwV0wOW8MVOl2rak0+y9EJn3OjUDSt8fZoVUpoc
         Tiw5CCsKhpG9cA3DM2KK/Ezti85GyhjMf/fMHcd7M5Nq2ewo0HCZsmj6Bk/IgZYul+bp
         dGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538673; x=1796143473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtsOhWyw5CRRkR32qeWmHN6scDZx5jLnIsMFJMPnOhs=;
        b=1PfyYhBhMHGy64/RXLgteV7wmifKdxdtk6D0vpfsdgDXqCl1UYPk7cjCpxiJC99jt7
         PIUjYyhHz0eAkqSxF8wr8t43qTRg4I/FuNrzMvNcFlCEyGlpei5t1A7JhAlCtR5aegVe
         apI9uWy26ch58A0NbkM6Jw92afzVXlJXl/lcf8BUbaWS4BbRrzxoWkrDe9fL5iOOslAu
         g12jy1hxfJGWjLClk6O5hujOyAR9J2tZrEUxn8sa+vCy//Thz690i7DOZt1sP5oY0Wbv
         0Yns/rGfv0krF81VJE/Rf+svL2EM+47XdgVvX7K1rC8hFd2eGCm+xsEuMbn10COxUHsm
         IEnw==
X-Forwarded-Encrypted: i=1; AL+hErGgdOzAiA6jQSljrICR+7xT8cxKaTLIcRuH2Un4YkSwMZq9lYyNgxCkJZB5UluQZ7IE5cRRvrkxkIR6@vger.kernel.org
X-Gm-Message-State: APuU4Z+qlFazV1skFJoQnLYk2Sf3SwAyRF+lWli4joUAEH8WyMmaG3z3
	yzXJytCwvSwCI+fMp1E5lJuTCduTsrWHzhJ7/JTBSr8cULIQdSl0ELRGlVeR7HLVRczwDFR2kyS
	ngnAB3nP+M0eZU/XYma0oXG0Tv/p/tLZ73CNzqCPdqv9tFVITMk0WUq9eabdnSwA6
X-Gm-Gg: AZFdTZckWqpF/QeIKU1OMOGJ33m/cteMxNU6H+oHXRlRsxvcp1VmxD0h6wBl40QtG0R
	XPkc8xe5ZjNEPBDlfAHX1STOxy/+kvDrMKg3wYTX0G8RIldJmEvjXletn8Y0k/n6xy6DV1STYQA
	hin5/qKMBYvEP/kGkRhc/b483mnMB0zEDooxyAGngw++pU4RtAITabeXcu43G+HKuV2ATjjtQgH
	M3bqqZKgVaqFmr+yjHcBfGFXWrhRoQIT94ceRnho76l5uyr8tfY9NjWlUFiFbEq1CfbeKfkwDVf
	Yn8uI/EVW4KkU4Dfm9ciIIQBpsQKD7qCNkUgsn3RNBY1RS6AEgH3ftVI+7ni1F3OpUCMJogQSfi
	tCM+Ou8R9G/9sKBw81hvkJOBxC5BWRxbueX9C6UwJiOC8aH2CL5PCdCifuynZZx6PGjINW8fgkO
	jzIH0cqLsz4C6mxGHg/g+Ev0SIX7kqB4LwBguxcZxjYX8jnoomL/QP5t8D/1gAkrS9wXHLBo/fV
	RM=
X-Received: by 2002:a05:693c:69d4:b0:386:5adb:ac25 with SMTP id 5a478bee46e88-3865adbb1d2mr12013365eec.22.1795538673024;
        Tue, 24 Nov 2026 08:44:33 -0800 (PST)
X-Received: by 2002:a05:693c:69d4:b0:386:5adb:ac25 with SMTP id 5a478bee46e88-3865adbb1d2mr12013337eec.22.1795538672382;
        Tue, 24 Nov 2026 08:44:32 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm49093900eec.22.2026.11.24.08.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:44:32 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 22:13:37 +0530
Subject: [PATCH ath-next v4 11/14] wifi: ath12k: add Wi-Fi 8 WMI init for
 QCN9575
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-wifi8_qcn9575_bringup-v4-11-1f5b87ece6a3@oss.qualcomm.com>
References: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
In-Reply-To: <20261124-wifi8_qcn9575_bringup-v4-0-1f5b87ece6a3@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b05bef1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Fa-mINMYIZ2DnWK0-L0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: AWSXQHjKrELW1VB61A3O4bTGyLadMvLm
X-Proofpoint-ORIG-GUID: AWSXQHjKrELW1VB61A3O4bTGyLadMvLm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX8GwVwMQvEMCE
 hCUU9j3hyzvEWt90Hjl/3xDfXQgNhI8C0Insnjj3gyDQdg8Ov00knUM80rqIr+L46uYaeAaJQxB
 7Oo2JkDEn9oyq+vpm1jYfDk0vpS3CuY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX8oN2l/iH6vNm
 CFybqg9UgB/zOMQC06YRc6NYcbu6HLTnQpcl85ysGDimV4nyoDmOe7sth1uDsswkRaTSPDg/oND
 H5nxFXPUouEgXDB/XWHSzOC29nfhF4VeiJugb4JP78Mfc2ekfffZFfGraxcjtjatZnja9b9+cbJ
 bXyyuWHyDJbI0Q7avqeUv1JwOFQ6zynT7SJyR6wsofjENbhcBStY2fAEGyc/LHj81TGoUXi5Ylu
 lWgyXPqzwgSodhhyBwhWSMQ1iqc2uzQhb7WURYSYWMk7fiRKdCmqpRuhPtgYdiI+tKZMkOMdasK
 lWd/H3TTA3vku1S88LhE49k94i97HkJo3wZKytWQtGKXtufOfyV8CC4LBuD1omq6baqnkTBTpMo
 6I1Frf6csK5GBoMdIUdWwd5Ke3fdueKzOxdD06nfax2glREYUQ9XC61Hs/flgdvY2SkDXtBFTx2
 hnPoFKjlhmwfL3CRFkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

Implement the WMI resource configuration for QCN9575.

Add ath12k_wifi8_wmi_init_qcn9575() in wifi8/wmi.c to populate the WMI
resource configuration struct used during firmware initialization, setting
vdev and peer counts, RF TX/RX chain masks, scan and power-save limits, EMA
and TWT parameters, and peer metadata version. Set the QCN9575 hw params
wmi_init pointer to ath12k_wifi8_wmi_init_qcn9575 and build wifi8/wmi.c
from wifi8/Makefile.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h           |  2 +
 drivers/net/wireless/ath/ath12k/wifi8/Makefile |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/hw.c     |  3 +-
 drivers/net/wireless/ath/ath12k/wifi8/wmi.c    | 57 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/wmi.h    | 13 ++++++
 5 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 96776c6e2050..b8045b33ca0d 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -77,6 +77,8 @@
 #define TARGET_DMA_BURST_SIZE		1
 #define TARGET_RX_BATCHMODE		1
 #define TARGET_EMA_MAX_PROFILE_PERIOD	8
+/* host supports peer map v3 and unmap v2 */
+#define TARGET_PEER_MAP_UNMAP_VERSION	0x32
 
 #define ATH12K_HW_DEFAULT_QUEUE		0
 #define ATH12K_HW_MAX_QUEUES		4
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/Makefile b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
index 3717b00741fd..989e640c7b41 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/Makefile
+++ b/drivers/net/wireless/ath/ath12k/wifi8/Makefile
@@ -6,4 +6,5 @@ ath12k_wifi8-y += ce.o \
 		  hal_qcn9575.o \
 		  hw.o \
 		  mhi.o \
-		  pci.o
+		  pci.o \
+		  wmi.o
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index fa64b865b931..74873fc5f3f3 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -16,6 +16,7 @@
 #include "hal.h"
 #include "hw.h"
 #include "mhi.h"
+#include "wmi.h"
 
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
@@ -70,7 +71,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 
 		.mhi_config = &ath12k_wifi8_mhi_config_qcn9575,
 
-		.wmi_init = NULL,
+		.wmi_init = ath12k_wifi8_wmi_init_qcn9575,
 
 		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/wmi.c b/drivers/net/wireless/ath/ath12k/wifi8/wmi.c
new file mode 100644
index 000000000000..c575cae2582d
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/wmi.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "../core.h"
+#include "wmi.h"
+
+void ath12k_wifi8_wmi_init_qcn9575(struct ath12k_base *ab,
+				   struct ath12k_wmi_resource_config_arg *config)
+{
+	config->num_vdevs = ab->num_radios * TARGET_NUM_VDEVS(ab);
+	config->num_peers = ab->num_radios *
+		ath12k_core_get_max_peers_per_radio(ab);
+	config->num_offload_peers = TARGET_NUM_OFFLD_PEERS;
+	config->num_offload_reorder_buffs = TARGET_NUM_OFFLD_REORDER_BUFFS;
+	config->num_peer_keys = TARGET_NUM_PEER_KEYS;
+	config->ast_skid_limit = TARGET_AST_SKID_LIMIT;
+	config->tx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config->rx_chain_mask = (1 << ab->target_caps.num_rf_chains) - 1;
+	config->rx_timeout_pri[0] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[1] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[2] = TARGET_RX_TIMEOUT_LO_PRI;
+	config->rx_timeout_pri[3] = TARGET_RX_TIMEOUT_HI_PRI;
+
+	if (test_bit(ATH12K_FLAG_RAW_MODE, &ab->dev_flags))
+		config->rx_decap_mode = TARGET_DECAP_MODE_RAW;
+	else
+		config->rx_decap_mode = TARGET_DECAP_MODE_NATIVE_WIFI;
+
+	config->scan_max_pending_req = TARGET_SCAN_MAX_PENDING_REQS;
+	config->bmiss_offload_max_vdev = TARGET_BMISS_OFFLOAD_MAX_VDEV;
+	config->roam_offload_max_vdev = TARGET_ROAM_OFFLOAD_MAX_VDEV;
+	config->roam_offload_max_ap_profiles = TARGET_ROAM_OFFLOAD_MAX_AP_PROFILES;
+	config->num_mcast_groups = TARGET_NUM_MCAST_GROUPS;
+	config->num_mcast_table_elems = TARGET_NUM_MCAST_TABLE_ELEMS;
+	config->mcast2ucast_mode = TARGET_MCAST2UCAST_MODE;
+	config->tx_dbg_log_size = TARGET_TX_DBG_LOG_SIZE;
+	config->num_wds_entries = TARGET_NUM_WDS_ENTRIES;
+	config->dma_burst_size = TARGET_DMA_BURST_SIZE;
+	config->rx_skip_defrag_timeout_dup_detection_check =
+		TARGET_RX_SKIP_DEFRAG_TIMEOUT_DUP_DETECTION_CHECK;
+	config->vow_config = TARGET_VOW_CONFIG;
+	config->gtk_offload_max_vdev = TARGET_GTK_OFFLOAD_MAX_VDEV;
+	config->num_msdu_desc = TARGET_NUM_MSDU_DESC;
+	config->beacon_tx_offload_max_vdev = ab->num_radios * TARGET_MAX_BCN_OFFLD;
+	config->rx_batchmode = TARGET_RX_BATCHMODE;
+	config->peer_map_unmap_version = TARGET_PEER_MAP_UNMAP_VERSION;
+	config->twt_ap_pdev_count = ab->num_radios;
+	config->twt_ap_sta_count = 1000;
+	config->ema_max_vap_cnt = ab->num_radios;
+	config->ema_max_profile_period = TARGET_EMA_MAX_PROFILE_PERIOD;
+	config->beacon_tx_offload_max_vdev += config->ema_max_vap_cnt;
+
+	if (test_bit(WMI_TLV_SERVICE_PEER_METADATA_V1A_V1B_SUPPORT, ab->wmi_ab.svc_map))
+		config->peer_metadata_ver = ATH12K_PEER_METADATA_V1B;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/wmi.h b/drivers/net/wireless/ath/ath12k/wifi8/wmi.h
new file mode 100644
index 000000000000..a66ede369ba3
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/wifi8/wmi.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef ATH12K_WIFI8_WMI_H
+#define ATH12K_WIFI8_WMI_H
+
+#include "../core.h"
+
+void ath12k_wifi8_wmi_init_qcn9575(struct ath12k_base *ab,
+				   struct ath12k_wmi_resource_config_arg *config);
+#endif

-- 
2.34.1


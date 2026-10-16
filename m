Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF6E37473A
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120935; cv=none; b=lWDWerqfoNBJDAFc/4hPPyPL8545dN3bcLCeL1S60zN2DYiFZSjqSg8AiR6a0NtlPUfwQTSwawLBTQesxvUXsNBm/vLA53XaKkmtIkZbyxazY62cGNEXIujDQqi1QYHWjrWwYQvIk3/xGbZsKl712oSsZBj4uo8dmX0ckdZbXdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120935; c=relaxed/simple;
	bh=JOFX2Z8zRPVe/Qn1jsMwiuZo9ZCIJeIaopeipkRwKSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Go7d7ebVGzT9hBEMkiker8hpsegyo0pvlI49vyHVNUwkkzu6Db4TXqXad57vte1+InB8G6bt+4qZnlR7pOd4/M4Pc/tZgiPJNvAZiXijabsb5v3Z6Bs96WmibE80q860pF70ESRrGTDq4W9jc1D5UoGGHWK8MGnLyUa7CxU3jm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QlWPOELU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DIt1uXwQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QlWPOELU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DIt1uXwQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FNCh5W557562
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yb6jb8LtpaG9aoBoetLFIOgA/OlOCRhdtmyPDaQ8Ovs=; b=QlWPOELU34KqE/h4
	P8WYzgtlApk3V49VeVe/Ri+7OqNmG92EyV0+9McsJVhZB7SlDzemu9iaLMpj5anT
	9NNA6PNn3QSiFlEdqqL7fg7+ZaVO36gmm0QsM+dvJOqgJNwjF4L+AB/XxmW5TEjB
	BJmFtuGhVstuaTkm4vgEMYQZdRl+DwOFhCNOGcwLzZ9rmuROriGoSw5CjRhk+GYz
	NVqSu+O2dwVqzDXLvrkfc5nIA9SAQSdQqADC4QSNklionLjntOD8Zv4c5wx0/7vq
	9Y0K2nwcEpFOCF+E0CRqgqQVL8FQ3mEboMivwu9JAeTrvhPmfzU21Cmh40qkFf6D
	IHzFkg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a88p4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:22:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3592749a017so549668eec.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 20:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120933; x=1792725733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yb6jb8LtpaG9aoBoetLFIOgA/OlOCRhdtmyPDaQ8Ovs=;
        b=DIt1uXwQmeCPXgVDiyvqJeSaakq/fDQjGaqQqNf2/IwlRLXZaQKYAI0j+yv7EzCqpl
         td+A31gx+bvMadjdnn/arRMcdVuyKfgzNIpJa/w64Vy0vdWesKquVH121TRUda6dEKcH
         64v75uys1Ss9Zttzk5XUczTZf8Uq/6/sB6n5QEAjoJ/HAB3s4n/UbhoAbKdyVgL3wxQn
         5E547fqk9t01IeM3Whrxl4LOmB5NF6obVCsyhsrhAoGNwc/70TktAkkfEQNf7/TNKCOB
         h8qwS/vzb+SHAOiTYTERZduMln0lmK1qNGzS5vEWmXbCSA9NV1YKLHzYKHTaRwo6HIa7
         Pi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120933; x=1792725733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yb6jb8LtpaG9aoBoetLFIOgA/OlOCRhdtmyPDaQ8Ovs=;
        b=VHpeI+ptCcvv57yIbjAwxU7XMd0npbSvW4EOFeoaehPSQwgOx/qSulikkMr0eWeNjN
         Zx2YrretQdDOPMBjsoOW4DcM8RqGxHr9ijWRCR05V43CWTv0ljx7jvGNU57gq9WBnp8i
         JrTiwgyY9WX16aCm84Xu+pu0SVo8tSLg2mVUOrRj4X2XoFMWRhhnVHJ3KthSCtFWVdfo
         OotaGG8143ffA9uynzWn8NOXz+qRV7xLF/O1WttU0YYgOJ2sP6vJhY0MsIPayzT1H//e
         3Dd7AvSZ9yQhta+26kDj0DIf+tJOZgQK15cCY9f+3xqrKemmIauWNHvR7VYqkS7pt/te
         kYPA==
X-Forwarded-Encrypted: i=1; AKwUvByjHBzK/+PvusGysLH/+R1B++mZM7gOjH55kkhX4BX2OnMdESp9SwystiudtJY2WAaJdcqFQN0qswe1@vger.kernel.org
X-Gm-Message-State: AFq9FYK465q/aKALR7T9i+ocuYq48/6PpTjT3OFxC/6nHJMHBZi996+7
	bffkLEOJFtPzHcMSgLZdHfrYAWrI9eUB7fc/dYz3sv/e5eaCeS2ajiPLEi7H6IStqnJjlnDtcZi
	Hl2WkIq4OiVVomueX5LdELBFyhz4hGiJ/qrko4VAoIhD25z8nlSRNXrHgpN9uXvnh
X-Gm-Gg: AYBFou0xbvnvYx4JjU1VtYKQSKSUz8iYoLLOBCUiXGXr4dsQr9VYgqqS9HypUuFocfk
	yBJVAlooZicIPJ8cTr8ktoiKvWpurUTP0l7KzgP/aK/4fwwKXxkwS0DqC8SCMWXqEijbX1CXYcn
	N0xXAyesIZoARj1oUnyz0GaZ7bvVsLuURuLHKyHdLIs2VRWpvYHmDBujSMy4G/QgPuEKYgGoGlx
	I10FELW+WlGMsY/Gbp0S/XG0R9RFWroC7LqpC7p1g+2GzKx844bi9vTlb2CMF+C999mcvJuSgSm
	00y1sdV8YIHsR/Cf9Y4D/qS8R8HRS3r6tEQrMWf0ghtauUmqPOSE4fOf5CrVnaSpQe+XC+gu7zO
	IQ6gNV+D58PpMuzD8Hm1LynxXo41cAF1JtdopBbFh4m5m+wFthmBIu9X6Kqv49P8orwWdne9b9a
	jjv5ILUwvChCF25iizPPB31Q==
X-Received: by 2002:a05:7301:6198:b0:35a:e354:643f with SMTP id 5a478bee46e88-3602a780f07mr2413100eec.4.1792120932429;
        Thu, 15 Oct 2026 20:22:12 -0700 (PDT)
X-Received: by 2002:a05:7301:6198:b0:35a:e354:643f with SMTP id 5a478bee46e88-3602a780f07mr2413070eec.4.1792120931904;
        Thu, 15 Oct 2026 20:22:11 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:11 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:42 +0530
Subject: [PATCH ath-next v2 05/17] wifi: ath12k: add hardware registers for
 QCN6432
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-5-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfXxGSCHWqMj9GL
 g1r5SejHdVk1UbSY1KWcuEjFCQyya2RapGI+VsECaVkYIYyXQRMK2EbajcEtSR3Uuqt2diuboR6
 s8x0oMB4ASeZMSd9rI5XnV03lIPhyd4=
X-Proofpoint-ORIG-GUID: RLNH9nGuSbvbPP6lMxbGp6wlz5C8oD-e
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad19865 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=4ETC605TzGOYwJmJ72kA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX1QJ/hMx6w+b5
 1nfP3czJ3WLmpGDSHmYnzzaicrEADkJgt5R4bKsDK/MZ9sbqslg5gxxzsJj4K9PdXRTsZVV2kOJ
 Gvmpdqf6esTW+LCMK7DITEJ05YgsOgUp6/RfjRGBp+VJcOxyYG9k9qTjv5eZ5olC95RIVoJoqW+
 KYGU7+EfKXf5I/0/jMeikzX9K5SvLHJ3bAGj/tAivL+yMedR32jX1T4P73p2YhqCnInkYkPxe5m
 DvL3x9wzxPyExUO6AH+sHoXZXmFC+18sX40oOqcdjfeJfbY8zJhg4uGG+vdyTGqeLqfBGaBWFWB
 uHwWy9iYNsAgnV7kjjUpNXjE9fVH0jv7Xo4K6Z9Ez3omEKZbkUKXm5qQ6xNldkRefeFh2T1dDIW
 OtdVwCYjVrAZyYM/W2YKt60d35gtN9H+mLi5uyAIL8PIynMDw//4BGEZqLsZ5iubAdgO5ldYM/1
 AVJYpeN617JuzFTm2tA==
X-Proofpoint-GUID: RLNH9nGuSbvbPP6lMxbGp6wlz5C8oD-e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Add hardware registers and populate the hw_regs field in
ath12k_wifi7_hw_ver_map for QCN6432.

Also populate the HAL operations, HAL descriptor size, and HAL parameters
using the same values as QCN9274.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |  7 ++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 85 ++++++++++++++++++++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 +
 3 files changed, 93 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal.c b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
index a0a1902fb491..7c468159085f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal.c
@@ -57,6 +57,13 @@ static const struct ath12k_hw_version_map ath12k_wifi7_hw_ver_map[] = {
 		.hal_params = &ath12k_hw_hal_params_ipq5332,
 		.hw_regs = &ipq5424_regs,
 	},
+	[ATH12K_HW_QCN6432_HW10] = {
+		.hal_ops = &hal_qcn9274_ops,
+		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9274_compact),
+		.tcl_to_wbm_rbm_map = ath12k_hal_tcl_to_wbm_rbm_map_qcn9274,
+		.hal_params = &ath12k_hw_hal_params_ipq5332,
+		.hw_regs = &qcn6432_regs,
+	},
 };
 
 int ath12k_wifi7_hal_init(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index 052b59265af8..34f6be922479 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -572,6 +572,91 @@ const struct ath12k_hw_regs ipq5424_regs = {
 		HAL_IPQ5424_CE_WFSS_REG_BASE,
 };
 
+const struct ath12k_hw_regs qcn6432_regs = {
+	/* SW2TCL(x) R0 ring configuration address */
+	.tcl1_ring_id = 0x00000918,
+	.tcl1_ring_misc = 0x00000920,
+	.tcl1_ring_tp_addr_lsb = 0x0000092c,
+	.tcl1_ring_tp_addr_msb = 0x00000930,
+	.tcl1_ring_consumer_int_setup_ix0 = 0x00000940,
+	.tcl1_ring_consumer_int_setup_ix1 = 0x00000944,
+	.tcl1_ring_msi1_base_lsb = 0x00000958,
+	.tcl1_ring_msi1_base_msb = 0x0000095c,
+	.tcl1_ring_base_lsb = 0x00000910,
+	.tcl1_ring_base_msb = 0x00000914,
+	.tcl1_ring_msi1_data = 0x00000960,
+	.tcl2_ring_base_lsb = 0x00000988,
+	.tcl_ring_base_lsb = 0x00000b68,
+
+	/* TCL STATUS ring address */
+	.tcl_status_ring_base_lsb = 0x00000d48,
+
+	/* REO DEST ring address */
+	.reo2_ring_base = 0x00000578,
+	.reo1_misc_ctrl_addr = 0x00000b9c,
+	.reo1_sw_cookie_cfg0 = 0x0000006c,
+	.reo1_sw_cookie_cfg1 = 0x00000070,
+	.reo1_qdesc_lut_base0 = 0x00000074,
+	.reo1_qdesc_lut_base1 = 0x00000078,
+	.reo1_ring_base_lsb = 0x00000500,
+	.reo1_ring_base_msb = 0x00000504,
+	.reo1_ring_id = 0x00000508,
+	.reo1_ring_misc = 0x00000510,
+	.reo1_ring_hp_addr_lsb = 0x00000514,
+	.reo1_ring_hp_addr_msb = 0x00000518,
+	.reo1_ring_producer_int_setup = 0x00000524,
+	.reo1_ring_msi1_base_lsb = 0x00000548,
+	.reo1_ring_msi1_base_msb = 0x0000054c,
+	.reo1_ring_msi1_data = 0x00000550,
+	.reo1_aging_thres_ix0 = 0x00000b28,
+	.reo1_aging_thres_ix1 = 0x00000b2c,
+	.reo1_aging_thres_ix2 = 0x00000b30,
+	.reo1_aging_thres_ix3 = 0x00000b34,
+
+	/* REO Exception ring address */
+	.reo2_sw0_ring_base = 0x000008c0,
+
+	/* REO Reinject ring address */
+	.sw2reo_ring_base = 0x00000320,
+	.sw2reo1_ring_base = 0x00000398,
+
+	/* REO cmd ring address */
+	.reo_cmd_ring_base = 0x000002a8,
+
+	/* REO status ring address */
+	.reo_status_ring_base = 0x00000aa0,
+
+	/* WBM idle link ring address */
+	.wbm_idle_ring_base_lsb = 0x00000d3c,
+	.wbm_idle_ring_misc_addr = 0x00000d4c,
+	.wbm_r0_idle_list_cntl_addr = 0x00000240,
+	.wbm_r0_idle_list_size_addr = 0x00000244,
+	.wbm_scattered_ring_base_lsb = 0x00000250,
+	.wbm_scattered_ring_base_msb = 0x00000254,
+	.wbm_scattered_desc_head_info_ix0 = 0x00000260,
+	.wbm_scattered_desc_head_info_ix1 = 0x00000264,
+	.wbm_scattered_desc_tail_info_ix0 = 0x00000270,
+	.wbm_scattered_desc_tail_info_ix1 = 0x00000274,
+	.wbm_scattered_desc_ptr_hp_addr = 0x0000027c,
+
+	/* SW2WBM release ring address */
+	.wbm_sw_release_ring_base_lsb = 0x0000037c,
+
+	/* WBM2SW release ring address */
+	.wbm0_release_ring_base_lsb = 0x00000e08,
+	.wbm1_release_ring_base_lsb = 0x00000e80,
+
+	/* PCIe base address */
+	.pcie_qserdes_sysclk_en_sel = 0x01e0c0a8,
+	.pcie_pcs_osc_dtct_config_base = 0x01e0d45c,
+
+	/* CE base address */
+	.umac_ce0_src_reg_base = 0x01b80000,
+	.umac_ce0_dest_reg_base = 0x01b81000,
+	.umac_ce1_src_reg_base = 0x01b82000,
+	.umac_ce1_dest_reg_base = 0x01b83000,
+};
+
 static inline
 bool ath12k_hal_rx_desc_get_first_msdu_qcn9274(struct hal_rx_desc *desc)
 {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
index 03cf3792d523..5c593773109d 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
@@ -18,6 +18,7 @@ extern const struct ath12k_hw_regs qcn9274_v1_regs;
 extern const struct ath12k_hw_regs qcn9274_v2_regs;
 extern const struct ath12k_hw_regs ipq5332_regs;
 extern const struct ath12k_hw_regs ipq5424_regs;
+extern const struct ath12k_hw_regs qcn6432_regs;
 extern const struct ath12k_hal_tcl_to_wbm_rbm_map
 ath12k_hal_tcl_to_wbm_rbm_map_qcn9274[DP_TCL_NUM_RING_MAX];
 extern const struct ath12k_hw_hal_params ath12k_hw_hal_params_qcn9274;

-- 
2.34.1


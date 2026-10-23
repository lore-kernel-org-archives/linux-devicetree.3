Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738889;
	b=VkPRLkdU/xdxQRQSAn50Y/64ssnV/OIXCe3cFtxxbsfvsZvVh6Wr0F2vYJ46Cshh+RVU
	 pT9Qy0kb3SHRvNYKluPPVb0F+CrIQQ6ePJjO/VKZfG6ASnzhEOEe8iUIFPKgLYW/PmN8H
	 icZ0hY+nDCfCFDqm2erzKA4U+Gk49brviZBEchj40eUq/z+OpfoM/nuh+kF7ijgWGxjwO
	 taaH82vkfGuh3n9tuzDLtUqSnzprTxgkM9U07jMHkr48HuYJV98xLYZU7gS4EbRnyxAXe
	 /atZQoZxXFjIkotPth3Bznx822jvTtvrvv6ywq1SUQC9neHzn11EuYXNeNbn8DcrRww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UQ/JM6CaN1XmFsZMKDNcGKjdu1vRxBuFX7+yqFt9ezA=;
	b=g5wGz4aYxDYA7seMxJTnmpbeQzXRDZm+hVwSIlIXaV41QSb1hQaB/SHM9m10sUYIzZ/F
	 aCThs1rjXvJ4EnTWkiU3yNcvdZI8R+lpbggvfbCjeWWcUbCk7FOs9kynZYY+YstyPp2tl
	 nVaXFCxLSy8o8Y7W1O7J0ZkjUnqygY8CQFTFgTEcSk4Zf0xp6WsfZSdse98VZRg/e3XIO
	 1BpCQSv0pGbJgI1mVdA3Mf/rMH9e3HHvCVzCEq2UrTcQWs1IOBRWPFKEz2mNQFNzY7vAz
	 eGwp4ZOS1kjSRonE9ri2g88yPwUSvowj+C+HMUG7EpRM29wcHCEKxu46RstFFX83XaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GyTKVD6J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WBpcldOE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CEB60A3806
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5CEB60A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GyTKVD6J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WBpcldOE
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1Erc42389373
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UQ/JM6CaN1XmFsZMKDNcGKjdu1vRxBuFX7+yqFt9ezA=; b=GyTKVD6Jvsjp9M7c
	o9i00fL0yE7n0sYN/dfe7RdPzOU1rbMCMPQWhix7/6idz/czzJHTQf/lkXW+wwjU
	LWtllh+G4ALTaxOhuL1t7fg8cZHO0fy2vr9rQZTnvL7BMWh47xjw1STGKaUrY1cS
	PBy/Le5Yc36XIHnWx29nGHRYVUFoUM5VDGk+YZG8lclOgQL9JBl5SlGGs0P9HIH5
	h/xluJsVey7QRuRpXwR6j+ZJhBFnjdoLUuejK5C9molNpmVMxRzsdwWmXtt5dJD0
	6BwntCgE5te9hP7v8fzaDZ2aPlRbT4KMNBkktRtNXHHBhOVvN5HDlIwrTVf07BPS
	tABeng==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmpabyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:01:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so959299a91.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738888; x=1793343688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQ/JM6CaN1XmFsZMKDNcGKjdu1vRxBuFX7+yqFt9ezA=;
        b=WBpcldOE35m0GePRO+rsioO7fptKXIkjWgVuhLylMf1oS9yo/TzESR0ucUMcsFjN3D
         xnIx2SvGoTJI/uFqQhmaaAbdKXT4hNjdq6ujd7v4u7p7FRDkIdCMEZZfpsScjybuM5Hk
         Gi6OM2+59svleqJMy1rE7ORpaZ22wDPwHAI92RfmEbjZaaYRH3NGS+jm71ZaB+deJjys
         TxWdiS2p7as6KHf0PZHFmwth9uE72oNyd591mAPqP2Hz9NiVDcyvhdfZrMbceBCC3wo5
         /d8NG4oLmXLGFwtjUB840PxXsljaymxHi4Hwgp/S9kSCuszQ+J0lF8iqUpl+o7vmSmny
         Ko8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738888; x=1793343688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQ/JM6CaN1XmFsZMKDNcGKjdu1vRxBuFX7+yqFt9ezA=;
        b=Lsmol4MExi30f2JxMEWFdM3F7SoLntusOmF8uS06+lkimZ+rexxmTbKzuaZDTY5DOS
         CQtdyrxLHSKGP2eOVkQfHLg+rY85CBRdGfyEtUJe3peA4LyhpZ8ftSgiwP14RZFdO1GZ
         jxeTCKBkJXkGRt4g48dbk6AKyVwpdFJA1occ6o5JJFnIElnQXzNoFJ9Bx2tnjgBPlu3a
         aipX/UTn7NtUAeeRgZnXEOGzdJljVAf9TNb/cvk+oH+KJr8Gd9o5F0tg3AhlFe+b6inL
         m2FgxrabZripMuBdiVz63fa56Xah1DKpq9ys0rW26mjQfL3RdrEVR3xE7kXNkbbyJcz2
         /uEQ==
X-Forwarded-Encrypted: i=1; AKwUvBybA3hMP5fltcGkhvCayfJof//naSMVmRXzySMcD8drmasXoVeapEcjpkdRAS5KWihG9J3pqmYUtWGU@vger.kernel.org
X-Gm-Message-State: AFq9FYKnNHun7p93x03B0dQ4HIwYol/3V3YTivBZX2mZDRMibetZdCkS
	FghSju9N7qiBTOdhgrVf+mvghUXxlaMSdoZ8tJMAlFBPWb4g1AVmQARiMOVafBkV6OrH6dVm382
	I0vgy1N2SQYN9FWbi8W3GNhldC2KgRA2rM/ltadg3YJbA5dPIfTR89cIS6tYa2cfW
X-Gm-Gg: AYBFou31TyWH6TSMtYk37JZO5gryGA8+QQqsK2Ptx0mUcngi2NHPRK5VdBdRWPKWdmh
	O2l/x3WQmQamQtoyFCcethCDPNAQueVBgFDqfI6IGsMJ4kXwz/BiB+eXIlA09YF3/hsbD3u1brf
	KIccc5390nuOOT5R327/A0kQ6+gU1UbPXPLaxexL6aqcVMM5+/QVPgzY6kiZFyySCOzIKqpglMM
	fJeheeYspZkwmNoY9WqlnRSe+4lidgVvoZbGDKRquxz2twP8gm8lSd1a2b5GPYAkddnHSMF2dBo
	uhF95yLgEcW1PTVou+PObdLeYA3lKPBTrrHtA3cQaR+gpiOLKiuy13evDQ7fl77xjLWN9p4okl5
	OAc+bn4TmXLhU86S4QVoW5D49CVgoS8+d2GdnkU6kuFdjmOU3FkkofWvQIdEjsAT2zGNHxSmnjJ
	mM1OkJE+5Wy1EqItrT2JWQUQ==
X-Received: by 2002:a17:90b:5201:b0:3ac:9c37:9426 with SMTP id 98e67ed59e1d1-3adce07f6e4mr1162230a91.31.1792738887336;
        Fri, 23 Oct 2026 00:01:27 -0700 (PDT)
X-Received: by 2002:a17:90b:5201:b0:3ac:9c37:9426 with SMTP id 98e67ed59e1d1-3adce07f6e4mr1162194a91.31.1792738886675;
        Fri, 23 Oct 2026 00:01:26 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:01:26 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:06 +0530
Subject: [PATCH ath-next v3 03/17] wifi: ath12k: Add hardware parameter for
 QCN6432
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
Message-Id: <20261023-mpp-bringup-v3-3-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX3UXM0NtxPoph
 7zuE1/L6DGpMzHbG3c9SaieAL/GjLp3oW7VafaWfjIhq1wHonYdxGL8sSJz4ocvbBg2afW3omz/
 n3qeKAVCWxUBw5AYwl9MNQhtod5WPiE=
X-Proofpoint-GUID: J3NyxXsO1OFmDDAUe-a2SHdJ1TLBdZyx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX8COlY1cLL8qx
 j5rFrKvw5I0Rs6dv2gMXw60baW2uex07ZFpN/5RgE0OKDzSzWaJMsgbyxCM1xCGorV0udtEblDt
 4b0OscZU5qCAOL5bm9eHQ94lF/SSgg5V2B9MR+rFYd3Dv/P5/9aeGBQD59KrOZTzHCEAty7yno+
 JlSCLLbz3Wi1gqO8wjJywE2f4vBx/0ZqE42DsWkBrcUAAj2DQ9YbPi0n78b0R9u3WyTxRxkYC9C
 XuDOyW/1NJzhlbMHG+wThSiUteqGILYk5Td4DSarlp/d2VV6isdbP8KpZPEfqgLXU2MhxFO9P0T
 GzI1vH9FVeiSBSHtj5XZHzKW7s7GjJ6OFZjiOXrNufOY4FF3VmGlZUiiAHlgY09MKIGLXuAdVWV
 7+DBnPlY/V0fp0iciXTv6KnU29y1k4APP02wNf/5aCoHhE9XB3h1BcjLRyauAXvFYKSOAMtQFYR
 KBdO9uLmCZp1jM8XkUA==
X-Proofpoint-ORIG-GUID: J3NyxXsO1OFmDDAUe-a2SHdJ1TLBdZyx
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adb0648 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=IkfkkYc7qEKKYK4gSbYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Add hardware parameter (ath12k_hw_params) for WiFi device QCN6432.

Some hardware parameters, such as host_ce_config, target_ce_config,
and svc_to_ce_map, are identical between the QCN6432 and IPQ5332
devices. Therefore, use the same parameters for the QCN6432.

Additionally, certain hardware parameters like wmi_init and hw_ops
are the same between the QCN6432 and QCN9274 devices. So, use the
same parameters for the QCN6432.

Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h     |  1 +
 drivers/net/wireless/ath/ath12k/qmi.h      |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 86 ++++++++++++++++++++++++++++++
 3 files changed, 88 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 993aa3f350aa..d87c59f68c12 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -158,6 +158,7 @@ enum ath12k_hw_rev {
 	ATH12K_HW_IPQ5332_HW10,
 	ATH12K_HW_QCC2072_HW10,
 	ATH12K_HW_IPQ5424_HW10,
+	ATH12K_HW_QCN6432_HW10,
 };
 
 #define ATH12K_IRQ_NUM_MAX 57
diff --git a/drivers/net/wireless/ath/ath12k/qmi.h b/drivers/net/wireless/ath/ath12k/qmi.h
index 1b1c88906f1e..60d5811b1c87 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.h
+++ b/drivers/net/wireless/ath/ath12k/qmi.h
@@ -20,6 +20,7 @@
 
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN9274	0x07
 #define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_IPQ5332	0x2
+#define ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN6432	0x60
 #define ATH12K_QMI_WLANFW_MAX_TIMESTAMP_LEN_V01	32
 #define ATH12K_QMI_RESP_LEN_MAX			8192
 #define ATH12K_QMI_WLANFW_MAX_NUM_MEM_SEG_V01	52
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index b1c17cc197df..643c95c9bccd 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -906,6 +906,92 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 			.max_client_dbs_sbs = 128,
 		},
 
+		.host_alloc_ml_id = true,
+		.advertise_iface_mac_pool = false,
+	},
+	{
+		.name = "qcn6432 hw1.0",
+		.hw_rev = ATH12K_HW_QCN6432_HW10,
+		.fw = {
+			.dir = "QCN6432/hw1.0",
+			.board_size = 256 * 1024,
+			.cal_offset = 128 * 1024,
+			.m3_loader = ath12k_m3_fw_loader_remoteproc,
+			.download_aux_ucode = false,
+		},
+		.max_radios = 1,
+		.single_pdev_only = false,
+		.qmi_service_ins_id = ATH12K_QMI_WLFW_SERVICE_INS_ID_V01_QCN6432,
+		.qmi_max_chunk_size = SZ_2M,
+		.internal_sleep_clock = false,
+
+		.hw_ops = &qcn9274_ops,
+		.ring_mask = &ath12k_wifi7_hw_ring_mask_ipq5332,
+
+		.host_ce_config = ath12k_wifi7_host_ce_config_ipq5332,
+		.ce_count = 12,
+		.target_ce_config = ath12k_wifi7_target_ce_config_wlan_ipq5332,
+		.target_ce_count = 12,
+		.svc_to_ce_map = ath12k_wifi7_target_service_to_ce_map_wlan_ipq5332,
+		.svc_to_ce_map_len = 18,
+
+		.rxdma1_enable = true,
+		.num_rxdma_per_pdev = 1,
+		.num_rxdma_dst_ring = 0,
+		.rx_mac_buf_ring = false,
+		.vdev_start_delay = false,
+
+		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
+				   BIT(NL80211_IFTYPE_AP) |
+				   BIT(NL80211_IFTYPE_MESH_POINT) |
+				   BIT(NL80211_IFTYPE_AP_VLAN),
+		.supports_monitor = true,
+		.supports_cong_ctrl_max_msdus = true,
+
+		.idle_ps = false,
+		.download_calib = true,
+		.supports_suspend = false,
+		.tcl_ring_retry = true,
+		.reoq_lut_support = false,
+		.supports_shadow_regs = false,
+
+		.num_tcl_banks = 48,
+		.max_tx_ring = 4,
+		.mhi_config = NULL,
+		.wmi_init = &ath12k_wifi7_wmi_init_qcn9274,
+
+		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
+
+		.rfkill_pin = 0,
+		.rfkill_cfg = 0,
+		.rfkill_on_level = 0,
+
+		.rddm_size = 0,
+
+		.def_num_link = 0,
+		.max_mlo_peer = 256,
+
+		.otp_board_id_register = 0,
+
+		.supports_sta_ps = false,
+
+		.acpi_guid = NULL,
+		.supports_dynamic_smps_6ghz = false,
+		.iova_mask = 0,
+		.supports_aspm = false,
+
+		.ce_ie_addr = NULL,
+		.ce_remap = NULL,
+		.bdf_addr_offset = 0,
+
+		.current_cc_support = false,
+		.dp_primary_link_only = true,
+		.client = {
+			.max_client_single = 256,
+			.max_client_dbs = 128,
+			.max_client_dbs_sbs = 128,
+		},
+
 		.host_alloc_ml_id = true,
 		.advertise_iface_mac_pool = false,
 	},

-- 
2.34.1


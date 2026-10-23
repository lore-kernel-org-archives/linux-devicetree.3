Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738945;
	b=1iGbWQ9xvcAWb4v90bj7Yklk9Ar17kB2tRGTNrMa13SG5+P/WhvEN/h5vkhC1xEkl883
	 W2u7voedGpn/n0FExK+5u4NjiNsFY06iXFMyQjGa7XYXNY6qU51Ph62fGaJ2oK7YBk0+V
	 AAgj5bPVuspcFKLPE88UQ2N24a4XXZShz+kmMeIwuP91a/0gWcBb00wulhyTLled+9M77
	 CJRJ8lyX2FbQu5uA316rJUK1o/z0K3C+m8OkJV2gqmd16wkUv5X5iI9eyj9xguJS6BjVT
	 mStgxhzf8UDPRz8lIBA5oDZMwe02hUw85VQDwAKvjWDohpnlmBk9098kpb5rMz3BQsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738945;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6aNW9dnDX6TbyEdH720nm0hjQAKn0nJnCofDm4yX0So=;
	b=lS59Im92Oh4MsBfqSE2ZxJ91vrmQnMVRTy+4JHyUqVvd1Mqx+rzz0AffWgXQeSr/vvBl
	 R1seHJnQufFDkwS8GODmIp0iVDCPyOZFg5yx5xAi6wHAvYC5/SRtQ0Xmv2Z0HALIyE7eQ
	 yD3YG/kDznTC4Tr/F9A5UmCIZNSFGhgspp63AW7i7qKuTVWFRKg4xUs0lv1Cb2p7blFXd
	 9ah53GVuasSviK4mwziMsrYLrEU1otIZdnMAHLfhxu856/5mIl61l/4H4qzJhUGdV/bFL
	 GKeTalcJ9hJmzSnttV2uJtXP3At4r8p9HAqPMvhRjY2HJ0MbdVpSnwBiMiU0JL40osg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CkWWPHAy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyF9m3Pg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B699E60A3836
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B699E60A3836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CkWWPHAy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyF9m3Pg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FKi3990093
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6aNW9dnDX6TbyEdH720nm0hjQAKn0nJnCofDm4yX0So=; b=CkWWPHAyDYD1bpsB
	j5Ru1/0ODhwtBUAhbwHf3AbGnqRap6yVn+9A/bvySg3tneSkbhIDxFaDcI8KdFY7
	WM8fahZOQyKWXHg4HnMHuhiZLD2W2XDSNkPfyJWpIxtYfKkfAlf7I1xGVBl09TxU
	HkFk+7FlMg1f7UZ02BZIOertxVSNSnhPi+k+8vsddcaWNSz3kKEhc0ossFMlYyes
	7iZfVEtGjRuDH7CmvpNPlS/fOotlNCiUc8+5BqSiB0/3dHvMvkU/okhtSjZzhvBj
	yaoJD/N/e3EBnQ8IW82AknBgUp1DxVHQSqM8zPSIEdaYjTEX1b3ny65koxzhs77P
	IIPtMA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahtsx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 07:02:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso573640a91.3
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 00:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738943; x=1793343743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6aNW9dnDX6TbyEdH720nm0hjQAKn0nJnCofDm4yX0So=;
        b=jyF9m3PgjOBWPZLdIa4wPV/KfdU39RgTeN7amlkFp2zQ8krpPWT1kVpFu9HCvfUTVI
         ld34B0I0o2iE+LORSCQZc+T1mwl0DsApiQhQlo4mbexpwRZIMd0WqXTO1BrFYvu1JMxO
         EENRl+R1DC3PKsnyw70S3O7rGRMHymLsWdc4q9n81NyO/Mryf+AuZgF9AQiLkFLHUxoX
         bsLWmHMd8HeNeMuGYaHdUtYbLSJp3uDH1wrj0Nn+qu3KlIBYn+/mWt2D/c4GE/4LIhg8
         l/Q77+46Ptk2HRLjSiOnYY44CBCDdFLV52ZY189rxruVHDbyWhKpmOJ/SMudN+9r0jUS
         XPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738943; x=1793343743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6aNW9dnDX6TbyEdH720nm0hjQAKn0nJnCofDm4yX0So=;
        b=ACWkxQV/ybIVmyBXFvwJYyOWbfiGoWL7pIkDdlCuEMS+ss+xkBAaPSLomxr8w21kAF
         e3IVoVG/1GNymn6m2H6PFfnnzm4BLBGBEGFIyd7kOsBaJhKPWLVyfoIT+AIQGF8jd3eh
         1kyrvb1T50T3CCqofkVVlYCYhgC26unvlYAa6gPyArcToPAscRaMQpjr2/ArobC8YVcg
         ONqN84Pu0XFBXNBNE+qTT39z13/JyS+Vg8+OQs/fsX11f6pHCJONB3b5CQ0vfz7NShpE
         PPG65V9qwd41Y9CCwp+h9FSQ1i3nnZ7AWsK+aThqwgDh6W0qHyiQFQkQOzo12wYjWVA5
         b2eQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoBiSQeV5j/oN9hec1lYhI/XXJre3/thXyUKSWbkNTM+uUNj/0quSL2KuS6d7SH4XUdDDfzn2X/SCq@vger.kernel.org
X-Gm-Message-State: AFq9FYLZN6RQ1kpOyZ1YL2vBr07Jal3O3E7JuHBo269EbGmZVZNOPQeA
	MxP7PS5GLj1WrA34tyAC1NNEdkP56CGErnGCgEzuZBQvP7pHVe3+og9DtcQfhbxrqMKAbGKZaQH
	naRMvgFXipJWDkJHxI/DQn4IQVO1Hxb7cu4YNCViFIMwn8g1dUXdnc6WjEI+3jLUf
X-Gm-Gg: AYBFou1FGcrguvk7EttpuWQvciy37jtkBcBK6vag0xqxRQxK+TNWFdkgZbwVscEiW5O
	zVs0hAjn3vpV4YcKacXxRCwTZ7+5MHZByejr8jftiTJNjApkzl0cCdlzwW+doLCex7r8CtwqgMr
	ILYrJuqxBGZmXRSVKw0qZyBiOzkknNBbrRtXSyAAiLdA8nmsPzW9DqTKu2aBVXxN84U94M11qol
	vhkhSVxQgBtaf2bgoDfMI5R8eS+m+NfeMsR+TizXeXVfUQ6n33hyGgsG/1BHpp1Vpwtz5QmPdaC
	zuzQ7o6J9qh9R+/d8Of2omqWWAVtE6yz++VGCK8vZ+d86YzEr/24seRsGflfoBueW2gMf7F2GBV
	btFffcdoKWXsg2nxv5bigsJwerQ3swuEDE15SnOR7smJNQLNSJEJjw757LEG+gns9EI45vuZxKZ
	BuVCf3XUCDpC/Ubw6LNMGELQ==
X-Received: by 2002:a17:90b:3f8d:b0:3a7:9e3d:b3 with SMTP id 98e67ed59e1d1-3adce7f0654mr926869a91.66.1792738942625;
        Fri, 23 Oct 2026 00:02:22 -0700 (PDT)
X-Received: by 2002:a17:90b:3f8d:b0:3a7:9e3d:b3 with SMTP id 98e67ed59e1d1-3adce7f0654mr926860a91.66.1792738942184;
        Fri, 23 Oct 2026 00:02:22 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:02:21 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:19 +0530
Subject: [PATCH ath-next v3 16/17] wifi: ath12k: Resolve userPD ID per
 device
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
Message-Id: <20261023-mpp-bringup-v3-16-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX2L/XrKMmH9w+
 hPP0wuZxUGCX/7Pg9VNEzXxthrFvJaYWUVf0le36Uz26vvNbYMvGAG0iE+3QSMbAOSNSO6VJZzB
 689JQSs7ZVvXAJw5I0YetkN+mS3RvhE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX3+QaJ+GxFDAN
 1z1Ku34rpz1ZhboO+5eMAJQvTuYGApg7PM331z3kuGHaGpP1n+vv9E3wg7+MrWrB1t+qf4GvWWj
 IWttrTVdiegLw87t0tmlzjahfa+vXuKrxedEKLxyXSSFqyarwsF/1I5MHMtdQ+H9wJ2dnBGDpnZ
 bQEMOBKqb9P/nW34HmHvv6nzuhDXA+p/Se/szRXJKPtnGIuKSQQoNlOilD4JHRFDMTQtQnFQJAj
 fbTr8DDDO3sPdyAsDbD34HuiKO9B7db3RA5fn/BEqP6r2LutHqSVPMq5zUmfIj+eBOnLNqdHlNG
 f4SyN+7VKrshC8SHdtNUhb7UlyYj+qsIKjjcc5n56DjNfzHa6TQ5YpKjaW6dron0Q5bj7cRZ1Fy
 eXeKt61MAxDqGzYlc39DYxDklhclxHIUyyFMw8XlRujRnG3a3HWsEFb0u9TUjfqXfSoJVnclwjL
 ZvP1KpwK42JJ16OPdnA==
X-Proofpoint-GUID: vK4FQuRWBDdOTbYIrxRde0IAIV1CrMhH
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb067f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=OMOyA7uMCkrHFcBVPHAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: vK4FQuRWBDdOTbYIrxRde0IAIV1CrMhH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

Currently, the userPD ID is hard-coded during AHB probe. This does not
work for multi-PD platforms where different devices can have different
userPD IDs even when they use the same compatible string.

Resolve the userPD ID based on the device address so that the correct ID
is assigned to each device. The userPD ID is used to determine the
firmware name and PAS ID for firmware authentication.

Also set the multi-PD support based on the AHB device descriptor.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index bff48b2fe124..889361e637af 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -16,6 +16,10 @@
 #include "core.h"
 #include "hal.h"
 
+static const struct ath12k_ahb_userpd_map ath12k_wifi7_ahb_userpd_map[] = {
+	{ .io_start = 0x0c000000, .upd_id = ATH12K_AHB_USERPD_ID_0 },
+};
+
 static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
 	[ATH12K_HW_IPQ5332_HW10] = {
 		.hw_rev = ATH12K_HW_IPQ5332_HW10,
@@ -43,6 +47,26 @@ static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, ath12k_wifi7_ahb_of_match);
 
+static u32 ath12k_wifi7_ahb_get_userpd_id(struct ath12k_base *ab)
+{
+	const struct ath12k_ahb_userpd_map *map;
+	struct resource *res;
+	size_t i;
+
+	res = platform_get_resource(ab->pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(ath12k_wifi7_ahb_userpd_map); i++) {
+		map = &ath12k_wifi7_ahb_userpd_map[i];
+
+		if (map->io_start == res->start)
+			return map->upd_id;
+	}
+
+	return 0;
+}
+
 static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 {
 	const struct ath12k_ahb_desc *desc;
@@ -60,7 +84,8 @@ static int ath12k_wifi7_ahb_probe(struct platform_device *pdev)
 	ab->hw_rev = desc->hw_rev;
 	ab->hif.ops = desc->ops;
 	ab_ahb->scm_auth_enabled = desc->auth_enabled;
-	ab_ahb->userpd_id = ATH12K_AHB_USERPD_ID_0;
+	ab_ahb->supports_multipd = desc->supports_multipd;
+	ab_ahb->userpd_id = ath12k_wifi7_ahb_get_userpd_id(ab);
 	if (!ab_ahb->userpd_id)
 		return -EOPNOTSUPP;
 

-- 
2.34.1


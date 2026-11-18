Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016267;
	b=cCmV0GSqjjwn/e2SmzaJZHHgNwVGuc2DUXY6HCJFrKKRyXB/WsV/vNiWEd3VhqW/pgrF
	 zxAsMr3pvHNiLM1S1nVgy0xYCkSlpEDFy6B2HAI2rocKXGeG235ZUWyhbmrHzjCnK8MvL
	 CLyq/Mlrvno9g3AN0rG2ZYi7efUkRVFixtt9CKXbhF8yaW5YcLxVNyreuGZ8bym0BOr7Z
	 n6Su/VmpG+XXobgqTtMSBcNvUdTgSllxXlJFSdlKm7XueoYFw3KIbPiho88Z2nrPDQfVO
	 0AUH0U2b4Vfcp5ljzrE1TTqFzU+mgFgsuELpNS2nk7x9X5EAUK+oW+DRLd8fbCBbPMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016267;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qzFBj8cKW+74Q8/ugmsGUGT3tElBm/xbXmedl4NHxvY=;
	b=ixWH2G+/YMhf40D1MqafT2V5k/n8AE7lv3yuNFEFfBZmB2wTiYxOYtddy3Yw4E5Tjyk7
	 v5q42YZEqbAFGFhk54B46094nxOma53asZnL4lzQ5noedjJwmww4uH7/T3wSe6DTQ6+Q/
	 mGA9rjCWqoxEMM+y3OJ20T0OTwbL59e30MDeoSwkJJh1T0tSQSkQNALpXs0s3Neh5D/R2
	 5oyPZpq+hDOPImb4nYoZxMx7LoVXHwqZHq0Yg0j/oUDmITLf0mfQd9E03v+uQbrJ4iPoE
	 6rbRPt2yICt/SKwjP5vITIcYo8DL2agrsooF4/eVg8IP4wmbfHjbQAICdHRZam0X4uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fouOHyrE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MQFRqJ/k";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1452760A2634
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1452760A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fouOHyrE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MQFRqJ/k
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQ9Yp3846490
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qzFBj8cKW+74Q8/ugmsGUGT3tElBm/xbXmedl4NHxvY=; b=fouOHyrEHtyZGxMW
	THi5+769Ry1FweQ6T42PTGAJWVnxvyNV14ipyXgpAE7ucdfs/INBbgfXG8mDhwsm
	YOmsjxYKSU0gTL4IgASydWNfP1magNFGTQdGYDAnyAJOGvKxBDCPSPlZiERKmDrK
	17ujkNIF2x+eVUjB8/NWZaBwx40F/OLjJrZB6OmcwYOHht0z0PsefjirrjorqxVc
	fA/Jp+JUq6TgC1NEh2EDmHg93IOQjKGOIsddrDrCJVUkjgqcHhFp/oBFwAY6rTsF
	giUv2VntWbvWDYKP6CaDLwItfsDSN8j8VGuvcJ2fbx3cOXOq5z+NA7GAV+zlRozw
	2VJe/g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvaurq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:37:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c6c1e082bso33876276d6.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795016265; x=1795621065; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzFBj8cKW+74Q8/ugmsGUGT3tElBm/xbXmedl4NHxvY=;
        b=MQFRqJ/kn/hciukcLxwlsRul2ehqzBDsTuyNgJZE8zb2PgCoqArbkf0vIrayCiBY9W
         9/tXm/7M5CAi4Wl1tt6lFk4uuMnk/a/+2kg0LtWO0EXBSrMd2NxyX4ttaxRG0Pi0Iu21
         feZg6E4A1AmCyQ9b7Fg8ywV9Qrj8Ho0tIpx3wMgllKNBLQrOYH5bC31NzH4kNNzEf6xf
         paT8KzP9vyIK/T3iWmEFYXzWGE6qRysYzRWIrcLIpbIyslQcpkQLbz/zf6nNhb9zg48X
         i6Wsa9gAbEXeCZoBsfb7rp7NrjuLnm5jDNBnF81/yYvmaDU+ddhFUBSu4I5I810QaqWV
         3y+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016265; x=1795621065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qzFBj8cKW+74Q8/ugmsGUGT3tElBm/xbXmedl4NHxvY=;
        b=1on7//ZS3BN9tlewnuMjz5fBWygbk8HdqxYuM3kDUgbL7I7KMU6fdarDMTSQYbjCRv
         s0QGViiZxJJJifSoqeYlZi6M8XX9oJTSqzZhyCB4i/43ndc88L94Y911MRLrzHl8Ge+h
         020xU8tpdEJCYFK4CZQooN8NaQIfl2AHPxTWUnEYEw2nF1l6Ma1Tl610QvkOhoCs5fAH
         68kttKcUaTdmVTjLwlBh9B37pYCjlEwXrGOyiaJqztovurHZWKz45EjyIET4ETGCqk/w
         PsJCskbThG+u2uYlTH9SaH7VQHr25qIdH4i1N5dofOky7RXcYLEd7/C6HMeJa7fciQ+8
         wHSQ==
X-Forwarded-Encrypted: i=1; AL+hErHpGbGAvRRJTzFU3tYUVrnWxjzHr0xM5qgQFPWZEbGgwYFm5bcND+JxE7DloBOrsCU/ViM30thTnVBB@vger.kernel.org
X-Gm-Message-State: APuU4Z+YxbOPX8DstN980VZ9kO3jCdMFltcmpyXKHRhhCcf7qkGT+BXt
	7D6806o2PZvEecYrbY/eO7aItyu83LnrR5U9tH2CxwfYDJrt28R9Q2/7AXCmtCwi/eYriV3b3te
	tTiMWpubAvukH+nFfHq6beOm3eaaoEVmMc3t8N+EQmlvib2cCC6ZL/k1E/Jo1/wtc
X-Gm-Gg: AZFdTZe9+xYXN5NJfOQ9qvdrQkmcCQQtvlhTIxN1Q1j4MePfhhteyXtv/gv8k+iceGL
	VNF1vUn+QAvLjEhf5IQpKAyF7ZRFp/GJMq0hO2nyB0Z0UB2qlyYBLuDSAegPytLF+rJt7jwwaAK
	/8kTNhwb55q32XXShx5iZbAVv/5brp0Rg+pRCe0XKynZROznAwU7VoFg+5gLFcmYLcr+NDdZ+D5
	j4dFcSUSa01kDQRGGcLRXkTmKn0iODoOLsufIxlXSjqYb3uoFjP7MrGFDEkNkc0cNtLOZa3CN0R
	vEy/spwJ/UlgoJWesGI+LAaSUh1sOVa5ycS9J0d8Z8FjX44XiKH+KOlvnEsiBkk0otIfWcrt/Yf
	rPnzQ/rg+ij1AlAqmDFcIkSuynKjZpAHRDtVT6lPYqSRqEANXwOwgoOMETcwxyS1hNW8eocu7kF
	9Br7zCJJVTm0Qn7rrhDKUjG3oUoot0lDx0m8iSKoSW/aReJIUuHfIx1XaX2K34
X-Received: by 2002:a05:6214:3304:b0:921:2c0:a46 with SMTP id 6a1803df08f44-92102c00dfcmr68380866d6.2.1795016265151;
        Wed, 18 Nov 2026 07:37:45 -0800 (PST)
X-Received: by 2002:a05:6214:3304:b0:921:2c0:a46 with SMTP id 6a1803df08f44-92102c00dfcmr68380336d6.2.1795016264542;
        Wed, 18 Nov 2026 07:37:44 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d0d879sm24569676d6.12.2026.11.18.07.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:37:44 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 21:06:43 +0530
Subject: [PATCH v3 2/4] remoteproc: qcom: pas: Support secondary images
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
Message-Id: <20261118-oob-support-glymur-v3-2-2cbdfe208d56@oss.qualcomm.com>
References: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
In-Reply-To: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jain P <anvesh.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795016249; l=15966;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=5yb7E/BfyC1un7YnSt/669hxwZNZYNTNLk9WmP5APKM=;
 b=TxsGPT1z/qU9uX3LEVjlJZcYYMKreEusQHboy3uPBfrsQVo9ZjUXnl9Wx638psnXTzOIMVDm9
 eG3naOKaSK6BzI9onjqwpU+bovlmo9JxCovo2A3Ag63Y0vAmYK6e8pz
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afdc64a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=o27oSfNwkJ_vFjMxz7gA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: gOIP8mkBJOwOo6eyYYc48PVuh__fYD0O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfXx4lCKpjfI1fW
 FM+/3x7RNek31xABEBxiBYeiS7W7nD7Jl/AXEDy/OHrXbUYP8LiOER2Vx5utxqNczgc1I4blDVO
 dgIJtdhbcg61TvIg8uEggrA84ohus4pmfk9ftZ4nl+TY/GPTUZMZmpsYTKU77GVYCnLS4gTcuk0
 NSYOIxdt5WrSOnq35Maf99YvaCEXsdOBQtYseEmHOc41x8xaRsUqA8KkZKNVNG+oqEJs/Gl+8xG
 E6Ck3BDVxIbM9QgxRtzcQf2j6r+ScG2ju3wCEWo9ke6NemsC3BFjANhRsxSMAqw4mU5CU1BlUg/
 UPre7MRtdFKyKwR0SqjGAm2unASUtivOLr8/WUKjeN5CvLO+zvnoENs9I6+Kjmq3KG0rn+9zg22
 Ok7EfDDp1cc1wG7VgYMyMHRzrpqvFZtBi0gj09RWsm/3mtQJ6hPhfqMrOl9u+LJ71gUqdR93d9s
 ou3fCf75rqXyE9gTBbQ==
X-Proofpoint-ORIG-GUID: gOIP8mkBJOwOo6eyYYc48PVuh__fYD0O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfX9Sp6yXxuybAh
 YvrNLxEStshhxChDyDHKOiJxklwg+EMj5YCJdw1NpNXI0NY+myhSqHUYxoU5TQXISNN9Q+tJRnu
 uBCQi1UUTnKa3630q6XUABwV+NsIcjY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180062

The Out-of-Band Management Subsystem (OOBMSS) is managed by a common
remote processor and consists of two Zephyr subsystems:

+----------------------------------------------------------+
|                         OOBMSS                           |
|                                                          |
|  +------------------------+  +------------------------+  |
|  | OOB-TEE                |  | OOB-Non-Secure         |  |
|  | Primary processor      |  | Auxiliary processor    |  |
|  | Primary image and DTB  |  | Secondary image and DTB|  |
|  +------------------------+  +------------------------+  |
+----------------------------------------------------------+

The primary processor is the Out-of-Band Trusted Execution Environment
(OOB-TEE) processor. The OOB-Non-Secure processor is an auxiliary processor
that depends on the primary processor and cannot function independently.

The PAS remoteproc driver currently supports one primary image and its
optional DTB. OOBMSS additionally requires the secondary image and DTB
to be loaded, authenticated, mapped, shut down, and released through
their own PAS identifiers and carveouts.

Add generic PAS support for loading, authenticating, and mapping a
secondary image and its DTB, then shutting down and releasing both while
keeping the existing primary-image lifecycle unchanged.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 268 ++++++++++++++++++++++++++++++++-----
 1 file changed, 237 insertions(+), 31 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index e7dfad27e526..1c8c0c22c34d 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -56,8 +56,12 @@ struct qcom_pas_data {
 	int crash_reason_smem;
 	const char *firmware_name;
 	const char *dtb_firmware_name;
+	const char *secondary_firmware_name;
+	const char *secondary_dtb_firmware_name;
 	int pas_id;
 	int dtb_pas_id;
+	int secondary_pas_id;
+	int secondary_dtb_pas_id;
 	int lite_pas_id;
 	int lite_dtb_pas_id;
 	unsigned int minidump_id;
@@ -104,8 +108,12 @@ struct qcom_pas {
 	int proxy_pd_count;
 
 	const char *dtb_firmware_name;
+	const char *secondary_firmware_name;
+	const char *secondary_dtb_firmware_name;
 	int pas_id;
 	int dtb_pas_id;
+	int secondary_pas_id;
+	int secondary_dtb_pas_id;
 	int lite_pas_id;
 	int lite_dtb_pas_id;
 	unsigned int minidump_id;
@@ -116,17 +124,25 @@ struct qcom_pas {
 
 	const struct firmware *firmware;
 	const struct firmware *dtb_firmware;
+	const struct firmware *secondary_firmware;
+	const struct firmware *secondary_dtb_firmware;
 
 	phys_addr_t mem_phys;
 	phys_addr_t dtb_mem_phys;
+	phys_addr_t secondary_mem_phys;
+	phys_addr_t secondary_dtb_mem_phys;
 	phys_addr_t mem_reloc;
 	phys_addr_t dtb_mem_reloc;
+	phys_addr_t secondary_mem_reloc;
+	phys_addr_t secondary_dtb_mem_reloc;
 	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
 
 	void __iomem *mem_region;
 
 	size_t mem_size;
 	size_t dtb_mem_size;
+	size_t secondary_mem_size;
+	size_t secondary_dtb_mem_size;
 	size_t region_assign_size[MAX_ASSIGN_COUNT];
 
 	int region_assign_idx;
@@ -144,6 +160,8 @@ struct qcom_pas {
 
 	struct qcom_pas_context *pas_ctx;
 	struct qcom_pas_context *dtb_pas_ctx;
+	struct qcom_pas_context *secondary_pas_ctx;
+	struct qcom_pas_context *secondary_dtb_pas_ctx;
 
 	struct qmi_tmd_client *tmd_inst;
 };
@@ -226,19 +244,37 @@ static void qcom_pas_pds_disable(struct qcom_pas *pas, struct device **pds,
 	}
 }
 
-static int qcom_pas_shutdown_poll_decrypt(struct qcom_pas *pas)
+static int qcom_pas_shutdown_poll_decrypt(int pas_id)
 {
 	unsigned int retry_num = 50;
 	int ret;
 
 	do {
 		msleep(QCOM_PAS_DECRYPT_SHUTDOWN_DELAY_MS);
-		ret = qcom_pas_shutdown(pas->pas_id);
+		ret = qcom_pas_shutdown(pas_id);
 	} while (ret == -EINVAL && --retry_num);
 
 	return ret;
 }
 
+static void qcom_pas_release_firmware(struct qcom_pas *pas)
+{
+	if (pas->dtb_firmware) {
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
+	}
+
+	if (pas->secondary_firmware) {
+		release_firmware(pas->secondary_firmware);
+		pas->secondary_firmware = NULL;
+	}
+
+	if (pas->secondary_dtb_firmware) {
+		release_firmware(pas->secondary_dtb_firmware);
+		pas->secondary_dtb_firmware = NULL;
+	}
+}
+
 static int qcom_pas_unprepare(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -252,6 +288,10 @@ static int qcom_pas_unprepare(struct rproc *rproc)
 	qcom_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
 		qcom_pas_metadata_release(pas->dtb_pas_ctx);
+	if (pas->secondary_pas_id)
+		qcom_pas_metadata_release(pas->secondary_pas_ctx);
+	if (pas->secondary_dtb_pas_id)
+		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
 
 	return 0;
 }
@@ -269,19 +309,29 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	if (pas->lite_dtb_pas_id)
 		qcom_pas_shutdown(pas->lite_dtb_pas_id);
 
-	if (pas->dtb_pas_id) {
-		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
+	if (pas->secondary_dtb_pas_id) {
+		ret = request_firmware(&pas->secondary_dtb_firmware,
+				       pas->secondary_dtb_firmware_name, pas->dev);
 		if (ret) {
-			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
-				pas->dtb_firmware_name, ret);
+			qcom_pas_release_firmware(pas);
 			return ret;
 		}
+	}
 
-		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
-					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
+	if (pas->secondary_pas_id) {
+		ret = request_firmware(&pas->secondary_firmware,
+				       pas->secondary_firmware_name, pas->dev);
+		if (ret) {
+			qcom_pas_release_firmware(pas);
+			return ret;
+		}
+	}
+
+	if (pas->dtb_pas_id) {
+		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name,
+				       pas->dev);
 		if (ret) {
-			qcom_pas_metadata_release(pas->dtb_pas_ctx);
-			release_firmware(pas->dtb_firmware);
+			qcom_pas_release_firmware(pas);
 			return ret;
 		}
 	}
@@ -338,10 +388,51 @@ static int qcom_pas_start(struct rproc *rproc)
 			goto disable_cx_supply;
 	}
 
+	if (pas->secondary_dtb_pas_id) {
+		ret = qcom_mdt_pas_load(pas->secondary_dtb_pas_ctx,
+					pas->secondary_dtb_firmware,
+					pas->secondary_dtb_firmware_name,
+					&pas->secondary_dtb_mem_reloc);
+		if (ret)
+			goto release_secondary_dtb_metadata;
+
+		ret = qcom_pas_map_carveout(rproc, pas->secondary_dtb_mem_phys,
+					    pas->secondary_dtb_mem_size);
+		if (ret)
+			goto release_secondary_dtb_metadata;
+
+		ret = qcom_pas_prepare_and_auth_reset(pas->secondary_dtb_pas_ctx);
+		if (ret)
+			goto unmap_secondary_dtb_carveout;
+	}
+
+	if (pas->secondary_pas_id) {
+		ret = qcom_mdt_pas_load(pas->secondary_pas_ctx,
+					pas->secondary_firmware,
+					pas->secondary_firmware_name,
+					&pas->secondary_mem_reloc);
+		if (ret)
+			goto release_secondary_metadata;
+
+		ret = qcom_pas_map_carveout(rproc, pas->secondary_mem_phys,
+					    pas->secondary_mem_size);
+		if (ret)
+			goto release_secondary_metadata;
+
+		ret = qcom_pas_prepare_and_auth_reset(pas->secondary_pas_ctx);
+		if (ret)
+			goto unmap_secondary_carveout;
+	}
+
 	if (pas->dtb_pas_id) {
+		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
+					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
+		if (ret)
+			goto release_dtb_metadata;
+
 		ret = qcom_pas_map_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
 		if (ret)
-			goto disable_px_supply;
+			goto release_dtb_metadata;
 
 		ret = qcom_pas_prepare_and_auth_reset(pas->dtb_pas_ctx);
 		if (ret) {
@@ -372,13 +463,17 @@ static int qcom_pas_start(struct rproc *rproc)
 	ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
 	if (ret == -ETIMEDOUT) {
 		dev_err(pas->dev, "start timed out\n");
-		qcom_pas_shutdown(pas->pas_id);
 		goto unmap_carveout;
 	}
 
 	qcom_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
 		qcom_pas_metadata_release(pas->dtb_pas_ctx);
+	if (pas->secondary_pas_id)
+		qcom_pas_metadata_release(pas->secondary_pas_ctx);
+	if (pas->secondary_dtb_pas_id)
+		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
+	qcom_pas_release_firmware(pas);
 
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
@@ -386,16 +481,37 @@ static int qcom_pas_start(struct rproc *rproc)
 	return 0;
 
 unmap_carveout:
+	qcom_pas_shutdown(pas->pas_id);
 	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
 release_pas_metadata:
 	qcom_pas_metadata_release(pas->pas_ctx);
-	if (pas->dtb_pas_id)
-		qcom_pas_metadata_release(pas->dtb_pas_ctx);
-
 unmap_dtb_carveout:
+	if (pas->dtb_pas_id) {
+		qcom_pas_shutdown(pas->dtb_pas_id);
+		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys,
+					pas->dtb_mem_size);
+	}
+release_dtb_metadata:
 	if (pas->dtb_pas_id)
-		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
-disable_px_supply:
+		qcom_pas_metadata_release(pas->dtb_pas_ctx);
+unmap_secondary_carveout:
+	if (pas->secondary_pas_id) {
+		qcom_pas_shutdown(pas->secondary_pas_id);
+		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
+					pas->secondary_mem_size);
+	}
+release_secondary_metadata:
+	if (pas->secondary_pas_id)
+		qcom_pas_metadata_release(pas->secondary_pas_ctx);
+unmap_secondary_dtb_carveout:
+	if (pas->secondary_dtb_pas_id) {
+		qcom_pas_shutdown(pas->secondary_dtb_pas_id);
+		qcom_pas_unmap_carveout(rproc, pas->secondary_dtb_mem_phys,
+					pas->secondary_dtb_mem_size);
+	}
+release_secondary_dtb_metadata:
+	if (pas->secondary_dtb_pas_id)
+		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
 	if (pas->px_supply)
 		regulator_disable(pas->px_supply);
 disable_cx_supply:
@@ -409,6 +525,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	qcom_pas_pds_disable(pas, pas->proxy_pds, pas->proxy_pd_count);
 disable_irqs:
 	qcom_q6v5_unprepare(&pas->q6v5);
+	qcom_pas_release_firmware(pas);
 
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
@@ -440,9 +557,30 @@ static int qcom_pas_stop(struct rproc *rproc)
 	if (ret == -ETIMEDOUT)
 		dev_err(pas->dev, "timed out on wait\n");
 
+	if (pas->secondary_pas_id) {
+		ret = qcom_pas_shutdown(pas->secondary_pas_id);
+		if (ret && pas->decrypt_shutdown)
+			ret = qcom_pas_shutdown_poll_decrypt(pas->secondary_pas_id);
+		if (ret)
+			dev_err(pas->dev, "failed to shutdown secondary: %d\n", ret);
+
+		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
+					pas->secondary_mem_size);
+	}
+
+	if (pas->secondary_dtb_pas_id) {
+		ret = qcom_pas_shutdown(pas->secondary_dtb_pas_id);
+		if (ret)
+			dev_err(pas->dev,
+				"failed to shutdown secondary dtb: %d\n", ret);
+
+		qcom_pas_unmap_carveout(rproc, pas->secondary_dtb_mem_phys,
+					pas->secondary_dtb_mem_size);
+	}
+
 	ret = qcom_pas_shutdown(pas->pas_id);
 	if (ret && pas->decrypt_shutdown)
-		ret = qcom_pas_shutdown_poll_decrypt(pas);
+		ret = qcom_pas_shutdown_poll_decrypt(pas->pas_id);
 
 	if (ret)
 		dev_err(pas->dev, "failed to shutdown: %d\n", ret);
@@ -752,23 +890,59 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 	if (IS_ERR(pas->pas_ctx))
 		return PTR_ERR(pas->pas_ctx);
 
-	if (!pas->dtb_pas_id)
-		return 0;
+	if (pas->dtb_pas_id) {
+		ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 1, &res);
+		if (ret) {
+			dev_err(pas->dev, "unable to resolve dtb memory-region\n");
+			return ret;
+		}
 
-	ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 1, &res);
-	if (ret) {
-		dev_err(pas->dev, "unable to resolve dtb memory-region\n");
-		return ret;
+		pas->dtb_mem_phys = res.start;
+		pas->dtb_mem_reloc = res.start;
+		pas->dtb_mem_size = resource_size(&res);
+
+		pas->dtb_pas_ctx =
+			devm_qcom_pas_context_alloc(pas->dev, pas->dtb_pas_id,
+						    pas->dtb_mem_phys,
+						    pas->dtb_mem_size);
+		if (IS_ERR(pas->dtb_pas_ctx))
+			return PTR_ERR(pas->dtb_pas_ctx);
+	}
+
+	if (pas->secondary_pas_id) {
+		ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 2, &res);
+		if (ret)
+			return ret;
+
+		pas->secondary_mem_phys = res.start;
+		pas->secondary_mem_reloc = res.start;
+		pas->secondary_mem_size = resource_size(&res);
+
+		pas->secondary_pas_ctx =
+			devm_qcom_pas_context_alloc(pas->dev, pas->secondary_pas_id,
+						    pas->secondary_mem_phys,
+						    pas->secondary_mem_size);
+		if (IS_ERR(pas->secondary_pas_ctx))
+			return PTR_ERR(pas->secondary_pas_ctx);
 	}
 
-	pas->dtb_mem_phys = pas->dtb_mem_reloc = res.start;
-	pas->dtb_mem_size = resource_size(&res);
+	if (pas->secondary_dtb_pas_id) {
+		ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 3, &res);
+		if (ret)
+			return ret;
 
-	pas->dtb_pas_ctx = devm_qcom_pas_context_alloc(pas->dev, pas->dtb_pas_id,
-						       pas->dtb_mem_phys,
-						       pas->dtb_mem_size);
-	if (IS_ERR(pas->dtb_pas_ctx))
-		return PTR_ERR(pas->dtb_pas_ctx);
+		pas->secondary_dtb_mem_phys = res.start;
+		pas->secondary_dtb_mem_reloc = res.start;
+		pas->secondary_dtb_mem_size = resource_size(&res);
+
+		pas->secondary_dtb_pas_ctx =
+			devm_qcom_pas_context_alloc(pas->dev,
+						    pas->secondary_dtb_pas_id,
+						    pas->secondary_dtb_mem_phys,
+						    pas->secondary_dtb_mem_size);
+		if (IS_ERR(pas->secondary_dtb_pas_ctx))
+			return PTR_ERR(pas->secondary_dtb_pas_ctx);
+	}
 
 	return 0;
 }
@@ -910,6 +1084,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	struct rproc *rproc;
 	struct device_node *node;
 	const char *fw_name, *dtb_fw_name = NULL;
+	const char *secondary_fw_name = NULL;
+	const char *secondary_dtb_fw_name = NULL;
 	const struct rproc_ops *ops = &qcom_pas_ops;
 	int ret;
 
@@ -934,6 +1110,24 @@ static int qcom_pas_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	if (desc->secondary_firmware_name) {
+		secondary_fw_name = desc->secondary_firmware_name;
+		ret = of_property_read_string_index(pdev->dev.of_node,
+						    "firmware-name", 2,
+						    &secondary_fw_name);
+		if (ret < 0 && ret != -EINVAL)
+			return ret;
+	}
+
+	if (desc->secondary_dtb_firmware_name) {
+		secondary_dtb_fw_name = desc->secondary_dtb_firmware_name;
+		ret = of_property_read_string_index(pdev->dev.of_node,
+						    "firmware-name", 3,
+						    &secondary_dtb_fw_name);
+		if (ret < 0 && ret != -EINVAL)
+			return ret;
+	}
+
 	if (desc->minidump_id)
 		ops = &qcom_pas_minidump_ops;
 
@@ -967,6 +1161,14 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		pas->dtb_firmware_name = dtb_fw_name;
 		pas->dtb_pas_id = desc->dtb_pas_id;
 	}
+	if (secondary_fw_name) {
+		pas->secondary_firmware_name = secondary_fw_name;
+		pas->secondary_pas_id = desc->secondary_pas_id;
+	}
+	if (secondary_dtb_fw_name) {
+		pas->secondary_dtb_firmware_name = secondary_dtb_fw_name;
+		pas->secondary_dtb_pas_id = desc->secondary_dtb_pas_id;
+	}
 	platform_set_drvdata(pdev, pas);
 
 	ret = device_init_wakeup(pas->dev, true);
@@ -1022,6 +1224,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	pas->pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
 	if (pas->dtb_pas_id)
 		pas->dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
+	if (pas->secondary_pas_id)
+		pas->secondary_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
+	if (pas->secondary_dtb_pas_id)
+		pas->secondary_dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
 
 	if (desc->early_boot)
 		pas->rproc->state = RPROC_DETACHED;

-- 
2.34.1


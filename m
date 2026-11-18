Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016272;
	b=S4CZbAmJY1eYFUU8Y35soe5Bo8EonPU4MsZ0FgCaflgEPTwoo0MCFN8/PfFjHT0V/jX2
	 hStAAD7ZcmDYC5/jZryRU7PaLuUW0ee7MudCBybL+UFfMbE1VVSC/Z0MOAogk7mNz8mgx
	 2nGgTUQ7+jVvaRWPcf7rTu72yhKHKkXR9jWXknX1it2i8NDZpwNXJQVa0Q6nkhRdu1fww
	 VTHACzel39vsVoh+vrS30zbnwbH/RUxwdR+1nymC5GRcFMUej/6wpJG5dLILfenuUc+99
	 cExhF2iMctGmOcQN1AEyri/bWxcMrSJBaW+fziFgyXkaje9cfJAypavices/96rG+sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016272;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9yfAXI9ZHiGjOVlJPnrgg+c26E85mWDy6qSFoVi34c8=;
	b=5nI5RAEyBX5vzTrFLrvGI/UYgIzEbZg71jt+5UGPR+Vu25b3BTh0iGT7KEoPt9lIlfLJ
	 fl+QVx0uxFturzB5sCuqu1cZGJII7LQku+LiPAqxmEsSsFbBmFT8sw1EDocOcBxLNm3SH
	 nWgEZsUcpQofv8AGwSBpg0uCdoxNWBmgJdGK3jLajvtuamOmZ9V5rxF7PkIblhggZ31/m
	 liLuLAXtucL/j+/jMjoGD2NJqKJUqYaaNhBeH2vmlRQeEAjF9y3bXx0IcJd/LK1pC5n3F
	 Kd/mC8rFbtn0J6XBNpzxo5NOPapZkJbmA7B2dzMonZb4WsqmMXs2HuZNr1DXMDGvx9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TAlMXx8f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QavD0EfJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A86460A3824
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A86460A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TAlMXx8f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QavD0EfJ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQauF2227024
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9yfAXI9ZHiGjOVlJPnrgg+c26E85mWDy6qSFoVi34c8=; b=TAlMXx8fyeUI8gcV
	Pkp2uEag+UVj8tS0925hu4ClpKuFeAe1vktEmX1FXnVSscjJDU1LtaQI9t6L0mst
	cgk7yOg9iasZD1EQBgogFzoPmDUMRP7vTDg59O3ddgqjR6fCytbXbCcjPLIa8FfJ
	t4QPLB5PqLU/qRJcPpTnIK/ufjlS9rVN8WqZSDAzdeToYCszHLocayhFC0xnq+kT
	wsoLdI6JNNAfFBheCsIDPonFyaojCRDZHN0+/yjXciGTiqgJ6/Ip1rkydo2aC10r
	OcdHltlegi3oJ9bP1pEKVBPawdSfyxtN8xjHYPFSHue1F/QHrXJYKVIUrwwM7tr+
	cxi6vw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvbbr0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:37:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b937ecbb4so19128926d6.2
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795016270; x=1795621070; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9yfAXI9ZHiGjOVlJPnrgg+c26E85mWDy6qSFoVi34c8=;
        b=QavD0EfJ/QNzhJnspSBWpWzZ1h8zUqo3eViosPuRcvKxssjMu4qcFNWWUbLU02vXYB
         UslqEsQXXYchDJNVAI347QUtMEnwhOn5kCXZaZM1sNUaPsqGt4k7HKzHCsOGhOG/R5S3
         s3XWmRlU6RXzCOoJu8J4tTYcwQJhxtAr8k6JNwEo2nMBZxCuMzr4hA467u5rv5qPb1Oa
         G7LWCbrZDFj+rbGMkMyyHh1rQdiHx7+dxazVBRsl8cKBiuMZTymBOPrinH2diHhRRBm1
         DN0rb+MxvBCOo13xepgfZcbAHoFtHwgO53aFjLyHKSopPacFmJ2wDyGHE/sqHgDmygol
         RMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016270; x=1795621070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9yfAXI9ZHiGjOVlJPnrgg+c26E85mWDy6qSFoVi34c8=;
        b=bKe+2ggPnBR+51XS+XMz0hCfmmucHOl0oTTeSawM+UOQRvbg3l0RWQ3Tv9QiyE7iQn
         VzGSu+1BHstc+MawSsTwWYfJHoZNsNUpQoOYcgXTPbesCECXPAz2JONCx3TgTFHSpt8c
         VmttRZHH+IRIPx7DoceWevXwZxOsybL0yyvM31O85qoQh+FnlXgdAfxjA/2EtrLutITQ
         v3YezEnbQtI5t5B3NWXpqgpCG81yCGZeDxfXctaBFfNhTvM9fs5g405AuGQWRgyru2NO
         OOa1gEs5EsoZZynGxieCpzJhwNwSWOot33l4cYaWINArJv8LG67qr3qL7vgsGoPdMrpj
         Of0g==
X-Forwarded-Encrypted: i=1; AL+hErETXQ7UhGQsgzrrS2FfkeEOHcnsftjJTZPmZzSq9BtYdR30mLWMp87D23RImPBLoDyVM8M10gKaiya1@vger.kernel.org
X-Gm-Message-State: APuU4Z+CzWk0UG40/1mszMAY/XZNkWUdxIvSbfPfzDDaHzSNzm3AXc00
	o5hU9AOFIPhgzT2Ch+3Q8h1C3/NFCkkfe0vonXZ/6DKwKbOpLWJ6PFou+5Y4yswuvRsbBi4hGXW
	xm3uyypKg7T1p5jpD2BfL+LLRZcBkedX6fAGDZ2wePZkmmrr6XsCiUIriPHGFeUwe
X-Gm-Gg: AZFdTZdeVCKwlk+TXxkvrQBI7rVXhJ+Qhs3q6yIIqUlZrd8lnLuqGKY6qKKsl9tXQSb
	lSq/MEP0NXkYu2mgptqXPdQ8P6oa7AkUldpxqJbLVHmNzBu3LTGWb75nwrxnBSHD7wUhf2Yx3OC
	D4ydJDDoORz+w1Zh8d2oE7b9oKCa+7ycS/IVDz0vnE3U0Dv42JFOePV1KYdqH1tEyvO3b1226FI
	OreSC4eosVHIpwFTmNc83zDGSxReKyM5vNcITgJCkScPSFDyfcEp4ycstUZiAWA5FhaVQ2J8yYy
	hrLMzYrmp8vcIhIKkMsBTw/tA5C2t1MWQFq69W3I1nqnGh9hSEJ1b/vXuY0YdQXQyknxw4LLjfo
	FMToMFjxLdwUI3xC0oWVGCEHMoQcOYgrezkZTDs5uZHgfIL6s3VbclL5PtTs7nmMkyQspoGk/49
	DLRLuvAbp3+K3ZTNfBE90DHULgxYwI+N0r/jt9RyOA34Vzh4rA0CwrB20UM8TZ
X-Received: by 2002:a05:6214:dad:b0:91c:9316:f4e8 with SMTP id 6a1803df08f44-92114fce29fmr47205856d6.54.1795016269462;
        Wed, 18 Nov 2026 07:37:49 -0800 (PST)
X-Received: by 2002:a05:6214:dad:b0:91c:9316:f4e8 with SMTP id 6a1803df08f44-92114fce29fmr47205496d6.54.1795016268991;
        Wed, 18 Nov 2026 07:37:48 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d0d879sm24569676d6.12.2026.11.18.07.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:37:48 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 21:06:44 +0530
Subject: [PATCH v3 3/4] remoteproc: qcom: pas: Add coredump support for
 secondary processors
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
Message-Id: <20261118-oob-support-glymur-v3-3-2cbdfe208d56@oss.qualcomm.com>
References: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
In-Reply-To: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jain P <anvesh.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795016249; l=4291;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=K7KpaJu8onPI/TVsGb12hZ6xHYnYsgIRaY8Y8Ezs6p0=;
 b=Y2HVqk9hjnAIIp2PJC7vBF5xlkdMjjbRN9pmbPPnesyzXOkWBr9bz8z/kloCXVFKy6KxVj3hL
 uaewGRPX2vOAkZrma/lyCcQpIBmVJKspyRTZNB73JZkL7B2uuArKRVv
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: IuWpOFFrW7JAM31_TgHe_Ij07s3WQLE3
X-Proofpoint-ORIG-GUID: IuWpOFFrW7JAM31_TgHe_Ij07s3WQLE3
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afdc64e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=0YpHyUaMQROqBQU0yscA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfX4dw+KzHCgcJR
 JPKX15QQTnOsqoQGBYnYz5MxJI0q8yyhS7WHKBfGuAbBgW9fsxzkANgo+1Ul7OLue5woJXsBI4H
 b07eRlRC4pRhZaDNUmLRDf/0JjOgmE8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MiBTYWx0ZWRfX6arCxHLaEgYe
 zUsqm7ewmy7dk+Nh0IJFEwwM+7zuhxyF1fjYWAg5W5zNXjqJy0oFH+9R2BOBHAf01p3X80blKQM
 Guee3dmuk5M4vZXOq355/4v1aRq8aqjCfUgipsNKyqwM11GH5znoyWViNVDfPXZlkXQoaLCANbi
 Nax0zLj/ru3FlJtpaXaDAsmigyY2o0iHvJGYWpTu/2+SxGGh7IrGYa53XSFQPRuSNJ5aGs/pTwW
 QEAKUw+uw0LhYIRVhfiMeon0f9OhAIoh8Ov8Uy4ePyFCeKdWlcGQY0T+879MN6Yio/w9ScwIKOW
 8UCrx9JxgeKxYmbqCEyf4du86r4/gZNdPjxUSj0B5aH267JWfPVR2ElLa7ypmUkDl4D41MZbmbM
 6/9QbOckZjOvKtqrDFgfNM8fwFWRWPSdNuWyYnW9NG7CpmE7FKMmGZ8ghZ48ZF6QCtlBNmT6w8x
 ZnVOTx9kEljq34aCC0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180062

Add coredump support for PAS remoteproc instances with a secondary
processor by registering dump segments for both PAS firmware images and
temporarily mapping their carveouts during collection. This is for debug
dump collection and does not provide operational device recovery.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 67 +++++++++++++++++++++++++++++++++++---
 1 file changed, 62 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 1c8c0c22c34d..a167bd6072c9 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -138,6 +138,7 @@ struct qcom_pas {
 	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
 
 	void __iomem *mem_region;
+	void __iomem *secondary_mem_region;
 
 	size_t mem_size;
 	size_t dtb_mem_size;
@@ -185,6 +186,11 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
 	memcpy_fromio(dest, pas->mem_region + total_offset, size);
 }
 
+static bool qcom_pas_has_secondary(const struct qcom_pas *pas)
+{
+	return pas->secondary_pas_id && pas->secondary_dtb_pas_id;
+}
+
 static void qcom_pas_minidump(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -336,6 +342,17 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 		}
 	}
 
+	if (pas->secondary_pas_id) {
+		ret = qcom_register_dump_segments(rproc, pas->secondary_firmware);
+		if (ret) {
+			dev_err(pas->dev,
+				"failed to register secondary dump segments: %d\n", ret);
+			rproc_coredump_cleanup(rproc);
+			qcom_pas_release_firmware(pas);
+			return ret;
+		}
+	}
+
 	return 0;
 }
 
@@ -611,16 +628,38 @@ static int qcom_pas_stop(struct rproc *rproc)
 static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_pas *pas = rproc->priv;
-	int offset;
+	phys_addr_t base;
+	void __iomem *region;
+
+	if (da >= pas->mem_reloc && len <= pas->mem_size &&
+	    da - pas->mem_reloc <= pas->mem_size - len) {
+		base = pas->mem_reloc;
+		region = pas->mem_region;
+	} else if (da >= pas->mem_phys && len <= pas->mem_size &&
+		   da - pas->mem_phys <= pas->mem_size - len) {
+		base = pas->mem_phys;
+		region = pas->mem_region;
+	} else if (da >= pas->secondary_mem_reloc &&
+		   len <= pas->secondary_mem_size &&
+		   da - pas->secondary_mem_reloc <= pas->secondary_mem_size - len) {
+		base = pas->secondary_mem_reloc;
+		region = pas->secondary_mem_region;
+	} else if (da >= pas->secondary_mem_phys &&
+		   len <= pas->secondary_mem_size &&
+		   da - pas->secondary_mem_phys <= pas->secondary_mem_size - len) {
+		base = pas->secondary_mem_phys;
+		region = pas->secondary_mem_region;
+	} else {
+		return NULL;
+	}
 
-	offset = da - pas->mem_reloc;
-	if (offset < 0 || offset + len > pas->mem_size)
+	if (!region)
 		return NULL;
 
 	if (is_iomem)
 		*is_iomem = true;
 
-	return (__force void *)pas->mem_region + offset;
+	return (__force void *)region + (da - base);
 }
 
 static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
@@ -748,11 +787,28 @@ static void qcom_pas_coredump(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
 
-	pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
+	if (list_empty(&rproc->dump_segments))
+		return;
+
+	if (!pas->mem_region)
+		pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
 	if (!pas->mem_region)
 		return;
 
+	if (qcom_pas_has_secondary(pas) && !pas->secondary_mem_region) {
+		pas->secondary_mem_region =
+			qcom_pas_ctx_map(pas->secondary_pas_ctx);
+		if (!pas->secondary_mem_region)
+			dev_err(pas->dev, "unable to map secondary memory for coredump\n");
+	}
+
 	rproc_coredump(rproc);
+
+	if (pas->secondary_mem_region) {
+		iounmap(pas->secondary_mem_region);
+		pas->secondary_mem_region = NULL;
+	}
+
 	iounmap(pas->mem_region);
 	pas->mem_region = NULL;
 }
@@ -1276,6 +1332,7 @@ static void qcom_pas_remove(struct platform_device *pdev)
 		of_platform_device_destroy(&pas->bam_dmux->dev, NULL);
 
 	rproc_del(pas->rproc);
+	rproc_coredump_cleanup(pas->rproc);
 
 	if (pas->tmd_inst)
 		qmi_tmd_exit(pas->tmd_inst);

-- 
2.34.1


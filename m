Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E633DA7F3
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 05:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792043803; cv=none; b=tURoiqQCv4+JtP7XLloKUHZ5SdAlOjVhGo4XfTZXEDLpukIpM2qjOTVu8HwN5eo9TevfrLFZudLIlNjNSzTzMSb4GQwF4aVvKUSWANr1AYh11SUhKl4s/f6YVaqUiIJFb/AJrgOaaiEwCCD0jxuqFwlv4ygQi2DkBKT7vTberrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792043803; c=relaxed/simple;
	bh=Uju09DfXQ3q/uOvmAij95aY3BQCzb9jjR/bvJJeHH+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hyYTLvymFzgJt3y452I+xb3ctJIbf7Lxl4DtMWPOG+1+P/u4HxaZj5LeJ+AIhh7R1cDEVwQOxJ9SB5fZK5cK5Z+K6ztaDk/tSTx305cr2E5Vua2aqVU3BNTjUN+7D640CbO/wwITbhlWpwGCowlh/19PrGvUtNOlPGe7yAe4Fuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FTXtroHg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YcUpupMj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FTXtroHg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YcUpupMj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EMXfe1644694
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 05:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/e7mBS9wRW6SLFwLnnEtwIIq5+gTTwqbqv3dUCfQniA=; b=FTXtroHgMZsH3Ljo
	P6LeJftIhW8IOI00/F8eJGKWN6mg9xmkmwLkpBmYKnX/7sRu1t7e3lnYDW0rrUZa
	gj5U230y+uUyCY7fHqDXQdZOLnrxjSNkynqZyh5JKVabWtjyxnGgrfxL5xmH+ZhC
	lXPdzrS9gaoSQL5/tUDKi5OyNSgCZNnv/7t361DOlbitUctC4Xv/MEjlNs5q5CFe
	Li+xtqF8tNTj3PBqviaGfjX8xFLJghZ7Ytbvok4HOH4qJoDJVFhHaTKM37sQXx2C
	5udFtVVujyrghJoxWmi2R0t5DrW8V2+hLWb8gO1Zgt7+dZvTpT/rBYQDsM/AvKEy
	MmgEaA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmy9bg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 05:56:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso10259190eec.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 22:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792043799; x=1792648599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/e7mBS9wRW6SLFwLnnEtwIIq5+gTTwqbqv3dUCfQniA=;
        b=YcUpupMjJyKXFVVpYbi4JPDkz3RLNo0WHIOfdtEcyEhcEJyWQJds4bSF2Oc63PdTLk
         Gt9MKkC6de1wDuquppXPcjvGbvWr0h34vjvCvtyouLq0jFmoxxUsMNi3UHDeqOF7ii8y
         K0/8eafHyEjLz8SBEGoL3D3pi70U0Y/MLZN/H0+AdrZ3X1I3Q6dhdudCuCWIaoDg0Csc
         +R9uFrvK3kka+dYmUnHmZzVTHE0ZNMr0QKHDtAEyO7eViBA1hCfN/ZNftBq1Q/RK5bYk
         plDhTlrlYMb+D9xtV9+OLoPEI4KsVed1AjD4Ja4lAfkPNOJ+8xP4mteuiwlxweLN6Ze6
         m7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043799; x=1792648599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/e7mBS9wRW6SLFwLnnEtwIIq5+gTTwqbqv3dUCfQniA=;
        b=fuQXzcl/uh5/mFL/bx8l95rayhZg4FrIODXvC71fkOdoBRJ6YB+O7P1ZCPtXGzhjgW
         rWI4eVIy30BdOYzJGvDC8FyAkh1n1K4d6yMKLaMbr33+peyjp2sWMYJMQsm/SDD3t8Q3
         r1Ybr9aTO2+tWQqxirvopZDHVQOULVOQxB3HmJPrUVyKkdCVYqjvrGJlIk/F9uVK4kdH
         L4oneaCZj7F1ZosOW9J2PpI+jDyonfjcKCgLyvje8YYBpSqAlXJkAge68wsTEDk+Pvky
         mCWWzjE+PbcBoq/9e10Gwj5qB5VpX8lNqnMoUXDhGOxhYpPeFfPJGV9SMdo8hzm3fkN/
         5pLA==
X-Forwarded-Encrypted: i=1; AKwUvBzwec/HM2LjKdStHYOLFjhMSTutO3wijYsp5BAGdJsNjuvk10+MW21psVmU+9SY/6nVhkkCrCuX9aWC@vger.kernel.org
X-Gm-Message-State: AFq9FYJZLzLBJkTdjWFqwtk/Y5WHqQ1cO+iZS5SMDF7jizV2My+s0L1j
	g4KuLpP397xBpadK377xoOoXjptA17KyTLTNPByG6IvxNZXN8NmNfZCmST7uscWAMUpdILCkhgs
	UrCGMjbhDzIBOpzz8hxPm60IKPlf32u/9SqK52GGdNRfRXvvBq+aaEIkc9rcRbzPj
X-Gm-Gg: AYBFou2ThdT2fv1g3hzTJfGRDgaXBo/t3twDr/IYRV1g0IQfI6uDr8hvTWw4cU8tXra
	2vSkwsF1X/qcx61QNGSKfBPOkMTL2VXILrYlY0YRj0fq0XyqxbobrhHid+B9IO3xRY/vvzs7qFO
	OW0FhTD7/zmxORpu+Xxp11nVkNZTFuo7MU7ExH7qF89BoKd1+7i5plm+a/0lFNv08YkH3mSvzd5
	G1WjY2lklk/p+Ikl4gvZPJSIlVMVItBdZxfgJYt9RwIfAiEEKoJru1encJAlOlfyrTIYOTX/Drh
	oetVihOxMbpSXjdvoFOBBhZDE5/OGGiSgXW0USbUahXuPjMPUyxlrlEP5hVhXKTZaR9OZ9XXc+n
	l/aNm2tw8g4lITT1JGC3/LHSwWfRMWvgs7wOYJYuBb4EjwpkaCEKqSz494D0qb/M7kFPDctYGwF
	NvAtoh4Xhp++I=
X-Received: by 2002:a05:7300:828a:b0:34c:d1f2:b552 with SMTP id 5a478bee46e88-3537dedaa87mr23106337eec.4.1792043799105;
        Wed, 14 Oct 2026 22:56:39 -0700 (PDT)
X-Received: by 2002:a05:7300:828a:b0:34c:d1f2:b552 with SMTP id 5a478bee46e88-3537dedaa87mr23106298eec.4.1792043798334;
        Wed, 14 Oct 2026 22:56:38 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm64791975eec.0.2026.10.14.22.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:56:37 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:25:50 +0530
Subject: [PATCH v2 2/4] remoteproc: qcom: pas: Support secondary images
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-oob-support-glymur-v2-2-715435f52dd7@oss.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
In-Reply-To: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792043784; l=14675;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=Uju09DfXQ3q/uOvmAij95aY3BQCzb9jjR/bvJJeHH+s=;
 b=3F8bmffeDOGMOnktvwoEpzcK8VeNI6B3JfCX+6RSmskqPmRF7yMseH6Nla86B4Enqy7Zc6Mla
 6Iyrrtjxn3xDGPwQvUPt12MUM/R2MuTgC6nLZWKTwU0ZTEceyHnKPAf
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: tfy3PjyO606yBsgEIqCPQEaRfVrwkKqs
X-Proofpoint-ORIG-GUID: tfy3PjyO606yBsgEIqCPQEaRfVrwkKqs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfXzaQarCNTJIwu
 lWvSgczPvXQkSHyZpSqto0JgNq6RvKMQieUduXf5OqRElz92wBhLjqrTF7Tpx0mkM+R43kdRDwY
 zFrAIXuAzcGdGd2EDMqZ9i0i2mO3YNU=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad06b17 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=WQtI_U3e13HlgX_oKn0A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX2d3tUBw6odQG
 Wr1dEqYMnkkk1QBQNB1mJYo2Wg31fmDiobeHakzAya0Mij5w5EY7v7lEsdJIVzwyy6RLU3kZiky
 ynk+k6gwebfQi48UZpRS72qjlGNKvWkdbD/I1y/Rb/dGMx/Fdk010PgCU9ZoYd9Gl5aAfcgVb/6
 s5rvUnBCm0O5osbMRLarlV7OD/89GybYgKpV8ZT2ZD1E0VcmxJFNJdJOd+YSnoi+TMt0pgj69dS
 uhXe5m7oSfz97jywC10ANmcxPgdaa9OFm9/dZKTVFEhbNE+oVWe39AcBIF4I+w094rYbTn/ojSq
 nn9c13/Kr4Z6AlXrpOM6LPoQJEOf789QOD5IIPBGi0RunstThTIcRUzn7qKEQUjv4AF2L47nmmK
 dQbxUn8cx/jN7lC/aXtDrZ+FTNHVGyndcZYucP1L/Q8RiP1W9k/KRHwQ+Fy815K+q1KOx+UaqoS
 WI53M6eFidZXGKbkBCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150023

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

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 240 ++++++++++++++++++++++++++++++++++---
 1 file changed, 222 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ca8e61254c44..0bce2f0d5b4a 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -42,8 +42,12 @@ struct qcom_pas_data {
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
@@ -83,8 +87,12 @@ struct qcom_pas {
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
@@ -95,17 +103,25 @@ struct qcom_pas {
 
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
@@ -123,6 +139,8 @@ struct qcom_pas {
 
 	struct qcom_pas_context *pas_ctx;
 	struct qcom_pas_context *dtb_pas_ctx;
+	struct qcom_pas_context *secondary_pas_ctx;
+	struct qcom_pas_context *secondary_dtb_pas_ctx;
 };
 
 static void qcom_pas_segment_dump(struct rproc *rproc,
@@ -198,19 +216,37 @@ static void qcom_pas_pds_disable(struct qcom_pas *pas, struct device **pds,
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
@@ -224,6 +260,10 @@ static int qcom_pas_unprepare(struct rproc *rproc)
 	qcom_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
 		qcom_pas_metadata_release(pas->dtb_pas_ctx);
+	if (pas->secondary_pas_id)
+		qcom_pas_metadata_release(pas->secondary_pas_ctx);
+	if (pas->secondary_dtb_pas_id)
+		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
 
 	return 0;
 }
@@ -241,19 +281,29 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	if (pas->lite_dtb_pas_id)
 		qcom_pas_shutdown(pas->lite_dtb_pas_id);
 
-	if (pas->dtb_pas_id) {
-		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
+	if (pas->secondary_dtb_pas_id) {
+		ret = request_firmware(&pas->secondary_dtb_firmware,
+				       pas->secondary_dtb_firmware_name, pas->dev);
+		if (ret) {
+			qcom_pas_release_firmware(pas);
+			return ret;
+		}
+	}
+
+	if (pas->secondary_pas_id) {
+		ret = request_firmware(&pas->secondary_firmware,
+				       pas->secondary_firmware_name, pas->dev);
 		if (ret) {
-			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
-				pas->dtb_firmware_name, ret);
+			qcom_pas_release_firmware(pas);
 			return ret;
 		}
+	}
 
-		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
-					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
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
@@ -310,10 +360,51 @@ static int qcom_pas_start(struct rproc *rproc)
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
@@ -344,13 +435,16 @@ static int qcom_pas_start(struct rproc *rproc)
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
 
 	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
 	pas->firmware = NULL;
@@ -358,16 +452,37 @@ static int qcom_pas_start(struct rproc *rproc)
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
@@ -413,7 +528,7 @@ static int qcom_pas_stop(struct rproc *rproc)
 
 	ret = qcom_pas_shutdown(pas->pas_id);
 	if (ret && pas->decrypt_shutdown)
-		ret = qcom_pas_shutdown_poll_decrypt(pas);
+		ret = qcom_pas_shutdown_poll_decrypt(pas->pas_id);
 
 	if (ret)
 		dev_err(pas->dev, "failed to shutdown: %d\n", ret);
@@ -426,6 +541,27 @@ static int qcom_pas_stop(struct rproc *rproc)
 		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
 	}
 
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
 	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
 
 	handover = qcom_q6v5_unprepare(&pas->q6v5);
@@ -740,6 +876,42 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 	if (IS_ERR(pas->dtb_pas_ctx))
 		return PTR_ERR(pas->dtb_pas_ctx);
 
+	if (!pas->secondary_pas_id)
+		return 0;
+
+	ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 2, &res);
+	if (ret)
+		return ret;
+
+	pas->secondary_mem_phys = res.start;
+	pas->secondary_mem_reloc = res.start;
+	pas->secondary_mem_size = resource_size(&res);
+
+	pas->secondary_pas_ctx =
+		devm_qcom_pas_context_alloc(pas->dev, pas->secondary_pas_id,
+					    pas->secondary_mem_phys,
+					    pas->secondary_mem_size);
+	if (IS_ERR(pas->secondary_pas_ctx))
+		return PTR_ERR(pas->secondary_pas_ctx);
+
+	if (!pas->secondary_dtb_pas_id)
+		return 0;
+
+	ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 3, &res);
+	if (ret)
+		return ret;
+
+	pas->secondary_dtb_mem_phys = res.start;
+	pas->secondary_dtb_mem_reloc = res.start;
+	pas->secondary_dtb_mem_size = resource_size(&res);
+
+	pas->secondary_dtb_pas_ctx =
+		devm_qcom_pas_context_alloc(pas->dev, pas->secondary_dtb_pas_id,
+					    pas->secondary_dtb_mem_phys,
+					    pas->secondary_dtb_mem_size);
+	if (IS_ERR(pas->secondary_dtb_pas_ctx))
+		return PTR_ERR(pas->secondary_dtb_pas_ctx);
+
 	return 0;
 }
 
@@ -823,6 +995,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	struct rproc *rproc;
 	struct device_node *node;
 	const char *fw_name, *dtb_fw_name = NULL;
+	const char *secondary_fw_name = NULL;
+	const char *secondary_dtb_fw_name = NULL;
 	const struct rproc_ops *ops = &qcom_pas_ops;
 	int ret;
 
@@ -847,6 +1021,24 @@ static int qcom_pas_probe(struct platform_device *pdev)
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
 
@@ -879,6 +1071,14 @@ static int qcom_pas_probe(struct platform_device *pdev)
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
@@ -925,6 +1125,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
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


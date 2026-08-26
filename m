Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3254302FA
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752002; cv=none; b=rT18X3N/MwiTZgkSUEfhVm6agmij4kP8xn+ZV3kxLeJ0W75FbyhoBRv9S420OHUe2BrR/9jDSBu5FOs+nPLD71DLNrr1OjLJI9pCvG6P2NikY23OIJi/3TtGVYiWL3qyEaGrCkxHkaM72F04vw+rUPAu66z8MBnceRsi133UlIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752002; c=relaxed/simple;
	bh=7DmLl0ksHTt+4g/zhx1HwQyTDE+jC4CaVjooDl20Glc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RbBQJtMdHR+Zx0dECNCecG4i/CuDHotUfqtqNZsDeCZQNd9KrT9BX79LyaHr5qqO5v1eRwaiODO4vkAfcuXZKeSo6q8khFpf5HEtUZt7eseNaGSA8fo4prjh01Z8fYKErNa0AO6FuU7wY5cEKPvFoFO+ukfGLXn3sBSBVtVU75Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtdrn14t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FiFSvxlp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mtdrn14t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FiFSvxlp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCCEuG1223044
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zjJpwZr0X/rEPVNLxx/hrvAZWJJ6N6W56ZMy3AjrV+c=; b=mtdrn14tf6yVUBdZ
	16DFhyOeDo7Z1akK/FUPqYuJjVMlGL3K/RKjy3OsPp+PhpuPAsrhM9QxokOZkDr/
	FkXXk5ZGHK1aUI+6/IZjZWbzDI2zmRWTJOF9LrGUHhlEZgi6iNOGsZidWB0wb8MN
	NHJUAnsRvfjwJIGzpZgFbgJvrZIbNnEsjXhs41xdYYTbK5k2812y64G27FVD7xlY
	Bj2nLPnKCbKU9iwvADYBkYcDq0+eKk9/B/5KhZ0NCCHQTWHRbILNIRsu4Sa9FpAc
	TK+VV9/O6Qof2sqpqg2YaRjRkzNEiYs+XBtpHQz0jWjYgdjOLRKJfwYrZwH8dakV
	rBwP+Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1gjb0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 13:46:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1587244a91.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 06:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787751994; x=1788356794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjJpwZr0X/rEPVNLxx/hrvAZWJJ6N6W56ZMy3AjrV+c=;
        b=FiFSvxlpU+BPIxohIiknb69fM5Nj7qZLf4U862k8IC+0Pqk9EEYQAp503ef4z+rvGL
         ctDvISspe1n7W3LGuyLJ2KLn42p0i/RwikLmu0okSqFX1XDkm5pMmfXhtkaedcK67M17
         Qd92bbKxSZWQ1QsAGnBUflnsEKdnUiKhuVvgBNGMu5OIxeGYXx24RXX6fQ+eqNWeuSO+
         5eTL5euYjYYoJLz1Qptp7i85KLpBXq2MXlkn3azWzhhRygd0/ZyIL7ZFmlTndpj6kecY
         z6sTTfY4b5/MbGW9A6yRIcpi9FOTIbFxfMLVgsj6kY662Bnq8qTLmDEnjK77tUCSdLoN
         ieuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751994; x=1788356794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjJpwZr0X/rEPVNLxx/hrvAZWJJ6N6W56ZMy3AjrV+c=;
        b=WqS2Q9zPbzQAt/7vS3LJqADe++AMY6b9JVW/J1uJLYKD42yXNi6NZFH27V3hSdpmVe
         PWTjRE2jeQMjzan4ZRuLcS1IsPbUt+38kH+H6Ktj697MjICwrmwNN8o3tnBQfOCGEYoT
         dDEj6E0FS4jbCsK1chh4bSEujRmeghCNJ0c6p8+E5Zq2vLLcyOIN9lX2R+0hft9cLO/K
         DZYbyTwg4J73aV2C02KdYgk+Y4LaHluXwTLLUD+wagc9dnpdl1aUH2/O14bUP+dMmmQ/
         GhwEuMkic8h/MO6q+JOpm0ulGRyjD/8+JyLNw5a5RQ1WhpN7QXmxj7iA5ayzf9QLXPfk
         TU/g==
X-Forwarded-Encrypted: i=1; AHgh+Ro6cviPneSzoV3wk8+PlNj4Piu2F9Ry62umC0Omi76ecWC1Ti2qYh6PIpcQ1311qAujsKNPvGodeYDt@vger.kernel.org
X-Gm-Message-State: AFuF++l1yeyd/iYvdRg9ldMy6LvlWYvKmIndCSw18X9uZwb+KYTbRiWP
	w5agfP43grg5ja5GiOAjEquL7JeYdwgoumLlqNp8XUWofzfFd4D65EHs1M+DNSjkpxOyxndmWs9
	Tmph/MYRcpQG2B9Fmopmtsz+2O+RaZlDJnD44lLrv39t8AWJY4UpRc5c9fupV2lSL
X-Gm-Gg: AR+sD129r/PPAILtg3tEuwPlP8r8feW4/brRVVxoRveWmzoxSe4Dh6MRYMa9GjGY2iF
	66h44pUygPN1/NOZwgFO5vIjsaG7MHDd6FAOWL/AGePhMbg0dd8mGy6ENuNVIEItta4su2jIdZB
	2dnK5FruCNbmiemo2naQWfP269BvxFIlwYqxOD/Bi3QJWXWQUuUM86nFY5ogLukAZfRqNLiqip1
	626XrA79+H/hKJtqPAP29NaVBM7ZTCTMxJa4TubG0x37Qj5lPMnWLO7CygbaQTg+BZBk1vTgLK2
	gp5lBCDkRu410f1KJBIV0Li9wGfZHPoZWBpthQNloTmPdc49LznWkwZn+CfhApQxQps+ZyZlfy0
	HLkeJZ1jLFr2l3q2Mg2L3umaCKPwr8zJc9w==
X-Received: by 2002:a17:90b:5890:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-3966d83231cmr15765861a91.13.1787751991813;
        Wed, 26 Aug 2026 06:46:31 -0700 (PDT)
X-Received: by 2002:a17:90b:5890:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-3966d83231cmr15764798a91.13.1787751984994;
        Wed, 26 Aug 2026 06:46:24 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b64c48sm8179696a91.8.2026.08.26.06.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:46:24 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 19:15:47 +0530
Subject: [PATCH 5/6] misc: fastrpc: Add extended context bank support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-extended-mapping-v1-5-d046c1cb9a9f@oss.qualcomm.com>
References: <20260826-extended-mapping-v1-0-d046c1cb9a9f@oss.qualcomm.com>
In-Reply-To: <20260826-extended-mapping-v1-0-d046c1cb9a9f@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787751952; l=3115;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=7DmLl0ksHTt+4g/zhx1HwQyTDE+jC4CaVjooDl20Glc=;
 b=eLDthfmrsR+fwIgIfMaggDJuyvAv2B3Y2sgoB+KV+fWPIJ17X/egI/M/27Yhh4jZRbxxJv4cW
 92npmr17qpeAtMfX7EI+2EoGiTEDIS5HlO6ZpeqWRzQj4FbF73KVslN
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: 80opPwVFY6RzuYu76bDYA_keGxfln7KR
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8eee3b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=K--tOdr6QUUB7xZ2f28A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExNCBTYWx0ZWRfX/ksdpiBttVeg
 Blli4dKSxwgivA7q5qwXNw74Kckq34KP7LxkxmLHmJRvB5uumC9Y+F5Z/TPPDq8NKWwLVvnuylW
 txH0NC7GQ1TL/jLQVfrHAnp80BL0bEg=
X-Proofpoint-ORIG-GUID: 80opPwVFY6RzuYu76bDYA_keGxfln7KR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExNCBTYWx0ZWRfXwhcLG+KfZG7u
 AlCMp2GULzndLRmL+xA21wdHom+ee1+879Ewaas01pPeiKLDZmoO8WUaKKaxsSxG7tWQ4r3SG+k
 stRZ3pcNndhMU6adxiN039I5qpLyQq+2mIZXJmuQ0DoWwfUNSZYfWDj4tsQrHcbF17kX+nJe14H
 mjlRbNnsEar6EKmGCcNN/Ly7LLNmw65vKVZgTCmvnk9ONtKuXCvIPoGPuDtbRHpg0F1zaEYqKE1
 JykwCR7kjUx4o2t7A/HCQoZ4UTZPfU0wcMVY/HPhpXuuCDtSarw9YVHckbmfwmqrhC/PmqYZ+UM
 hDQzXfoE3AwNTyoQwQ2DQp8mTMwhbL3DWP/OVoixiKtqU/Nqfsz3CYa/z09HcY5xaNg/Muv0F49
 OGRosI5Vmp+NDBRz0GuLAvqlf9UuNoLrrBCNEa9Gu5HMFLWWCcJO1CGr+2eHlNWGGYWhF9ymzTR
 oPkWOGzJMNUg4AvzxRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260114

Extended context banks carry a 40-bit DMA mask and are shared across all
open sessions rather than exclusively owned by one. They are a
fundamentally different resource from normal CBs and do not belong in
the session[] pool.

Maintain a separate dynamically allocated cctx->ext_cb[] array instead.
Extended CBs are detected at probe time by the presence of a
memory-region phandle and routed there, leaving session[] and the normal
allocation path unchanged.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 07a0f2b229b4..28d89fd9cbbc 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -309,6 +309,8 @@ struct fastrpc_channel_ctx {
 	struct qcom_scm_vmperm vmperms[FASTRPC_MAX_VMIDS];
 	struct rpmsg_device *rpdev;
 	struct fastrpc_session_ctx session[FASTRPC_MAX_SESSIONS];
+	struct fastrpc_session_ctx **ext_cb;
+	int ext_cb_count;
 	spinlock_t lock;
 	struct idr ctx_idr;
 	struct list_head users;
@@ -536,9 +538,13 @@ static int fastrpc_remote_heap_alloc(struct fastrpc_user *fl, struct device *dev
 static void fastrpc_channel_ctx_free(struct kref *ref)
 {
 	struct fastrpc_channel_ctx *cctx;
+	int i;
 
 	cctx = container_of(ref, struct fastrpc_channel_ctx, refcount);
 
+	for (i = 0; i < cctx->ext_cb_count; i++)
+		kfree(cctx->ext_cb[i]);
+	kfree(cctx->ext_cb);
 	idr_destroy(&cctx->ctx_idr);
 	kfree(cctx);
 }
@@ -2373,6 +2379,8 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	u32 dma_bits;
 	u32 sid = 0;
 	int rc;
+	bool is_extended_cb = false;
+	struct device_node *mem_np;
 
 	cctx = dev_get_drvdata(dev->parent);
 	if (!cctx)
@@ -2382,6 +2390,45 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 				       of_n_addr_cells(dev->of_node) - 1, &sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
+	mem_np = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (mem_np) {
+		is_extended_cb = true;
+		of_node_put(mem_np);
+	}
+
+	if (is_extended_cb) {
+		struct fastrpc_session_ctx **new_ext;
+
+		sess = kzalloc_obj(*sess);
+		if (!sess)
+			return -ENOMEM;
+
+		spin_lock_irqsave(&cctx->lock, flags);
+		new_ext = krealloc(cctx->ext_cb,
+				   (cctx->ext_cb_count + 1) * sizeof(*cctx->ext_cb),
+				   GFP_KERNEL);
+		if (!new_ext) {
+			spin_unlock_irqrestore(&cctx->lock, flags);
+			kfree(sess);
+			return -ENOMEM;
+		}
+		cctx->ext_cb = new_ext;
+		sess->valid = true;
+		sess->dev = dev;
+		sess->sid = sid;
+		dev_set_drvdata(dev, sess);
+		cctx->ext_cb[cctx->ext_cb_count++] = sess;
+		spin_unlock_irqrestore(&cctx->lock, flags);
+
+		rc = dma_set_mask(dev, DMA_BIT_MASK(40));
+		if (rc) {
+			dev_err(dev, "40-bit DMA enable failed\n");
+			return rc;
+		}
+
+		return 0;
+	}
+
 	spin_lock_irqsave(&cctx->lock, flags);
 	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
 		spin_unlock_irqrestore(&cctx->lock, flags);

-- 
2.34.1


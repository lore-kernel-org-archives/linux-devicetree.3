Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E54734165B
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 05:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045064; cv=none; b=Pp9KyoKqe5W4HE02c2AJaOZJk/SfXH4ulYabGuUrW6pO5P5JrSDb3DujIdU4fDb9dUh8/hMTvxaCogL1R42LKdEf2b8LUWfIDd2T+mEhvHH0TxhnUGk0urC/wE6bqYdEvZC/KSIYtYIFBFY373pJfyPtydpm1gurNiIpCZayN+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045064; c=relaxed/simple;
	bh=TWnfmPOlO+mOYgnlGCly8Bm2gHmg0/p2SiB17+MZEzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Udovbwdo4cydkGfWn+aQ9IzCsi5PYc2PZsuEcQWIWPMmCYeGkyzEPyYO523jFYSLjrCALqpb6RGs1ADNVAR51q27XkZSkxSTYPi3j46nshcY0dlxmSk7N3ngurzUpfyTMgaEuP8ZYqte+uNfBBRUTWbAXZFUr8GtQ5QYcgLvUe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Thwu3wnY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CXeFSihX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Thwu3wnY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CXeFSihX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66Q5RVML093624
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 05:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	svIy/K6G5c/If16VRcQMxrUiCQCVENhFRu4Xsi5uR6g=; b=Thwu3wnYw2XFL/Jf
	gWYqUn8DSgnPD8Q15Uy28Cu6aIdFJ0v9dK2cPJwa1cW0eEMavd1eTmzJy9VLggxV
	tOHL0vQmZIsAI9m0ki49kXyjoYRnc3E1J0+3cQ7iuO+nZNJft+gatGFwxjFkyO/C
	L0oOTLn9WSUsXxExK3KJg4C9gxix4f4wXcuPvAmYc+JB6GxM1CtTgMHlcydINBnj
	FEDidPG6WXHFCDtrFjhrUIxcqfQRBWx3Zaa3nVoIG31dEd9B5M2oMWLI8ICKt5dC
	fzGdU79scguSmNImWKL2YgD0RA7ejp3KcX/CUy7g+WLcw4bHOMsXjNpO3t6SkyYx
	6+Eyyg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm3saemk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 05:51:01 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84c4cd31b51so2989929b3a.0
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 22:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785045061; x=1785649861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svIy/K6G5c/If16VRcQMxrUiCQCVENhFRu4Xsi5uR6g=;
        b=CXeFSihXYBw5II1MMhDVY25v9FovxrX3nTRd9oiotRa/872F7dhM3hRxAolESJFWkX
         2sQYzoTAGvCq+dARSUSc/rqo9AbND/2eTxY2LSwp1PTpnoky3EBnKdWnq5BFEGV7gpuR
         ycaxShW4J9AGbfCyut9yqDJ6SXTdz+S10I1yjjB51VuWDVY1oesBkVhiLa7tbrdGSNLC
         bgVZ7hGsX2It1QYvloZp8518XcRf/WHT9jf2M0LkVwM50i//MKTazwsULvN0w6ZdvquV
         WWGV1+qmIwdkeXTKRLoZ3TqnU36uIjI+EZSMW4smoTBIGIDPhkWftJSfoNJZsBD7DpfY
         cvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045061; x=1785649861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=svIy/K6G5c/If16VRcQMxrUiCQCVENhFRu4Xsi5uR6g=;
        b=amA0z9XIokLamtvQNDssFmYh6phURLuUV5xJqSzabBwXQjhqnxCKZ9qh3sL4cX5JdV
         JvyZYefLqLSuxfayEaDyi53hUByQdoi87xV/8dHc6IzRIBZCqA2JcdlSde87ryJU3lhh
         rwtxxJyLb0BoJ+NedpA3d7rj1SpDGNB1U1D0KBYIu68Q0Toa4lujgE6DTddR8vWCQkMz
         jBVHVoH0nPLDEYxNqJ21TW8DY0ZLVPSBYPJFl2AAKKXju8VTMiq1qu5RdR8P0bZaRuWN
         3glvTwRAMT302XDpTN5CbNbM9j5TJIlRozZJqraXo8NfF0Zdf6UI5xABbDyeRNMF3UoS
         IrSw==
X-Forwarded-Encrypted: i=1; AHgh+RoJ/9utPgh1PyjqBiQJQbPcm2H52/yMeAm9DYzFm+InYwGG42K/E4Ed7qZ5TvoQh71uM21ot8jxHDJA@vger.kernel.org
X-Gm-Message-State: AOJu0YwFcFVYdph554d3Qz8+TfTkDufBs5b5t/w2/rIreVS9O2f/U/h/
	8KL9t/j9jhitOwpjBwPAHIl4XfKXMqiQrsWTmOEXjt3xgXtH8Eik5ZYlvGHTIrK2rec2mpg3Y7c
	9fiWlozXUjku2OQbevemeBMsTzoBeOyPrlFk5agdS0mC5FJte/Xib4Yav8cPe6Bv6
X-Gm-Gg: AR+sD11uervmwDtHODFHqbw6cAIQiWQEtV0GJa0nlyBreprclHw200ZbXOLCYKiBTFB
	KvNBJg2dg+88C58jpH1f7QZ/cNjJ5+FrEJayr4ndmkNfHDMQIRMfedlQl/0xy7tqYhOwmyy8KFO
	FhJAuSoB3OfRNpwj6AbzPY4DMIj+Z+ETghj78HcMBehJL3iBru0uYbsRtPSXSQMyWE5Uwoo7Lx/
	AFupeactp8XMb/Oq7JeMN3EqU27q06baV/lBIWYoI8FK4bdZaDuO2hw1t9mrszZJsWOFp5qHwgu
	EzQgYQa/tOkAwOdTCg2PlJRt6JmDj8ikVXvgU65zUiRWVwlcWv2dhBcQPr32JzydXZMqYQf01Qs
	vE8xTSjV1zAZVL2xZmuVUifxlEd/Ig/+LgA==
X-Received: by 2002:a05:6a21:6e92:b0:3c4:33cc:502 with SMTP id adf61e73a8af0-3c67f2444c7mr3496983637.30.1785045060911;
        Sat, 25 Jul 2026 22:51:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e92:b0:3c4:33cc:502 with SMTP id adf61e73a8af0-3c67f2444c7mr3496948637.30.1785045060439;
        Sat, 25 Jul 2026 22:51:00 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm67106334c88.15.2026.07.25.22.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:50:59 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 11:19:34 +0530
Subject: [PATCH v10 04/14] media: iris: Add helper to select relevant
 context bank device
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-glymur-v10-4-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
In-Reply-To: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785045023; l=9226;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=Pr3Au1H6jFHDbntQ1fqrPLFjbIEO/fGUoiMyA/l0Va8=;
 b=5DwXAVc4RnK393nunPn1NnR9+bUw8SypVVVoIvFKWb7uKLcI0KhzLZ/rYhhEPnH4MJIWjgZy+
 u1DKfT2oNh2AnEVovscBpdiFHGDR/SxucnbJhLdPZXXdAhvHpgoqV31
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDA1NCBTYWx0ZWRfX/BB3tqvr7rys
 WYHdE278WrpYqLTAoWg8wf9JgkQZpmhFjLSfvougesHZAyEC+rRhdMHEtj/d+2zvT3exVt/5nOw
 tNM7dUbmo5GWVHmQ7cNI/BzTmhNSb5/qM6JyyTBLDMTTsSwzabEmKVD4onOhmlzUnRgq/I5PRfq
 68/7ktMwHou2JvsJmCZa5POCuwj5a3ipHGFL8s8ia8MyHsjRaERQ5XX1++1zO9wlWk6Ygj0qhTr
 WpmJmY/JNF3ePBxsOVlG0TOCvKJdFjs0IMPqjhs/bVWcD3LFzrSXOY0G0UFhruBEgcLhtsZLafv
 Bf14W8aCMiNja4h9S57GLV2/4gvIECLzhg7UqdbVAS2IEKpWSooL+yeNbC93Q/0moG/fLgny49w
 deMn7EUNWXegxcuG9L6vCobMwqSZR6n0bxuse8FgDfK3HeiD1BJ/mQpk30mVIxVrrGr/iVCJfz1
 LIwtd9nwi25ELHGWmFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDA1NCBTYWx0ZWRfX5fKuuEp8Wqr9
 IZm8sjh4BHg0ueleHcAZtmhUqbju9JiEZN/bgby2fwFkBkCLxju8D3pWkWJXVVCa9W0p34bL7kY
 OyORZFY8GONj3fhgMQAcEeELTigaaEU=
X-Proofpoint-ORIG-GUID: cpEqk2qTQl43MMDwTklVwtelMeTOtrTr
X-Proofpoint-GUID: cpEqk2qTQl43MMDwTklVwtelMeTOtrTr
X-Authority-Analysis: v=2.4 cv=KanidwYD c=1 sm=1 tr=0 ts=6a65a045 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=1mAbuoZ9JynoZkEgmloA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260054

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Associate the context bank device with the respective buffers. Fall back
to core->dev when the platform still describes the IOMMU on the parent
iris node instead of using subnodes. Those platforms would be migrated
gradually.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
---
 drivers/media/platform/qcom/iris/iris_buffer.c    |  8 ++---
 drivers/media/platform/qcom/iris/iris_core.h      |  4 +++
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 16 +++++----
 drivers/media/platform/qcom/iris/iris_resources.c | 41 +++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c      |  4 +--
 6 files changed, 61 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index 246ad0abbac3..249c9f1d0d5d 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -529,7 +529,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 				       enum iris_buffer_type buffer_type, u32 index)
 {
 	struct iris_buffers *buffers = &inst->buffers[buffer_type];
-	struct iris_core *core = inst->core;
+	struct device *dev = iris_get_cb_dev(inst, buffer_type);
 	struct iris_buffer *buffer;
 
 	if (!buffers->size)
@@ -545,7 +545,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 	buffer->buffer_size = buffers->size;
 	buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE | DMA_ATTR_NO_KERNEL_MAPPING;
 
-	buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
+	buffer->kvaddr = dma_alloc_attrs(dev, buffer->buffer_size,
 					 &buffer->device_addr, GFP_KERNEL, buffer->dma_attrs);
 	if (!buffer->kvaddr) {
 		kfree(buffer);
@@ -682,10 +682,10 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 
 int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
 {
-	struct iris_core *core = inst->core;
+	struct device *dev = iris_get_cb_dev(inst, buffer->type);
 
 	list_del(&buffer->list);
-	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
+	dma_free_attrs(dev, buffer->buffer_size, buffer->kvaddr,
 		       buffer->device_addr, buffer->dma_attrs);
 	kfree(buffer);
 
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 24da60448cf2..3c96f46cf567 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -36,6 +36,8 @@ struct qcom_ubwc_cfg_data;
  * struct iris_core - holds core parameters valid for all instances
  *
  * @dev: reference to device structure
+ * @np_dev: reference to non-pixel device structure
+ * @p_dev: reference to pixel device structure
  * @reg_base: IO memory base address
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
@@ -81,6 +83,8 @@ struct qcom_ubwc_cfg_data;
 
 struct iris_core {
 	struct device				*dev;
+	struct device				*np_dev;
+	struct device				*p_dev;
 	void __iomem				*reg_base;
 	int					irq;
 	struct v4l2_device			v4l2_dev;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index bf6db23b53e2..ce6a682b0f9a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -245,25 +245,26 @@ static void iris_hfi_queue_deinit(struct iris_iface_q_info *iface_q)
 
 int iris_hfi_queues_init(struct iris_core *core)
 {
+	struct device *dev = core->np_dev ? core->np_dev : core->dev;
 	struct iris_hfi_queue_table_header *q_tbl_hdr;
 	u32 queue_size;
 
 	/* Iris hardware requires 4K queue alignment */
 	queue_size = ALIGN((sizeof(*q_tbl_hdr) + (IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ)), SZ_4K);
-	core->iface_q_table_vaddr = dma_alloc_attrs(core->dev, queue_size,
+	core->iface_q_table_vaddr = dma_alloc_attrs(dev, queue_size,
 						    &core->iface_q_table_daddr,
 						    GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
 	if (!core->iface_q_table_vaddr) {
-		dev_err(core->dev, "queues alloc and map failed\n");
+		dev_err(dev, "queues alloc and map failed\n");
 		return -ENOMEM;
 	}
 
-	core->sfr_vaddr = dma_alloc_attrs(core->dev, SFR_SIZE,
+	core->sfr_vaddr = dma_alloc_attrs(dev, SFR_SIZE,
 					  &core->sfr_daddr,
 					  GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
 	if (!core->sfr_vaddr) {
-		dev_err(core->dev, "sfr alloc and map failed\n");
-		dma_free_attrs(core->dev, queue_size, core->iface_q_table_vaddr,
+		dev_err(dev, "sfr alloc and map failed\n");
+		dma_free_attrs(dev, queue_size, core->iface_q_table_vaddr,
 			       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
 		return -ENOMEM;
 	}
@@ -291,6 +292,7 @@ int iris_hfi_queues_init(struct iris_core *core)
 
 void iris_hfi_queues_deinit(struct iris_core *core)
 {
+	struct device *dev = core->np_dev ? core->np_dev : core->dev;
 	u32 queue_size;
 
 	if (!core->iface_q_table_vaddr)
@@ -300,7 +302,7 @@ void iris_hfi_queues_deinit(struct iris_core *core)
 	iris_hfi_queue_deinit(&core->message_queue);
 	iris_hfi_queue_deinit(&core->command_queue);
 
-	dma_free_attrs(core->dev, SFR_SIZE, core->sfr_vaddr,
+	dma_free_attrs(dev, SFR_SIZE, core->sfr_vaddr,
 		       core->sfr_daddr, DMA_ATTR_WRITE_COMBINE);
 
 	core->sfr_vaddr = NULL;
@@ -309,7 +311,7 @@ void iris_hfi_queues_deinit(struct iris_core *core)
 	queue_size = ALIGN(sizeof(struct iris_hfi_queue_table_header) +
 		(IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ), SZ_4K);
 
-	dma_free_attrs(core->dev, queue_size, core->iface_q_table_vaddr,
+	dma_free_attrs(dev, queue_size, core->iface_q_table_vaddr,
 		       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
 
 	core->iface_q_table_vaddr = NULL;
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index a685915a19e9..309a593d755b 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -13,6 +13,7 @@
 #include <linux/reset.h>
 
 #include "iris_core.h"
+#include "iris_instance.h"
 #include "iris_resources.h"
 
 #define BW_THRESHOLD 50000
@@ -169,3 +170,43 @@ struct device *iris_create_cb_dev(struct iris_core *core, const char *name)
 
 	return &pdev->dev;
 }
+
+struct device *iris_get_cb_dev(struct iris_inst *inst, enum iris_buffer_type buffer_type)
+{
+	struct iris_core *core = inst->core;
+	struct device *dev = NULL;
+
+	switch (buffer_type) {
+	case BUF_INPUT:
+		if (inst->domain == DECODER)
+			dev = core->np_dev;
+		else
+			dev = core->p_dev;
+		break;
+	case BUF_OUTPUT:
+		if (inst->domain == DECODER)
+			dev = core->p_dev;
+		else
+			dev = core->np_dev;
+		break;
+	case BUF_DPB:
+	case BUF_PARTIAL:
+	case BUF_SCRATCH_1:
+	case BUF_SCRATCH_2:
+	case BUF_VPSS:
+		dev = core->p_dev;
+		break;
+	case BUF_BIN:
+	case BUF_ARP:
+	case BUF_COMV:
+	case BUF_LINE:
+	case BUF_NON_COMV:
+	case BUF_PERSIST:
+		dev = core->np_dev;
+		break;
+	default:
+		dev_err(core->dev, "invalid buffer type: %d\n", buffer_type);
+	}
+
+	return dev ? dev : core->dev;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
index ca53c01f60ae..2eef0676a146 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.h
+++ b/drivers/media/platform/qcom/iris/iris_resources.h
@@ -16,5 +16,6 @@ int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
 int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
 int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
 struct device *iris_create_cb_dev(struct iris_core *core, const char *name);
+struct device *iris_get_cb_dev(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 14d63dc76c9b..26df872fb4fa 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -107,7 +107,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	src_vq->drv_priv = inst;
 	src_vq->buf_struct_size = sizeof(struct iris_buffer);
 	src_vq->min_reqbufs_allocation = MIN_BUFFERS;
-	src_vq->dev = inst->core->dev;
+	src_vq->dev = iris_get_cb_dev(inst, BUF_INPUT);
 	src_vq->lock = &inst->ctx_q_lock;
 	ret = vb2_queue_init(src_vq);
 	if (ret)
@@ -121,7 +121,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	dst_vq->drv_priv = inst;
 	dst_vq->buf_struct_size = sizeof(struct iris_buffer);
 	dst_vq->min_reqbufs_allocation = MIN_BUFFERS;
-	dst_vq->dev = inst->core->dev;
+	dst_vq->dev = iris_get_cb_dev(inst, BUF_OUTPUT);
 	dst_vq->lock = &inst->ctx_q_lock;
 
 	return vb2_queue_init(dst_vq);

-- 
2.34.1


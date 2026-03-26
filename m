Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773FA33372D
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499616; cv=none; b=mVRFEGmYei/EMytFTpoMmOyL96vP74NYNyOXVsknHS8NOiKJbPYJ0Y+TEifhGLuhSiFpwI2XLQ8rgyuVOo69poTsqFazrGxcDJg0zoC/JhzNFD8xvLYzENSUn4uzBRd2ImOVr/Jyegu3brVFmTBpoaPPea3WUprhZVZ4OeoLadY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499616; c=relaxed/simple;
	bh=aBT1PdwjdNx1+M+MvBs+mg6b92K0E6DC77yGQdHQuAs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b4e1IdQXWXCwo3iHEBz2aHwtDkwTYYijor9U6wXBZVR8umSBz5vpq6os9Bsj/QkIdOh0nJIV/ReIFCwV108lrFS315wZ+nkGqiO0OBs6oPO2RHk5U/OmCrljmEMi90yinBhC5Fts+Xkilx8jdh+X/OxsQmzjYuaxvRgL9yTvNwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QhpKn4II; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sxs4A5+v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QhpKn4II";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sxs4A5+v"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q0koHu3958026
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V7GsGH689fM
	rj+lpWrTL+ysDdRauI7b9YYAiBDzdW4o=; b=QhpKn4IIo+pEgTl166rBFCFMO2X
	DNEyWgOiMbYdaQIHXuiKYAk2Y+5h+/QvuYuoTtpG2CeA2ljKM3RXBJnHnDo4iPZ+
	aAwPUYv8gobQj5lW8ouQpzHNsRohtzZVEo0ylEq9Z03SgGZG7Ij5ndky8tVMz5x4
	j1JdEIFGblse4wuMEPXQQk/WQnmgb5L90AB7rAtIBQWnwRbJYabwNyRkVLN0SOlV
	wk2kKERIbqpryxOn6m5L9CT0QP0uIzun0UrKpYZKcAUyid7Iabe37RI//VdpSgY5
	xwXifsqTWtOWXLZ9OpBqthqmqwOY/fx3AirlzCZsfX0UCegTdJBYqtfJFow==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tjagjg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:33:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35ba237d2e0so631008a91.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 21:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774499614; x=1775104414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7GsGH689fMrj+lpWrTL+ysDdRauI7b9YYAiBDzdW4o=;
        b=Sxs4A5+vDimOgV8sdmakhMDkZS1wiOnNsFY/qz0CjNKg0tViYjtWWicEIURJDbqYr2
         9lEVPWkvxNbsDU7ZptaMQjllmfEAe+QQ2mvX0GH8P0FUZMfmFI5R9ADZSCKQpkagJFPp
         4G7W5jR/N/Uk03tcKBLuR+AOwLA+MWTk6vVLCzW8PAGlHbhTHXUJENcRhBndTB2a8Is3
         5/xXLAebBcJrhcQRUUbNsjl6cYDTF0CkculbxhFzjiam+ywN5BFUVsi0fRA1Bek6ATay
         cJAG6wG1Lgir1Pd4yOEUgMLEhK0/wfC8AG9MbpeGkYuceN8cR2dwZApnTRpqYa0jv794
         x4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774499614; x=1775104414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V7GsGH689fMrj+lpWrTL+ysDdRauI7b9YYAiBDzdW4o=;
        b=XQo8cJa9sJovDyreuAPoGOB3B9S2IwVHX6CnyPdXzkE9bEbuObtjpP+ouamYG2w9yB
         fnBqCLGh/yZWrjswlL7fxjT8wbZQCe+yuJWzJk1peSzmbcZS2GvDFmd3tbjtsmQWN1qA
         x0cH//Km6M2j9rddkXWibXvERFaYDFtgXYHj+y+YawOwfiSVZy15G2BUVw4yrY3NAHBc
         7RfD5htDFRtr2z/LHnueYJrFYi7l7Yuf+6Z9eWGVC1cyQTaIu3PAbr9YMjxQgnt1vMLX
         ln7dfq036Kqe1a+VCMJrS2FcYdB+U7mxj1EzLrILSnSl74PWyXIt05NxbDv2mJFAgPFD
         iDlA==
X-Forwarded-Encrypted: i=1; AJvYcCUzoYO54mF7ty0HtSPb1TBGKYz2op0oJgUPCU4LW+j301iPf8ZIh79kHu0sQiy5OXMJgOMG9tWNP1bc@vger.kernel.org
X-Gm-Message-State: AOJu0YxImLVZntWCQcJGWq7MC9/sdsa13822kV6As2HkRbgoTEzxeoB7
	PtpDRXc9uzJdNs8epiYxzP3Ud5FxWgforL1XxuLd/oaM49LExHGeFnMpijtmlQZnnHX9NU3fTRT
	rRJ21CYIVpgiFOs4kk1l7NPGQJNBPhJUOLnwiiLsx+/Oh6D2RyIwMZuFZdHPgnK0S
X-Gm-Gg: ATEYQzxYJXS3F8JL4+7pu50pBKBSKgzv2wa6UU2r54E8ZGP2VuLbL5XOTKSUdTI13M5
	OklxHpGKvzh/iB/GdiUu1rDgnqxyav+4Aams1++MlIICoyTSxjBGFBuARgBdR/zwjCPKIvVOoMd
	WC9nrtEbCjTElRL8/R/3yV6m4hwFy7qhlaIz/W6A60EaNfZPrS6zYmYar1RG/jEH1YCwRVv3JJp
	Ue8CXrYJ7XmgIdoKuJJWT5jFl3kqYonHbLzZ7yS5FAEg7f5n2udiL1kJvV/UbpYkrG1ojbzvuCb
	WE4S+VZBVyo7u3/h4T4o8QJ7QKkmCFZsfC3gY6JGrK/0tk/WCBkddWbbBBHOm+2gP1bmJjmmHYN
	IZfeNNaiZzOOHWjtuUo49pG14ClrPVx2xIRDCNxzbFP4GUhqVr+5NOe9buyohMiHmnw1qWkv6L3
	mpCc7zbifPTsfsDdcbAIQlZodLmvLYVo3Ufkahzz3UEcgFdON7k4A=
X-Received: by 2002:a17:903:1666:b0:2b0:5682:6973 with SMTP id d9443c01a7336-2b0b09e732cmr65230545ad.19.1774499613568;
        Wed, 25 Mar 2026 21:33:33 -0700 (PDT)
X-Received: by 2002:a17:903:1666:b0:2b0:5682:6973 with SMTP id d9443c01a7336-2b0b09e732cmr65230105ad.19.1774499613019;
        Wed, 25 Mar 2026 21:33:33 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7b233fsm15163715ad.32.2026.03.25.21.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:33:32 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v11 1/6] firmware: qcom_scm: ipq5332: add support to pass metadata size
Date: Thu, 26 Mar 2026 10:03:15 +0530
Message-Id: <20260326043320.2507890-2-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kcbsShbJ0sR6NLl7HD9_B0xfmwcbETA6
X-Authority-Analysis: v=2.4 cv=Nr3cssdJ c=1 sm=1 tr=0 ts=69c4b71e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=Hho1wTqgLjreKoR7ChkA:9 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kcbsShbJ0sR6NLl7HD9_B0xfmwcbETA6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMiBTYWx0ZWRfX6KXmRGp6cHsN
 tln4qHeq2SuaDCpUDbOpj7yX0YI3a/KygHE/BemXWq5X4w9cy81RF2g1PJaR/2nRdgpQ9WI+m24
 oNvqlEMYds0nguprCW4Ejg5OZPigiBcAvj2wk7wD0ufUy76gwI1GTG3lNRLveyY4DEpYi04YFU2
 r5Aufv7przJTX7GkFWYs8lNtxi0LrnohaO7V5TshdyR7LRArNHcIaHshJQhSRiEKshezQBnlbQ3
 noYU3OwWzAPHdBTXtDAk4I4Q2s3Bl1hwoT+PF6r+OhMnT4hpPgK5BfbHHuQ/jG62alp6wkp0PFF
 khjBfP7WjMEbMG59HHYf8wg5/dXn+6P21HYuiN8L58xr8zMcaco3bgwtps/u/a+cQSczpP5Link
 XtSo4aulgVfERCMqgwRgqSxG01xA+BNqfSX5mHaD6bFN3kyGOLpJxO1xGYrrpeMXwVEmWKTHviK
 JwbLzxK6+/i+usLKnFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260032

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

IPQ5332 security software running under trustzone requires metadata size.
With new command support added in TrustZone that includes a size parameter,
pass metadata size as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v11: Rebase to top of tree
v10: Added r-b Dmitry tag
v9: Added signed-off-by tag
---
 drivers/firmware/qcom/qcom_scm.c | 14 +++++++++++---
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index d1082695ec38..9770c0b75b57 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -605,7 +605,7 @@ struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
 EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
 
 static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
-				     struct qcom_scm_res *res)
+				     struct qcom_scm_res *res, size_t size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
@@ -626,6 +626,14 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
 
 	desc.args[1] = mdata_phys;
 
+	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+					 QCOM_SCM_PIL_PAS_INIT_IMAGE_V2)) {
+		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE_V2;
+		desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW,
+					     QCOM_SCM_VAL);
+		desc.args[2] = size;
+	}
+
 	ret = qcom_scm_call(__scm->dev, &desc, res);
 	qcom_scm_bw_disable();
 
@@ -650,7 +658,7 @@ static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
 	memcpy(mdata_buf, metadata, size);
 	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
 
-	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, &res);
+	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, &res, size);
 	if (ret < 0)
 		qcom_tzmem_free(mdata_buf);
 	else
@@ -706,7 +714,7 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 
 	memcpy(mdata_buf, metadata, size);
 
-	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, &res);
+	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, &res, size);
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
 	} else if (ctx) {
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index caab80a73e17..cb80e22a3d90 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
 #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
 #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
+#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
 #define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
 
 #define QCOM_SCM_SVC_IO			0x05
-- 
2.34.1


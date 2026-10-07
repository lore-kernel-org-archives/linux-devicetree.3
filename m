Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD2F496D40
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363985; cv=none; b=rDN1JSDi6svJ6NFjhSxxn66MjytfZN1fuJKbjGQCnqe8UPN7iyRP47uvLn+feuqT8WRsw8RrDUAnmwky13qp6wpJAsHCcVotw9EqEE7VI1HANFa+poRNS42JYmBAsNCrwqVIArLDfn655nqFcZmfo7SnuLCElV7KUt/d43beyvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363985; c=relaxed/simple;
	bh=IaV+7Nqe72WztSaW3MG9b28k36h8V9JiDqMww/MfWcc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gnKetfnXAp+oSmHZN4z5YMnJqsez2O6u/kSRKYJoDjKoqnCX4oWF2uM5T4rmsEjd4RyMLkAXuUScyrM7foJKeLJ6qSMZpXTVhiFqQZudTjDWu8Sf6GIgj4Ry4u3PW4nL+05sUS0F/TRzIrL0S8SHNV+6lQzTvbLWrRvHqW6H44I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kB2dm+zX reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kB2dm+zX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jnYE2711451
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 09:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MAZtRLhJFy1
	2wPFtuyHCnVC/9JQ12Jj7CEMPhc1gOoU=; b=kB2dm+zXJx90f6/0uOhrIF38Idx
	9imi1u8j6+5xgUMPgDc8MUySf/UCstELXstMXWYPFS4irlKEUwdq8K6WOmfWskRh
	GH4pQY3VMSU5ckYzqrlNE5XCmEsXia/eLx25EphRN6ZtsWKxmIDp81lfESSScWZ/
	4wa1/gWR/1tAbE+AUB5sEPAtUnUKoZqo7z5zQcQNqVGVPsvnt2frMj3V84kP229C
	ZS4ZlARhgGIfQKmHPwx0QgJuOYiyI+/s8ZQfuIbX3LCNs6N0652NwADUFlULJ1HM
	WtJ/z4KmNo6P5iWan1hk0ZhBztjgbCdz+fTU6nyx7O8oxQ0yOORfyY4Oh7A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s1dbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:03:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb98809caso535165385a.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363792; x=1791968592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MAZtRLhJFy12wPFtuyHCnVC/9JQ12Jj7CEMPhc1gOoU=;
        b=ryIlfg3BQUBY1zMkNlnaRkEfqOwKiChYUI72pcNO8JZJCCEQbDrN6KX2U/fEaHKSuz
         UpRnZ98JV6AKZpDZH5d5e5WpdgYvjRPpPkvQX6uWY6/Z/h0Kth8MIh5ZEKdm3XrehLXL
         ntK4C2PjNVNl5cG9jyjsBfEdXRbr/TipHBVTz+/eRmruxfuPZzPAbj/yerhJ/nIgi5dR
         MAYOHr+LL6bUQ/aQm2fAwBAWNKPbWili/YJgLxHpfMlg4B24aSQgsDrJXZ8grisCQn39
         HrgzuUOyabLXaDDqvPoqopZo5RiAknPyhpMA1rKc+EXbozF+NECmQngCGhCv+wPgmMll
         7WKQ==
X-Forwarded-Encrypted: i=1; AKwUvByIcdO7+UWtlkIAzViD2EK12daNV/MFi5qMoJzucppx2jun19fffB5y6ndkrEoo3qzbn6t9mQHlfckS@vger.kernel.org
X-Gm-Message-State: AFuF++mQ/mkxWEqQJaoZPOb3ZpBQkMA62WStb47bQiKwaQ6xz6TmqZQg
	B9534zIYmN3s5MGd5abPhzQuE81jYypbQyE6rHFwzzl15GO7jmsLyjpOdTxam4zpGyKBSDitZib
	HPErrbxiyQTujjo0txrfHNsYIqRNaxK2HH9lZSlgqfkSU2xzlrF9KARNrFkU4KV+F
X-Gm-Gg: AYBFou1DqNnp0/oBz5L16fMtIh37QZDii1OZwG5sa43nuCJj/GE04eUqsUOIO3+6zEt
	hIS/36g3Pka5frR3JToH1oE2FkrJvO/I2qTGCbQXJR5LZ707NA7KRWhmmhtudNPPoRZj1R2ezS1
	dhTaOuVSd/rv9c69baFC1xtICot5GF31aIQseoDi0S883dzFqshpViPXh1+T/8jPwf/hOGcq/r6
	HO6Oca3geEe8E+q6HonVe20vatbSNIYbV7itzS/tGtak0lTGlYXLvKd5YcApvhYbUhw/TjNu7iy
	/r0D2dj4gbucvwG/itN+akqrV1hrgO3Va5ieq7iy3CNKeGJm3bODMN8YtXI=
X-Received: by 2002:a05:620a:4091:b0:93e:4e27:359b with SMTP id af79cd13be357-93e9b7760d5mr316520685a.24.1791363792236;
        Wed, 07 Oct 2026 02:03:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4091:b0:93e:4e27:359b with SMTP id af79cd13be357-93e9b7760d5mr316512385a.24.1791363791531;
        Wed, 07 Oct 2026 02:03:11 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:03:10 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 43/45] media: qcom: camss: ife: queue params buffers in FIFO order
Date: Wed,  7 Oct 2026 12:00:39 +0300
Message-Id: <20261007090041.3732717-44-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4IsVEFuaB95AYYyYIU5LJmpuOL3zIZ9y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX3wYH5dgcNzHh
 PtdL1q9+dfpsG1avgSXq47QkDMTvSkZ+7NzTKRbNBQb+9tkKU7YOqb2Ffeiv9OBXJrPNcyrNPuB
 wFA6IZsH8B5Too6HTvyV/0FSeUAcHdLJvzHr1wV8GO7JfNc3mCcZAl7JMFqvwYh53AIXUQmc1wz
 Y3GJ28WUUGPjm/Dg3qXIUu4nXL9RigqfwyE4kY+xA9WkoZ54jrCS8CmQCKGGb/mMlOYswwioRon
 fTq1q9bUnKtaC6b1nld7jTJhzxO/kQ8WPR754XQRdBCObzBU27toz+a6zhCTnlEPJT13NA4xowZ
 buu3IJYhXnpsNWY0Yei2qkF8gi0/mLcyBeORS3V+ksq8LM04iW3eFfNEfS90iyxQBmRMro7dmDe
 q1tuefxfUq+2hYKVvs5kyxZmTtBL3c6Y8VKT4enSsrL9vZCtY+2P5r5J/i53K22oLdrt5im6+NZ
 73/2tsr7E7EaSGIim2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX8UT3HSmeuHDc
 gMuXUqMeqONn8p4TVJ2kouyHBKE42vqdAD/5XipoA4WgElzCa75QnBvrxfAsR+mwT9hz2kVdYk1
 1fMO90GxuznJVEiN9UtPxCtKbj/Z3VM=
X-Proofpoint-GUID: 4IsVEFuaB95AYYyYIU5LJmpuOL3zIZ9y
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac60ad1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=Esc8-VpS8LW7SIx68BoA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

ife->pending_params was a single-slot pointer: queuing a second PARAMS
buffer before the next PP epoch0 IRQ consumed it would silently
displace the first one, completing it with VB2_BUF_STATE_ERROR. This
means a userspace client that queues several params buffers ahead of
time (mirroring how image buffers are queued) loses all but the most
recently queued one instead of having them applied one per frame in
order.

Turn pending_params into a struct list_head FIFO, following the same
pending_bufs/bufs_lock pattern already used for image buffers. Buffers
are now enqueued at the tail in camss_ife_queue_buffer() and dequeued
from the head once per PP epoch0 IRQ, applying at most one params
buffer per frame without dropping queued-ahead buffers. Flushing on
stream-off now completes every buffer left in the list rather than
just one.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-ife.c | 25 +++++++++----------
 drivers/media/platform/qcom/camss/camss-ife.h |  2 +-
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-ife.c b/drivers/media/platform/qcom/camss/camss-ife.c
index ab6102fd1126..57fab10a87f5 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.c
+++ b/drivers/media/platform/qcom/camss/camss-ife.c
@@ -293,8 +293,10 @@ static void ife_hw_isr_pp_epoch0(struct ife_device *ife)
 
 	spin_lock_irqsave(&ife->bufs_lock, flags);
 
-	params_buf = ife->pending_params;
-	ife->pending_params = NULL;
+	params_buf = list_first_entry_or_null(&ife->pending_params,
+					      struct camss_buffer, queue);
+	if (params_buf)
+		list_del(&params_buf->queue);
 
 	for (i = 0; i < ife->npads; i++) {
 		struct ife_video_pad *vid_pad = ife->pads[i].vid_pad;
@@ -1360,17 +1362,13 @@ static int ife_queue_buffer(struct camss_video *vid, struct camss_buffer *buf)
 	struct ife_device *ife = vid_pad->ife;
 
 	if (is_ife_video_params(vid)) {
-		struct camss_buffer *old_buf;
 		unsigned long flags;
 
 		spin_lock_irqsave(&ife->bufs_lock, flags);
-		old_buf = ife->pending_params;
-		ife->pending_params = buf;
+		INIT_LIST_HEAD(&buf->queue);
+		list_add_tail(&buf->queue, &ife->pending_params);
 		spin_unlock_irqrestore(&ife->bufs_lock, flags);
 
-		if (old_buf)
-			vb2_buffer_done(&old_buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-
 		return 0;
 	}
 
@@ -1387,15 +1385,15 @@ static int ife_flush_buffers(struct camss_video *vid, enum vb2_buffer_state stat
 	if (is_ife_video_params(vid)) {
 		struct ife_device *ife = vid_pad->ife;
 		struct camss_buffer *buf;
+		struct camss_buffer *tmp;
 		unsigned long flags;
 
 		spin_lock_irqsave(&ife->bufs_lock, flags);
-		buf = ife->pending_params;
-		ife->pending_params = NULL;
-		spin_unlock_irqrestore(&ife->bufs_lock, flags);
-
-		if (buf)
+		list_for_each_entry_safe(buf, tmp, &ife->pending_params, queue) {
+			list_del(&buf->queue);
 			vb2_buffer_done(&buf->vb.vb2_buf, state);
+		}
+		spin_unlock_irqrestore(&ife->bufs_lock, flags);
 
 		return 0;
 	}
@@ -1499,6 +1497,7 @@ int camss_ife_subdev_init(struct camss *camss, struct ife_device *ife,
 	init_completion(&ife->reset_complete);
 	mutex_init(&ife->state_mutex);
 	spin_lock_init(&ife->bufs_lock);
+	INIT_LIST_HEAD(&ife->pending_params);
 
 	/* Memory */
 	base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index c38b96076a1f..9656d29717d1 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -367,7 +367,7 @@ struct ife_device {
 
 	struct camss_ife_pipeline_cfg pipeline_cfg[IFE_CAMIF_HW_PIPES_MAX];
 
-	struct camss_buffer *pending_params;
+	struct list_head pending_params;
 
 	struct v4l2_subdev sd;
 	struct device *genpd;
-- 
2.34.1


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B64C4749F3
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363734; cv=none; b=TD9D9LgDMv/ywNn3pZMeaplkmFlpxNUAhOOGkaHaC+vyoYseWNymlGGm4k1sSuwdrakRXVvX8APAcrGBmwH91cIo4Bm3mFG7zbkUVkCaJFoUV+tNMvtVuJwx6UfNRQ20RuUD+CiPhiJu388u3uutPZ2kagnBx68VFxiLWxrpUko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363734; c=relaxed/simple;
	bh=a61iNzjTlj5EYjp8kMT4hI97L5A1x3WL1zMjpyRYt0A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gli056S0Xosnt40tMSeFW+oDd4K0WlU/mGbrnN7GZiAICjMkxzujnUxGsFLpIoU8zhplI4y4Fq2qGgRg++nnaRXOwV3HIpK32gLJQY3HvIevucYOHIPI6g1ozjDNi2qDMdtdd0olHaM1Babt/OL8GQwOfjGDrEoAf0BUXiqL6dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WDWj4aLP reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WDWj4aLP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jahf1873499
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 09:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wZo1SiuyUeG
	k0p1Dd0+8C0DK4QKg6hk7x9uPquKwVbQ=; b=WDWj4aLPwLPsXTRbJpZNQ3ubKjf
	ywysf3NfMlpxRLwZO96JJ7eJYKS8XC5Q/0eflt4TCUOCTd39ZmJpFPDXvJqisGgn
	czOURB9ORPqXjr3qNyUEGL3M1oQV2+YrtiIZcR+W6y3z+m6caYd7i64XoRP8UlYT
	+oS8EzBcdXqbOUeCMuX69W4/3S9P3hoDPJmNiJQsm6p66pOgHQ2wB25SkFllQGaQ
	gddMZ/7YD4JKqvBPygGcc76/hwIJxg9Jk/bYcQug5NPAubSaHAZRLpxJUcBcoPHX
	BxDQuvQXpiw7nPpQPAjId19qImpgHaKF8fRfibbZ0A9qe2z3jbdhkCFd5HA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8rngs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:01:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so618294585a.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363698; x=1791968498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wZo1SiuyUeGk0p1Dd0+8C0DK4QKg6hk7x9uPquKwVbQ=;
        b=Uu5Epju2RX+7S/HP/87m8ZJ9+GZUKot0MwNYp0+7yc7kv6kGg2Pr7ErR20XqwOplj9
         a8qGMqUdgXjK5iudQqzNIrl+6ZZA7Fs82kk9DTKnbDP+Hc6Z5T1pkbVDp414sCXeOl26
         BMlzK65yGPJ8S5lnznPhn2Y16mILNuL2O89PdSDAW4Wx1CXR2EZnUSeQ0BCfDinTbjM2
         nhq9wdqzxo37L3IoaRVHRYZkqHCfJDwwKs91r8KIWfSfYYFg+4WBUYKIQsNIgma/ZUut
         vzKN4BUhUNzfzj5mVSU1+dtubcSYngOHmNJOiupP7IZvEGEYU95G8AbvGtRcmfh79N5V
         Xoyg==
X-Forwarded-Encrypted: i=1; AKwUvBzGQ6HG/XM/hW9fyy+vOIe2GCUIjmhxcQSTQ/M9NSNpWb/JFENMmFp7nFxEMznC5kAo090VQlRrQpg8@vger.kernel.org
X-Gm-Message-State: AFuF++kE7QKZfCQ+HeRNV8DrL28S3aKQ3pFBDIMVl5Sa4nEy9l808KcW
	HDVWO+oMe2cOtcat0r37VJ9PAD2bK9U9g3+3G+cRVFKAc3QW1cDp50TtEGJaCKjGwgpvqCwqnOa
	D7UIXb+50ZgPKDRkAWb+Y5Mo+gYM27RLygpAUsgNXbTLs/bM8GrY4HUDK4zCIAt38
X-Gm-Gg: AYBFou2a8jHuRvZzrmOhAqGyZ9rdlq74i36qXsuPi8JKjsBtdgkNW2iwroUln8ktV1N
	hjZMIgnwT8YbWEscFLDD61aPbssJ0EZF7JeuAVdN2tNaqBihalGGkcL4QCbvLjnirb213ZxsODb
	QqvGV+ACzlNxqAMTqKm2YH8MpLm+NwdIuBEjW9Vv3GtlDM60/QWpLP0otmpgHO/9hxq+XwmkqTf
	adQUVAI+GkMMdjSLst9nheaRhraVHg822Z6P5PlPHNttDi4ggbKr/7VcgujMTjFEha9T+RqfPbd
	KYdqddfeXUMmI9qQj6dFOPKQUkEVfA3V7d1Du8Nd6wvyhgpyqHs+X1RURrI=
X-Received: by 2002:a05:620a:711c:b0:93c:ab5e:2314 with SMTP id af79cd13be357-93e85ff6e47mr1009187185a.7.1791363698131;
        Wed, 07 Oct 2026 02:01:38 -0700 (PDT)
X-Received: by 2002:a05:620a:711c:b0:93c:ab5e:2314 with SMTP id af79cd13be357-93e85ff6e47mr1009182985a.7.1791363697651;
        Wed, 07 Oct 2026 02:01:37 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:36 -0700 (PDT)
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
Subject: [PATCH RESEND 14/45] media: qcom: camss: video: add managed streaming callbacks
Date: Wed,  7 Oct 2026 12:00:10 +0300
Message-Id: <20261007090041.3732717-15-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX95fJeO+iU0iU
 GOUJe4STKpVMKVuLBNmBCHR4NrTI2JmO87eEyZyqoh22ulxtyefiz3BL5kuElUBfxVzN+FjeKbu
 0PMIuGYJYNX9no2nz3JY+ZXrGVRohbU=
X-Proofpoint-ORIG-GUID: YP9useY1p8vcqMl0WdhXRJgv3UJoBH1G
X-Proofpoint-GUID: YP9useY1p8vcqMl0WdhXRJgv3UJoBH1G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX2pk7BxL+dTKT
 GG9N/KAHajTNd4DdPD2tGjQ71ZJUDRUEOgFLKnciVZdLjLi5bIZQW+7pzQI/Isqu2hYXKPkheDr
 iX/cWb4YWoY1hbO9N77dpiiMZA+gjG1VQLAIPtJVaObqTAYIDYqPBhcVCQvks3NWOZw/wQMxw9r
 cmoA/AVf8cKohR88bcg278ujEH4NQXi3eq8rXsSyF5sewJmZtnY6zjElTFM4jb0m9ozVSitFIm6
 Lebl/lmzd3u/hTDBd2K/Tjhmq5Bqk23MfvhlOeXPUhQ2Qn8NcA1OA3kDXZY7gZhI/ubtCCTkpLh
 ZApbZsLWssnsNcysuRUicH2qHOHVDwDkc4hbOwNQroDUArdFzJ5y4P6+FGUEQphliNoPhqfq8c7
 EwSyp4Hyr5J9vOPEDQWiapKmyOAI96xLmMMJMf1p5LpV/IdVvslHUgmPOxr9GrN9u/VMyOK0AgP
 pCojQwRGPPjy3TTyHlg==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac60a73 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=WDhTVHpYbZKqloR8QRsA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Allow a CAMSS video node to start and stop streaming and select its
buffer type. Keep the existing path when callbacks are absent.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-video.c | 17 ++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-video.h |  2 ++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 803e5ce9b9fd..cb9e08e9ff7e 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -159,6 +159,7 @@ static int video_buf_init(struct vb2_buffer *vb)
 	struct sg_table *sgt;
 	unsigned int i;
 
+	memset(buffer->addr, 0, sizeof(buffer->addr));
 	for (i = 0; i < format->num_planes; i++) {
 		sgt = vb2_dma_sg_plane_desc(vb, i);
 		if (!sgt)
@@ -303,6 +304,14 @@ static int video_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (ret < 0)
 		goto error;
 
+	if (video->ops->start_streaming) {
+		ret = video->ops->start_streaming(video, count);
+		if (ret < 0)
+			goto error;
+
+		return 0;
+	}
+
 	src_pad = media_pad_remote_pad_first(sink_pad);
 	if (src_pad && is_media_entity_v4l2_subdev(src_pad->entity))
 		subdev = media_entity_to_v4l2_subdev(src_pad->entity);
@@ -370,6 +379,11 @@ static void video_stop_streaming(struct vb2_queue *q)
 	struct v4l2_subdev *subdev = NULL;
 	int ret;
 
+	if (video->ops->stop_streaming) {
+		video->ops->stop_streaming(video);
+		goto stop_pipeline;
+	}
+
 	src_pad = media_pad_remote_pad_first(sink_pad);
 	if (src_pad && is_media_entity_v4l2_subdev(src_pad->entity))
 		subdev = media_entity_to_v4l2_subdev(src_pad->entity);
@@ -382,6 +396,7 @@ static void video_stop_streaming(struct vb2_queue *q)
 	if (ret)
 		dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
 
+stop_pipeline:
 	video_device_pipeline_stop(vdev);
 
 	video->ops->flush_buffers(video, VB2_BUF_STATE_ERROR);
@@ -766,7 +781,7 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 	q->drv_priv = video;
 	q->mem_ops = &vb2_dma_sg_memops;
 	q->ops = &msm_video_vb2_q_ops;
-	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	q->type = video->type;
 	q->io_modes = VB2_DMABUF | VB2_MMAP | VB2_READ;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->buf_struct_size = sizeof(struct camss_buffer);
diff --git a/drivers/media/platform/qcom/camss/camss-video.h b/drivers/media/platform/qcom/camss/camss-video.h
index d3e56e240a88..f62a72c29a5a 100644
--- a/drivers/media/platform/qcom/camss/camss-video.h
+++ b/drivers/media/platform/qcom/camss/camss-video.h
@@ -31,6 +31,8 @@ struct camss_video_ops {
 	int (*queue_buffer)(struct camss_video *vid, struct camss_buffer *buf);
 	int (*flush_buffers)(struct camss_video *vid,
 			     enum vb2_buffer_state state);
+	int (*start_streaming)(struct camss_video *vid, unsigned int count);
+	void (*stop_streaming)(struct camss_video *vid);
 };
 
 struct camss_video {
-- 
2.34.1


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E7D3AB262
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858900; cv=none; b=k1ZjZ81ASxWS3XhT3PpFzK1pxrsY6KoP9hv9fqqm3M2F7hlA4HPsXY+RnxwBXgjWn1wylAQHrP3BGmDlgwgIxV/n683MfKmcKDMrhjh6TK7nd9vubEIzLS7nOHvDSNE7/qbPxcX6j3c/B+mZySCykCbvi/pA7ldadV4n/upmKZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858900; c=relaxed/simple;
	bh=V5T/qd3TANJw1qd6u6VahJ4dPBNJ8hf0QkxJzpbMCss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o0xZgIjhjYClKtHygOqiO7d6eqP0iKzhB+08B6NCbBfTDxIRoeei/SuwmpNqyhDErp8FMH9Rs/7f3m61MlBveIgLqIYCvu0ObH06epZx4/Yh55Pdr/ZGNs6Xlb/fNkJITvSHWe8ZTaTxEFz0+rLePhPi8NvBxaBbzh5hN+eKFfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mRGRe7Yi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=epaBLvRE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mRGRe7Yi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="epaBLvRE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7WOvY1427244
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8DfOih8+t/M
	QOB/k+M2wMzlDBSpU8tbUdV4SGt46IdA=; b=mRGRe7YiXgCCuNTkk+nV04BvmtV
	pLzB9tPPu9ZrZUGpHPjNkhZ1W87+TFvF4kkcSqfHlSh94mQ10hZ29iCFUGl3e731
	/TeGZ+C4sMDHhzVql34jI+qtBrk9tkqUvkDKuA7G7GuqlK2LdhuEWmkfj0BLkz5q
	Hb3RAtT+wmfHU8i47ZeVW+Sw5gy+6U0wTv1b9izNR37xFw9OSEInFyOrOSgSVsQV
	xWlMTE88T97kuZFNjKRRAs1sC+gxc8AuUcoZADoOzS3zQ9pcafjcaLvW3lAI5vHB
	b5RA8dXKVXvCgqk3a/hThmDOX+zqYtNRDYQxU4VVzHs/ZKw0cafNJjwdIPQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d677155w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 08:21:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091782ab06so223015561cf.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 01:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858897; x=1775463697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DfOih8+t/MQOB/k+M2wMzlDBSpU8tbUdV4SGt46IdA=;
        b=epaBLvREA+91FjMjKfeefov4hgo57TEhLdplaCfu5HaWNNrUiQWx4r4RQ97COTOp0s
         ffEkRANCJkRQAEYsib12t6sttL2Wi2AbEzzBe/pXd7o7VBMkcTYdl+B5eeIFq993wkJp
         NeFXyr+sFXGDxOz6mXUkdZTD/5DvR+gXK3omKJ7sABnnkbqX9KvIS0rLh+v5ep06fXkC
         RiyBT1hK5lRcjHHNqFo12feoa46ITBzI+eibkQ2JRC+OjUP6TwqgDu6jqlyuvRpQR++Y
         I5HMKPpUKBLFrAtG9XaYitQzkrbT1DodV95GX3RfDrUo0Z37QdvCNllaREzxshNt2eh1
         PtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858897; x=1775463697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8DfOih8+t/MQOB/k+M2wMzlDBSpU8tbUdV4SGt46IdA=;
        b=s9lVQ0iEG47QCrbdGxm1ZVS3nyPBE7nfcwALZs3nDkJT0qUOQZHUN6SLAMkikRCANb
         hAyo64FQcb5gRjt0L4K3yZZy1667AZiJ7Hx0Xg8bUaWD6b+F/gFIwI2zhgssaRcUwWWI
         iNWeardzGOXZIw9Rxl+hTtWasK9DM1mDP5fFUCcmKIQrfJ9WAw1HXzOy1ySSz3Kpc0WH
         rfteCeyb7u7GXVI9fK5kgZSHWazmIOzGcg4fPXStJyrJtkvwYuvz79lXv1/wEV9zHoz6
         1uvh3XW8frHYJwmyohQBl2IR/PutqGimhGubv8p7IdJYxPxMq0697l0eZc6n/5/BUnOX
         SIyw==
X-Forwarded-Encrypted: i=1; AJvYcCVAn/PONxMq09MlygnGPB0omjfUnmLh11ZJ2tnBk4XxHu0pNBsinmNZSCLk6itgRCTnwZfpeyRVH8Wu@vger.kernel.org
X-Gm-Message-State: AOJu0YwSHpSobwvgdpvKxnjKYTRkJiCBJQWe6oR6z24xpL3C1jSnAl/y
	qeY+XpKE3UvAPj2Co20YU8E2ayFH02WQjLoXQWE+ha0VAXhWo1zFAmeK0MeRj9H27Z1FlQrUyye
	CfUY6AAFgFWZ0Xiae8FsFRMd65QOJZbHZcSWyvJ/m1m7V5GOQt0B06MfUToKwUjJI
X-Gm-Gg: ATEYQzxRecW1mJjpFQ6bCbsNYDwOlG+PD/knoFcch4LY+iBKMyUWgnCvPNWHVLznpKD
	PtsgW8YODylbDeqPvCR9hAz/+3QuBDnv9qsE3WQgHHxx+SnllfIz9MQXWK1jn6XS3k7WDL8N0YO
	nQBzQbsbIpPQvMfuibCTflquCieR0rBCvgGmw9TM6cy4rNHWY2Rph+G61AarVOdMAY7raWlWfR4
	NoSc2/mNLwQKS3zJh/yAuaqryfd/pkoOUum0e43kA46wTBDY1L8sjezHU5UfzkAhv564ULY1D/d
	ikNu2QSIk4JiDwOjmYb1trImUHSpTGkrUi4VizFMKlN34j6oX/3gINViEtYIp80A3VXS77QVRUH
	gdtMU5b5Fus+CfPNL0S0TyRG4wcrwzIxFC4B81YUcjtEEaT2L0460Qo0=
X-Received: by 2002:a05:622a:345:b0:50b:286e:ae7c with SMTP id d75a77b69052e-50ba395ec1dmr165292221cf.65.1774858897401;
        Mon, 30 Mar 2026 01:21:37 -0700 (PDT)
X-Received: by 2002:a05:622a:345:b0:50b:286e:ae7c with SMTP id d75a77b69052e-50ba395ec1dmr165292021cf.65.1774858896949;
        Mon, 30 Mar 2026 01:21:36 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v8 01/13] ASoC: qcom: q6apm: move component registration to unmanaged version
Date: Mon, 30 Mar 2026 08:20:53 +0000
Message-ID: <20260330082105.278055-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: akvb17-ch76TBy96thcMf9aleTXyGsGK
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69ca3292 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZjLH_7kMUelE1Q3ziugA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: akvb17-ch76TBy96thcMf9aleTXyGsGK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfX5tQk69KzaTQF
 v+7g0SOqdw34VrQoT7qNZaQ3e2Q1uxtZlfKncXb3jDExL99KuHxMcAq0nxxARMfE+Nm+EKNOp0b
 KjdlbHZ9ZSZPHtWx3RcWfjf4Q/uuqn+xAk48ol0P3QhQaE1tUXK6zGs/RJlpn7+j6C84PuRLX3S
 Y0fx/JSHRB90kMkeo7FxqpZiGVWgbTbmd36rE13byCmEH02KK2EnOdxAF5oE2ecZKHQHsmP5otg
 kGsM9QznRBgtxM8d5axXbcjAThGz/PatEDZA0vrAPva/NTJPK6yA3JclLN7G+c4XGqCyxZ7iLDF
 m4gGkETegVwItlNsscq5A2WeWS7VjOV1hd4j3unwQ1dxM7EnaQUiORNlgPg4Onnw8f6fuzoh+fq
 6cj6UMoBjtr/G0Mm2a8+uL21GF9/FHpgN+BEuO6FKQ8HYqepg9ac8rabJp2EWCPGltm9TugJO5v
 AkrODZ3P0TYL4QYFmDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300065

q6apm component registers dais dynamically from ASoC toplology, which
are allocated using device managed version apis. Allocating both
component and dynamic dais using managed version could lead to incorrect
free ordering, dai will be freed while component still holding references
to it.

Fix this issue by moving component to unmanged version so
that the dai pointers are only freeded after the component is removed.

==================================================================
BUG: KASAN: slab-use-after-free in snd_soc_del_component_unlocked+0x3d4/0x400 [snd_soc_core]
Read of size 8 at addr ffff00084493a6e8 by task kworker/u48:0/3426
Tainted: [W]=WARN
Hardware name: LENOVO 21N2ZC5PUS/21N2ZC5PUS, BIOS N42ET57W (1.31 ) 08/08/2024
Workqueue: pdr_notifier_wq pdr_notifier_work [pdr_interface]
Call trace:
 show_stack+0x28/0x7c (C)
 dump_stack_lvl+0x60/0x80
 print_report+0x160/0x4b4
 kasan_report+0xac/0xfc
 __asan_report_load8_noabort+0x20/0x34
 snd_soc_del_component_unlocked+0x3d4/0x400 [snd_soc_core]
 snd_soc_unregister_component_by_driver+0x50/0x88 [snd_soc_core]
 devm_component_release+0x30/0x5c [snd_soc_core]
 devres_release_all+0x13c/0x210
 device_unbind_cleanup+0x20/0x190
 device_release_driver_internal+0x350/0x468
 device_release_driver+0x18/0x30
 bus_remove_device+0x1a0/0x35c
 device_del+0x314/0x7f0
 device_unregister+0x20/0xbc
 apr_remove_device+0x5c/0x7c [apr]
 device_for_each_child+0xd8/0x160
 apr_pd_status+0x7c/0xa8 [apr]
 pdr_notifier_work+0x114/0x240 [pdr_interface]
 process_one_work+0x500/0xb70
 worker_thread+0x630/0xfb0
 kthread+0x370/0x6c0
 ret_from_fork+0x10/0x20

Allocated by task 77:
 kasan_save_stack+0x40/0x68
 kasan_save_track+0x20/0x40
 kasan_save_alloc_info+0x44/0x58
 __kasan_kmalloc+0xbc/0xdc
 __kmalloc_node_track_caller_noprof+0x1f4/0x620
 devm_kmalloc+0x7c/0x1c8
 snd_soc_register_dai+0x50/0x4f0 [snd_soc_core]
 soc_tplg_pcm_elems_load+0x55c/0x1eb8 [snd_soc_core]
 snd_soc_tplg_component_load+0x4f8/0xb60 [snd_soc_core]
 audioreach_tplg_init+0x124/0x1fc [snd_q6apm]
 q6apm_audio_probe+0x10/0x1c [snd_q6apm]
 snd_soc_component_probe+0x5c/0x118 [snd_soc_core]
 soc_probe_component+0x44c/0xaf0 [snd_soc_core]
 snd_soc_bind_card+0xad0/0x2370 [snd_soc_core]
 snd_soc_register_card+0x3b0/0x4c0 [snd_soc_core]
 devm_snd_soc_register_card+0x50/0xc8 [snd_soc_core]
 x1e80100_platform_probe+0x208/0x368 [snd_soc_x1e80100]
 platform_probe+0xc0/0x188
 really_probe+0x188/0x804
 __driver_probe_device+0x158/0x358
 driver_probe_device+0x60/0x190
 __device_attach_driver+0x16c/0x2a8
 bus_for_each_drv+0x100/0x194
 __device_attach+0x174/0x380
 device_initial_probe+0x14/0x20
 bus_probe_device+0x124/0x154
 deferred_probe_work_func+0x140/0x220
 process_one_work+0x500/0xb70
 worker_thread+0x630/0xfb0
 kthread+0x370/0x6c0
 ret_from_fork+0x10/0x20

Freed by task 3426:
 kasan_save_stack+0x40/0x68
 kasan_save_track+0x20/0x40
 __kasan_save_free_info+0x4c/0x80
 __kasan_slab_free+0x78/0xa0
 kfree+0x100/0x4a4
 devres_release_all+0x144/0x210
 device_unbind_cleanup+0x20/0x190
 device_release_driver_internal+0x350/0x468
 device_release_driver+0x18/0x30
 bus_remove_device+0x1a0/0x35c
 device_del+0x314/0x7f0
 device_unregister+0x20/0xbc
 apr_remove_device+0x5c/0x7c [apr]
 device_for_each_child+0xd8/0x160
 apr_pd_status+0x7c/0xa8 [apr]
 pdr_notifier_work+0x114/0x240 [pdr_interface]
 process_one_work+0x500/0xb70
 worker_thread+0x630/0xfb0
 kthread+0x370/0x6c0
 ret_from_fork+0x10/0x20

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 970b08c89bb3..069048db5367 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -747,13 +747,22 @@ static int apm_probe(gpr_device_t *gdev)
 
 	q6apm_get_apm_state(apm);
 
-	ret = devm_snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
+	ret = snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
 	if (ret < 0) {
 		dev_err(dev, "failed to register q6apm: %d\n", ret);
 		return ret;
 	}
 
-	return of_platform_populate(dev->of_node, NULL, NULL, dev);
+	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
+	if (ret)
+		snd_soc_unregister_component(dev);
+
+	return ret;
+}
+
+static void apm_remove(gpr_device_t *gdev)
+{
+	snd_soc_unregister_component(&gdev->dev);
 }
 
 struct audioreach_module *q6apm_find_module_by_mid(struct q6apm_graph *graph, uint32_t mid)
@@ -820,6 +829,7 @@ MODULE_DEVICE_TABLE(of, apm_device_id);
 
 static gpr_driver_t apm_driver = {
 	.probe = apm_probe,
+	.remove = apm_remove,
 	.gpr_callback = apm_callback,
 	.driver = {
 		.name = "qcom-apm",
-- 
2.47.3


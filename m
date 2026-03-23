Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82EC38237B
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305539; cv=none; b=oGURqxvb4PqWMrtmFkPQ43tByh0sLreFUqjIrF60rjHduuhmxbNayJI80aNpTzDLpSc5/99D2KrZ6HK1xK+TBNc+WwnN+WF/uE/jwdGbdkBcj0ceg7gbUqEag/ha54hi3Oy5NKd83UAronr5a4ZvsniNRO4hbXsXJjrFL1u8jdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305539; c=relaxed/simple;
	bh=ioMmjxhpKgEGbU9Q5ZhuNjYP6+vM1Ed4pEa/HmaRSl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DblLJoSVQSiaFx8jWshxtwY0n9M3OFT+X1iJ8mnvApTRdPkeozSQR9HhVKPHj4XIscotAqFUtxDNGxoDvLXMbKmSQVRu5uv5WeJCITRy0kED5Okg4KMg8lUO+LdP/C8I/rNr/7mmB2dznIUAG7L7BV4UUIorNw7xK8rVgz45P1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J7lnKh4n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KyrlHnLN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J7lnKh4n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KyrlHnLN"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqXWF3817565
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NKjWGmdRv65
	20W4OaNXC1TctOioozKWeG4nDgD3XJX8=; b=J7lnKh4nKYwg/C/dKoq1iDK4klP
	uH3NhYoikvDD7U7jbGrDsgDrVWrKbazTt/YPIpAKDqvHeyZq1XM/V7baRCMmnLPq
	cQX171n3fLvCDld42tgJq1RAcLzYjV+JR//bS7nuQ3LZ/UyCChzE074Bn8qv08Zx
	+lAp398U5xH4WqfpB50HHqcNuIP2hBPmMPHTOG7GW0XcY8Y1Ftl/ccm4oIxZxnT/
	YLiOcf4FpM2bWcQxtKeq7sVBJJI7dBagBE8nPVJRwQloG781lpvshsJI8n7hpUxA
	WH17Ba8wjHIyNU77G1rUIY4qp1npKHzRSMH5LA5uhYpFAY3s0N0VGR4rmkA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d355w234w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:38:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c517e405dso28145046d6.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305536; x=1774910336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKjWGmdRv6520W4OaNXC1TctOioozKWeG4nDgD3XJX8=;
        b=KyrlHnLNk4b8qcnHnbG51iDVabw4Tr9v1GQXpWyVSss7weeKnK42KGqYZbC/0FRKzg
         sEOy4REtH/Biu5l2vj0gSZHG8mhNA6C+CQODpm1AkwA79Q7W+DzR/7ztOUIPhwjx9q/n
         QWZJup1IZ9wF96tFeFH/t/Bma40BIo1xISDslaRSAilAF8CATqEoe2KaAbI215efUaA1
         3KuMjzPRInMM+dtvD5seD8PojS9ouMLH9bgLWT4+rrYwTvJj/3DhfbLlt2KorWGdK0+G
         Ppq825ssQl/73PHVAcW2IwUxJ/aWFilOuej1OAAXS5NTVW8d6GOroNrr6JwitIxhlwrj
         pEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305536; x=1774910336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NKjWGmdRv6520W4OaNXC1TctOioozKWeG4nDgD3XJX8=;
        b=N9UBki4NMAbRUFcE9pBPDYxAKNJheHcadaBZqz9NRO2p0UYUrAiQikWA0ZrqdoobMb
         agZ1CcnraSAScms95cyd7ca1mBZ1OgYLFXwwWxwM58tOTjrG+Y1TWV35NkmJeOgSJOAa
         9/N79oIUKMewnBtYktnoDGz9HXs/isRTE0hJ5C2O/GZTxVC5qBZPYN9aMFtAu02Acegk
         A9i2Qux08Ckd2GPDbBZelsi8yemWqt4pB9ykl4+IIvACW4y5pJd+rbqURvOMaGm7vBq2
         DsOPk6xYGGJ4eTF/Oqb+Yhrxnp8DBjDujxcefDBqcaHVQfWB7CF1x7AInRSxC+w6b9Fa
         OabQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9TpnhukxHbNOpb7mOJ0EFAYV5ddC9Um1Qs65YLDNN58cZIkDZFSunx/yps03NXoaRB4mKFxEruelY@vger.kernel.org
X-Gm-Message-State: AOJu0YzJYowHT3F5GqAdsvNbaTTzefYdj6QZDfPc43GxLwEeJv3AQ3qy
	Jn3NiBr+9tb2ddYcDtshtHDUdwC8atM+zlNGu3oL1nbVfwxpvw1mae4GcCt8UI60MZGlkLi5cTr
	IPHgZ6MzS9Dc5KwAB9Bam5IKdHRpK+XI5kcQg2CCPUmqMFeJ7NiqwokwzGqTts349
X-Gm-Gg: ATEYQzz14qi4GCs8HQRvRBeoUQKkbeZ8GYqiELLufTDy/Jcq/Kj1q9+E7Nz1W9VIjAG
	GnPhvrkAJTtpMkEhSPOjOWIpA1xvmujtvdyI01tKYGERTGesD5DPYqmHwbkIosN7PZcumzp/WyI
	5lnDCk/+v13Pr+p7pLddwDS0MCoW0cfWR0cMJPSdcIyiTQDDAnQwJOr7GKxEdYV5OHzJrV/+Ove
	h1dKDYop83vC8HmfHuyDCBI+On7bjTFk3MyBNeyVijG55TM6wEyObQJOZW+aFn+4eZA0yftaFMn
	GrAz/EjpBVoH9xMv9s1QX2cvP/Du1mrWFb+u8huJwTVuJVBjt/Q5NjJWsHuYvCxc5Bvw5ZRPstu
	SUZbWUltjHc/vNf9VjXqJoAZ+7nbjPnurhtPDXevDgJWUX2/aCregv5g=
X-Received: by 2002:a05:622a:7c8f:b0:509:11c6:d689 with SMTP id d75a77b69052e-50b373eb1d9mr136215311cf.25.1774305536256;
        Mon, 23 Mar 2026 15:38:56 -0700 (PDT)
X-Received: by 2002:a05:622a:7c8f:b0:509:11c6:d689 with SMTP id d75a77b69052e-50b373eb1d9mr136215021cf.25.1774305535804;
        Mon, 23 Mar 2026 15:38:55 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:38:55 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v7 01/13] ASoC: qcom: q6apm: move component registration to unmanaged version
Date: Mon, 23 Mar 2026 22:38:33 +0000
Message-ID: <20260323223845.2126142-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fq7RpV4f c=1 sm=1 tr=0 ts=69c1c100 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ZjLH_7kMUelE1Q3ziugA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: -sFTFfE7QFeL-NsDOfIvsBif6UjcNa88
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfXyrAPrRkNH0Pa
 IjDsbjaQsFdfTgR4fYfOzhWwdySBL1PEus3fPTY9cA+vIdNjQ4OYUvj/Lzt3NkNPs5CL8VJGtRO
 3oDnby34yGfLQyl3REPPYkUbaPLpnEC8jopQWJQXD6nPQvsues80h7DiZf7gElVjRKcOj84xL6M
 Bwa47I1g/CPBx/rEMh9QHR5bOzjZn/P5T7nC7A2Si/hTDKGu87UqOk47c59pTglu8ShoQYHvGw8
 H8iAHax3/lnZu7wGfZjrW9wyfgdFOFIn1utdnjdMGZjCOYvdd6ipZ2U3s6zHf435JUp6idm/OyS
 gQ8oWGOQppDIPaQVOnQALKeQtbbwxyHIhFZz7fOBeWEZ7MgAL5z3lIl7D5rNcsv89+tpWsXGfYz
 ibTybZjed/+bwe4wHJ1txAwBmCDaAYwEEOEepPUkQVMIrvVIurxTGT1/G0R1rsHCwBCSEa3vWnh
 D5iVCr8jfIbz6tbXNxg==
X-Proofpoint-GUID: -sFTFfE7QFeL-NsDOfIvsBif6UjcNa88
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167

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
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 970b08c89bb3..fece0e3def23 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -747,7 +747,7 @@ static int apm_probe(gpr_device_t *gdev)
 
 	q6apm_get_apm_state(apm);
 
-	ret = devm_snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
+	ret = snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
 	if (ret < 0) {
 		dev_err(dev, "failed to register q6apm: %d\n", ret);
 		return ret;
@@ -756,6 +756,11 @@ static int apm_probe(gpr_device_t *gdev)
 	return of_platform_populate(dev->of_node, NULL, NULL, dev);
 }
 
+static void apm_remove(gpr_device_t *gdev)
+{
+	snd_soc_unregister_component(&gdev->dev);
+}
+
 struct audioreach_module *q6apm_find_module_by_mid(struct q6apm_graph *graph, uint32_t mid)
 {
 	struct audioreach_graph_info *info = graph->info;
@@ -820,6 +825,7 @@ MODULE_DEVICE_TABLE(of, apm_device_id);
 
 static gpr_driver_t apm_driver = {
 	.probe = apm_probe,
+	.remove = apm_remove,
 	.gpr_callback = apm_callback,
 	.driver = {
 		.name = "qcom-apm",
-- 
2.47.3


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D7C3A169D
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 08:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117500; cv=none; b=sPBcTmgSS/XwiQfsTYmZOL+Z7PTaCtKD3Vr+IWv0kGX7qPoiU5RnjtTfw7IpNrMWUX5v1kxSv5qy4Td4MLntYj6Z9qUiNUN2o9aJ0ct986EtvDO0NEhOKXm5Rh6+GwRgmLXauadYFsEvO4vnrtkz902RjDfysQ3ooyYpFhEhsuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117500; c=relaxed/simple;
	bh=V5T/qd3TANJw1qd6u6VahJ4dPBNJ8hf0QkxJzpbMCss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mayDCFwbURLPjbXyEavqIfVr+3YUjrfn61MzpMISsPDV8ROUBbEOKVm5Hh7an13JW2n/1ok6Y+87Moq+4hHdSBZjAVE//FdTl0SiCdtUJ2Q4DkZ1KGcq1zOeB9vY8C4LdOFkuFLL2ufqS6dD21Drt9cCUt5pfBuPe4T+KwAfvyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PbSkNWHg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZdqPHOoO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PbSkNWHg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZdqPHOoO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326ujJX3044460
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 08:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8DfOih8+t/M
	QOB/k+M2wMzlDBSpU8tbUdV4SGt46IdA=; b=PbSkNWHgCqkcFCppadxGwJj/V0M
	4tIf033fSqeY2BntTkz0Xul6lzR8GgjgYMrbqsCySi3J+SwVkGUkbrfOFdz6tnwL
	3pef/4LWObTd0t0vvKZTctrrunk67r5TO+ZIR7FKTSKIZqatnqhUC4yVn/XfOjXo
	o2+2D7d1p+uvfiSTNf+pwIhfrUjeenGpNnRBmDCnEgJ1X3GKafiEIMBJquHEwJCG
	5ZoDJUZovVJ01QB3egM+7sEmbx01PCG7zgrq7W2EokjbVD7M3wPUV0YG1nufkRYX
	shVzGYlA87tcxANyGr6uCQH6rfEuP0BgLkJUuZi0nHIcZrn9qSHQ94eHHHw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483uuq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 08:11:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b781542c1so12834001cf.1
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 01:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117490; x=1775722290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DfOih8+t/MQOB/k+M2wMzlDBSpU8tbUdV4SGt46IdA=;
        b=ZdqPHOoOA4JUWVttAZKSA/bvTx6Qkm7wLn/1iyvpf59Ssns7x7Zidrc4lhqRMI3ZXt
         Uy6i/ud6m1lorYuNr3zZOyStRpXto4yMCVwZ+n6yUQ72MmI24TGTDiZPi0b7f4+IJmzc
         YVVeyxLG7Avz677hPIz6b2Xb3LV6HDW+UojoYp5wgnh5XetFrpYFsJWPWQaHPe1ekCex
         QWWssq9Wq0IAvJ8vGCm6HoIUb5e5a8ugQh/Sro8jwONGGYzznN0WrIeXkAH5NjGm23A9
         ABmLfFSrk2UsCNR0VJBADKQnGo41a2C++3sqoSzAO5Xo9onTYLW7CV7QXpzrkLqBcLbr
         CH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117490; x=1775722290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8DfOih8+t/MQOB/k+M2wMzlDBSpU8tbUdV4SGt46IdA=;
        b=T4DGXTskzK/gCAkUzCdFKIFJZgcCtJAE5xIU/JjR42ApIKtAGTqvzmGUBMsEl2/j7s
         Jytijb7kxJfFyXvmpXG6OTFYhCasAq8GG9SMiDLQLSGFzM8ENJ0Paody5L00ul/2OpO7
         ysj3lRxOUH9kHHGqfwnVXTgOM0FAO7SSHt9e5JBgDPnDyl3412OmvL9QLpVMnpmUFfYt
         3DGMGy6+J+2uCd89IU2qbh02kBKctq/ST4Le8HbhLbr/UQYcJSwk7gq67Kalro32X7Nl
         wxM/Wv41RPLQwsfFzbr/r38Yc3OijAUzNO3jC2E52BiTRabzHo0xeCA/Sv26YeyHLTzm
         kxtA==
X-Forwarded-Encrypted: i=1; AJvYcCXnnizSo0O7yxwNzO7Q5WdhRON2369Nd5i57NkrAxrCT2SAlH0q3eaB11p3ZHUbqV54K4GmbhpaGiyL@vger.kernel.org
X-Gm-Message-State: AOJu0YwsBRbpH9qmIKsZliuQljc4R9pVKnOdbPZ104rPS1Y98MIc3g5v
	Ton6TjQW7QSPXOL5quS809dD2lzM6mOAfArDcrZeNIhFndcZX2q1+IQgP6zFPcE3KTPmliZYSzj
	HGHg6hDdbAK/W9M/pKMV4Skrzbninm/mQCNKqhUnNhd0eos1xgYOpR0NciUJe/+h4
X-Gm-Gg: ATEYQzz3lu/tuN64yv0+qI1k1YnaAr5TBvG87mhFAUig9zwHFaxypGz3htXWo6XJ53V
	qJtOoofI7cyeuhWEzf7LnE/nKH5kETJAYT+LCEwHwIR/byPqP61pCNSPlYdNipOx1rfMoBTxfUo
	2MaouwQ3XFcZC0zYt9oijL6EnYYNzWAxveb1UdD7YO/8kohQqkmdr7inDKkRlK0j/trGCHlOgZS
	8JFMj/1baCSVN++pk2NrDJ1wKihfh8AHs+gOr2jGOv4/hNjolZihpzrjYEdsL/VDNg7fuQ5PKpu
	C7CjWmfKkQajszi7Wx/DqqJwUCEfkPJHATpZIgXC2Ubmk+WtZG1n5V9CbB/H4mb0Tw1Gd6SlS5p
	Lzd8S5XbpghEHwyYN/AFL6OvO0jmWZWK2vDcnR2rYHR13CdSL8KBDwDY=
X-Received: by 2002:a05:622a:5a1a:b0:509:e68:22de with SMTP id d75a77b69052e-50d3bcad22fmr89985501cf.32.1775117489663;
        Thu, 02 Apr 2026 01:11:29 -0700 (PDT)
X-Received: by 2002:a05:622a:5a1a:b0:509:e68:22de with SMTP id d75a77b69052e-50d3bcad22fmr89985181cf.32.1775117489213;
        Thu, 02 Apr 2026 01:11:29 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:28 -0700 (PDT)
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
Subject: [PATCH v9 01/13] ASoC: qcom: q6apm: move component registration to unmanaged version
Date: Thu,  2 Apr 2026 08:11:06 +0000
Message-ID: <20260402081118.348071-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce24b2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZjLH_7kMUelE1Q3ziugA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfXzR7pRiXY2YqC
 ++MshJjGGQfkfGYSFfHLK/whytcx0Tivv9SebGY1N7iZNJonxIY23VJy5d3s4sEqCopBmb4ZuJm
 the5iW5ZrpfDtnCbCpMSRcL67UnTRgJ1nVOPFeTUgi/k1NkaY6s4testAwZTg1kWK0mXsTk8Hb6
 qt5NXPq7jrmMH5nzBKxxBqxSAVXRDptOaJfYceITAK+bDcyZsOyNEZIJUDvt44RTe8vNnVoi6jU
 deA4SgoEdtkV00dVibf7WGCD2fpVCZa9Jp96C49vfewZEzlIAHS7yy+t7XO+X3V5MR36wc8oq+X
 10spC248edmOA006gKpG1MziHv3+T+3eaRMPxyruw5lg0TeCVAxwHisT+C8Q6VH3qnDq2ujx18J
 7P3l01zuAmvn0+SN4+EFo688iedovTswkYC4kZIkStXBUkUeNnGT155TtT/Nl1dex1BhzTbEGYh
 yzdMM3uFUX0v1SvtYYA==
X-Proofpoint-ORIG-GUID: LHHhzF1Y0ETGBjA1TVl6MlMcZROZ-z_P
X-Proofpoint-GUID: LHHhzF1Y0ETGBjA1TVl6MlMcZROZ-z_P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020072

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


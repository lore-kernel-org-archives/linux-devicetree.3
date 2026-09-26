Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D43396588
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 06:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790404528; cv=none; b=hr8bpE1L+GVsgf5q9Ni4bqJgK6PW+LGyEoJwVITOa/vD2iplky7BhiMbYcGZD5lJaDwK4vgjoTDakRZy+I0XkNwsYRGHcoXVW4xnAzz/BLE3DVEPlDV88l3E/vtnIDHYpnrqSaJzEBzz24nT5dc4mpF5r4jARUfcB+geAttedZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790404528; c=relaxed/simple;
	bh=u4T/TiBVjk6sDPMeOEWKmkDa4GYeq4h6p7YKB7q310c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LO2P20IVDsDkuwl4h3Y4avmJewuO0eiFebmH1kQkQBoi9DW/evGSpNw6b65+P7QL03wY3h18p/GNjCHYMAuiPQta9flXyxgosOvlojOL2tUHw9e+/kchdlCVYaN4zexaGtJNpasNcDG7imgTMx053yoXbMC4OiVS5OvJlAqoMJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WvR/bx7x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MyQrjvfS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WvR/bx7x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MyQrjvfS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6Oltq3267806
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 06:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6m/+51lEBEN8BFk27SUULRpvRuJnuqvGtKovB+gc4D8=; b=WvR/bx7xA6cg/5QG
	CGjdZX3ivwO7uwmiG97FC9fd49lpN7cjcvyXxGgGrdoYXGtW2n1caCg68wPEXrQT
	JSoAOlp7TbaAU1S0VEFU04qMjbQE1sJ90/gxC6l+3nKCYfBnPiyvZQzC5eP7ePDi
	Josc4qaef6dbY5tagV480CNnuG9P4PW3DJR8nvZ4GxZYHHtL01xEmvhI1///23xP
	whGLk4HpR3R2Zs9kQcxEDTuaEYLuFetywpEKpApDjmd6O/dgcXvY4SpzEN9HtSx0
	F1C75XOV4D3axqVw8z1hgyV92NhT5Qz7heldK3gOROo0b6YryTIeFSsR7Sz0jajL
	kVPdPw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx3dp0nd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 06:35:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-342b66c0b06so695441eec.0
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 23:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790404523; x=1791009323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6m/+51lEBEN8BFk27SUULRpvRuJnuqvGtKovB+gc4D8=;
        b=MyQrjvfSE83b0J3rXkd0oKoE3wYpx4lk0DIpIg/n6cn8csROB83CU0q0WLvl6KKTQ8
         hdOeKJ5mEztU/ZrhwdFTw6zoTj4EgleIuDsMArF7hncxXXGFsNsb3d7WC5AYcxu2/DRi
         y3s78X1M+k7V0DX6hu+x0IjrNVU8HgRw1oc45JA2fgaTT0apV3ruwErim/FcBailUjzg
         Ou35jDshEufc99a70vUdQXbeRkrl9OBx/Cr0DMiWRbnjy74lmqNfPR/7mJ7LC2ZUcdg2
         pxKxzwwoe8qW3FVEkMMIJ/wdlY4CCYfVxYjkU9Wc/blWnJT0nAuHqBnPfdCHU0bTHIF/
         GnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790404523; x=1791009323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6m/+51lEBEN8BFk27SUULRpvRuJnuqvGtKovB+gc4D8=;
        b=uY8VNq433BxI0mSOROkfyilC3Dz6koMhX7CKBlZ6DyjBGfDkuTtLF351+igZ4qrxxf
         MfGr359fsKvEYAdGNRaKt4Vh864EN/3vZ0AyOCvxkou3u2QnH5rUWE7AbMss3njhJNDN
         ma2OX8W3aqxkR8hWd/cWYLdmnPJnyVv1MEeIBxaQszRvfE8EpBLvKAknykZysRbEZd5u
         Vg+KaJJkgcuL227sM/erCq4P7Yao7bmgrQ4kHxsEDn+gVxUXgkZkbT+SqQJrKmtdnHGQ
         mlkmdz2Jubp3vdrmuI44O8tPKYKqLcKywT6L3lzzXviXQvzb448l023ApvgBPbDLsoHl
         R1EA==
X-Forwarded-Encrypted: i=1; AKwUvBzOKPQFOnXdtdDyoMTjBGq6TvuAuTcpDOVeHZIfSOKA/xhOIVsOqBA8exP8we6Xv8dPrgTIIberTld6@vger.kernel.org
X-Gm-Message-State: AFuF++k5hK4WOP3XMqQxsS0kA+vTfbsgPLB/6q3u6yYL5TGmX//TRJA5
	adpYKxH4kQgQD6QZ7xbyloy3/cZh1vgIpDWAmsgU2ch5yyfRUPmLNoqEfUGf/1YzpkKD13VDGHO
	SxI/rKOccbKgVOzRjlbhEUGP44bp0oRAi8/xJTIFh5ySImSegIoI26homaBDgNKSQ
X-Gm-Gg: AYBFou2cf3Fh7hpKyilSK2N8Tt9Kxrb/X4Z7X7Xm5Rrda+eSXWWlWy7KrQoAOXFef4k
	KSbJ9+PvD7jZx6cpZebLeeDIyPcyCSvuXUctdDlGp3nUBjeLgSi0YuGSm1uwsQmtiVIo1ptLTBc
	2qUe4DRUq7b+mXZ9+g0U6BCfpnCvkc48OstVwZ10p2I+0QVAWABqr9kEPKJOnggCsMGTIwnPnZV
	w/1uw3sUuez/ymXDylW/73RWRvSY25RZ6wmp7tVOdkUwwEl0mpjIwTSEnJQ8C0Xw7Lyb6CUR5ZI
	oWyWHSgVrFohFeaDmkqCgb4B0t0f+hWSR+bB410q3UuIh+OOK428sHhCUpFSFyR52wMwK6GzP4m
	8KVEpYBr4pb3eE5GX2fsmjEr/9M2ul6LuIw==
X-Received: by 2002:a05:7022:288:b0:144:fb8d:4706 with SMTP id a92af1059eb24-146ce4928a8mr1873690c88.6.1790404523078;
        Fri, 25 Sep 2026 23:35:23 -0700 (PDT)
X-Received: by 2002:a05:7022:288:b0:144:fb8d:4706 with SMTP id a92af1059eb24-146ce4928a8mr1873655c88.6.1790404522317;
        Fri, 25 Sep 2026 23:35:22 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm9700691c88.7.2026.09.25.23.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 23:35:21 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 12:04:06 +0530
Subject: [PATCH v5 07/13] media: iris: Skip DMA mask setup when the core
 device has no IOMMU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-vpu_iommu_iova_handling-v5-7-0322ca5dc10c@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790404457; l=1806;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=u4T/TiBVjk6sDPMeOEWKmkDa4GYeq4h6p7YKB7q310c=;
 b=aTqmwyfdbwKoeMl31qn9fn8d/WIqjVmq4VkgJAeoaw/HXo1bp90GA/WRWEOOP9Ty2MVmVeS7G
 45JC5KMPsiYDk2FGCR2jaytaTpGPRzXzBq/kGzSG0HCQj46VCQazbHD
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX3HkAkVVxhNPe
 mmYYud/WfSzcGGU6+wwK9Bk/7cf/HJ+/MmBBIIO6dXmSfHa5IujK56m+Yv0yPuLuRQU9mGLv4O1
 vizK7qhY3mGyJxBIBCxXnhUN7fXQjVHmaghUqIRdsjr7vBErCvvT6gHGpN3U314DYbvKcTGitWk
 /IqdRjGQ6DImsKKm+E2aJsav0Zsrq+Q0WAjooPQl5aH6uNj5VkfxqjRuRCMFnulyuTcCfxcNdqI
 xjGdEnk4NZOnA6iDzwuqvJE929c5SHinF8/aV8veha6+bkLOnGeU52IsKdVW6hXEBPjdLQWzPBl
 YTYThTG2E4wksu/RLtbmQMNOikI7bXH6Ovltex63ed9D1Tp3G35SXZA+Xi9uRkl6igSoWtgOpbN
 B22srxhXj5rQ9zGpZTv5So0aqgg8W9Xcpd8VG7F0O9+zT7IgcL6u2Qaf9Y/ayGQ4s4qXa9t38j/
 29pBRd9wzm8dv+nCLKQ==
X-Authority-Analysis: v=2.4 cv=QsXLTlyd c=1 sm=1 tr=0 ts=6ab767ac cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1uU0fEruEEfCXXW2WGwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: SgDZdw7nDPlIVf_6muDp88LgMrKcptLd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfXykDT5xoqCebl
 BncpESxy/6rQiiBawYbqYDFQPIGBQfuyza7I3T8If1Q/oay7EXatC6XF5SA4/bPakgPN6LSzhS/
 Y2eF2JWoZIdbScRY3Da1u21nWUjWEww=
X-Proofpoint-ORIG-GUID: SgDZdw7nDPlIVf_6muDp88LgMrKcptLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260026

Once the streams are described as context bank subnodes, the "iommus"
property no longer sits on the parent iris node. That device then has no
IOMMU domain of its own and never performs DMA directly, so calling
dma_set_mask_and_coherent() on it is meaningless, and on a device with no
IOMMU it can fail and abort probe.

Set the DMA mask only when device_iommu_mapped() reports an IOMMU on the
core device. Platforms that have not been converted still carry "iommus"
on the parent node and keep the existing setup. For converted platforms
the mask is applied to each context bank device instead, in
iris_create_cb_dev().

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index debd1f0e57038d7abf463e82fd80f887b67750e8..4bdb078d83b5c331869dab2409bc4d10ab302737 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -352,9 +352,11 @@ static int iris_probe(struct platform_device *pdev)
 
 	dma_mask = core->iris_platform_data->dma_mask;
 
-	ret = dma_set_mask_and_coherent(dev, dma_mask);
-	if (ret)
-		goto err_vdev_unreg_enc;
+	if (device_iommu_mapped(dev)) {
+		ret = dma_set_mask_and_coherent(dev, dma_mask);
+		if (ret)
+			goto err_vdev_unreg_enc;
+	}
 
 	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));

-- 
2.34.1


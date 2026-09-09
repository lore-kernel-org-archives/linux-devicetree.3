Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1896583AA8
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 14:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965911; cv=none; b=OkDj5eDPK5q2Q2co7dreY6ceyLpkOK1bGAOKTLHnB2j6JnKA1pa0SZEytk7HxV8FyGCrv0Z70WOjCIokunzHoCPIhY6HWryOxEHWPCIdx4xcq0kiCcmkAmJMAwoCny024SFWOrFtWJueDEJdMC+3vVuqRkHWxAx8U9GxDJNavxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965911; c=relaxed/simple;
	bh=P0mNJFeoCU6tU7rrQorPgkeC1RVweTgvH8tb7j9zhEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V4vsUSWpcy2j1ACvI+jGTZ46BmK1F5a7uZiwlVInEmm1IFBAw9iNrAidjSbbVFa5avmmk/EVjc1dFun/pWR9YnGFgSgR59ymWYH2pIxfKmWaYcNWVRaSCobLgBK94hoZ9riH/W082EQGv+JML/urS64cSCSC5GhigSS+HLwFh1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzGWXeH7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FnoD7aqs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzGWXeH7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FnoD7aqs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU7Uc2375936
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 14:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qmdf/9peUPSB/yZJlznGcLTDuFu/YJIWa9uggXF29DI=; b=UzGWXeH7BgWZKVza
	sSwfqPaHnxfVnudesso6SrqOrGTuTaBTYW3xJOVlp2ni4fZKfE8j1P8pZ33SXt5A
	tkCiUI5V1zehilUFQ4y3DkwWFThvJr3vqQSUg+9L5ODxsW20bXasgt4qYnkU5O2G
	MHQgLgGxE5OJVOMddY2bflzFp0/mJVUklE6oEXB/39IlsbemWsekXGENHgGGq123
	d5WewNan50vsZcjWD95+gZZBtXr7I34asae6Irx8TkaiScvcAVw5jyeGZdEXGA8S
	dEcNVw+jt/u02H/Lx1IU8PkgHOoY188+LwA4uylL6IXE0Bos+eh4wJJq943Pup3y
	JW86Xw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5ru139e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 14:58:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dc7337e2a7so15799465ad.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 07:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965908; x=1789570708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qmdf/9peUPSB/yZJlznGcLTDuFu/YJIWa9uggXF29DI=;
        b=FnoD7aqsT7ldW5S5w+/CFYUlFF86frc34FxDMDkA8XB3ylPMx+8Z24JMHYZsaSNgn6
         O5zPQsIdPardhCKSHtQjrpsfqLLNd87sbS5Lr1lIaeMJRVtdOXJAsfJI3tpqJLLBrkfZ
         mrEsL/TsfWhCernZvW3UOjk5aEYMxMnVtzYRt3KDGTfNZojh8N03YCti9xyMDIXxkHzG
         IoXMvW2jy5mw5EcKSx65xnyYH9nXZkb75JqojN9Oyh2fh0rPMYyRNfvVLmstrjwIFxVy
         V4bfl5NMC9tybYiC7+HvFCMO/rtKR0xes7tzTNmg4cRuVCE+vRc58HfNDbAnOw09Y7sy
         c/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965908; x=1789570708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qmdf/9peUPSB/yZJlznGcLTDuFu/YJIWa9uggXF29DI=;
        b=ad85MZYbHUYYdo+hjQW0p74lNoDmjd1TnrOTX3YoXQZIYqEtWPB4MVz8LoM7hfkqec
         /u6AU/a4hRGldqTkT/GQafMBNocXPzkVTN6WGCYfP1nl9Q66C/D/MfbMX397WLAjj8Qi
         nSCtCsExpGdPTF240unFbcDjR1TA0HFmrv1HaCSPSseX9eCAmbsKqKOyeT/BUQBZSOjq
         pKdKx4jDsNsjW8xyk/Jyr/xb0PQA8BlQI5A9MdCACvv4Opheu+TOSIAAu+MV/pNrH96T
         lAKa5zW2BN/p+9RO/5Cu4NPpKuPBSzM145D0nWfC1zhqMVrinKpv/saaaq+ynReZgbsj
         Desg==
X-Forwarded-Encrypted: i=1; AKwUvBwreI3515xJ6se+glVH5AKireNCbsPNxHZqQpDZK+dNH+pBGakEXl4KSddkM28QCA2jzfxLtJ2hC4VJ@vger.kernel.org
X-Gm-Message-State: AFuF++mFZT/25E7nXwA83rPaYiPe8xXqAr3riyZ209wP0c0PgE1VNoMs
	wB9osgCx0NFkooL/73gbd3KdL8b9p3cZ5LVSdfgmj32ch+Tk6hRA4CWi6AEowcD2yOZPMavdRcZ
	FSuek+e3JVZR7hy/vV4jPBU/E9Rq1ZdGAGu43DM6dVhtZDyBGBts39nA5AQg0sDNR
X-Gm-Gg: AYBFou1ldnqy+yj+rvDqQIw17aBvWCDcyEhf3jtVJfL/skFca/mJDv58CZMg0lj778Y
	Kz+fYLa7xkypT2dLOI2+mSWvmGQhEcCAk3mx7Y+AmM9OHQiZGuTouNNBde7Rj2xQtjdaKgAax0n
	g08X+EVBPec/gQAQXJU91xSXXztnmyUkq5YeWISoDmzy7i5OoslR+LTKAG6nbuo0HXX1pV7i5v6
	l1QblHElMFRIKcq7ImsMTzu9Y2rWgJhCZyN7s4qcKyVJfVmNWgGoe0jT79zeZH6igX3c0SGBGVo
	B4eI4rxgAFTZfdEsFYZ86C4OeeWuZUqELM95k8PCM8p52oacPsghS1Gv/5RdyYo+WygNT+a8OXb
	SUg7jZc4E0HVeHqP67zmP1bEZrvMuCaOmeaU=
X-Received: by 2002:a17:903:4685:b0:2ca:660:b1d with SMTP id d9443c01a7336-2db126d8c1bmr522698745ad.11.1788965907646;
        Wed, 09 Sep 2026 07:58:27 -0700 (PDT)
X-Received: by 2002:a17:903:4685:b0:2ca:660:b1d with SMTP id d9443c01a7336-2db126d8c1bmr522697945ad.11.1788965907033;
        Wed, 09 Sep 2026 07:58:27 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm51270766eec.21.2026.09.09.07.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:58:26 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 20:27:14 +0530
Subject: [PATCH v3 07/13] media: iris: Skip DMA mask setup when the core
 device has no IOMMU
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-vpu_iommu_iova_handling-v3-7-2fe43ae45495@oss.qualcomm.com>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
In-Reply-To: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
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
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788965841; l=1854;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=P0mNJFeoCU6tU7rrQorPgkeC1RVweTgvH8tb7j9zhEk=;
 b=cKL8bboU/o8pJ7st3/DmPUsCFBQx+gHEH1oyDjmqNJa6iQ4GPaKEavhxB97yy4sf3bpCIJ+O6
 LQ+v/XQqxO7CPJV/MD7p0/6LCHQ6EZ31C1xYHZOnC449F3y8lAkD/0B
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=M+997Sws c=1 sm=1 tr=0 ts=6aa17414 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8 a=1uU0fEruEEfCXXW2WGwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-GUID: idLaA-QlCP14Pu5nfcLMxVyOodz41klf
X-Proofpoint-ORIG-GUID: idLaA-QlCP14Pu5nfcLMxVyOodz41klf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfXzGfe82QPiy/p
 INYdtU/m0q+xtKMi+rH1i1z4RKoJM5vXA3ugM+NIQ29i7ELs6QkP6vVIhSQGR1EQkXFO+5I0cFz
 44PYN+Z0idUkrLdMF98Ij8cZLvlJAGs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX/Vi3iNCV9QkA
 +nhtod3BOaGnmSzmF6Em5ki9pO5VHv8f+XwlEebxzYzNi+5NE/X5TxyiQcXzwROI1T0s51F8ms+
 8wSLzVMGDpU4c395yb+vW03jgkmt+Ms0QaP7M+bmBMsFPsP3B7gEJN191aL3mlfRjhIVemq8QRM
 OEryUcb8cdPqy9m0tMupSaRsACA5zeOwfIyV1J9X/53tcR5cddCr6WUgkadttKiIS721s7Gt3dx
 zqNgsWkW0dwQdHOdr2gVJcdLvoZorK59Dw5Zt/bERt6FX/zyFeU80l5UPSPhKr7ZH8jCqRv3/Vx
 JZP24+dXbpJNpR5HZmS0YYt1Cgzf8Ai1fwQaKw9pXW6aH1lOr2yIrIx4JP7Qqv6tZc62aR+BQjh
 oggkpfoOBg/U/CBxn7DkLvW9JN4t/kB7gGQhD8rfL/oUGfTXKWPjQLCP5Da6wDcffo/fiGqnP4+
 1AGJlku+UBJtDjZKu7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090167

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

Tested-by: Daniel J Blueman <daniel@quora.org>
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


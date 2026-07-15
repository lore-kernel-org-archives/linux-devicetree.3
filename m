Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1EC37C90F
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124648; cv=none; b=DQLC8+auLjgkDF6jOXfi/6ZJzNPS66oD/wPjeMPHPpzToVVEYO+bf+dWNpfOyVVf+Lq3P60bbWJkjtwiP/YvmxEBNBx4Qc/Fm3OoGh2tBiYZAYj6lDRUd4do6ONh6lfi3pqJtYNCDA04yL0o+2wk2TstoC53zDmscYNe2ghAvNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124648; c=relaxed/simple;
	bh=xDKjG51jBAk9EXSAgV+S8o6yhO9zrtRBIJx3AXPH7vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IxHnyRR0RPsZSyUkU/nke2fcwriaW2tzNn6rB9bfKmtUMz+byeQ1XrS6AcTy78pw6AHaVnTlCgLk+pPVaEl/11+uXem5Ao1TNyw+XSW6qrpN7IvSp5rRpU0u+pDToAJEadKZI2PeKliy9hZONAKIJKM6uLWkReG6QgFcSOgYnR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XyxjMH36; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UsKlxXjY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XyxjMH36";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UsKlxXjY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FE43R03926958
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jQ1czwxEPod8YlqEh+zmO/6OKv3iOp22VfF1LBuIlCI=; b=XyxjMH36YcJYCkgq
	TcU5Kyl3MDusL3IHng7fMmA1mootoYxMMTmttEKkJgbs7i4vnplaKd2roZzJ1p1P
	QdGBkf73b3BxR8aByaWY+ZklGtCFDuvpPUUB3Y+s6e4NL++gnWr69Z7RAVRLGvyA
	SBWR/u4Wxa2tcb71VVAONa/ZIXpS6XCuniX0SBuFFcr1fh/B9EFEcYLRWd6v3wxo
	/l0x5N6Y0XIwF9PCeEsgC/cMB99Wgsw/GuVU7/fTOmwyuLbk7ToPo4CgP416peC6
	4pnep2+FnBJFShicP1fPaX1jSxcED346tWWIhIkr2iy6tOanQVJv9ZUx/MPHAQeK
	MGb8mQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7q611yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:10:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccd1958e8fso30529385ad.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 07:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784124644; x=1784729444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jQ1czwxEPod8YlqEh+zmO/6OKv3iOp22VfF1LBuIlCI=;
        b=UsKlxXjYvAVYe6VUxhEiLmargQEKf7noXHq+ga1TSoVYzh7GCN1yo8Ho9bfYbsl87y
         dx34nzIAXhmNc2bWL3hfjvVU67Gjuh4YLaCZgR/WmO4rvFVMcdKjTgV/Ttz5MHEhugEs
         +BRW6A57uCsZrsf2nr71mF7PC01APZeqEHS8X8/Q9fb31KvarEFk2r6aaEDhhi+Vshx2
         16wDgdnz5fctMr3YSxqLe+L2OwUbLfc8p49MyDIa+1g70Rm7iKEIM+/tCMW0B4xFirU3
         2qNCUHWdY22HOOU86MOcdwKKJjOF1zobAozQR4bLMoxVOt5KoauqiGXYT9bfhnrL1eIq
         tXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124644; x=1784729444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jQ1czwxEPod8YlqEh+zmO/6OKv3iOp22VfF1LBuIlCI=;
        b=mK/zwunxCDDrvhmbJfdIxIDfXQlcpqqsBPZ2Fo5VFe/IbUNB/cr96pCK8+hOpJkWrc
         FXuI4eaQWzB2l11tjmc8pLgS+iDTcRDdGdruTF8Paw0TqRJyrRnHYiY5HjedZ1CczL68
         I94/har5Y4l25yColNQRSko1GNvmr3gYndhRWD5dPIWQT/5T0w3rUMkq81oi8HoAsi8g
         2quhRxMjZ4nNMg8XGokruQc+ldg2kIFeJv8eqt5amyxMGhs8dmarGHVMbhqjN0CAWRGJ
         9Zk+EfFxwU9nyiwlCFuyJRKjdCLRGbP5yzBDrk/4bsyny8mY6YoQFbmC6KtQ3eukw2P5
         2DuQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrs8yJM1JT3uTn+XPhZyOutNjIn4sxhQ/dASVD/y2zM/iPecJjGJD+W4TO0GkKHPq6lj7SKLsYL2Xul@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvd7vMlTuGxBMw6nR/PK9KtB+j2EYR1RDzXpjVqXzWABkUmPLp
	n7Rz8PLdy4AzawLTrIM4qVG08D0kvlfaUDOKs6+1rGcUAGpahD+KZEYCJzeovqgWU5zOkj1C5tE
	6GNLNvpIX8KUwdIhCkljplKgqziRcF9RGhbzq6ma/liSNCCa12ai1WWWBjV02PROT
X-Gm-Gg: AfdE7cmQP+BpSHSvgjaJ/R5NiZhQcs7oW0VfY3Q8tnROgogg0jS41PjHklQXVpif+Ay
	us+Yv4MWHDLHbiDY4z37dwmHL5kMOirxJCgWrRBX6SeEf1FDnFHxqXsRug58Zd38K04TlRAfIJy
	ATfHZKIEA9OFnhoXa8ZVBJdnzHEHK4MKi/7kM6F7GlKO8dxfQReQqu2tjHzDqI9GAafq1l/XuLi
	7sxnCA5YuRT+MANKAidBM2jn2FWikWkztKKSKC5hFo577cW9s+RfW/7j/peWHo34Hd+g0Xj1MnB
	yXskSJJKanSYFLB3NBh8/beVpUvWh4o4g6m94y9R6a2B8qvCjVXKIL6McvwyD2UjxuETvnsgUlM
	2yAizcvjlmMFAjfUh/JOkX5ozQ6dorcNkxT7e/hsCW/7U
X-Received: by 2002:a17:902:f68e:b0:2c2:cf20:213 with SMTP id d9443c01a7336-2ce9ee1142emr186082015ad.29.1784124644511;
        Wed, 15 Jul 2026 07:10:44 -0700 (PDT)
X-Received: by 2002:a17:902:f68e:b0:2c2:cf20:213 with SMTP id d9443c01a7336-2ce9ee1142emr186081605ad.29.1784124644086;
        Wed, 15 Jul 2026 07:10:44 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1070b68dsm2913215ad.79.2026.07.15.07.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:10:43 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:39:59 +0530
Subject: [PATCH v9 05/14] media: iris: Skip DMA mask setting to core device
 when IOMMU is not mapped
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-glymur-v9-5-8cf2cbe12a07@oss.qualcomm.com>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
In-Reply-To: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124602; l=1589;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=sjEt7zVED5HiiTDKACtd2anjSuOH/+nGuerIdCCDwyY=;
 b=Akf49Yj7dW3GwqxuoRtoRP9AK2qcSXDAAVD2VoECqphz29qaa69SzMfa0lyuS81QJoZMYeFtN
 VXSV51eLUv2BIs9kTVKE9Zn7eYjgvGiQ1FBu34jm+ykdqzRBARCJtpg
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfXwRIu9yJMfTLZ
 Ud1TdK9G+VNbxbbUenxljqIak61qerdANj77LiTkdAonGkxvR4R9zgCNY73Fg5GA+zTgf4+3wpC
 q40KWiwT5paUSJgqQY3P+cQ06wiqbs0=
X-Proofpoint-ORIG-GUID: Z4K70p2RLVpLb1h4hoEh6UdpUXPvL9BD
X-Proofpoint-GUID: Z4K70p2RLVpLb1h4hoEh6UdpUXPvL9BD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE0MSBTYWx0ZWRfXw++qPXrcw075
 KJddmyroNvzOGv+uUqIhPMBsyhMVPx5+uvqSYS5Kq5GcYdfNqEifbTLFKcLel7deSv9xJ8oJBxS
 8xbTvY7GrubuaTTEUfcJe+/E3OGxAvf9ApmCB5o9z8Gc/laWZ9ECEtVUeOFjkjp69LbtfM8jEAc
 QMJDpcpvMKILkyKHof/hS8ovt/hN06uQ+Vx1shn4iLpvGrjkQCA9fAwrFU9m4YDy14vSi0SoPz3
 BnXdgjUOIspqKfMdtmpz8eGHaKv7+gv5Ia+6Ge+gzQjb7oIh08z1yfgNKIskCpm832cPcEwoKKa
 sifVwLxJKz4W8PWfk0KQjjxEsNY2vwAR/dg5mEgeZTCZtKQVKgTrhsJ/ATkz8Mxdz4gp8bq9rM8
 VK0h7Tn0cwRgaU0fqy6Wd9X4X0IOK8R6jJ5h4H6UovxtXFABEbmjmvfhM0LQ0y2Eae1H3CQLN+R
 dIoIXvV730lHGmOAGLw==
X-Authority-Analysis: v=2.4 cv=BajoFLt2 c=1 sm=1 tr=0 ts=6a5794e5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=2w7d1ukKp82XeiQ8bL8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150141

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

The non-pixel and pixel subnodes move the IOMMU streams away from the
iris parent device. As a result, the core device may not have an IOMMU
mapping, and setting its DMA mask is unnecessary.
Legacy platforms that have not migrated to subnodes still associate the
streams with the parent device and still need the DMA mask setup. Call
dma_set_mask_and_coherent() only when an IOMMU is mapped to the iris
core device.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 2594f5a67378..c40c4ec44e83 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -310,9 +310,11 @@ static int iris_probe(struct platform_device *pdev)
 
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


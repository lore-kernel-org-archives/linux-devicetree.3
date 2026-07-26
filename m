Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0143446CE
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 05:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045070; cv=none; b=jQSRCmx4rHFJ6xmRP0azdD7YdEioPuCq/DOs+SJAJ1NWUD9YM+2E3xY4bL5dIzwLeLy5zgWLTjwjftOkTa+4Zb7Zbdy4vHQTZxkMkGkkqcKe5/hQbIxyNXM9YcZPVLaycYPsyd7OOKUZtL3JZQqRBMUvIVF6iN15ondn5Jm001Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045070; c=relaxed/simple;
	bh=xDKjG51jBAk9EXSAgV+S8o6yhO9zrtRBIJx3AXPH7vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mkcAPcvxZnMyxzJ7NIFrMOS2G5HtbrLchVTEsFVRxWkDgI7ezC1260K1bfi11rBCj1orxdXD2R/FKO/OLfRh4CGNGNPun+sbOPpgYXksYtf/Q7bUQA2bOxEUhA+79o4Q3lLNpMyb/hGFaaeARhmMydhZwzEaLuSeRWa5iJZ3N3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KwGTeHUW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q0ouv6db; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KwGTeHUW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q0ouv6db"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66Q5RKFT3890750
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 05:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jQ1czwxEPod8YlqEh+zmO/6OKv3iOp22VfF1LBuIlCI=; b=KwGTeHUW6FX7mFlK
	GU+AWAHgeY7SH9E2NjijxyawjAIoSyqw2XXqZSW58ACr5lQ6oYbtAPmbQ1Zf2f2z
	Q0UuN1yn24nZ9JahVMy08dHfN1CLIAoe+5eg37CZkldTetU1g3AwKsburbwzOs6Z
	+8zobuvYGOTjOmSRMWZACGFZh0nLjmST8Wjt3BGiZkpKu7UCbqv7df5UlBufSkZH
	to8SLm01PU/LORBn4XNNQgzsHHXmWryDtxCIcayJ1w6Ihs56GyZ930GnMwNMD5T2
	iZYxrl+L0WiLJjVz3fNBJ5OCCSbxE1ADdnLUjvsvJvWOgmYT6jkwWxQX1nT+nnYT
	ThoIeA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnwet7eq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 05:51:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so2706297a91.1
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 22:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785045068; x=1785649868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jQ1czwxEPod8YlqEh+zmO/6OKv3iOp22VfF1LBuIlCI=;
        b=Q0ouv6dbApbhfv8338H3e+HLuqSHQtbuirNo12nDNyuMVqSStFmfvJ7eBvJQgiufmp
         TDtuJ+1uuN0DkYkuGEoFJ6+t62EolXG4TGOgY+FkG0EV0Tj2p8/d4Elkr7d86JpjCOJS
         XGy1uHZIu/OpRYrtUdudCuA6E+A0SzwPXDLwW2nw4qYCI1znPDB97Ng27zDhA9gLU/8r
         EmHBPvp6d8sIcM5xQu3FuGe2MXJQz7hOteaHIWgayOOzA11NRX/8Vb0Wbg8uhKOBw7YH
         Nj+Uhc17lNDatXPhDUexHFNIdClMImBhEw82LFOtc5s0LLk88XZGP3VjFrAR6nnrZEbJ
         l7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045068; x=1785649868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jQ1czwxEPod8YlqEh+zmO/6OKv3iOp22VfF1LBuIlCI=;
        b=Xbel7rBZmf5eMlsmaQuo9j17fem8pC0Zwp/gstuUD0OLGKiyZMfwJihuee3fJXVtfm
         JS+VxhPR6SA80+EXq29f2SoTPTBm7zZiqwPgq8z7K1C/Ht31j3WhV+Fei63RXw5z1rmS
         eW7kxdqHWiFre7pwl6sL/l6I5jTXYyndGBW409sQngvm0uglx1TsVHiasr9wrjXpk8aD
         g6Dm7V7r37cLxRkCu90l+YGmR+Jw5kMTPxaIvNRc6GsXLorhpsoj+SpmO5Q/HDQliU0G
         8cG6JMsWCqkH8L5fnqfhANPvJnlkn20DXR3PqDCTTH6n4GYBa78MK93sXPo7ayAQT73p
         T+WQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7G5Gn1NE4EMELVvlPGMgGA1wdJoOCF5ciglx7MNgn8twQW9n3V+TiagiUKHf5Im/aoT1uADClcz93@vger.kernel.org
X-Gm-Message-State: AOJu0YwM1S543IvzMfgmipIeKxStAeG5DeKl/hPeDVMOUAVDRsMkB74Y
	EuRQ5TAjPz6K5hgSiRw7+psBB0ispNYu+i9YLQxvupB+jYMI+2eJ1z7onbunRRYO7HAOaq2+C7t
	0wz5/CrKR5h0Qr441YzznkiuXQrLq3GuViyk3AUQoHSWI6nBWZeHwjbX93uY6F6fz
X-Gm-Gg: AR+sD11KlyZiqKeEP1Y4Yh52pGk5NMcphBZAE4+Z+h5ea1x4inA2X6vzJcFV+tSQZt4
	3FO+2rgIaBIt8Z4RuAK1tXMzZoaCaHS2fns9oBXA4vfoDa65esGVpbiE7k3C5D8RRWeBXfhOqJ/
	3VF5UfMvmdf0ElxNxs19DneqPLdc8Rdb5o3lP5EXqpZNmoFq8qw+kafjyl2uGYPA7k+ckX3rm6B
	lz/BBFzGRo47b7N1ywU0EY6yy7RpJjO1xzOYVUJ+crlaXrt8mzoUWZbVjFcmjrmAGOBnM63Bdvf
	642AEb9JoLn29NAxYnNb80jmLvnTqzBfEyKGMQT8Oa/dIA/lXD6zCwp2Rt0pXiabCpL0KW58eQT
	X5373hw4YUYLV8P3ZXgNsHSrRsDJBKMuDJg==
X-Received: by 2002:a17:90b:5826:b0:38e:5717:9cc8 with SMTP id 98e67ed59e1d1-38f29641b0cmr3946327a91.31.1785045067923;
        Sat, 25 Jul 2026 22:51:07 -0700 (PDT)
X-Received: by 2002:a17:90b:5826:b0:38e:5717:9cc8 with SMTP id 98e67ed59e1d1-38f29641b0cmr3946316a91.31.1785045067506;
        Sat, 25 Jul 2026 22:51:07 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm67106334c88.15.2026.07.25.22.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:51:07 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 11:19:35 +0530
Subject: [PATCH v10 05/14] media: iris: Skip DMA mask setting to core
 device when IOMMU is not mapped
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-glymur-v10-5-de451559e88b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785045024; l=1589;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=sjEt7zVED5HiiTDKACtd2anjSuOH/+nGuerIdCCDwyY=;
 b=TXxBZ2BqMAGG7mX1CbjEnNvxqlAPSN0TiUg1f9lAQu0t3F7vfKudeZS+AxNfuS6qb6gqBDoH4
 lQBGTFPNT9BDHhP4A23MEhPt6BoAPfTtzMFhc1SaHmivbzMpYkNxxAN
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDA1NCBTYWx0ZWRfX6Blf+xskS3Zg
 Ik+qgRmhZU/Al4B9vt3Ib729pGBkoaC+03ckrdIY95Kb4bWtu8rVrlCewxjD90NLRyv1y5a7XlP
 /ol9oyBnh7bxcMUTJlFbtf8zn67mvTVmdUl8VxF7xhOHP6cG3/qMrQBHrK9xR4ZgHFGkSwDTSao
 AMcqUZ2d0JkA2gIZfHBSl6MvEP+g6t8Z1DGwxHc2d8WJYcFKP4IuNxiDS7im9vDfs4eA7zj5LrQ
 SJR6wKducrxdvex8Rt8D+iARHY2h8mxH8dixVQN1LGK/DSAHBcj9pEyMs+WGyr+VtfGaJpDJhbb
 6sF7SfUeeNug6m033Om/4PJZ1FV/L7+4WBek/4e3+bVIHzWFVHtde3ausbJumcDIA32Lhsnm13J
 wqlHFnKuo5sA78yiKWHUj/QorEoth5V/VTkiknOrRNPSiPCc+mzH0Xxrb1vxx8JmIeMkezQb75I
 ahNh5pXDOPCAvL8Y/dg==
X-Proofpoint-GUID: -_H9_gL04b7Q5z9DsX0Fh_9Dprn1BVB2
X-Authority-Analysis: v=2.4 cv=S77pBosP c=1 sm=1 tr=0 ts=6a65a04c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=2w7d1ukKp82XeiQ8bL8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: -_H9_gL04b7Q5z9DsX0Fh_9Dprn1BVB2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDA1NCBTYWx0ZWRfX5Qgw/6eF48WZ
 45vKmvjRhItJ+sF7+QwIOKf3EueW1AKgfam6vQrXoCdX1fI/Cd3qJlCUSgPphnUQ9R6ravu1YqY
 2TjhDemb0qLanet4JaoqkPQEL1RiMMU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260054

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


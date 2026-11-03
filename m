Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720511;
	b=Cep3wA75MhfCJ+RYXYYMEurtj+hJ3DrR1LcVUmYFsuD4nFSPfysmR4YlAjlq64huaGZS
	 R4OVyqwPb3TXFcZIH5Ngq041WrUAE85hcsg0k6f7YnifNzgZ3cp6+Dw0SRVMVIeB4FiaL
	 1A5URjYKRBwAKla3clQmD8aJpaBQ6sP5lJAhI/kwz84JtojauP60IuUTZlhIQl88JJfZM
	 CIyvyefCgCsrp6i+xcCDB9bQS7VBcuMm6pYNiPEZ807CM4C5LUkjXEtStJGSZGquwxCCI
	 oNjN6ewy8SeljbNx5yO2LbBKYmCgwljL+0TFvqqPy1UV27qMXGIvgSX8AbTm75c7hvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720511;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3ia+VFa9NMumrt7e1zs403nDUUizJyxMYhZDrStYchg=;
	b=PzN3pUs2VRFqbw/RooyryfZwjNjxcsrJcsAEZLChj5mvlx6ThjULfpPOFerFNdckDuJ5
	 dNqjSS2cISw7RXb069crK2YQhL1FQqa+mgJQxh1MZ5O8RQkTRYWl9AplsUDyFIIjs8dju
	 Fs8XUpTtwKuzDiuaZ8EsMLYzhZFMWkOP+/j7DjMRS5uBWA+3ZWoXuebQkE1Uvo46SXUHa
	 Yw4h67AsE9g5WVTZJzwlZuH8zy9v9V/mqOydJAaWto4OCL6lWsRqynaowO7qidq386Igt
	 WR6X1EqR49qD/KjiLs+4JEBm9y2uGT0EqTbKmq/SJxX1pA7quNUWq38/RHqLHqgfeyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F9wSG5dE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="OjFr8S/0";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3470606A32C
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 15:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3470606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F9wSG5dE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OjFr8S/0
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9xG14104440
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 15:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ia+VFa9NMumrt7e1zs403nDUUizJyxMYhZDrStYchg=; b=F9wSG5dEKpdIEth2
	C3tUd3vEnog5iHrY4gF2B3HiMgYO1091yUEnHUHigtwqphzY4Qd4QeZysOymMxDr
	mIlEnjQ2xOPUBvZ4rl3krErQqLahX3WjiWdKo71YGSePS3WAkyIsZinepM3gBeq/
	W+Gb6mn1Xhdp2iifkulbF3I2CO1C6TdO8xGVhXOr4OKjWz2dVMVs0r3NumQdUsx4
	qzM/yWjVpOue6j7+ikyTEyNuKRvvrho6OWnGlFuDjlpKy9W+sZOvcs83qzB0nN62
	6SABKFaLXR9LZPicFuWEGymkuXeuF6AblPLqZHq5c7BvFP9MIaEP8cPtmOQm209X
	ahuieA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76daw0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 15:41:49 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b0d864826cso7814733c88.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 07:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720509; x=1794325309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ia+VFa9NMumrt7e1zs403nDUUizJyxMYhZDrStYchg=;
        b=OjFr8S/01DXfQRQRVc3jhScnCTXheXTndxQ1KBkbXTnXETGr8reGNC8WI6OsRCQ0TR
         yaeYVcoVV8LB9abdUkTYSHHZ4yoj8S55n+o8Z0i7+33rwq6hiGcXEcoLz+itvD7tPQin
         zVPGMZ3T1bOMDD3eKGUfDTLLME9tysRrnXttitpD+bFMKMHQDQTI4+18UxIhgTu/TaEj
         h5m1i0k9NX91UltuUlNqWiZKw7fFD6I7qgHuFddvzi0KitqvEQ8YNkaFMeU4yW+34aLr
         ci8zb+hWUUWRjMcBPv6fNI+Gso+5zVB4VaPMenBmQwrVNNjRmkdgpuQ584k6b1m33dhF
         h7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720509; x=1794325309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ia+VFa9NMumrt7e1zs403nDUUizJyxMYhZDrStYchg=;
        b=W32pSLeANFu/UpPOhSbhgt1p59QasIeK5PsB+pK4T1yIHYTgpmC1ac9s+LcqCRmpv9
         svFZMURlaFAXWkSMAkV7H7Jz5q+IsgI4U7BEVFoQKg7eWu4D/9MsYA/ivOGunFYGM4yk
         bBXW4lNLrq0nGhqCJ1ahf1wZhOjDHp2F6XJoNJeW71iUq8vfhRpY3T2eNgouWHEMghf7
         PYFh4GiPiSZ73Vanyd4Kv1KyeMPpN8z54iaggM7AHkKKTWPt18T2ECjTntdQHYO+YNow
         BDpH0GiRWTsqK2t40E0uMjvbOM4jhE0FoVuQ3JsqsVrxKcw/aiJ6MPowiPgAWDxOENdo
         noZg==
X-Forwarded-Encrypted: i=1; AKwUvByz4b+q7X5Tr8QemkLjAgSRlgDYk4PNSdQ6fMzA+PPz+E+zXKcL1V9yyCGKNk7LZCjbL1qsCf3LJKB+@vger.kernel.org
X-Gm-Message-State: APuU4Z8/NWtcFSHoadjtrhm8Ptcm2VgfLCb22kPNxKxm46+RZU/2eWfJ
	WpLlJOYOCHEX/qORSso2bTH8KvJxfdBEX4aOlYfMg+pYfB7WfyBZCCE6GEbFWFykDj7kLJ/GOA9
	bIo14Xq712LpVNlQRZ5IKO35Iq3PWPqP3EKHgnqISfgnQua/mFA8/Cp937XkT1l6o
X-Gm-Gg: AYBFou152BzLs9choPdQQQhTZ8I4WMVs6e4vXBiu8wA+gkly1E66PF3Pm17yE/moV22
	IiPqS3agnDfzqwpvTxQl8RdA37wC+oZNRlvcVReBHZp9X4QumxAT0Yq4wWBuZrS3PYT17hHjPC9
	n+fqdJbr50OfJpN+fBobyzq6K7TJYAFQRj4MDAOXKc/0VxDG02SYo9IeR2O/HX+QuD2989xvT7H
	nTjRV+6gzuo4UPiHAXluoubsV26FBwfETQIwGbSXTjcCzu+Lln7QCHKRVXVgDfF49zZzsx2K9oM
	L/51Ozck7aBVPA7dsuZHZETPLvoFVixmKqJn0KeQCobHjMs5dZdDtTQavmfW9B+B45eOMt1oOLh
	rXt6/ftCgtLqnOjivyP3RTLBDKdAEacsKo3dL5ACD/UE1N1vG4NkGCR+ndJ4OigaFbfvU/G+Cwo
	IcbvbSm47o
X-Received: by 2002:a05:701b:4589:b0:187:eb7f:bb4 with SMTP id a92af1059eb24-1ac5d88c4e4mr20398069c88.46.1793720509221;
        Tue, 03 Nov 2026 07:41:49 -0800 (PST)
X-Received: by 2002:a05:701b:4589:b0:187:eb7f:bb4 with SMTP id a92af1059eb24-1ac5d88c4e4mr20398036c88.46.1793720508692;
        Tue, 03 Nov 2026 07:41:48 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:41:48 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:37 +0530
Subject: [PATCH v6 06/12] media: iris: Skip DMA mask setup when the core
 device has no IOMMU
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-vpu_iommu_iova_handling-v6-6-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720462; l=2411;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=W0ox0/dWEidqny/Abb5ZwObY8tZBEzErRhhIXnuHgYA=;
 b=9TO+AdFMbYzDAVdq+1BpxAN3ilpFQ74ocuffGj1Zul+ebvVRZs0O4uA2lZHUacaOP1R2FAP+f
 KlGURXMhJMGCqLfj4NNS/i+tr4A9RtfEdMjLESn57C7f1NeaTbBejAp
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6aea00be cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sXzWO4cmMkpvoY5_b44A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfXx3D8rRwRe6q7
 Tsr3HhWGxEO9dCS38Ib05hvj9NUb3nJP1WsyVTUZp8B7ZouZu1USAdFb9GVG0vdeZNbC2TBTiCz
 HJFWeaHBk67NJ3LL7vDEyaLNLEkAiLE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX9MDMQL4+NHMw
 8rh+wtTA5dunKK9x+pgEmve275lF73T9RWeeD3MHtPen/j+LFm5In+8KvLdm9c9KDBE9+eiOI6h
 F/Yd9yUeTHxiueFvfLTWO/S1wFR8H+G5uNv/PtR+wDXlFvT+2N4IXVuJ0MmboxUcMPIMFv8dW83
 0OGYfPIz9b/5TCqPTBPmsJz7/tvw31PC1CKtLKKhzgKZ//RlsJwMhfZEF8S9i96Htl8/lfZvgBO
 NrlyMl93eXVjg1jVoTa9sRpMSYZ+vDgA2A0kqY7x/1Ghw1hK7/CiD2musWjhxB5+/I3i7h1ZUck
 0lK3IOLJC6fUsbM58CDAIDWVsD4c8EuuVRF2hvRdzflJDFS2pC8iJmW8YUMoo8i3nu/Wo2/bOLK
 gAu654oodjswS051JUFBjC9k2hqoRzqePhWXWxvpQhHnW8Km0U53CdW6ebn8Diml2e5Suo5RBJJ
 g1MyPd9u0MY8NmF4xsg==
X-Proofpoint-GUID: 68iK-KdACmcTm-CTM3RYOZ8K5IGWKwWH
X-Proofpoint-ORIG-GUID: 68iK-KdACmcTm-CTM3RYOZ8K5IGWKwWH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030062

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
 drivers/media/platform/qcom/iris/iris_probe.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index e659461716ba46c84d616b41f477b6250d46bd81..6d7147d73d40b08cbcd55ea5a19ec57d0738abf0 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -154,6 +154,9 @@ static void iris_unreserve_iova_region(struct device *dev, struct dma_iova_state
 {
 	unsigned int i;
 
+	if (!device_iommu_mapped(dev))
+		return;
+
 	for (i = 0; dma_iova_size(&iova_state[i]); i++)
 		dma_iova_free(dev, &iova_state[i]);
 }
@@ -167,6 +170,9 @@ static int iris_reserve_iova_region(struct device *dev, struct dma_iova_state **
 	unsigned int count = 0;
 	int ret = -ENOMEM;
 
+	if (!device_iommu_mapped(dev))
+		return 0;
+
 	state = devm_kcalloc(dev, BITS_PER_TYPE(dma_addr_t) + 1, sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return ret;
@@ -433,9 +439,11 @@ static int iris_probe(struct platform_device *pdev)
 
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


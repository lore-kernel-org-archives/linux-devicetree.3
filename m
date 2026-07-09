Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253C1426D37
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600587; cv=none; b=qlPFj94CXnfzdcipH97rOH3u559FVXpNWOp7jGj/8ib/3L3b+ImhF9YhUDavOZnHvf14Xvya0T0UgFRlCgIj1vh9MJ4kVpsOFp/gGNsq+dDfq0ahrS7UgxhgZrnKXiH/ZGBriZd4UvLna2+vpYO1bRlKxvXY6dbWh83zRGUJ23I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600587; c=relaxed/simple;
	bh=4ymfqol3bG44M4dieRqnmMS9K3jOfUavSQ+oh8QEV70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WufN/pvXTf5ztDYmMKOdhUsvdjWIdJtB8Jf/6Ra15MxFteZKpR+1t3spfNM/e0g/nYxlhnU5RbRf6aefarL7ylB/zjTSQLiDxEzR9bXSxv0+QdE+9Csj2ZvpTbZqyLo1URJHra2bvs+8nY+/gmfmEMgM2CqB/RqHeKNmLOJrbi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqDs3uXb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DdbVEixB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqDs3uXb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DdbVEixB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNDcJ1669138
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 12:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VedXqI4bHVCsjZ/F2dwBepSjkzM47PE118HOdwu82lE=; b=bqDs3uXbVr2ARDOR
	w+8Wx4jmUPrjvBS+XOuhvm1w2uLRc1QJEhX/42yJcuoQAvf/WeXba3clgbwGnglm
	pmPc7SoLhj4upNyh5z9wkf12Ww1gMe2Wnvr7WzxEPd6DIDy9nWuMkoFHS3gOwnK+
	D9WrJ7tVHt/hphQQdFe+K5ZAoDT4G6SxNazPbL8tf2oIvUStPrX0wXraHT+zYZMR
	xOcD8299oAqnXT0llW70cxNYGh1zq6EYVT0vwBQUDuM+cYFuChNZlvT275PXjBIS
	7fhcIgTvHjhKqHitioxMuwg0geD9U7Vn4LZNxmJQFgu8MJSmBRbM2cv2s9BXAB79
	KxYEJA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418j53y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 12:36:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a298cd62so1841602a12.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 05:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783600585; x=1784205385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VedXqI4bHVCsjZ/F2dwBepSjkzM47PE118HOdwu82lE=;
        b=DdbVEixBlMPnIn0itP9FalJ+UQExWVXHuo8LrKzIa65shtqU5EFncliJdmyxYF4XWj
         INN7Y/m+TDyn6BxKDe/xh5wXiueGIzLpljWNFbW3eCkmfmkARKw6GKckyOCiRgktUvKN
         S54zva0aRZ0d/CRDuuH3rrlAtbMAoyOMxCAqon/PUHrT+PrqcJJexGP53sH22ttJwb14
         jGru2pRxo3ULf/xkZ7zxZIB3eXOKJONGoqMBHLBIpaaq8LVzPFHg2DV1lJGVqYUv2Obs
         3ZMUW518zI1bmqxyEhkxXQs6Q6OcCagP4Yw5Lw6RWNpWtsuhCBO/o2f7Fip2QsZdO8qW
         7+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600585; x=1784205385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VedXqI4bHVCsjZ/F2dwBepSjkzM47PE118HOdwu82lE=;
        b=FCega6iLRHASITTgD8bp1XYosMAJjCPvmMfSEfrJ5GTHJ5Q0Lfg36D8qqAZhq/3j5o
         eiYYKTLnWMevnevf3chrqFmJcSk9PRUIDQm3o3wK+khSfguwi1BbR/nc1KLppKEJ22JN
         Zx0CAvfLWmvDzFFBYhVn8izee5Kt4Qq0EpzPLkjfCs7A4XYNDrT8+P3uFnoNdP4grwpT
         NP7INLj4sE7bhrs/jyH6eO2GrlY6WbOn7ZHAvva1S1ksnnucgb3l0//tAF2X5075Mp8m
         TwYQJCrsy95pUhVBdDWXtJgZtlMzD4ZUPGPkWc4p2x8U6LMnrQqe9/LhpxNibi75pW4J
         GJzg==
X-Forwarded-Encrypted: i=1; AHgh+RprnnOzGqFfBMF5uzAwUmpRT/wTWFZF+uK5Oa7q+Dukf74zmolZYnv3AQ3shpfohs2zgdZFrLuFuDos@vger.kernel.org
X-Gm-Message-State: AOJu0YxW2fLvhKLOYPoqMqRlKXISfUTaDGWgnyZCYgFB/Zjb2VoTcEmB
	JdX4piLOkNef0cTnbZYSd0m53NFt60wFTjPuzp0U+wYhktEkEh68qbdnAXnawfWvMk4yQHWC4qI
	4XVAdZ8qcE2HeW4qJCI0rJKVJ0cbUrJ/R0zH2QN06AsIZ8o0cJPY9uJ2Yw3BwyXKi
X-Gm-Gg: AfdE7ckajtACk5NAf1v1FCYeqg3VNlsfEEpj/WfyNj8a1C5rZqJzn+zY5r/vdwDSyqY
	AigfQ8sl9mUUYMEzEKLHUjGWGZwpXHmkn7KrX5h0VueSv3/xOJr+vhhfZf3zRZa02iN7IqHCdr6
	YF/5slTNqrIBoxYOIMA9D3SRpwbvVtbEEL8lNst+t2jBWQNsdPSeMPO5kJ+vBAgsmHZ6TbXZCZ/
	i45+2CpaCoPA/3adXIua/Pgye4rALH+yoK78msCaATuHB8HB1k3usEVpIygIDkW8Efjloza7etM
	WOjSUOpK0TdLojMtgCKAn7Y4E17PjEUZjtxtCMcExXUjdpt69V7M8SHEfwpipu8+QJAx3zElv0e
	7SogzX0kREYRwySAUDEz4fMgsd2nYMzjvMCBOI6mdJnZZTw==
X-Received: by 2002:a05:6a21:62c8:b0:3c0:9c19:6596 with SMTP id adf61e73a8af0-3c0bd1a19e7mr8925608637.62.1783600584741;
        Thu, 09 Jul 2026 05:36:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:62c8:b0:3c0:9c19:6596 with SMTP id adf61e73a8af0-3c0bd1a19e7mr8925573637.62.1783600584294;
        Thu, 09 Jul 2026 05:36:24 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm31456029eec.7.2026.07.09.05.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:36:23 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 18:05:48 +0530
Subject: [RFC PATCH 02/11] media: iris: Add hooks to initialize and tear
 down context banks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-vpu_iommu_iova_handling-v1-2-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783600568; l=3266;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=4ymfqol3bG44M4dieRqnmMS9K3jOfUavSQ+oh8QEV70=;
 b=EUm26+pkJMkdEdAiDxWpWieP9pkCNaoVMpkiJ3cyXOwBgglEnhQxkHvSNC6Fu4tPzo13iMGns
 wP0oIRNMd3NCJzite82JbdaC3oKlTq3ZtiFyUWJJE32gKC2licWADwJ
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4f95c9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=c7F6BOMWhwAoq6QR8kcA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX328VQeR1I8IN
 TQ5Jzsqc+zY56VHaCN93bEammribCp/by2z7ZSLnWcKdNqs04Inq229/qSyLRbDd6hcF+G9PwVj
 DSTO8IAvypR585FdWLd1TFB/neuG6CjtL/snltUk5QIYxCoR3/IJ+/GLyoWMeoOKuCZTaX9aMtl
 POI1x9q23kUmcJtRUrTmT+Z1HukkKUgKW6JkJI03sgvdmyAr9knA/hWnsy8ycemLCJl4ArBGH2p
 2oeR+2f5hEE0tAbQ0ufWw0Xqpur91TNNQoFdU+Dh7qsGamkoWiisWyb4U+zz0cJvsd1MQVi1uRR
 6ujTu4qvZ9BJyhkOJMy9L6U80QyC+jebvpHmQZ+/Y/LPDlRiqDdktmuj5BVgn+h46skqNV9eObO
 kSFhYB5f78cLOr7YiIDZ0Ovo7fjBT6RFWwv1Q3Jet9VZUOwrtfssPe+62N1PKOr1jnjyBQcqcBN
 5Mzu0cdOt5PGa+JO7Wg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyMiBTYWx0ZWRfX4cqpAgH+tcJf
 kY5uZBPbfhW5LDCuo/1zhzVRRSBbetlIJiM/yIF+MfJnrlNiwRFXOb0UMs5Wx27unZN4YkNQNl2
 qkX0aHoE1MJZ/9TedNP4rf2gfqcD2+U=
X-Proofpoint-GUID: JwYknZqP9EH1b1DzKzbZslhJE4mvQCZg
X-Proofpoint-ORIG-GUID: JwYknZqP9EH1b1DzKzbZslhJE4mvQCZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090122

Add platform hooks to set up and tear down context bank devices.
Different Iris platforms may require different context bank setup, so
let platform data provide the required operations.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  6 ++++++
 drivers/media/platform/qcom/iris/iris_probe.c      | 24 +++++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c9256f2323dc4521f9eacaeffb0fc08a180de3ff..0d738005fbc3bc0f675165aea0bcf09943441a5d 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -288,6 +288,11 @@ struct iris_firmware_desc {
 	const char *fwname;
 };
 
+struct iris_context_bank_ops {
+	int (*init)(struct iris_core *core);
+	void (*deinit)(struct iris_core *core);
+};
+
 struct iris_platform_data {
 	/*
 	 * XXX: replace with gen1 / gen2 pointers once we have platforms
@@ -295,6 +300,7 @@ struct iris_platform_data {
 	 */
 	const struct iris_firmware_desc *firmware_desc;
 
+	const struct iris_context_bank_ops *cb_ops;
 	const struct vpu_ops *vpu_ops;
 	const struct icc_info *icc_tbl;
 	unsigned int icc_tbl_size;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index c2dcb50a27824d45d5fbc8b9e22591decbe2a23b..0bce4fb1786bc9371074cb72e082219ded4840e5 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -150,6 +150,20 @@ static int iris_init_resources(struct iris_core *core)
 	return iris_init_resets(core);
 }
 
+static int iris_init_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->cb_ops)
+		return core->iris_platform_data->cb_ops->init(core);
+
+	return 0;
+}
+
+static void iris_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->cb_ops)
+		core->iris_platform_data->cb_ops->deinit(core);
+}
+
 static int iris_register_video_device(struct iris_core *core, enum domain_type type)
 {
 	struct video_device *vdev;
@@ -207,6 +221,8 @@ static void iris_remove(struct platform_device *pdev)
 
 	v4l2_device_unregister(&core->v4l2_dev);
 
+	iris_deinit_cb_devs(core);
+
 	mutex_destroy(&core->lock);
 }
 
@@ -273,10 +289,14 @@ static int iris_probe(struct platform_device *pdev)
 
 	iris_session_init_caps(core);
 
-	ret = v4l2_device_register(dev, &core->v4l2_dev);
+	ret = iris_init_cb_devs(core);
 	if (ret)
 		return ret;
 
+	ret = v4l2_device_register(dev, &core->v4l2_dev);
+	if (ret)
+		goto err_cb_deinit;
+
 	ret = iris_register_video_device(core, DECODER);
 	if (ret)
 		goto err_v4l2_unreg;
@@ -310,6 +330,8 @@ static int iris_probe(struct platform_device *pdev)
 	video_unregister_device(core->vdev_dec);
 err_v4l2_unreg:
 	v4l2_device_unregister(&core->v4l2_dev);
+err_cb_deinit:
+	iris_deinit_cb_devs(core);
 
 	return ret;
 }

-- 
2.34.1


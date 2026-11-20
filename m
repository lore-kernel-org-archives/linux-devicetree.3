Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173103;
	b=Wc7+XiqLxSbA1qoXkt5DSnbVfURN/PA8LrVX0h19id0JZkGKyao6lQCv3znuy77xzn9L
	 Sfb2liHdG1ynIyrhO4sRZC4AsANXUjz5u+xlwyGa9JdPJ03ZDiJJUZJPpJgsLKpWUv/d7
	 7J/1pRKX6OgP072qTXU87b7oqrOLMwWV3dER/B7WedttX0L1JbFx9wARMeRWTMV3E/8Zc
	 qOsVt+R/vy4QxOoBnT72JAobnx2T5Nsqc1FsEIqPHLLHWotkuTUCmfLltVLNAQvsC3OVC
	 cFoKhl2XMZtRy/JpZqYlYTRYeU0yujjLd7GMc2cs2HbY5u/t8m+n17iAlxi/6sZrwAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173103;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AFA0X0cFheVipCck181mRNcheGfg4Ds3+zguEJ/tZ7c=;
	b=Cjt7hrPzzWYkWmrRWaOb2GpB56LNPoycwuAyBBSpt0+u6i940RLoC/il/ki7y0HrNXng
	 j/KAHlGnBEBxHKlrC9kmBnYfj8Z9pBuhZW5exPK+VEwxowkHDUjLg6UUiRDXCnR873aQA
	 BFx61UurWJAJwtxCUjya6RfMzJmD2q/tmXeOheNsdnMCMmb9Zj2ShHxtihr608mu62cQS
	 L95//AGG57vS3bjrUP2TXDIRFN2pLaQppBfC/z+wSPiep1+74cse4qI2F6+Ut9Ea4oF80
	 w3LgTgZ+NCoK429x0VaEjnfFgwkKUA1hIyUqkl3W097lY4hX9vOUvrHgqd0dIqfwZKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h8L95QHU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nu2RndcS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA98606A33A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EA98606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h8L95QHU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nu2RndcS
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk80Q3731854
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFA0X0cFheVipCck181mRNcheGfg4Ds3+zguEJ/tZ7c=; b=h8L95QHUZMeTIwqx
	YGu+3oz26qMXoEMTSylvT8pSO1mqAKnQMUj30t3mqKmwsuFao0QsnKXjE6PuYpi6
	azL73uw3PwIPcTuKm5NnpuI8ANMlseOeDnbCgC3cKrmcuxhER0EOBkgMuii70k4R
	4gP3JaBBpBg39VX1S2UN9SJfETGkNK5VdigTQ+UbaY1qa3LiZPbxUWAZAnf//Dxs
	Pji7cEOKuSFI+nWQrAaI0CxNq31cxBtPwndPw0fIMdKiozt8dCkBasaYNmYsC1uJ
	CieOrWL9E9UfQBmgjsBGWb0USG9iIO5hIa5jaMO24BV+d+VCJCeqbPDxiOR7c5ja
	vzkx/w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4g4ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:11:39 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso1944944eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173098; x=1795777898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFA0X0cFheVipCck181mRNcheGfg4Ds3+zguEJ/tZ7c=;
        b=Nu2RndcSGDPHEZMpgGilkDNadYkrHVSD/UAGOTzDYjMt8AkT/+ALoVh+Y2iqFqaipS
         j3OcT6vAHGzOn63TdOsC0oZdLvnkIUO9XBRNWWIBXqfk99mkv1m7uw5ZdKVkohbEJcAp
         w0iH8U0mM2+9i1r1uMJER1F6dIahoxHlAp7c8OmmGXstx5wGSev7/QIn3dQR1GcLfVxc
         UI9/qflgX0g0C8P+sX6WOvNBUGC5Hbhzm/vsFSmRIK81xHH4xYpO0stWWdYX2Qlb7a03
         O4R0C/bxkObO0FxZBhQSfH+FEFcTL3gKY0SHMTRkTPCGgIe+cJ1y+3SK+nGdbq1Nv14D
         uGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173098; x=1795777898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFA0X0cFheVipCck181mRNcheGfg4Ds3+zguEJ/tZ7c=;
        b=wOqQWyiWiwxV35uGRe8ZHwLXip3j/bsxC0nZdXMV6ORV4ig8KVXkJKNz50mjEEmzFT
         2cC6bRMhOKrYMor+7IyfMyRqWjjsEePRy7C0cLSB1vKi7w2V2zWcN3GSYKLqy/r6Csag
         BUtdTd0pzHf283/FdQwxKOld5M9eFUkVBl2abq4gH3SaxvA73axNcP4BcthaucLRDO1Z
         fMI6RBAs1d/8ji+0Kv9PtL6jVD0c2XjikDFtAxa/fHTeiQ7/gHNCZruY0955tQWAMR1E
         Rgeu/pVMx9FhiK8wB6BJvpbkZogL70PG86hpu4Cxgyj2qs5FSKz5dARHKBCOdzQXSBIy
         nUDw==
X-Forwarded-Encrypted: i=1; AL+hErGOIk5lmmXS/OuxxA4Bhgf1x9dgGnuscp6BbJekjmCBYFKCI4r9o0PMKmfK3RoKLhhfx7eAV0GS86WK@vger.kernel.org
X-Gm-Message-State: APuU4Z8rFwTqpElifCkO8+t5QrIIAyh5yEpg3pRZxVjCvimtM8L3882f
	13tggbLP6xu3LnNIDevsXQ2NUrDRBwC2LWv9X8eYrFuQnPy1G3okSj10iM/l322ByrjPcbqhoo9
	8its0vujHL6go0mBQgmuEYa4BDqKYpfnJ2QxPtiYxR+vtrv6kBdOWxGZMr8QfzBn3
X-Gm-Gg: AYBFou37R1NbPoKf4wt2gssBa08l20WUN0N2d5R5i/v3aotm9k3G7zmMxMwFXQEysAT
	eDKhgQ8VMXyS+UiUZ6yaG85+WOpTVnRJdYS420Z0K1he5lhL0cQK/7bzmLX8+wi5Uq/gL6KO8QI
	i4JfoYOG3K+1pettINhjFTqVX+lMvpP7pi6Whey1j4HMITZWCO2qBuNIRgyNTbJB8/9YTJ7m3i+
	E3gFwaeoyQu4PQDDp0BCAT6ha5Nk5WQz/+mURshzUIk7WV+q1pmI2DNZc4IWDR8kGPGqkDjxKnW
	mszL2UZt3JuK0FWW6arPyXDYmyJRppoH+6Vzq6gr7iZTGZNL99QAD7iM9jefUNXbGv5aUYTsXOJ
	4+dGHf/h28UXo5wEpX2SUCNXH3D7HIioevKt/I1NcpOG0XRW7Pt8TqCHY40ZunzUw7HsrAeMi3V
	ritcUnxeMA
X-Received: by 2002:a05:701b:4346:b0:14b:1ef8:698d with SMTP id a92af1059eb24-1b556900481mr2505943c88.15.1795173097894;
        Fri, 20 Nov 2026 03:11:37 -0800 (PST)
X-Received: by 2002:a05:701b:4346:b0:14b:1ef8:698d with SMTP id a92af1059eb24-1b556900481mr2505911c88.15.1795173097321;
        Fri, 20 Nov 2026 03:11:37 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:37 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:40:55 +0530
Subject: [PATCH v7 05/12] media: iris: Route buffers to the matching
 context bank device
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-5-25a771235a7f@oss.qualcomm.com>
References: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
In-Reply-To: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=9250;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=Z0+tCbAosQIYHYDxlt7wqZB5TuQvWYXTmexnidOijx8=;
 b=xSvTmoLjhQtVZ3b/ZQbLYAJRdAmxMdeqWCBkLVVzd0iYRQhPbxChodpOEYeiFKDU0pN9D5ARU
 YnmQ0NlKBi1C1vhll4g48lQTAqyb08iXrF8q9iFNegtZOkSVnAFC6GZ
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: -hnmemjPHdGRBbmMnTKH003VJJ3KWTTt
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b002aeb cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=SZqhrWYoK4F_mH7x4yMA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX1q8IM60sLbh9
 DojDkGW7MiHdSI+dJOR8vShCAbzhwVwMWcBq6ohja5jbWGUTY06vvJwgyL8gqAiSZ7Yv2+65XAk
 msp/muhfeLa66QARewiIPn2R/MVQkrY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXyY+dvy1Hmft1
 xifWFzF10CBixmwLpTEtu//EwTortYjSiLd3wyCAZ594mTIFogdy49W8Mpv0F6kT8/EVt81hKLg
 G5Z5zrraHH7FwgZQMkFL2V2TEXQy7OsoMTikHePLWXFIVp1dERDGa4N7M1+8jQT/tl8hYsFzVb3
 5bGaigYwLF3P3tWvoynHZV8NGQpuJPaRyemUcqkwcbR3vGSNFCDU/JTTMZNRXMqpFuktNfkBBoJ
 v85gc9AIDodl1l6LlAwHfEDdeqyIWZ4yFgfU39hrs06g1d+UBpc8vx0ppn7ZR451tXCpvYW/B4z
 uejxDt6pHwIxhWRbKs1P0nJyE9GABeiA8YHX9ToBmZAnJqhOHImCBpkWN9NafP73dsX+PLWYP82
 kKXdw3JwN/XaxmFNdr3NY/09d23pfMJe7c8jpgJPNjs+RTveNZkMLXNmFI/aqkeoKlSLRO/r79p
 wHFJVidYnAd1iSILjFA==
X-Proofpoint-GUID: -hnmemjPHdGRBbmMnTKH003VJJ3KWTTt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range.
Add iris_get_cb_dev(), which maps a buffer type to the owning context
bank device. Bitstream and internal buffers (BIN, ARP, COMV, LINE,
NON_COMV, PERSIST) belong to the non-pixel device, and uncompressed
buffers (DPB, PARTIAL, SCRATCH_1, SCRATCH_2, VPSS) to the pixel device.
BUF_INPUT and BUF_OUTPUT depend on direction and are resolved from
inst->domain: for a decoder the input is non-pixel and the output pixel,
and the other way round for an encoder.
Fall back to core->dev whenever the relevant context bank device is
absent, so platforms still describing "iommus" on the parent iris node
behave exactly as before to maintain backward compatibility.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c    |  8 ++---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 16 +++++----
 drivers/media/platform/qcom/iris/iris_resources.c | 41 +++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h |  1 +
 drivers/media/platform/qcom/iris/iris_vidc.c      |  4 +--
 5 files changed, 57 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index eb8de60c1177f5e1ab83b90a3c8c80e0b4d1f02e..6e03d13ac1a792c539bf8fe6d26354aa29d7b3a2 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -531,7 +531,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 				       enum iris_buffer_type buffer_type, u32 index)
 {
 	struct iris_buffers *buffers = &inst->buffers[buffer_type];
-	struct iris_core *core = inst->core;
+	struct device *dev = iris_get_cb_dev(inst, buffer_type);
 	struct iris_buffer *buffer;
 
 	if (!buffers->size)
@@ -547,7 +547,7 @@ static int iris_create_internal_buffer(struct iris_inst *inst,
 	buffer->buffer_size = buffers->size;
 	buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE | DMA_ATTR_NO_KERNEL_MAPPING;
 
-	buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
+	buffer->kvaddr = dma_alloc_attrs(dev, buffer->buffer_size,
 					 &buffer->device_addr, GFP_KERNEL, buffer->dma_attrs);
 	if (!buffer->kvaddr) {
 		kfree(buffer);
@@ -650,10 +650,10 @@ int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane)
 
 void iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
 {
-	struct iris_core *core = inst->core;
+	struct device *dev = iris_get_cb_dev(inst, buffer->type);
 
 	list_del(&buffer->list);
-	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
+	dma_free_attrs(dev, buffer->buffer_size, buffer->kvaddr,
 		       buffer->device_addr, buffer->dma_attrs);
 	kfree(buffer);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index 482369f5fe037d52f8081b7e847f64df50f339e1..fa7a972ef94cf36ad25cd7f3300187f00c45599f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -261,25 +261,26 @@ static void iris_hfi_queue_deinit(struct iris_iface_q_info *iface_q)
 
 int iris_hfi_queues_init(struct iris_core *core)
 {
+	struct device *dev = core->np_dev ? core->np_dev : core->dev;
 	struct iris_hfi_queue_table_header *q_tbl_hdr;
 	u32 queue_size;
 
 	/* Iris hardware requires 4K queue alignment */
 	queue_size = ALIGN((sizeof(*q_tbl_hdr) + (IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ)), SZ_4K);
-	core->iface_q_table_vaddr = dma_alloc_attrs(core->dev, queue_size,
+	core->iface_q_table_vaddr = dma_alloc_attrs(dev, queue_size,
 						    &core->iface_q_table_daddr,
 						    GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
 	if (!core->iface_q_table_vaddr) {
-		dev_err(core->dev, "queues alloc and map failed\n");
+		dev_err(dev, "queues alloc and map failed\n");
 		return -ENOMEM;
 	}
 
-	core->sfr_vaddr = dma_alloc_attrs(core->dev, SFR_SIZE,
+	core->sfr_vaddr = dma_alloc_attrs(dev, SFR_SIZE,
 					  &core->sfr_daddr,
 					  GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
 	if (!core->sfr_vaddr) {
-		dev_err(core->dev, "sfr alloc and map failed\n");
-		dma_free_attrs(core->dev, queue_size, core->iface_q_table_vaddr,
+		dev_err(dev, "sfr alloc and map failed\n");
+		dma_free_attrs(dev, queue_size, core->iface_q_table_vaddr,
 			       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
 		return -ENOMEM;
 	}
@@ -307,6 +308,7 @@ int iris_hfi_queues_init(struct iris_core *core)
 
 void iris_hfi_queues_deinit(struct iris_core *core)
 {
+	struct device *dev = core->np_dev ? core->np_dev : core->dev;
 	u32 queue_size;
 
 	if (!core->iface_q_table_vaddr)
@@ -316,7 +318,7 @@ void iris_hfi_queues_deinit(struct iris_core *core)
 	iris_hfi_queue_deinit(&core->message_queue);
 	iris_hfi_queue_deinit(&core->command_queue);
 
-	dma_free_attrs(core->dev, SFR_SIZE, core->sfr_vaddr,
+	dma_free_attrs(dev, SFR_SIZE, core->sfr_vaddr,
 		       core->sfr_daddr, DMA_ATTR_WRITE_COMBINE);
 
 	core->sfr_vaddr = NULL;
@@ -325,7 +327,7 @@ void iris_hfi_queues_deinit(struct iris_core *core)
 	queue_size = ALIGN(sizeof(struct iris_hfi_queue_table_header) +
 		(IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ), SZ_4K);
 
-	dma_free_attrs(core->dev, queue_size, core->iface_q_table_vaddr,
+	dma_free_attrs(dev, queue_size, core->iface_q_table_vaddr,
 		       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
 
 	core->iface_q_table_vaddr = NULL;
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 883ef7e752915243e6a2cbf0b459cc83762f4c5a..6a87f8eecdd1fe17525e5ce8484794909b89624b 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -12,6 +12,7 @@
 #include <linux/reset.h>
 
 #include "iris_core.h"
+#include "iris_instance.h"
 #include "iris_resources.h"
 
 #define BW_THRESHOLD 50000
@@ -140,3 +141,43 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
 
 	return 0;
 }
+
+struct device *iris_get_cb_dev(struct iris_inst *inst, enum iris_buffer_type buffer_type)
+{
+	struct iris_core *core = inst->core;
+	struct device *dev = NULL;
+
+	switch (buffer_type) {
+	case BUF_INPUT:
+		if (inst->domain == DECODER)
+			dev = core->np_dev;
+		else
+			dev = core->p_dev;
+		break;
+	case BUF_OUTPUT:
+		if (inst->domain == DECODER)
+			dev = core->p_dev;
+		else
+			dev = core->np_dev;
+		break;
+	case BUF_DPB:
+	case BUF_PARTIAL:
+	case BUF_SCRATCH_2:
+	case BUF_VPSS:
+		dev = core->p_dev;
+		break;
+	case BUF_BIN:
+	case BUF_ARP:
+	case BUF_COMV:
+	case BUF_LINE:
+	case BUF_NON_COMV:
+	case BUF_PERSIST:
+	case BUF_SCRATCH_1:
+		dev = core->np_dev;
+		break;
+	default:
+		dev_err(core->dev, "invalid buffer type: %d\n", buffer_type);
+	}
+
+	return dev ? dev : core->dev;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
index 6bfbd2dc6db095ec05e53c894e048285f82446c6..a9a5bddb19c24917de4c5dba52567934b77e5c59 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.h
+++ b/drivers/media/platform/qcom/iris/iris_resources.h
@@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
 int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
 int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
+struct device *iris_get_cb_dev(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 19d1583c20a738fe5a26bbbb2754a9155dbc4ffc..0d673139a75682db81efb50aab6466eb9a1d1552 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -129,7 +129,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	src_vq->drv_priv = inst;
 	src_vq->buf_struct_size = sizeof(struct iris_buffer);
 	src_vq->min_reqbufs_allocation = MIN_BUFFERS;
-	src_vq->dev = inst->core->dev;
+	src_vq->dev = iris_get_cb_dev(inst, BUF_INPUT);
 	src_vq->lock = &inst->ctx_q_lock;
 	ret = vb2_queue_init(src_vq);
 	if (ret)
@@ -143,7 +143,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_
 	dst_vq->drv_priv = inst;
 	dst_vq->buf_struct_size = sizeof(struct iris_buffer);
 	dst_vq->min_reqbufs_allocation = MIN_BUFFERS;
-	dst_vq->dev = inst->core->dev;
+	dst_vq->dev = iris_get_cb_dev(inst, BUF_OUTPUT);
 	dst_vq->lock = &inst->ctx_q_lock;
 
 	return vb2_queue_init(dst_vq);

-- 
2.34.1


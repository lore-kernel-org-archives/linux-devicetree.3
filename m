Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BED39B956
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784643640; cv=none; b=V7fUUH3qsmFhurFxvXF46tvtJe5z5wfR7j+cs6XYLTEtG8+ft5r9t7IBzfxu3wI3UMA6/nYIKLZ4ZCpoX1w26/yxxWJB3FI+ZIGwwI0IUA3uVl3OiGkXdY+8xheOa5mfpf57qcrLtt8l63aHcdfyDYe27BtkW4cqgFldMB5PmSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784643640; c=relaxed/simple;
	bh=wGSZ1WFBCgglA8Tat+ZxlrpGgLQ01a0Za7YsMfdV3XQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QCLloJnh+ZciDfyRmlQ3UzN6AKnQXhBLgNGiY22Qt84wjuGR9IG5upoeGz2Rt1IewF/WSFoMRCgha1A0gp3xVH+sd4q41eLyLGaTQdI6y5o0DGBopPLo4S1Dr1E1D0YsB2XUPxuIMiPzZwAMXlickHafujGbNnNENZA0ZkwV38c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iYLwkYLd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TMTpJtS1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYLwkYLd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TMTpJtS1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg0nA1841254
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PpeXjtCOffT6aT7diDbXW+/jlOZNYXt6w72O1CCdTK0=; b=iYLwkYLd/zRfawg5
	tCOYSyhQLNjyBzXo+6EQVobAfIPV9/P7W0oxy97dOIFoLLIyIyfPN6HPmKHUW7oq
	mrS/fSHtr9/xHm+l8o/nB1gEKtKssPGWhRJgjzVPuPZ0LvQpEEzWM47pMnJDaHQv
	uDaPzVxUpmw8j6bK1WzD1iwn/yWtPh426I8xqPdpcWnmu9NAhN+mWgkDSak5KmLc
	EPz2rILIXqAsUVD6lqrPLrcAYpwr7+eO650TuRrHXNR+zyp5XlZeyzYc9V2bfF/l
	q7/W/yELeqlmFchDDuKxHP0yWIJkIISi1Aylf28q/w9ADovmAciNORYgRUAmdfEF
	Zvoi1w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se2pca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:20:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-520a00c7a03so133615471cf.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784643637; x=1785248437; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PpeXjtCOffT6aT7diDbXW+/jlOZNYXt6w72O1CCdTK0=;
        b=TMTpJtS1P76vuiGPPDTjpfUeUXj6c/Ko1fPLZxCMPnrachwzkO7NXeK2pssBbO1UgC
         6OuU7jiwyVaT2L9yfyN90BEYV4Amhpjv23i+C+1a5fftZdZ8DORjLx9sZQptDQ9epgKP
         joxDzXyxeGapax5yZcl+7f2c5bJgpLOY767zUay2r2128MbmFOgQFXon3dw6WN1408Gc
         Mt9woRjU3fVCjE0nljxl2suloDHkJaU4AOWaypGfyktac47lq4hmCDG2F8KD3kCdWTi/
         +7d4P3sSQT3WYcef2469curK7wVPSy2mFvtWZ8GfgxQ+hSEtklqVwkADTb9EVSHPDdlJ
         aVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784643637; x=1785248437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpeXjtCOffT6aT7diDbXW+/jlOZNYXt6w72O1CCdTK0=;
        b=hmYkorNseROq9K7kNKl1A8D4h55yfgo5kwDJt5lIF7nH1P9pF/pDHDljZms7s+nIlq
         DRfr+TWqFPDYBf3VoQY8xX6HlJ66Zq8P9/OO+sotBxrxjNttsEq5bR0glkzyPH6HJk1c
         pYUaOX68JqJFD16g+1haGsmYbMirSIBk749InXaCAC76xy4KQ9PN6WT0oBLR1iP0alGR
         8pezkfNHIZN3Z0ZYyLTqU8AisMmKJan1CiNU8P6b52kjotY5Oy3oUgs3IMOfnqBTr7N1
         sFNd69zkWx9d4QRZUaoTeSscZGO6Z/9uE1yFhIcvxt3KanJr1KhKx1v0MtDdlzLaclIL
         hVSg==
X-Forwarded-Encrypted: i=1; AHgh+RoV/g+cX+DARJ/cIuySmJiBCm2ChBr7Ar5cbxq3riwWBWN3tstExxwdjw6uyTOWzK60X7GT1OGnD/m8@vger.kernel.org
X-Gm-Message-State: AOJu0YxHNV2ijqnbmePgqDNN+SpTJOToeOnH6Dr36jpYsWSbHPULMQ6d
	zBH9DnPd5m7ge1201l3IvBQ7sZoSnOfLvnATddbJSzu91qKU32YqOzPcgP1oQfoNJdX22Bs+VKe
	WQ5HtnDoTghfz3IXsNu98pZlLr978GgfucyMwzTVdCW9zUXVLuToxd9x5FRQktmpT
X-Gm-Gg: AfdE7clo+Jieh8fljWdHnHArzvrHU7UJS0p2GYubEqthGyh32WkW3njhqZ0c4gK/bYH
	942s2kkdr+KKdjrjXdQGc+imXQ07OysglRCQpvV0wyhwhxZ3TkEDXaEeLOYusgf8kDR2v/AEi0M
	irTVz8/cR7ILerWozBgS7Rq2YSCfT1CKH8Ums0SzQQfWCEGhEHWnx4FAQazgjMbbBttdsfXpo0A
	AVsngBMDCnR2g793c4JRgoWESQcBy5arwAtsU78RBHr0yQNoyWUaP6WH5YlzI6cFaXVohXYJBNu
	6OGqkzzEQZBn9SPQgrBU9QTVDhz3Q+WmVtRtPdziU4ym91NVID9NFlqdUzqI3jr/Dsgjl5DSyWr
	YPIM+aXGk
X-Received: by 2002:a05:622a:13cd:b0:51c:7b11:41a9 with SMTP id d75a77b69052e-5213f959cc5mr175288451cf.86.1784643636692;
        Tue, 21 Jul 2026 07:20:36 -0700 (PDT)
X-Received: by 2002:a05:622a:13cd:b0:51c:7b11:41a9 with SMTP id d75a77b69052e-5213f959cc5mr175275161cf.86.1784643622840;
        Tue, 21 Jul 2026 07:20:22 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653687b2sm84762025e9.1.2026.07.21.07.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 07:20:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:19:58 +0300
Subject: [PATCH v3 2/2] remoteproc: qcom: pas: Add Eliza CDSP support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-remoteproc-eliza-cdsp-v3-2-557b5d02fdd9@oss.qualcomm.com>
References: <20260721-remoteproc-eliza-cdsp-v3-0-557b5d02fdd9@oss.qualcomm.com>
In-Reply-To: <20260721-remoteproc-eliza-cdsp-v3-0-557b5d02fdd9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1794;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wGSZ1WFBCgglA8Tat+ZxlrpGgLQ01a0Za7YsMfdV3XQ=;
 b=owEBbAKT/ZANAwAKARtfRMkAlRVWAcsmYgBqX4AY4a2V5yZC38XsdlfyDwSXmOz9wrRRsQyQ+
 0s2Sxl9RCqJAjIEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal+AGAAKCRAbX0TJAJUV
 Vu6FD/i7KTv+ZNkQNQogpuSPC4E9k4iKNx3wCZbiykRxr4jH/AQOuc2O0f6FZ5xrrZRLOP9lC9G
 4m+MVgMwX/nnmoPZjdFKfDtCxbtR/DFKRCUXEv5mAqjF7jIJG3SGqBdc4JYnPoPdfQ2u1lEMUGF
 //7/CkZ28QvN1NzuRaQWzc0t6ljUZFFKRdt10Kii84iSROSm33SVTFz0NBYCORzOUiHg9WsGC7i
 AxjrVJIVzQbe2x8zPaMllBMJi8Pw7T7VU4IX3eCHbDALbYKQC84Ia4S2jDXOs5Ic2uGDotitlGz
 tNoZ+LU5i8dhpmAE0T2CKFoyfB7fAA0P2BP1EnhrjG2ruoC6zSEZi1XNduLgwWDrpbaDvGsS0QV
 cnGNPen8WLHhfue/nuFejeqPYquTWA4vaedFg4sc/4xdmZsQP2euuA7I3Zt4QlFixkgauu94AO4
 ab7YtUOqpE5P2t5ZcIAoJ7ZABCeAw84HxiYkvH88r0IrtuL0JBYcTkRWtSkFcp0uIm+NPLX5U9r
 nOD+Sg88OgDnMT7RQel+bqZ7sIoPHkwzNDSKuhOmGkSqtZwceWlWUrScAq0d7om7VNvEUV2O9d9
 PaDI9f2UE69punqTI0qqStw9FFAsmt2BKKb4z6EiX32XVSJ0BbdnBpqYsWlwSr8YhfL+9nxUuf6
 lLUftiziV8oCc
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: AraO_KU3YrhMIK4JA75zAfX-QaP9tT65
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f8035 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=yW1A7ns81NOMPIjzjlIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1MSBTYWx0ZWRfX1YIuyr7N0wzv
 FS6ttI6FWpvp/PJsHvl1DtcQ1jTyhBjGVv6zVDzFt1DPDV3AoSWYgFSwn1b/3/k3a9BIo5XlSx4
 +5nspUYyc8vOZD+C4MafwwxVOFgqfoU=
X-Proofpoint-GUID: AraO_KU3YrhMIK4JA75zAfX-QaP9tT65
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1MSBTYWx0ZWRfX3Spo1oRGRTfB
 gBRGETfRfyzAtODnd/cqNgj6Y9xHszb+9ZcPVn5OtahQb9UEF2iNSWmh7Iof50fXe9dZeV+2EE2
 31QuTkaD38VHZXbg+12daWIqCPXZ4g9NBrgMYi6ClAZEJp1kbBrUVFGPYOs6DzxFENB+dE5BqVx
 7sknpmApl2pbU3IixYCE+nV6jgH7TGumctaAH438tn34RgFrdqogHRvkVuUX+gfMtaNqCltSpJq
 c9055yDRhXhOAQ11bTnHi5hVjTCE8+zNnv/R0uDi84IEcDLEIq3CNDEgSId0NnVM/jZz7Dm9Hd2
 W1clL+0IXNfKESVTKcKCvql3XBcwl9+y/4xP2nBaUBz/2sK35guwROCHc2QSiwtf3N0HkMtLzNE
 Oietwlo/jOA27hPbW13EhWEg8Uav3Yk0u/CIDQoEMchE2rqJCobTwjdDIjkgrFkyRziPsrUX/zy
 k0alqNFonus4Cn1VanA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210151

Add dedicated driver data for the Eliza CDSP remote processor. It looks
almost the same as for Milos, except Eliza needs region assign.
Tie the new driver data to the Eliza specific compatible.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 25599d728208..c8313c61da94 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1687,8 +1687,34 @@ static const struct qcom_pas_data glymur_soccp_resource = {
 	.needs_tzmem = true,
 };
 
+static const struct qcom_pas_data eliza_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mbn",
+	.dtb_firmware_name = "cdsp_dtb.mbn",
+	.pas_id = 18,
+	.dtb_pas_id = 0x25,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+	.region_assign_idx = 2,
+	.region_assign_count = 1,
+	.region_assign_shared = true,
+	.region_assign_vmid = QCOM_SCM_VMID_CDSP,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },

-- 
2.54.0


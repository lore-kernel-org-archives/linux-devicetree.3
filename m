Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719811;
	b=EAJt/z9oj/ikL2ErShLuOZlb6O04uAGI4ONwDCF2EysUxYElRSUYIrU5sq1PX/U2Kx2K
	 I77yN2EvYZR/IIaJ2k5mDV2X3puNJ17l4Hcq5AZ7Z2OdOWqVNgKBwwCRRamOVFOInyXiu
	 f8fSNSgsMrT17Srw/K4vIZN9bdBqCuAOLn9fYZ2iepa0kfhyrvNY+U1gGfeUAZaZiPaEu
	 YRIaSYIzdN5QSfBI2lqHhIE1BaITK3hqxcoX3FBzpOzINyrgtH7yplCjwCafcKJ38Yio7
	 +K1rACVuWxSqJndLyHEztVcRM/1J23vlwyCBOlZlvQYQk1yGWJ74G5kC9XFaZFLSJTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719811;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OXaCH6Hk0zNkskg8aCS7eO92Aj1KS1X5NZZHHQN4Emk=;
	b=VQgyYOIojzfxIpGs6e1XKY5xn/duUy1w7xOZWxkxnZUZjpRjll5bMD74v6/Sz75OBqsM
	 9Zkp19I2x3STk0LhC7VprvTlUtM/UB61PO6oAo+rytlVrTBFmqTJ64KI6TPmu3VJJEfA8
	 NlNzRtB7eP+R4ChqUMGXUdmdtMsLJcfczPVcgIAo7vOZeyBUqx/Je9Qk0RXzeb9DkD4Kb
	 3pi/JHtgzfTw3fRmZPOe7hildsGuTkaeZxB0qkhIUeB2PUcfvzJ5g5SEpgIekYyNLiy25
	 etw1LZC3+SM16gL8sYrsdsE71neA4115ETxbgcSzlvXOwdaCMm1x77QJmy6/jxlxC7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nTQz9dwb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ABWfhMaR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC562606A328
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 15:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC562606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nTQz9dwb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ABWfhMaR
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EA1qL2119898
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 15:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OXaCH6Hk0zNkskg8aCS7eO92Aj1KS1X5NZZHHQN4Emk=; b=nTQz9dwbCVRsr3Os
	2b5IzO1UcLgGaoe7tiFVfLvqC6dXARL5xnQXnw6WvZa8Bzo/TDiRvKq+GRHv8aKD
	xhsFi95h7Yozdv/Cos8G5w50wM9JVhlVQ/qGHba3ykyvUVMO2UbqX3YhhIX9S5tn
	Xrv84PR9Xt5wz79Dbp4+wMN6zTOTQL5b+fmTR7kEUbRr/3QTEn0EKrV172IrPRxq
	MCbXPDX9aI3dKqOTuvS3mH6MoQChz0P3agYL6G5d1b4jCSdOMP1/iWJ/MVS1QDk2
	htOTT27NB4hpdjM/ba30pueR51L4+O26oR/XUNJU9m7DKqe0bQ5w3gRhQgqtjlCL
	CN0g7w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2brcbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 15:30:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a190c53a3so1151563eec.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 07:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793719809; x=1794324609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXaCH6Hk0zNkskg8aCS7eO92Aj1KS1X5NZZHHQN4Emk=;
        b=ABWfhMaRSyBp1DDy1Ay531lPOJCGBGW9Uh/EpzY5qknEeQRV//g4/rWE18bzpgaAEV
         b9simQPsulSZyKb3/a8Ocl4evurcHfCodor93uX1IdQlqdYHaJpV5q0wCOXz3W+TvWI3
         geA2f/7uPrqj2gyCrs0ud4lJvECzk8Nbx0ESy3/nUvylmXyPGb/abqkBmFTZsemUW895
         Wfq89jZbfwrjN3IZLj4najyyMO/+mOMEW4KRfqDFNMKF7sSK0j/Zl4os/V2xI0RCWZ5f
         HGIBjt8dtbljInHIhMU3AV4pkJ6qfo7NfdZzZpS+i5Scn+6zXUuTChRHr/jtwuC9h1Up
         B1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719809; x=1794324609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXaCH6Hk0zNkskg8aCS7eO92Aj1KS1X5NZZHHQN4Emk=;
        b=h/+U2/Fi4r7Yg12rc89Uy851GXe1uHNjif/7OiTGj74ZejAnXxN6TVjpnsghwtpk2M
         wwhZ3PxRrMkbot0jsgOrmbjySYwWFl9hfWlJR38SsSMW1lnVE/+RB/8CFuAOyONtQYQE
         bxxt7T/RtgZmPjku9OysRbeoa1CJZThsSuITQXwm4FVNFYl0pcKd6w/SGmsXz2sMRfKr
         L1jato24TrvhPWJ56qBuPF7iZrHSaKLUU/vPOYtFpArrmLmsXDjvkHFmz4qe3Y1aPnie
         lZcRPs2ssSYCT4aSLEwWfO6Dg2o5ac/ILvHoeNqzI5mF1tpkoKF/HrAzDrl2GADcigkA
         rKAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqKnZdiDfUpjM38OB/SNlPSUS9u+ArDP5lPfUkodaPHNGO3NoAqF6PTn6Tyv2dWxUyHrMzhhce8OeR@vger.kernel.org
X-Gm-Message-State: APuU4Z/gxULvyCLsEZvMBbv8jxqLp6idjT7CmNjnxLl4DR9A1Nl58klK
	myKkyarsp0MGS76Oc/Ef4QWydVwhjg7GEtpDlMnum6KsFE861Ting4+pDB6VEze1Cam76sN2gN4
	nkvWZmd9cIpMq0DoadaJnu70bT1IhXrAREKLp/DpIQ1bmvoYh2OxAjkfTE8CXkRIB
X-Gm-Gg: AYBFou3/C51/A7rkOagjAI3BCK2A5BV279cdmrGkRAmtysbVqRLM3WJW7MxEnSVE2xT
	BrU+zuUiJFpVNBarlYtBk3sbIzJePpgT13W1ELPKvUqb2PpShjNmPSA3XjRT76CFDzXdcLK3SZC
	oUGw/ary2MAHTY61JJQwJquDQvVjnWDaoeNKDPud1iZNj9WaMVaH2gXnaO6XcErp0tWKoTpNnOv
	wEkKj/bIg364PPCoc5GBiv7dhMQlEcOL2sJtjQebl6+fjc2Mf2SAbH7TM9FdT05PgYKrB/yCTvN
	jtv0p5e3vUK8eNAfhmx4ZjIv2aHk0eIWJaBonY1V8I9NbKoY4YE5Ytq5aGMop29xRlcZ8U4igQU
	G/z4TvM2mNpcxdmWkQjwXM44F3jDWV+mOiDVGY+WdgroEBwARoRryvNZJ2hIeLc5Ry7VFLZct0P
	nrXZARTGVe
X-Received: by 2002:a05:693c:62c1:b0:36c:9f5e:9bb1 with SMTP id 5a478bee46e88-36c9f5ea6e5mr647154eec.17.1793719809051;
        Tue, 03 Nov 2026 07:30:09 -0800 (PST)
X-Received: by 2002:a05:693c:62c1:b0:36c:9f5e:9bb1 with SMTP id 5a478bee46e88-36c9f5ea6e5mr647106eec.17.1793719808404;
        Tue, 03 Nov 2026 07:30:08 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a426681aesm59888302eec.1.2026.11.03.07.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:30:07 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 20:59:33 +0530
Subject: [PATCH v6 2/2] of: Add support for "iommu-ranges" on a device node
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
Message-Id: <20261103-add_iommu_ranges-v6-2-361f3921a133@oss.qualcomm.com>
References: <20261103-add_iommu_ranges-v6-0-361f3921a133@oss.qualcomm.com>
In-Reply-To: <20261103-add_iommu_ranges-v6-0-361f3921a133@oss.qualcomm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793719787; l=6563;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=/HCjFP5KVncbzHe/trG6YGt98EFlLa86tteMIGVpmp8=;
 b=6Tj+1OPmVTPu0MHSt9bDlvmNIXFchNtVNHkWjLAIEJxrSx0XOqiwaGWpiXkg4RPfULz0MpeSU
 aGhScx+Ai5nBZK91Lz97nm4CMlBgm6d/osaJf8dX8w94Uhzh6kSl0ps
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MSBTYWx0ZWRfXxNw5e6YBN46W
 v2bFa2773wefjoBuKWuAYyTtRmU2BcCJd814/tVo/XlfRQCX8IZVBfSPLxNsUTOzB7FYqt9RAEM
 ZjHMRXGaxbJY0z5kE5ke/wYwAWLLVuM=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6ae9fe02 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9_LjikorOHgNi3J1XaIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: WHo8uFJNlZRjEgQ9yBAOtPWccpI0Jt92
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MSBTYWx0ZWRfX9damhOF+rS+X
 Z4TpneY4JUdLN9rq5UIaY4624qrlSw26ehxWp+UfrGuL7ZXmA24/HiTj9iyHT3SH6vOWRc410tM
 TeCTajHqrdxfEtvWGnVutagQkus/HdkXeVUpD5TTPzZTjsMNqz980EwFUI5L82XFwZFudqZY7eW
 fpL7aH4wymYj9ASRosfD/TdHPd+UnXWdmXe4YqVfQLGLoi7xDJ0kH20anlHGTnDD4HYF4cOlniA
 KeMaFXHnQA6TziUaFPyCLskhySIqKwx4RJI4jLsr0vhy0rZt5bdAUyLM8zxfBLP0JVN25HkJwXg
 +NeGAAfZ+Y7IPJaNSmSKbrzqwdb6lYsvIhQpXqrM5Mv2rGi9x9a0cW35x8NacaqVOeeIJCC+lgn
 qy2zw1HF1rh7/Fjejw+zbP+M7e/HTYGZuspM0lrmbDuLZhp+VZaz0yrJxiCuDfVGq33bn6t0fK9
 dFEIk8qEG3UdytAzCXg==
X-Proofpoint-GUID: WHo8uFJNlZRjEgQ9yBAOtPWccpI0Jt92
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030061

Reserving an IOVA address using "iommu-addresses" requires it to be
placed in the reserved-memory node. But when "iommu-addresses" is the
only property being described and there is no backing "reg" (i.e. no
actual reserved system memory), it does not really belong under
/reserved-memory. A device IOVA range is specific to its own address
space, and does not describe the system physical memory to make it
qualify under reserved-memory. Given this, place "iommu-addresses"
inside reserved-memory only when it is paired with a "reg", otherwise,
define it within the device own node. It was discussed here:
https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org

Existing "iommu-addresses" property expects a phandle, which does
not make sense when the property is defined within the device node.
"iommu-ranges" was introduced to specify the device specific IOVA ranges
when there is no backing "reg".

Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/iommu/of_iommu.c | 134 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 125 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 5c266511db78910d6fd221af5437cecff4931c22..0428ceb50dec58f11872b4fb64e283fa8d9046a3 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -185,11 +185,118 @@ iommu_resv_region_get_type(struct device *dev,
 	if (start == phys->start && end == phys->end)
 		return IOMMU_RESV_DIRECT;
 
-	dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] as reservation\n", phys,
-		 &start, &end);
+	dev_err(dev, "non-direct mapping [%pr] -> [%pap-%pap] is not supported\n", phys,
+		&start, &end);
 	return IOMMU_RESV_RESERVED;
 }
 
+/**
+ * of_iommu_derive_resv_regions - derive reserved regions which
+ *                                are outside of iommu-ranges
+ * @dev: device for which to get reserved regions
+ * @list: reserved region list
+ *
+ * A device can describe its own usable IOVA ranges directly on its node
+ * via "iommu-ranges". Everything not under those ranges is derived
+ * as a reserved region so the IOMMU allocator won't use it. Entries may
+ * appear in any order in the property.
+ */
+#if IS_ENABLED(CONFIG_OF_ADDRESS)
+static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
+{
+	struct of_iommu_range {
+		struct list_head node;
+		phys_addr_t start;
+		phys_addr_t end;
+	} *pos, *new, *next_range;
+	int size, prot = IOMMU_READ | IOMMU_WRITE;
+	struct iommu_resv_region *region;
+	const __be32 *maps, *end;
+	struct list_head *prev;
+	phys_addr_t next = 0;
+	LIST_HEAD(ranges);
+
+	maps = of_get_property(dev->of_node, "iommu-ranges", &size);
+	if (!maps)
+		return;
+
+	end = maps + size / sizeof(__be32);
+
+	while (maps < end) {
+		phys_addr_t iova, iova_end;
+		resource_size_t length;
+
+		maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
+		if (!maps) {
+			dev_err(dev, "%pOF: failed to parse iommu-ranges\n",
+				dev->of_node);
+			break;
+		}
+
+		if (!length)
+			continue;
+
+		iova_end = iova + length - 1;
+
+		if (iova_end < iova) {
+			dev_err(dev, "%pOF: iommu-ranges overflows address space\n",
+				dev->of_node);
+			continue;
+		}
+
+		prev = &ranges;
+		list_for_each_entry(pos, &ranges, node) {
+			if (pos->start > iova)
+				break;
+			prev = &pos->node;
+		}
+
+		new = kmalloc_obj(*new);
+		if (!new)
+			continue;
+
+		new->start = iova;
+		new->end = iova_end;
+		list_add(&new->node, prev);
+	}
+
+	if (list_empty(&ranges))
+		return;
+
+	if (of_dma_is_coherent(dev->of_node))
+		prot |= IOMMU_CACHE;
+
+	list_for_each_entry_safe(pos, next_range, &ranges, node) {
+		if (pos->start > next) {
+			region = iommu_alloc_resv_region(next, pos->start - next, prot,
+							 IOMMU_RESV_RESERVED, GFP_KERNEL);
+			if (region)
+				list_add_tail(&region->list, list);
+		}
+
+		if (pos->end == PHYS_ADDR_MAX)
+			goto exit;
+
+		if (pos->end >= next)
+			next = pos->end + 1;
+
+		list_del(&pos->node);
+		kfree(pos);
+	}
+
+	region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next + 1,
+					 prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
+	if (region)
+		list_add_tail(&region->list, list);
+
+exit:
+	list_for_each_entry_safe(pos, next_range, &ranges, node) {
+		list_del(&pos->node);
+		kfree(pos);
+	}
+}
+#endif
+
 /**
  * of_iommu_get_resv_regions - reserved region driver helper for device tree
  * @dev: device for which to get reserved regions
@@ -214,10 +321,14 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 
 		memset(&phys, 0, sizeof(phys));
 
+		maps = of_get_property(it.node, "iommu-addresses", &size);
+		if (!maps)
+			continue;
+
 		/*
-		 * The "reg" property is optional and can be omitted by reserved-memory regions
-		 * that represent reservations in the IOVA space, which are regions that should
-		 * not be mapped.
+		 * "iommu-addresses" must be used in combination with a "reg" that provides
+		 * the physical address and size of this memory region, for an identity 1:1
+		 * IOVA mapping to that physical memory.
 		 */
 		if (of_property_present(it.node, "reg")) {
 			err = of_address_to_resource(it.node, 0, &phys);
@@ -226,11 +337,11 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 					it.node, err);
 				continue;
 			}
-		}
-
-		maps = of_get_property(it.node, "iommu-addresses", &size);
-		if (!maps)
+		} else {
+			dev_err(dev, "%pOF: iommu-addresses requires a reg property\n",
+				it.node);
 			continue;
+		}
 
 		end = maps + size / sizeof(__be32);
 
@@ -258,6 +369,9 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 				}
 				type = iommu_resv_region_get_type(dev, &phys, iova, length);
 
+				if (type != IOMMU_RESV_DIRECT)
+					continue;
+
 				region = iommu_alloc_resv_region(iova, length, prot, type,
 								 GFP_KERNEL);
 				if (region)
@@ -265,6 +379,8 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 			}
 		}
 	}
+
+	of_iommu_derive_resv_regions(dev, list);
 #endif
 }
 EXPORT_SYMBOL(of_iommu_get_resv_regions);

-- 
2.34.1


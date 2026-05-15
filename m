Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA7E47D933
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844221; cv=none; b=peRN7xM9slkh8fCPedkC5bkHTxcO0ec4tZTnK+zhc+xXBNM0nwqB/RxUxiosoltNAzHZupB+DFdgzFyS8ryrNyqoQh5MH8+LULkzNN3SqP6OEcEj1EJdpBSd3xPIiTjWyw7M5YS2OSatQZuVCktVOY3lS4rJbD7c3uSOTS9hShE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844221; c=relaxed/simple;
	bh=R4hyx2wkdaEzOFeos/VVceiifZ41pzNik6VeXo4D/4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fyIz7Vp9yA0IdiS59dq4LSbTsaGzJ9V6sh4uc4tRRWla2zokjYGsNe9kLfK5pCMy/peTmMGy+edr7oNrHcbjbVOImv1bbcLr389IZ/6IyQh0eX6Y0Kfpnh/DN0lq+Lk78JYdXhCEdkBE9agoU5TECTTvXyMV29y+gUOkhMvk2v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZH6r/4P/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JLO9LLeP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZH6r/4P/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JLO9LLeP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5eUGL4022529
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KJAZYj78iKXwM75l/HDp+1jydtLEC0dNPj7aNSYgj0o=; b=ZH6r/4P/bjfihWKc
	MWvcPuD3B8tBa1R0q1RbSZQfNbO71WlEUb7+LlWA1NB4Uj+Ei3K0zu6B0SzNZ3RC
	XY6CCujcEv6Vk6gL6ThGZ1qK6ExE13ZKdD8ljdm2ElJ+okYoeEU3+JfFPj0LghC4
	Tk/J9EvkavnoiP21apqjS+VWijHKIQVy3494l46PzjaVB4N2+zduvI59FRCUVAZa
	PhByS9XHmVX1I3QWFtViIXYrdCppNIBXBaVUxpYl4yfk1dvJhRdqkD8msJRLmVnl
	J6dgdUCPfXlMUkf9F1agxNCJbCB3FM/RZbULEbv+ey/lpIoKxDkeJYPDiXYdIHE9
	C13O1g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ru1e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:23:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3663d5e9bf4so8810112a91.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778844218; x=1779449018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJAZYj78iKXwM75l/HDp+1jydtLEC0dNPj7aNSYgj0o=;
        b=JLO9LLePbC2H1wuFgU8p2bNoNtUe316v4P+HQZCgB8y6ScM9PlEqcpdX6w0fq2YzFK
         mrngxa27CxlgxCMRPuobxSDtfZie2iC7ze3L0daL/av2zqmWkzgqs7S/4C9A98kIivNU
         dbLJOcmwrqXik+++5vI3LJIHwSuEQ26928CfwTjMGK3Y7oJ9I4vUNTYnYBwa2k0LWmt8
         54qQFmuaR+kj3j59Z6xyZs4xExFssMpjEaI6P3k22oL6zT0/81lY9IQ74FMRpCPqtBmm
         IKSsT4eUnft70pUfvBtgTcxWx5YPJanuzSuIIJzHNbk6qKodgsqebU8bjRxRGjvlmKKv
         VFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844218; x=1779449018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KJAZYj78iKXwM75l/HDp+1jydtLEC0dNPj7aNSYgj0o=;
        b=mexwyNjxENhOwUGtH0tUQV/Smvu5gD+1G/rpBuLrs2ClMdzhHPswnt978T3d8Z/h31
         mJjTBmoeO7qE/03HOt2D0Sk3vGUew1GQw0ZOqkUZkZjQDbPYImvjz4PTDnexltpYBqQr
         FOQ/0yxlpi1FwDUFKVWsm+cnm/fcqVsT38O2AE6RP/OVdBGv7dk/ytnuOPOEvtdEEi2v
         endBlQaw73PhNQ8P8lFglkHjVua9hicSYL1mN9sZheR/xwXG8JX8x1Nz4l/fW6SJNG7w
         /ELWKL3EtPox8AWmmaiHgoe3+iyhUjS6fIbtT/M+y3UEyAfPU46DCNzR9djxH0Q9AlCH
         AJ+w==
X-Forwarded-Encrypted: i=1; AFNElJ8LvEgTtM7HhF59VxHAGhxdzDyQBWrCmuHfnSgy0t/0g8ZMfcOyzcT83OMMfiYwVrXnSzUYV1ZMQ6uh@vger.kernel.org
X-Gm-Message-State: AOJu0YyGyhvpscOeAFFNeo//mloPJQhcP4M6mfLUA3JOXgIN5ZPQ057m
	/MTNEVhuvgXCrEj+twtqgBzsFSLnjWX+hQIr5pihQjIDZN476jZg3I9mcojfOYyKfZQH1QDjYfH
	wuoTgfmco9vD2U4S3+XC/jXPllhEIM71z5djbhXUIf/DYQNdS9rgFbBz7Lhm/qius2sbX36EX
X-Gm-Gg: Acq92OFau8A2rA9RDysLQU0jUo6TFNtfY0uu1W/PbNiTOxY7XKseqyhfWEer6h6MCg1
	b52d6lMv3JVmmz756e4CkOinK+J+eGsn1Uo/SzvA7FfH1eFLnAFbtAoO4ALno3HJ9r37QIPW1et
	Pf22K7BvX3oJMpGiQLJk5U+YgWPgMBVdDziOXPBOAq16UwHqD8iTAqtdAYkKmDLeorP8/DDY7Rz
	Ak4Av4yZeNfntqZwg6yKrc1p9JUbjaS0VWgRrMldq/nnI9tijk7ObtI3FvV+/b0S3QHXrDJv5Nx
	0DdkxcQEh52G2WjkJN5igcI8TMiiK5fxjtpjk7TRZl/4rU22ShdfkCur7A+12UZGrR580aFMOhM
	4W9wh5Sly2fRakPVGgWMUpnq9g7kS2RQg6w+QMFQdvbj4AknHdqbAl8M=
X-Received: by 2002:a17:90b:5290:b0:35c:30a8:32a with SMTP id 98e67ed59e1d1-369519ffc97mr3758466a91.9.1778844218279;
        Fri, 15 May 2026 04:23:38 -0700 (PDT)
X-Received: by 2002:a17:90b:5290:b0:35c:30a8:32a with SMTP id 98e67ed59e1d1-369519ffc97mr3758423a91.9.1778844217830;
        Fri, 15 May 2026 04:23:37 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2476249a91.7.2026.05.15.04.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:23:37 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:51:17 +0530
Subject: [PATCH v6 02/14] iommu: Add iris-vpu-bus to iommu_buses
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-glymur-v6-2-f6a99cb43a24@oss.qualcomm.com>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
In-Reply-To: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778844197; l=1090;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=nwLCkv3OjAFGS6jwKQhLZrEXe26RmaJcgKrBgwUePzE=;
 b=7o6m1C3GzJF7wYxJqXejGuZGgG9YRn2+c6vLHEyNya/et9avgtj9sj4z21cH9Kwy0U+ClNAwo
 nWMlX1NqLtBBKhO+bHZJ27Ti0SI3s3mRZ7sHQBp2smRB9uo90nuNlRu
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: OkEhSlBkUjFBXA0u7_uISRpwElXQbb2N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExNSBTYWx0ZWRfXwxG2XlAieH3S
 Ne9abNFjvDeLLhOJ1iOMPCvwsIrzeIfEh1KQyfphba6zJP38eVthIEmAtsApuTfK7mvPw8pLQ54
 Zmse5wNMsPEdcdcuPpHMWJRYwDWs8DgH3lSRS7g3sIJ1yfnMLS0QelHYncxg218sinEkvKooVmY
 wJUajPTvVDgUWOhRdNI7rt1g1/M+qp4GopB/OAS37jySKu5ICLXDVEJUEROSNHg8GaduF4auf2i
 m/xDhmpOZe7CjB8/mWjSLQv04CpYCWUG/S+qrtL7DN59QwpWx/9LZ8k7fQ6Tn6rRASquuFKlOAU
 MYu56KGyG+SJM7UXCpN9ArBrGdSpqMxjiMj8IlxTQQExsnl3c8/5HSQhYg5ialCwy6H4Rn8XTuL
 032v1v0ctaRp+AAmEyIEEruJqnEzvQaVxWcv6p9HJ+khB9apesTQQVu2/zYIxYLbuk6MhlwTHrQ
 5D/jdZq5KrOc3fR/Dlg==
X-Proofpoint-ORIG-GUID: OkEhSlBkUjFBXA0u7_uISRpwElXQbb2N
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a07023b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZGoT60Gb6PEvP4nDRaMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150115

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Add iris_vpu_bus_type to the iommu_buses array in the core IOMMU
subsystem so that the bus notifier callbacks are registered for
device addition and removal events.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/iommu/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 61c12ba78206..d2c67f0de13a 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -13,6 +13,7 @@
 #include <linux/bug.h>
 #include <linux/types.h>
 #include <linux/init.h>
+#include <linux/iris_vpu_bus.h>
 #include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
@@ -179,6 +180,9 @@ static const struct bus_type * const iommu_buses[] = {
 #ifdef CONFIG_CDX_BUS
 	&cdx_bus_type,
 #endif
+#ifdef CONFIG_QCOM_IRIS_VPU_BUS
+	&iris_vpu_bus_type,
+#endif
 };
 
 /*

-- 
2.34.1


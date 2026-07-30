Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFAB3C0A12
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 07:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785396745; cv=none; b=gTiPKKz2njyJjhpHxACAx3KzmYL6GcsGsTELSuehIyMF6NyqWsPRQKftg4gDEpi5wy7/971d0PxOg19sG8y1r6VI5CXzXQd7SLucmOUrbw38d0jZQi9nJq6PwkcnmX4b49SnkSDjsvRFSEihmHXcgUdUz1CMFDtRL343u+oM7og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785396745; c=relaxed/simple;
	bh=T4AREj5+HianmNbYmA78HX5B12JSJYCHX1SzJU0m8PE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IiqNygf9P4oLCNymtOAYaMValjqOADH8w5m85EDMqwozNoAL0rYcofjDmimjyfKDDuipmJoiDwNc7T6hPoi66e1njhj1QNTKzV5otnlVPcqq297ECHq/crxtxZUkNv4fjuRQyaJmbVCXf04IQ3jXRigsxPdRvPzJju9NrDEyiz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eIE65cA+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DB6L1CW1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIE65cA+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DB6L1CW1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U7AokK4169266
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 07:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eVTfTB4N0vYRMOV+tUMUEwGiB5W3Y86c7/P
	8bjIwatQ=; b=eIE65cA+IUiT8Xt5bgvBlqjgj7K41nfXZq7xOMpKXc6C8HeZnCO
	VF47vzJsigkIKuKjN6towaghLD9c+x90vb9dv7v91fdk0hKvJYgrrAOHS6A2y9Yu
	voaMTMrsJ7lYij7VEfdPISirRYMI8gjELtmHTYZOB0t72ZytKsHMTK/Tp5KwLpZz
	ySPuKm8Gu5mGr4v5C44FlXH1q551CMP2JFbhiyX2cK1s1EmdIWewZ0scEPqU351/
	g4w994+7Cb3ELVW1vVd1RcMLFFd56KRyMlfITTvPYI8iz3HaGORwGG8ImeB8VQio
	DYoItaSbeV3R+pnqXkAZOj7iMhZbSPcPL6g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr208031e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 07:32:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8484ba00601so2153448b3a.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 00:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785396741; x=1786001541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eVTfTB4N0vYRMOV+tUMUEwGiB5W3Y86c7/P8bjIwatQ=;
        b=DB6L1CW1JMg+S0QR2JczQztPiQ1vyLBth3+R8f71w3wAWMRvWje7wPSFd2wH8DIh0d
         hEfkIJxO3MGVoNBYMsjvHx4LHXDedx23NHBCPZ6dLGlSx9jpU3UpkG9fjd04deFU9kvT
         k2NFuYBm7QyjHpcNlKlmGkt498MU9tk1WTMvkJplLVZFnA02ecclY6OCgGR6m1cN8IyU
         mCKuFGi0g8m0Us3W0TocfF+qmivCsmyrMPyzy8J2Nj6tfZE4xYk2xyAwI0sNsjU3Ec1+
         b6gygP/0DqY8f7JEUtPtSTVXg78p4SvdfeHcU5WS6tZCxpi8TwPcb0Y8Tvs7jIB35EvJ
         Hrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785396741; x=1786001541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVTfTB4N0vYRMOV+tUMUEwGiB5W3Y86c7/P8bjIwatQ=;
        b=bRzpMDyuiUbG6D/Z74FEiag4eqtgsbUjQPeOBiVKzS2qInJoId0bfjRn/mjBOp6uJw
         7tQShFJLdK66Pcl+gKZHw7GsxLTfwZhQUyXJZeYcFq1s9yj4maYj3UE314JSHX8dDOV3
         EW7DW+E5By9ghSGCfO0PLmkj/weS/02X0ng0GVbm4zepWSPS/qk/YajQfBtsD5DbilmJ
         SGsS3UNJk/1y95LYNldq6qwvSTs7IvogG9EEsIeksG9WV9oXRHOax1EsO2fTEt+0wUI8
         FlT0ZZJWX1dHTTlMpsrm7ZgxbcCttgh9W5N+R8rJBKxkebCAIVzM6WzBHxuo4tFbPtY6
         fQ+Q==
X-Gm-Message-State: AOJu0YzvcTUFChkWeJSzddSx7rBLbF8FqmoBoZt48AanBeDWbk/0AxwP
	QPrL/+41QDXHD3TAS03n1A6P1rleTTyw4gEmQrXU0o4qLxZ98mCSNyb+Bq/AuA42WyNcwY3vvFB
	sce55s9hXUEJaiDxq1u2yzQdRvj6BTNKT+4KprZfF/zGo5dOKGfBWgM9o+MzNwgG8
X-Gm-Gg: AR+sD128MG2wYl3nlmInICAkXFd58gHJvHo1hUZYHS9NfnU5ziUB6RVsP8aRV0IWv8S
	lj+uYz6KVwnRAa7S+dA/t7SFxneWsUbQYgXn7GUGOplNxTilx/JtjqqLJ+8cZiFJOsux69uzQMS
	cbGtBiolJQC7+1wKqHOLFZq5nzEbSb6KDsh/eq0/3GcbNzr4kpqt1Q/94c96zFEIr3iBDDjp8Hj
	DijM6UutEgFl2lDIFetN4j6rjriEwBJWlOmTzHpAIJ7S71ADBI15NvWzKReMp7cYOApFLBFbNKV
	npFoEamXLdyhza07ypzMForyJjpwK34mhkgg9PWL38HrIR8z2ZNwFyMUZRobWYluV5V5q70cjkw
	ab4JATKBcsxcjRytJzwi8CBD8c+8=
X-Received: by 2002:a05:6a00:21d5:b0:848:2f74:d8d0 with SMTP id d2e1a72fcca58-84ebc44ebb1mr1613135b3a.65.1785396741158;
        Thu, 30 Jul 2026 00:32:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:21d5:b0:848:2f74:d8d0 with SMTP id d2e1a72fcca58-84ebc44ebb1mr1613098b3a.65.1785396740413;
        Thu, 30 Jul 2026 00:32:20 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e9fe21994sm2559922b3a.9.2026.07.30.00.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 00:32:20 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2] of: reserved_mem: Introduce devres-managed initialization function
Date: Thu, 30 Jul 2026 13:02:14 +0530
Message-ID: <20260730073214.1146432-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JIgLdcKb c=1 sm=1 tr=0 ts=6a6afe06 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=C96w-YAaP-Zupzk_Mv8A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1MiBTYWx0ZWRfX60bc9V+09USN
 bp04saPN2OhcdjMNYpJpa3jClTB/+dUHv4gEq3wKe4+nKnDgu8gExY16Ae/j51ZeF6X+7fcomYO
 0lJMngSyYct7KJJIiZ7SLVKuFqIuicw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1MiBTYWx0ZWRfXyxJH8zlDtpBJ
 qArmbWjmiU8li0rYGD6BC9FcVOkrWOcfuhVN5CF1Rl6t9wsHUuNe1VuCQzz/rvJkOBIqTzrdzpg
 0JQm7ImLXWaCKmyaXDj8NbhECibcIEhMNcWD398tuWtambCKNeYaX0h17z9XcRmisZKmFoM2I99
 HGe+AuzY8JekmHS8ACZFq8nDgh7lyn5mj1Cwcl4sEMQeqY3JZUTu7TFnyBhduQym7pTeKEvwRSr
 rfNx/0rXtSAw9h4C4TCUcf8SKHfLq9Jnn1Z+pJpSsx7PPvZKzLI03RLrmUPhBQaFWqMvz7c85A6
 JkVspB1G/sOImY88VeRdosnZNxBtsHFLqvig9fmXngNF9+Wz9+pAKTPS9QXBXMRXnRJA0DcGO11
 EvyGo1pVII/3QZx31ajhCXiAZvQ9UnYVWasDsKNK1vC+bPJb7yeMUPQMW99N9+D6oiuLYmYoIg9
 qEGH3zWZNJ0zdXoPySA==
X-Proofpoint-GUID: 2QNoL2qRCaPCVLiiq8NMGt1XfG6o-C5O
X-Proofpoint-ORIG-GUID: 2QNoL2qRCaPCVLiiq8NMGt1XfG6o-C5O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300052

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Introduce devres-based helper for of_reserved_mem_device_init()
to help fight dangling references and ever so slightly reduce the
number of boilerplate deinitialization calls.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes since v1: https://lore.kernel.org/lkml/20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com/
- Separated from big series with multiple API users to avoid clogging the
  series. Instead of merging all at once, the plan is to land this API
  first, then post the individual subsystem patches that use the API.
  There is enough user of this API given in the last series.
- Rebased on latest Linux next tag.


 drivers/of/of_reserved_mem.c    | 44 +++++++++++++++++++++++++++++++++
 include/linux/of_reserved_mem.h |  7 ++++++
 2 files changed, 51 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 7b1616b9c6c2..8c9d6395d6a3 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -796,6 +796,50 @@ void of_reserved_mem_device_release(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(of_reserved_mem_device_release);
 
+static void devm_of_reserved_mem_device_release(struct device *dev, void *res)
+{
+	of_reserved_mem_device_release(*(struct device **)res);
+}
+
+static int devm_of_reserved_mem_device_init_by_idx(struct device *dev,
+						   struct device_node *np, int idx)
+{
+	struct device **ptr;
+	int ret;
+
+	ptr = devres_alloc(devm_of_reserved_mem_device_release, sizeof(*ptr),
+			   GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret = of_reserved_mem_device_init_by_idx(dev, np, idx);
+	if (ret) {
+		devres_free(ptr);
+		return ret;
+	}
+
+	*ptr = dev;
+	devres_add(dev, ptr);
+
+	return 0;
+}
+
+/**
+ * devm_of_reserved_mem_device_init() - Resource managed of_reserved_mem_device_init()
+ * @dev: Pointer to the device to configure
+ *
+ * This is a resource managed version of of_reserved_mem_device_init().
+ * The reserved memory region will be released automatically when the device
+ * is unbound.
+ *
+ * Returns: Negative errno on failure or zero on success.
+ */
+int devm_of_reserved_mem_device_init(struct device *dev)
+{
+	return devm_of_reserved_mem_device_init_by_idx(dev, dev->of_node, 0);
+}
+EXPORT_SYMBOL_GPL(devm_of_reserved_mem_device_init);
+
 /**
  * of_reserved_mem_lookup() - acquire reserved_mem from a device node
  * @np:		node pointer of the desired reserved-memory region
diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index e8b20b29fa68..49da515859f2 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -40,6 +40,8 @@ int of_reserved_mem_device_init_by_name(struct device *dev,
 					const char *name);
 void of_reserved_mem_device_release(struct device *dev);
 
+int devm_of_reserved_mem_device_init(struct device *dev);
+
 struct reserved_mem *of_reserved_mem_lookup(struct device_node *np);
 int of_reserved_mem_region_to_resource(const struct device_node *np,
 				       unsigned int idx, struct resource *res);
@@ -68,6 +70,11 @@ static inline int of_reserved_mem_device_init_by_name(struct device *dev,
 
 static inline void of_reserved_mem_device_release(struct device *pdev) { }
 
+static inline int devm_of_reserved_mem_device_init(struct device *dev)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
 {
 	return NULL;
-- 
2.53.0


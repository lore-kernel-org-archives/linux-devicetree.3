Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808744279F5
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 12:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983902; cv=none; b=doKPeCtlN7qDm9A+5R/3vYPz2AYlXO5Kt3XIBCLKMIm7VL3JNfWJbipcGi1QeV2iu+amumQ7UQhrQxQCW5tzo/D9ABm/1wl2hCHBR+3obbqa4QrgpTCa2+2LsBqFRNcMdq13CZCl/5cRgYJcD+d8TSek2l/9+zey2dft5SBiVCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983902; c=relaxed/simple;
	bh=VI5F8t3DU2L32PPNZQHlAorz7SO6vTHnNS9mo4ZneVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UlzQG69geEb/38YaldGGMtSUq2W6HM7dnZ6c+Bz2cAJJJlxt/exgtw4C01Tzq9Gc3ZhDkUPMeuB5DHYlOUE13Je9Ln0WmlPUkMHbNy6oKrq0KqOltoM4O6OIgzvFPZY803roifwJ3vsgCkVHXcezBliOhfu4Xx/vdiYIDfUjcwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=In5OnYwr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gz70K9h9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="In5OnYwr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gz70K9h9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456SOQx331063
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 12:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iWsFFMNfVlraN9koczmb/sKMFEkm65rQ61A6AS0zXkE=; b=In5OnYwrOosFvrc4
	229iIEoWGlI9oNLndzcldyoMyZUPv6/qN3n9YXP+e0rgWzFhyO4VdDJ2fc2YxyVY
	oDrnbwG0aYkUhSVXUeuTDfbemwTLxuydv9CCxC4XXqJoCFHuwuqAOuDemHDx7M72
	kb/mKcXyzQxlq9nNyoRauCHctrAYxmmUIgnpTSI5YBnJAsd7yfxbZ3qYmes0jYZx
	5Nxo4K1K1wzgSB7sSXzYom/TXly1FlrBF8wJhzBaNLATiyQBqZq0GC5zPlVldxOL
	AfiP828DFl8hJB3790buiORDsWtSZoh3+E781v0z9diF0bY6H/X4F7Rpc9t8suif
	CzSXUQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvr1cdgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 12:24:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6e8fc8af18so477259a12.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 05:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777983899; x=1778588699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iWsFFMNfVlraN9koczmb/sKMFEkm65rQ61A6AS0zXkE=;
        b=Gz70K9h93Nf4chclWDgJmbutux/f38QWR8qpcxi+b1xhZ/lATW3/uhisZmnsEAqH2j
         eAxNjCq9i8GjOEr5jRdi1GLtxvOwPFB6gd5WLZ4TNadNHHjfw6KwsbReIzcPOTlBmKzI
         7SGxIcK8lqseY4P2tvNugvCmlXUuc9qXqgBgUhG+gSP/Qg1dWaq7jvjMngMDTCz/h5iC
         MMLFktGN6v/P7vgjytYlRZrBeip8a6HXTNDZEqbvp4h0+AWPg4ePw7zx1TXdC/vaEDO8
         FsL8KasucjE+YurDxq4Be7MX69B2LCAtpKwCTAzdBvYIzXZHF32sgreWKwxi+wEgcMwa
         0xtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983899; x=1778588699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iWsFFMNfVlraN9koczmb/sKMFEkm65rQ61A6AS0zXkE=;
        b=cUall+Ai5IKZiXRhZd9q+DM9hI2P8UbksTbJYDPJhKPuw/C9IH5+DLveABhAbHU8lx
         yKwxXgmrqA4z1RSzbnDTfLogiRQWQd2wKrTxLQwpYanKrPpr/DW0BmWh+KWnPPQUf3th
         HqaF5+qGEfm/D4jMe+39ZSHwCJkd89vZm8vArN8gE8JEtwclfK6YLCm04nbpjA8PRqEj
         1y0I+xgW929zCdNOeIoaSAf3IUFE5Wg/9E0PT8EaZMty3H9j7aB1DMHqnzDS8MUqbeVr
         tJ23RH40UNPo+tvPxygmmA9lQkQOTb7hVkdOpkCIrW2GBWPxAUS28M7HLAWkzCLGDyA1
         drOA==
X-Forwarded-Encrypted: i=1; AFNElJ/0e6/Q1zC0kXXgouSLzOp29LndhWiHOjj7plnxaJmZcT5APA3c3GVaVMwjtsuqrtzlYGGN4jv5sMcz@vger.kernel.org
X-Gm-Message-State: AOJu0YyS0lhu29w+dN78SNn2/RWABxEM9A1FePDzQaEJ8Eg/ZOT07/De
	C8JH2aEc4m+K3hxMfHiUMxAYjXU3xHwIiHPs0t8CJGHkqwB+es2eL1oFtXTvZJBn056MBUGXbBU
	A6UMu2m2iUaPpwsB3B8dVfWXC9J+2Dp9GO+/XoJmVx6K+9rFePsTH0Tp+p/tNriL8
X-Gm-Gg: AeBDietkYkKKXvL6wGfkDvc2GyiwmIxJySnVFYWO3PtYVcPS+hhbYd8Jqv4wfwCGBOh
	Mj2a5JOFWzqwAB46Slim+X+k+axLwLEhvgJU6sPv8zXD5+0GnKgsjWOhYfdvEWubYFKdcAQJUkt
	8eN8+UN93ue8mPQ+ZDyJIWrsLR8XOkoMlKblhiqIEjHKS9OCR3bAhpmDi86js1UuvI4qdY/4iy3
	pdGh6yiZQuIT1AABPu17GJzTdQLfS6pv4O1UyyHX8XNa9x3PLumtoR3pWWcVN9PshDSCWru7uC8
	+hmsulPKQRt0GHkk63yujIbUbK7yU2KPL74DgZeynf3OytMjUtVKrDTY6Vk4FhglG+IH3disUHD
	O4S4/S+mEKPBgAMI26E4VPukheAq7SPsXlT7E8mBIyCH5GwxguOmwP3GbiDuCcx0=
X-Received: by 2002:a05:6a21:7a91:b0:39c:68ed:9a39 with SMTP id adf61e73a8af0-3a7f1cccc9emr7197135637.6.1777983898871;
        Tue, 05 May 2026 05:24:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a91:b0:39c:68ed:9a39 with SMTP id adf61e73a8af0-3a7f1cccc9emr7197093637.6.1777983898325;
        Tue, 05 May 2026 05:24:58 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbaac5bsm12597998a12.6.2026.05.05.05.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:24:57 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Tue, 05 May 2026 17:53:45 +0530
Subject: [PATCH 1/8] ras: aest: Fix shared processor node handling and
 error log messages
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260505-aest-devicetree-support-v1-1-d5d6ffacf0a5@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
In-Reply-To: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
To: Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-edac@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777983885; l=6543;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=VI5F8t3DU2L32PPNZQHlAorz7SO6vTHnNS9mo4ZneVE=;
 b=6faC5/GEh5FwFL2OgPM+ezzK5byXA+KdZ7TJce1TC337AuIA1fKkKcfxOExCMlDv938Fkt0LW
 6jmLHyuiasQDc5iy7BsY6vFF3Lv51LzJ4RKX9eYWynnQF1Ru28y5l3Z
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-ORIG-GUID: 4fyehuNwBdN1YKKMNadWgFAQz5Dk1jbs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExNyBTYWx0ZWRfXw54rX2RFLtT2
 LY2VleJsy4X3qLVofHdHJ7QWdqqZN8nBzpW71tjsbaB50Z9lB3TFXpkANZ368VsWiukkn5qNdFj
 G+RzvPmIpbxzkn9URLiaZQNTkq6RTasVQVC7ucmvlIYCLF42hLgaDITEEtJfpUk1bbILPs7AxuZ
 yLoUM4KBl5xveinjcHt3KeRhOVamYOZ2lRJnXKb1KkCunTNtJPKS5MGLt0/p63SvqFsc2QdwfWt
 4LVuSY4R9cxbRcYHqzOs+/VifZtQGZClrp4U2doPjQceVJ7JGV56buVE9exHmynuRpozIXSx9tP
 LV7QN7Mbez83j6FLDUPF6Jom3Fvbz5zdQMPLPRwWaLHEoWP/XGNPvTpNVat/cwz5036Yth8b1Xj
 ek9rDCi/qRetuviEZ38btZQJ084k32MkOJ2kE288D2XM7guz8Sd+LJFpXm62io9tTmTDqZhrfXa
 2LyD5ldxXcHY+cXEfAw==
X-Proofpoint-GUID: 4fyehuNwBdN1YKKMNadWgFAQz5Dk1jbs
X-Authority-Analysis: v=2.4 cv=RvL16imK c=1 sm=1 tr=0 ts=69f9e19b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KYcbzuZsfW-uCfy2wYUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050117

Two related fixes for processor nodes with ACPI_AEST_PROC_FLAG_SHARED
or ACPI_AEST_PROC_FLAG_GLOBAL set (e.g. cluster L3 cache, DSU):

1. aest_dev_is_oncore() returns true for any PROCESSOR_ERROR_NODE,
   causing shared processor nodes (which use an SPI) to take the
   cpuhp/PPI path.  cpuhp_setup_state() is called instead of
   aest_online_dev(), so aest_config_irq() is never called and the
   hardware IRQ-config register is never programmed.

   Fix aest_dev_is_oncore() to check irq_is_percpu() on the registered
   IRQ.  Only nodes whose FHI or ERI is a per-CPU PPI take the oncore
   path, nodes with an SPI take aest_online_dev().

2. alloc_aest_node_name() uses processor_id for the node name of all
   processor nodes.  Shared/global nodes have processor_id=0 (the
   field is unused when SHARED/GLOBAL is set), so every shared node
   and the per-PE node for CPU 0 both got the name "processor.0",
   making error logs ambiguous.

   For shared/global nodes, build the name as
   "processor.<resource_type>.<device_id>" (e.g. "processor.cache.1")
   so each node has a unique, meaningful identifier.  Per-PE nodes
   keep the original "processor.<mpidr>" form.

   Also add proc_flags to struct aest_event so aest_print() can
   distinguish shared from per-PE nodes and print an appropriate
   message.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 drivers/ras/aest/aest-core.c | 54 ++++++++++++++++++++++++++++++++++++++++----
 drivers/ras/aest/aest.h      | 15 +++++++++++-
 2 files changed, 64 insertions(+), 5 deletions(-)

diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
index 6a2d84b47721..b4f4c975da1d 100644
--- a/drivers/ras/aest/aest-core.c
+++ b/drivers/ras/aest/aest-core.c
@@ -49,7 +49,19 @@ static void aest_print(struct aest_event *event)
 
 	switch (event->type) {
 	case ACPI_AEST_PROCESSOR_ERROR_NODE:
-		pr_err("%s Error from CPU%d\n", pfx_seq, event->id0);
+		/*
+		 * For shared/global nodes (e.g. cluster L3 cache, DSU),
+		 * id0 is the CPU that handled the interrupt — not the error
+		 * source itself.  The node_name already identifies the resource
+		 * (e.g. "processor.cache.1").  Print a distinct message so the
+		 * log is not confused with a per-PE CPU error.
+		 */
+		if (event->proc_flags &
+		    (ACPI_AEST_PROC_FLAG_SHARED | ACPI_AEST_PROC_FLAG_GLOBAL))
+			pr_err("%s Error from shared processor resource (interrupt handled on CPU%d)\n",
+			       pfx_seq, event->id0);
+		else
+			pr_err("%s Error from CPU%d\n", pfx_seq, event->id0);
 		break;
 	case ACPI_AEST_MEMORY_ERROR_NODE:
 		pr_err("%s Error from memory at SRAT proximity domain %#x\n",
@@ -133,6 +145,7 @@ static void init_aest_event(struct aest_event *event,
 				info->processor->processor_id);
 
 		event->id1 = info->processor->resource_type;
+		event->proc_flags = info->processor->flags;
 		break;
 	case ACPI_AEST_MEMORY_ERROR_NODE:
 		event->id0 = info->memory->srat_proximity_domain;
@@ -175,6 +188,7 @@ static int aest_node_gen_pool_add(struct aest_device *adev,
 	if (!event)
 		return -ENOMEM;
 
+	memset(event, 0, sizeof(*event));
 	init_aest_event(event, record, regs);
 	llist_add(&event->llnode, &adev->event_list);
 
@@ -730,9 +744,41 @@ static char *alloc_aest_node_name(struct aest_node *node)
 
 	switch (node->type) {
 	case ACPI_AEST_PROCESSOR_ERROR_NODE:
-		name = devm_kasprintf(node->adev->dev, GFP_KERNEL, "%s.%d",
-				      aest_node_name[node->type],
-				      node->info->processor->processor_id);
+		/*
+		 * Shared/global processor nodes (e.g. cluster L3 cache, DSU)
+		 * have processor_id=0 and use smp_processor_id() at error-log
+		 * time — using processor_id in the name would produce the same
+		 * "processor.0" string for every shared node and every CPU0
+		 * per-PE node, making logs ambiguous.
+		 *
+		 * For shared/global nodes, build the name from the resource
+		 * type and the device id so each node gets a unique, meaningful
+		 * name (e.g. "processor.cache.1", "processor.tlb.2").
+		 *
+		 * For per-PE nodes, keep the original "processor.<mpidr>" form.
+		 */
+		if (node->info->processor->flags &
+		    (ACPI_AEST_PROC_FLAG_SHARED | ACPI_AEST_PROC_FLAG_GLOBAL)) {
+			static const char *const res_name[] = {
+				[ACPI_AEST_CACHE_RESOURCE]   = "cache",
+				[ACPI_AEST_TLB_RESOURCE]     = "tlb",
+				[ACPI_AEST_GENERIC_RESOURCE] = "generic",
+			};
+			u8 rtype = node->info->processor->resource_type;
+			const char *rstr = (rtype < ARRAY_SIZE(res_name) &&
+				res_name[rtype]) ? res_name[rtype] : "unknown";
+
+			name = devm_kasprintf(node->adev->dev, GFP_KERNEL,
+					      "%s.%s.%d",
+					      aest_node_name[node->type],
+					      rstr,
+					      node->adev->id);
+		} else {
+			name = devm_kasprintf(node->adev->dev, GFP_KERNEL,
+					      "%s.%d",
+					      aest_node_name[node->type],
+					      node->info->processor->processor_id);
+		}
 		break;
 	case ACPI_AEST_MEMORY_ERROR_NODE:
 	case ACPI_AEST_SMMU_ERROR_NODE:
diff --git a/drivers/ras/aest/aest.h b/drivers/ras/aest/aest.h
index 9d67d79eb4a2..9704af97fee8 100644
--- a/drivers/ras/aest/aest.h
+++ b/drivers/ras/aest/aest.h
@@ -8,6 +8,7 @@
 #include <linux/acpi_aest.h>
 #include <asm/ras.h>
 #include <linux/debugfs.h>
+#include <linux/irqdesc.h>
 
 #define MAX_GSI_PER_NODE 2
 #define DEFAULT_CE_THRESHOLD 1
@@ -94,6 +95,8 @@ struct aest_event {
 	/* Vendor node	: hardware ID. */
 	char *hid;
 	u32 index;
+	/* Processor node: ACPI_AEST_PROC_FLAG_* bitmask (SHARED/GLOBAL) */
+	u8 proc_flags;
 	u64 ce_threshold;
 	int addressing_mode;
 	struct ras_ext_regs regs;
@@ -387,7 +390,17 @@ static inline void aest_sync(struct aest_node *node)
 
 static inline bool aest_dev_is_oncore(struct aest_device *adev)
 {
-	return adev->type == ACPI_AEST_PROCESSOR_ERROR_NODE;
+	/*
+	 * A processor node is "on-core" (uses PPI + cpuhp) only when its
+	 * interrupt is a per-CPU PPI.  A shared processor node (e.g. cluster
+	 * L3 cache, DSU) uses an SPI and must follow the non-oncore path
+	 * (aest_online_dev) so that aest_config_irq and aest_online_dev are
+	 * called instead of cpuhp_setup_state.
+	 */
+	if (adev->type != ACPI_AEST_PROCESSOR_ERROR_NODE)
+		return false;
+	return irq_is_percpu(adev->irq[ACPI_AEST_NODE_FAULT_HANDLING]) ||
+	       irq_is_percpu(adev->irq[ACPI_AEST_NODE_ERROR_RECOVERY]);
 }
 
 static inline int default_errgsr_mapping(int errgsr_bit)

-- 
2.34.1


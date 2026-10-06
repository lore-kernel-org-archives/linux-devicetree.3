Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FCB29AB1A
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 00:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791247202; cv=none; b=eJ+ji4FMmG7joLZ6RBeVNQWGz4P98HMLyYGbrKvqCYmMYM+ZOnvtDo8w2BUgp1zIJ4LI0czOx71QIj2+nwU3ZT3xgH5TeKaf06aZvOlTTRt5o6de0DBFlxcwN1lJtf/+kV7Jrk4WyW5Xt4SmYN3SYiLsmH9cLvRNApcL1bTBql4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791247202; c=relaxed/simple;
	bh=OE/yRcGXCtHATVpI7pgA3DOFU3yEnek96YChndvXjkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mp8UPwSxajKvjQ7KvTDmn8HmBaMR9BPs/RPeH/i9Ev/xQ+bfvK6ThVFaCN7qZktA5IN+AoRRDVZTUXp4sDvqhcsZrhHq83t+yrgEED1ZmTAZRA9wVlhUYMcu+6wFdwGJ15MfUfz077YGQrVCqFpIHjrwVm98WyP4RqdqreXASag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AfmGA7zr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bekp3GQZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AfmGA7zr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bekp3GQZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KMbR52796797
	for <devicetree@vger.kernel.org>; Tue, 6 Oct 2026 00:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t/G+BdCHb9AmTwF4f0cc3fJ+PH9Z9jLI2u90PJPqZOY=; b=AfmGA7zrnn8I/Yil
	CyOjwhoPMdwCF/d+YIl1Iu5NAMriWtFW7AH4nEXpXtO+fjwHFt1BV8hkAwN2IC98
	lEMU0GR+l13NIT7CdWh6w17IBgsGmGVsGSdKGoTCtvqqeLQmPlMj2zdJ7ljawicd
	HI+uOubgHr+d9vu4+nvIXwnOhSyqi7wF4IfLUArnIv/npkDv2GA/0lLvzN/vFifQ
	PL2zCrctTfKvvI15VJjs/UvXy6j9WUFNOTYLVLeHtFG+jjNs7NjFfF+gis1m6cJ/
	lpoOdMpzJ7racXf/HSvhlLSuCdfexgsgDc4aqlFpV9iDhIa/QIJnQI0qarSedEe/
	LR3qCw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr098bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 00:39:58 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34bbf2e3c5cso779527eec.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 17:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791247197; x=1791851997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/G+BdCHb9AmTwF4f0cc3fJ+PH9Z9jLI2u90PJPqZOY=;
        b=Bekp3GQZGicc1VsnlVoJQ4V1L6gYmr3AQKVm3+2b2Tj2kgwveBKI6yyLdld4kRU+A2
         +F6N8iSmJmtSzXnNg3B3iyDfNkRZed35Fxfb9ZEqt1t9KjUzmpVRBpsC6WJFKz6W6O7V
         QVqA0j/oGOrOCX3fn/2oG/68NGrPsUYru2rgGXiWWQ1Q8GNXCAyHJi2N4FUOzzBsSFUj
         CcsubaU8vkRn6HEcudzU58h61Ft3Fhh7W2D9p0r103H+G50P9+tKNxaxswjM7HJFVKOf
         unv3H+5bM6usOAaWbc0V2gsRq9nCxE0Cg5KKvbmCqoVvNKOkhVzyRq9kLXNnOISWTTOl
         8ojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791247197; x=1791851997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t/G+BdCHb9AmTwF4f0cc3fJ+PH9Z9jLI2u90PJPqZOY=;
        b=O4IJ3D6qk6NXAnk6iwciB4wW+N1Ozr0GM4oE4vj3o4ijAEbkrxjzIZi8fEMrq21Xa4
         UTDr/CejSwjGqcqudom1hc54IQHEUR2TDFx6Y7wqqhDS9keGE+vkj47JIORzbUFHntGk
         VmLhxT4vWNmgnkFLNXT1jo8WcHCgB0vMQHUrrUpjehbeM6dDw8+5aiwxXP8i3rOLnTDJ
         rcZckl/wUoS1GZCopUQN/cYQe+hGOpuA9nebbiWaLh3zA5/vkRPtCEjYK5bmxYJIf0DB
         xspymW8sfrqVfcB+GalMNJau11k8EO96RThVIP0QFUoYDwfHPhtq4PtolYFyIcqZULYv
         wjUg==
X-Forwarded-Encrypted: i=1; AKwUvBwUYn6nY6ZYH7Mxd9DWLzqZfFgYyUh/Y8wM9NzUhvS/9PuK8TAMXhaNKlZnGBJk5Slnp3/oPlFNaB+4@vger.kernel.org
X-Gm-Message-State: AFq9FYK0VxEJa4Y5gewGwEa9/S1/dNfWiYSBIW2KynP9vbQHi5DuqwiP
	yp1j4wnAJIgvpPaIRweEl3Myml6ElBpWe53NmB6t7s8k0nJ4VWTb5rucZrxO7igcNk/MefO61PC
	DPTpfh1CtPWQ3qsIAeB/V45vLBY9ZjP+hzJr2NH96ghHPqJAdKI3E5T2BjNhMOsY=
X-Gm-Gg: AYBFou1CIZStng3SEzBZlHnd2u7EnV9MJHwaSIyha1Hh5RlwoMWG1jz87hQ8XfPTHFt
	9YL4Xs5C9eVcYyLkqTZb8Lti9tanXE22dvW1RI/2S5qkZRp3pcKZTqD3PqYx5MbaLu0uVscn5qC
	369MXHDL6tzz+z3XsQyHjQPlkwhMisqyXToylU6ReIWXCte+xx6rv14VyHacKPCDOiXm8/yBJgq
	HYi2/lVa+OQnCror+nbQ3fUqlQb3Q5zdrdjTNV1HWs7qZjP3oHszQDgmUkNe275zBrG1PMUMOK5
	WgMdacCxi/eJKn0bXdMRBBoQuI/hMQ5M441HDnCVIcOWe8sU11iTtKVyJAHsVUtPDf8OcYfLDkY
	QaZ816K2oQgYx9zT0azE+m/rQJ5M1L2N5bc0ClmGheTK27l2fRzvOjItIng==
X-Received: by 2002:a05:7301:1890:b0:351:2b62:924f with SMTP id 5a478bee46e88-3512b62997cmr6537281eec.30.1791247197095;
        Mon, 05 Oct 2026 17:39:57 -0700 (PDT)
X-Received: by 2002:a05:7301:1890:b0:351:2b62:924f with SMTP id 5a478bee46e88-3512b62997cmr6537250eec.30.1791247196491;
        Mon, 05 Oct 2026 17:39:56 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146ac078fsm2108874eec.22.2026.10.05.17.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 17:39:56 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:39:47 -0700
Subject: [PATCH RFC v2 3/8] tee: optee: add RPMI shared-memory and
 parameter support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-rpmi-tee-service-grp-dev-v2-3-72f222e23ec1@oss.qualcomm.com>
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfX8bmsNE9LcDd3
 kfpVTrOcs1wV3fCWbkOizxTTdaZJjJzdyk4K/s+O7sTQVLNEyQRsOp4DAXsrBoBTsLwvyVEpm61
 gbAdV7AXEFXMOx39x/xP1nGFrUQ1BPCwuzbIoUN39ykvSRRAU/zkRA2qobnTOVuoG4L26OCIdiQ
 s3kLHqS5OjDhx2smZqCFKzZesBTgBXPwmogqFCi8Iyz0Jx4bxdQphDz3gVouT7/8yUEcy7IEqy5
 7IXrMBamVfTZo+QNGu358TuhtLP50hZPXQ/WDRbFo4W0DcpsU9N0+uLgscZ6PxRT2CqxipDY4kA
 gVnb3vsFJOzTeiLHqunOjBk8FiBzQGMXlhA95eI252Ln2al9/F0i+A9MI7A6/pTMzjlt2lR9VOV
 jl60Y3YX7HmIZ526cBTpjXmn2K6qe7BQeYsNqoGz5HhIXrv6pR+Y2BjOGOAK5wYUH3koQJcsfme
 D4nZ6A/tZFkWBmBkiVw==
X-Proofpoint-GUID: DmnqLMH32cuFPV0VKHuJ7nqKTdQhpHIj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfXw2jS8ZDXR6L8
 bddE/T/rzkax831DVvCRbIiDVt15rPSGlHU5Gy72a+9UAr24v4sDpyN/l/e7wpjUXBUPPMVjl+y
 IjiM7+sSXVB9RwxFck5veZXKQqDyFSE=
X-Proofpoint-ORIG-GUID: DmnqLMH32cuFPV0VKHuJ7nqKTdQhpHIj
X-Authority-Analysis: v=2.4 cv=BrQIUoX5 c=1 sm=1 tr=0 ts=6ac4435e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=flfQTkwBAcW7AZ__dyIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060001

OP-TEE commands and RPCs need shared memory that secure world can
identify through RPMI parcels.

Register normal-world pages as read-write parcels shared with the
OP-TEE endpoint. Track each parcel ID and nonce in a hash table and
store the combined identity in tee_shm.sec_world_id. Use a fixed
nonzero nonce to distinguish registered memory from NULL references.

Add conversions between TEE parameters and parcel memory references.

On client memory unregistration, ask OP-TEE to release its mapping
before reclaiming the parcel. Supplicant memory has already been
released by OP-TEE through its SHM_FREE RPC and only needs reclaiming.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/Makefile        |   1 +
 drivers/tee/optee/optee_private.h |  27 +++
 drivers/tee/optee/rpmi_abi.c      | 417 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 445 insertions(+)

diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
index 183cdde1ac04..8576cc73a922 100644
--- a/drivers/tee/optee/Makefile
+++ b/drivers/tee/optee/Makefile
@@ -9,6 +9,7 @@ optee-objs += supp.o
 optee-objs += device.o
 optee-$(CONFIG_HAVE_ARM_SMCCC) += smc_abi.o
 optee-$(CONFIG_ARM_FFA_TRANSPORT) += ffa_abi.o
+optee-$(CONFIG_RISCV_RPMI_TEE_TRANSPORT) += rpmi_abi.o
 
 # for tracing framework to find optee_trace.h
 CFLAGS_smc_abi.o := -I$(src)
diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index 02d6f79df407..2422caf3c883 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -180,6 +180,28 @@ struct optee_ffa {
 };
 #endif
 
+#if IS_REACHABLE(CONFIG_RISCV_RPMI_TEE_TRANSPORT)
+struct rpmi_tee_device;
+
+/**
+ * struct optee_rpmi - RPMI shared-memory identity state
+ * @rdev: owning RPMI service device
+ * @shm_rht_lock: protects parcel lookup, insertion, removal and publication
+ * @shm_rht: lookup by the host-endian parcel ID and nonce pair
+ *
+ * Callers keep their tee_shm alive while using its registration. Lookup
+ * returns a raw pointer; the mutex does not protect its lifetime after
+ * unlocking. Never hold @shm_rht_lock across a transport operation, RPC or
+ * thread-availability wait.
+ */
+struct optee_rpmi {
+	struct rpmi_tee_device *rdev;
+	/* Protects parcel lookup, insertion, removal and publication. */
+	struct mutex shm_rht_lock;
+	struct rhashtable shm_rht;
+};
+#endif
+
 struct optee;
 
 /**
@@ -240,6 +262,7 @@ struct optee_ops {
  * @ctx:			driver internal TEE context
  * @smc:			specific to SMC ABI
  * @ffa:			specific to FF-A ABI
+ * @rpmi:			specific to RPMI ABI
  * @shm_arg_cache:		shared memory cache argument
  * @call_queue:			queue of threads waiting to call @invoke_fn
  * @notif:			notification synchronization struct
@@ -271,6 +294,9 @@ struct optee {
 #endif
 #if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
 		struct optee_ffa ffa;
+#endif
+#if IS_REACHABLE(CONFIG_RISCV_RPMI_TEE_TRANSPORT)
+		struct optee_rpmi rpmi;
 #endif
 	};
 	struct optee_shm_arg_cache shm_arg_cache;
@@ -464,4 +490,5 @@ static inline void optee_ffa_abi_unregister(void)
 }
 #endif
 
+
 #endif /*OPTEE_PRIVATE_H*/
diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
new file mode 100644
index 000000000000..e7fc853cfb15
--- /dev/null
+++ b/drivers/tee/optee/rpmi_abi.c
@@ -0,0 +1,417 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/cleanup.h>
+#include <linux/mailbox/riscv-rpmi-message.h>
+#include <linux/overflow.h>
+#include <linux/rpmi_tee.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
+#include "optee_private.h"
+#include "optee_rpmi.h"
+
+/* Nonzero nonce keeps parcel ID zero distinct from a null reference. */
+#define OPTEE_RPMI_SHM_NONCE	1
+
+struct optee_rpmi_parcel_key {
+	u32 parcel_id;
+	u32 nonce;
+};
+
+struct optee_rpmi_shm_rht_entry {
+	struct rhash_head node;
+	struct optee_rpmi_parcel_key key;
+	struct tee_shm *shm;
+};
+
+static const struct rhashtable_params optee_rpmi_shm_rht_params = {
+	.head_offset = offsetof(struct optee_rpmi_shm_rht_entry, node),
+	.key_offset = offsetof(struct optee_rpmi_shm_rht_entry, key),
+	.key_len = sizeof(struct optee_rpmi_parcel_key),
+	.automatic_shrinking = true,
+};
+
+/* Keep transport errors separate from the control status in a response. */
+static int optee_rpmi_call_with_status(struct optee *optee,
+				       const void *req, size_t req_len,
+				       void *resp, size_t resp_size,
+				       s32 *status)
+{
+	struct rpmi_tee_device *rdev = optee->rpmi.rdev;
+	size_t received = resp_size;
+	int ret;
+
+	ret = rdev->ops->msg_ops->call(rdev, req, req_len, resp, &received);
+	if (ret)
+		return ret;
+
+	if (received != resp_size)
+		return -EPROTO;
+
+	*status = get_unaligned_le32(resp);
+
+	return 0;
+}
+
+/**
+ * optee_rpmi_call - Send a control request and decode its RPMI status
+ * @optee: OP-TEE instance.
+ * @req: Control request, including the operation number.
+ * @req_len: Request size in bytes.
+ * @resp: Response buffer, beginning with a little-endian RPMI status.
+ * @resp_size: Exact expected response size, including the status field.
+ *
+ * Return: 0 on success, a transport error, -EPROTO for an unexpected response
+ * size, or the control status converted to a Linux error code.
+ */
+static int optee_rpmi_call(struct optee *optee, const void *req, size_t req_len,
+			   void *resp, size_t resp_size)
+{
+	s32 status;
+	int ret;
+
+	ret = optee_rpmi_call_with_status(optee, req, req_len, resp, resp_size,
+					  &status);
+	if (ret)
+		return ret;
+
+	return rpmi_to_linux_error(status);
+}
+
+static int optee_rpmi_shm_rht_init(struct optee *optee)
+{
+	int ret;
+
+	mutex_init(&optee->rpmi.shm_rht_lock);
+	ret = rhashtable_init(&optee->rpmi.shm_rht, &optee_rpmi_shm_rht_params);
+	if (ret)
+		mutex_destroy(&optee->rpmi.shm_rht_lock);
+
+	return ret;
+}
+
+static void optee_rpmi_shm_rht_free(void *ptr, void *arg)
+{
+	kfree(ptr);
+}
+
+static void optee_rpmi_shm_rht_uninit(struct optee *optee)
+{
+	rhashtable_free_and_destroy(&optee->rpmi.shm_rht,
+				    optee_rpmi_shm_rht_free, NULL);
+	mutex_destroy(&optee->rpmi.shm_rht_lock);
+}
+
+/* Allocate and publish a parcel-to-SHM mapping. */
+static int optee_rpmi_shm_rht_add(struct optee *optee, struct tee_shm *shm,
+				  u32 parcel_id, u32 nonce)
+{
+	struct optee_rpmi_shm_rht_entry *entry;
+	int ret;
+
+	entry = kzalloc_obj(*entry);
+	if (!entry)
+		return -ENOMEM;
+
+	entry->shm = shm;
+	entry->key.parcel_id = parcel_id;
+	entry->key.nonce = nonce;
+
+	scoped_guard(mutex, &optee->rpmi.shm_rht_lock)
+		ret = rhashtable_lookup_insert_fast(&optee->rpmi.shm_rht,
+						    &entry->node,
+						    optee_rpmi_shm_rht_params);
+	if (ret)
+		kfree(entry);
+
+	return ret;
+}
+
+/* Remove and free a parcel-to-SHM mapping. */
+static int optee_rpmi_shm_rht_rm(struct optee *optee, u32 parcel_id, u32 nonce)
+{
+	struct optee_rpmi_shm_rht_entry *entry;
+	struct optee_rpmi_parcel_key key = {
+		.parcel_id = parcel_id,
+		.nonce = nonce,
+	};
+	int ret = -ENOENT;
+
+	scoped_guard(mutex, &optee->rpmi.shm_rht_lock) {
+		entry = rhashtable_lookup_fast(&optee->rpmi.shm_rht, &key,
+					       optee_rpmi_shm_rht_params);
+		if (entry)
+			ret = rhashtable_remove_fast(&optee->rpmi.shm_rht,
+						     &entry->node,
+						     optee_rpmi_shm_rht_params);
+	}
+
+	if (!ret)
+		kfree(entry);
+
+	return ret;
+}
+
+/* Return a raw pointer; the surrounding call or RPC owns the SHM lifetime. */
+static struct tee_shm *
+optee_rpmi_get_shm_for_parcel(struct optee *optee, u32 parcel_id, u32 nonce)
+{
+	struct optee_rpmi_shm_rht_entry *entry;
+	struct optee_rpmi_parcel_key key = {
+		.parcel_id = parcel_id,
+		.nonce = nonce,
+	};
+
+	guard(mutex)(&optee->rpmi.shm_rht_lock);
+	entry = rhashtable_lookup_fast(&optee->rpmi.shm_rht, &key,
+				       optee_rpmi_shm_rht_params);
+
+	return entry ? entry->shm : NULL;
+}
+
+/* Extract the parcel ID and nonce stored in the SHM identity. */
+static void optee_rpmi_shm_get_identity(const struct tee_shm *shm,
+					u32 *parcel_id, u32 *nonce)
+{
+	*parcel_id = lower_32_bits(shm->sec_world_id);
+	*nonce = upper_32_bits(shm->sec_world_id);
+}
+
+static int optee_rpmi_shm_register(struct tee_context *ctx, struct tee_shm *shm,
+				   struct page **pages, size_t num_pages,
+				   unsigned long start)
+{
+	struct optee *optee = tee_get_drvdata(ctx->teedev);
+	struct rpmi_tee_device *rdev = optee->rpmi.rdev;
+	struct rpmi_tee_mem_receiver receiver = {
+		.endpoint_id = rdev->endpoint_id,
+		.access = RPMI_TEE_MEM_ACCESS_READ | RPMI_TEE_MEM_ACCESS_WRITE,
+	};
+	struct rpmi_tee_mem_args args = {
+		.nonce = OPTEE_RPMI_SHM_NONCE,
+		.receivers = &receiver,
+		.receiver_count = 1,
+		.creator_access = RPMI_TEE_MEM_ACCESS_READ |
+				  RPMI_TEE_MEM_ACCESS_WRITE,
+	};
+	struct sg_table sgt;
+	int ret;
+
+	ret = optee_check_mem_type(start, num_pages);
+	if (ret)
+		return ret;
+
+	ret = sg_alloc_table_from_pages(&sgt, pages, num_pages, 0,
+					num_pages * PAGE_SIZE, GFP_KERNEL);
+	if (ret)
+		return ret;
+
+	args.sg = sgt.sgl;
+	ret = rdev->ops->mem_ops->memory_share(rdev, &args);
+	sg_free_table(&sgt);
+	if (ret)
+		return ret;
+
+	ret = optee_rpmi_shm_rht_add(optee, shm, args.parcel_id, args.nonce);
+	if (ret) {
+		int reclaim_ret;
+
+		reclaim_ret = rdev->ops->mem_ops->memory_reclaim(rdev, args.parcel_id);
+		if (reclaim_ret)
+			dev_err(&rdev->dev, "reclaim parcel %#x failed: %d\n",
+				args.parcel_id, reclaim_ret);
+		return ret;
+	}
+
+	shm->sec_world_id = ((u64)args.nonce << 32) | args.parcel_id;
+
+	return 0;
+}
+
+static int optee_rpmi_shm_unregister(struct tee_context *ctx,
+				     struct tee_shm *shm)
+{
+	struct optee *optee = tee_get_drvdata(ctx->teedev);
+	struct rpmi_tee_device *rdev = optee->rpmi.rdev;
+	struct optee_rpmi_unregister_req req;
+	struct optee_rpmi_status_resp resp;
+	u32 parcel_id, nonce;
+	int ret;
+
+	optee_rpmi_shm_get_identity(shm, &parcel_id, &nonce);
+	optee_rpmi_shm_rht_rm(optee, parcel_id, nonce);
+	shm->sec_world_id = 0;
+
+	req.op = cpu_to_le32(OPTEE_RPMI_UNREGISTER_SHM);
+	req.parcel_id = cpu_to_le32(parcel_id);
+	req.nonce = cpu_to_le32(nonce);
+	ret = optee_rpmi_call(optee, &req, sizeof(req), &resp, sizeof(resp));
+	if (ret)
+		dev_err(&rdev->dev, "unregister parcel %#x failed: %d\n",
+			parcel_id, ret);
+
+	ret = rdev->ops->mem_ops->memory_reclaim(rdev, parcel_id);
+	if (ret)
+		dev_err(&rdev->dev, "reclaim parcel %#x failed: %d\n",
+			parcel_id, ret);
+
+	return ret;
+}
+
+static int optee_rpmi_shm_unregister_supp(struct tee_context *ctx,
+					  struct tee_shm *shm)
+{
+	struct optee *optee = tee_get_drvdata(ctx->teedev);
+	struct rpmi_tee_device *rdev = optee->rpmi.rdev;
+	u32 parcel_id, nonce;
+	int ret;
+
+	optee_rpmi_shm_get_identity(shm, &parcel_id, &nonce);
+	optee_rpmi_shm_rht_rm(optee, parcel_id, nonce);
+	shm->sec_world_id = 0;
+	/* OP-TEE has already retired the parcel through SHM_FREE RPC. */
+	ret = rdev->ops->mem_ops->memory_reclaim(rdev, parcel_id);
+	if (ret)
+		dev_err(&rdev->dev, "reclaim parcel %#x failed: %d\n",
+			parcel_id, ret);
+
+	return ret;
+}
+
+/* Convert a memory reference to an OP-TEE RPMI parcel reference. */
+static int to_msg_param_rpmi_mem(struct optee_msg_param *mp,
+				 const struct tee_param *p)
+{
+	struct tee_shm *shm = p->u.memref.shm;
+
+	mp->attr = OPTEE_MSG_ATTR_TYPE_PMEM_INPUT + p->attr -
+		   TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
+	memset(&mp->u, 0, sizeof(mp->u));
+	/* For !shm, return parcel_id = 0 and nonce = 0 to represent NULL. */
+	if (shm) {
+		if (check_add_overflow((u64)shm->offset,
+				       (u64)p->u.memref.shm_offs,
+				       &mp->u.pmem.offs))
+			return -EINVAL;
+
+		optee_rpmi_shm_get_identity(shm, &mp->u.pmem.parcel_id,
+					    &mp->u.pmem.nonce);
+	}
+
+	mp->u.pmem.size = p->u.memref.size;
+
+	return 0;
+}
+
+static int optee_rpmi_to_msg_param(struct optee *optee,
+				   struct optee_msg_param *msg_params,
+				   size_t num_params,
+				   const struct tee_param *params)
+{
+	size_t n;
+
+	for (n = 0; n < num_params; n++) {
+		const struct tee_param *p = params + n;
+		struct optee_msg_param *mp = msg_params + n;
+		switch (p->attr) {
+		case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
+			mp->attr = OPTEE_MSG_ATTR_TYPE_NONE;
+			memset(&mp->u, 0, sizeof(mp->u));
+			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
+			optee_to_msg_param_value(mp, p);
+			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
+			if (to_msg_param_rpmi_mem(mp, p))
+				return -EINVAL;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+/* Convert an RPMI parcel reference to a memref; callers own SHM lifetime. */
+static int from_msg_param_rpmi_mem(struct optee *optee, struct tee_param *p,
+				   u32 attr, const struct optee_msg_param *mp)
+{
+	struct tee_shm *shm;
+	u64 offset;
+
+	p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT + attr -
+		  OPTEE_MSG_ATTR_TYPE_PMEM_INPUT;
+
+	if (mp->u.pmem.size > SIZE_MAX)
+		return -EOVERFLOW;
+	p->u.memref.size = mp->u.pmem.size;
+
+	if (!mp->u.pmem.nonce) {
+		/* Return NULL shm. */
+		if (mp->u.pmem.offs || mp->u.pmem.parcel_id)
+			return -EINVAL;
+		p->u.memref.shm = NULL;
+		p->u.memref.shm_offs = 0;
+		return 0;
+	}
+
+	shm = optee_rpmi_get_shm_for_parcel(optee, mp->u.pmem.parcel_id,
+					    mp->u.pmem.nonce);
+	if (!shm || mp->u.pmem.offs < shm->offset)
+		return -EINVAL;
+
+	offset = mp->u.pmem.offs - shm->offset;
+	if (offset > SIZE_MAX)
+		return -EOVERFLOW;
+
+	p->u.memref.shm = shm;
+	p->u.memref.shm_offs = offset;
+
+	return 0;
+}
+
+static int optee_rpmi_from_msg_param(struct optee *optee,
+				     struct tee_param *params,
+				     size_t num_params,
+				     const struct optee_msg_param *msg_params)
+{
+	size_t n;
+
+	for (n = 0; n < num_params; n++) {
+		const struct optee_msg_param *mp = msg_params + n;
+		struct tee_param *p = params + n;
+		u32 attr = mp->attr & OPTEE_MSG_ATTR_TYPE_MASK;
+		int ret;
+
+		switch (attr) {
+		case OPTEE_MSG_ATTR_TYPE_NONE:
+			p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
+			memset(&p->u, 0, sizeof(p->u));
+			break;
+		case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
+		case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
+		case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
+			optee_from_msg_param_value(p, attr, mp);
+			break;
+		case OPTEE_MSG_ATTR_TYPE_PMEM_INPUT:
+		case OPTEE_MSG_ATTR_TYPE_PMEM_OUTPUT:
+		case OPTEE_MSG_ATTR_TYPE_PMEM_INOUT:
+			ret = from_msg_param_rpmi_mem(optee, p, attr, mp);
+			if (ret)
+				return ret;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+	return 0;
+}

-- 
2.34.1


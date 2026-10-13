Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820EE494804
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870123; cv=none; b=UqA+74VyJg7Q4VmGyg0gM5KMXrDESt0r0qllMVvyDdIH3D+T5D9hSb2mZFpCJfZ/1GYyPNoThUxCI58XeoSPSj0IgN621RAJdB7+ZvEUZfqoL3xO0DkT4dp1bNbZlsMcf1L9IwRrLWwJr4BuzUEg6D8YmPpuI4Wx8izqTYy29wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870123; c=relaxed/simple;
	bh=UZD4R6R/FQWDGv8pkyECBSdQs7WwyexiNCcXxk6sEBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MNok9VFXE/5cpLRAyzGzMTJW01zhKO0Ratw9gNjRYVis2lk7Ot4abPfM4Eh1t+TtfYjAPOt5e6Vn07p2GKWd0k2/P77sq5QZoQTn7iTnzjcy7GsDW59gH3rOGhSv6mFOyjjv9Qhh/oFO9NYHqFbfLEgS0K+KHLNnIshILgQiWac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BjGhVx1F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/rMEhgP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BjGhVx1F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/rMEhgP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D20lK5988760
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rd65ljd9yXesQac/jFW5/g1sKZN3hISajAVdGuSexr0=; b=BjGhVx1FntWvYtaD
	TyU2KTvHMMl22qHKhKBFeh3bJBxlmq8Xh3CyzU1IOuMa4goYuiMSSO1SDdtxw5sW
	Mqnd74KyCy4JtWXqA7p6NZ/IFMn9AiDKNAc4M+sf+dzde6BfQwk4RO2NzWz9+gZn
	jVhTD+jvBRNqAo/eMo5FWxOdziAUMoISYxj2oj5S7FmAF1HC1qtPH7Zru44OIHW5
	vesN55n9wEYRgsAnXwNMBYTRgPhGB7heOsnYAfGBKB9SEVheemStYtBYY9Pcq1d1
	9PIMQdxs2q1DR12LgRVg2h3falQ4K52r2sBVWVZfJAuOf488WrZPw7O6SDi0cSMW
	SIu+Fg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hc98y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:42:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a8af172664so2042345a91.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 22:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791870120; x=1792474920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rd65ljd9yXesQac/jFW5/g1sKZN3hISajAVdGuSexr0=;
        b=P/rMEhgPeuGZEhKRXucUk03c41J0kAPeyUi5zoOYncGYrvdzLvXYIZTrSOY1yNlGu8
         NGXXr5iH4tkvz7lq3xFLzgDxhLNZs/k85XwM74eaq+Z3EbL2VQnh4JzOheqwfAI+lCUE
         g1bim+ix4u+5cetK3Hsdh+RAEhjgYiSOARDioHosWxJtJk38PtaC9fIM4Gh+Q7dmJvp3
         B19TrkcYkm1n09KJcLBoPRsPqqD64gASoLeUi6UJnkVLOxewV3JneQpL3kbzu0ywii1b
         c+jZ8ucwMoGoxclyzTNbA7B6FRp2kj+eqDgNO6I3VM2GR8DIjAhrgYRq1rVqEsN48/zn
         GYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791870120; x=1792474920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rd65ljd9yXesQac/jFW5/g1sKZN3hISajAVdGuSexr0=;
        b=ZW/C8FMiVaegeRlrK0ijt6GkXWdkwGWWhPJiIz+uPeTNtkGfwoa8zpR1xckZgiorLE
         1NjeHLZNtOKMUVv0HOjw5RsACW3x27lV3XFhkNm3w02Gk0zV6E4vEvXlAnHUVMKBjEsv
         U1SHrcXLUsFcwq43sG7y5Il9CekuPU7/4jrVc1jSI+huK+DI5JDIR3nihI6aZS9J/04R
         haDAq1gVco709jK8daNjnmF9P/Xqo/foNMFxrq3DmYP9b43qWfNtLju6SoM+wvuY5Wfj
         VNLVh66dhWmkL+fkYSXiA/hfNnjZDO3XVh3X4NiFwkKyGRwLUMWUe78xi+lBgsldesGe
         Wbaw==
X-Forwarded-Encrypted: i=1; AKwUvBxYdnBrF4MIMaeIGBi74MyKWX0AF3S7T50Q/heGiyj5yNBhFJQCGaEbsUtNAE4V9qjX9Y6olAE2kBxf@vger.kernel.org
X-Gm-Message-State: AFq9FYI9RBLdndQmMa8PAF1AZ34ALZVAhxGqsaAaW5J78Luozn8PTo0k
	JRRO+PGy4UsUWmI5+xWfmeDCotFYQO2sLjQ/evZ7I7hpwG7G5y5fn6LLHOshbw/7eYBuBQyqcKU
	XRxXMC/z/4+A2E+vBv38I5aAOrJ6R1+Fd8uuupKF7t9Sxmm6bUSgE8NviqWyfhac=
X-Gm-Gg: AYBFou3dKzrysJB1txG0XOop456d9C6EYS0gc5WlTl83AuPgYaWI5k4Ql8schZ4iCub
	1CwS/92bVORAgtzA1tJpYYnfP3GJSJXUj4D4+AQFRT4H1z/Km1BuKsNVWHJvpnfeZo4Z2gKDvKG
	v6kNK5oZrLDBbq/+S0hcqw6gW1fYDt5pOnHYroqbADW+Nn7sGAIJS8gU1VwsIbw70mp0QGbaIQ6
	8PFQEsJNbVXkS38dQxSGqJrKl9mxZoXQ6EHp1K2Gob0Itm2nHyiv4jVdQleTP8rYEiLwuiJ6Sc9
	fMZA13Fo7SvhbVyCwPR0l182btiTOMi1Wijh6ASARVkkrWiOLbahIqFw9I/3XFM9Alt1Fca7TNV
	yWEBYKkwJfTwphwG/Tl93Ug9y+1mHcHI7hUyG0H5JeLtyAFrBaNDprsgpAA==
X-Received: by 2002:a17:90a:109:b0:3a8:2046:7e5f with SMTP id 98e67ed59e1d1-3ab3a747e69mr6959389a91.12.1791870119618;
        Mon, 12 Oct 2026 22:41:59 -0700 (PDT)
X-Received: by 2002:a17:90a:109:b0:3a8:2046:7e5f with SMTP id 98e67ed59e1d1-3ab3a747e69mr6959373a91.12.1791870119113;
        Mon, 12 Oct 2026 22:41:59 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm22926361a91.11.2026.10.12.22.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:41:58 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 22:41:33 -0700
Subject: [PATCH RFC v3 6/9] tee: optee: add RPMI RPC handling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-rpmi-tee-service-grp-dev-v3-6-975b574667e2@oss.qualcomm.com>
References: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
In-Reply-To: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX1nd0FIcJYrnu
 wsknTGBRsby9boQf2pDl2BGwN1aqqqJO8h5rBXcViVWMF2jnrTcb0OmtaNd8P86BUPruvac1Afu
 BRFcFePr+cUdjzdSQ2ZzIKkQao28wmF3VUtG3is4v8sItnXoK3uBlL0aeJYYkjdUvZMKG2SWXbR
 /i+14UqwiBp+T2DVy0/qI4hya0IEPGML3i+GxNbaqp/vQLhDAeHh6j17UD1kyfLHnkO6rwQGLj2
 tgqNuMFiMnZYm5fFiYDEYIs4BTSv6ZBEJaELQbP/Nt0+cVbEvL8+N2g8XwpIyGnoVXzYuQQ2inN
 WqDKh+m+P1DFwSQzyG8wptVSdHqj5XmWKrOTugQkDxP4vZJjR48hula1WXE2IJsiZUOUeWu0pMi
 Smu7ntWaUqdEHiwXTuINi/a9YhXPgn9qGCvf+r8vipyfpemxiGfrVz1tu39G4KF1qFu4WlyU0N3
 PokE3tqzC1/Pop/iXqw==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6acdc4a8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6VhrBSHLQm3oGo9yYzUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Qemu1WK552mumwJ0uPN6rBLF4jjHSnr4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX/tSEcB5kFW17
 zaVJO2zO6bkwHH3OOkENxjrs8SZ71H7cRGPbD0AifZ+IUNuudDz81GapoL7u5edO7tBXbVLDZan
 +ac/RDmEkbfyEwRm31aqIhQISMU9AIc=
X-Proofpoint-GUID: Qemu1WK552mumwJ0uPN6rBLF4jjHSnr4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130022

OP-TEE can suspend a yielding call to request services from normal
world through RPC.

Add handlers for shared-memory allocation and free requests. Use the
existing kernel and supplicant allocation helpers, return RPMI parcel
references for allocated memory, and resolve those references when
freeing it.

Route other commands through the common OP-TEE RPC dispatcher. Store
RPC results in the shared arguments for OP-TEE to consume when the
yielding call resumes.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/rpmi_abi.c | 104 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
index bbb219ddab38..8b90c3653e80 100644
--- a/drivers/tee/optee/rpmi_abi.c
+++ b/drivers/tee/optee/rpmi_abi.c
@@ -12,6 +12,7 @@
 #include <linux/unaligned.h>
 #include "optee_private.h"
 #include "optee_rpmi.h"
+#include "optee_rpc_cmd.h"
 
 /* Keep transport errors separate from the control status in a response. */
 static int optee_rpmi_call_with_status(struct optee *optee,
@@ -353,3 +354,106 @@ static int optee_rpmi_from_msg_param(struct optee *optee,
 
 	return 0;
 }
+
+static void optee_rpmi_handle_rpc_shm_alloc(struct tee_context *ctx,
+					    struct optee *optee,
+					    struct optee_msg_arg *arg)
+{
+	struct tee_shm *shm;
+	u64 type, size;
+
+	if (arg->num_params != 1 ||
+	    arg->params[0].attr != OPTEE_MSG_ATTR_TYPE_VALUE_INPUT)
+		goto err_bad_param;
+
+	type = arg->params[0].u.value.a;
+	size = arg->params[0].u.value.b;
+	if (!size || size > SIZE_MAX - PAGE_SIZE + 1)
+		goto err_bad_param;
+
+	switch (type) {
+	case OPTEE_RPC_SHM_TYPE_APPL:
+		shm = optee_rpc_cmd_alloc_suppl(ctx, size);
+		break;
+	case OPTEE_RPC_SHM_TYPE_KERNEL:
+		shm = tee_shm_alloc_priv_buf(optee->ctx, size);
+		break;
+	default:
+		goto err_bad_param;
+	}
+
+	if (IS_ERR(shm)) {
+		arg->ret = TEEC_ERROR_OUT_OF_MEMORY;
+		return;
+	}
+
+	arg->params[0] = (struct optee_msg_param) {
+		.attr = OPTEE_MSG_ATTR_TYPE_PMEM_OUTPUT,
+		.u.pmem.size = tee_shm_get_size(shm),
+		.u.pmem.global_id = shm->sec_world_id,
+		.u.pmem.offs = shm->offset,
+	};
+
+	arg->ret = TEEC_SUCCESS;
+	return;
+
+err_bad_param:
+	arg->ret = TEEC_ERROR_BAD_PARAMETERS;
+}
+
+static void optee_rpmi_handle_rpc_shm_free(struct tee_context *ctx,
+					   struct optee *optee,
+					   struct optee_msg_arg *arg)
+{
+	struct tee_shm *shm;
+	u64 type, global_id;
+
+	if (arg->num_params != 1 ||
+	    arg->params[0].attr != OPTEE_MSG_ATTR_TYPE_VALUE_INPUT)
+		goto err_bad_param;
+
+	type = arg->params[0].u.value.a;
+	global_id = arg->params[0].u.value.b;
+	/* SHM_FREE requires a non-NULL identity. */
+	if (!optee_rpmi_nonce(global_id) || arg->params[0].u.value.c)
+		goto err_bad_param;
+
+	shm = optee_shm_handle_map_lookup(&optee->rpmi.shm_map, global_id);
+	if (!shm)
+		goto err_bad_param;
+
+	switch (type) {
+	case OPTEE_RPC_SHM_TYPE_APPL:
+		optee_rpc_cmd_free_suppl(ctx, shm);
+		break;
+	case OPTEE_RPC_SHM_TYPE_KERNEL:
+		tee_shm_free(shm);
+		break;
+	default:
+		goto err_bad_param;
+	}
+
+	arg->ret = TEEC_SUCCESS;
+	return;
+
+err_bad_param:
+	arg->ret = TEEC_ERROR_BAD_PARAMETERS;
+}
+
+/* OP-TEE leaves the shared arguments unchanged while Linux handles the RPC. */
+static void optee_rpmi_handle_rpc_cmd(struct tee_context *ctx,
+				      struct optee *optee,
+				      struct optee_msg_arg *arg)
+{
+	arg->ret_origin = TEEC_ORIGIN_COMMS;
+	switch (arg->cmd) {
+	case OPTEE_RPC_CMD_SHM_ALLOC:
+		optee_rpmi_handle_rpc_shm_alloc(ctx, optee, arg);
+		break;
+	case OPTEE_RPC_CMD_SHM_FREE:
+		optee_rpmi_handle_rpc_shm_free(ctx, optee, arg);
+		break;
+	default:
+		optee_rpc_cmd(ctx, optee, arg);
+	}
+}

-- 
2.34.1


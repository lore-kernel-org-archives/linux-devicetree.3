Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9F8481B1
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 00:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791247205; cv=none; b=Pg82Z6yxiMGIplVHdeDV18vU3wFm1408xX1+Rf2InmertYj6yTMogYTaLB8SvgGxEhHCL9PLuymR9wCxg5zHxGcAZZABxde9ff5cvQIoeklBZLPUkjtghulohYrEO+ak5kSXbc2pNf7aBDB2Dv+igAS0dqezBERYyrhz5AV03No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791247205; c=relaxed/simple;
	bh=s08gzyzL/xn+WRXKKYQymO9Xn/zYKdVDtDBoHjxSrlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FRITlUeN1SYO+fmfLqi0sQAPSiai9e97vLnNdDBunsb1Ux2JI10RTUZxNAs6ZfKDGoMWh0vgKbt0Ama/JhPU4zGomHASO84rrZb1SKc9YvgkL0gzChc3F+qonV/Zcd9Ut5jH2zPg7KTK8sf5eD+rJGO3ZG8e66PiXrhKknct26M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3P+c/Kd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g2MrIGjJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3P+c/Kd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g2MrIGjJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KNEYU3432595
	for <devicetree@vger.kernel.org>; Tue, 6 Oct 2026 00:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wua//ehqYe/k1gM6cXEAgLdAS/bL/RuV3uXFJa/HKLI=; b=h3P+c/Kdq7wfiKNC
	W6FNGDWCulEdDxpm627gK4TtbkaY5u8Tmw1S8yzXKkC04OPMoK3GHoB5492mfomA
	LLLeGOuEqJPn2hd1kWWZftiU0E6H7JuWuci1kNV7sNfZxIiPKzxrgvbOnVYSaWQ+
	uQBjhesYudXfxcIQRDrMslxxmwlOhSbEWFPv5IMLupjMYIQeZ9CnbR5eS+LXLYPq
	b5FRV0WRH6Y/n1c7HOtYQnId9MWg66yfxXvSlQAo9u0CQGTGmtpAgAusVoRdVgKk
	j3nyrloTAM7kx+hzqYcz5wNzMepbUxlOYb/DSs7ivlBhES+Mrmrxui8rhUh8g/l5
	k6gc+Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvty1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 00:40:00 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so5850295eec.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 17:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791247199; x=1791851999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wua//ehqYe/k1gM6cXEAgLdAS/bL/RuV3uXFJa/HKLI=;
        b=g2MrIGjJqHYLR6zD8pQJQ/5ujhCcwsMYSIPmHVHn3W1ROq7UqhN5O1394OiMLpJer8
         PyGIrIN8PfNycWyBWMERvcB0n7ySuLi/qOqU+Wn9Hil4vW//kTPzTprvc/JxSsQJZ4dv
         h5TLg7NiVtf1r60WYfo9AS6CU4pZVcyenoBx19TV2UR/IjZVqA3Ub3RPIWvJgj0dqQGI
         qqfw7SRUBWtSBYfDPEU+Xg90AFYll1zQ7EmxvFsL6zzNb/HMNZowp0tMpA5heDSClDMz
         6C1PaOdg+1SF3V7yfySQ2AO4ynbuDWBO6mBLhxybpwrQn+FN0x+pGWkjiJ539Q029WTh
         lQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791247199; x=1791851999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wua//ehqYe/k1gM6cXEAgLdAS/bL/RuV3uXFJa/HKLI=;
        b=WAteH+uvev65ksPLolkkHSlExMKpdzrLwrybtwepITRFD1wZT/KsvTV05/yR1FXqkf
         cifbEDVI6uhWgjI9vZ9vUEc+efX27pfsLM2jIYxMCEPNujy4YjqCCy5/wIN24s7+d1Q1
         Qib3jgxLX5i/i0o+xczw8dEQ2wnnR78+IboEIfGa9/joEmjEavDnKRoq9QQMFx9TLOYS
         MPiKLGudZ3Tg9lX1b2ghMzcElNeqHinLfCt06JXLlS+N1LNlJKHTuFzPO0O3bhb2H/4s
         CNOr6aXJqz8S1TDKgUc+sKFjESrXZi1GurjtDRTd135Yc1JxWpYHc1k1dVB7h7jzlhXF
         JAcg==
X-Forwarded-Encrypted: i=1; AKwUvByJl1Ag+hGEY/VuoUQdNB7fp0W5Elu2yQJuJb0RwsJYIRXdFYNmTkwiyGxv1BS0t5677OLjdI0p1k8y@vger.kernel.org
X-Gm-Message-State: AFq9FYJPfbfcPIiUlhVaOtwQk/sU0SgOcchMqRzIVXZNZvaHhZX+9lrl
	IMVsfYdq4GFaed2VDmT+dzrcNoS8U+s8b5o6VScxUvm9swwg4TQuHov7mG+UU+387qh1WW+O3O0
	kBNAM3fi336TeLHTstk81cBvnM9Bv8/yhFaVBNMsS6Xm7QVMhVwfr7W6voJ3ItJU=
X-Gm-Gg: AYBFou0fR4aBJh1VIuj4c7n9+wfAPd/lw3DuGlXZa+OwRMS7pXNYOClrcW/awHyyF7e
	0ZBkpY+2zsTZYJ1Xb3hzMPUvhwXoi09QFs3SCrPoLGXt+1LWQJfeAsYDweKTfK48OoFiNDTLrbC
	tMU3oEJgvXmy6lD0BFQ6V6aWAm3qKvE+0Do0f/uVTWPOCOyNhTMnavWsjb2Hap8h/20YrVikuQa
	GjcIUVhfhOQDTfGFoaosusLPHNEqQcYBCjtdF0DFjm7odi3gnA43lloel5DVzGA8faBVVwB4Yti
	wvwAFNaRaIROFpYGdyKnI5z6Vju/j+qfyJ5GH3gKOGCY22QFWHZTFaxkJnkwUVVGOUwNG+WN5zJ
	a+j5a3m7YLt0hvgdNCwbFF6nUnPuDeg34FB5Ysr2jO7VQynaiQwM665f4lQ==
X-Received: by 2002:a05:7301:2324:b0:351:fc0:d080 with SMTP id 5a478bee46e88-3510fc0d605mr11956023eec.12.1791247199171;
        Mon, 05 Oct 2026 17:39:59 -0700 (PDT)
X-Received: by 2002:a05:7301:2324:b0:351:fc0:d080 with SMTP id 5a478bee46e88-3510fc0d605mr11955999eec.12.1791247198578;
        Mon, 05 Oct 2026 17:39:58 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146ac078fsm2108874eec.22.2026.10.05.17.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 17:39:58 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:39:49 -0700
Subject: [PATCH RFC v2 5/8] tee: optee: add RPMI RPC handling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-rpmi-tee-service-grp-dev-v2-5-72f222e23ec1@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac44360 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6VhrBSHLQm3oGo9yYzUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: BPYGRH2Mgx8fB1APtG9aji7wCSKoD5qk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfX0SZKPd9tX3Rh
 p2rpK2rMGMycabMG9Pw6CV0r2PXLaeUmjacW3AJv4SUdiDGTcPjmzVNokrRsq+Tm+7IrN3ywC/T
 uhQguwOkum/XMuqvI3B2dErnJXE0Pp7vmdRnODdBuKhoRoKQ+v+DOwRo2Qzisg2sx6PphoC2MC3
 hierXyQe5YRSJOcR3yz0ROwVL46xp5WHbk1mgPI3MaqHKtkbTBssWfIXdLFeAykzCzgOHPSXbBn
 NkGTs8RZs4TpSPx6zi1FzmRmorQhk6pAq85UfMkfT7mFCpNsD3m4f0vvulCOVUqFmTMvcXZw8QG
 C1wJquNPyvsAmtv/nxlf/XsvzONY9oZ+ySwptBe1olLNTTElZOlNzNObAtP4XfqD/3YrHki+YxQ
 8X2eg6LvyKpk+KPXRkkngnRbr0w0OunOTCbzJbusHeIW2s5IcOnOKdoVeqlV/2iTAbyoVDl6p8T
 a2DKsgdxW+fGcMD/HFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfX5JGVJnz3LFky
 EQcpnNpGOf9SM5uy2rkGz0bhD5D31VFxHOQHujZXIe2MFBckJo93etmkciDPnGhMINnhbCC60fM
 yicfEKATgRrb5zRqZS/jiYKpjUX2TRE=
X-Proofpoint-ORIG-GUID: BPYGRH2Mgx8fB1APtG9aji7wCSKoD5qk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060001

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
 drivers/tee/optee/rpmi_abi.c | 109 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
index c29b7ac4552a..58d82678be98 100644
--- a/drivers/tee/optee/rpmi_abi.c
+++ b/drivers/tee/optee/rpmi_abi.c
@@ -13,6 +13,7 @@
 #include <linux/unaligned.h>
 #include "optee_private.h"
 #include "optee_rpmi.h"
+#include "optee_rpc_cmd.h"
 
 /* Nonzero nonce keeps parcel ID zero distinct from a null reference. */
 #define OPTEE_RPMI_SHM_NONCE	1
@@ -451,3 +452,111 @@ static int optee_rpmi_from_msg_param(struct optee *optee,
 	}
 	return 0;
 }
+
+static void optee_rpmi_handle_rpc_shm_alloc(struct tee_context *ctx,
+					    struct optee *optee,
+					    struct optee_msg_arg *arg)
+{
+	u32 parcel_id, nonce;
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
+	optee_rpmi_shm_get_identity(shm, &parcel_id, &nonce);
+	arg->params[0] = (struct optee_msg_param) {
+		.attr = OPTEE_MSG_ATTR_TYPE_PMEM_OUTPUT,
+		.u.pmem = {
+			.offs = shm->offset,
+			.size = tee_shm_get_size(shm),
+			.parcel_id = parcel_id,
+			.nonce = nonce,
+		},
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
+	u64 type, parcel_id, nonce;
+
+	if (arg->num_params != 1 ||
+	    arg->params[0].attr != OPTEE_MSG_ATTR_TYPE_VALUE_INPUT)
+		goto err_bad_param;
+
+	type = arg->params[0].u.value.a;
+	parcel_id = arg->params[0].u.value.b;
+	nonce = arg->params[0].u.value.c;
+	if (parcel_id > U32_MAX || nonce > U32_MAX)
+		goto err_bad_param;
+
+	shm = optee_rpmi_get_shm_for_parcel(optee, parcel_id, nonce);
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


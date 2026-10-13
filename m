Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ADA48EC95
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870118; cv=none; b=jy5ERevIN2jTbRNHIZLURN827N2Tbedrv0GW3ZZ4/EgzN/nr07nTt546iJ0d6rTFkstwzRUfI3aS6peprupKUE9WXn/+0EoafTkHiXt+5CofT5JQ5uacYbuAp9KBWW8mB0uE5G6/O2u76Sif8fyMOIE5/aNkzfDd5K0WDWB6Q+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870118; c=relaxed/simple;
	bh=eLOAxMM+hZwlNFVyptMKZg8I2MSmLEZ+2LGQRG5OS5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IiwRCmGxHeI4ryQT7ZDwb4ejI9Lh0v2AIhdg61LMS/Omxh8yzmmUJkconas0+Uka+29Gx8UfhIe4/HRu+r+36uyOjoIEljes5edGHM7Ir2TnWca6QhcGmteYK2UPG3REfM0V+hzL2f/0wcFgOP63NvB27sJmSXHnB25gapbeI7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TJ7+nHzN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZKZMi9M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TJ7+nHzN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZKZMi9M"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D20w703907983
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ypuDZSakPalBX7M4x+LFJr9Z+MgpyzNsrKt1TNFFTZ8=; b=TJ7+nHzN42EAS1or
	gzAMXvBNTrwpNYzBkPt/S/D/gXxqPGlSEWDF8zFaCAU/YIZldv6yXSBoscE7w1aP
	u2ZLmR+lZSagyuMaxhEDzHfJyrzsJHQ6GTzVzqlri1qLt9imnmbR7XZ6EQlQnJ9J
	66LTK2C+KbV3HvvcL+2VIDT+nweaIhuY0yIbX5WuamFQ19K6Imr66lCmhQRZUc9V
	ajEy0NhHFfE89puJyCzzn7TohyqJ30n6kA5GD1kyRqJUPhBFuN8GADM+3p7SLSD1
	7VEEWJLofA59tScCVquCvCJAlJADEqJMkEIyqQSpGNXVIXnLD/uYq3wk7J2bjnht
	4t89oQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqsuda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 05:41:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab1e771632so3105486a91.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 22:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791870113; x=1792474913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypuDZSakPalBX7M4x+LFJr9Z+MgpyzNsrKt1TNFFTZ8=;
        b=cZKZMi9MsIRCfATAna2ATVTlNM/NsnTSgFxFb00fNRODAjovfHKUXlHoNv8JvlKEzk
         kLWhzbA5PIAdB3aTw+ife4XWBvE+T1IY0/XbP9M8J4941lkvbIYlkoBMYMTWROgzvo0Q
         lhV07NVh5gTA7GfkzcouihWAUO3SRnAO5NK9173nfSACdpX7c6fEgoR/RjaqtwTrweky
         M+G2jwukhVhlwkKOcNCujcvCFquZvQk1C+vcyZqkqPgrxFNqoJyTfGrVCxHI+t433McW
         3183SULrJjZxq4FBJPhYRaz5uWrzXb7RTTqxtLKKHAsHsAlvhcKosQO8eoeKOLSboOF+
         yLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791870113; x=1792474913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypuDZSakPalBX7M4x+LFJr9Z+MgpyzNsrKt1TNFFTZ8=;
        b=Y4rnhf75V/bdYJ0jqde23WWFoAVSf0rQ+aDfqrGQEs4huu0q0UZ/Jc7mw20AnA5VJj
         qUhhWS42TPkHvwTV4Nfy+EawBu82rDOgDKrsMtr4Ig5cE46zyvLb8csrTDcRroM6MvAq
         NCmEsfdRgLsvxL7N6wEaiy/7g2pxnQ4nGHg1/+fGodPL1xjnDwCiyPPeGCvnOJ44Ivlc
         Uk5zh1H3yk+vxgw04ABZmOy6s2YWzmZVE3jVMjwURF/4+jWNtf07W9EBGm8L5bhyoshR
         9SjeDqnQ3LkPByHfEPr6xv+9sQPvEZcasznN22k5EE6tP4NYDFNQAxyUAeUUzw5WrHsp
         BkDA==
X-Forwarded-Encrypted: i=1; AKwUvBwMEmHJDlNAqeiRdi9ZOsKybezNErbuGAMWbiehEqVnCrRzTyg+C7Hyv5LDIALvQ1URQ1dS2jsUCVwC@vger.kernel.org
X-Gm-Message-State: AFq9FYJNVxXrYn4qxngNMWBBOTvDfCTE3IjPbYlYMMQhfEEp9B/QQgE7
	ppEzorK/TAZSbbZtHOUx6DIZA8jtpe3m5FhOmJxx/nEPz/kct5K86Ct59grhlIxWs3QUOIknNto
	/AmERTOh1Q3RMIKDb2FJcIOHuA+Tkgg6kdUgo3SiRUR4dQiZNP1HvE0GrOhWbYNs=
X-Gm-Gg: AYBFou0/OMpYwXty/UbkHpIm7U+HA2BWeBAFEXc56FGI4cmx0x3KGylA1PruYff+1Jg
	XPixSGSBF1A9fjjp7RAHVdmy9C4PqdY7p2/1nIj8BFz6PuGcqL+Kf1RnvpoEMk6+1c6qWtJV9Xk
	nrAXSaZH8NlYYOKvhir77LZHsO/cXcB8wJGUI+8xptWPWl7XdP4mPa3w/J0QBFjrvrzCWyVp06T
	Lt4AGvO3l4E0MXE5iUIWbyWiMxjETQFaOhRWzIIGWoWNGugOedBOhxsyDnailfE6uM3UppEvsNh
	p02FwUjC+BO5/TSub165E575FBIdQa66dYon9nt4XHjL5T5pRyA9wTI0CmXxkmKIIObGg3PLpYw
	i2Wt3JLllmaoNdek0HMFpnQw1KOlzcoixj5Scl9hpmLAjENjTMls9RZ1mNg==
X-Received: by 2002:a17:90b:3c0f:b0:3ab:b764:8256 with SMTP id 98e67ed59e1d1-3abb7649df1mr4161375a91.17.1791870112945;
        Mon, 12 Oct 2026 22:41:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0f:b0:3ab:b764:8256 with SMTP id 98e67ed59e1d1-3abb7649df1mr4161339a91.17.1791870112091;
        Mon, 12 Oct 2026 22:41:52 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm22926361a91.11.2026.10.12.22.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:41:51 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 22:41:30 -0700
Subject: [PATCH RFC v3 3/9] tee: optee: define the RPMI control and
 parcel-reference ABI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-rpmi-tee-service-grp-dev-v3-3-975b574667e2@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX4y1eUUlyBnMS
 Qq5ofRJdTOlnUMZGnFZimSd4ONi6YOj5ZEtr8IZGRlZufhxZJG5vOinfHM1HT1McMAuXJ7L2Pdh
 bwpn3rl7s6YL2Wbj+YHPY+EMqENf3Fc/1mmbkEdhhy07WBTA7u2E64acymAzAiYtCHmvBZG4Jxv
 yT+dEv3Q8Z1/6sH4ltm/WwDgrb84b2OiT1T/cpaHQrpE98b4TOzfr1SWtY5Fo580TRRs9Lt4ics
 TWxz20QQAKS7rBZBIXkNJUPn2EBXH++w08Pb4sF10FDWizEy8AWflkEz9nx5pKxRYOu3aQjxc7t
 BWYdbVD0XGsPkaX2lW5ZKGnBJvmLu/XzlPFEhYJjFWwuruvBm5exWJxxbk/yVKJC/YcSxRoC9XW
 nkD2Z2ZBqUkpCVSmyfHeG4PeT1G8lEjLok7MlnBWH0pUYCCaZKN7+VtISOxFYMLrcmQLDxpPxTi
 msL99b0PPNPPCJdcksA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX82qy5JoAqeBC
 XVu9KPdl5lokZ7IamzEGwxoErxiAOzgRRsB/8TdqoRC6OhVVCCQ4+m/BjYFmVOOHNlx/LDQoaW+
 wsmoKHo7b5tlSFmEU7okZLT7H7qmjho=
X-Proofpoint-ORIG-GUID: ZXjSVrcsh_TMOH9IRLgaxKGkGYR9i12P
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6acdc4a2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=G3s93uPkn6CA8LbIO-UA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ZXjSVrcsh_TMOH9IRLgaxKGkGYR9i12P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130022

Define the OP-TEE service protocol carried by RPMI TEE_CALL payloads.
Add operations for version and capability queries, shared-memory
unregistration, asynchronous notification enablement, and yielding-call
start and resume. Use fixed-width little-endian control fields and TEE
result codes for control responses.

Add a parcel memory-reference layout with a full-width 64-bit offset
to the common message parameter union. Encode the RPMI parcel ID and
nonce as an opaque 64-bit global ID. A zero nonce denotes NULL, leaving
parcel ID zero usable with a nonzero nonce.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/optee_msg.h  |  23 +++-
 drivers/tee/optee/optee_rpmi.h | 263 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 283 insertions(+), 3 deletions(-)

diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_msg.h
index 6c3043f8da33..dc331cb0dace 100644
--- a/drivers/tee/optee/optee_msg.h
+++ b/drivers/tee/optee/optee_msg.h
@@ -31,6 +31,9 @@
 #define OPTEE_MSG_ATTR_TYPE_FMEM_INPUT		OPTEE_MSG_ATTR_TYPE_RMEM_INPUT
 #define OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT		OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT
 #define OPTEE_MSG_ATTR_TYPE_FMEM_INOUT		OPTEE_MSG_ATTR_TYPE_RMEM_INOUT
+#define OPTEE_MSG_ATTR_TYPE_PMEM_INPUT		OPTEE_MSG_ATTR_TYPE_RMEM_INPUT
+#define OPTEE_MSG_ATTR_TYPE_PMEM_OUTPUT		OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT
+#define OPTEE_MSG_ATTR_TYPE_PMEM_INOUT		OPTEE_MSG_ATTR_TYPE_RMEM_INOUT
 #define OPTEE_MSG_ATTR_TYPE_TMEM_INPUT		0x9
 #define OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT		0xa
 #define OPTEE_MSG_ATTR_TYPE_TMEM_INOUT		0xb
@@ -149,6 +152,18 @@ struct optee_msg_param_fmem {
 	u64 global_id;
 };
 
+/**
+ * struct optee_msg_param_pmem - RPMI parcel memory reference
+ * @offs: Byte offset from the start of the shared parcel
+ * @size: Reference size, or required size for a short-buffer response
+ * @global_id: Parcel ID in bits 31:0 and nonce in bits 63:32
+ */
+struct optee_msg_param_pmem {
+	u64 offs;
+	u64 size;
+	u64 global_id;
+};
+
 /**
  * struct optee_msg_param_value - opaque value parameter
  * @a: first opaque value
@@ -169,15 +184,16 @@ struct optee_msg_param_value {
  * @tmem:	parameter by temporary memory reference
  * @rmem:	parameter by registered memory reference
  * @fmem:	parameter by FF-A registered memory reference
+ * @pmem:	parameter by RPMI parcel memory reference
  * @value:	parameter by opaque value
  * @octets:	parameter by octet string
  * @u:		union holding OP-TEE msg parameter
  *
  * @attr & OPTEE_MSG_ATTR_TYPE_MASK indicates if tmem, rmem or value is used in
  * the union. OPTEE_MSG_ATTR_TYPE_VALUE_* indicates value or octets,
- * OPTEE_MSG_ATTR_TYPE_TMEM_* indicates @tmem and
- * OPTEE_MSG_ATTR_TYPE_RMEM_* or the alias PTEE_MSG_ATTR_TYPE_FMEM_* indicates
- * @rmem or @fmem depending on the conduit.
+ * OPTEE_MSG_ATTR_TYPE_TMEM_* indicates @u.tmem. OPTEE_MSG_ATTR_TYPE_RMEM_*
+ * and its FMEM/PMEM aliases indicate @u.rmem, @u.fmem or @u.pmem depending
+ * on the conduit.
  * OPTEE_MSG_ATTR_TYPE_NONE indicates that none of the members are used.
  */
 struct optee_msg_param {
@@ -186,6 +202,7 @@ struct optee_msg_param {
 		struct optee_msg_param_tmem tmem;
 		struct optee_msg_param_rmem rmem;
 		struct optee_msg_param_fmem fmem;
+		struct optee_msg_param_pmem pmem;
 		struct optee_msg_param_value value;
 		u8 octets[24];
 	} u;
diff --git a/drivers/tee/optee/optee_rpmi.h b/drivers/tee/optee/optee_rpmi.h
new file mode 100644
index 000000000000..d4cf2d927a7f
--- /dev/null
+++ b/drivers/tee/optee/optee_rpmi.h
@@ -0,0 +1,263 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef OPTEE_RPMI_H
+#define OPTEE_RPMI_H
+
+#include <linux/bitops.h>
+#include <linux/types.h>
+#include <linux/uuid.h>
+#include <linux/wordpart.h>
+
+/*
+ * OP-TEE service ABI over RPMI TEE_CALL.
+ *
+ * Requests and responses are carried in the TEE_CALL service payload.
+ * Control fields are little-endian. Response status fields contain unsigned
+ * 32-bit TEE result codes: TEE_SUCCESS or TEE_ERROR_*. These are distinct
+ * from the outer TEE_CALL status, which uses signed RPMI error codes, and
+ * the GP command result in optee_msg_arg.ret.
+ *
+ * Memory references use a global_id combining the parcel ID and nonce.
+ * A zero nonce denotes NULL regardless of the parcel ID. A NULL reference
+ * must specify a zero buffer offset; its requested size is preserved.
+ */
+
+#define OPTEE_RPMI_SERVICE_UUID \
+	UUID_INIT(0x486178e0, 0xe7f8, 0x11e3, \
+		  0xbc, 0x5e, 0x00, 0x02, 0xa5, 0xd5, 0xc5, 0x1b)
+
+#define OPTEE_RPMI_VERSION_MAJOR		1
+#define OPTEE_RPMI_VERSION_MINOR		0
+
+/**
+ * optee_rpmi_global_id() - encode an opaque parcel memory identity
+ * @parcel_id: firmware-assigned parcel identifier
+ * @nonce: REE nonce supplied when sharing the parcel
+ *
+ * Return: A 64-bit identity for memory parcel.
+ */
+static inline u64 optee_rpmi_global_id(u32 parcel_id, u32 nonce)
+{
+	return ((u64)nonce << 32) | parcel_id;
+}
+
+/* Extract the firmware-assigned parcel ID from a memory identity. */
+static inline u32 optee_rpmi_parcel_id(u64 global_id)
+{
+	return lower_32_bits(global_id);
+}
+
+/* Extract the nonce; zero denotes a NULL memory reference. */
+static inline u32 optee_rpmi_nonce(u64 global_id)
+{
+	return upper_32_bits(global_id);
+}
+
+/**
+ * struct optee_rpmi_probe_req - request without operation-specific arguments
+ * @op: GET_API_VERSION, GET_OS_VERSION or EXCHANGE_CAPABILITIES
+ */
+struct optee_rpmi_probe_req {
+	__le32 op;
+};
+
+/**
+ * struct optee_rpmi_status_resp - response carrying only a TEE result
+ * @status: TEE result code; TEE_SUCCESS on success
+ */
+struct optee_rpmi_status_resp {
+	__le32 status;
+};
+
+/*
+ * Return the service API version.
+ *
+ * Request:  struct optee_rpmi_probe_req
+ * Response: struct optee_rpmi_api_resp
+ */
+#define OPTEE_RPMI_GET_API_VERSION	0
+
+/**
+ * struct optee_rpmi_api_resp - GET_API_VERSION response
+ * @status: TEE result code; TEE_SUCCESS on success
+ * @major: incompatible protocol revision
+ * @minor: compatible protocol revision
+ */
+struct optee_rpmi_api_resp {
+	__le32 status;
+	__le32 major;
+	__le32 minor;
+};
+
+/*
+ * Return the trusted OS revision, not the service API revision.
+ *
+ * Request:  struct optee_rpmi_probe_req
+ * Response: struct optee_rpmi_os_resp
+ */
+#define OPTEE_RPMI_GET_OS_VERSION	1
+
+/**
+ * struct optee_rpmi_os_resp - GET_OS_VERSION response
+ * @status: TEE result code; TEE_SUCCESS on success
+ * @major: trusted OS major revision
+ * @minor: trusted OS minor revision
+ * @reserved: must be zero
+ * @build_id: trusted OS build identifier, zero if unspecified
+ */
+struct optee_rpmi_os_resp {
+	__le32 status;
+	__le32 major;
+	__le32 minor;
+	__le32 reserved;
+	__le64 build_id;
+};
+
+/*
+ * Query secure-world capabilities and limits.
+ *
+ * Request:  struct optee_rpmi_probe_req
+ * Response: struct optee_rpmi_caps_resp
+ */
+#define OPTEE_RPMI_EXCHANGE_CAPABILITIES	2
+
+/**
+ * struct optee_rpmi_caps_resp - EXCHANGE_CAPABILITIES response
+ * @status: TEE result code; TEE_SUCCESS on success
+ * @secure_caps: reserved for future optional features; zero in version 1
+ * @rpc_param_count: nonzero parameter capacity of each RPC argument buffer
+ * @max_notification_key: inclusive maximum logical key, including synchronous
+ *			  keys; zero selects the default maximum of 255
+ *
+ * Version 1 defines no capability bits. Unknown bits are ignored by Linux
+ * for compatibility with future extensions.
+ */
+struct optee_rpmi_caps_resp {
+	__le32 status;
+	__le32 secure_caps;
+	__le32 rpc_param_count;
+	__le32 max_notification_key;
+};
+
+/*
+ * Unregister a shared parcel from OP-TEE.
+ *
+ * Request:  struct optee_rpmi_unregister_req
+ * Response: struct optee_rpmi_status_resp
+ */
+#define OPTEE_RPMI_UNREGISTER_SHM	3
+
+/**
+ * struct optee_rpmi_unregister_req - retire a shared parcel in OP-TEE
+ * @op: OPTEE_RPMI_UNREGISTER_SHM
+ * @reserved: must be zero
+ * @global_id: identity of the parcel to retire; nonce must be nonzero
+ *
+ * Success means OP-TEE stopped using the mapping and released its receiver
+ * interest.
+ */
+struct optee_rpmi_unregister_req {
+	__le32 op;
+	__le32 reserved;
+	__le64 global_id;
+};
+
+/*
+ * Enable asynchronous notification delivery.
+ *
+ * Request:  struct optee_rpmi_enable_notif_req
+ * Response: struct optee_rpmi_status_resp
+ */
+#define OPTEE_RPMI_ENABLE_ASYNC_NOTIF	4
+
+/**
+ * struct optee_rpmi_enable_notif_req - bind an incoming RPMI doorbell
+ * @op: OPTEE_RPMI_ENABLE_ASYNC_NOTIF
+ * @signal_id: allocated TEE-to-REE signal, not a logical notification key
+ *
+ * Success activates delivery and raises the doorbell for pending work.
+ * Raising the signal requests OPTEE_MSG_CMD_DO_BOTTOM_HALF.
+ * OPTEE_MSG_CMD_STOP_ASYNC_NOTIF stops future doorbell generation, but does
+ * not drain already-raised signals or release the signal ID.
+ */
+struct optee_rpmi_enable_notif_req {
+	__le32 op;
+	__le32 signal_id;
+};
+
+/*
+ * Start a yielding command using shared command and RPC arguments.
+ *
+ * Request:  struct optee_rpmi_call_req
+ * Response: struct optee_rpmi_call_resp
+ */
+#define OPTEE_RPMI_YIELDING_CALL_WITH_ARG		5
+
+#define OPTEE_RPMI_YIELDING_CALL_RETURN_DONE		0
+#define OPTEE_RPMI_YIELDING_CALL_RETURN_RPC_CMD		1
+#define OPTEE_RPMI_YIELDING_CALL_RETURN_INTERRUPT	2
+
+/**
+ * struct optee_rpmi_call_req - start a yielding command
+ * @op: OPTEE_RPMI_YIELDING_CALL_WITH_ARG
+ * @flags: zero in version 1
+ * @global_id: argument parcel identity; nonce must be nonzero
+ * @arg_offset: command argument byte offset from the parcel's first byte
+ * @rpc_offset: RPC argument byte offset from the parcel's first byte
+ * @arg_size: command argument extent in bytes
+ * @rpc_size: RPC argument capacity in bytes
+ *
+ * Firmware validates ownership, RW access, alignment and disjoint ranges.
+ * TEE_ERROR_BUSY rejects an initial request without acquiring call ownership.
+ */
+struct optee_rpmi_call_req {
+	__le32 op;
+	__le32 flags;
+	__le64 global_id;
+	__le64 arg_offset;
+	__le64 rpc_offset;
+	__le32 arg_size;
+	__le32 rpc_size;
+};
+
+/**
+ * struct optee_rpmi_call_resp - yielding command response
+ * @status: TEE result code, distinct from the command's GP result
+ * @result: OPTEE_RPMI_YIELDING_CALL_RETURN_* value when status is success
+ * @resume_token: opaque token for a suspended command; ignored for DONE
+ *
+ * DONE releases all access to the call's argument and RPC ranges. RPC_CMD
+ * requests RPC command handling; INTERRUPT requests resumption without an
+ * RPC command. Tokens belong to one accepted call, service and caller.
+ */
+struct optee_rpmi_call_resp {
+	__le32 status;
+	__le32 result;
+	__le32 resume_token;
+};
+
+/*
+ * Resume a suspended yielding command.
+ *
+ * Request:  struct optee_rpmi_resume_req
+ * Response: struct optee_rpmi_call_resp
+ */
+#define OPTEE_RPMI_YIELDING_CALL_RESUME	6
+
+/**
+ * struct optee_rpmi_resume_req - resume a suspended command
+ * @op: OPTEE_RPMI_YIELDING_CALL_RESUME
+ * @reserved: must be zero
+ * @resume_token: opaque token copied unchanged from the preceding response
+ *
+ * Resume must not return TEE_ERROR_BUSY.
+ */
+struct optee_rpmi_resume_req {
+	__le32 op;
+	__le32 reserved;
+	__le32 resume_token;
+};
+
+#endif /* OPTEE_RPMI_H */

-- 
2.34.1


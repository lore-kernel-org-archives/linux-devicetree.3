Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD623AE1A5
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 03:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430135; cv=none; b=ILB9FhtgQXKUBmsl+MQo/bNo4aa8NQemM36hGIOwFhsAu6iTmBHIKwKRCnswmsY4FZkZijbreVPWnIww66ceWf2EY6XpcFn6j5NL0q988Kf9pYd/XEHMVgpE1fsFXrimk2fepsVApby7JS0BlCb7sQirpdIa7eHbytGE/ws+72U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430135; c=relaxed/simple;
	bh=Nc7c2NB3hGdi48979inrlz8BAJzMB8SiKcycNRYpdSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZKEK4ze4gircnAZxiYdWJtA5C7Hh91CJ/X3TpCqRfQIMl3J6uB1/Td4wT6cdFcFgzUTjHmU4V3cET9fprB/ZOdLNQ2AkcVtTV/AlTiTc/VdAkzu0R/ay0t8Y/xhRcfap8JEcy6o9J07vWFZDGeWJsmEXm6Fp3uM+gx1am3bVf2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfkO7VBQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XkXJC0ZZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfkO7VBQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XkXJC0ZZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hLhS607428
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 03:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h5GNPmOtb6vRXX69AT9xHsFaqITJ4EycmZwhRBnhLEI=; b=HfkO7VBQV/6BY5dX
	DjN/rwEZfsZ2b3qDbe4UlSF4rAmzD1c3FdwzPUXc4izeZ2hz9y36bwQU2XQNd0LJ
	IJhuSKSzKC6lIcPysyQYqd7WRtlEIDbfQM7yBAZ0lkKjS7FqWUcpDGgE5fumO29V
	BjCGl7ScfCNs6aZK+l8jsl8KciYcvJfzkK3Wf6bz6KdIxRpj8lZszh8mxzU9YLID
	lm/6k1K6iZKmKUq4EFte2/AWBqyoqB0LIYDIvTc6PW2CA5AiREMZr6rZzG7+Ef7J
	mQyydswDPpCF5evc+yzzhLjey7ydwPP7KXff//3Eh9UVAebXu+yvlJ8F46jEOQgP
	8JJBbg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2rwq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 03:28:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-351788121cfso1445238eec.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 20:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791430131; x=1792034931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h5GNPmOtb6vRXX69AT9xHsFaqITJ4EycmZwhRBnhLEI=;
        b=XkXJC0ZZmI2CPZSgxfKadhQnQ0dhs7jqqd7lC5N1yvfj3i9/qfi8zi9n/pKukgeYfy
         tOd8+neT6++F51JypgO48QszHKVjhODQf3ox5/Nqqsv4TRHu02lrOkreb0oZIaHPj9Th
         8Q9RTx6TyHqLZI9oMxLJCSzNqAIIdcMBCUq4c8ws1+qBoG6uY50yx7JzQNFlzi2y/MqB
         8cztrjZAUZMqszdGI/mpPLSHED/BZeHDl3nsDMP+/02e7OEGvu4jAOpLCOb9Wjbg9wH/
         CmnDKAohcolX9FnwhxmC7TI9ws5r8meg5y9HdBVUcIVy3c2x9aKuPy+9JV6RZ67V8Nee
         kcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791430131; x=1792034931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5GNPmOtb6vRXX69AT9xHsFaqITJ4EycmZwhRBnhLEI=;
        b=YMID3iTBvJ34zZX/N4nUNtSBJjE5bctebPnqxY8OrdV5blYAYCQfzE2HrZZE5a4LTp
         dLSkKVqSMhnaORHHY/1uxTCK+U7njwsr3/TzZuNDF8WUKjZU/K5pPddOUpsmovwx1GEO
         oNwjAF/sqcdqBsRKWmNn2R6EqmSTa4Yh1niV2yT/tRysQTb88RpvXknPzCVA/B0BIrwI
         naXN8017Yqw6WP0X6kQywwXT329tV18LoQWFR8ryRrkLnxrBRbx/CK6TC1gXANn0HHpI
         BaMiPzKb62lZwrbQkogoBR4Ig11qSG57EUeomOa6GBiLWh7CqfTnC9fzoXTrq9qvs6so
         LrsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxytXktRUNK9lqo0g8dyPCSbVJXcv/e8T2MjMSbOToYumPBwYh0w4Hf0v50tnjVlzfiH8dMUXcmht0@vger.kernel.org
X-Gm-Message-State: AFq9FYK/LS4/wrGOUJz1AETRVTSYJeAeQWaWRX7cR3XPPAhFtjS9JUfi
	4woJI/dlovnIz8HV9SUTD6mI5QOXNznpxcQsPjCkGrruwbJI3Z4GjV2dmUbe26sVwfRAeMuv7M7
	d5Ur3bS7NY1WLVkxbTJVFxdLcfm10WpLngPkqGB77+crpAgp4qf+2+UC9OETvOsY=
X-Gm-Gg: AYBFou2BBtZ8QerB7iy4NVdU6q+jRojTtTv0ALYPT+92qo0jgAo2m4d3/D7D8ZqwLmi
	5JDS4xhtGVFiLWUvj10uitx2/O2lPBkoWw2AKIza5i/59ErrOEzWAtb0eIgPGaQ904awWJOoqm5
	O74nRMIQGskqSYz1R8vFXkTFIelTGqpJh/BBUIyIYOh+wrer3prRoe7/T/G5JHTpZ75Fr2rkG6k
	0iyuvAXdlnkOyeKK6rmFS/afFX5GfEZji+TqqOH0rYlx5TK1b9KjcB2FGkmpXL5wrNX58UuEkFK
	79WrXeiTOhUl2y4MRw3n7L8KK6tH8KAyaBktEwDc4XQ2NIK5dnJFcn8ZC4vC6tcADv8wX6dr7NL
	iW2CkWwpOIXADHMhOXnh3E43kIJ3EH2TyKkQyq0n8y/H3k0usN1dLr4hXng==
X-Received: by 2002:a05:693c:810b:b0:33b:ea8c:811b with SMTP id 5a478bee46e88-3515dbd55e8mr4963601eec.5.1791430131167;
        Wed, 07 Oct 2026 20:28:51 -0700 (PDT)
X-Received: by 2002:a05:693c:810b:b0:33b:ea8c:811b with SMTP id 5a478bee46e88-3515dbd55e8mr4963556eec.5.1791430130414;
        Wed, 07 Oct 2026 20:28:50 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35179d07566sm2168349eec.30.2026.10.07.20.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:28:49 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 20:27:13 -0700
Subject: [PATCH RFC v2 07/10] firmware: riscv: rpmi-tee: register TEE
 services and support calls
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-riscv-rpmi-tee-abi-v2-7-45939a13d223@oss.qualcomm.com>
References: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
In-Reply-To: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfXyMsFhWPb3bD1
 m15hi5L4A2PhVkC/tCYSke0msQdThLb3I8JGq5SN8NrGBBnxgPNg0JV+dTYaSkEO/X3wRAuRBne
 XmyI6RmfmpqA0pv27IYaSct5Xno1oIQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX/sl4ayBVnDP/
 FmzhqK3kR6ILY2cxY8it65HFF2UZE3g5+slnXyLpbkp+YUaBY6SNezmmFnsR5SnCf81vrBNtCX4
 5QvDA50JsNCWi6fax7jPl8PbFV3qA0s9k3Icvqu4x88VWBWSjG5CPqJXR9pma+DfBJmTqi7eHKr
 4kyPlrY4Sg7U0fIKig6cuNgTizPt3tmhIn4ojKq5zFUAETMDB7TZyvTwi7/CHGbGxOHTIdVQwkj
 srEoGHgQjGvHERxTx8dWNw4vfBTch5dxky/vuNKEslliKoamx0oLzmjsWGfRhZWIph3XzfVlp8f
 7VrhydLWWLgIqqP1rUe92x1YSw5/s7H7VQdX2+dahZtRiw3mwKZjlpRJrWrj0SZsefRAD+BALZM
 m3ouUOXshWm3mkVxE8LNzkomHc/X03/0zjOeR1JnuZ6iD4VqsJzGFM0tFwWL/WzKXbiHznxpNjq
 6538qKXoun+aM4hPy0g==
X-Proofpoint-ORIG-GUID: X_0eboTLNDuxdH0udBRFvUX4M00sIihP
X-Proofpoint-GUID: X_0eboTLNDuxdH0udBRFvUX4M00sIihP
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac70df4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=y-vMUYROV6c7iJA4GfAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080013

Register discovered TEE services as RPMI TEE bus devices so service
drivers can bind to them.

Provide TEE_CALL operations for exchanging service-defined requests
and responses, and expose the transport's payload limits to clients.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/riscv_rpmi_tee/driver.c           | 278 ++++++++++++++++++++-
 drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h |  13 +
 include/linux/rpmi_tee.h                           |  35 +++
 3 files changed, 325 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/riscv_rpmi_tee/driver.c b/drivers/firmware/riscv_rpmi_tee/driver.c
index a70b8be41bed..a683f7d28c25 100644
--- a/drivers/firmware/riscv_rpmi_tee/driver.c
+++ b/drivers/firmware/riscv_rpmi_tee/driver.c
@@ -5,16 +5,52 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
-#include <linux/unaligned.h>
 #include <linux/mailbox_client.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
+#include <linux/cleanup.h>
+#include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/rpmi_tee.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
 
 #include "rpmi_tee_private.h"
 
+/**
+ * struct rpmi_tee_call_req - TEE_CALL request prefix
+ * @sender_id: Calling REE endpoint identifier.
+ * @target_id: Destination TEE endpoint identifier.
+ * @service: UUID of the target service.
+ * @service_data_len: Length of @service_data in bytes.
+ * @service_data: Service-defined request data.
+ */
+struct rpmi_tee_call_req {
+	__le32 sender_id;
+	__le32 target_id;
+	u8 service[UUID_SIZE];
+	__le32 service_data_len;
+	u8 service_data[];
+} __packed;
+
+/**
+ * struct rpmi_tee_call_resp - TEE_CALL response prefix
+ * @status: RPMI completion status.
+ * @service_data_len: Length of @service_data in bytes.
+ * @service_data: Service-defined response data.
+ */
+struct rpmi_tee_call_resp {
+	__le32 status;
+	__le32 service_data_len;
+	u8 service_data[];
+} __packed;
+
+struct rpmi_tee_child {
+	struct list_head node;
+	struct rpmi_tee_device *rdev;
+};
+
 /* rpmi_tee_send_with_status() - Send an RPMI TEE service request. */
 int rpmi_tee_send_with_status(struct rpmi_tee_transport *priv, u32 service_id,
 			      const void *req, size_t req_len, void *resp,
@@ -43,6 +79,47 @@ int rpmi_tee_send_with_status(struct rpmi_tee_transport *priv, u32 service_id,
 	return 0;
 }
 
+/**
+ * rpmi_tee_send() - Send an RPMI TEE service request
+ * @priv: RPMI TEE transport
+ * @service_id: RPMI TEE service identifier
+ * @req: Request data
+ * @req_len: Request data length
+ * @resp: Response data buffer, or %NULL for a status-only response
+ * @resp_len: On entry, response buffer capacity; on success, response length
+ *
+ * Pass both @resp and @resp_len as %NULL when the service has no response
+ * payload beyond the mandatory RPMI status word.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+static int rpmi_tee_send(struct rpmi_tee_transport *priv, u32 service_id,
+			 const void *req, size_t req_len, void *resp,
+			 size_t *resp_len)
+{
+	__le32 status_resp;
+	size_t status_resp_len = sizeof(status_resp);
+	s32 status;
+	int ret;
+
+	if (!resp && !resp_len) {
+		resp = &status_resp;
+		resp_len = &status_resp_len;
+	} else if (!resp || !resp_len) {
+		return -EINVAL;
+	}
+
+	ret = rpmi_tee_send_with_status(priv, service_id, req, req_len, resp,
+					resp_len, &status);
+	if (ret)
+		return ret;
+
+	if (status == RPMI_ERR_NO_DATA)
+		return -ENODATA;
+
+	return rpmi_to_linux_error(status);
+}
+
 /**
  * rpmi_tee_get_attr() - Get an RPMI mailbox attribute
  * @priv: RPMI TEE transport
@@ -95,12 +172,202 @@ static int rpmi_tee_check_transport(struct rpmi_tee_transport *priv)
 	ret = rpmi_tee_get_attr(priv, RPMI_MBOX_ATTR_MAX_MSG_DATA_SIZE, &value);
 	if (ret)
 		return ret;
+	/* The mandatory TEE_CALL request and response must fit the mailbox. */
+	if (value < sizeof(struct rpmi_tee_call_req) ||
+	    value < sizeof(struct rpmi_tee_call_resp))
+		return -EMSGSIZE;
 
 	priv->mbox.max_msg_data_size = value;
+	priv->max_call_req_size = value - sizeof(struct rpmi_tee_call_req);
+	priv->max_call_resp_size = value - sizeof(struct rpmi_tee_call_resp);
+
+	return 0;
+}
+
+/* RPMI TEE SERVICE GRP API. */
+
+/* Return the transport that owns @rdev. */
+static struct rpmi_tee_transport *
+rpmi_tee_device_to_transport(struct rpmi_tee_device *rdev)
+{
+	return dev_get_drvdata(rdev->dev.parent);
+}
+
+static int rpmi_tee_op_msg_limits_get(struct rpmi_tee_device *rdev,
+				      struct rpmi_tee_msg_limits *limits)
+{
+	struct rpmi_tee_transport *priv = rpmi_tee_device_to_transport(rdev);
+
+	if (!limits)
+		return -EINVAL;
+
+	limits->max_req_size = priv->max_call_req_size;
+	limits->max_resp_size = priv->max_call_resp_size;
+
+	return 0;
+}
+
+/**
+ * rpmi_tee_op_call - Invoke a service offered by a TEE endpoint
+ * @rdev: TEE service device.
+ * @req: Service-defined request data.
+ * @req_len: Length of @req in bytes.
+ * @resp: Buffer for service-defined response data.
+ * @resp_len: On entry, capacity of @resp; on success, response length.
+ *
+ * MPXY can return -ENOSPC after the TEE has processed the request when the
+ * response exceeds the supplied buffer. Callers must not blindly retry a
+ * non-idempotent request in that case.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+static int rpmi_tee_op_call(struct rpmi_tee_device *rdev, const void *req,
+			    size_t req_len, void *resp, size_t *resp_len)
+{
+	struct rpmi_tee_transport *priv = rpmi_tee_device_to_transport(rdev);
+	size_t call_req_len, call_resp_len;
+	u32 service_data_len;
+	int ret;
+
+	if (!resp_len || (!req && req_len) || (!resp && *resp_len))
+		return -EINVAL;
+
+	/* TEE_CALL payload must fit the mailbox. */
+	if (req_len > priv->max_call_req_size ||
+	    *resp_len > priv->max_call_resp_size)
+		return -EMSGSIZE;
+
+	call_req_len = sizeof(struct rpmi_tee_call_req) + req_len;
+	call_resp_len = sizeof(struct rpmi_tee_call_resp) + *resp_len;
+
+	struct rpmi_tee_call_req *call_req __free(kfree) =
+		kzalloc(call_req_len, GFP_KERNEL);
+	if (!call_req)
+		return -ENOMEM;
+
+	struct rpmi_tee_call_resp *call_resp __free(kfree) =
+		kzalloc(call_resp_len, GFP_KERNEL);
+	if (!call_resp)
+		return -ENOMEM;
+
+	call_req->sender_id = cpu_to_le32(priv->self_id);
+	call_req->target_id = cpu_to_le32(rdev->endpoint_id);
+	export_uuid(call_req->service, &rdev->uuid);
+	call_req->service_data_len = cpu_to_le32(req_len);
+	if (req_len)
+		memcpy(call_req->service_data, req, req_len);
+	/* Make TEE CALL. */
+	ret = rpmi_tee_send(priv, RPMI_TEE_SRV_CALL, call_req, call_req_len,
+			    call_resp, &call_resp_len);
+	if (ret)
+		return ret;
+
+	if (call_resp_len < sizeof(*call_resp))
+		return -EPROTO;
+	service_data_len = get_unaligned_le32(&call_resp->service_data_len);
+	/* Verify the firmware-reported length fits the actual response. */
+	if (service_data_len != call_resp_len - sizeof(*call_resp))
+		return -EPROTO;
+
+	if (service_data_len)
+		memcpy(resp, call_resp->service_data, service_data_len);
+	*resp_len = service_data_len;
+
+	return 0;
+}
+
+static const struct rpmi_tee_info_ops rpmi_tee_info_ops = {
+	.msg_limits_get = rpmi_tee_op_msg_limits_get,
+};
+
+static const struct rpmi_tee_msg_ops rpmi_tee_msg_ops = {
+	.call = rpmi_tee_op_call,
+};
+
+static const struct rpmi_tee_ops rpmi_tee_ops = {
+	.info_ops = &rpmi_tee_info_ops,
+	.msg_ops = &rpmi_tee_msg_ops,
+};
+
+static void rpmi_tee_unregister_devices(struct rpmi_tee_transport *priv)
+{
+	struct rpmi_tee_child *child, *tmp;
+
+	list_for_each_entry_safe(child, tmp, &priv->devices, node) {
+		list_del(&child->node);
+		rpmi_tee_device_unregister(child->rdev);
+		kfree(child);
+	}
+}
+
+static struct rpmi_tee_device *
+rpmi_tee_find_device(struct rpmi_tee_transport *priv, const uuid_t *uuid,
+		     u32 endpoint_id)
+{
+	struct rpmi_tee_child *child;
+
+	list_for_each_entry(child, &priv->devices, node) {
+		if (child->rdev->endpoint_id == endpoint_id &&
+		    uuid_equal(&child->rdev->uuid, uuid))
+			return child->rdev;
+	}
+
+	return NULL;
+}
+
+static int
+rpmi_tee_register_devices(struct rpmi_tee_transport *priv,
+			  const struct rpmi_tee_discovered_endpoint *ep)
+{
+	u32 i;
+
+	for (i = 0; i < ep->service_count; i++) {
+		const uuid_t *uuid = &ep->services[i];
+
+		/* Discard duplicate devices in the same endpoint. */
+		if (rpmi_tee_find_device(priv, uuid, ep->ep_id))
+			continue;
+
+		struct rpmi_tee_child *child __free(kfree) =
+			kzalloc_obj(*child, GFP_KERNEL);
+		if (!child)
+			return -ENOMEM;
+
+		child->rdev =
+			rpmi_tee_device_register(uuid, ep->ep_id,
+						 &rpmi_tee_ops, priv->dev);
+		if (IS_ERR(child->rdev))
+			return PTR_ERR(child->rdev);
+
+		list_add_tail(&no_free_ptr(child)->node, &priv->devices);
+	}
 
 	return 0;
 }
 
+static int rpmi_tee_setup_endpoints(struct rpmi_tee_transport *priv)
+{
+	struct rpmi_tee_discovered_endpoint *ep;
+	struct rpmi_tee_discovery system;
+	int ret;
+
+	ret = rpmi_tee_discover_endpoints(priv, &system);
+	if (ret)
+		return ret;
+
+	list_for_each_entry(ep, &system.eps, node) {
+		ret = rpmi_tee_register_devices(priv, ep);
+		if (ret) {
+			rpmi_tee_unregister_devices(priv);
+			break;
+		}
+	}
+
+	rpmi_tee_free_discovery(&system);
+
+	return ret;
+}
+
 static int rpmi_tee_transport_probe(struct platform_device *pdev)
 {
 	struct rpmi_tee_transport *priv;
@@ -112,6 +379,7 @@ static int rpmi_tee_transport_probe(struct platform_device *pdev)
 
 	priv->dev = &pdev->dev;
 	platform_set_drvdata(pdev, priv);
+	INIT_LIST_HEAD(&priv->devices);
 	priv->mbox.client.dev = &pdev->dev;
 	priv->mbox.client.tx_sync = true;
 	priv->mbox.chan = mbox_request_channel(&priv->mbox.client, 0);
@@ -126,6 +394,13 @@ static int rpmi_tee_transport_probe(struct platform_device *pdev)
 		goto out_failed;
 	}
 
+	ret = rpmi_tee_setup_endpoints(priv);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret,
+			      "failed to discover RPMI TEE services\n");
+		goto out_failed;
+	}
+
 	return 0;
 
 out_failed:
@@ -138,6 +413,7 @@ static void rpmi_tee_transport_remove(struct platform_device *pdev)
 {
 	struct rpmi_tee_transport *priv = platform_get_drvdata(pdev);
 
+	rpmi_tee_unregister_devices(priv);
 	mbox_free_channel(priv->mbox.chan);
 }
 
diff --git a/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h b/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
index ba0e7cb59b6d..07e6b9913cb7 100644
--- a/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
+++ b/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
@@ -17,6 +17,7 @@
 #define RPMI_TEE_SRV_PROBE_SYSTEM	0x03
 #define RPMI_TEE_SRV_PROBE_DOMAIN	0x04
 #define RPMI_TEE_SRV_PROBE_ENDPOINT	0x05
+#define RPMI_TEE_SRV_CALL		0x18
 
 struct rpmi_tee_mbox {
 	struct mbox_client client;
@@ -24,10 +25,22 @@ struct rpmi_tee_mbox {
 	u32 max_msg_data_size;
 };
 
+/**
+ * struct rpmi_tee_transport - State for one RPMI TEE transport instance
+ * @dev: Parent platform device.
+ * @mbox: RPMI mailbox transport state.
+ * @max_call_req_size: Maximum TEE_CALL request payload size in bytes.
+ * @max_call_resp_size: Maximum TEE_CALL response payload size in bytes.
+ * @self_id: Local REE physical endpoint identifier.
+ * @devices: List of registered TEE service devices.
+ */
 struct rpmi_tee_transport {
 	struct device *dev;
 	struct rpmi_tee_mbox mbox;
+	size_t max_call_req_size;
+	size_t max_call_resp_size;
 	u32 self_id;
+	struct list_head devices;
 };
 
 /* Report local transport errors separately from the returned RPMI status. */
diff --git a/include/linux/rpmi_tee.h b/include/linux/rpmi_tee.h
index c499f0427833..a76055149996 100644
--- a/include/linux/rpmi_tee.h
+++ b/include/linux/rpmi_tee.h
@@ -41,6 +41,41 @@ struct rpmi_tee_driver {
 #define to_rpmi_tee_drv(d) \
 	container_of_const(d, struct rpmi_tee_driver, driver)
 
+/**
+ * struct rpmi_tee_msg_limits - TEE_CALL service payload limits
+ * @max_req_size: Maximum request payload size in bytes.
+ * @max_resp_size: Maximum response payload size in bytes.
+ *
+ * Limits exclude the RPMI TEE_CALL request and response prefixes, but include
+ * any service-specific headers supplied by the caller.
+ */
+struct rpmi_tee_msg_limits {
+	size_t max_req_size;
+	size_t max_resp_size;
+};
+
+/**
+ * struct rpmi_tee_info_ops - RPMI TEE transport information operations
+ * @msg_limits_get: Return cached TEE_CALL payload limits for the transport
+ *	serving @rdev in @limits. Limits remain fixed for the transport lifetime.
+ *	Return 0 on success, or a negative error code on failure.
+ */
+struct rpmi_tee_info_ops {
+	int (*msg_limits_get)(struct rpmi_tee_device *rdev,
+			      struct rpmi_tee_msg_limits *limits);
+};
+
+struct rpmi_tee_msg_ops {
+	int (*call)(struct rpmi_tee_device *rdev, const void *req,
+		    size_t req_len, void *resp, size_t *resp_len);
+};
+
+/* RPMI TEE transport operation groups. */
+struct rpmi_tee_ops {
+	const struct rpmi_tee_info_ops *info_ops;
+	const struct rpmi_tee_msg_ops *msg_ops;
+};
+
 extern const struct bus_type rpmi_tee_bus_type;
 
 #if IS_REACHABLE(CONFIG_RISCV_RPMI_TEE_TRANSPORT)

-- 
2.34.1


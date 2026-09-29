Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A28642902E
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651883; cv=none; b=Yv3IQW1yDYiWnygjPvDVbJBxlJXjGRIvbHvzeCmDfWoQHky4BE0lBCcoxWDrhIROixTZY0dAMuAUIN1GM4a8M2T7HcUFSNlUg+bsf/VnGWZAsL6E3Sicd1yepe3tlaOViaYzurmUpMAAVYKNe4zdhhUMy2SFHMCVj0xoeu61CAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651883; c=relaxed/simple;
	bh=iON+9KUlBJL5AmRqKVSIRhH/LM2NrkMFOj1GBScBHUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i3KDrLS7VpbRvtHRoVCQS6YpMgAImOBs5hpjnxhs9nJXMGCh7fomcNet/JTNjRRCqJ3H7AemuKWowQ/WHgRl6wT83p8Gue8sRNvZVRiue1WjENDj/xZg+NXg2AwtKQuV/5drEPWjHDegZqqLKR9G71AgbORH4WR4b8LYEoD2oq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kWYXtGOO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BdwcPQ5/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kWYXtGOO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BdwcPQ5/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0kg1a3623773
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CbXZIFabmAbEjfK2I2xCUw3hbj2D7qnhOVuAj0Qii1U=; b=kWYXtGOOa7dD7fPm
	TjcHp1TpgBwIGDPOV8h2wGF8dF1EOwfB69gEkqlidb60FyoyscgarMpfkHSo5Gyy
	kK+7ujrAbn9bAwx3aba5ZP5P+SF7hdoQIjWVk+OtOaUOTiSTlBerhGEOEX+62e+v
	7INzODemgq3SJ1cUo7JEl8OP8YQCAKDkUVuxIangalsN1mxlQJI9xZzlf1pDUECz
	ADTSt8eP5z7b5zmwvs1D3SAy07/J/0P10sm0ayA3KWK6x9Ia5H2lJA+uVGsUJBQI
	sg4u7P3FEj5BtPZUko15WssIf4rlNBMUBuXclVK6TEMEIM/wjCMNfF8YjhfnPCjT
	eCcm0g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynb6ky1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:17:55 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-144d4ba280aso64686c88.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 20:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790651874; x=1791256674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CbXZIFabmAbEjfK2I2xCUw3hbj2D7qnhOVuAj0Qii1U=;
        b=BdwcPQ5/uyloSSyEHpapyCDchHKVujbYs5B+io4V7SzKGfZLasHhGl123gv+fEiZs4
         QFLcBq52Rmk8Z1mFDLxLF4sBGVMP2osLuBeaBSqhvE8dRLO/1Ea+iTE3VT/5DjrqKmCE
         JcrPnsGncw6LsgahNilq8j2KsMUX1A9KbSoEHPRBoiu+fDoT7P7WRFK6MpwlldMgbL7w
         tVaKBWL2mzxvCwQBetb4kVOcLwtQKPtckyhOQKDSP8mOFTEVXdSVnV13u5ek8ELk3723
         sxZrw43VFDOF8kUou5kbbva/+eOZatjl84rdeHE7VssSoZI8eyOTMYxtgqsWPd/b7Ec4
         LODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651874; x=1791256674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CbXZIFabmAbEjfK2I2xCUw3hbj2D7qnhOVuAj0Qii1U=;
        b=AkYNDosNeN3jnEt1N1MnmQV4FF39HA8844ZYcsMlRf90KDp8060NqVojgB2K121M2M
         oWSzBPX6poKmAq6QDrsF0SocTtuP5SfUvT8wbzJk7amfIJXyUWmMD6LzkJ29jaXyVmuf
         05+nyf7aKeJT+sGFRIrFhRCYDicY6kH2nvxH5r6MhZCxrAYiTM2brTRIDMQiR+EKOdu9
         My1O0h+YrZOS0h4v4Yv+SF+rQIeXYduaIWfHfMX5QQyAuNaUmVX3pff3sqeccRFOP9NC
         d7KvSZCwEKLG6CKTEhp0Ivdb78m6oVN1x1nfdrSzbRv0IaC1EETPuHTOS3k7r5Oqkoh+
         9anA==
X-Forwarded-Encrypted: i=1; AKwUvBxucn98CtVr7fgsSyKneMVPRymEb0QtbhKg0OuEc0POJQSPniyuT+PnZNwcOswz8QsyKef97ToRWRbO@vger.kernel.org
X-Gm-Message-State: AFuF++kiF/q6Alk4cgtYAbzxRdLjuJS37GUUe7SNFWokk4mUUB9jc0Dp
	xIkbi2ONl4DwkjlOIVeTc+23a/cJ4a42hF8uoihQNKB4xkZCjGBKpRCDfbI+dXFPEUgu/UUXgdM
	v09KcpDVk722YdBMPpe2eAmZb6jrcP0LUk3ucK/NJn8Hyu0sc91VAbIIzV333FKs=
X-Gm-Gg: AYBFou2xJlPMky+DzArWmtBDteuNUwTaq2C1q0T/VIUPYB3xvSomSWxH+r9PlAi+t5h
	iFZxJtfL1gz+PqRhybz2mEd5IXYN5lqEBLrrRhlMxuq6dl90bOtTIdsvSOyI0a/b6emfpjltPlM
	fMgiYxjIaCKh47+ANf6xZJaEWX1N/C8crWKbfvyvtmaUos5pAL0p5xo2+qxsuAW4wAusVmzwnri
	dzabThSoJyJl1+NLgevBNd/7DV6CqYJLKKVnzCGD9W5BD1+vtCWdPFmkysOWgoLhfnKy2Y5KjQu
	jPfSCS+WI/ca9iHwApB7NzN/WyLZSO47wTqEFmtJ6+UunXLacU/5KCUkx2IR6MtoX2HLiXAMcPC
	Qu6Z2vFoJJ2NUWxFhk83JbnzYbwVy2dq4mLuNLGAMZfZ5TNql5xCI2hcbqkU=
X-Received: by 2002:a05:7022:3a83:b0:141:2f15:552f with SMTP id a92af1059eb24-14b2b6c2670mr1924704c88.9.1790651873807;
        Mon, 28 Sep 2026 20:17:53 -0700 (PDT)
X-Received: by 2002:a05:7022:3a83:b0:141:2f15:552f with SMTP id a92af1059eb24-14b2b6c2670mr1924657c88.9.1790651873052;
        Mon, 28 Sep 2026 20:17:53 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad4028a9sm24789368c88.11.2026.09.28.20.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:17:52 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 20:16:58 -0700
Subject: [PATCH RFC 07/10] firmware: riscv: rpmi-tee: discover TEE services
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-riscv-rpmi-tee-abi-v1-7-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX9N0HLM71/vUm
 YTL18ZMTPqd0SuEQY4PlviOfXO+KKaBjxcKFSZFrj+asJr6ld9d7+npMnpTodCYOC+cBssEXc4p
 FYpoDAqK5ahCeTsmSrra6At5U0ihUXQlzxkQxLMazf0/4480Qf7lp8tB4KNs5KDoHJJkhx1PQps
 dNFkGXE+diKEwpmzm2E3QrQw35KozKF8kjh/sZy56ZdgTCU0L0djV9+JZTMGLTOUviQoe/f1ajP
 Lh7ARHgXE31Aj5w7ZOEUthUUgFdjoGYUq55QldVn47EGqpuFmfCzT0AjSPTefRpH9LoJf89p3xZ
 uDFsm2J9sjFBXNYyIBK6MuL7fUq24Y8Jv75K/jecfF5lVCCf6BLh6DB4Lr9rCwlUVslCRZNUO+C
 HVhbHqOsLQyjbyE4kvdWKhK0rgypsD5RCqaSDAEC22zu4xs92ilKonUu5MmjHMEpFTvQ/kGVTzD
 LbNlsdaJ84hE4V629MQ==
X-Authority-Analysis: v=2.4 cv=K+e3jCWI c=1 sm=1 tr=0 ts=6abb2de3 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zg7WzeXGWC4RVWCX2BsA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX+mPfn2xBSHbY
 n5JC4TB7KPNed2+KEg8XU3RXIzXZVsT2+wGYrKWks8g686LQKwHgfjPLvdDK1RezjX0FPpV/rQA
 cO7H9UWSQyNwMuocyFjg9Fp4tSNCtOw=
X-Proofpoint-ORIG-GUID: kngcDiobEIucvlFaoFBmZUE8vpytrLpc
X-Proofpoint-GUID: kngcDiobEIucvlFaoFBmZUE8vpytrLpc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290012

Add the RPMI TEE service-group message layer: TEE_PROBE_FEATURES and
TEE_PROBE_SYSTEM requests, and TEE_CALL for invoking a service on a
discovered endpoint. Use TEE_PROBE_SYSTEM to retrieve the Self and
Whole-system SYSINFO tables during transport probe, and register one
RPMI TEE device for every physical TEE service UUID discovered.

Implement the msg_ops.call operation on top of TEE_CALL, so consumer
drivers bound to the registered devices can issue service requests
without depending on the RPMI wire format.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/riscv_rpmi_tee/driver.c | 504 +++++++++++++++++++++++++++++++
 include/linux/rpmi_tee.h                 |  10 +
 2 files changed, 514 insertions(+)

diff --git a/drivers/firmware/riscv_rpmi_tee/driver.c b/drivers/firmware/riscv_rpmi_tee/driver.c
index 633dba116584..db3dbab53078 100644
--- a/drivers/firmware/riscv_rpmi_tee/driver.c
+++ b/drivers/firmware/riscv_rpmi_tee/driver.c
@@ -7,24 +7,188 @@
 
 #include <linux/mailbox_client.h>
 #include <linux/mailbox/riscv-rpmi-message.h>
+#include <linux/cleanup.h>
+#include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/overflow.h>
 #include <linux/platform_device.h>
 #include <linux/rpmi_tee.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
+
+#include "sysinfo.h"
 
 #define RPMI_SRVGRP_TEE		0x10
 
+#define RPMI_TEE_SRV_PROBE_FEATURES	0x02
+#define RPMI_TEE_SRV_PROBE_SYSTEM	0x03
+#define RPMI_TEE_SRV_CALL		0x13
+
+#define RPMI_TEE_FEATURE_SYSINFO_FORMAT	6
+
+#define RPMI_TEE_SYSTEM_WHOLE		0
+#define RPMI_TEE_SYSTEM_SELF		3
+
+/**
+ * struct rpmi_tee_probe_features_req - TEE_PROBE_FEATURES request
+ * @feature_id: TEE feature identifier to query.
+ */
+struct rpmi_tee_probe_features_req {
+	__le32 feature_id;
+} __packed;
+
+/**
+ * struct rpmi_tee_probe_features_resp - TEE_PROBE_FEATURES response
+ * @status: RPMI completion status.
+ * @value: Feature-specific value.
+ */
+struct rpmi_tee_probe_features_resp {
+	__le32 status;
+	__le32 value;
+} __packed;
+
+/**
+ * struct rpmi_tee_probe_system_req - TEE_PROBE_SYSTEM request
+ * @format: Requested system-information format.
+ * @target_type: Requested system-information target type.
+ * @target_len: Target-specific request data length.
+ * @target: Target-specific request data.
+ */
+struct rpmi_tee_probe_system_req {
+	__le32 format;
+	__le32 target_type;
+	__le32 target_len;
+	u8 target[];
+} __packed;
+
+/**
+ * struct rpmi_tee_probe_system_resp - TEE_PROBE_SYSTEM response prefix
+ * @status: RPMI completion status.
+ * @data_len: Length of the following system-information data.
+ * @data: System-information data in the requested format.
+ */
+struct rpmi_tee_probe_system_resp {
+	__le32 status;
+	__le32 data_len;
+	u8 data[];
+} __packed;
+
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
 struct rpmi_tee_mbox {
 	struct mbox_client client;
 	struct mbox_chan *chan;
 	u32 max_msg_data_size;
 };
 
+struct rpmi_tee_child {
+	struct list_head node;
+	struct rpmi_tee_device *rdev;
+};
+
 struct rpmi_tee_transport {
 	struct device *dev;
 	struct rpmi_tee_mbox mbox;
+	u32 self_id;
+	struct list_head devices;
 };
 
+/* __rpmi_tee_send() - Send an RPMI TEE service request. */
+static int __rpmi_tee_send(struct rpmi_tee_transport *priv, u32 service_id,
+			   const void *req, size_t req_len, void *resp,
+			   size_t *resp_len, s32 *status)
+{
+	size_t max_resp_len = *resp_len;
+	struct rpmi_mbox_message msg;
+	int ret;
+
+	if (req_len > priv->mbox.max_msg_data_size ||
+	    max_resp_len > priv->mbox.max_msg_data_size)
+		return -EMSGSIZE;
+
+	rpmi_mbox_init_send_with_response(&msg, service_id, (void *)req,
+					  req_len, resp, max_resp_len);
+	ret = rpmi_mbox_send_message_sync(priv->mbox.chan, &msg);
+	if (ret)
+		return ret;
+	/* At least STATUS word should be present. */
+	if (msg.data.out_response_len < sizeof(__le32))
+		return -EPROTO;
+
+	*resp_len = msg.data.out_response_len;
+	*status = (s32)get_unaligned_le32(resp);
+
+	return 0;
+}
+
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
+	ret = __rpmi_tee_send(priv, service_id, req, req_len, resp, resp_len,
+			      &status);
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
@@ -77,12 +241,343 @@ static int rpmi_tee_check_transport(struct rpmi_tee_transport *priv)
 	ret = rpmi_tee_get_attr(priv, RPMI_MBOX_ATTR_MAX_MSG_DATA_SIZE, &value);
 	if (ret)
 		return ret;
+	/* The mandatory TEE_CALL request and response must fit the mailbox. */
+	if (value < sizeof(struct rpmi_tee_call_req) ||
+	    value < sizeof(struct rpmi_tee_call_resp))
+		return -EMSGSIZE;
 
 	priv->mbox.max_msg_data_size = value;
 
 	return 0;
 }
 
+/* RPMI TEE SERVICE GRP API. */
+
+/* TEE_PROBE_FEATURES. */
+static int rpmi_tee_probe_features(struct rpmi_tee_transport *priv,
+				   u32 feature_id, u32 *value)
+{
+	struct rpmi_tee_probe_features_req req = {
+		.feature_id = cpu_to_le32(feature_id),
+	};
+	struct rpmi_tee_probe_features_resp resp;
+	size_t resp_len = sizeof(resp);
+	int ret;
+
+	ret = rpmi_tee_send(priv, RPMI_TEE_SRV_PROBE_FEATURES, &req,
+			    sizeof(req), &resp, &resp_len);
+	if (ret)
+		return ret;
+	if (resp_len != sizeof(resp))
+		return -EPROTO;
+
+	*value = get_unaligned_le32(&resp.value);
+
+	return 0;
+}
+
+/**
+ * rpmi_tee_probe_system - retrieve a TEE system-information description
+ * @priv: RPMI TEE transport.
+ * @target_type: System-information target type.
+ * @data: Returns an allocated system-information buffer.
+ * @data_len: Returns the size of @data in bytes.
+ *
+ * Supports only the Whole-system and Self targets, which have no target data.
+ * The caller owns the returned buffer in @data and must free them with kfree().
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+static int rpmi_tee_probe_system(struct rpmi_tee_transport *priv,
+				 u32 target_type, void **data, size_t *data_len)
+{
+	struct rpmi_tee_probe_system_req req = {
+		.format = cpu_to_le32(RPMI_TEE_SYSINFO_FORMAT_TABLE),
+		.target_type = cpu_to_le32(target_type),
+		/* Whole-system and Self probes have no target data. */
+		.target_len = 0,
+	};
+	size_t resp_len = priv->mbox.max_msg_data_size;
+	u32 len;
+	int ret;
+
+	if (target_type != RPMI_TEE_SYSTEM_WHOLE &&
+	    target_type != RPMI_TEE_SYSTEM_SELF)
+		return -EINVAL;
+
+	struct rpmi_tee_probe_system_resp *resp __free(kfree) =
+		kzalloc(resp_len, GFP_KERNEL);
+	if (!resp)
+		return -ENOMEM;
+
+	ret = rpmi_tee_send(priv, RPMI_TEE_SRV_PROBE_SYSTEM, &req, sizeof(req),
+			    resp, &resp_len);
+	if (ret)
+		return ret;
+
+	if (resp_len < sizeof(*resp))
+		return -EPROTO;
+	len = get_unaligned_le32(&resp->data_len);
+	if (len != resp_len - sizeof(*resp))
+		return -EPROTO;
+
+	/* Keep the system data. */
+	*data = kmemdup(resp->data, len, GFP_KERNEL);
+	if (!*data)
+		return -ENOMEM;
+
+	*data_len = len;
+
+	return 0;
+}
+
+/* Retrieve the local REE endpoint identifier. */
+static int rpmi_tee_parse_self(struct rpmi_tee_transport *priv, u32 *self_id)
+{
+	void *data __free(kfree) = NULL;
+	size_t data_len;
+	int ret;
+
+	ret = rpmi_tee_probe_system(priv, RPMI_TEE_SYSTEM_SELF, &data,
+				    &data_len);
+	if (ret)
+		return ret;
+
+	return rpmi_tee_sysinfo_parse_self(data, data_len, self_id);
+}
+
+/**
+ * rpmi_tee_parse_system() - Retrieve and parse Whole-system SYSINFO
+ * @priv: RPMI TEE transport.
+ * @system: Returned endpoint and service discovery records.
+ *
+ * Retrieve the Whole-system SYSINFO description. The caller owns the arrays
+ * in @system on success and must free them with kfree().
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+static int rpmi_tee_parse_system(struct rpmi_tee_transport *priv,
+				 struct rpmi_tee_sysinfo_system *system)
+{
+	void *data __free(kfree) = NULL;
+	size_t data_len;
+	int ret;
+
+	/* Start with no output storage to obtain the required record counts. */
+	*system = (struct rpmi_tee_sysinfo_system) {};
+
+	ret = rpmi_tee_probe_system(priv, RPMI_TEE_SYSTEM_WHOLE, &data,
+				    &data_len);
+	if (ret)
+		return ret;
+
+	ret = rpmi_tee_sysinfo_parse_system(data, data_len, priv->self_id,
+					    system);
+	if (ret != -ENOSPC)
+		return ret;
+
+	if (system->ep_count) {
+		system->ep_capacity = system->ep_count;
+		system->eps = kcalloc(system->ep_capacity, sizeof(*system->eps),
+				      GFP_KERNEL);
+		if (!system->eps)
+			return -ENOMEM;
+	}
+
+	if (system->service_count) {
+		system->service_capacity = system->service_count;
+		system->services = kcalloc(system->service_capacity,
+					   sizeof(*system->services), GFP_KERNEL);
+		if (!system->services) {
+			kfree(system->eps);
+			return -ENOMEM;
+		}
+	}
+
+	ret = rpmi_tee_sysinfo_parse_system(data, data_len, priv->self_id,
+					    system);
+	if (ret) {
+		kfree(system->services);
+		kfree(system->eps);
+	}
+
+	return ret;
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
+/* Return the transport that owns @rdev. */
+static struct rpmi_tee_transport *
+rpmi_tee_device_to_transport(struct rpmi_tee_device *rdev)
+{
+	return dev_get_drvdata(rdev->dev.parent);
+}
+
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
+	if (req_len > priv->mbox.max_msg_data_size -
+		sizeof(struct rpmi_tee_call_req) ||
+	    *resp_len > priv->mbox.max_msg_data_size -
+		sizeof(struct rpmi_tee_call_resp))
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
+static const struct rpmi_tee_msg_ops rpmi_tee_msg_ops = {
+	.call = rpmi_tee_op_call,
+};
+
+static const struct rpmi_tee_ops rpmi_tee_ops = {
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
+			  const struct rpmi_tee_sysinfo_service_info *services,
+			  size_t service_count)
+{
+	size_t i;
+	int ret;
+
+	for (i = 0; i < service_count; i++) {
+		const struct rpmi_tee_sysinfo_service_info *service = &services[i];
+
+		/* Discard duplicate devices in the same endpoint. */
+		if (rpmi_tee_find_device(priv, &service->uuid,
+					 service->endpoint_id))
+			continue;
+
+		struct rpmi_tee_child *child __free(kfree) =
+			kzalloc_obj(*child, GFP_KERNEL);
+		if (!child) {
+			ret = -ENOMEM;
+			goto err_unregister;
+		}
+		child->rdev = rpmi_tee_device_register(&service->uuid,
+						       service->endpoint_id,
+						       &rpmi_tee_ops,
+						       priv->dev);
+		if (IS_ERR(child->rdev)) {
+			ret = PTR_ERR(child->rdev);
+			goto err_unregister;
+		}
+
+		list_add_tail(&no_free_ptr(child)->node, &priv->devices);
+	}
+
+	return 0;
+
+err_unregister:
+	rpmi_tee_unregister_devices(priv);
+
+	return ret;
+}
+
+static int rpmi_tee_setup_endpoints(struct rpmi_tee_transport *priv)
+{
+	struct rpmi_tee_sysinfo_system system;
+	int ret;
+
+	ret = rpmi_tee_parse_self(priv, &priv->self_id);
+	if (ret)
+		return ret;
+
+	ret = rpmi_tee_parse_system(priv, &system);
+	if (ret)
+		return ret;
+
+	ret = rpmi_tee_register_devices(priv, system.services,
+					system.service_count);
+	kfree(system.services);
+	kfree(system.eps);
+
+	return ret;
+}
+
 static int rpmi_tee_transport_probe(struct platform_device *pdev)
 {
 	struct rpmi_tee_transport *priv;
@@ -94,6 +589,7 @@ static int rpmi_tee_transport_probe(struct platform_device *pdev)
 
 	priv->dev = &pdev->dev;
 	platform_set_drvdata(pdev, priv);
+	INIT_LIST_HEAD(&priv->devices);
 	priv->mbox.client.dev = &pdev->dev;
 	priv->mbox.client.tx_sync = true;
 	priv->mbox.chan = mbox_request_channel(&priv->mbox.client, 0);
@@ -108,6 +604,13 @@ static int rpmi_tee_transport_probe(struct platform_device *pdev)
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
@@ -120,6 +623,7 @@ static void rpmi_tee_transport_remove(struct platform_device *pdev)
 {
 	struct rpmi_tee_transport *priv = platform_get_drvdata(pdev);
 
+	rpmi_tee_unregister_devices(priv);
 	mbox_free_channel(priv->mbox.chan);
 }
 
diff --git a/include/linux/rpmi_tee.h b/include/linux/rpmi_tee.h
index c499f0427833..57c1843537da 100644
--- a/include/linux/rpmi_tee.h
+++ b/include/linux/rpmi_tee.h
@@ -41,6 +41,16 @@ struct rpmi_tee_driver {
 #define to_rpmi_tee_drv(d) \
 	container_of_const(d, struct rpmi_tee_driver, driver)
 
+struct rpmi_tee_msg_ops {
+	int (*call)(struct rpmi_tee_device *rdev, const void *req,
+		    size_t req_len, void *resp, size_t *resp_len);
+};
+
+/* RPMI TEE transport operation groups. */
+struct rpmi_tee_ops {
+	const struct rpmi_tee_msg_ops *msg_ops;
+};
+
 extern const struct bus_type rpmi_tee_bus_type;
 
 #if IS_REACHABLE(CONFIG_RISCV_RPMI_TEE_TRANSPORT)

-- 
2.34.1


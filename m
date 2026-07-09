Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869E9364E89
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604554; cv=none; b=nu/LTd6vqVKNwSPGTfvQJh886QcCJVKlADqnPFBs5y6QRcegyGLO5prdRxML+6oj+hIoPyZajbdFr6hUTY/urippOX+VPOwgH5Gwvxho8WqlJ+3VXHJ2gHvJ5Q+8qFef0gdNNmRBRZ+OpzjF3Y2cHe89ZcPBwe1N81dLRMzW6JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604554; c=relaxed/simple;
	bh=AcarJ8y6fItqDYFBNoulW/dCUfTPyc5q6YcY/mcFEuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MhpZUDykCo/iCQI1X1Vg8OhflPhtnYmTH7khtPoFaEX23+VdPdlc/Sx9DPjxbs4rSvJ/n+mpTnOTC14f95T0bM07Ki99MrHG5QGosJTDVgWKiMLUkNFCkuuCLdtk0T4LgOzz02wCSoeNKdRBmyhQjfpuGnrBkJEs/4q3YAgjMW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mwKvx6r1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KHY18def; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mwKvx6r1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KHY18def"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BMxYl1656804
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YR3nkRbALzgkvoB1x+4K+kKOljE1sovDhHcQK6EVdCc=; b=mwKvx6r1H/SS/OfR
	KtdN3lxGf3kmzl0HP6hinuMr6rC2iyfOB93QDyLQw9db2B98DtPhj8R9521QiRep
	6OykiZdwy1ZhIC2faFaQagYDpeFi6vcrAcboHR9cy7FmdRUcGkjtxaB+D9VnltT4
	ZItrow6zlIAOzbxcVc0OQ3ATBdtqUfRPPJluqjh6y1W9h7bpSMYqmFTqYuGsNU8m
	5nTdkSSVmZw8ToNDmkz2Z+PRxWZG/EXl2QvElmexWwbxVamDaPuK+JD5PbEvVgFg
	NKFJvN+2NcFJSl8tQ+61pNsZk8H/zwR3rkEwUI3bqgxnHjIBOPL/sMB1nSQKALo8
	R5zn3g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3suvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:42:31 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9693c6fe1e6so1603999241.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604551; x=1784209351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YR3nkRbALzgkvoB1x+4K+kKOljE1sovDhHcQK6EVdCc=;
        b=KHY18deflJljE6wVvFJmBJDdHLpTAFRrNGuZAXRjBDu2cdB8gO5XKnWBhyjiYQjpyo
         ZIYxzKQ8LPqhNYHajR636xQsf5dnNlWWwlH2nQq1QwBkqkq64Ds0n2gYeVxFYobyl1XA
         nL8Ec58ByQqGaHnGpwGkhwfLUQTdsWlNbs8z1Go3b3wpWlPm0Gw8MJPP0jqcI3dPt5+F
         vYwJyDKrPoKrIkScOb5fDFxSmHMVbFzMnDaOTphzt5PqkjwHO37ClSoREoQyeEwP4QNE
         VBxobU2BIElUkSdqhcosjnhEVNW5+i9XNK8Usb5/qrSXwAIpkTqFb1aagOK3PoNzNoJV
         Po+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604551; x=1784209351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YR3nkRbALzgkvoB1x+4K+kKOljE1sovDhHcQK6EVdCc=;
        b=AJdA3RJg671RNrTWO8xA9G6g63skAyprgj0RGCI3Qg0jjak9VhvWjpR6iHWrbUDDml
         W+ZY6Caeltc/K90AxzPkh8REZQG0Q3edk1+GcQyana32uhJAngffcADge2QpmnIJVait
         Bgmc/ER36e6lQi9M+dyFi9ZlAhh5DXzKcmwhlPzXnYiQYeFVY8/Mp/0uTX3YIV5Phgtw
         Es7h0X9aR3LkcBXmQaOtvsTgMICMvgjDo8w/KaMHReCbA5RaNjIbM332onWz3gh3Yq4X
         7qVSzxC7KmRhqYyrLVTz8O/ho/7ACHC6M1VnvtAwqbQpw2m38Duw45/8t5RVzpS+qR95
         cqTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/r/XpPLqAKv0tRAu/J7DHXVlGdjFvltX0syEGl+OVbtMlVjZO824AqwNpzxTsLdqibNTqlOXvmv0j@vger.kernel.org
X-Gm-Message-State: AOJu0YyJRCP3OQh++OY2jJ5ilBVtGel7WqBHopBXx7XPxdg8FqX65iRl
	noWRzIqYQA5Buz8FqBO/OeYjn874ZB+RyH8f6lFfzquSnu26FPM3tDhrnkrFPxPel8l4Gec871g
	bxp8kPYwxDYa6ZSq6SLuIOylWROu0GO5PxIR6GgwEDmgYy5GC7LAmBatQ+5V2wf7L
X-Gm-Gg: AfdE7ckn71tDg6ZJPHGCmgjUtXoWCKJjoM81O6/rqlvOA2t3PsyGIm9ZO1ziVOx846l
	mdl6WhYqn+0DDaB8Id8l0HiSzvTtecD0lBtzvcjW6RK7hwpItxphy9Bmkky0ZK2CPosTR58C0lv
	kPv+X99ZOYNHAstZ4C0b8JDd7u2Vi81w3LBp7UucvciMpxKaRX1Lz8F2Ei7NMgBtD6b3C7454Cy
	aeL+9LWZG19w0ReQcS1fdgEZYRgXy+/0ZEvNaLJ9TB0YTfoCdiD0yLNO72pE2N301bjUSGbCCxf
	PLafRENiJY7haleTkY31I/KqI63/u3CIRFp5vhlx9q5MLVEntee2D+7NsTq2VTnpK19+A5B+nDz
	5e0tPyRwo1Wwuc4ADecXkWdJwmEJ1E72ehSMGRMIPVt4dhPXetSwuhKWsMKCdyHSgvgnxKWFTxC
	XJPAt1avDwsilVZY86Xe6Xb0d2
X-Received: by 2002:a05:6102:3587:b0:737:4cac:52f7 with SMTP id ada2fe7eead31-744e03ca7b8mr4451561137.19.1783604550481;
        Thu, 09 Jul 2026 06:42:30 -0700 (PDT)
X-Received: by 2002:a05:6102:3587:b0:737:4cac:52f7 with SMTP id ada2fe7eead31-744e03ca7b8mr4451528137.19.1783604549924;
        Thu, 09 Jul 2026 06:42:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:42:03 +0300
Subject: [PATCH v7 12/18] media: iris: add minimal GET_PROPERTY
 implementation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-12-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5856;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AcarJ8y6fItqDYFBNoulW/dCUfTPyc5q6YcY/mcFEuE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UlxjWHYnkySMwF8AvZYYKzsYGpeIgVsc9MC
 KkaP8NBaYaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJQAKCRCLPIo+Aiko
 1WmJB/9UByFCWF71Py/SElT8mCy5TZlaHiOxXffd1pR0ZRAjYnjGjBtz8U5TJhHTOuHmmDEDvbl
 7N4oY0wVlJ8umcrnKIZ1M1se8ntW8ijuDmNvjkQgdQFniY4pxGZWFglZgVu6qq+4/JRWMKld2WU
 Z5IpmE5PVVyws97ZQ0A/SqI0E1VjrIOMlk0K5s2JvfsJUH+xKsTqavRTdapaNh5v5Jtg3sT4ENa
 zLesLWr//v5wclnrXtxT2mFj1KEv+Uxb0ZUp5VuuKdhOsDGQJCGb+oCtMQTfE/wHMovmMmvLXnZ
 4wEhrXaG8NQQZIxPOpOjz9CUogeFtcSL1I68ERXDcr9BMDlq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: UARy9sy3uAfuV-1Ok1hjvsAbLP30HfjH
X-Proofpoint-GUID: UARy9sy3uAfuV-1Ok1hjvsAbLP30HfjH
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4fa547 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=O8_DsgnrxEnowPJBzLQA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX+35e+5gNd4wS
 iX3Xo+hS4J3CdyecGyYMyQUx0xv9Ij0D4oGm3rYeVq8KAK7Lk68MVv+N/+ElQjQv/M7AWCvuxGx
 zvr8UD8prdck+NzSTIKYD4nQFrrR1xM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX7TWa4MJ6V/jp
 W0zfNNXu3qhPASbxyX1a5RugShzkF/6vfFuaG0rGjsAV86gQhQpWucXp7nogKaeYlAkmgHLJbCA
 hr40W3rV/usUrPBhXcnhs3M8SHZen28/3bG1sxFNF00JVWzB1DjHqRKFYuLh2OsF7MVybWHkNsO
 ygmyehPbwoDBp9aPiejYqbvMXTWsPkP3HwqtVinv6RWFClfaFCnWVKVolHHGv+YugazefX9v8xb
 1K64AtePTFRcvXF9WUH9kKvZJ4NmfEC3mRwHLnKN7tbgeVkIDKBPgTY0lc3J8jspO5eiw6CAv8w
 0OoaGtpjBe7gy8RYYitQTEzsLaYvyAP4yzOHh5xwkijYtZAxm0f0Ke0x+yBdvI1D8yJzey/PMUx
 q8mzSyTUh9Uq33+CahSp7fL5A04x4xKpX7Z070Zk2+GmkFgjlr0+zbaysQYe8q06k2rN4GxH4lg
 BWin4nP3PbCjiVOYzQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090134

AR50Lt with the Gen1 firmware requires host to read
HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS property, otherwise it doesn't
update internal data and fails the HFI_CMD_SESSION_LOAD_RESOURCES
command. Implement minimal support for querying the properties from the
firmware. It is used by one of the following patches, adding support for
Agatti.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h  |  1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c      | 21 +++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h      | 15 +++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c     |  6 ++++++
 4 files changed, 43 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index a27447eb2519..16099f9a25b6 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -121,6 +121,7 @@ struct iris_hfi_session_ops {
 	int (*session_set_property)(struct iris_inst *inst,
 				    u32 packet_type, u32 flag, u32 plane, u32 payload_type,
 				    void *payload, u32 payload_size);
+	int (*session_get_property)(struct iris_inst *inst, u32 packet_type);
 	int (*session_open)(struct iris_inst *inst);
 	int (*session_start)(struct iris_inst *inst, u32 plane);
 	int (*session_queue_buf)(struct iris_inst *inst, struct iris_buffer *buffer);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 7674b47ad6c4..99e82e5510ab 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1117,10 +1117,31 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 	return 0;
 }
 
+static int iris_hfi_gen1_session_get_property(struct iris_inst *inst, u32 packet_type)
+{
+	struct hfi_session_get_property_pkt pkt;
+	int ret;
+
+	pkt.shdr.hdr.size = sizeof(pkt);
+	pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
+	pkt.shdr.session_id = inst->session_id;
+	pkt.num_properties = 1;
+	pkt.data = packet_type;
+
+	reinit_completion(&inst->completion);
+
+	ret = iris_hfi_queue_cmd_write(inst->core, &pkt, pkt.shdr.hdr.size);
+	if (ret)
+		return ret;
+
+	return iris_wait_for_session_response(inst, false);
+}
+
 static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
 	.session_open = iris_hfi_gen1_session_open,
 	.session_set_config_params = iris_hfi_gen1_session_set_config_params,
 	.session_set_property = iris_hfi_gen1_session_set_property,
+	.session_get_property = iris_hfi_gen1_session_get_property,
 	.session_start = iris_hfi_gen1_session_start,
 	.session_queue_buf = iris_hfi_gen1_session_queue_buffer,
 	.session_release_buf = iris_hfi_gen1_session_unset_buffers,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 0e4dee192384..bb495a1d2623 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -35,6 +35,7 @@
 #define HFI_CMD_SESSION_EMPTY_BUFFER			0x211004
 #define HFI_CMD_SESSION_FILL_BUFFER			0x211005
 #define HFI_CMD_SESSION_FLUSH				0x211008
+#define HFI_CMD_SESSION_GET_PROPERTY			0x211009
 #define HFI_CMD_SESSION_RELEASE_BUFFERS			0x21100b
 #define HFI_CMD_SESSION_RELEASE_RESOURCES		0x21100c
 #define HFI_CMD_SESSION_CONTINUE			0x21100d
@@ -113,6 +114,7 @@
 #define HFI_MSG_SESSION_FLUSH				0x221006
 #define HFI_MSG_SESSION_EMPTY_BUFFER			0x221007
 #define HFI_MSG_SESSION_FILL_BUFFER			0x221008
+#define HFI_MSG_SESSION_PROPERTY_INFO			0x221009
 #define HFI_MSG_SESSION_RELEASE_RESOURCES		0x22100a
 #define HFI_MSG_SESSION_RELEASE_BUFFERS			0x22100c
 
@@ -205,6 +207,12 @@ struct hfi_session_set_property_pkt {
 	u32 data[];
 };
 
+struct hfi_session_get_property_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 data;
+};
+
 struct hfi_sys_pc_prep_pkt {
 	struct hfi_pkt_hdr hdr;
 };
@@ -574,6 +582,13 @@ struct hfi_msg_session_fbd_uncompressed_plane0_pkt {
 	u32 data[];
 };
 
+struct hfi_msg_session_property_info_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 property;
+	u8 data[];
+};
+
 struct hfi_msg_session_release_buffers_done_pkt {
 	struct hfi_msg_session_hdr_pkt shdr;
 	u32 num_buffers;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index bfd7495bf44f..23fc7194b1e3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -591,6 +591,10 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
 	 .pkt = HFI_MSG_SESSION_RELEASE_BUFFERS,
 	 .pkt_sz = sizeof(struct hfi_msg_session_release_buffers_done_pkt),
 	},
+	{
+	 .pkt = HFI_MSG_SESSION_PROPERTY_INFO,
+	 .pkt_sz = sizeof(struct hfi_msg_session_property_info_pkt),
+	},
 };
 
 static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
@@ -652,6 +656,8 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 			iris_hfi_gen1_session_etb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
+		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
+			complete(&inst->completion);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3


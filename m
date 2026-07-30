Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02045449B22
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424882; cv=none; b=jtwnZm+liPFQ5O1caoGph+q7eUYUEUyduZ41RhvJspmCcC01ZLzRUVRD5ux6HdM13ZKQ1ZdH7ShuXPOLtLkOhL6qjzPR+Fewqrj5UFlyNx8XHaJufUvFNPG+qmZeZMGRQFMrgbcYYmlttGzXLQ6AKwleqJGdsCR/eS4AH12bVek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424882; c=relaxed/simple;
	bh=AcarJ8y6fItqDYFBNoulW/dCUfTPyc5q6YcY/mcFEuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UlmFZ2AtEih5tX3CExGj/SafjAgT3bdsHxF7Qy3WPrfF7LHfbg9yuIVE/FYcueW3vXL0j30gR3EQxACsSKmqavyEgwNrcDvpMcEdJV6nsB5LYgcv0nI0lOWc5FHF/BL6lrjv77xn/NZt1OIejFKrodzdlYMHEpDK124L6FRH56k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c2pxOhxp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bkpSqjDG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c2pxOhxp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bkpSqjDG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEiVVc986877
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YR3nkRbALzgkvoB1x+4K+kKOljE1sovDhHcQK6EVdCc=; b=c2pxOhxpqULCy5Kl
	h9ShNpLO25+2pCDv93/u2pKCbFzgoGuKWf4PIDPQM++xzV8jnKjUrt/UCYXqfmS9
	46VkIF5ydqY4nrYpr9TosMmp+zjOdvulDgQbWtQdkz5NfzPuRcDzf7myYShqyER8
	m3C5YwnOTtiabWuZZ6Wni3Y8UVB/BffwRLsgDzok/nGPVaZk+mA4ln198Zecapag
	EKjvf2Mydvymmy6sIjTdpa4/cjnQOOfO/+JQ7AygFDl7uXTKfZoe/CdFh5VVGnly
	ev4mrrkdk2jJECL/2liyF1CGFsehHMUDNvDJdCCD04iBqXkTxG+hoXMhUvG6xTvw
	iZbuDw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n386f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:21:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d30035dso19056341cf.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424879; x=1786029679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YR3nkRbALzgkvoB1x+4K+kKOljE1sovDhHcQK6EVdCc=;
        b=bkpSqjDG0gEyq74zDHNxejh2DnijjF/g4siZH+dSOo4G69KKN4LNXrk8RK9778rU/y
         Z/4ECZqtqsfADO4JjtvvG/Y6eqHAte5BsWpdSm6hro+58or0GHVl5P11Pv3hJMkgkRho
         kgQWWWcwXupI2wWBYOqxaeh3dFIxD0DpGrpC2waEdjmpDRPKubaj15y8WL/12Q5CDROc
         z/yHKtkE9t7U5FUAt5nAVojgx4HnlK/8cXIeQ+/xUArVTU3XFfFCEpVAItKQdylKuciw
         H0vvtF6RvWWedLMij9oMfJEvp+29udRLrm8BPy2mAHSn0sMGGPaVQ0yacyxfjmsZmltI
         Fy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424879; x=1786029679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YR3nkRbALzgkvoB1x+4K+kKOljE1sovDhHcQK6EVdCc=;
        b=pZrkoxYUYGvFc8Uu/K8Nn9FmecBOD9tXPUKWPirxaSXA6ZuPu0ZTRLXzx/+W6DyPUd
         kqCFsYr035ew1LSyP/ayu1Yg5pjWGzCdLalenWOHxEqfsmSwMhDXZoFJycuhN4zkyOZq
         HBIxmZZHDB9s3hKc498p+6I3UMYvKeSM+OMFN8ZhMFK3+8pDUJNUh6DByYRVMoi6EJoJ
         ypyVLZxcCyRaPTLMBkdfRnwZTBI29Gh/pN+YhfustHE9hn4bqInwDHKwrXfrEdGgPnlT
         x11+XvrOgLG22bQxw18eY2YNkFl1yvRlC9LxzBIaJlSeeg9U2WmHmvnA8BLGSl0bNxHQ
         1ruQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPibBtwxcqQYfcqNON3YaxKujIKnoDBo5AsLzAolJmayqNx2Zpj1SMiJQOOZW/YJcgGnkLkOxmERWA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8KtLYiIBPZ4f9paBVrPVTCXkxWVH0rNnCLzZMeNidfbcNlIaZ
	zAtfpQQGjxj3tCINuvUnMiHict5jWroaKEcvhtRi5J7yli5mQNxisqRVDSPn08R8oAEC/dh9uuA
	RxbZ3+BlEZPv53qDQ3KNew82ufVCwRe8aU4trYV58HH8AolLXk124ekaf7xfjoxqw
X-Gm-Gg: AR+sD12HnyeF4HSNin6yxNeFZnhVN+Jdkbwp0pCDsqqJOhNYh/lYhJty2pyhYVUC4BB
	KGfBLjKv4xGVkOMZ8nfCQU57zSFigdrzHQPsoA8OVawjdjeOX2WrUSAbtvTRJW6MKwrnOWJ+1MQ
	P22r3O/C03/OYjxMIo2wfoWhTt1D1ruLEDd3k8VJG+E1AfI+BVbdZeI2iOoncGadmA//u5kRd2k
	7uKISz0pmFapFZ5VMj7HpbUNNo6d4o68+4g/hsm4gMbKE85TFcZFsyM39fcs6m4LLalG4xTcALD
	vJAASYCp429aPFwsW76ayEGnQuHDfSu27dkaPHyUN0g2HNSoDRkvRmTujX7pJ+EX88YB5VohRo8
	E0x9/tVjjO1pCCfXxKzv31aROn1PqlV3wrTxvQTeCix1CheCWwm7DZotpPM1htThWsKely9rVrB
	A8t1VqleEOZinLzQ==
X-Received: by 2002:ac8:7f45:0:b0:51c:10e8:ac7 with SMTP id d75a77b69052e-52b384e0552mr31780411cf.37.1785424878883;
        Thu, 30 Jul 2026 08:21:18 -0700 (PDT)
X-Received: by 2002:ac8:7f45:0:b0:51c:10e8:ac7 with SMTP id d75a77b69052e-52b384e0552mr31779991cf.37.1785424878412;
        Thu, 30 Jul 2026 08:21:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db95aae1sm420927e87.37.2026.07.30.08.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:21:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:20:55 +0300
Subject: [PATCH v8 12/18] media: iris: add minimal GET_PROPERTY
 implementation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-ar50lt-v8-12-6597c08cea6f@oss.qualcomm.com>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
In-Reply-To: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa2vSrRw+Sp5tLwzYmPE6pkuAIvyWfrkxHeDPW
 Mchh0Uyt5KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamtr0gAKCRCLPIo+Aiko
 1eUgB/0Qn6o2TyAPdL0W9b4tqpUCSrqUHduSSsGYDXBzi87Lx0gKHOdTS10OW+TwKGPQTuBPznQ
 OTKZtbhG04PKKgARg0weoAasGJA9XKE9FFgs1ILmYHDuM//YgPXpyVWpjypR2t7tzZN3yJQD8o3
 leGMpKebpbGqJBPY+8EDO2LFedXHVoHSDWdFSctJ9G94s80OZNJofBO/bHnPSahHrvqn+I07C/f
 01BmqSGYa2uXdUutTCzKDzjFYhg+TMrV/2+7AiRiGVCLvs2XSVee6y+2670KV9iwyPnTE/5aHjs
 ToZ7wIP7mKcBBzsWTQm9lYaQ1kgnfhsWF1WA3Mj6+QiTRbYw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Ar/eGu9P c=1 sm=1 tr=0 ts=6a6b6bef cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=O8_DsgnrxEnowPJBzLQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: RCz-aIlqkg3rlyzOy_TLVLNShmVnLiQI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfXxj+HoqnY3Ozd
 dVPc/nq+dSp6auUUW58igErDpPOlAA+pqi0aSB88JiGGMVC54hzJbggTeEzxBV6yj/UzqKRHDjT
 XHqxPcboroguQ/dBYASXRxvYnSmX2EtXb+RfFyvzmqFYUtp6lVBNbP0VeBySy8Q6RLyR631514M
 jGd6cWzmhR5MgHd/YCXTi290e33rOHAeXYiGoZFC20c4bnHEE1//1bELTzvTAoDD/f6SAhrHCkp
 cbnEjHBbnB0m2Fo7K1gwQ/8gHWTEU1ay+DtmxqtjJEQzcQiWivKLMDHVawivhKOrEPyR9QEA9AQ
 RCCdjpdBOW508qH+jgVcb3QL7xPOCPIFeUHOpHsd28NWU/CLL4+Cep1LOWD16KOsODU61dYTKrA
 ZXFrKVInBuVcM7lRGlb1LLUH7YCvfg9fMqYHkrmYdrKKI1OwhHOrClf/NikRYflxbVdofRSq7/t
 cejiJUoq4cemSu6Cpyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX1C4psThQaA5y
 mvSZ1AxEIyafLb9wi3NtD5vkFgrG3xe9MHkezkURIdkazCsHx0KYkYCVBanc3KvkRTH1xnB+t/V
 jI1wUg05xiNuGq7ZQQlguL7WRLKNj6U=
X-Proofpoint-ORIG-GUID: RCz-aIlqkg3rlyzOy_TLVLNShmVnLiQI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300116

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


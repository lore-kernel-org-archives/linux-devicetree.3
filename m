Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E31352F85
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 06:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136159; cv=none; b=lTx41L5fh7UJO8cfBEk/4mcbUGWc+z3l2Tj/rRiHL6DHOYmVOoi0V2R4EvJ1XVc9Lr92tkPlgPkdgvHRJFU/+Iq3KWsU3GqLTn/vS64jKcwGjw4g8E2zxfJlmq8NUDd8K9vvf3/GgNAxQfbI0VLIctM1g8xUAbLIowS/KVbPmNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136159; c=relaxed/simple;
	bh=51abVJLmqPXnrz/IkKiqyklTNSZTZj3V8WGdms5cxdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IYZCgVTJuQwTeg1x3EguPK8/3k6IqYNjMrQgnu0vFjoOfYy+0Ju9XhXp1BdfzUyM0Mj0X/ZQQc2hwVnUsazv4KZ2TIVf4uNbQS6MwIPJoogoUx51HrTnrtHEjEhM3v9BGwVJN9bdd7Y96HKg1xEleHBHddFDa067khNJdjPow2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fUzPpLSR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6VJWXKy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fUzPpLSR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6VJWXKy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64744Gtv151176
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 06:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=; b=fUzPpLSRqrvMJ+rc
	0DaTs3ZDEaxIrzc1RwOOYGl/zeM9naFf2+ZYaXU8YGISzQ6jUCRa6nCXKsn6r7nx
	7cSKwESeHAXZhDi8jfmIuxTkId/a218/R1BGoCUTPfsr3+c3UeYZvXPZdh77hbXu
	/3h58KJwEGyuRqssLAr0cJ68I8RwHn/FFeTxNl53tNcGHOibLkRQhzN+l4mJvdZZ
	OoafMlUi1PJKQsJ57nJQL8/B9EAKHwlb/0IIExbqVTnfanaLFCbr9vNc+60YCzry
	ZM+JuKXugNbqA9Mq2mjKu4TIva9rBLDQTPPTlXu2amU87j97dzM5mxb+G2vrun8m
	dPQ8bQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctrgf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:42:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8ed08aa4so15873831cf.3
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 23:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136155; x=1778740955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=;
        b=R6VJWXKyCpm6lH181R/EaTOi6u6pu2vfELAii4N/mcMxWqYfZDbEOvaDlkOEP1Rg2K
         RW6alGXqq5ZDLX6uFA82ZIBKJRs7TmRQBvjiCGAZjggrcrkQLAE2vM6RLBIU49SZ/p7X
         2iw/JxVsTo8IFjPbmCdM7K2mAmTBvxsJpnt3OWYb8yET30lvBWB4PYyfvMAoB5OlVnAo
         viGaVaAgVIln8z0d7PlFTb8PvsnI99IZM0sX/PEGrlCiNYSPirVj7hTinUho4j2w6gkq
         qdB8IpJDItLlCUlmy24GGKuYE4KoT8Xw16PxLcnceSzyojT6f5U+emMJnw4Roh6Y2Pq8
         H/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136155; x=1778740955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yVW7PJDNqNGBBo4tUTiap+vPu+AjRGuVR1+5KXJSqK0=;
        b=moRJEj+94Cv56QUJoitse/mpGkvXgpRyglKwQd9GgREsU2+LNSX2u7l05ZEtuyy6pH
         5SD/FopVi6TSd/QS2iQ6Kh4wkIjupV0AHZbvUVwsw2n+0cS2z8oe3IFG3a7OdNDlB4Bd
         rjZtJV9ENuR4RJBSLW0cQ+J2S/Ul0ZO4YaYrxxjLwcq93DfeH8XYTFR5FRiPYldubOZ4
         jrxPPyJ6Po9mQZni0f73N7xXLDphQQx8Yjz9SFN1re8kZbKjX9ovrm+XZMsB6EoHpwe9
         i6BHRGlTYlY7+pNfK7hOljMMR9qJI4A4KdJniBEsPu6gou0CtvP1nyuTet1xNJ6HViur
         4ymg==
X-Forwarded-Encrypted: i=1; AFNElJ8LtTN2oY0DZN0/5ztuhnx4lU1Yy7qxJ6D7NJ/NkkUFnvH7wpRSeLT3sMSMNcRRPsGVU1mFogQHmR31@vger.kernel.org
X-Gm-Message-State: AOJu0YzBpsah42Bu6thrgRY8oRHmh8A4XCogKC6grkhp6HtlALfshBlA
	FG1vk32C44SPPZvyHjUJHLQO5+oGZ8y0Nzr9W963OkmtT9uxkGHeBPATSWJfQrS5GPj04hZNg+T
	GzcOmD2+1AmvyZ9NX85oUs2iutsX152iKV5Pvc8H7eZhEIJoPBK0K9TDuGnLxGdoX
X-Gm-Gg: AeBDieu2vrYpX7+Jw9HRe0VZg/aEDtBIbpd0ZUFt2Z6+Y+yWlclXDy6VXCznlUc0ylP
	EUMM6PvBOgi3Ksq6zTKtwff/s2eosKGRLPiOUhoA+b6PvAeNEK/kFACFVE5+Vs3lsNPZkfG9mrd
	XCuytFA4AYFa/exxnJGywCP52n5XVlgEEWmlQiGYoXxduAOaBL151fvExMI8XBtbnawXfjpS8Wj
	aV2jZl3pQ+d8YG8A4HdcK1wnRoxImpqnyZFNXQgNGzMlMuLrkyMjXy01UR6GropvYtUgLHS4MIJ
	96RvkO6VxXRGQbqp8zLfPpqA0ky2MXnG7A2+CnC7CbNvW3e0QrWoptFM+oO7EP4VROO5cH0/1PO
	iAiIgEDyWEIV1YMlNmEztWKsAoZEp+2yNyklMHU7IdgRd/13LQZ4tNT9HM9dbY6eL8HtCBsCoZu
	ACGRx019jR2qOWm3e04epg/l61MQbIe5/S/mzc7Dg+MGCP0g==
X-Received: by 2002:a05:622a:5a8d:b0:50f:bb01:9867 with SMTP id d75a77b69052e-51461e6a460mr83758711cf.25.1778136154747;
        Wed, 06 May 2026 23:42:34 -0700 (PDT)
X-Received: by 2002:a05:622a:5a8d:b0:50f:bb01:9867 with SMTP id d75a77b69052e-51461e6a460mr83758411cf.25.1778136154310;
        Wed, 06 May 2026 23:42:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:11 +0300
Subject: [PATCH 11/16] media: iris: update buffer requirements based on
 received info
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-11-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3369;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=51abVJLmqPXnrz/IkKiqyklTNSZTZj3V8WGdms5cxdg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ+jdsV7MseOwQW66yLMscPcOnhnVEdBcQ8/
 Ny43XpoBfqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PgAKCRCLPIo+Aiko
 1Ww4B/4mPa5QArsW8v3nUUEOi2w9G3VC53fCXjBZ1EptaHH760eARJhIKJmeMcfonukah8u/RT6
 K4NgZvc3vvXU4ctgHBqqfRxtW5Mwkf+BWnXlmUJH3eICK+cXuHNsIhIqjjRAdlPXyve9U4/dcjL
 +KAzSrlKXNQKNAUaQ08eZpETKj7rgyzSSM19wRi/yreLPt92iwpJ9m1WJkzrJx+ZUwzOtFnWLjG
 aC5OYKf/CCiNxPa6XhaoE1T6fbN+vV9IZsRg7O8ZjG4G/411SipsL1UGsRcmLAEWkQaUKkM0WOw
 JFbPHWDM+bZxzTYeYyAOcIWXR4QaXLBuu6r/Yl66+xfwlfkh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc345b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=_TRJU0tGboi39qq34nEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 0z-ssuhICsuFgxLbNZgXRdt2dOrFYjQm
X-Proofpoint-ORIG-GUID: 0z-ssuhICsuFgxLbNZgXRdt2dOrFYjQm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX9Q/aO/OOxvWp
 VYGmjGIHptsVyFtdqEg6zmeecfvvqxwoCRMXC200jXGmOSDaZBmi0/N0novDuEikUQIy9qf9W+E
 6gkvYDBBC9asrAgrP1wIN+iwcm7lhxNQLTwnVhwLOzx+Q0vPQv5IJlo24m1BFWayqGMMab6u2kE
 Q1icY8G2ccODiOAido7ZpPMqptBoUIs/aVwi3JWNjItcjgr/aEC3zSjX4NZX+DpTlsYzZtv/K6Y
 qMcvy1cYXA7oW2v9/Di1CQKYT3sLcb/PFtbiEW8yCIYsKoUrK+KZe5xBKBsG4iWGrKau3fUBQJT
 Z6V/M4a6RvT//2ZTqoLb+egaUMFBlnE8Odab37WpBQ5gQlFt7IT9EHZjfElm8Ln6WcEli9cUeBA
 3jOo0RV9QNxc//kHNYwihZG8uyqlYsQbxLCo1tvwb7G79RAu00FkQeWgAGJGjreuJKnYxf2tl9g
 nsEc9nUjbPSnwGZKRQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070063

Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
driver should update buffer sizes and counts from the received data.
Implement corresponding functionality updating buffers data. This will
be used for upcoming support of AR50Lt platforms with Gen1 firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 74 +++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 23fc7194b1e3..ee996eb1f41f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -533,6 +533,78 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 	dev_err(core->dev, "error in ftb done\n");
 }
 
+static enum iris_buffer_type iris_hfi_gen1_buf_type(struct iris_inst *inst, u32 type)
+{
+	switch (type) {
+	case HFI_BUFFER_INPUT:
+		return BUF_INPUT;
+	case HFI_BUFFER_OUTPUT:
+		if (iris_split_mode_enabled(inst))
+			return BUF_DPB;
+		return BUF_OUTPUT;
+	case HFI_BUFFER_OUTPUT2:
+		if (iris_split_mode_enabled(inst))
+			return BUF_OUTPUT;
+		return BUF_DPB;
+	case HFI_BUFFER_INTERNAL_PERSIST_1:
+		return BUF_PERSIST;
+	case HFI_BUFFER_INTERNAL_SCRATCH:
+		return BUF_BIN;
+	case HFI_BUFFER_INTERNAL_SCRATCH_1:
+		return BUF_SCRATCH_1;
+	case HFI_BUFFER_INTERNAL_SCRATCH_2:
+		return BUF_SCRATCH_2;
+	case HFI_BUFFER_INTERNAL_PERSIST:
+		return BUF_ARP;
+	default:
+		return -EINVAL;
+	}
+}
+
+static void iris_hfi_gen1_session_buffer_requirements(struct iris_inst *inst,
+						      void *data, size_t size)
+{
+	struct hfi_buffer_requirements *req;
+
+	if (!size || size % sizeof(*req))
+		return;
+
+	for (req = data; size; size -= sizeof(*req), req++) {
+		enum iris_buffer_type type = iris_hfi_gen1_buf_type(inst, req->type);
+
+		if (type == -EINVAL)
+			continue;
+
+		inst->buffers[type].min_count = req->hold_count;
+		inst->buffers[type].size = req->size;
+
+		if (type == BUF_OUTPUT)
+			inst->fw_min_count = req->count_actual;
+	}
+}
+
+static void iris_hfi_gen1_session_property_info(struct iris_inst *inst, void *packet)
+{
+	struct hfi_msg_session_property_info_pkt *pkt = packet;
+
+	if (!pkt->num_properties) {
+		dev_err(inst->core->dev, "error, no properties\n");
+		goto out;
+	}
+
+	switch (pkt->property) {
+	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
+		iris_hfi_gen1_session_buffer_requirements(inst, pkt->data,
+							  pkt->shdr.hdr.size - sizeof(*pkt));
+		break;
+	default:
+		dev_warn(inst->core->dev, "unknown property id: %x\n", pkt->property);
+	}
+
+out:
+	complete(&inst->completion);
+}
+
 struct iris_hfi_gen1_response_pkt_info {
 	u32 pkt;
 	u32 pkt_sz;
@@ -657,7 +729,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
-			complete(&inst->completion);
+			iris_hfi_gen1_session_property_info(inst, hdr);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3


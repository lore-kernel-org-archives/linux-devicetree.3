Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBC7423782
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424884; cv=none; b=Js9MstV5tyli3cLkVINLpsf0/l1y3NJ90jS+dwS1eW9EhRvqEJTJuev34jgdeJBixqitQb8qm1pc7Xy+3QAQFpXXQMrETFsKs857E9auFsD1TtBCkJ7b5mSqjsyioSpcJuZfeR/HI1exAxt72/cB9yu+UXm0Ppk1sn9Vb9lY7P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424884; c=relaxed/simple;
	bh=+nqEnMHoWBEk7ejdZyFoXPRJzFNrqozZDfHTEPC98/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C8h4wJytLMqje/qXCfKuxbKNycxCGdt7rtoyyj/8ZeS8xzi5GlsWtd2RtqtLZd0baQMXHmHZRp9eFpptHquc2/7WPYUx5nWZY9rMmDSZ32Xn2WQ4EWEmd8WAiJgTGqWG+AQ4SZxcXrP+K+BS1aw0ALUW6lPTH4laFIf6dUaJvTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQd/PEbY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AfMxGa5V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQd/PEbY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AfMxGa5V"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEfgDx1117918
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n8atcCdTovpN5KZraYH+DhxjcFfh8z0wA+cOFj5dSVw=; b=CQd/PEbYpg4NiHYT
	yAxKNKscxKi8gXGOZ4OZ5hh0NITZ0OUEcK9rtxXCUjlvH1HavfqzTC4K2bzcdZwb
	jYLxnB1axqwXacjxx9lUWw1BMw7kr1waX9KgeB1jFTh6k2S9cZdrGGVAStssQKbH
	CJVUPo5jBHWzIw43oUdTZQu5HmO60gwzG/D66Vr/bYkQxRiFO0kPyfML5omiNP3T
	oR1b6qpfagUO2dNO7mTw0RdZXUQcBRyGFy+UUThhfwy6Eyb38EqOC/ETLOwfHb4M
	4VEyCwx+A5ryBJ068s5Afz4tnyNyHVuaMkF4xji/8jua8d/6d92kJpo8UIgC0SmZ
	YwgzKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8kn07nn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:21:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e632390d2so414535185a.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424880; x=1786029680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n8atcCdTovpN5KZraYH+DhxjcFfh8z0wA+cOFj5dSVw=;
        b=AfMxGa5Vy3l6SGnszIQcmRKwAch1arwYILeyAn57TLTk6WTusfrSOTIQ8t19stdCXo
         UUYLU/BC65kY3Je4l7AzYlicI+ZdvDTdl05VUp9lcgngnTiAXCEqwGI8fsDfoI6FpRuf
         0AsfN3KCG/5zIaFP/9U7dr79wVdcFPu/f2mjSGD5ERBDB30KfcRj7H9/SzDFkTKhzGZq
         I1P9ENTBuS5/UdSD56A2GzeeA/TfEgBAXPsEc0Muavr/FZFVdK5JdlfV3EP7YtR5ozVk
         9BS6BrbfROvOvvEIB+ea/UTLGnLLi5CRNTdfLvy1hm0FYS4My/mc+j8F514mK358Tl3Z
         U9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424880; x=1786029680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n8atcCdTovpN5KZraYH+DhxjcFfh8z0wA+cOFj5dSVw=;
        b=dP+bwr1CwgREo+v33MCRTLJBD7isB2RMF8Ryp3V3DWZ5FPTBpDchR1RRm/SHVVHX3A
         hbswNmBZ9aYh/JuaPwMU9EYtjs8334qBZotWlMFn51DXht9aRrMlq2dcwpXNiEwVScBj
         FmC/R+KdzbDGwznV8RWmsG7+cGrdo53SyxNMbjH+D2CeYjORne3c4ZoTmq8fk70MIJh1
         lCRW0u9sLIVOVdQd7tsi7wC8suXe+FFXrFF3+5emwgJHPuevMv+orBCNbLqiXQsIbMGQ
         MdRzAFvtHBDsI9+TiaIEdaeWCG3skMItn8qpsiXTEmHt4e8xa7Yn1AL7+JoTSYezMyUM
         idBw==
X-Forwarded-Encrypted: i=1; AHgh+RqAjdUNjFl4kCQkG2DPvmt19e031ww37ffuX0vTIx8Wo+Zkyg/bSRsd30tPjDS3vInMoeFKllm+qVaQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo8zxbkHzgD2YlccaawnFztqVbFp8RKlkfOMrlNz/GhJefVjSC
	pmJel3q3yeC/8kQ4roZp6ytxWuqEcVbqE/r6M2rKScBE/RagwpubmA4VF6cO6dYsRY8L09K/RgN
	3fLyEuVt6zmMxZpGlyEzPx3aSlChp5J+66TRTvFMteczmfdGx7SmXe3srYqoQpvL9
X-Gm-Gg: AR+sD11+VQ14ADj/SW1lY1tKACz+xYdneqlYp2iJUL63OwyP/nV2LC55SIDyMM3R45a
	mo6Z+wi911tizDOu1zMyZdg74qI2HOEuVdmRe9mHoV0YZl61zrSWYmC/jqjyk7ZZA9Ky5vnUg2U
	1cadNi52GpI2aBxVbm0NF3A+pX0HGFF91EXOOSAQIeAStxryVz4uviPGze+T1ndstpLVCf30P3S
	RaW/tsjXKBSX+O2x3Xdxghc+NmTNQe+SnXO8ZfKZ799SsR79IFUDc2K/+CiC56BKhFDBdGxzQuU
	vS/xIzObEF5B027ciiQxLDDcE/WrXH6untw7SdwCAT2dvD8dlI6Cd/X5dV3pzw4zpZKFNE7KeE4
	87m65C49+prhcp67pAzzABLEyu9cc8gdMpIaY2dMqUyx2Lq5ZIkKzcIqKhCRHLKUmHHg0ViBVhV
	vlnf4jfVZDJcYx6A==
X-Received: by 2002:a05:622a:1826:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-52b38379ab0mr33167771cf.5.1785424880425;
        Thu, 30 Jul 2026 08:21:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1826:b0:51c:2068:a9f8 with SMTP id d75a77b69052e-52b38379ab0mr33167391cf.5.1785424880019;
        Thu, 30 Jul 2026 08:21:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db95aae1sm420927e87.37.2026.07.30.08.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:21:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:20:56 +0300
Subject: [PATCH v8 13/18] media: iris: update buffer requirements based on
 received info
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-ar50lt-v8-13-6597c08cea6f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3581;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+nqEnMHoWBEk7ejdZyFoXPRJzFNrqozZDfHTEPC98/Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa2vSRvbmu/KHJfxHAeksQZo/WefxJVk3aacAl
 tksP+j9jH2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamtr0gAKCRCLPIo+Aiko
 1SUqB/sH+0hHpEMnXgW5RcPYKtf/D/NRtz2CFNzr5TQqQKptar6j6EMyJQ8k0ViJ0PSPMARo46k
 dJmjop8hBW/qnB06SEdlOfbsUQzD41knN7CqjhBDdhYqofiJGMIi1VM0QTcULBO2S7ivLRUbkpu
 fs2nvrDoPZtOu4OpCknoGSuy6/NMIQRkPJSufgO+okXHPueXv0GtcVqB/HB39COyq+6xZ5i3+dZ
 OVJMPhCbgcekJLvqqSCBUMGKRHqMwgxZLa5Lv1We4yowS/OJWVHKIPDISIDw6txVl3Y53Fw1aMA
 euKMSt4kgJeERL+0JHrOSDTNXBFmig24AUYAgwA4FZjfqGiM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfXysHxY0x0EJDB
 xu+C2vehqcgbAygh3klpWfixkBatFcpIDwA2Y/KRjqGQod6VKN6JHlpQCojEDQdfTgzYWpzayDn
 OQPQPfM6KLoekZAHspZBaFnEmOyz17M=
X-Proofpoint-GUID: sy8bGK2p60fX9ijip_uJue5nGHVNOwda
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX8kOL1nSOlXvF
 74sgFp8uGjsD91qG+d+vwsbYY2oCb4FP19IM0QCDFxNE7uTrfpU1pwAK9fK9VuOPtcZfwa5aotU
 fnhLJIOjIWEgIxAnxbp0qQVVYkwJUIFjTGK7ohaJRLV21z1wWoyFjW/8W7Ryt27Plyaponfaql8
 NQvzHMTAuAyGQrA6NFdkzO2+GnoHlUuFL/jgcmWmkskV4douYsu973ouI36T37bbXxCWXGRn6C/
 2jT2aLVHmHLPpqq/X64ka423pVX8cEr5uodKL/LlAE471Jya60QXQUq91sSxMmFEXj2+P+pz0EW
 6ywjXUwvyB8xkDiUeLaq1/3azIBbsbd09hrFSx0YSAQiP4/0zsKVfLIiJBIzKSbIm8l8jVs1C4h
 Ul834LmAn5vXE2IxeJY0JvUQXsivMEL7SLjymqfKo38bsdT7RW3EBur5Jb5n32uy47RBZf7k3JM
 WqlWrQKXYU8vA+1q6OA==
X-Authority-Analysis: v=2.4 cv=V7NNF+ni c=1 sm=1 tr=0 ts=6a6b6bf1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=_TRJU0tGboi39qq34nEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: sy8bGK2p60fX9ijip_uJue5nGHVNOwda
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300116

Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
driver should update buffer sizes and counts from the received data.
Implement corresponding functionality updating buffers data. This will
be used for upcoming support of AR50Lt platforms with Gen1 firmware.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 76 +++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 23fc7194b1e3..7ad6f0bb4677 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -533,6 +533,80 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
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
+		return BUF_TYPE_MAX;
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
+		if (type == BUF_TYPE_MAX)
+			continue;
+
+		/* on relevant platforms hold_count and min_count are swapped */
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
+	if (pkt->num_properties != 1) {
+		dev_warn_ratelimited(inst->core->dev, "%s: expected 1 property, got %u\n",
+				     __func__, pkt->num_properties);
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
@@ -657,7 +731,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
-			complete(&inst->completion);
+			iris_hfi_gen1_session_property_info(inst, hdr);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3


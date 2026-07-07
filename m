Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A244C6F02
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 22:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463404; cv=none; b=MSHtLZ39d7NHp1k8dYXCAbWlszatEtD5QpxSBgj7xXdZaYGiBlHyFM12VdvAQSvQXv9GxYrDjeeM9fHqsHfjIJsdo4XwKJcqQxucy7p0Yx0XXjPt6AZTaDY5+70GvIZQCa4GdxnXTBYwVH6KmL8enF1BVY8D8rUE3/BiQQvle/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463404; c=relaxed/simple;
	bh=W2dVe0fVWb+LITn0jPBAVSZ9TKoQzF7ls/oQCbnHPuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U1ncgiyu4Q3YgYODnUM0+S0rc0XzHLEL4OABiy3H3HmSJZj/BRFeMHiJ054MbjW8q3EpK1DTMxr4BLQWKuy6o9p8gc/FIUxfV4NdU1YVPOXFBbku29mwwHpYA87RmJzGujD/8inqxgINTPaecTFBvpb7SvB2H8wWbky9CpgCBWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUP/KIf8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cKiPvfA3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUP/KIf8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cKiPvfA3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5ZAd504944
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 22:30:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eI/ZKCPkYisPDodHq1wlbUBytByuKMbfYXXpJP3saUI=; b=jUP/KIf8MT2kAWP2
	Kadu3iSAU1JlZ8FgYQNNvZpX7mLpKKQnhfDEAEzKD+M0pLxZlcKTfCwU/TchrpL5
	4NM4XW+U66+bVlaFCTcaVGxpMgq/rrdKiuGHmQf6pz9MUYh3yAu5/A/ej7yiaHKX
	hwO6y4Rz2uk27K+76W18pQs9arLpud00Mgt0l4RplGqj4DMrefiVuqse3mxwiJA8
	ab+q4aK1SUiTu4bPSiFzneegyVMPyFZbfrgoBZiozkPpF0nXNTgCEuSX5ZElH8M4
	lT61fQ8plrOUijhWhIb2NzV5kmHVEv9mHWntbOBBAg/8QQz+P2WwiZx/YlSZDsYm
	0sljzw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vdjc0u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 22:30:01 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-738d9935e23so4665137.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 15:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463401; x=1784068201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eI/ZKCPkYisPDodHq1wlbUBytByuKMbfYXXpJP3saUI=;
        b=cKiPvfA3HAuCjjWKm/oRxvPdrv04DR89XorW6LvFpzTUd7kyHSSlGCtrU4AHRpcQ26
         B0Fx2F9ghu70HnsGmxNkW2a6q+BP8ULRnEA0N+ZGoGlOhNYZ+HxrcgPRWsqBd2C2mKFk
         ICiVjPwOYyOi4smsAQktYIdVYZefUAMFAzM8hGLkhiAWwPuF+S8H1YrIxdd5UVx48ac0
         paYmsXkOksEN36nVyz9ZGeGZJGheb82rQRXVIZttppBi9SnLaT2iRqd34dh8wMNn8tek
         qe02qoslR9YHjRdqsl6O0QJ/rklCVzarliqC+MI37W/wREeV7axXIsAGUd09q7oftj+g
         iczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463401; x=1784068201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eI/ZKCPkYisPDodHq1wlbUBytByuKMbfYXXpJP3saUI=;
        b=f2gk/rEKTYTR8z6OILuJDCxT7C0aMUERJYGvtwEV1V2v0Jng5oaPb6IPqXXNyeF53k
         S96wDn/hQvvVhu1wRWiemsI/1b9iCxEGNP1n5w9jeJkYHFU/0WAQRHZHYB7DYGmEi3/i
         rkZV2ib1BuVSXNYqK9p2uYObrTsSc7yoR+ltK6/zwFr2i6wml3/QSpwU42r83hEdAIcp
         XP2HSstgVRiZLJuyJq2CIROFot1e6j0QgT8cviaejB80EESlpuybGZLYzQG58HsVFPLy
         W9RLN4vgQthluIFLlR1FXf2Z1j7rU6uTgETUPz3TIF2vjnfkO/wCkOCcTemxMlhl3l+u
         oXNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8XmNvV2qNfCF3mj9AtlcwweXifBJwxj5n/YLI/59z5CNy6Q/Bur4pNYOJ1Vf1YXCXryNYG3/8wr/V@vger.kernel.org
X-Gm-Message-State: AOJu0YwpO+qs8w9AgwmahPWHkKMs5qWTQ0z9HQxTMjFzbRjUiw2+HJCQ
	yAP3B6djFduI2IEDjC4Oio1bWUmzkWqFoefcB+fWyN1mYb9iBvoEOsKyASaUU16rtgaPetKYqW8
	DN2i8KrLm/mm1P6kGvJKXOHEE4rE6yAc5nliUhtPLopUi1VxmCKUOz7D62BjfV0Oa
X-Gm-Gg: AfdE7ckIx3tFI4vhk7CYs1l/n5RIdboFbRUZzBFkZo1kt1UpBoxgyAUR9StSD8pLDET
	hdDCqWCdwqQhrUOV5FHHk0+Dt6zn29wS+FO+jNu1l30QSwHNOm2L8aTVtGH3g3ftWcDFAEkTb7A
	rp54YvNybpfHx2pge8VbgjK9Ur0WjGlhVQJ3nO/GUoGwWLSfb4ZRbO15DiG8DCTnNjz+wG8iKeU
	w/9nCDqhEji7DZIWMxjjsUp4gMlSa1ZzLUHKxY70LxUWBeJWi6Jii3wolUGFuadFSAJsghqTxN5
	rcPOcj3KhWZizvAOn9b7CeWJtXLFDEHaGwBWn2NS3l/syWeHCL+d2mve9MCqt8TGNnSjgAHVyq3
	5lKrgYKP3xVpC3uO+w4NVRLgfI2BHE+vC751BT+3HSz9g8hWT09nXBPIHJSD0dAfB+8rUp/Uefa
	Uv8mY3WwIHvmazp/Y3YrkYl3f3
X-Received: by 2002:a05:6102:560f:b0:739:71ef:d772 with SMTP id ada2fe7eead31-744b79c1c70mr3985608137.4.1783463400762;
        Tue, 07 Jul 2026 15:30:00 -0700 (PDT)
X-Received: by 2002:a05:6102:560f:b0:739:71ef:d772 with SMTP id ada2fe7eead31-744b79c1c70mr3985591137.4.1783463400216;
        Tue, 07 Jul 2026 15:30:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:56 +0300
Subject: [PATCH v6 13/18] media: iris: update buffer requirements based on
 received info
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-13-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3501;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=W2dVe0fVWb+LITn0jPBAVSZ9TKoQzF7ls/oQCbnHPuo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2q7845qm/Uf8v165MKTXEeTINPIkA7vo57a
 dJHue9HeFyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qgAKCRCLPIo+Aiko
 1WNoB/wJ+1eWutbgXKoYqkq5JxJ39sfo0zDjQ96MHAyYPcc0rYrd/dXEmx3bLx9JG0lcsSCgNLY
 KcrOR+YoXd8PUYzgwJhhQ8g3rElxTpEXy7JnNstJrEGPcBvW+rtx0QXA6JMkiWhhfWDHd1dc5AI
 Rt68v4yEUcxZyZbQhYCGgB2qJsUXpZJc9l/mMWMUJ6jZ+Zd1vA2+VwQaNHPyFTdBMQHGHRxuBtm
 cYLOP4Cc7QWZSJ/lW3eFIXDR1/sGDgxPCCk8YHJsV0eC4nZ+GUiIv/dIfiW/eIEALz56yuJrdW0
 Ltpu2VJHn0e9qQtEI55ExoHlUWu2GXIL6YwHbEVxEaTMWuiR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=R7cz39RX c=1 sm=1 tr=0 ts=6a4d7de9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=_TRJU0tGboi39qq34nEA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: CfpJ2aAJR6kLGcQUSMSiIMtncc2uVVnF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX8cKj7A+L4YqN
 Ojj/pmaAOYEtmdFExIHC5m9P10egZ3b4LTavSUwJYIREK6SDdC9wu6IreacH3HYea5z10uhjxMz
 DhhNPupbGFT3eVL4dq7BEH8e2JYrhXxo6kN2eCDBZs0U57aMHlYCCf93uzDp1B0XULNIK0rCWgv
 PMnwmxWBd8kMUK5Yhav5/ZSC2Sh0mhVo0+eDtg5juy4juFKa8nlBPFI5SV+Bzrly72U//iHu5qG
 enCpF+ogyMDOXiZpKR0wEI4Uf+Nx69to5zD60clUpYDQPtyxbLLwqwGf8ZpPpBKltHKKmP5NRDG
 CTtW8fOT67gmDPvgciKRLxPTeWjIEKySg3wETbTkSQ7UoahSiy3gOroD00YeAzvD3ciP2fEuXlf
 LbJT1btsZCtVDM028F7HfgkL6NUuRg1YQa34B0KhQUDqYKAk2AxtgsQjuMh/Dojx0aB2pdMHAmj
 wLqJ1whFnQpXA65EamQ==
X-Proofpoint-ORIG-GUID: CfpJ2aAJR6kLGcQUSMSiIMtncc2uVVnF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfXxy0kq4t8eBa5
 syrUURKxho42LwZksJJM1G6cIBvMnVZ7235QoOWavh7DrQczG/01QqtfFE9ZJjkKrmHAM0QI1EF
 YFcoHtaV0FJakpCcNdfWoXvXtFxXgGI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070221

Upon receiving data for HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS the
driver should update buffer sizes and counts from the received data.
Implement corresponding functionality updating buffers data. This will
be used for upcoming support of AR50Lt platforms with Gen1 firmware.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen1_response.c    | 75 +++++++++++++++++++++-
 1 file changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 23fc7194b1e3..896953ea62ea 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -533,6 +533,79 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
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
@@ -657,7 +730,7 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
-			complete(&inst->completion);
+			iris_hfi_gen1_session_property_info(inst, hdr);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3


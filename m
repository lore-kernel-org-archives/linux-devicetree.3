Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898251;
	b=M1PViVFuKsblXizHMSBo6YC1tK5qdDqzz66pN89K0o8Swen6p8oNM4LqXcAVOF4JDSor
	 3S1C3v6pIuRfkuJbLh7FVAvTxMbnpkVs+vImrsLFp+hYGogtAV7QFRySWxwC+RyOrB5Na
	 NAT97Rbu1jQ/aSGaYpRFTWwGZV8yRec7F3EUzBYlETVDOxNsbyR3qFlIJfuDmVOjhsccd
	 7vSmOoMr2FyGCJLI/cOYGAwCl8ivzaUvzkqg04dWqsqVEmsnHUR69KbmGfaFW9JdqDp3A
	 BeCxaXQoj4PRx7fFhQOKe9F/RjaW4mWn9TNlHgv9Kwch2maiNOu4+f/l+oJYoTBDFnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898251;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=;
	b=RJvZKGL7LnbpyqR8lt/9IlMjOAulOZo1dLVFPp3clbqpqOs1l+vQYWCfOk9wOB8ZyK3p
	 cw7xT2oXqni+MaxWUHy6wfGciKVacSUNK1y2VF+Ah5J/c6TozRuFghvLtIJ0InqgXhHsa
	 FIEaYdmOd8uZXtb1u+KS8I2juDRZPRKaXVvZjt4UVoj0nZ5f8F39FmPQ4OFWBbAFYIV8B
	 FA/AIXojbv6IAjXEXiM2q5yH8tjL71GoDTuhytiWvdYDos/zUZVbHVKljAwBgYRB98xjT
	 4eRuUn62ceL4481Z81Wlmcipou+oTUv6PVUgI8QCghl8NmGKAwGHDT/oYbxse6OZm5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1UHC1Ve;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dJOn0uUW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3827960A262E
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3827960A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1UHC1Ve;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dJOn0uUW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P17Vdh1588116
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=; b=P1UHC1VebmLt6ZTL
	1Jqz/2iE2BIvp+dVY4Dt9zA5H03AqrVGPgJhnovYdsyEp2xOgN4+ob6DW5vX737J
	4M4S+ZVHq0E5sWtaEEo9lqI8waUYpI2CVjboEuQMDbQaR6tvttMOA1epXoWBNzpf
	W0OTtE6ZCrF9YGAaBY66fdE5slB3+/PaNj3+ha+byHZkBjGxeqb7WPyeJeQacYvQ
	dbLjcZ8V0j6dSrbjXNoUJqXGo62S+QUPngMperhZCq9gLQ0YO94yQJ91T86Kq1ik
	/qf/uHMlLtu3LBV5abzsIJ/kCWLz3dBQQiQlBQvCAx6Dv6fuSOHPvXeqcBm/A5vQ
	kBR9sg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnuka5cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:17:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3692c5b061bso7399545eec.1
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898250; x=1793503050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=;
        b=dJOn0uUWLBn/+lRrbYlX+lSc2BjbQS8J0ysvoSiC0/4oEcNf1oN5cYegIHB43TEHoB
         urzoNsDAE9G1+VbvhNUiKd7ZKyxInzXT1zE2hjEcrntpXFDVREPG9HoWghLlZM0RLOtl
         wKLXdxLXZx0sB0NS/opuKh2c3pmMFwJ2c908j/O9IRXA4u0pCeRfru+IjU0Qu53Z2GCE
         6qMcY0bUbhd2WNP+T60pqRmk3sZKuz1XjijlMbtS6Tt/ozoEsStZxx1jqrN+d+Rj/k4D
         g/4TcsVAN+joHuKT7HR+bY0MpIAgwYQJL7qlxdiRpVNc1Uuk0xMAmyWVfsA2uu/PYanb
         CKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898250; x=1793503050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=;
        b=cVUEL1j9Qj7C6FkUC0WijkaduzUJEXdYfdSS8FwAKxo7O5M7cl+Gp68Kzf1JtqMqFE
         PoHaHYFgsl2aRFA+MMd5fTlFO/aK8taXoGwkdZ7VHbEL5NMrapK5kV2/BPrCit3glZNA
         KPr5mgB0OUtbSris9A10lFhx/xupF1J5zuPgiJpRLhO6N1C4LjiGzC9XjYPQdX2Nrbem
         UjQHeql/a0M6UV3Drvzmg5HKqmkXBEdqMTbwhS0/vMfF5ldKhG0l7fxaWKUjSlOJPnM8
         3Bd8YXYizQcmbFJz7bPPKvC2Fxw6WET9Y5hHg0CNqhK7T0TS2LxmbrbZBghEpgTQJ518
         8DSA==
X-Forwarded-Encrypted: i=1; AKwUvByjuTWpm6vENDam3BT6l7HiD7tfkmEJr39JX0Nz2K6M/66J2o1TjCj/J2AhhYekNqnnGhAOPCXC/hN/@vger.kernel.org
X-Gm-Message-State: AFq9FYLZF9jLfkKXV6wgbIn6ApFKm6Tmi9/5JcxciFwYoSSHhtXum9fz
	ygPfCktu5HGMYiVTOQ0MguQsuOetZEfN69SExt7M7RZUyK2Nf0P0iBKpqCo12FzEGL7ODe3xrVW
	W+66x7/oCkLHzyu3AWXyA7B6vmsTNWV/jj3b4wZKQqvGLtantTSHChh3UaSWY5Ezm
X-Gm-Gg: AYBFou1TcM1HEm1nuzItVtpF/11IFrWOeQ/AQYuEp6cJ3ga2hHnNBKDyEwQECMo8ktm
	0mA00p3ymlJ8d8bzaMvnZFo3q+SC9qvtrmzAB2DUyG8xdm/sOp1e/DN5tSlEkHdMCA76goeMFWU
	m2NB6QxdAf2Mw02BoPyAmfwqpfvFLQHfk0Fb97jVLBOpESadyuw0rH70ZjNm0ce78HdIF8Ljy1u
	JXLTSK5tcqUi+q3V5G8KOAHrwTuH9Ay5wCHEN9sa1ceSDyWSX9UqUVMVeabcwmH/elpk35huWht
	tKrPSBXvaGklYWQeOi2sIaLDbQ7xnOZzqvCJVMU7bxkav64qt7CwPKpb6HXoqQE/7hVqePD3yC2
	OYh/wFAaHrUTAIXCY7A+8n7vj1Cyb+RcahVKdGZaTRQj6ojxQpczgkKUXN3eEC0mpAyxIe3vnB5
	S6yNmR+n8Iww==
X-Received: by 2002:a05:7300:ae18:b0:366:f9c2:9b16 with SMTP id 5a478bee46e88-369e8502798mr5254321eec.31.1792898249673;
        Sat, 24 Oct 2026 20:17:29 -0700 (PDT)
X-Received: by 2002:a05:7300:ae18:b0:366:f9c2:9b16 with SMTP id 5a478bee46e88-369e8502798mr5254281eec.31.1792898249063;
        Sat, 24 Oct 2026 20:17:29 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:28 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:23 -0700
Subject: [PATCH v22 04/14] media: qcom: camss: Add addr_update hooks and
 guard CSID reg_update
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-kaanapali-camss-v22-4-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=Z8Z5j3RA c=1 sm=1 tr=0 ts=6add74ca cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8v9F0_qJuxzZnZknmOQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 1CqJaYP1EbR7KE2peNQ-3sZHh3uI9tHJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX7wj1tCVuOHJL
 bevZk18iK3S2V9B2nmE+kqwaXefXSr8AU4qCIhMgQN221oiiLpC9ztTt8rH2PO1Wy5QeAHqi4dE
 bVSpFolDrwP9mEixZWL/+wNAr0Kg9QduTjy6wTM/4AZ5MvSuDzeAYv4yko3JYEk39my9i27U+tB
 ff/+eXcawKWgEZI0B7upIYbjHh/E/aE+RuIRvSckXelzGc55EQuAadq0SERmTmmpt8NdodGbvNm
 lMBvZaCOeR/YTZgu3TzKKXn4uK8CVMutVObvJD5xWn7DiLNpVnKnkmNnkudUYLeFZg840Fk8lve
 /QCnJV6/G2MU6RzSaAVv+7BYlfgNedoLV/FlkK0UHtyEyeZkEwZdO4V7yTQvyIHIhc2GGikiVHl
 57xq7HCfTn1U/ZQtx/UF7KoYxiSsD7fRN1qLgZ2GZ35EV0o0XKzmelOwFLUvbqOg9X5Zam11Iso
 68R2cDOL9kAwz7mpjuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX8YWOGlb0viiu
 FtLvKx+Sj079rpDmE3zQhG4d9n/OgnRaHa/A/fdwDRSu7CPx0auPswU0TEsKTb+qwvkaEmNoi2U
 F7ZhstkRbMKJd1jZ4Iu3TzaUV8jNTQU=
X-Proofpoint-GUID: 1CqJaYP1EbR7KE2peNQ-3sZHh3uI9tHJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

From CSID 680 on, CAMIF was moved into the CSID and the CSID became
responsible for issuing RUP commands. Starting with CSID 980, RUP and
AUP are issued separately, and each command must have its corresponding
SET bit asserted in RUP_AUP_CMD; otherwise, the hardware ignores it.

CSID 980 and newer require a specific stream-on sequence. After the RX
is configured and before the RDI path is enabled, the CSID must first
issue an AUP and then a RUP. A RUP issued before that point would leave
the VFE without a BUF_DONE event. Therefore, once addr_update is set,
the VFE must skip the initial RUP during stream-on.

Add addr_update hooks and camss_addr_update, and make camss_reg_update
handle a missing callback safely. The VFE keeps issuing its initial RUP
during stream-on and behavior is unchanged if nullify addr_update. The
skip takes effect once a generation that sets addr_update is enabled.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.h |  8 ++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c  |  9 ++++++++-
 drivers/media/platform/qcom/camss/camss-vfe.h  |  3 +++
 drivers/media/platform/qcom/camss/camss.c      | 15 ++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h      |  2 ++
 5 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 5296b10f6bac..2f7e593defed 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -137,6 +137,14 @@ struct csid_hw_ops {
 	 * @is_clear: Indicate if it is clearing reg update or setting reg update
 	 */
 	void (*reg_update)(struct csid_device *csid, int port_id, bool is_clear);
+
+	/*
+	 * addr_update - latch buffer address update through AUP
+	 * @csid: CSID device
+	 * @port_id: Port id
+	 * @is_clear: Indicate if it is clearing addr update or setting addr update
+	 */
+	void (*addr_update)(struct csid_device *csid, int port_id, bool is_clear);
 };
 
 struct csid_subdev_resources {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765..4f8867daea4c 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -487,6 +487,8 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[index]->addr[0],
 				   line);
+		if (ops->addr_update)
+			ops->addr_update(vfe, line->id);
 		ops->reg_update(vfe, line->id);
 	} else {
 		output->gen2.active_num--;
@@ -525,6 +527,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
+	if (ops->addr_update_clear)
+		ops->addr_update_clear(vfe, line->id);
 	ops->reg_update_clear(vfe, line->id);
 
 	if (output->state > VFE_OUTPUT_RESERVED) {
@@ -552,7 +556,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
 		output->gen2.active_num++;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[i]->addr[0], line);
-		ops->reg_update(vfe, line->id);
+		if (!ops->addr_update)
+			ops->reg_update(vfe, line->id);
 	}
 
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
@@ -588,6 +593,8 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
 		output->buf[output->gen2.active_num++] = buf;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   buf->addr[0], line);
+		if (ops->addr_update)
+			ops->addr_update(vfe, line->id);
 		ops->reg_update(vfe, line->id);
 	} else {
 		vfe_buf_add_pending(output, buf);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index ae9dad353a37..8312e4c91e98 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -99,6 +99,9 @@ struct vfe_line {
 struct vfe_device;
 
 struct vfe_hw_ops {
+	void (*addr_update)(struct vfe_device *vfe, enum vfe_line_id line_id);
+	void (*addr_update_clear)(struct vfe_device *vfe,
+				  enum vfe_line_id line_id);
 	void (*enable_irq)(struct vfe_device *vfe);
 	void (*global_reset)(struct vfe_device *vfe);
 	u32 (*hw_version)(struct vfe_device *vfe);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..be58a39f4a8b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5049,7 +5049,20 @@ void camss_reg_update(struct camss *camss, int hw_id, int port_id, bool is_clear
 	if (hw_id < camss->res->csid_num) {
 		csid = &camss->csid[hw_id];
 
-		csid->res->hw_ops->reg_update(csid, port_id, is_clear);
+		if (csid->res->hw_ops->reg_update)
+			csid->res->hw_ops->reg_update(csid, port_id, is_clear);
+	}
+}
+
+void camss_addr_update(struct camss *camss, int hw_id, int port_id, bool is_clear)
+{
+	struct csid_device *csid;
+
+	if (hw_id < camss->res->csid_num) {
+		csid = &camss->csid[hw_id];
+
+		if (csid->res->hw_ops->addr_update)
+			csid->res->hw_ops->addr_update(csid, port_id, is_clear);
 	}
 }
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0..431afeb381aa 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -182,5 +182,7 @@ void camss_delete(struct camss *camss);
 void camss_buf_done(struct camss *camss, int hw_id, int port_id);
 void camss_reg_update(struct camss *camss, int hw_id,
 		      int port_id, bool is_clear);
+void camss_addr_update(struct camss *camss, int hw_id,
+		       int port_id, bool is_clear);
 
 #endif /* QC_MSM_CAMSS_H */

-- 
2.34.1


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC21838238C
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131317; cv=none; b=ReoSgslRTPRAHvzKiX5W2ZSDxOeakBY0bSNyfonFEs7CQzy5Jt6Hj8frv2DmfTqy8cMI0ihrObrqIcM2jsjzYLkY+rRwjHLftn2wrW3y9sEesgRSTbNEN2RScBV6+hsX2EJJyfE9qj253KiC4ez1m0Enmw+T5gfClwhYbEbC5Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131317; c=relaxed/simple;
	bh=MvoF4KYpaysQaOj2p5CFFRdLKkcelX0ETCynTOl8gR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u9WkPzs+jUwy0iqA7ilonR6ovkKXTaVF0xSHE2yqaJwnWJFKcvvLb+KJlf4OdOSPJSOg4dFyvICKHJMatjYTWpH20TeNZOhLKRNPJX7fSOVqNqJ7q4u2YFLfoLK84QRbHUu8MutWZyWoabm1BWwmWfomBIwib5ZcxRfnxOHyh10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OrSwQvu2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJwjMTNc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OrSwQvu2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJwjMTNc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MIXNHh268281
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EntYKlXWqoDa4gaM++v1SxuAfqrMicY0mWfjmzFZxuk=; b=OrSwQvu2+zjhwhY6
	7JXFFSf8hB8UCshUrTGSIYXIdl3o/HXUunh56QupIYFiyXwPBiUkxyFv2Z4bMKKF
	1k/jmqCQ3fhO4y3tO0wbZQXXWkzqN3nLXq8PMn5wSwijS3E4gmxAnTDnp3Om+kn7
	vYNkzTdbKUxpcyGRS3nJl+cE+Uyza9UW9xazCsh72SmhQON7VJiReKi76S9ip+LZ
	K7iFoegtSGAknlRtOKhxxLKYZB+8EjNoI27RzJCIwh8IkNQzc+0whHEOIuyrA4wA
	wLYwQ4ilGIF+ne563lTCBVhSSztnVeS0pAGYXLEyYvydsC53RZRkDeKjMmmGA/3e
	yZC79w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c1t2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 02:41:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so347896a91.3
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 19:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790131314; x=1790736114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EntYKlXWqoDa4gaM++v1SxuAfqrMicY0mWfjmzFZxuk=;
        b=JJwjMTNc+uJn1WTZKM4B5mQuTMx9+ObSPYGimnsGmxktcGhlyEXYw/mL0s92aXbMJc
         SnZawCmrMK0m5VXp2Jun1TDJF2wm/LatnL6LJ53C7t1D1DM+V2tWo8cAOxBJn33dhNcW
         vKey8YRrzcTiBd00bqcC9xUUzP8rYx/H/ZlCsbqkK9FvsXiEtsb2ZotNh/0mVS0on7By
         EDcOoEZErSmSinsqoBtRgt6wkUXn7M6t8VufQaFC/rwe44QwR698X1UVmvt+dZPKf8Eg
         YaMrrce6JKGBSLo8O/eehdKB/iCaRJnp4VsT5lR3z9IvitAt4Xvpq9j/XQHct8rFAYri
         tqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790131314; x=1790736114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EntYKlXWqoDa4gaM++v1SxuAfqrMicY0mWfjmzFZxuk=;
        b=VJbdPC2cqUpfbTVM1RXpunVT4+UrvFwRCenRjgeAuoVlSq6tMwJ7NB6rAZq9VUGNqz
         IR/c2WGoXNxXsAS5rlxUdiesda5KddF6NB8+PvCXvoxWnNz1CRWHTaRMDUuMempFm9lp
         Oh45p+cqjWTyV5Gu0wYy26i3Lr0inZv4vQrVxAASsxOBLW6gx9hp6SoKX0oN+Kf6F2W3
         PvOWSIC9D3wNX4GmPH/sVlW7v2MSrwaCUlNzzknOMDwtlMFne3sr51MwMuXLZsJ8zeRM
         NoC1yC5pVH3B2iAD2GIJ9uy50nS3koQxMk0ozJYwk2zpQMnDJxgpR2QNkzkDuHVVCwTk
         +TCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRU6UJmkjPsY7UGng5Jewt4xu0LLYr6J0jhl1wgdkjEXEwnpkgg64JzjHaHkKXYbFz9KyKYR316dn6@vger.kernel.org
X-Gm-Message-State: AFuF++kdHtrX9hmi9ejmGLDFdOvrc6waRMzJjBPYAqejxAFIsSjrHBCy
	EEvzeJaa7qkss+JcS/AK+/VQ3YM9ib4HzollNqXNlqSGGp/zGpiMBq1n7Dueo60VSn+VLnBa1tt
	12ZEVqsTEpY5DisVNR34Cj6XB3sQPvvqm5kmpVKWr1Du/Ojh7R72X3TVe/Qe/jWpR
X-Gm-Gg: AYBFou1T5q5qNeILNdml6ATMqEIDdTjtncNJz8EFc34c9xX40f4R3Kv5VMdjTQKcbjq
	FWsSScwRllA4UzlKh4CjM68Q2SBoyb8Xl1EKRBXKmnGu10JuWbiqp3CX5Y+pJomJCrMv+b6aHS3
	x1l9cRtfgT0lKdQ+8/gWvN5NOhriHfYe03ArwkJuCKTmsIKELzuSIZsPPBjp76a+nhgw9+pttUF
	c3aOKSy4NJvZ9CgfyFGXVzfWNuY6Pp6uEOF6hPY4+m4Ah0ztTSyjz8AzjEHpyf0oDv6u0Fcm4xx
	groG4Qr92iEH6G+YeGOnNiLLW4iTR+IBJU9LnTGztDvh1EjRyloaJZjy3xFrMjXZu0JYOxpoWzW
	A9mpq1jn8dWGAf/8BrNmCn1q6dtEhJqTvrKf4aYucsZCSFDrM9DE54FxDQfGCdlhv3uceqvvaUQ
	==
X-Received: by 2002:a17:90a:dfcd:b0:39e:6c69:34d5 with SMTP id 98e67ed59e1d1-3a07e79861dmr1038531a91.57.1790131313617;
        Tue, 22 Sep 2026 19:41:53 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcd:b0:39e:6c69:34d5 with SMTP id 98e67ed59e1d1-3a07e79861dmr1038519a91.57.1790131313030;
        Tue, 22 Sep 2026 19:41:53 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddaf4f5sm2102026a91.4.2026.09.22.19.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:41:52 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:41:13 +0800
Subject: [PATCH v2 3/6] media: iris: add AV1 decode buffer size support for
 vpu4x
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-add_iris_for_maili-v2-3-7223738e330d@oss.qualcomm.com>
References: <20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790131292; l=3997;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=MvoF4KYpaysQaOj2p5CFFRdLKkcelX0ETCynTOl8gR0=;
 b=tPuTYmRu7uGeUy6ccHrp3oezo09jJXcJgNoB9+6yiW9ZFdMcy9KpKj1WM6kbYOU/TE5AWYU4a
 QI6wk67QMQOBGJvJtIbF9mNegy1IftMgkF1/QMrkWjXYFerTZuAT0Q1
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: uqvHar9uk5EEfgna75oef2dxfB8gtByC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfX3MKKEtZJ2hfu
 0KXYx1zM95LlyZxagoyDpHH8YehoRhWpe7zya5vWdTwopfvyf6/NTnE2v3/JY46h6EXj0WU4arc
 w202Hmw4f9lFqij9xq6RWndnxivgdhY=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab33c72 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vsqskg4-7OKJpdbeU5sA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: uqvHar9uk5EEfgna75oef2dxfB8gtByC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfX7urIFQ++SXEf
 o+M+f3pwzVJuPXda8layCOIcZ2BqILAWdEq+yRj3p482phbQxIItkH20fVAIuRne7UunTtEhPCu
 8HoasE04O/YaK2sYgJ+Q70/VMx1q0jnfhq8OQQmRD3CpSCB7si6R8lEVpqENHTLhlB4OBqW/SYh
 P3U8b0v73SeoWHgy6dfJfrIw03NzSW8PLRmOfUJm5dDAq7cN8bysVlN7ZYSUZJSjV+xfqjRxX5h
 9kwQyb9wkzKCsm9guLMf/RlH4jHMgd1ALWEgCCuKNTqDtXTezBYCjVt1hD9swUB6EfkD3J2Xf41
 fVztqQbrUC6gs/3FN+JCCjfexkl/6VkM+LJ2/mnkEGCK1+ZCGE6gO7oBhkCRyI2grF4Ivzb016S
 enQIV1kQ3IVA5m5IWusC3Jq/v13tugtk+PztP7s31nUwlilXUyzqg0FxENGeCY9Hhq0FB3pp03p
 qQxUA2okgvtnvP4I4aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230010

Add necessary buffer size calculation to support AV1 decode for vpu4x

- wire AV1 into iris_vpu4x_dec_line_size() via hfi_buffer_line_av1d()
- add hfi_vpu4x_buffer_persist_av1d() for the vpu4x's persist buffer
  size calculation
- add BUF_PARTIAL to the vpu4x decoder dispatch table, which AV1D
  requires

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 34 ++++++++++++++++++++--
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  1 +
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index faebb54728660cc621f8822dabf2e44ce8c55c58..bb8135bd238b670fb5806120493b2603d9c2b0fb 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -1833,6 +1833,8 @@ static u32 iris_vpu4x_dec_line_size(struct iris_inst *inst)
 	else if (inst->codec == V4L2_PIX_FMT_VP9)
 		return hfi_vpu4x_buffer_line_vp9d(width, height, out_min_count, is_opb,
 						  num_vpp_pipes);
+	else if (inst->codec == V4L2_PIX_FMT_AV1)
+		return hfi_buffer_line_av1d(width, height, is_opb, num_vpp_pipes);
 
 	return 0;
 }
@@ -1856,14 +1858,39 @@ static u32 hfi_vpu4x_buffer_persist_vp9d(void)
 		HDR10_HIST_EXTRADATA_SIZE;
 }
 
+static u32 hfi_vpu4x_buffer_persist_av1d(u32 max_width, u32 max_height,
+					 u32 total_ref_count, u32 rpu_enabled)
+{
+	u32 comv_size = hfi_buffer_comv_av1d(max_width, max_height, total_ref_count);
+	u32 seq_hdr = SIZE_AV1D_SEQUENCE_HEADER * 2 + SIZE_AV1D_METADATA;
+	u32 per_pic = AV1D_NUM_HW_PIC_BUF *
+		      (SIZE_AV1D_TILE_OFFSET + SIZE_AV1D_QM + SIZE_AV1D_ARP + SIZE_AV1D_METADATA);
+	u32 frame_hdr = AV1D_NUM_FRAME_HEADERS *
+			(SIZE_AV1D_FRAME_HEADER + 2 * SIZE_AV1D_PROB_TABLE);
+	u32 extradata = HDR10_HIST_EXTRADATA_SIZE +
+			rpu_enabled * NUM_HW_PIC_BUF * SIZE_DOLBY_RPU_METADATA;
+
+	return ALIGN(seq_hdr + per_pic + frame_hdr + comv_size + extradata, DMA_ALIGNMENT);
+}
+
 static u32 iris_vpu4x_dec_persist_size(struct iris_inst *inst)
 {
-	if (inst->codec == V4L2_PIX_FMT_H264)
+	struct platform_inst_caps *caps;
+
+	if (inst->codec == V4L2_PIX_FMT_H264) {
 		return hfi_buffer_persist_h264d();
-	else if (inst->codec == V4L2_PIX_FMT_HEVC)
+	} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
 		return hfi_vpu4x_buffer_persist_h265d(0);
-	else if (inst->codec == V4L2_PIX_FMT_VP9)
+	} else if (inst->codec == V4L2_PIX_FMT_VP9) {
 		return hfi_vpu4x_buffer_persist_vp9d();
+	} else if (inst->codec == V4L2_PIX_FMT_AV1) {
+		caps = inst->core->iris_platform_data->inst_caps;
+		if (inst->fw_caps[DRAP].value)
+			return hfi_vpu4x_buffer_persist_av1d(caps->max_frame_width,
+			caps->max_frame_height, 16, 0);
+		else
+			return hfi_vpu4x_buffer_persist_av1d(0, 0, 0, 0);
+	}
 
 	return 0;
 }
@@ -2163,6 +2190,7 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_typ
 		{BUF_PERSIST,     iris_vpu4x_dec_persist_size   },
 		{BUF_DPB,         iris_vpu_dec_dpb_size         },
 		{BUF_SCRATCH_1,   iris_vpu_dec_scratch1_size    },
+		{BUF_PARTIAL,     iris_vpu_dec_partial_size     },
 	};
 
 	static const struct iris_vpu_buf_type_handle enc_internal_buf_type_handle[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 8c0d6b7b5de85f7d7aaa8fc36218e8d095419569..c7020931a642f0484b6f84af7ab51242e1845458 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -116,6 +116,7 @@ struct iris_inst;
 #define SIZE_AV1D_TILE_OFFSET     65536
 #define SIZE_AV1D_QM              3328
 #define SIZE_AV1D_PROB_TABLE      22784
+#define SIZE_AV1D_ARP             9728
 
 #define SIZE_SLICE_CMD_BUFFER (ALIGN(20480, 256))
 #define SIZE_SPS_PPS_SLICE_HDR (2048 + 4096)

-- 
2.43.0


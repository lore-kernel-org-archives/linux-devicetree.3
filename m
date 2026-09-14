Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD04E4825A6
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390865; cv=none; b=ZRytsjwUFtA7INqazzT8+7VYg8wbNSxVMmNDeLUDw7ZrW1fpZcjFg6JuBD0C9SGNsYGCIVX3VCHR70H6DpDA9PkOvkhX+1pfMOoHqhZfiBbVtteUtB8ULuK288oDSyZU/q1r3aTuGsimgghSbC/xdEUxUfnKqJSSPvsK1gnkDO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390865; c=relaxed/simple;
	bh=4CuIYeLNuqj4lS1nv6iZvXtszLauIqmb3dM3fu1zNVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a6yos8H3/a6X4Nnt2BbGTecJSN24vcq6wsGgG4ctLvbx+T3BZF6Di1+2TRDFfGHRRRWk+0/hKdt79rKK2ZHPGxMhLMwUZ5Xl7KwCNjOlGfZ4R+XQXxb5tq1Q8Vmjg5vudbbPqDBuxKh040fLtYu87ZeRjn8y8FJIsYp6WdGsTZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JYtwgCd0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NbMCgY5o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JYtwgCd0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NbMCgY5o"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0dNV1200591
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3bqFmHkhCGz5eiPjMG0auO0PisCfiqS8mjvQZaC9iYQ=; b=JYtwgCd0ranMmEqJ
	Lo0I4s6s/dosEFGfTMw4CjXw5PvASqWyW+21OqWp6l46Gha2kdLgzVgYPncJuvC2
	K7BPZg8Jg99SFgRG2rutHlnJtRHw0jzBllXEHqzZCpB6KXXpNoLUjwMn/T2NPIbl
	QHdJZoY9vlLlU2jK1hFbAbw7tj6eNCZoubIh3k1JPqMK9zz5CdfznicWPmh2gOOk
	ntzkUqD62+v/Xyou2BY96GbW+lFS+bjahNQA/3Zg90Etg1eSFFjzUQ0Y2bcTmbnj
	5uTUhx1Kp9+i3pWUfl649V5hFh8Lnt4aucmXn2UKVR0oNOTEalG7JJgzag0E3Jx0
	Yt37qw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevrxn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:01:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6fed0652bso35359355ad.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 06:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390862; x=1789995662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3bqFmHkhCGz5eiPjMG0auO0PisCfiqS8mjvQZaC9iYQ=;
        b=NbMCgY5oHOoRRHTCBcSX6JtYDlgGRwPvqR2DkAb+fUy59dD/lU78a5rp9ZKfi2rqbn
         Q2e30cj9yb0BT39SCnnSeelporzymqEgjiPpE+gh3oYchoP2LfDELPVqIbOLQ6gLCqNP
         MPHkVHoAxpT0M8mwOwkB3PikaQTHqSGgLModqt5hl1zHXhl6iDGCFjPTWZuRu8qnXz4r
         LK/rCskiVxt9cJauGRGEmzZTue89RVGncSNibwnyUi2EujSqYwesIhIHpdmWfFHZqikv
         ncoa4URzcfWyN6lMPttSU0XX9DX3ytFPODAOOQwcDpNtXdaOugP4RRacvoJ8MWI+73VM
         o7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390862; x=1789995662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3bqFmHkhCGz5eiPjMG0auO0PisCfiqS8mjvQZaC9iYQ=;
        b=NGfyZypc/awKDp9v8kOKg6zpfC1+Gjv0sZ/HKkNN7LWnJ1T3JD6OZkuz9k6NHl7RK8
         GTLrdSUp5rAI1ie4jjdxr0g7LKbd5OEqpfADKv4Tza6CejqweG9Sqm64pFltDiS0BjPk
         RiiflysmDlRRD6Ki8OAr55YFRDtZo9YTmhHJumBGTFuR2IE+qn8jy+vhpkifthsDY2bh
         NZYoAlcyzRdGsNh10YghoM6h82CzTHfaWrvIaB/ddw1wgOOqXGZgYiOLUc/Kv7mPC9jt
         wjSlBXKLNcwNOB5kvPFY1d71bRWaReY6LPSwxRYovbOc1ttcMOdFlvWH7DD2rP0VtAjw
         x/ug==
X-Forwarded-Encrypted: i=1; AKwUvBxuN1UA7N6MhgMPMyjOlJy1V2GzLEZL4ImZ5+o3kJEh6u6CZVVUDwyU5RWu90/ikOfFM5OBc7Zel6ZD@vger.kernel.org
X-Gm-Message-State: AFuF++ncuI1KPNLKAMvubqCcwyVzlvMmxHdRuCRQ0j+FyrOFFiiehhn3
	3eSfoPaZknWkE0R48l8h3fqpqIh6IeYiNpxDDl0pYX0vmgW9eASWWfnge0Wi3rTy/1yTNs16tey
	C26/mY27/CPkjqOLcXHLz/b21GiBf2LdkaT4zEL5HKU2EZo88FRTPLltFTx6mC1cT
X-Gm-Gg: AYBFou1rUtAbMYxbqT6npH8vI4tOI5bSD2wY39lNh+3EuPKBpqCc/3dtJMM97DUfkJx
	9YE5dGqNRc3rP6zgb4FIIm7q22bMagNUTmbkbkof9BWrXOeAyQRRZdTLqRFdTp3y7UDmC08mXBf
	vRBd5Cg3oWxIJoQwOJIxw7ueZxoKutSUGZOFcrUi7N96REhbUYJ4ysKO00pGlQfaHBNaFbWLs6Q
	aSKJbKn1+uNp32Ju+/QmZn20QwPdURkJyxam1TR8ASCXUvoDbgMQLR+TSWbl5RgnHqaaaOXPdFj
	nXeNKC9OYNhsoDnOcC20BbNTSnLO1qQ4jT3ULOkIwdvJud17QO0kYbYOQjLZi1bZFuFZGZr8giB
	Gf2zzIuWi13gagIGqtRtqzO2mme5jehT9wunBNff/SPmQfnRYWcGKAL+aNIUqOWRd9KQq7E/q+L
	U=
X-Received: by 2002:a17:903:fa5:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2dd6c5bdd5amr56497315ad.1.1789390861413;
        Mon, 14 Sep 2026 06:01:01 -0700 (PDT)
X-Received: by 2002:a17:903:fa5:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2dd6c5bdd5amr56494955ad.1.1789390860432;
        Mon, 14 Sep 2026 06:01:00 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb6861sm47434965ad.36.2026.09.14.06.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:01:00 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 21:00:27 +0800
Subject: [PATCH 4/5] media: iris: fix VPU4x encoder line buffer size
 calculations
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-add_iris_for_maili-v1-4-09df2b54c317@oss.qualcomm.com>
References: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
In-Reply-To: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789390835; l=2172;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=4CuIYeLNuqj4lS1nv6iZvXtszLauIqmb3dM3fu1zNVE=;
 b=hmO4WEwtyVRXwiuH9tfu7VUYrnOO2oOEADHxnP0ceI4IvbWB7Ncasq8AsbFNVePmiDrjwKvmv
 Khg8JxB5vZfAGFjpHbKDm51zTt3Bb/6Gj2PizdEFeyhTRx8t/uRfcps
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: vFdrYh0aRClAA3JK2tIEo6ytTse6tfrv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX8DWKiaVPPDsW
 ERNBsltVfsq1t79U0suWzi8cuxl4bu+UK0I8x3x43dye029/cKxpAuH3IxkPnHChddZ8Hse4kGD
 kuTlzDikqqVdUKmZEDleN21/wVbsoLM=
X-Proofpoint-GUID: vFdrYh0aRClAA3JK2tIEo6ytTse6tfrv
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7f00e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ZutslQBMatpZbJmTFbAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX6/6SSXy9Xbex
 NmR6d7cQ1piRtMb8TNemSl84YT3frAPTZCDQlhc2Ob4cWydljVjQ01oePxNTkwbjGHaDJbCYCWp
 dyi+AFjBefxxc8ZMw5+bKDC6D0HsH9lgCWY5HMAot0/NS1baXCLhNrXfsV9xqhDnmy5o1qqHXIN
 Xbfi9vViLsjfAKRuBOKAuiO1aBHbPDUp/R26kBw2lRCHWRHcg6LUv1E1zyJ2G8qBx//AOaUb7ov
 /G9kuliWgDoy3NvIQhFU9tdtg5lKu8Ifs95S2N+FRarDgMJCHMrNMRjcx16gpzP+hdD9ycTeJW9
 y5dJWEmufkgJQisPP7de+ZJBkR4v0+mAZgCLVIekniYolq5iGovRlTeqgrukY+tkTKvYNdZzviE
 6ya6qXiYdEa/j86dJyC6dz3HYN+/aMuFtN5G0pcNupr6NUXi81frTrqkaqJwXZou0DIvn04rNlm
 O0vIICTNlCn75BR8EWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140186

size_vpss_line_buf_vpu33() expects (num_pipes, height, width) but was
called with width and height swapped, miscalculating VPSS line buffer
size for non-square resolutions.

iris_vpu4x_enc_line_size was reading resolutions directly from
inst->fmt_dst. Use iris_vpu_enc_get_bitstream_{width,height}() which
account for the 90/270-degree rotation case.

Fixes: df816dce1b01 ("media: iris: Introduce buffer size calculations for vpu4")

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 55996fd0d14c385ee63d2577b3e6d71b51d9e541..c4922a25b4501a851e31fcc85bc13735803be366 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -2059,8 +2059,8 @@ static u32 hfi_vpu4x_buffer_line_enc(u32 frame_width, u32 frame_height,
 	u32 dma_opb_lb_size = size_dma_opb_lb(num_vpp_pipes_enc, frame_width_coded,
 					      frame_height_coded);
 	u32 dse_lb_size = ALIGN((256 + (16 * (frame_width_coded >> 4))), DMA_ALIGNMENT);
-	u32 size_vpss_lb_enc = size_vpss_line_buf_vpu33(num_vpp_pipes_enc, frame_width_coded,
-							frame_height_coded);
+	u32 size_vpss_lb_enc = size_vpss_line_buf_vpu33(num_vpp_pipes_enc, frame_height_coded,
+							frame_width_coded);
 
 	return se_lb_size + te_lb_size + fe_lb_size + md_lb_size + dma_opb_lb_size +
 		dse_lb_size + size_vpss_lb_enc;
@@ -2070,9 +2070,8 @@ static u32 iris_vpu4x_enc_line_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
 	u32 lcu_size = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
-	struct v4l2_format *f = inst->fmt_dst;
-	u32 height = f->fmt.pix_mp.height;
-	u32 width = f->fmt.pix_mp.width;
+	u32 height = iris_vpu_enc_get_bitstream_height(inst);
+	u32 width = iris_vpu_enc_get_bitstream_width(inst);
 
 	return hfi_vpu4x_buffer_line_enc(width, height, 0, num_vpp_pipes,
 					 lcu_size, inst->codec);

-- 
2.43.0


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B0147D937
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455347; cv=none; b=UL1SyY08SHf0Ct5V2iFHkGeVt1QJTv+Hepd7Ah9haxn6b89bw6xas/bdZopTChS5lsEwsSMnKX1eadgwKNFQgeJpLWcbFzxHmTgK8hKMmeqj9NPx7TysXm5/23oIVopkcUv7u9G4VKV8b7IZK5bSANUjpej3jgctaV1x5EWPJVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455347; c=relaxed/simple;
	bh=+nqEnMHoWBEk7ejdZyFoXPRJzFNrqozZDfHTEPC98/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q5HB+cODnB3n2ru468vM4Ck/eeJP4T9pUcVWKYpsljhtU21CX34EA/pFm/jAFVs/uX73wj154trKgO2qQ7JZNJiaxSJSVuevBK+Od2FRctyw82k9LQGYaaluORj0Tc8z7I0LWOXrQcCmogPGGIKpfXMuazAOZijyFryWKaB4tXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kHvf1FH0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUHVpBms; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kHvf1FH0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NUHVpBms"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UN2EvK2415467
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n8atcCdTovpN5KZraYH+DhxjcFfh8z0wA+cOFj5dSVw=; b=kHvf1FH0KiQ0MiN8
	b3wurvP5GrXawjIoisfMcXQdMPnaIWz5zo1dYEryyua4Y1uIOg+jrozC2FsS654q
	z38w5EsCh3nE+hY6ZcqluJxXRzPVeKcr/MVWW7ikYwPWpd3KinJbnFD8XqXXw7Wc
	YajeSb83V62FJalLJCxUBYaZhwqCAw9BxqS4hbyv+hji9BY+1C998+kqdBIgpDq7
	YJ1jHfwSLX6wQkOQta5dLY7OWHLfrHAh1IJTkLligYqVV6Li0bwp1lawYiWQxp0V
	FuPjy34Q+qJJf7qvncReymSl35bPyYLDoueOM4KWvcJRMDPkup8XCMk8ApLs9HBL
	nePohA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfxbg3sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:49:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so3636541cf.1
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455344; x=1786060144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n8atcCdTovpN5KZraYH+DhxjcFfh8z0wA+cOFj5dSVw=;
        b=NUHVpBms35ro9jXVPDFjl1SnfuqOtakFd+B1MJ/jFpA/w7BVhS0ibK4EXnbIzVEPQ6
         M0oqmaUpJiGziFtKlO+bqRdIgFJulVYlGbxdSC2rKlvmsaAkd4OhwbWQTjNhDgueatRt
         E5SySWoiIDwngt82LInBIylEPZhK7w6xeXRcuDNWTkGBqrFqdgBsaiXHS9/riP+nXvRE
         My4/wub2/VZZ4bBY4s4F8K5rzG0hvFK3t3ztCbP8wt/RENyAhQHj/pc0V6hUFn5O6jbr
         78QM4UUJYEhvk7Jx7DqQfhzh5jzLQrvA0QIj7vVvw5CzXk8aRpsD0eNvoz3Cjax45X/k
         hviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455344; x=1786060144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n8atcCdTovpN5KZraYH+DhxjcFfh8z0wA+cOFj5dSVw=;
        b=eVrBR5nouJUeUpZ/mzJTieIo7FUuB/7JXZh5Wk67ILGHcxkIGmta7f+vGt8kyATvNR
         i/QBNSYw2WeZ1rXdWR4OUzUaOtopfpiVRW9MJnzs0gAxkBrYe0Se1RKUNCYJlz1e2+Sf
         nzPKLnnG/hG6n5NbAi87x6dRsS5zbE7bnVekGB7o0EGfCUzXxuLLNTiBNNwqGrdWhzFw
         YcRJiRY9Bbq+gzmN56UkYnrSkFh4GFes9pXnVYg4fGiit3UqWkJWjpElnxirmTDSXlZA
         MkvFxCH2HY844nj/Avs4n51wL2vnjcAyDDweYEBFHD8M+lPNB9y0+vCxIOZHO1q2lp9c
         +aAQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro83KGgPaXyDpfM3a8b7Tp8Nu5cBO5gEXRyO4+1suZhPi5L2EHs/UEMwMT361TGECnD6Wslh6YyO7vi@vger.kernel.org
X-Gm-Message-State: AOJu0YwxhF92XSqiHj2ys/oaQ0ocMgNlOwtk40t28IOUBfXQVIapjnWi
	sKQUt3sYSm1q+r16jlhCouO1p3aSnXjThVGN3WodoI4fhyKsj0j5MDc8eNKmyssCqVYlhzyV1m3
	sQJPt3dz2SIYOELY6L8u1w0URWGSLGJ01WPli1I/VQV1Q3Be7IV9qS/dewH9aYAdN
X-Gm-Gg: AR+sD13agy+oLUDbsrIfE/uXO6F1/PMDSB023+ep2xUoBW0JSmiGEdcd4covTk3uJaK
	uXNHvow9GChU3BIcQatCplQaJqYkVoV2eYmSJeLsTgFPxLTvF/Yvl1jzAkiIeJVroLFY/3ZmwTb
	QsmUnZrc7CzzhqAs1yQA8CmdLb2J7+2+tLFDNWYEMOcqPiW39Nihhy9QOYBHign6T4oLxt7dDYU
	vPnAxKLv1Bv45cwskzvsl6xkLJu78F+qykKPKsjRu5dcXhJFyYJsZt6qxgBn+WMo6HfaqhotxyY
	9u6/w0o3iUgUm3uGSaOn043chG4IjbSNnGUvkxCme9E3RKaizoyIUHhO1scioQ9zLGYH9bNxAKF
	HsymToBmLk4qA/SzTFDwDONcjo7bgclISOV8q174HkkBZ+/3CVVHyOsnFKtuTDeVNjR6UGx+/ty
	3e3y/tSNzKElvXXw==
X-Received: by 2002:ac8:7d56:0:b0:517:9c91:6246 with SMTP id d75a77b69052e-52b38662c50mr49006421cf.44.1785455343840;
        Thu, 30 Jul 2026 16:49:03 -0700 (PDT)
X-Received: by 2002:ac8:7d56:0:b0:517:9c91:6246 with SMTP id d75a77b69052e-52b38662c50mr49006191cf.44.1785455343358;
        Thu, 30 Jul 2026 16:49:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:49:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:35 +0300
Subject: [PATCH v9 14/19] media: iris: update buffer requirements based on
 received info
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-ar50lt-v9-14-d71a782001c0@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+LMa5uIoaKewqRN858jj7TAIuysHB1Q7j152
 TGLnialSWyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamvizAAKCRCLPIo+Aiko
 1QnNB/sEmunG4VJkNl6edsjy8QgPPDpybKp7FVj2uO7CDNLb0Rgcg4ryfaviG/py3If+fTwF/VS
 QsRF7xvJNQb73uRd7QP0bgYEG9rtP3WpL1rpPywZJxXF0vTxbaxKaoiCu5oZFlhU0xvTBrhLZsa
 32wPUHQ9cus1a7zmGAf7e0F05E+GYgIf9UsF0JVoE/1Z59eFPawerOEg9xHJ2a1qynYc4EiygUS
 1nta9X6YQ4CEVsjeRHYd/jOr2BbVWyS6n1tWu+nO+SH03WbkxnHu4RHR4oUb7N0uSNkALvVIt97
 AHRkUQG8QN6uk8EAzjlRXmSFAq+IYsa/LW4VilwfdASH7ffx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfXykgG24ulYVt7
 DFJhkI8RRrMpw0/RyJtfqMo0Sg2PE+WgBT7veLiWfUNzDVm2ZzttZrNZqqyKFn3lkwFzAYGusVg
 5qVdVsEKTIb7WYj/XDOkPHu7wjJkI1/uMSmA5y+iP7ZbWZOh3u7Oby29xp3rR3GIF9YR1gVfaT+
 fDkItaPw1knR1U9DQRGvN51Zvmihx1mjbfIMilCaEJhXPsGa7til7Bfh4+tljEvVzEoHTJBxi23
 aD+P+fJQFD0aPt2tzvYqLV2L7zrKPfdOeHOhm8jespNgWAVHDkDwzhGaXIc2quUsxb9DMSX13x2
 qnDwTon4YR3NdcIV2+N9h1ar6+oAdTti5F1MBqhshuv1l2nOK4ZyvacQpJQYsn2WwB3eQ+Gx0pW
 VtAMnQEE3/xGuSkihX2pKVZG3XfsU47SknhT2k+isUwz0/ANagQ1MpNr16nerULtjcFgVVv2aLi
 GXgCgEfhsXlyUBYCb8A==
X-Proofpoint-ORIG-GUID: tW_aVWC9HHq55whWguPpWvgPYet1mIiZ
X-Authority-Analysis: v=2.4 cv=Irkutr/g c=1 sm=1 tr=0 ts=6a6be2f0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=_TRJU0tGboi39qq34nEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: tW_aVWC9HHq55whWguPpWvgPYet1mIiZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfXzZxY5uBEopG8
 wIDTizrAsES0f/uGk4cjzCLAqenirbE5fmmn55kgLb+3towtmbbKVEn9N8rDbxViN2mDjp89StG
 fvXLh9iAl5FQejwPRalukhJgROJl3Yw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300168

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


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F0A3BB9F5
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294007; cv=none; b=HUHFdsgH2TQlXqcnakU/l6t07BRIu1fzanvDxTS/YaBiirbKRHGpLf9S4gsWgWeKv69KwLTeQmIt2OGRwsTvcL7W6G0fejagPC0bDKUVbidcIRsjbRe8iLgiAd+t6cbwopnP0+WkGLM73XhOjbWOiu5A/GMs8POXE/xIx2p+9I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294007; c=relaxed/simple;
	bh=20WLnkiYWDQEOKwJiDNPOzP1Og78Nshg+iIm1A20VvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MQyLB0QjoThsyeGypCBiiWFZcyGgYa6THu+vo3F8sARVLzV19uFVoRSvr4CEM43vNyzMD+j7Rbvf8JHpPdRRcLOnm81F8J1mfE2uNIf2ikdxZ+DS+eSxgGnTgLm8VLoFUhwXwSr41PKnip5rbYbb3NPFIzfW8gB/zD37010Rr8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6+nG4/S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vv1g8Tf6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6+nG4/S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vv1g8Tf6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RA3npl3123625
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0rj2JamDaDnv/s7jI1Vm/rkzZOBtp55LTzg2o5dZC7s=; b=G6+nG4/SWFx3ErrK
	UsnkIxKAviaOcZrqkJhfVlmOmbHoQzjgInzE76+F9jqEJRA18gFD2uktvRJSUQ6C
	4N9Ql9YDNEKkztC1cCidMFzTvuSuhClbSb/nvjjimlVbmXhCpCkr0RKK5VLQGsfF
	j29a1QNebdiFh6bk8yZwvQZZ8axh3iM3XNoya32/60lLGvc4VMG+JhcEQRHWJL26
	Hlwlxb6cbPuvT2SHiR/odV23rSda1dvRxaY3x+2Xlf7mp59M8Gj0GuXPdDv64rva
	qd3+3TTDarwBXBKyGKV5CBtRSapgTvbeBUEDkTBIpMASK2Banbu5An6qfCIqY6Wb
	C0vtGQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgghqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 12:46:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so180468881cf.3
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 05:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294003; x=1777898803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0rj2JamDaDnv/s7jI1Vm/rkzZOBtp55LTzg2o5dZC7s=;
        b=Vv1g8Tf614rePhjf5rlkqimSv9sOhCtmKzRxPyctx9LuU46ck/2XmGQwGZhIsIs8Ds
         5MquywZMwhSHVml8L0rNJUYF7BW+ZNdrp9Su8Z17RZjqwGFSJGfRH6wABO6jFM8T/xve
         W9WVPHw6IvuAZQwCnJsT9IEKihbH0H3OrWNCWZ4M9ySOhBzS9te8q8Xded6AIiEQVVJb
         Yi4xnoWI0IUBWLrkCnbxn2eJcK4USgh3XCTDyclgK5yvEucf+uLwGNcVTu6Ub+RcW9fH
         fnCVijCTwr/1F8HezX/GgTPzRTuWLBFchP7Pjg20ZsiFscb+VmI0zpPjSinbLt6mndis
         P/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294003; x=1777898803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0rj2JamDaDnv/s7jI1Vm/rkzZOBtp55LTzg2o5dZC7s=;
        b=goPnddFtqhdSBNu8Gv2+5uVqV31LHKmJdF2ADlPu3PWIpt2TDeav+e1FQM/MNLW6nt
         7zSXQJEV6xrrsj8+oMIsQYKEMHzZJat6FFSn65dw4n5IZWOC7wPlBMSI6HciB87P4GbY
         eI9IoZseBg6AMAU9oayrHeaimCL8TwRZ+r1YlqaoHx5pwDb//hcN5oc57wMza2AmRk+8
         Gqnu2A1B61xmdcr4e9tc4y6CElXbfgXwS2AJo/W4Y8D6C71XJx3kT8fzFYh+mK/h33aj
         JGyKA96Kf+A9Zdbq6HcehwXkP5j+w2yx66eF4wf8PkrkFUAxgaJvpO7U3hKWZ0Oj4a0D
         p11A==
X-Forwarded-Encrypted: i=1; AFNElJ94S/UvEZDWSEHvrmVK2oGsXTXHsm5/C0nUwElnqOwo7SSuliiizzQYLHBUSJEpaEczHH4NUVFX0KIY@vger.kernel.org
X-Gm-Message-State: AOJu0YxVo9JlaZoG6vIjkJp3JqcchH+9CTessTu4eFcjDnscJiveSJdg
	IgO15zszR/70FMvDSP6t/HGcH5v606nQG/X4IMPKsOUrj3L8ZhuNdF7F3GN6fZWOnZGPFRV/BP2
	extBU2X77L/t6ASBEf9HDBbdVq50W/zkkjhvja3itWsLAkvICTnmsZDx5fumOrrHE
X-Gm-Gg: AeBDieu0FJKpizDNhi04wNd0GZqHyuCSzn8cfGAgd1WKqA/UGg561ASlvR5rdME418U
	bC61WYW1gJ+Ne9ME8cA+Ygg16gL1SzfUb3KKPFrmvqWiyBZUuLWyXy615/JfNWlM2Sg6trqD9GP
	KKBYZNdp9+TJJVav6F5zBj7eykNZyqVAmVJ6b8HFR+nEF23xrnP0b0VpytXKIIneUS+SIMcXKLH
	h2wDXW6QqGRrOXYG8Cg1dyvc6AnFz4+hhAmYqtGc1YQh+Xyro5lXD/D+EqtVA8fQ//U+dToq9Wu
	8xM7HjsCrBwqEFA/GXg6VoequWcgxT2xvpxQfbconpPlXkMDXgEla4b/NQ9Fh65MMjqH7S0Yqkw
	Uq2J+SPS1eS4ANIqxpQWWfm4AUX0+MsmxKy570y3eiQUWDQTrpvIU7ZJ5BRojXqVvXqzYn6A50z
	bRRu1cU4ZpTJwHmNfsbutLVXiLbYo=
X-Received: by 2002:a05:622a:2615:b0:50d:8792:b6d1 with SMTP id d75a77b69052e-50e36c122efmr629758821cf.38.1777294002719;
        Mon, 27 Apr 2026 05:46:42 -0700 (PDT)
X-Received: by 2002:a05:622a:2615:b0:50d:8792:b6d1 with SMTP id d75a77b69052e-50e36c122efmr629758091cf.38.1777294002214;
        Mon, 27 Apr 2026 05:46:42 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:41 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:31 +0200
Subject: [PATCH v2 04/14] media: qcom: camss: Drop top_ahb/axi from QCM2290
 subdevice clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-4-f430e7485009@oss.qualcomm.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX0lVZgWfAeLr/
 iPAnWIUlxvYHu1v8dK8L/C4iLlqHuOaWWQyShwLr4hGi300x5FqFJsdjAiKRut2qWZ0+tN0VjV8
 DVJzXk9TZjb4wLXMKuJWxrJf+gGqBBSjedQCl1u+S64cq9E5cbaomRnqLbAx0oKvNdOGgU24Awi
 /2geCXvPbSiL+MZhvvHYpp1Be83jLNSeD9yJ6dWa0/n6EpbrLNdxUJsVu6zFmvRmAtIRzDOv/Bl
 GMbEbuG4gkjY62lU2rMg2ztehOrt+NpPr+yTofj9vNW8To1eTn7ss839UZs5NCA68ke5d7enRu/
 xcBYY1KhfHyBqK9yi0H/yr5nW3UMtOAOACvndukWLUXn8gQK7gI4roIgy9WC8sZ+FfXfdwMnmTu
 j3kcTjVn4E4bCT2eye1aRap53KPb37ra8lyNYwzwbsEGQx4bGcGIS6EaJpMGCVZAKo4XbZlZWQj
 /7MT7Q+omE4l7Y5wxyg==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69ef5ab3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=yFrQIQtVvbDJ7NVWecMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Q6S1I-_uiJU62F4gPs6717Ge0R7TLRGT
X-Proofpoint-ORIG-GUID: Q6S1I-_uiJU62F4gPs6717Ge0R7TLRGT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270135

Remove the top_ahb/axi clocks from QCM2290 subdevice clock lists.
These clocks are now handled centrally as a global CAMSS PM clock
and are automatically enabled when any CAMSS child is active.

This avoids redundant clock references in individual subdevices and
ensures consistent clock management across the CAMSS pipeline.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index b2b0afc3fb5f597622f9b4ebfee2ec6703bf0890..1fa42565c28a8cd461771821518875a8f468834c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -664,9 +664,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
 	/* CSIPHY0 */
 	{
 		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
-		.clock = { "top_ahb", "ahb", "csiphy0", "csiphy0_timer" },
+		.clock = { "ahb", "csiphy0", "csiphy0_timer" },
 		.clock_rate = { { 0 },
-				{ 0 },
 				{ 240000000, 341330000, 384000000 },
 				{ 100000000, 200000000, 268800000 }  },
 		.reg = { "csiphy0" },
@@ -681,9 +680,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
 	/* CSIPHY1 */
 	{
 		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
-		.clock = { "top_ahb", "ahb", "csiphy1", "csiphy1_timer" },
+		.clock = { "ahb", "csiphy1", "csiphy1_timer" },
 		.clock_rate = { { 0 },
-				{ 0 },
 				{ 240000000, 341330000, 384000000 },
 				{ 100000000, 200000000, 268800000 }  },
 		.reg = { "csiphy1" },
@@ -700,9 +698,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 	/* CSID0 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "csi0", "vfe0_cphy_rx", "vfe0" },
+		.clock = { "ahb", "csi0", "vfe0_cphy_rx", "vfe0" },
 		.clock_rate = { { 0 },
-				{ 0 },
 				{ 192000000, 240000000, 384000000, 426400000 },
 				{ 0 },
 				{ 0 } },
@@ -718,9 +715,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 	/* CSID1 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "csi1", "vfe1_cphy_rx", "vfe1" },
-		.clock_rate = { { 0 },
-				{ 0 },
+		.clock = { "ahb", "csi1", "vfe1_cphy_rx", "vfe1" },
+		.clock_rate = {	{ 0 },
 				{ 192000000, 240000000, 384000000, 426400000 },
 				{ 0 },
 				{ 0 } },
@@ -738,10 +734,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
 	/* VFE0 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "axi", "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock = { "ahb", "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
 		.clock_rate = { { 0 },
-				{ 0 },
-				{ 0 },
 				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
 				{ 0 },
 				{ 0 }, },
@@ -758,10 +752,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
 	/* VFE1 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "axi", "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock = { "ahb", "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
 		.clock_rate = { { 0 },
-				{ 0 },
-				{ 0 },
 				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
 				{ 0 },
 				{ 0 }, },

-- 
2.34.1


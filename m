Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522DC48FF82
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363841; cv=none; b=oShO7fpPXfohBAdXIg2W1d0jBsSM3zkXoQlxQ0P4Qw4NaDTRFaxjOwisEkXTpGYgGisUK3e0UCnckTI8+0hhWPz5VVS5P8cMEx/epxUQTXN/8Uz+lkEOr3Gu25lBERmGgfj69GoX7QdM0PeFV9U4UqMCzJcgjX/FqfsymtPDszA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363841; c=relaxed/simple;
	bh=KLQl3/gkN7fpypq9JiohBczcREnomw91nTQIXeaxcVE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SK6nQjMHr56u588hXAklmHqU0ETK3Egshhb1jFyLexpfWi17aD3jJLlwMaNtQyD99pJFblkyBZN0900vbp7bSOrh8Me8ed0OtxjRU9U9j/P+JcNTPKz9eMg95Ubz0Y1aoyUIsaR8vu54Fcd9opqzQEbSIvRsCKmYnN/in854F1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I08wARvT reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I08wARvT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jnQa3334832
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 09:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yzn1zhhPwSq
	lWxTlzUkJbS1aYaRGTPDSXA3CfKNAD2c=; b=I08wARvTzzs83+xEOai4teFSnHR
	Npnjhq2sH5+AzH7sg5cqzB+n8Euyee1mBJsoGvz3/h42aRWQRlVto1RoKI/c0gXY
	JB3JOikOG5VyURtW+nEzmgcY7/gyIgunqOo/cTOhSQzIuhgjRA1PWHg9w46Vcd/U
	f7F+LOHjKvgXVONoRuKttgltsmjwvCJD/A39YS6p4mLA/QmWhI/HTdYipd/TlPni
	Hjniam31Z0YBACEinaKmuRPHuP4ljzb2pb1PvsPDcVTRI1olVFVsuiGm4N4Z5Vid
	vSfBAcqhqgwOE4Jz724FoXvM9fT20rZg7jQeFHC4VIxicl2CudtnjOKh99g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54623b4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:03:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e46c120dfso400264785a.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363801; x=1791968601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yzn1zhhPwSqlWxTlzUkJbS1aYaRGTPDSXA3CfKNAD2c=;
        b=Un1NdTzb3gbansTiLNCInrbbgCbW3tB7zdDIccDTYuPo7GFEd/yn2wo+7jjZkCZma5
         Rivk1QR8q3Bb40Sw4S+9wt6aQ9BapX4d94I/CGEom8arAhKfClNZjf3EUmIMILi3QunE
         FKpzHMxeLdW5eLuF4AMXuGp9865O+Ja7ym9Cn8TEqouEF11Nz67AZNToFvvelOkOwDY7
         ZZDnekzSeGTfAmXEUcWWYx8ikhKfbTUEodec/8WBM6z9O0R8lwSkohxyWRhW6cFYHUVQ
         C2bTdpTJXPDeRgM2xz5a2qz0oMcCI0OXQZrzINshF5nULfVEMhoVZEnRo/1uIaCbnS1X
         O8Gg==
X-Forwarded-Encrypted: i=1; AKwUvBz6GylUfAKxbUeDy7b5dcpXDbTZ6fRisHQ3wS8CP0jcS+4hvYjPK9Q19JeGuFIlGJBg1gMLCeqBSBm1@vger.kernel.org
X-Gm-Message-State: AFuF++niwvCEjlSMq94enJQ0oIjY1pw5WME3mCPB2zg2QYu9snvn26NA
	q8Np0bj/Z4vWe3O96RvtuUkwLYIdB/dvtXKza4LMaOttCfdLgPZpZahPsmRJ1L5QRqOWeKwP2Ys
	J6DqOC9osjb0o7Iqd03raL/6VMbSaukuOeJVzMNUCDsT0Y5m+iYbRia+QS4HJE8Dk
X-Gm-Gg: AYBFou1yhfnpzjy5Irfg1IKU0IxSBniLsDhwIRGT/bUHleOnTqM3fttpK6j/8shJaAE
	ykdEC2PQfB1/ejdc+NDFUofbVb9R9wgFqreNynO8zYLcEjNS9ByU10A+a45ZJhEG2dZSltpRTr8
	gsU/4oZ1oOS2Q8xxxZucXVexUpZEhI9hPpJqYkmRiY0I7/smiAiOWFtL016goz0cexoBGiLDfMS
	py+tqjrIxE2CdGoZs/wNqiOLmgflRJmJg7AwDjq75wcb7ozRvnG+V/CU1nV0zHeGVaA79GlxFSW
	eba7tJFDiBeeLmcen/QAnBSE3JbhlzcWIsi4dM+umEIkaS9vE/20z4vOGtg=
X-Received: by 2002:a05:620a:4553:b0:93b:eb9a:ca47 with SMTP id af79cd13be357-93e9b757fe3mr304085185a.31.1791363801001;
        Wed, 07 Oct 2026 02:03:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4553:b0:93b:eb9a:ca47 with SMTP id af79cd13be357-93e9b757fe3mr304080485a.31.1791363800507;
        Wed, 07 Oct 2026 02:03:20 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:03:19 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 45/45] media: qcom: camss: sa8775p: add pixel path resources for QCS8300
Date: Wed,  7 Oct 2026 12:00:41 +0300
Message-Id: <20261007090041.3732717-46-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: H7U-bH6yVBrQMerEJeAhhl4SlgPPzW--
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac60ada cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=9gHn7dWuMxK2nO1hvMwA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX2KsdVLpJAtc6
 I4lTfK+TD1+UTxCBlPhqkhOc6ivH2DBE1q4SzQx3oeTTYOQk7dKhPqTJZO/SxTfhi3V3tkCSYj1
 5vl/m/kr56M3E9WE1Sf6XG+djBwQnbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX13VjOLlRhcPD
 rkYcCAqJUVAyGyM7sYXVbly0SHTLYD85gcX8rrId1AN9ikpmCI6Wmbn0S32Rv47UjfIbgKUiCHo
 whQzc8Zi8t8KiAkxeBAt/QvAnZiJlJjNsrABIYX/cU2bhefM62YFC7JsgZAJVwISmzDTUYXWtRR
 6U3B2YFfl98vwHNeDj7cByqUJ07JFqMxSNuAy4jIJCBxWqUQ9KP8G720eQPEFwE13vprkNdcoVe
 GgVAqKh8OchI221zXiKhUdkS13f8/H4bTJj3p+PL+9YDLnL/eUufuEZNkIhGIA7ZEUtO8T22dfv
 +Uvw1J3do2H6mezSOppZi0ZB3Ne7Hh4wps4ZNzYSU+zLCJJKBDKTnKP4vcw244bYEFxZk2Nll8l
 +t5fR6oK9hv5Vm3O3qG9SE9Y4VwX5ARYq6tVOSKuCN8gwt852yIHZPu5qI+I7NRKpXv+ux84KDg
 90cFfSEqyhx2mUJvCMw==
X-Proofpoint-ORIG-GUID: H7U-bH6yVBrQMerEJeAhhl4SlgPPzW--
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>

QCS8300 shares the same IFE/CSID pixel path hardware as SA8775P, with
one difference: QCS8300 has 3 CSIPHYs (0-2) while SA8775P has 4
(0-3).

Add csiphy_res_qcs8300_pix with streams_enable set on each entry, as
required by the CSID pixel path driver, and a qcs8300_pix_resources
table that reuses the SA8775P CSID/IFE/TPG resources together with
the QCS8300 ICC bandwidth paths.

Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 84 +++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index a0b51c12c0bf..4233357321c0 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4469,6 +4469,72 @@ static const struct camss_subdev_resources csiphy_res_sa8775p_pix[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_qcs8300_pix[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 15900 },
+			{ .supply = "vdda-pll", .init_load_uA = 8900 }
+		},
+		.clock = { "csiphy_rx", "csiphy0", "csiphy0_timer" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.streams_enable = true,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 15900 },
+			{ .supply = "vdda-pll", .init_load_uA = 8900 }
+		},
+		.clock = { "csiphy_rx", "csiphy1", "csiphy1_timer" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.streams_enable = true,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = {
+			{ .supply = "vdda-phy", .init_load_uA = 15900 },
+			{ .supply = "vdda-pll", .init_load_uA = 8900 }
+		},
+		.clock = { "csiphy_rx", "csiphy2", "csiphy2_timer" },
+		.clock_rate = {
+			{ 400000000 },
+			{ 0 },
+			{ 400000000 },
+		},
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.streams_enable = true,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+};
+
 static const struct camss_ife_stream csid_ife_streams_sa8775p_pix[] = {
 	{ .id = 0, .pipe = CAMSS_IFE_HW_PIPE_RDI0 },
 	{ .id = 1, .pipe = CAMSS_IFE_HW_PIPE_RDI1 },
@@ -6698,6 +6764,23 @@ static const struct camss_resources sa8775p_pix_resources = {
 	.link_entities = camss_ife_link_entities
 };
 
+static const struct camss_resources qcs8300_pix_resources = {
+	.version = CAMSS_8300,
+	.csiphy_res = csiphy_res_qcs8300_pix,
+	.tpg_res = tpg_res_8775p,
+	.csid_res = csid_res_sa8775p_pix,
+	.csid_wrapper_res = &csid_wrapper_res_sm8550,
+	.ife_res = ife_res_sa8775p_pix,
+	.icc_res = icc_res_qcs8300,
+	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_qcs8300_pix),
+	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
+	.csid_num = ARRAY_SIZE(csid_res_sa8775p_pix),
+	.ife_num = 2,
+	.ife_lite_num = 5,
+	.link_entities = camss_ife_link_entities
+};
+
 static const struct camss_resources sdm660_resources = {
 	.version = CAMSS_660,
 	.csiphy_res = csiphy_res_660,
@@ -6873,6 +6956,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm6350-camss", .data = &sm6350_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sa8775p-camss-pix", .data = &sa8775p_pix_resources },
+	{ .compatible = "qcom,qcs8300-camss-pix", .data = &qcs8300_pix_resources },
 	{ .compatible = "qcom,sm8250pix-camss", .data = &sm8250pix_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
-- 
2.34.1


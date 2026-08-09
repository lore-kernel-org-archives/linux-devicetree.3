Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B09214812
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 12:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786278642; cv=none; b=XhokYXy6vzFK6NZ/bkeSBfvUUB186A1JiQj9Xa52lPlxXq+x5JRGrF1ddODD5Lw2DAuwOgkXJUaE04TZqw7+5i3A8/4o8bLnb5CaKkz1bxFwoaxZ1fSG12JoKdh0Pu714QyhY72v8Bqjm1w1QE29b5n0FyB1BOGSGf5azTPHrgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786278642; c=relaxed/simple;
	bh=B4aq1yOKEZGsE775NUNcG7RD3TIx3tEAKPyIW0OCFew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QsjpV7nCtxRf+/5P9BV3HUrHZMVGhU2MHfV5RHmEzJ3jMbMfep7xf76mnuUeH5hEkya2ZtDBVqNd8HvZFKTOXmKFwKRV5iFxoXp5pAybqZ2VyRbueuRQ/DZTK6hPN5CM3bP9romneEjEiAVBhl5HghULsTZi2u6FEfWJ/YqxIhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z6AtAXLW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R8Vpv7Pn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z6AtAXLW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R8Vpv7Pn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C1g0u2369546
	for <devicetree@vger.kernel.org>; Sun, 9 Aug 2026 12:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UYo5Cg7K0tncVfDjQFA209BANkgOUDdVw0Wtrd7/h48=; b=Z6AtAXLWozwOSU3l
	JqyB+QodsjJXb/P+YmoZSPFw3deOCzedkHEMtjzoZwhQ6elXF31QxhHwC9f4dN40
	T25FTv4cBtbYZtiJbEhbum5e4x/DDwXilh4RGZbweqTpBerTi3v1nxbi7oSlcrJP
	N1InntDJHxdrtEwD0cQliUbq+PUfXeD3854uzpJTsmF/3sE4ZyyyRKpQ69EALRqw
	e2EaFYzCzqDanwxdhBGxgCedVBK/5XARz2t6Eouo0uETh9eHfmpnzd5TpV/fylO3
	Ar/DGEobFoL06oDcM4kSqFFwl/x4DwckBVbhAf8awJoSZvVSr+AHP10UeIjjXQ7S
	QYH0AQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fww7ctrwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 12:30:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso1423705a12.0
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 05:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786278640; x=1786883440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UYo5Cg7K0tncVfDjQFA209BANkgOUDdVw0Wtrd7/h48=;
        b=R8Vpv7PncAUhfcF8nsIRbgYWZqsAfEtI60mWH3xLp1Y4xOEJmqmjqS2W2P56BFRBIp
         BNcJAzDJegI/lmTqHLvM4Xp3c++T41H+XHnF/CeWpZrNt0PswLrafpS4NLu3AwX+xOFq
         0r8UAyYxt/H/yCmQ2WSI0Z2dkrtS8GViK0LNTwyNUcigwcpzxuCmgdkpA9Kf+cxpe6qQ
         YGZ3Qi1WLjW3cwGJbGSdqAUKKAWfGgvEZnf63qo92g29KMqEu0m2mKxMVRtnIuQ2PGzU
         sSbWr4ArcsIW+A+sk5HiqZ2yP2tUb2i7dBKJ2e55es4Va9yyZ/tvZF31h0/bK/gnvPc1
         o9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786278640; x=1786883440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYo5Cg7K0tncVfDjQFA209BANkgOUDdVw0Wtrd7/h48=;
        b=rH9tTQsTsFyN7PlQJRUjIixc5sltdpO3IaeridQr/CoXWZ+BjubKHTHB6SNTdvbB7X
         wu9ilXD74jLuAwTFBl2WBYJiK+azSzM7JFyAl1DT1fUf1ajmSz3xm22a31OJaOkrx4fm
         jZWepipv+hOG58hSS1nMXhLw4Fv3TPWxAsYKvVJWJdqzg9vbCasQXW5dFWv3KsuL0wXd
         GpedvCf7EI3T5ksFOZ6lAGr+zCFHJhghK6a5JUYT6ZeBJq91U4M8DldplGO+tkts5yUR
         NHvJRmmWBkBzrS0gr+dqaZfLAuepsOZSa4moJJ+ywyj9Tqhyaaoh5K+9wENc1E9ips1t
         orWw==
X-Forwarded-Encrypted: i=1; AHgh+RoHo6mJ/qZl4ZDGn8cenzbUalsu8MDD2ace7YAi9+uZ8Pe3zO8dGzWk+mnq4uzkA8NHyiyj/OjzIf17@vger.kernel.org
X-Gm-Message-State: AOJu0Yz62bjSON6dClmNl8GgcgSJ4PP2AuYruRKS0KqBuFqsdWLPXuJU
	0A3tXdzrkeWOi+qm54JNinnf2FjAeUYWU78n3sdc8W47cFvNovJRuIYCzJSgQXYkZv464oADqdC
	w+j0xGN/fsO9LLOKXiKrSi3Oe0wAyYzfYcm4SYktLM3BWo0FxbQc8uqyUsm6riCtc
X-Gm-Gg: AR+sD13Y+BfsoBm8VfuZ0fcWq3U80iOqX8JiPJxwkKid8eaTDGn+9XzfNSbpNcdZ3JF
	l976DPrBNLoegExt44YdcRTvchj+yHuNPbrmq71LtigJLv+HFR9gAqjwKuvZUMxaAXziFTBrZst
	g72jwSfZhJHCq33rIxRtzgKO1YOUJMy0LgWBfGAWQLR+FnbNwBSB2Uzp+cm9lbouPborwK5zLIv
	25kEUnz/1vzPaDpdvrWFI7pr0HldJsjINb5c/8w77NVcQfyZ6MSmKRVdumPtV98Mqk/qmBHHyyY
	7ceAD3bSnPexqqKRba9X2iu8Qt1HQVAcU/28rG0pHQyce058SuG/SHxKLL0vykgdR9+2YJygXWU
	VB8xyRyeHgUbdpx9/MZW7rVusx3Wddg==
X-Received: by 2002:a17:90a:fc47:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-3903c599361mr40201653a91.1.1786278639706;
        Sun, 09 Aug 2026 05:30:39 -0700 (PDT)
X-Received: by 2002:a17:90a:fc47:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-3903c599361mr40201572a91.1.1786278639160;
        Sun, 09 Aug 2026 05:30:39 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb88413sm51842997eec.18.2026.08.09.05.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 05:30:38 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 17:59:00 +0530
Subject: [PATCH v8 4/9] remoteproc: qcom_q6v5_pas: enable QMI TMD cooling
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-b4-qmi-tmd-v8-4-b15d47adc379@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786278595; l=3908;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=B4aq1yOKEZGsE775NUNcG7RD3TIx3tEAKPyIW0OCFew=;
 b=jCpmO6L8cXhdRBW9Wt+P9cCZ/Xw0NU9eM5cRXhlOXAVsc0LTaypQYNlUKBuRbcqG2qDaxK7kR
 Z8goDg5+xHdD/iUAcI1OTwd6w4lnc85pdRU6T5PsYrE/NGG9I4Qh+mD
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: cY32yAoIISe0vuPO8o-9lQO85N3E7rJy
X-Proofpoint-ORIG-GUID: cY32yAoIISe0vuPO8o-9lQO85N3E7rJy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDExMCBTYWx0ZWRfX3rTCxLO/IbBE
 MknB93yKTk6EDRzwvsbXdZmr87pqTCUhLaPWTiCEgNuj/vrSvbyzfudS2cWD29szt//E1SW7/Qr
 dO3DVlhM8RUtHChf/ul67llZ3AJCupnHBDRrbBNLjoGpHjKUSj9mHu7VMh6k1TjysEI/OKzcl/9
 cSG6Uu+kjCk4uZVgKo5qIW0n3LtTKdQVfIdsx9vqGgBK4h6HK5B6BHj+Llu2iqRcnhwrAORDQAe
 Cchf3I8AGD1vrV4nUpmBTxo9AqeXfLOgGIrCKApqpvFsV2Fy1ly2uyNas1zAI5MmWkKRAdmSu2x
 tCg/4ByDxfYPs61+gCR9hG35ypJiNoyqKLBR0pkvyLkdlTTIZNqJUSn7rXv046Qxn3+AFGuaSRl
 RUzyOZL9Xu+ZpC19pfAg73eZiX7AY8IgEqfO93uxEXUSm9Vx+87bdWJCmJfU2F6a6reiyEVGTAY
 geHl+WoRwO3ER/CAd6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDExMCBTYWx0ZWRfXxRwg6Q0Q6Zwq
 Q115FY/smhNtZJv0T/3cPjqRLdyxI0umzm6rfMh/44mbT+m7o14JqZZbj3y0c1JDb9DffHKyU2W
 u/0n044TXUSTGOYzCn73vqsp8buPXRM=
X-Authority-Analysis: v=2.4 cv=IPsyzAvG c=1 sm=1 tr=0 ts=6a7872f0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=j6jQExit_mXiN_RbaP8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090110

Enable Thermal Mitigation Device (TMD) support for PAS-managed CDSP and
modem remote processors on platforms that expose the QMI TMD service.

This adds per-platform TMD configuration in qcom_q6v5_pas for:
- Hamoa (X1E80100) CDSP
- Kodiak CDSP and modem
- Lemans (SA8775P) CDSP
- Talos CDSP
- Monaco CDSP

For each remoteproc, the configured TMD QMI instance ID is used to bind to
the TMD service running on that subsystem (e.g. CDSP: 0x43, modem: 0x0).
The driver then uses the corresponding TMD endpoint names ("cdsp_sw",
"pa", "modem") for cooling-device registration.

QMI TMD identifies mitigation endpoints by name, while DT thermal bindings
reference cooling devices by id. This change provides the mapping
between DT cooling indices and QMI TMD names, allowing remoteproc nodes
with #cooling-cells to act as cooling devices in the thermal framework.

With this in place, thermal policies can request mitigation from CDSP and
modem subsystems via QMI under thermal pressure.

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index b9c01ce5024e..36115b24b859 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1061,6 +1061,15 @@ static void qcom_pas_remove(struct platform_device *pdev)
 	device_init_wakeup(pas->dev, false);
 }
 
+static const struct tmd_name cdsp_tmd_name[] = {
+	{ .name = "cdsp_sw", .id = QCOM_TMD_CDSP_SW },
+};
+
+static const struct tmd_name modem_tmd_name[] = {
+	{ .name = "pa", .id = QCOM_TMD_PA },
+	{ .name = "modem", .id = QCOM_TMD_MODEM },
+};
+
 static const struct qcom_pas_data adsp_resource_init = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
@@ -1218,6 +1227,9 @@ static const struct qcom_pas_data sa8775p_cdsp0_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sa8775p_cdsp1_resource = {
@@ -1236,6 +1248,9 @@ static const struct qcom_pas_data sa8775p_cdsp1_resource = {
 	.ssr_name = "cdsp1",
 	.sysmon_name = "cdsp1",
 	.ssctl_id = 0x20,
+	.tmd_instance_id = 0x44,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sdm845_cdsp_resource_init = {
@@ -1263,6 +1278,9 @@ static const struct qcom_pas_data sm6350_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sm8150_cdsp_resource = {
@@ -1278,6 +1296,9 @@ static const struct qcom_pas_data sm8150_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sm8250_cdsp_resource = {
@@ -1362,6 +1383,9 @@ static const struct qcom_pas_data x1e80100_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.tmd_instance_id = 0x43,
+	.tmd_name = cdsp_tmd_name,
+	.num_tmd = ARRAY_SIZE(cdsp_tmd_name),
 };
 
 static const struct qcom_pas_data sm8350_cdsp_resource = {
@@ -1430,6 +1454,9 @@ static const struct qcom_pas_data mpss_resource_init = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
+	.tmd_instance_id = 0x0,
+	.tmd_name = modem_tmd_name,
+	.num_tmd = ARRAY_SIZE(modem_tmd_name),
 };
 
 static const struct qcom_pas_data sc8180x_mpss_resource = {

-- 
2.34.1


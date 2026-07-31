Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64222314B96
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 10:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494109; cv=none; b=u5C8PTtl3+CjOUcE0ap97V/ZThNkN0XLvwRpjXVVXvYC++yUgyuQNmQ//pucqmsKmWrYdjn2MEYzOXii2lF01X8hIaor9Xm8wsOXjnzPhJiuFi3KmYTZvqYlwzo74VKdgn/38EotWX/AlZtpON01cYHXADLfh4fbnpBY7CEceys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494109; c=relaxed/simple;
	bh=B4aq1yOKEZGsE775NUNcG7RD3TIx3tEAKPyIW0OCFew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pLyrp46ODn+dwbaF3KfLZP5TxQUGeYNgMoawUV0TbsYGHChq/W/EEBsR+RGYe05E2ZeVpkzimBEir781gSdtAO/EQO6QGcK2ppWWa0zgXJAqe7jiijFZnDnrzWy0QrKUVwFOHskkZqgCvwI94EMWLmKq0nW3Y4g3f7ON3CXkF+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bW7epnrh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e7Dt9xJd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bW7epnrh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e7Dt9xJd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VAC1YP3512155
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 10:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UYo5Cg7K0tncVfDjQFA209BANkgOUDdVw0Wtrd7/h48=; b=bW7epnrhOxuz2by6
	RwWON8T9R33FIo5e/tpSLyNlGi5XEX3PJ3mUrkmRa22nEQT5NTu7N9DYHUjkYxG0
	tkqOkESunN3HioCA1GpGbZnV6ww0Csf+Y92M1azUQ1XbG4cpM2y1KqQsjAjJrTvH
	iG7IrPU/ydOGkYpHLadonMzWvGsNawJyIqVpxoI87WPwVoQ9gl8BJAlBJcQIz4iq
	0j616ZL9ZKGbcS9ddcuLpk/FRbzq1vgMCsnFDsyq3YHVga1a0xc59K+HcIZQsPjU
	evccQSDq/3c3C2MYAJkw5bcWFmouwfnodgTRfzioKp6WlFP34HHFVx7wZanBpqxa
	RIOCWg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frsf2g4ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 10:34:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1316386a91.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 03:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785494086; x=1786098886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UYo5Cg7K0tncVfDjQFA209BANkgOUDdVw0Wtrd7/h48=;
        b=e7Dt9xJdw3VTaHpqfg467oxPuZ/AnwTMhvBzmdjOivzLBpsjaq9FbeauASZvlpxdD7
         1155BcZ31A9sS+OB03KIqmA7S9wT7/VRW5TadW8axduQSdSL+tUmjjVJKLy0p6C41Ufv
         PDkq4JIxaOjC9bSsE6iKJnabhdas5C4aVeSs8yADGxGfJBv17Q89RwCjHP+Qe+gbhrEy
         VPpI11+OUxuIgQpTNic+GxTIeerfRyv1Jy1B6Mps8CUY7sNaYlNYGNVLZnFEGTOK4ItQ
         ao/B5YbIYSJPfKcbFkfMS22qOqDeCUy0uv3CrbyizbOBFnEjWPRDYsIAco7f5jMWoSRq
         C75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785494086; x=1786098886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYo5Cg7K0tncVfDjQFA209BANkgOUDdVw0Wtrd7/h48=;
        b=sUNKnChcaxrGFkCqlAG+AXqqGNDb9j7uC0yamcGvP5k3xhrEGQQ5vsoZhewiVfxWd8
         1vhdCcFiRTm+WMbXTSdZR0hrI19TtYOr2rTtkVEFd9XiElwrKCpSOcsMrB7Pj4Pq+Qx7
         vzK8gBgWi3LybkLx0Um77jmszxfM6pqs2U3rAHOgLPWd2A96ArD85NA+NXAn4JmFYdXB
         ityyBt4m+HcpunnUu/HeQqcM5v0dB4eZUKSqmcb/XnjujgmGva80kC2S1TpvnzuzTIbS
         KeAt+z1hSV4SgQvuYxICslUvfhfNyAevYTmK/aQo27c+YKo3bBajCQtx7smjmUXyFsBD
         yIEA==
X-Forwarded-Encrypted: i=1; AHgh+RqAdp3xcsH73Dw0H0QjnZit/mheQ/Rephp8UGd5oH3FId1fbSd+d3f/AKQ0mXBBsvRigPpkIdaUbZ9k@vger.kernel.org
X-Gm-Message-State: AOJu0YzrIEoeJHh91tsT9JjiSrLIz9/lkSZ0VebRx+A1iyhFwYeYfgO6
	cIkVPViOjtXbOIU3DTp8jERCp/Se6IJbPFiQ5LzwmLj2HDJjrOrfu6yaI+FaFDk+xSPqNtgGhGN
	HUg7V19Gg7IkmHzLbSeVT4yXva4isWHAnpdgvVsW0C8S5ST+GVH0Whc4r39rii8BC
X-Gm-Gg: AR+sD11jtJ3guM3hCRIu3eAc0ldQ7uh23shWkGZRtbFnfS0ao25vg4whIQwrvRIXP4h
	TL52E6aOlkPaFbyS3bhRUbnyECg/HIwlIJIjrFnIcdzywWc9UX2wQl6jqKb8lMN/7O/OiEP1H2g
	D+M5VwkcbZhDWiRWrbsXlCF9urjlo3XA3FmSWBzi/7CIKk9UgbATpUgcudpZ5aesGGjDZyMU4z4
	hsxHwDkkJqyw7yf8xzaOSwCI45vG3dVluP2iZ23FuaORLUEKTVvm+nRQ+sOs+4R27CW1Oq4H2ok
	fYjMv5SkNAxcNWSU3ncY9GC7L2QREj+jQDeSyvkqIBYJ6r2eknBEJsbsOhsn6fSSJ0pMzM7BMNK
	ZbUZtZA0ezKmIUp5O8N7YzkRII/JOzg==
X-Received: by 2002:a17:90b:582c:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-38fb11177a1mr1556066a91.4.1785494085468;
        Fri, 31 Jul 2026 03:34:45 -0700 (PDT)
X-Received: by 2002:a17:90b:582c:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-38fb11177a1mr1556005a91.4.1785494085005;
        Fri, 31 Jul 2026 03:34:45 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm8493680eec.28.2026.07.31.03.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:34:44 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:03:44 +0530
Subject: [PATCH v7 4/9] remoteproc: qcom_q6v5_pas: enable QMI TMD cooling
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-b4-qmi-tmd-v7-4-3befd44403d5@oss.qualcomm.com>
References: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
In-Reply-To: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785494047; l=3908;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=B4aq1yOKEZGsE775NUNcG7RD3TIx3tEAKPyIW0OCFew=;
 b=Z52/CLwmcevZs2F4ktsX1v4aBRP/j4r4ShOor6CvRb5YbluiF2UNsbVlKHtPVD+nPQouM4b2F
 nbNRxeZDkJjC5o3Xo1x1nKOnD/OE/fNiES5XcWaaGvMjRDPE5zO7ZAb
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a6c7a46 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=j6jQExit_mXiN_RbaP8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: IKJ4Suk3Kj18NVNjsONWc8S_iY7oH1h8
X-Proofpoint-ORIG-GUID: IKJ4Suk3Kj18NVNjsONWc8S_iY7oH1h8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA3OSBTYWx0ZWRfX0c3P/YVprIwF
 AZtpAP8gbBkuApc7nC28iZH6GvVOAetS22bEG/KG+S9u7kaBd6MnnnRVT+vPQWUri5vD6iUE3+E
 wk9WGog53kh+QwPeSwbGP6Ca0ZzHzeg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA3OSBTYWx0ZWRfX44UByHmR0DN4
 UEaWWUYP5ltO8Ee9Xb9p9JlVnl4WDqR5sqNm1jLoZPjLUURgTSrbgwkSoBwoI5Edv4cP/YvYvYg
 xMAIrDrBZfahQqpsv5dLIWdfTuRKe9JQ6wjoCJHw1toSuYxgwdV+DiQyRAy9B5MHi3Gz4TB6VTL
 ukMHrHg/+28QXCusUIhix1lkEnTfTcE/nQsHF5wWgyn9v2Jp43Nzj34t7U65npUAUibaKkb/uap
 tNHzvjP1tDQsojS15uxNlmZeXOs+1lLazz3zb/2hb1hPdNQjv+BLfJFOIviZzgg0R3MhzorwwUP
 CZXL1ukJQaxIKE60AWmiyolafId08SowuuvsVl+sgmAQEwGpFNIwCFdOtlq3uy2NTWZStVhr+HO
 kM6FTtLuRf25vul6pl2hOnHTjP0pYCRxXcU8dhXYrVbxCgpnjWEcw46Y3f3IzWHacyiSTaJf1zG
 RXUZhAw1bbnOx1X8+Dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310079

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


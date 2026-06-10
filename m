Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C1E3AB5B7
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079182; cv=none; b=AeLeXKoI8oRyCvvc3GDieF2FCSwEHcjpNgH/o6iTdoHsQftOwXpQtIbDxLRt0By4i7qs5k2393jlsizgR19NJs4cAa2iylEmwemNycWVPSWLuQuGtKnmdktPBHHS8Xo55xtiV0AlHSRlcnjqR8eIYjF/U+T1+NMhVQ9lzCt4XWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079182; c=relaxed/simple;
	bh=v5y2S4KEuK9ll8FKbt2wx7n2tKCwSSz3NBpnzhwlnk4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=myRAQcKkn0CDqr/QKq32hGc02ymutxEnfHmkxuhf+yln3DswPVCykbsY+HWMHn/3jEf62g8X6iS+qwHI5XGezx8K5TO4J/Iw8zioXdXU8/GG+YIhKSBRuooygld6mdWbLkvGCoHDuNG/EYNH874tAuqaHcH9nfVzAAmYk/EfT2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgO8IG/I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbAkNIiN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgO8IG/I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bbAkNIiN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hs7R3151721
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:13:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bmrPzwjDfZQ
	LqRIOrgrQTwpDk+/Ro0GV+O0RqY/iaOE=; b=XgO8IG/IfJI5VGjZtkEFnUEJqIv
	xIVrLsjMFpAZw3bd4WFNtb1R8d86+dxzPN6+0oFyJ2z2UZJ8ZAaTNsQAUpWQ4aKT
	ixaIpgQIf4ewB2X6Snpor73T+SAwjNK7RIGYxLrpjrLlM0a0NaYXPMtBoiuxAlyp
	ey2DW7aSCnVDerqeuMMnfvogsgLAFckXOQX3Fm1+vRMqF9WhMKbGbzIs0hqnnJpl
	fTJbcNktNlW5bOuZNZQSAav0tBws//JqHVXGmiz4CiL6I90dq3QU7xVdKkzYGrM9
	Cv62hrZ1+Bv+FvhcfS2krLx36Pw2qdGHeBy4h53L545djGX+zdJnC+f7Jow==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnesena-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:13:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf1dece2ecso66716145ad.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781079180; x=1781683980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmrPzwjDfZQLqRIOrgrQTwpDk+/Ro0GV+O0RqY/iaOE=;
        b=bbAkNIiNawCJ3k0hyHLY6JcQtQ1/tQDvucrgFd6I2eVtEdiJaa6HchpN0IN9xqR+wP
         AAVBIgnWyRfwhlDhQOwH+/LPe2HHaJupRTed9AIIHNXrSqM2mF7zy1tFyxRFlK+x3sDr
         1xHYt2vv9AVYGcxofZQOd0txV1/9mWT9q6CAc+R1Y6Qb8jH9JtoFkId0pwhuJIc3YI0c
         mSQBgvBjZ3+GxIWhh/D2TkRvHqypEpVITWK7mERSm3gu69jtg5Hgj/xwo1TxQxyMvKUH
         Fii+vgUdFXCQYEAwvrYlT4dsEvrZJiWyN4DHKIGfR91uSGqaCgRSS0SqIrCHCiypuZh1
         vYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781079180; x=1781683980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bmrPzwjDfZQLqRIOrgrQTwpDk+/Ro0GV+O0RqY/iaOE=;
        b=Qpb+iRkDKRCElGf6wNqC58WNcu1e8HN03CUBQD1/LxnFfuww1UuE2FKXYFV33fcOZk
         UFGRl/g2y3M5Zbfd1FLRPnGNon2UcGZEqKLCoxnpYDrphgqx7rtijYG+9jENu4Y67kpp
         zvMiSQ/0IlHMGOlMnStATTuPMG2LtgLnLh+u51m17u9TFZSwzKtj/033YmCCjPJgiDQ9
         FktaRUD0rB4AOjj6q1yZZczmIdeIelhuJ31Yb3/8WJwv8oxEX2LPcsUFYF6bA4NsBu4w
         I+HjbURiCIv6CDwV6LQjS9NYnvuH5S/A0I6dgdy2xkSoE/ZwXJSfVw4ifaXTku7Hb20S
         4MrA==
X-Forwarded-Encrypted: i=1; AFNElJ/QwfPi0djsyZCWt+OtDpafZ0nOWBeuMOuU/JV/ndo3taz/Vf8VNRR5VuTye+veznxhpIheCtOHrcHg@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk7v8HyvMNNISJEHgVEv9E9vcSlSaKO6C8WZkwk2A4Ga2ymDOL
	mM4w+/D8YLq75lmaOKhIFC6puvqqcAIYis6PqpMRs1N3uzDUnGOkML6W6EG02TKuX6uI96f53F0
	M/pNoupJwZMvn3SOfKjjOTICGgcZWFe2iIULDakWWE50zw/68rQe/wmsZEdFjnA9C
X-Gm-Gg: Acq92OFZ01rMh8shJInnEXEnOOTNcYR7I7VOSB3GeE7CIfpVU4qJjsShS5hqHrVwJ6U
	WQp7073UCT+D7rzbsURVYuIWdkHSWF5hdnzr49BY9py8PNuvu0FP97rvM/f8m7nI1PXSZCSZOty
	p+al8axEyivPCXhZJVUzc1WMr6pHSuhhqYYWM2UFuoHxnDFqmoqZ0yPhEoBBvkCyHzi4rv3Lsel
	a9bkX6Ke12ZpoqkimUmLr36z+ErWXiSAs1VK1+aFdD8cRc+JOhMBPYaY920+2+quEpNF45qwZws
	6CbhlkjF3n+0LlZepjjdQhkT6U5jLj4XaCa74ROCaWPdOpEd87HIqHqCczD3EcE0zLo8Y07UqwZ
	QXsGDLU1wV4E491GK1nP7uxYBirSCcYi8u/zHzFcqdPYp15FkgBugE1XKzmwRnRc2Va1vbbzEIb
	NSrX9IVO0xJv+Nj1+nkJBP1LC7RxddJWtYDp8U0vEJFphKmkJW1etHYYutR3aDWw==
X-Received: by 2002:a17:902:e5ca:b0:2c0:b932:867d with SMTP id d9443c01a7336-2c1e893d0b9mr270665455ad.29.1781079180117;
        Wed, 10 Jun 2026 01:13:00 -0700 (PDT)
X-Received: by 2002:a17:902:e5ca:b0:2c0:b932:867d with SMTP id d9443c01a7336-2c1e893d0b9mr270665045ad.29.1781079179556;
        Wed, 10 Jun 2026 01:12:59 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8679esm228858575ad.21.2026.06.10.01.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:12:59 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/2] thermal/drivers/qcom/tsens: Add support for ipq9650 tsens
Date: Wed, 10 Jun 2026 13:42:41 +0530
Message-Id: <20260610081241.1468507-3-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610081241.1468507-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260610081241.1468507-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PbTFF5eDir1nOwClUEGRTOZ879pzA72i
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a291c8c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=nMt2SIcdhh0IZDtwxJkA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: PbTFF5eDir1nOwClUEGRTOZ879pzA72i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3NiBTYWx0ZWRfX5R1DFg5HtXmo
 062r8RaP9ph/7L94Nc4NSA6wOjoM251gStGG8DZk8tSYg2OA2R1kWystQcxKixttqWTuukNXcu6
 5dvjCuKBUWEKSBerZr++jhlQLL1Umzw41ttGaSm90oNuSHE0oos91k4dlXAeEVrKcwC3l6cAgN1
 zHQ9v2muY5pLl/5XZqJQB0ijDa25ikUIkZ5SFgTikrWvEk2ORNWaWNxQM+JoMNM2Hwkai2k5eN1
 TbZ0FHmk1Fc5IST5v+1C+eKttlFOjNIaV9P8stFXrD993rrUsNhpk8959Q+MbgOdhPnpAaAHpBm
 FrRv1U1nzI1uYEFvDcOrUc26DWoyUvF+j6ojSgrok9zV9ZyPog7Ef0dYZGn5WQeTJpMJRcBzRZL
 p3ef7r+H0dkPrDrkvNh3gMkw9WBTQn29qlb9jFA2qmM1KkziHnNSHj/tTs2UUCx9HPDyWflDua7
 pjFWNISNGBBLZCodH/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100076

ipq9650's tsens is similar to ipq5332 tsens but has different number of
sensors. Re-use the ipq5332 data for ipq9650 and modify the sensor related
information.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/thermal/qcom/tsens-v2.c | 8 ++++++++
 drivers/thermal/qcom/tsens.c    | 3 +++
 drivers/thermal/qcom/tsens.h    | 2 +-
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/tsens-v2.c b/drivers/thermal/qcom/tsens-v2.c
index 8d9698ea3ec4..ef1fee2266a3 100644
--- a/drivers/thermal/qcom/tsens-v2.c
+++ b/drivers/thermal/qcom/tsens-v2.c
@@ -300,6 +300,14 @@ const struct tsens_plat_data data_ipq5424 = {
 	.fields		= tsens_v2_regfields,
 };
 
+const struct tsens_plat_data data_ipq9650 = {
+	.num_sensors	= 11,
+	.ops		= &ops_ipq5332,
+	.hw_ids		= (unsigned int []){5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},
+	.feat		= &ipq5332_feat,
+	.fields		= tsens_v2_regfields,
+};
+
 /* Kept around for backward compatibility with old msm8996.dtsi */
 struct tsens_plat_data data_8996 = {
 	.num_sensors	= 13,
diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index a2422ebee816..e7bc622891ca 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -1122,6 +1122,9 @@ static const struct of_device_id tsens_table[] = {
 	}, {
 		.compatible = "qcom,ipq8074-tsens",
 		.data = &data_ipq8074,
+	}, {
+		.compatible = "qcom,ipq9650-tsens",
+		.data = &data_ipq9650,
 	}, {
 		.compatible = "qcom,mdm9607-tsens",
 		.data = &data_9607,
diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
index 2a7afa4c899b..d9d50d32c962 100644
--- a/drivers/thermal/qcom/tsens.h
+++ b/drivers/thermal/qcom/tsens.h
@@ -657,6 +657,6 @@ extern const struct tsens_plat_data data_ipq5018;
 
 /* TSENS v2 targets */
 extern struct tsens_plat_data data_8996, data_ipq8074, data_tsens_v2;
-extern const struct tsens_plat_data data_ipq5332, data_ipq5424;
+extern const struct tsens_plat_data data_ipq5332, data_ipq5424, data_ipq9650;
 
 #endif /* __QCOM_TSENS_H__ */
-- 
2.34.1


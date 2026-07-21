Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D252D9EDB
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637982; cv=none; b=XsVGlaSCuG6yicWTqHpK4XLqWiY71my1Q3Ixrmzo/oYJx9H65P5SONJNhDfK84jrjvDTOhtIc0sKZzzlIQACbP80ZHL4F2oVSTM50A+YJIvq69R4PfU/Cs/ABZyu014lOvF88H7YOVyS3cqJhsR3lIFfs5HXiUH89Uh2k0N2dFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637982; c=relaxed/simple;
	bh=cg1vi6KWVkG6GZJE0XhJtMpY/+6iYLqwwxaoepuP3Xg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=siPnXm+Y+GRffAVoGXHNnYHF4QxNxn9liMw1jojFyqmgXdCuCuY3YEa/Gszi12FqJCmriGcm2ab3O6xhHtiLoaYkbAOfsScZVDXaA2tXpHXVU5v5uIFf9o964HRPj++AyupYNoRXuYlIH+y0k6dJI8RHqBKbxoyCoZj5DmYeDZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=joHNbvWp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e6W2g+Fi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="joHNbvWp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e6W2g+Fi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARJ2k1385792
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GJWsAzgKII8p+ebiGVgj84eQD0PZ9q+ncDdlyoBkrqg=; b=joHNbvWpvazuf0ak
	9pMDtR32ZrjP3fi3s1PyOqfd+7R2Uol/qE4sNc3BwxBFH09aHuYZ5IUWpqGwfFUR
	oTkLsBX6VbXYo2GKLz0RVbjiu0lnmRyeuIT8CP8XLkRlJFHKhmq5WScTFdfRyh1/
	1rxhqaXqwUCeybwg0lZ3TjzMf6OJqKyJ9OaS7vp4zJucWfXtKTovdiY7GHLtdcJ9
	CIpZWI0MpggmnerD80aNLVNLC0oJKcW6QiHB316ZouG5GSWRWGXvbtWC7Lb2yQEy
	jrMyHa8EeT0uvo1O8H8tN3OqOE4fZSZzIL+hQwtQmpVKMN0LN3lKFZKkBGBjxjAQ
	RRBT3w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se27kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:46:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso8828799a12.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 05:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784637978; x=1785242778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJWsAzgKII8p+ebiGVgj84eQD0PZ9q+ncDdlyoBkrqg=;
        b=e6W2g+FiwJMHM68xpLWKDF5hLmPVwANdQrRgsvmn4SZxTj85Ih8rbwXNQ4U25kUW01
         MgD2BrXrpUcASE6EDy5yHY2KJ/Pz3RiJDb7NaJF6arzmimqW7+bSN/cC4YKd3jF7YMoS
         VhPyjdMCuX7S1GZ/rah5v3GrYYimcT79zwB0Ptd8rloUZO+zKz00kwxPWVvnX9lgDg7A
         vDAKHBC1scUA3D4XphHivLk0LWCAPHx4tQXR5v7hCKOMUZQ48CPLKoYMZ+/mv0vDrcr2
         HSoVnUeFcAocA3xHUgIiDZMFKAvRyVfXWbfX/nlng/eRVCqi9Lkd3Ja4UeTa1UqnvjRP
         0Rdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784637978; x=1785242778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJWsAzgKII8p+ebiGVgj84eQD0PZ9q+ncDdlyoBkrqg=;
        b=CTOnAQAq55Q/GJU7lwaEJgyfAALpTeyZ2yIcmVjLo3YdA/wPK7ObXrJ87IiqRAI86n
         CSSmb/1dCLNebrtMZDSN3wANltoqkTT8kJRYKEU1/8Cjk0sfn2auTcwy/ogsKzkMva9n
         Q5TGrd2vPhBadRCSG5/gg5CmAsPlt8T1H2z0Wic9ukiDig8C/RCIln7ZugVJOEY/58gV
         gdKchXv9MA5WjTk+JjwCktUJ2Gn7zNDD0ODExql2PilsjaduoVFpRclvbzIuHw0hhxb4
         uR3cwMN75H/WdOQ+gl+rkaxPhrrQECy2krrM2yrCEKwN4TMv6dFX3RtGv79qTMFLzD6W
         Y1Dg==
X-Forwarded-Encrypted: i=1; AHgh+RqYiBsfjvalA3+QxNm8/C/mX075Q4C5CgXIQtWwFTfzjm+iK6r9q83/LX5A0l24LJjYz4W9TxPGt2tz@vger.kernel.org
X-Gm-Message-State: AOJu0YxXM7c7QwnbkJbMBGaBLTBNzccUt0fGJwZMjvV+q89ThKbPFYHV
	biKqx+BnlPlwPbR/on+JMmsSmepvV/157vSizrDYf+7glXBJuSUWQlVEx5B+V7VNQn5usiJPdZR
	H0jAicB9HH8FwCqQS1iyhNKoxyzNoSxuSMQ9Izho1tejS3wgrXTfRbBqp3eL5iyZo
X-Gm-Gg: AfdE7clc9TEXBRvOxPPWcvVgbijAVqMVw+nNLumhuwcq0tRkU01tYGApdaIyJNEPjSu
	FymJF0aZRX9HCsrbc9xy2nqVspteqQN1Rfx4VHI3et2OF0XAu03Kbq9LibwTW+283AfBqc35tGR
	+xr1sbYuRVC6wNkCY5j2rp+v54e5djsOLRoGlOFObX4/WPS2r9sm6qbiWOUQh/9QzLaizdV90sD
	/MKQmm+8SzHH9+tXQ4h1sC1/hsyOezgvDATDZS26cUQS2yt/gsBsofsBuPbSjAjS2ypkQFtwqbm
	YJJAEVXYZcMd6Jq1ZVUiylwW97aO/ZALCRRbZYm56z5yydb3o1U+Xi1mEOhkXBrC2kaivSSlzz0
	tFlLs/z6C1cNL/dj2RNiYagElHwgBsTp7y6GOAujCl8EzsM3s/SoM6S4=
X-Received: by 2002:a05:6a20:1446:b0:3b2:a809:ffe with SMTP id adf61e73a8af0-3c3ad5ff392mr19996978637.14.1784637978459;
        Tue, 21 Jul 2026 05:46:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:1446:b0:3b2:a809:ffe with SMTP id adf61e73a8af0-3c3ad5ff392mr19996937637.14.1784637977913;
        Tue, 21 Jul 2026 05:46:17 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bb62sm45258359eec.2.2026.07.21.05.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 05:46:17 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 05:46:02 -0700
Subject: [PATCH v6 3/7] media: qcom: camss: Add SM8750 compatible camss
 driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-add-support-for-camss-on-sm8750-v6-3-a5f841061d18@oss.qualcomm.com>
References: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
In-Reply-To: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <quic_vtumati@quicinc.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 9Roz8YDWdF5685Svc3s8lroI3UZvaZCk
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f6a1b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gE60Ov1lhapgyOv8Ur0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzNCBTYWx0ZWRfX4wMaREOmsTz1
 9Lisxq0VaSN76Vb8JJm6EtNk8Z5lK7ylWmO0YbC6WMxG3jGFgZPrNAllJtJntBGAJTQB8LBPLOo
 2MgxeFpydATUSkYRoKX6veqzVFudhAU=
X-Proofpoint-GUID: 9Roz8YDWdF5685Svc3s8lroI3UZvaZCk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzNCBTYWx0ZWRfX1+j12wNQQLfZ
 5k/HySsYtc5gPVubvK47k8RRClkdpgdlkv3/L3zwkNU8+Cg4vf8Azd6skv4LwxMJU3yHiqzRBTw
 /IWHEyrUJ3ZEihetNsv/jyDLN9sQV2kUz2TdI1fj3J62X11p/EHimVg49m5ISenLG8Ota5XGkQy
 v8d7mVMlxzxtYkceKvnKUUCC0gZhqD/abUI0aVbjkhNNZxF92JFsnDMxXwXd+qiaslppuCyy8Y2
 q7MdHELG24m5weDTU3yrTEal/zIgbqIf7LvaONPxNrW6zEz8dj8ONkwELEiPmuRZxFv36r8qAKg
 uSNEJj2NPdhOd7GJkbgNq0Np1H0MUo8iDUlaT+8JSEt3Q3pNbf6l4+Of8q4QBOFXAyQTIexWO0l
 PUL5Fra2do7qWEgtZ5flPXIDTXeVTBVTSWw3m7VPWxpN0+jLtvOqeDO4MXKDL6XROgLdLNsxjyw
 Z8yC6TIletpPu/lh1oA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210134

Add support for SM8750 in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 252dc2fe4207..9982174ed1ad 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4477,6 +4477,20 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct resources_icc icc_res_sm8750[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
@@ -6068,6 +6082,13 @@ static const struct camss_resources sm8650_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
 };
 
+static const struct camss_resources sm8750_resources = {
+	.version = CAMSS_8750,
+	.pd_name = "top",
+	.icc_res = icc_res_sm8750,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
+};
+
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
@@ -6103,6 +6124,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
+	{ .compatible = "qcom,sm8750-camss", .data = &sm8750_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index cea213dc36eb..7f525ac37cbb 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -95,6 +95,7 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8550,
 	CAMSS_8650,
+	CAMSS_8750,
 	CAMSS_8775P,
 	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,

-- 
2.34.1


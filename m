Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9D23DB338
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513562; cv=none; b=kD2htrosgXI/SgvQpHDFkfYV+73dby/KDoykRpP0Cu7oii1Q5Hy4AFCL1RxGY8JoM8VkWvPl71cA7MwWt0vYrQJzZPbe5kTu82+eDBu8IW3IpXXyO2POVeoXx//bqJs4liJydV/Jf2BXzWI72q9peNdbCdIr+vR8OPrbQ8N6qGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513562; c=relaxed/simple;
	bh=SBvcmsk6MUxbw4wpEkMR1oe86i/24eAZTR08UQLa1/k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SMke2WnVJZy2PcyhZKiuUW9xPEvUCMDrxMqIfjR/6P4Xw2/lSVfHQWSHnIKLj+FYD8fItZikiSe6IoO4+72P7L7Ur5DPLPMmrdf/gZg+35XmwCp5Y5F5PuucWeFUugHBQhJ1HONt099bIklDyFC8XnptdQTs0qZPBia3hpemrX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TDdQABWt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dgqcom+H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TDdQABWt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dgqcom+H"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6LjWg3853201
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=054f37+uxK4
	iJVuF2KPl8I/UYB9t3kzyOe2Z4r5L9v4=; b=TDdQABWtnNhuD/bGEP5Nd+eJsxh
	SEELaXuInMUTOYAOuFrMuNHTLlETsbUBWZ+uBMEChxRDdXe0qAjG+acZj3e/3E6W
	jylJ4QD0soZRIUKhuidju67UWQBonFazTKbCsZeq0lJ2vN7dZ4eVtsTAiHuJDp9Y
	Co7QLdFpfRBIH2tMBVEX9cHkXJJeC5ptBsZ1TFpvALyPl4xKCn+bUHkSSbV5r34F
	KN/PJKSz2I/fi9hmTppl4FfEDSekEYLiLeWP/T2jqmAFlXV93OZ09/pPqSEaHrMs
	urbOidelg45CgHqCZxq/fJpORDkKwxhyvODSRYfHHuA44k5OvzISmYa67zg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gxk57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 08:52:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3773f1eaf91so2187836a91.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 01:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781513557; x=1782118357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=054f37+uxK4iJVuF2KPl8I/UYB9t3kzyOe2Z4r5L9v4=;
        b=dgqcom+HoRrXo/Va+thrxm4gz782l5Owt9L1zxKPzPie41+xVyaAgnzjlKBCyD2v7+
         GmafVa25o4qR1LjCL+0JYhOGoW5lKJlG+3AdVJnVMF6WjQTAllkh51FT3/rf43YxscjH
         nUhAOi3bEyAqjQLurEhLRYN7v7gaEMLfucUtmTe7EM0tzZZC+glCkxPqAw7zaVRIA3uV
         6cA6Zk3aXudCqy/p9URpfYMdvjxi+5QXAqE/UjDn8mVqMeAam/hsh/lKrPvMJy1z6UQf
         HFV9UJbhiNkYrQQWAiU1kC6DsXOQ17Sp7e9e1JBkTvxZVWXlNqWXMtBs7vKDl0JFm62V
         49gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513557; x=1782118357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=054f37+uxK4iJVuF2KPl8I/UYB9t3kzyOe2Z4r5L9v4=;
        b=CqY/MRI5vnm6cYV3j6iH0o1RcP+eBuWDf2E0O6GSLyCDaZ94nRXSMXUPE/88Qph3NG
         vkkZx6Y0Ar9kgv5cL/SomFYOpUplZsg46EfomSoyR72vvtFUAtcLM13RJQ1qN6neBn3K
         7sjiGcGMmUEkbnJG6Ffy1zvQAqcfo2oXG5YJhqwe179UG4DL4eCDL43hX+AHonAwjFCL
         KFH37n+sEGpDaL58RO2E0KDXnf+dfj3Nq5blZWzyDFv44RS0W6iqpk14Ym5V2dwQOBML
         ZdzFHSSysFvEiCAFbftq5YfAmnRD6zcG4pC5o0/VMvBSvdkzsYwKRoBdjl117B+XV9g6
         Rwsw==
X-Forwarded-Encrypted: i=1; AFNElJ850smZH1/EXLC/SoIAv3ON4aNpOkJ1Bl4nuOs9v0Df0kjValjPd1zpS5zKUS4nONcgEMMRNV29yg+W@vger.kernel.org
X-Gm-Message-State: AOJu0YynOMRBu03Em8Ma3ZoLQSAUub1JVyxUkFrXUEHJaS5xfFK3MXyB
	elwJ2YgEOZkLuwUSbePB33palhnxg8zQuoSj5NbUx/pDvZImChHPxJc2hEstQan0GN+UYRbNHZS
	tRf/1XtzsaT288ACHyRW1vtk1PS5fvHdsZeHcNM5duMNtq1f2iLB7NUz9IyP7ja3g
X-Gm-Gg: Acq92OG7AFCzhkowrn7IZ80AWy/qoq5yBXx6GzJx8ey0Gdmikh4TZXcSc4YaZY/4QUl
	ljhs200MMeT+WbvzIHgHmfZxcd7Ih0N4ZPAtQIW9/DWR1dx1gQyxGVs5/a34Fzp2FNERnrq9nJi
	L9a5Su56iFEwwtArZjZ2w0QK2RurO+4kMO8Ks38bjCcA+Xm5QFW33Y6Mr+yPwBWg/NPV+GWDd/l
	7gENuSMfLORjPnWyD+S2AcKXqUnKdvTa+hpXrAbvvVBuguVBU3EBxJbPmU6QOWMrsIxD4ztKd1a
	hzI6IpbaSxvHZ8j8PkerPbwJJS/90rvfhOMs05fXTcx7b9oLO7APQnSW7/Ib54+rdgqbf66Zzj6
	CoWfh/tNlCSK2BOWR2NZsn74RZoSRMC+H9jOE+7pWi4QikwxE+K6me+DrofLkRNSDuvTzBkKTti
	Zgg/j+IRVXW65O3EXMycbPucgz5sjFWcrBhFdIPp557GM7i4i4e2U=
X-Received: by 2002:a17:90b:57eb:b0:36b:ba9b:7efb with SMTP id 98e67ed59e1d1-37a01a3bfa9mr13782860a91.5.1781513557284;
        Mon, 15 Jun 2026 01:52:37 -0700 (PDT)
X-Received: by 2002:a17:90b:57eb:b0:36b:ba9b:7efb with SMTP id 98e67ed59e1d1-37a01a3bfa9mr13782828a91.5.1781513556812;
        Mon, 15 Jun 2026 01:52:36 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a25ecd5e9sm9539723a91.10.2026.06.15.01.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:52:36 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 2/2] thermal/drivers/qcom/tsens: Add support for ipq9650 tsens
Date: Mon, 15 Jun 2026 14:22:18 +0530
Message-Id: <20260615085218.1421347-3-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615085218.1421347-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260615085218.1421347-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5MiBTYWx0ZWRfXwlDglISMpee1
 5DR8+Jt8ZB5XhEuFlKZQRpxtnReioY6eeluqyRiPE3Y//n6e0NtP3cvFR8JPSYododiR+sOh4Zk
 I8A1Nxg3a7yka0SNipTkRYe2Sg15AXs=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2fbd56 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=nMt2SIcdhh0IZDtwxJkA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5MiBTYWx0ZWRfX+XJCBx+xHf7w
 BYW3bDwskJNvuGVvpPDsscYKTl5v7jZKuPMpnbC90XfxsPRqwOwM3YQGjefcn47JnlM9IqUqZ9x
 Lbvb/Re/xSvqMKRdkUERzAW0XnBni0iEcsgYMGuZhBY4o+lHihcznHhaS+uaTV4Ahay564IX4SJ
 11LSOD3fptFs8TQ+itArdw9x8/qlt36eOIFVa/fuk99nKr+lwAN7x2j4mUkBDM5AEeBoeAomwcw
 mO3+BAsx+NVwN/Gvxy1N6wM0dmSh9MuMi16cFmLFggh2U2rhmXsYg8LloPzpalq5IXylkkAN+qF
 QMqnQDLNP6ht21GAEg3Yl07hxMHOPitGNrpeet0p7BH60pDHVKsZdtL8Nn+kz1XLDgAmWekrdx4
 PotSQ1oy7H3JpDqaq2SV+WvOD9uNRY6MITEQXePucYRvBDZJe3I5vo5BEr/YpGOqRyb4QOByP6S
 Vzq7pTm8bPUiAcAslHQ==
X-Proofpoint-GUID: hLxupI36ztZX1GywOO1-8y5shqtifZJN
X-Proofpoint-ORIG-GUID: hLxupI36ztZX1GywOO1-8y5shqtifZJN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150092

ipq9650's tsens is similar to ipq5332 tsens but has different number of
sensors. Re-use the ipq5332 data for ipq9650 and modify the sensor related
information.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v4: Pick R-b Dmitry Baryshkov
---
 drivers/thermal/qcom/tsens-v2.c | 8 ++++++++
 drivers/thermal/qcom/tsens.c    | 3 +++
 drivers/thermal/qcom/tsens.h    | 2 +-
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/tsens-v2.c b/drivers/thermal/qcom/tsens-v2.c
index 2ee117aa91ba..70ee5ca4ece2 100644
--- a/drivers/thermal/qcom/tsens-v2.c
+++ b/drivers/thermal/qcom/tsens-v2.c
@@ -299,6 +299,14 @@ const struct tsens_plat_data data_ipq5424 = {
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
index 6e3714ecab1d..3e09a06db06b 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -1173,6 +1173,9 @@ static const struct of_device_id tsens_table[] = {
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
index e8376accdff3..2514f1161794 100644
--- a/drivers/thermal/qcom/tsens.h
+++ b/drivers/thermal/qcom/tsens.h
@@ -676,7 +676,7 @@ extern const struct tsens_plat_data data_ipq5018;
 
 /* TSENS v2 targets */
 extern struct tsens_plat_data data_8996, data_ipq8074, data_tsens_v2;
-extern const struct tsens_plat_data data_ipq5332, data_ipq5424;
+extern const struct tsens_plat_data data_ipq5332, data_ipq5424, data_ipq9650;
 
 /* TSENS automotive targets */
 extern struct tsens_plat_data data_automotive_v2;
-- 
2.34.1


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABEF48BD30
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845720; cv=none; b=RPNSxNo7FKPCQigDR7HTPTwrz5qjfmVbhPkYTS30wknEvVntdkgRiZik1golPrVdL4SN4PkedWq2w4lpWw4KxxsZyW2ubBfXvlz2OgDrN8aBCvoh2r4uyGL4TpZefAhw5W2fMFSGAozsizPWLROg0vERmbLDI20x6HCvHMIFRQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845720; c=relaxed/simple;
	bh=meJeOGC9Adf/PUbg6XCNyvrgECBd7eveB7tX76HF7r4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lIJKvs/3qBu0LCduuEL2hvTf725P4+wiU14B1X12+x638Y2fnfswk5tXbf15wdMFTnq5p+G07k/JEmkmhNQ8rTZOU/1E6pgvEyki1//aPszDzzq/2kPrO4adB2f2Ye2OffqUhwwUhxrv5xKyq3nOcYH7s3LGgZrhXp0SbRuzX5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVmeNAUJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fB8dkWDk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVmeNAUJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fB8dkWDk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBATC5654862
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	isxWumv65PpN92cBtq6/vioXzeAHzuoBszlKeDUSl1o=; b=oVmeNAUJ9AzgCX33
	Co42qKTFEJ6lfoWKskFxFUrmtE4dEBVv/nlN2s3oYKqLPaUdBs2QSR8pKJ4GoK0Y
	MguJdzr2E1aLwQLHZWt6mR0bIqG9SEF2si9CTyrGzf5Md5G0TlJkI1UGF0RoJSbM
	WkpPblCMCNCdQi58tfDdcrL8FpI9GNfb7F7MrWVYfI89GJt17kdwucEEAXbNuLWH
	ejBnNpEraaK91juz9ITq187w5Xx3s3ciKNCBCOqgR0MUg+T/yRiVpQZjJcd4siWC
	XGbCUAk5RZcJZXKunyE8A4maUXfVmDvSiwoEweewMGUbgskHxQcbBqMjmwiC73nF
	b6tuvA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1pu5h7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514cbe73d00so121245591cf.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845714; x=1779450514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isxWumv65PpN92cBtq6/vioXzeAHzuoBszlKeDUSl1o=;
        b=fB8dkWDkWo+zifxOyE+EJtYnu6URstEiSmon0YHEkfXf9S8Umzi9dLKlzA/kCrl3U4
         QbZn2jIBVH5fPG6ayfdkjg1hpjZ/qf31ZKjLnKxqSVIydrgk9gvwOrWn9xXL44L+lFdK
         99ABrmtKiHAQilPjBzsSiYk0dIhadf5KCiWUVS0qoTQR2RoYh07K6AYdfDOozuXLIxiR
         Qv4/zXwD4Qnyu1buCIBsSerxrPm9PIX/RgveJA2toeo4s8LVY9bqFMXyVtDnLicZk/gL
         +UWMegbpMxhxKZT7fmGRhhEG1+xvk+kdx7VtiZdt8i+xP5xmnJvbD0wnli4+JbZ0vGZ+
         nW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845714; x=1779450514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=isxWumv65PpN92cBtq6/vioXzeAHzuoBszlKeDUSl1o=;
        b=Vak3jpNem3Hsxthnp0l7z41huCwEApQ0D0YItkMoV4vwa25fzwxpSwRDuqZaRoC+0Q
         919kIRYW0gL6bgqKbsF5rqgP0prZUyroj07bJ8AFaIm/9MLHQcdE1J4lgPSt4c7f2gUQ
         5uX+OM5P5qMVlWTX7lu+9FDL5cRQ8G69EvFy1zix68hsSP3SB7AscoFn6wpgp5KuA1BQ
         rtJJJBWGXpNNxwkt15WeA4k0Y6VJhCtJYfCsEu+2Dk7vv2ig8tWjbnxpSunfzXZkJfWM
         a17/Ng5BgyTYagpLbZFPQoiNPD0t2NJj4S2PDLT7hMW6Os7Qe2QmsL7eh29cFrKuvsgL
         TymA==
X-Forwarded-Encrypted: i=1; AFNElJ+LxDUD1iMIhp3BMlM/2XRVJxBgcvMUElOWr5xlzGRvMn+LPbTKowg0qk6qm5B1D0sasabTGLbiHE3t@vger.kernel.org
X-Gm-Message-State: AOJu0YyVb053EyWnZUH/O6gs+mq5qo8vkGQ2aBW4Cdyy57OnYYnZJXgP
	kvW+/XatqKwNkempCNSvIvNUbmuYu7KsCzxzVZPbd/I34v2xSnQSAvzfZ5XhD9/dJp3TZb8nrZg
	38tTuOjYLfHzo7Omqq5DTa2JebJzQUdrriDYw0sKbh6YSOdoOJ3jsxdL2Atnylf5P
X-Gm-Gg: Acq92OGZW5TI4iFXoKQ+/FDjnIedx0SAE+UgyVWdIMHhwrJ73tfh8zojTLFvmVCQirT
	CjJpYq5jq9sQAVDidM9SbxLTugohf7YsVzFTba1AJQ1e2wlUjMqGHO1xWmV1Hex9fr8PlJEW1EN
	VKKsGRxGNbBsYNK+bV+UWRD1mVVQahjzxgmfjPa9oESmdmCy9sLDOsLrzClLTKdZrJ+Xmf1rhWk
	KKfElCYv8d6vzgiKQ+4vTHVfxiNq+NfYsdcgw7eJWPrlefomvK/+hs/DzHs5khpEIP6LYI8FQL9
	7KEtofsXmOIsKwNFel4BjPRoetNJASae3IEaJ8OJzojUe6wo1hbHWAYdreDAprV7CFCMQDZK3vS
	DhVhlK2h2Qq0gLjXHR1OiytahNy0acw9xo8TKRYUaohJVz75/ihJaABlmeR8r/x/1KU/dV0TXPh
	EkgenJHczeziZz3zV2wZX+szhm8I8p/2VA9wk=
X-Received: by 2002:a05:622a:5c0d:b0:50d:72e4:6df9 with SMTP id d75a77b69052e-5165a240d60mr45336151cf.50.1778845714169;
        Fri, 15 May 2026 04:48:34 -0700 (PDT)
X-Received: by 2002:a05:622a:5c0d:b0:50d:72e4:6df9 with SMTP id d75a77b69052e-5165a240d60mr45335631cf.50.1778845713650;
        Fri, 15 May 2026 04:48:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:14 +0300
Subject: [PATCH v3 15/16] media: venus: skip QCM2290 if Iris driver is
 enabled
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-15-df3846e74347@oss.qualcomm.com>
References: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
In-Reply-To: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1744;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=meJeOGC9Adf/PUbg6XCNyvrgECBd7eveB7tX76HF7r4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf2S/hAvHvbgAhgFpf+qnfmQki5xQth9S/+M
 yP6zql0piyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9gAKCRCLPIo+Aiko
 1RYiB/kB041veyQ82mu44rhzef3n67bJkKU6d3BUDZXDJv/JR5Si6w5EESsBJ646iRSUCeuckkQ
 J4UmHqaZ9dL6nN3RpyPosHX7EYtGaUnGWC1nACKQMV3VbGEaZzDntUXIdch2W9riqXRP6fK75X/
 JB0xqLJ6ONYDGYrCHks0c7q9M18xSg9m3W17fOFMC8v8yAC5yI3/OjeB/NiwR4U7p9X2nEdZ+a/
 hZwwRQnoUK2XP3rh7li7DuJOJFoWg5e5HF9I9LtrYJxFewkIv0nrkWNzVQPnTbUWAU4ROE3n3F/
 zf5pvncXZhhbVBG9Qh4d8bboafVn5Q+eSnCI/qPpgBRwo0V5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: vQHpbnRcNQYIDsFQdWlsHnAL1NPH4nGT
X-Proofpoint-ORIG-GUID: vQHpbnRcNQYIDsFQdWlsHnAL1NPH4nGT
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a070813 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=TAcc6fXARiqENDJ69lsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfXy4BodI1strqB
 AR/IrDR/goPBsz60SUXBlz5xUOc918yNFqQi5cEtBPlkxaIpurbfGiJysCiwdbpj6Gx2BEXwBPn
 1H+bk6WtP5gH9mzUX9YewvvvhJx7Iy9pYf8PFzVrM7tGjHxX+77+1Js3eF9K94oLEZXx+Bl8uih
 jbN7RE/WlHImQZCJPblCM8Y0XS6XsBHYoA+wPKsvde/+PNSovr/hNsAl/0GqI9RYDINdQtxhpry
 YsoPggnZ9RnFvNLiRgQ17MiHpUSB0HQ2z1q3zpDj0LguXasT1pjXsDQWclOD4VIjX/jy57r97de
 +Jd49KCz0vkj6kqm1eDNU5UeK/Tk7ZRAazjnic0jlDERVjoenXFnMmj/VcU1v/PlYpqMdAEPEdA
 O9wS49Iu1+4eSZREMqJrHSCC6Hr82WpwQoOuoTT3D22BH4DxHViK+pKhyTN0+pPjD79+AbciwNa
 ta5NFnqynHqIpAF8LvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119

As the Iris driver now supports the QCM2290 hardware too, there is a
race between Venus and Iris drivers on binding to the corresponding
device. Follow the approach used by other platforms and skip QCM2290 in
the Venus driver if Iris is enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index a87e8afb23df..8838fa958571 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1074,7 +1074,6 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
-#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1125,12 +1124,15 @@ static const struct venus_resources qcm2290_res = {
 	.enc_nodename = "video-encoder",
 	.min_fw = &min_fw,
 };
+#endif
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
+#endif
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },

-- 
2.47.3


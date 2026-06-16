Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54C523AB88
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568343; cv=none; b=MP82bfV83Ju2hiR1utwjFTlo0jQuy1Wj9KUdbwWaN3lzMNr5h7Q84q31F9cV+9/2jCoZZpS1tpl/GN/2042dh5sTlkXdQKJkKAcIB924sKENThFltZAZDkobVuzwYiM/L7g25/EL7fg+il9h1gIECSYGASfmS7ZrcyC/KoJ+lds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568343; c=relaxed/simple;
	bh=bBMr05z3+hZKyiKnqtJur9lg4bNIQFaGUAfGEfPWSb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZHBdx9ExQCGjHTxNQKezcABcTGzJRZp6i9M1E4iU1UtTXqJgyQ5hFnBOMFoJJx1Bg4kt/pmOTGPqEtXV139/SFJPFp6oRcIHveIThl0gsXihTg6IsdpAsU6lb4Po8zZ6ElYj5FbeH/I0+tMuUdQqsmZWvBDTRctdMFj4wvSRegg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hbYRMHxY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dv7W3rby; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hbYRMHxY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dv7W3rby"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIxIgB781703
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWJObvt7y+kbPGRMk8Pkpq/KWzg0qp4Ve45uTUJVorU=; b=hbYRMHxYe02vlCT0
	X1snr0Mh87ob7zj/yEWy3In1nCSZpwCIeboJPPLhf4sGV4h3/Oa0IMbMrDaUAQWP
	jp9zSmbFz1PibTYAZaPh+1pTGQO4Y8jlYSfKNf0iBaDjQRACD4mKOCqgNJbJAw1G
	Vsb1Rso3nI8MAjDUV4x2xWl4pYAE2OkJ38l0VUnpHHeWpJNvd4n3Ykce6PLfUEA7
	sjQxuBpFBewvhsad5Y0KfNg5iavHT/RpjQVUjq4+JiLFsqrHgUBBpMaOW7txnQxS
	mfQgGp2YoM8R5pLSHNSv+J4zVcuue5VDuT1tvacYF7l//1jf9PKpCTfP0vO3Mw3b
	P3MgQA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetjuqmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:05:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91576c147a4so1007876285a.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568339; x=1782173139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWJObvt7y+kbPGRMk8Pkpq/KWzg0qp4Ve45uTUJVorU=;
        b=Dv7W3rbySsPoSONWjBsPhmVYXs0exN5NoUFnVjNzhI736GroNDAYLQojEvbm5H43No
         0G2ZopllZqdgSq+H0u648/O+53dAch2IMG7+bTBpqSd8Nxa3K7ySxjIZqAD2G+RAnUIN
         y99vTJKEMyj7viQTNwBQC3TFzktab2VmSxsN/Uc/Y3T/cIhuGVtVDD+Ake0PsJptbrxL
         usAR2QMgK/d0F6Dm/dVkkBeQM+VZPHPDVsnXV8CCRYDm1ij1HTgaOkaT3elaOQgcF8ix
         oSb/oYGPxaBjbYl9XNrCw77pThYafXQByyMYBxVuO1QnBGxz1qRQj0JTDxG24S5hVapg
         ZP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568339; x=1782173139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AWJObvt7y+kbPGRMk8Pkpq/KWzg0qp4Ve45uTUJVorU=;
        b=kq6K0cKtTY/DEJGq13JD5dC3kykuv/DpgvDvPUjo0CHZ83uJdin6YVzsXelYo2/OIZ
         rzyjrELxdCa1sptVnF+E592ggEKSXYTLPB0xRvFntBMgST/pqeCG5Ki0QVneq1LP9O3Z
         1Wo+6Sa/Yw9dumsBlRvlzsZYYeTuSQ2CZBC5Oem6c3uDodxv3rfJu29zsl2OsdUUYfC/
         q9qET56eBnr2aI11b2S3s0kH96qFXcOmIqsoFhHCj74FNvNh6uO9fuEE/gOg1HXFL4ZT
         Z4k0fNsLvYliC1rDiz30KUDYAJrAr+wZWtiv7CKJctQf+Q+qj1PHMFMd/EUcU2F2Utj7
         apGw==
X-Forwarded-Encrypted: i=1; AFNElJ81jdEvblR5Qr3gjFtObAFD2Z8tnet7vI92EMOzWsNaUBvGiDC4w2BCRWyY0arLnoRIL25UJhQR7OSn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4okf5i++YHqOXtKTJX3riDo22ArqEVvXR0rXw391c6knJgu4N
	45vIwHJWy36DS0FNhQTNZs/j7TsrX0eBZLK5Fc4LPrmTMnneDVZwgr/hhLasZrBwGlfO0bUnIL5
	Df+W9RfaxIhXd1bWYfQWQRMVxu5KCukodbUiGbGUlk+jnddASMIzL21olDnwgocoL
X-Gm-Gg: Acq92OEmTsOzAQsmlThIHOLdHiYYN4z824bHfr50cxVgbPwcOpR1J6ClzkFs4TdoUsI
	prWyc7S0AvUiWkyWcBYgGBqpaTnhdoPUpWPIvvQrHIGzTZOyiekKh+uftpVr5GlYY7EdiB6bnu7
	5nYDJaxUTG8UAgQvZNwbcnSE0jvq4/cscjJtA+BEzmT4RLRBUimvKsOth+EDAeIiqpol8Z5Kxgk
	6Ew6vBdQhhNFVFk21Vz+b6VE+aPyFAbGDuUMZHErgYP6weWPvcsdIbMVou+2B5umLumBWUxLOvz
	iDjeBbOYxf1FGv7IxbtUnqrPgLOIRHwA0i4AlVA08qRubiV4fX66ulwAx9HPgOiuUUkKKIuTvzq
	J2Vmj5ylPwbyJf2TFSVWV4vwnC3L5suynvjimrag/YVJkKA//qZzRcCHBqiH2EJDlbIafLP66Jl
	uWcxcqVCmYozhL/QpI+KMFo4oCD1QYUQhOSt4=
X-Received: by 2002:a05:620a:2992:b0:915:86a4:6691 with SMTP id af79cd13be357-917efbbd2d6mr2192262985a.4.1781568339036;
        Mon, 15 Jun 2026 17:05:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2992:b0:915:86a4:6691 with SMTP id af79cd13be357-917efbbd2d6mr2192258785a.4.1781568338659;
        Mon, 15 Jun 2026 17:05:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:05:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:42 +0300
Subject: [PATCH v5 15/16] media: venus: skip QCM2290 if Iris driver is
 enabled
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-15-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bBMr05z3+hZKyiKnqtJur9lg4bNIQFaGUAfGEfPWSb0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMQ9jyjI0xtGZm9mkeQcVIITP3V5I9BWIzP2
 B+zypqYjDCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTEAAKCRCLPIo+Aiko
 1ckNB/9gQAoQXZ9c6otmE0V8YpLudu7XUS3NIMxAZq5Vra5YVT7sFL3y94zeBvMGRjioKK5ssTy
 O3Ty2uYR1qpZnWqZnDR261US0PDhbZ0kZyOUvxhoM3FjqvdpM9SOLKimUsyPQvdt7EHnavWdd9v
 pAkFOweeYp4QzGwT6LGBE//jSLILvsDSltX3AVoR+g63mA3WkKCoFAr1RqkrCHlQ5h8uwgR4Rrv
 mGBHpbpQT0vb86PPXdvYYzB3mM29lxjD794q6EprPbEWqtCwYDrYY5Ic1M3akqdjY0kNlaFsx6q
 0gemNMP79cm8yuXiuSwwySiJcG1vjQM+iWbkwZoL8iAbci+r
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfXwKZYpULfd8WD
 pw3gGOXtY4/x99OWYppLTcrRduytT5lp4irtIHQTV7AMPqskUHZm0OgsZhebh31731YB45hP4/D
 1IGPigtV0Yq2aemkJ47xEA/wsqksdO0XgjPYCyWm08fo1FghMnUFtLpwI5x8wwsaAw+9D1Wv00h
 FkRooaHeXV2kW0AljT2PCT67EyLR/Qs0ZrBVQstH2umVbrJY4FrNM6/4iWgp6nmkZxKCShMDCjD
 HEQVT1CmY7ZoRrR/uuWxwRK3Uo8YHdutpeMiO+S/A8nID/ip0VEMm2LuJqoWk/sCj17pfqQhWsS
 Ocu8iUHlEsQPHWJ+fYZTRYn2JDT+lqRPfigmB/mUnIJFf3i9shJ12Llm2NGoHAsfHlkiDGXaSAP
 Tht8lzjOiMd9F5zAtsSIrebykaJginWlsYE6mU34jgov3ImeTvdRivcNZ2hLzehvljNemgb1xZk
 pmMC1+UPwKk21xF39kQ==
X-Proofpoint-ORIG-GUID: Hb4pCfO09x6cTa9ybhs_M8Jq8tbvT8Vc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX42wdtGUhG3RM
 r3DmoU6NaVtNRnw6Vdt/D0X/PtzfWazbI+X/I4L6pr0vo/9r7ASYeT8h3eQQKExr8vBp9Zaf3VT
 D5VDs3VWecfiSH+CG01BexblNlOhK5M=
X-Authority-Analysis: v=2.4 cv=HttG3UTS c=1 sm=1 tr=0 ts=6a309354 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=TAcc6fXARiqENDJ69lsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Hb4pCfO09x6cTa9ybhs_M8Jq8tbvT8Vc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150254

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
index 243e342b0ae7..3c88594eb1d0 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1118,7 +1118,6 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
-#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1169,13 +1168,16 @@ static const struct venus_resources qcm2290_res = {
 	.enc_nodename = "video-encoder",
 	.min_fw = &min_fw,
 };
+#endif
 
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8939-venus", .data = &msm8939_res, },
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


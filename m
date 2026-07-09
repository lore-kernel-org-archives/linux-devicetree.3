Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0313246EB
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604567; cv=none; b=fRd+VdtSqJjzN9BMkM/oRQbB5dZ25HlphMEUu7RhTYFiEfiyMesMQEzQ036sHmDd9TAtQG9koAYwDuH8tMcS6dAGLkVf7QGIlWOTqqhqoRvnLa/PsRD4v1w39rX3kTJ0UsOWn0i13My92vjTQnkqKBPjVyRC+AEzjlCJnWib1PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604567; c=relaxed/simple;
	bh=Y4Mf564XZJLElxOVQ/ItpFm6hQlqUNnOhCZD26KNdhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJxqdiCQiCnoq9sppGhpQx9k1DPe35cr9iIr0AZ8/S8OFcopJu8gx6+Wj25isOgi4J5TwOW1c4VvNhYxrQ+a7GCUHmVARwvXoOxvScgY/basaONqRDkaxZ8r/12eWdqiWeIstDoA6z1Ifx6wwR17jWpGzTGGSD+yq1ZZKAe6mFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWxBYymy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S6grsNXF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWxBYymy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S6grsNXF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN4Q41450391
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=; b=FWxBYymy3HMALBJR
	aYPvUURuekqh1leJ+SZLvJefacgkveb+++g/b5f98UgR+GTPAF47/OojiMcGM/2C
	aHNf+UJE5f+v7Yq92g+lZ6mSasS7oUEwG1ZK57RpIIJJygtoGt3OXF/ko31t+9qB
	Zt0zl/ML655UEC9Bh2d+n3y1W/CcFc5CDbW+gDJieltjZ8LO3dgcX5Suxurm7dEi
	F+dZ6eYa/165j9maVKyXr7l7VbUKlSSte9M1kORjCRrehtO9BdzGF2AZqSTPn0Ss
	Q8omxU82HKMZcRvM3nY78WLrZCbBIiLo4RmmFakfsVLpvJ+x+8uBWTcaQsDIxLj0
	qjofkQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vj7ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:42:43 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9692595fe97so375831241.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604562; x=1784209362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=;
        b=S6grsNXFUwwBIzZRoChGbx9NY6kRXdU4Dc4IxXSccMnyLznITJJCUNDpi9+JoXZwAc
         SblfDG8RqC7nNEWedy/AkzK1Uq4zxb9h26FxfUJITulg5vKWBRwJpXfMzlHMISTtLTdM
         qfvmXuOMYQbIWa1vC072Zc/nOEgiWL/zha+wqWsbuSHsfcCbOQLVbSyvDiaHgzVwLo/5
         jco19kOMPWmZmiQ7iNFclakZAadJ9owYnUiZPz7b9j/n12CBcS3U9q90wG4F1pA5/iL6
         sVV+cw2KBv+aNMziW3Q7f1y8hpy+lR9vrTTCGzSv7flZBOc8RYlwXjClYPT78YhQLV9T
         uuzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604562; x=1784209362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=;
        b=VNd4v3he97uqRi3D/wmAhGSbdZeRL6xmvhGIVFa/qnC1hUdb81MF41Ju4Mp4nBLac4
         /yB4zOCa03A6UZvIOPY7T2i/z11JoBXIx43+hCkcfOIgspVuZZt5VlZNjH7doE+l9ym+
         88QaeOaZPdMqviB9K0l//3R2xJOurxapp5NWNUwCdjT0tmivJ+UDpCpr4bE1rYfWoeis
         Nh9Ja4uCVAUTorFkgAbi9jcfKdhJVl0q77ju5d2++Rxsgnb2AMxW9eb1Dtlj4VU//ZDF
         jT0cNAE3UmkbIjqeMw/ygmIWOmSPvN1owxNxj/cBXpPEqEskvEjm36nGp4FS+Cna7v1y
         hWkg==
X-Forwarded-Encrypted: i=1; AHgh+RqDWIt500x/V4dWcsZSIn4BpmEWA1f8QTaWkUiyMCvT1dYOPDV+zQDF8HGFJrYdlNCDykckCXIA5NjM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx02LBOpmu6Lqw0nIPm8sztPVR8yKbdRseyHiPJbDLuTrXzBkQo
	P/Qd0baItLj+vRriet2CIjFc5xdYMWRZpNUvTbTXjv7oxBbLPcPjehVpCTjcMVimjy+PA1DCXax
	Yjq/WhyS1qL0HKpR/bWCuOdjIgj5DJAz6ArQMjxWTMgqFEx5zHoLGG5aFhnAytQ8A
X-Gm-Gg: AfdE7clKL5SW+JhnVwvPYOBuAkQVzwR8bqZ3g8FhCpqzOtlkaXZl8v1sAcrNWG5rl6n
	qkXwwe4bn1adCqyvKrW3BoJY0CpeMLfz4JJXX0KACtyIBWcj6+HG6VxFZ6mNz6t9gtVM1rRwqhQ
	9pMM26TVo2WU1fsJnlhzG2IBVAg6a3TIy6L5645OPtbkvsPNw4muqWL5+jbP7z8Ns5yy0KpLsw/
	mRGojUUicLjUAnZNGtbALoMqyXyMXPQC/Z0oiT1dHeANet/nDWTS4x/pIgbJcvpbNm94zuUmdTJ
	CBbpQGlJDzsq9Y2zwaA+EUAQe5f3eSc2MSygtr98YSwE0WKw02AYQs8piaPSRb2GPABbkT6Md2Z
	MYhnOOncLm0sWPjoL8m6c5cZtlFn27qs2Udt4eUfb4SO/lh/y9aD5NHMGogaHnMdbsjcn+1G9Ls
	bb0oW2q/5Gw2NaKVOelcKqOy7c
X-Received: by 2002:a05:6102:94c:b0:660:d26b:506e with SMTP id ada2fe7eead31-744dff52b67mr4460040137.1.1783604562383;
        Thu, 09 Jul 2026 06:42:42 -0700 (PDT)
X-Received: by 2002:a05:6102:94c:b0:660:d26b:506e with SMTP id ada2fe7eead31-744dff52b67mr4460000137.1.1783604561868;
        Thu, 09 Jul 2026 06:42:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:42:08 +0300
Subject: [PATCH v7 17/18] media: venus: skip QCM2290 if Iris driver is
 enabled
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-17-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y4Mf564XZJLElxOVQ/ItpFm6hQlqUNnOhCZD26KNdhU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6Um3x0DVIhta7pt6Su24PLZGGj05AXnS/cbv
 /uOXE/dWFyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJgAKCRCLPIo+Aiko
 1UeAB/9I1h9kcsc0rZFPxQVvV9c5C5XdymJruOglX7gtc6BJIQcL0iuuybsm28TCQmtxTbbUd62
 d7bRpjC7LV/bH0i6KHWNpuAcoZPnnnRRg7rsKDRtPb83/B54rJ2WVdyYCXj4pyjHRAQ349TLoin
 hUcLx8C39cmP1dFS5QPTVszxyCOAoU3e4WSBbJG2MpeBl2bUl+HgSLWMGmMz2s8nfTH2iUGgJ6k
 NaOoMadqVt8oxxCOQaOxA+V9f+K+qjSD7YQwTFK4yzy8Vb8bagG626Uz0LfvtLxwYWZBNWpI1yg
 ncBrcfoM7BhRYdddCJ70dFbBUXLzFpjD6uyp/b55HeDsP5SN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNSBTYWx0ZWRfXzlSYoR1Skyg9
 DnQ8eXUy+srEQW5fh/Snb55Xy+vJUY4rmmcOblMpWkHSmGXajnpo2EyXN1qiZYA5Fxji6/HJNSo
 TLYNpXbjqnlF3niNwhPxoc7tRraiQO7agA0leXZVqVk2irnHPaPJjjVf01WOX9Zc+cwakwbJh1l
 DyudNoXsZMPPRZj3ZDzEqF2ZB8IcGdWqBImyzTDfPbGQSqpndVefwS9Wwz0t/0lXk/hb6hBFqdQ
 RL0qiHkZInm6Li9vcIunpDI86VRPpcRjQtRM/MJUaEeTPuf0tLvMLt3lAs6YJ4Id/1KCDlFGu4B
 7njOr7Ms+s7mu1CjlHC9lEaigJSZPoAJGXb/hJ8yPRe8LYqfEgSbJNW4PXrgRluayh49kFD1BTF
 +tvi1Hmqgz4exoISXImYHWHSZ2GJm1mn/d6TzxlhvqpypC3Y9J8OQ/J7UBKU+AfrMnMi60ClEYn
 axdV5Df+fzfNoMdAgxQ==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4fa553 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=4ldMYZ-nzf-nUnInMJoA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNSBTYWx0ZWRfXycNNumgc8daO
 SqRMtmNDzGEO0zIHgRx0ToqD4t5HpDCZC48ShLJotIsgsHrCAap4eDxPEjddPkmkSQJ1god7yg+
 LrHoQPOABlcrYtIYBuNHXHqGs2lEsOI=
X-Proofpoint-ORIG-GUID: AJoUTi7R2zqtZYt_r31ANT4d3rPrx6y6
X-Proofpoint-GUID: AJoUTi7R2zqtZYt_r31ANT4d3rPrx6y6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090135

As the Iris driver now supports the QCM2290 hardware too, there is a
race between Venus and Iris drivers on binding to the corresponding
device. Follow the approach used by other platforms and skip QCM2290 in
the Venus driver if Iris is enabled.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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


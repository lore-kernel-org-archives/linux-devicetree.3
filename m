Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666733D3306
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455523; cv=none; b=Hf8i/KsUNG5U66Vk0zK0N1k4GXUnwpC62ygYsP9GYDS2P5/aJtXyfZLDWESgU4VWNNeVYB0xWmhfvSEi6EosIDi7OpNPe4idrdV5J0aC2Ut/VnpSKgEXgXah+bh/6vya42w5/eP8pnKQ5405r54rD0Zq9S6WOGgsQui0JqKydvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455523; c=relaxed/simple;
	bh=Y4Mf564XZJLElxOVQ/ItpFm6hQlqUNnOhCZD26KNdhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AYfgKC92aYIia79C8gksbenhw7RNzKiIY50Acw30kruMd44q+yB/G+GIJgzEPtO/7yE8n/tGl5W7acSrWs+h9jdbJNSGpoPY1RLnYBHOb5Q0YrCB7l0lKjfGLmKpNqOz0wSZxfo+8lSVt5VGwdutn57c8uEuntpE2WKExsUv3p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f5k5xPav; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OURZsMme; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f5k5xPav";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OURZsMme"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMrl8Z2479231
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=; b=f5k5xPavq1pNNLFf
	aq/tuDcR0/vXNupjlmxO0G7r4QIN1UyqVFGdikr2wpJLSXT8yVk+GiKA9oB6lAEl
	msdlcyU2mS32bPCFl92Lj+CxxQTQWe3L9LjgQeOukpcNpEj7QA/paY1TS9sPUIkR
	x0jsF1SKfGmNDB2pubdkL+/26WObuMUJJYZuLTFZ264gB5909qzL96ufuz6diSvG
	T0MYscDUG9EV/hYxYL2YViEg+zNZxh93nF260LWoCYBj1IWta1I9FOI8N5QbGKLp
	2zZD201N/B9hA5JzZN1Sfxg5FhsQ2cgn3cMn/BVId7W4f2PKGuwRuK40WPqTH9xT
	LNDIdA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfpfr51f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 23:52:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e62e3459fso47530885a.0
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 16:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455519; x=1786060319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=;
        b=OURZsMmenh/Gks6QsdV0CpCzrInR1gpD7iLvN52W5ZPDAYmeVmiPwwcDulABvkVUAs
         ZHcjj//gXF9OD/TdgPczhwwO2UDy4QBaouhF3+5OhP8SEQmf7VbwG3IUQD1QKbbhzWWP
         7WnQvLgoEzmwzOmWqcL27BQCodloWR9qpacYUGaO+B+rlQs3EbzyGW1DOko7Fw5JGOtn
         8CBcVsv/XQoMca/8v7qMUqezEMmb800WM3SvKyj/UqPWGG+Uo3yU4HJGK9hfFq04OGq7
         vw7hWXbhxdeNxPMM3ktrFLeocI0mG0oni6IDvlut3yaaw2o0rMyrUvxDzE/SkuVX6gpH
         Ul7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455519; x=1786060319;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Evq/VAnP3EnITG4JjW2jCwPnQPbOBD89cFtu7VIhEnA=;
        b=ac+jHZX3URuaKUhBclungc8tED3B5vOH1ixMpSJF9Mdu5y+GUrNw9Fn6kY1i7PT3Q7
         rZqCSzqaXSzhtY0haMswvoj+f5aEXO5cCuj7PQxopUCr8uUr6OQzfoK9pJ0hzkGSftNP
         5tmKVmfisfWS4h6CjDKlg0MDIYPotvyLD9GFoK8BqlHSq1R1CGPE6nlSklIC/yVBbv1R
         WCdWLrIe4UVxRn0cdcoa6PK//BDjTBQHYyH1Ban2jwMc/45Mpf1jI+AdVTnbltfZEk7H
         WeNS0BpcBPF9i0zDJbf50iNdwSbaCtwO+VTz+wKhK3Db1WDCXQ3cr/skOhvaREh5AxRV
         RlEg==
X-Forwarded-Encrypted: i=1; AHgh+RqBFLAocN9tN/Q6eYQaQdRljZAyDgWeaCiVJ/+qzHGXiSbuCPIpgfQmnFDGPLbgkb00w5PhbOEYzAe1@vger.kernel.org
X-Gm-Message-State: AOJu0YzNMtMqKYWDuDDB3Kl2WcSjdtFaJBxrer6FBH7F3fqKAEXGhMLu
	Ibsp/3KS4ozIO3pV8/dpfHEGJoSe8LmLfrJ72pTvQKFK8kLYRPmTalHLzbRofuQFZrxW2b7b746
	jnSAFFQT56UrrWlN6mMXD42Q8zaN2BJBvurVMsOnFx0jozOTT3w112b5M71KMz5At
X-Gm-Gg: AR+sD10wyJO1h4KKL9KRIVE3rC/mVvIMMKgD38DC0yb0PvoOjrpvPC5oiHm1NWWVmLi
	QcbcYHOtwAMxP+vMS2ZsU6n8WjJbU+njkHFsp0AJ1EulGebJhpZmexW3thKvXFdK8OIAGEjwYR9
	r72h2rVIEEz6BTjxYLKIfT+j4dawQS1Bp+OQEdKgj1Zvq/oE+3vJyUKTxmozzK5Htjxdm72BOQv
	Z1Purx5PTDpUAhLgP7tBRzpkZlqKedsJHXynLzcI3knIoWCcKsAdgZKsh5yKuNxBwmnJxDU8SF8
	pp6UO4roDl0gJWKNglMgpaMCfcpxhT2Soe48TbXFmJLdekIBe8NKBUGajKAwynJoowTteRj281B
	A2QE8kqO1V3ef1tPdkTN1OPXRnR1UDd5HDJToZRc4elXfpczFPzQV8KNJt9uJk+6aKUFc509Xsq
	dvTbi9PTBO/dOauQ==
X-Received: by 2002:ac8:580e:0:b0:51a:8c97:9385 with SMTP id d75a77b69052e-52b386a7e2emr48884081cf.60.1785455519567;
        Thu, 30 Jul 2026 16:51:59 -0700 (PDT)
X-Received: by 2002:ac8:580e:0:b0:51a:8c97:9385 with SMTP id d75a77b69052e-52b386a7e2emr48883881cf.60.1785455519156;
        Thu, 30 Jul 2026 16:51:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db952f45sm613789e87.29.2026.07.30.16.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:51:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v9 18/19] media: venus: skip QCM2290 if Iris driver is enabled
Date: Fri, 31 Jul 2026 02:51:51 +0300
Message-ID: <20260731-iris-ar50lt-v9-18-25bbab43a436@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260731-iris-ar50lt-v9-0-25bbab43a436@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-25bbab43a436@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873; i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id; bh=Y4Mf564XZJLElxOVQ/ItpFm6hQlqUNnOhCZD26KNdhU=; b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+MuxTJ+JLL0cauK+e83kbe8RkVEly/9fxE+W PfFTIuzi3yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamvjLgAKCRCLPIo+Aiko 1fEhB/9+q8EAZ52a4Bs9eQGkJ9cbuwXlA5Ud7ToOq/x3/yG3h68s2uTxL2xmQmxbMx+7AIqlD+k gGgbCaJzE//rXF3OgH3gfy2b29ocj219agCx0cP6wsip1c/g5hIr0NkadTKCu15Ipnyc2xbnGnl zTqirGGyaF1nCm+uQwjDjvtsHOnh10tBCli1F7TydofZ1yDZCOINabFbhKtbpaoi2e8j+3lj+8F +dik6f4Q+iZXt3DNkOD5ZVpU/fnI9gDn8EwRQF/E0+q+bGo2MfesOL3BOymTNzTcouq8qEVvq8y ynfDEElonanJ4Ka6qppUuzvPpj3viLp4koiUlUGsS7FjAewi
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp; fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX9HlLaw/5Sr0l
 GIH9wwHN5Dy+HEfp3o+SJG8p2DumgZzghRZuUCh1hq553PSW/0Uvdtz+MYnVFp5jsMtMmSTabJn
 cxfChd7RjmpRGGugTiWmQagfwnF3mAJesZFTxY7Ft0Jtg7hZae4lnEUjLHejwbexSE26w42Jb88
 SSKVIciwag/rzldUhZkeTE+rUQXADedWevSEk7TWJpx5zmjSCg1DGm9TZziXA6Z5AWZfLFtT6zG
 BvFJV0xxnrk/0HxA0bZmLtcAhRV73/pKAm2uKOpXsw5yrdirLNSG0nvcWikE/9hOtmNm/sC/3Nc
 mYV5vgmpWhmH/k68XTKPD6Un2xbjcZAky0EXpbAW+64+cyrSIFQKb7mhbvROUj0YLLupOo6xEiI
 vHFdHUoypC7jtoHSD0iJRXk7L495+ErKWF4mBIHfhFl8QYYO0cR2oB5vbZ7crHkESdiOlPji2np
 ixUaHV9D7ClWuMvpFAg==
X-Proofpoint-GUID: ZrBZRl_i__sTmS5j0K2Nd4KOon4bG1oe
X-Authority-Analysis: v=2.4 cv=XNEAjwhE c=1 sm=1 tr=0 ts=6a6be3a0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=4ldMYZ-nzf-nUnInMJoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ZrBZRl_i__sTmS5j0K2Nd4KOon4bG1oe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfXysCGr1hsCJfC
 pTaVAz0PJun2VXUSEdv96OnqTW6Z8zl9jDGh0zw+xLo5AXm2kQNawVcThhyWnnPFD4loWoVR6JF
 M4rxJ00TZiBeBDgj9aJUsTCJoeLFeYg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300168

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


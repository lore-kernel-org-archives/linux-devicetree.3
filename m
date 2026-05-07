Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2403644CF
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 06:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778136165; cv=none; b=LpKHLTY8FEoeE7oRNhsD4f+Q4li4b/cnEua2LPmJaPUz0DV5HRPMaRAmDxI5tqwxmFQ2zVWPI3qktvoCqx4rFs2ofG6HrGbfFj6aLMeOINOyIe6yd6h1rAXKk8GN04B0xbf8v84w/faO4McoIWTduJtKXdf2xinbs7NsWcBj9zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778136165; c=relaxed/simple;
	bh=7mrNTGNij/w8YmbLMmlhfVsKgE6akwwy6krrm30/cgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eeKHFVz6/T/9g/QkuG0TzbPWZ0NwDL7N1G71BTH6KlZ0Ck13X+cOheYxvSqQm1zQPj2NPgloFZjXR4l6YF6ewsZ9ZlUKlA2V1U1bDcvOKx/fay/03gUW6fTcV24m2EQdrf5BHnghYV8FhmKBv5AJP6LfYMhoMhWsuBwiY1q2qSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A3evxDYd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b1Yy4m8T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A3evxDYd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b1Yy4m8T"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475wTKp1926229
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 06:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZRJ/JIYWoECFHr41NRyA/8b0IVqNJMdaNWLv7doTIA=; b=A3evxDYdy8+kDptb
	0UGC4OLpMKQA2H9Uq7Mi0vbVyCUHdHCLdBOS1j57itIN9DaLYXWcpRveI8IlWwMo
	qhXMj/1Bs51xT8fK6UDulgOeQGFd4ghhdzqS91WiptW1DPlo9uqYD1CInit8G+hy
	WCG1jwV5P+YyZ2/NVuT2DdvZyOkIAFPTDfcHdeZ/6UVXqfXzxmbEwwelXGJqMtSq
	zN0zqJMXVLa4eB165s2p97RGDmDOUqnSTfHRAEU4S+NFH+guptEvGFrXn+5o/zdm
	mbva6WuTkLu+ldvtvxSRUMo9nZi+5YLLsdhpyXtMCYnXF4gYdDVC8eG4DsBa/4MT
	SeoUqQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0n2g850k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:42:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d890580e1so7656611cf.3
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 23:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778136161; x=1778740961; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZRJ/JIYWoECFHr41NRyA/8b0IVqNJMdaNWLv7doTIA=;
        b=b1Yy4m8T0CR82CzimcddyercIjc8vONNopKGGxvIfJo5I/KAFmrrUJ7e7tVKtp8J1K
         yaSIRmqIfJe5OYcI4ErNhb6P2Gqc1BXk/rADpU8ldl3Ptk6RBPgKhpw+snij9fsqlTv/
         yfQvI0Q466WrKcF9tQamUgLnQRL0zMUVllGZpSJwBP0lfXx9IhDwEBXti3DOQs6wddEv
         nn2FxGkyOMjohzQTLGb7UDwJCFOiSGRjL0IckynJN6Y7FSsOMcHu6Qz6X8d5KBjoD8QG
         mDcWUUCNCUp3yToyjGCAaY0jH95i/TgrvPjVRmMH2skzM8mTUHXdGYGXHiDVjVHPuNMm
         aZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778136161; x=1778740961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rZRJ/JIYWoECFHr41NRyA/8b0IVqNJMdaNWLv7doTIA=;
        b=Ij4WlCXNiZY6NpYMyP8t9DHoRqehNB5fRjg5LaMCviFpnxhKVtRXeULP4ejTtf6Lmf
         BwWdj5ygz1vPkfWGKm+f6uiAvwqb+a2HR2/6M39dZVldz+XKHdfZIeUV0ixKsP7YY5lz
         Fg0Rx0zVOg7AtOxiWKq8z+OA5/AXLrMUQokWmVumS/3Do6P2yrd78+lYCfFrOr2ffqU5
         aOFKMT6/+ZuTN43TFEaGRwZi514N4PMSXsDCzpeQpFuK1NxEIEpxRAyc5chwheiZurup
         v2HsHmCLXI5d4gIKRa5tFdtRk0trNM0KKXtq7ia+Y2vErUslSPlrZe6wGTfhWQaU/As5
         C+0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/4g5ml93F/15R7wVccodRoQEZCcM0RrbGxHW3Wc43DSW6Cupzri5cEspFhf/fFZcVhXcoMS3fDjWkZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzFiWitH1OCZ8h+XOYEXwjiVPHRA8OYpd7oKR2CuyLvmYVDf/Lr
	VvLW2tpZW8AB9lfq0A444r6UilUqJW90pQErwSCOpw/68zSiClT4CSj7CsGvyw+kKBRue3RATML
	k+R/lmarRb7LLw6oL+U8aVokN12ThMXzyPiBYnPsIhYRlUFdHoFMKBaHzdrt2Fpht
X-Gm-Gg: AeBDieu7uEp5I7SEs6RmnJOzWhV4bFbR1ldHdJOI4vJoh2EcaxZKWIJuCP1L+uHl44x
	zAWwg/hrtj6AzW1J8Z43m4v4Ooj6MUpa/T4GcasAfvukYzj23IZskH55I/mTko8D+M8+4+6E30a
	Tny0+e/LS2e5jTQek7+6hMluc6A1qO6xHL0RcUT4ROR3V463N1E9HYq5peZ5jf3QEeq8F5t7urY
	fn4FUYDmdQmjpm8T6md8Lor8KM0j+KUfcZkxKgpL5Y3oEqUmTwcnv6Yca7oyJD6Rnqyb+QODjKj
	srPu5dbWUkdD4CvpMNdMvOS8WB2HG/PdzdfmcVmGaaMbt8lsKxwytLg8FwVpUwNgTAXqgk7dNNp
	9hE5jrdyVKeBv1t1LUo4l0QT7ee2aap1LWwManzOuYqOPz1W7dSfCzq99996/OoAvtk9/0R15UJ
	c/Ibt4RDqaf57Jk7GA+zJH0pMZgvclWunZyImuMUO8fLnp4Kit1p0MIMDB
X-Received: by 2002:a05:622a:1145:b0:50f:bdeb:1e47 with SMTP id d75a77b69052e-51461fcec8cmr89440441cf.44.1778136161156;
        Wed, 06 May 2026 23:42:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1145:b0:50f:bdeb:1e47 with SMTP id d75a77b69052e-51461fcec8cmr89440151cf.44.1778136160682;
        Wed, 06 May 2026 23:42:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8722c2d43sm3334694e87.40.2026.05.06.23.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:42:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 09:42:15 +0300
Subject: [PATCH 15/16] media: venus: skip QCM2290 if Iris driver is enabled
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-iris-ar50lt-v1-15-d22cccedc3e2@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7mrNTGNij/w8YmbLMmlhfVsKgE6akwwy6krrm30/cgQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/DQ/U3gUnLVTXkqjSQKHBGEc8j6q7pFDgsHkN
 sNxehDcuZKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafw0PwAKCRCLPIo+Aiko
 1Wh/B/9FEO/WyAAd+IMryE+i6kwlTRV3hcSbSnW4dadkEowqVHaIIc08JxcIvr7R2ZSed9zBOqd
 2BUX+/f1G/JrmBAZxIK4M3Yg7erurIPCHW0ET6OwjwwOvoaLlH5rhW6N/Kg1I/bH1aAsYA7RTsk
 ZUhjWbwCFvuZPc/EMrsZPIhfkbFYmewwyvIubzP3ftQEEWRoMQfFomdoE4R2oCsP9ol6tJGNvZT
 MzHV5CuklqRZd3uibCip+jbQPMREdd73rFlQoKFM1CHWSC1H6Ej4SgctFh+q64ZWga4OTrnRFDq
 9E6uBnhr3htHnK3/CGl+mc683J4Lpjp36Dvv1lYTjNbny+Sa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Wv4b99fv c=1 sm=1 tr=0 ts=69fc3462 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=TAcc6fXARiqENDJ69lsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: qciLDrfKN2pDBlAKrmmFasKwHngdBnQj
X-Proofpoint-GUID: qciLDrfKN2pDBlAKrmmFasKwHngdBnQj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MyBTYWx0ZWRfX+lOUMbMlkhuq
 Sdq2VaIYMRQGAdAukw/xmw9zbFWb7kCaFRB2dvxy7yuydw7mu5fEDJk4MoVSZUv+kcT0zkPTzmM
 4oH8iaPlXe/5FHGzlXzXRtBBAs6iy9K5STg8gfKPMwM2r3+JiArEMnd4ByE7VfNV42/hd6tFRoj
 aLvHT1PhAMm9kysYWaX4L8ueaLAIxWkXhV1mMYh+pv8a/82llMADhNeo0fWeasQdqoRVwgxrtHp
 jH0OcplJTThMos4e0/ZtEcxrv0WTz1vVU9JBUi+Y0O1Kz50FoqzJD4Dy+gYxuPjcUzPJ4Gfkszs
 S5p9/Q5oJA6q0N77IVY2/S3fNXHC/ijVt755OkCJkRrywm/S5qjQYgeiQ2+FFgnWy60fAI34J5O
 p/Q4swFAaArac3s+Pnt0pdDL4LOtVFOPCgxvYc4i3Fx+XuF0+PNmhVgac0BBOtr/juSdumE1cEc
 L7K5GfE0KhQfppWQpug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070063

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
index 247fb54bc00e..ea67e713a810 100644
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
 #if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },

-- 
2.47.3


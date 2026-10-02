Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D125C4ACC81
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 19:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970300; cv=none; b=C0swx6aJeSww2z855qQPn16WttUPlW//iSjpw8oHMnFd9bLdKFCeipkv8uzt99nhcTWDoO0+PFC5d5l53sU3B2yY4m1xF3cAhV1NLPxfWVv9DrZyunJUDawTBa2zLNEe87a/GSYZ64e6KhWoSKpA2Yp1hI9kI5qQpzXnYilTJMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970300; c=relaxed/simple;
	bh=TaiRS5P5fOIL9sIPrFQC0WNVuv7tcB3SoZ8snli9MIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sw5H1Fj4MXltEA71iq2BSCifaWwTfW++8IA3c+myQL2KEH1fQ/JFAddmwvEtejhp1ggmz1ekN51ksgEKpTMqFJf+ui9p6KqR4nNsXBU7rXbXkIkfzFXXn12gH0/Sqykyq2ha/JUvrepjRedKFmFbK0lt5um3UKbt5fBZGi8F8a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XLvNh1YC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oh+0HfK4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XLvNh1YC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oh+0HfK4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H65P02514098
	for <devicetree@vger.kernel.org>; Fri, 2 Oct 2026 19:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=enfwIbnhH/C
	SB0TdnUwnbQ+pUkNZL4kfBdvjTEYVaF0=; b=XLvNh1YCf56lWz8uEQVJXVtuujG
	Dk6Rssj8A3DcN96YsknmaUPkovU27dRdKe/1SufvqKzkeVXl1tQNaN/i+2+7+m/f
	eXKFSYFojp4RFZYh6G6uqCI9LkWXFFGadrDKC4ztcH5rf5ERvfoR///5sQ9qjYlS
	0Q1fsa+VcsYOmvNsxLlH9TLBV2fgoW/ZwiOrYeCN96j/daozHPdF3jKAke/8AEfo
	w2GWZn674lnhmI9+1yAPIF49/lUaThaEt6FV/FwfFxrKUFU87+bdZpo+eoJsRaW/
	n6CJCnGrqKfutUGtaowQ8mORSxYaVxbM3GGIG429DONNY0yFDzpjcaJDJ9A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2aj025rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 19:44:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb6391e89so496661185a.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 12:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790970296; x=1791575096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=enfwIbnhH/CSB0TdnUwnbQ+pUkNZL4kfBdvjTEYVaF0=;
        b=Oh+0HfK4c2lk8qGz8RmGlREVY6+kGwIdb0ZaX7ARg0jgBPPOn8Y7WDEZx96VvNaz7N
         tkgjykwmpQL/1c1GgQ1tgn98FRrtawiqewUjrWdbd+shN1V2LTN0IRb5oVY6TsXT6aEU
         3tFt3rpQPLqTnRPn9q1OCp/NWEcx+7kmB0tIl2mYNHDdmnLDMq9FKLFDf+WlkXc4wkAE
         AMwbHSS/8yRHq8xx13SdgrTKpUCJPAlvAXOXsD2qqI65gNa71CzL9THGqnjPQ+itk7ej
         AlNKY4iIQzVfLx7+PCsWsiLL0WCpyJquWWvTerzeYNRLfYYKgoBlsB42m0SF/YS1KhVa
         ZoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970296; x=1791575096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=enfwIbnhH/CSB0TdnUwnbQ+pUkNZL4kfBdvjTEYVaF0=;
        b=twm5NC+SuL1hr235NZjvo6ufoPuHidD49GlCinNKNGk57H9flAPmjo73EpbE3+H7ne
         xnCFOBp1K7mL4jQSEX+3frhJ+3k5SO1NEXY8CQzYKf9cAI605Z6vMaq4Yfupj4nbDoC0
         6Br94DfCw+I39mQmIkcRaXQBrFhv7DAzgi80jH4IAcVB7fCIYT0pC9EaSD/06BukFoiT
         TizN+8WIz8rmaWtUD7yc/sqqshpbHkgSlYuQNeSrHKB7V6u/KsVjd91kv1z8TWXbLZNa
         q+IkCpVXJVNhQrCIqrtGmEp2LK5/jES/vdBzf5oSCeMFkTs5ZIhxREJl/Sc//3/rpBeN
         A77g==
X-Forwarded-Encrypted: i=1; AKwUvBxNHRbJWH9n95CKw2cjcFZn4rIDGp0doy982VvAdefsBe/li9zDgHm0lWdfcE1K+OB/mBJzEbK8VGCz@vger.kernel.org
X-Gm-Message-State: AFuF++m9DAldoTzQanS6F5lWvy1xmSPeszisXFjnr+jpp2MTByq+2eSc
	k+vVGLH09Aa4GklwehHy6gllTx9+//CpyXYm291+4kjv9J/CORQ+CTsU+CbI9zvvYq3rkkZ6k3W
	SxkwHwlcTY3i1MeGUwWdTU6hMtN4gJVm8oSaGNi/G2+dlB5I/3uS65tEFUU854hzY
X-Gm-Gg: AYBFou3xkaZEaNNWVAWu80tS19TAHhD9bh7YCaso71Tn9IE71Co7oguJ5WLnBRBTepf
	VAog0K65SzD6xzt6FxPe2anm55okxlOWoQNErCGTRoWi67X+7Zdwr8iw575ne3zOIa3/kw0kfz1
	ogj1+uDV82x2uvywQjeN7mC+9OPq40oj+UFzsFWcF8SsIjRV03JSsAAxiUIsLeMCjQ9SpgYleJR
	YfybMV9AkyTXSXTuA3TPbBOIhST2DFLVAGezkRhVHxMK3jvF0/K4VgeQoV3VcVMmb82lg3jTHCn
	b9iBJeCaojw/L1/GVsDpp0uhVq1gwW85ghbakjMqoa0nWkavDkfY+/mRFuT+cBikocYm9IZ2sQC
	TeKG2FX5INnxi
X-Received: by 2002:a05:620a:394b:b0:93c:5c60:c3bb with SMTP id af79cd13be357-93cf19ee3b0mr711559385a.62.1790970295428;
        Fri, 02 Oct 2026 12:44:55 -0700 (PDT)
X-Received: by 2002:a05:620a:394b:b0:93c:5c60:c3bb with SMTP id af79cd13be357-93cf19ee3b0mr711552385a.62.1790970294774;
        Fri, 02 Oct 2026 12:44:54 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff3cab2sm37791495e9.2.2026.10.02.12.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:44:54 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 4/4] clk: qcom: Add lpass clock controller driver for Glymur
Date: Fri,  2 Oct 2026 20:44:35 +0100
Message-ID: <20261002194436.1275056-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261002194436.1275056-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfXzwhxBX9I2N3n
 E5q6nQ7l+eZnsAsICKdGE/GloLjs772ZemjnSKNm1IOpHAjS9AP8UPI36i1Shl2PVImA50Zge1J
 8i8dQ9RjQHNjPf3WIc2oKRWUMbC+Yp8=
X-Proofpoint-GUID: ey_3rJUWUx3n12WMLJg_YZK-FSKQIVVk
X-Authority-Analysis: v=2.4 cv=UJZIjyfy c=1 sm=1 tr=0 ts=6ac009b8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=9d4qlcpUcIswrQQTxZ8A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3OCBTYWx0ZWRfX+KCC8BoUFkvT
 Yh07ScvsC2lXF6IRPjgB4QcnYDQunbU6f7Mf26v8g5EKYZcxlzIZFbNFVYBAJ48zc5Kd8IiXSuC
 FOqmfrQv68DkmjUUCKlC9Pcsjy4AE/fr59CkNHWAVJn+upP6c3JGay9mF+4/t9WhPTtWIz1kcvt
 C7Kh2JC+we75OhRptx+zOxvGQXKGHvzXDjTrLnhRRrRXCmFNlgYUOFalcPFdpRYA9rPihBa3apd
 qWLBIAA9RcfBusj+QT9BWZt/6zYyg32jTNBG64LqVsNLAK5zhNSYEwZtCAonNWlTOw8TWn7ZJOz
 Oz2As5ImWCRcHd8cjoJeAtXQtFYpBcFjqYVF8pa/BnuzjeVBu6vo/IV2VeMGK+J/RMSPvofDKdS
 2uKpgDS2ZH9IS7ZOJy4vgFE94WhqkmOnUVGMHlv3vh3mQQu1eWjCcPXPwII4v2/jZ+11aKK7UZU
 5kop5kjJmfx25D3dIQw==
X-Proofpoint-ORIG-GUID: ey_3rJUWUx3n12WMLJg_YZK-FSKQIVVk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020078

Add support for the lpass clock controller found on Glymur based devices.
This would allow lpass peripheral loader drivers to control the clocks and
bring the subsystems out of reset.

Currently this patch only supports resets as the Q6DSP is in control of
LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
channel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/lpasscc-glymur.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/lpasscc-glymur.c b/drivers/clk/qcom/lpasscc-glymur.c
index b7fdd76df2f5..742a88ed318a 100644
--- a/drivers/clk/qcom/lpasscc-glymur.c
+++ b/drivers/clk/qcom/lpasscc-glymur.c
@@ -37,10 +37,31 @@ static const struct qcom_cc_desc lpass_audiocc_glymur_reset_desc = {
 	.num_resets = ARRAY_SIZE(lpass_audiocc_glymur_resets),
 };
 
+static const struct qcom_reset_map lpasscc_glymur_resets[] = {
+	[LPASS_AUDIO_SWR_TX_CGCR] = { 0xa028, 1 },
+};
+
+static const struct regmap_config lpasscc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.name = "lpass-tcsr",
+	.max_register = 0x12000,
+};
+
+static const struct qcom_cc_desc lpasscc_glymur_reset_desc = {
+	.config = &lpasscc_glymur_regmap_config,
+	.resets = lpasscc_glymur_resets,
+	.num_resets = ARRAY_SIZE(lpasscc_glymur_resets),
+};
+
 static const struct of_device_id lpasscc_glymur_match_table[] = {
 	{
 		.compatible = "qcom,glymur-lpassaudiocc",
 		.data = &lpass_audiocc_glymur_reset_desc,
+	}, {
+		.compatible = "qcom,glymur-lpasscc",
+		.data = &lpasscc_glymur_reset_desc,
 	},
 	{ }
 };
-- 
2.53.0


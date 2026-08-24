Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031B3412BF2
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572522; cv=none; b=g1J4z1te4XLjvQukplYQz0tepVBxZVylxgkXkJ6ZNVX/ahwcSKUqdRS1izE2dUcjFqJHphfEpmC5Skky75TWac3ltMsIutfivJRpoGGWyMM9QyYLIaC+4BzZQDWJJb8yoMP7E/NBv1nY6O3kPcwlvaNAxuPXL5oSVJGMvaIC+Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572522; c=relaxed/simple;
	bh=qmIS9UURXAzWteJMKNBj/WlZerpxHsDLMz9STcV4Hxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bEbc+ToJ1wDK8LFEdY8Aw79z/mqvSyqpQd5y6bL3DK9IDV8msbp5KpxbsFhZxinw1bFYkop2XOj8q52qLECUQ7x62tIFMgoZXFiZ7CtitzntGFC65E/Wyxq3XNbR0amheEmnGiZNa4QTJCsFS83mhfYqXoPB5uqSnh7tqzRQNI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jAuU2OcD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HhnOaCr5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jAuU2OcD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HhnOaCr5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMmZv1673476
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ioTurFG44UpSK9/T/8OV/TN2zLy50fm/Nh4TZJVqzm4=; b=jAuU2OcDzTw1/kDf
	Gne4aEEMPmu7Zp4JExdcdfsTCGk8P8lmZA5L5t14CTLt5WVr1XwNyW4F5/ZsFwqB
	6fCyknHQXV4zv5WC9FDuBZcXpH1lo6gMkhHF1+Hqla2/l4XmlemwZ5hR+BqaoXMY
	oKOPXkCcQ/pwnPa/R7u53pJsZYk7EoNlfcWK0ASBqyJ/KZGpnGXtIvtgWNDbmtj+
	ByvdEwvCyOrLsWtG7U47uhrK8fq89hvlFgKsNp0jc0sRAgXJExlEn8bYwqjCw7V0
	m9A2G0ueWfvzuKuYWZBBgy8twuSGS8WXPrRY0glUfKar6re/RIxCNd8PNS/bshjV
	bRmedQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf117p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:55:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c07f25de2so26450131cf.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 04:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572519; x=1788177319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ioTurFG44UpSK9/T/8OV/TN2zLy50fm/Nh4TZJVqzm4=;
        b=HhnOaCr5kh/gURgPiWSH6f/Acj1/kju/oAPRkOY/Ww7OBie07yrqM2Q7Iilm6wZPtB
         +oyf9cmsEpFatnGjtn8d1vy266DtP+R4El+QPf5rEGaBTULDZzvjPlo6BUqmx0KqAyvN
         Tld+NIsIzI4vJCFFqTYY8+c5ld7Rvw0ATKNdo27xPmrNLyj7JmgHaFAaCUyWK2NoaxzE
         En3EZJ/EaKBhL6Kwy8RX49+RTR0YobKR+HPBU/NEPd/0hoQpBqg/oY4rwdDp/KKe4ncl
         qdkZ/m4fFLdTOFJCIHldbZE2cqbjvLDf8Wxakjh2Rxq7YV1XOfaV9d4teG8odTk/79Tw
         DZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572519; x=1788177319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ioTurFG44UpSK9/T/8OV/TN2zLy50fm/Nh4TZJVqzm4=;
        b=Lud8Cpo9brEBUpujqI7NrrksJJ42he7yfrhLgumnKhSMeEEnQlZ+E3kIg64Gtrbug1
         8s+eIfi6TBMHiySNI4Wcg5KBS5b1Utm4umVO4vgr7j/2twTrVPBRF8/XYL3dDLtoKgP2
         YV7PDKs5cU4YrmPEN4mKtYGQ+nFz5jpm1f6Hn0Hmt4thf4nhcWLRDJXnSvrtZy/54rtC
         YWfmAXZFEeVa2f8n3zs8vYRQ5JWgF6Cg7TRNeY1IwQz0PCpAGFES64COS/Q0erFVa4XF
         YIUDcV1LLp9kYyOiY9xhlgJNFYNXpSdkSU39Rikovt6ZCaq386cn9NiHEC+E5GEVX1Vb
         pDVQ==
X-Forwarded-Encrypted: i=1; AHgh+RorR8aDoJEzbTbd6zhHiGmj6sDWIJpvuZF3XThlEY6/KnhIOmcqgXvFGo+9F9CoIxmdr/LZL4LNDR6b@vger.kernel.org
X-Gm-Message-State: AFuF++k0Pxx+46hXGM1U4vqpi2QmGVtRMN0DGLYd4sgZ+3JH3XovPasd
	cuNnnfIZHOpf8ZmVT1QcHZAbVD8V1RP+ydKRZjZk9ra+jQLcPganWSlfdd+lqjhns9ZCkwPNQ/8
	XLZWjZoD8Drv6ZRF8OtOEvBQqe9qUROxEYKfUmMkkZ4DzDW21a7nIJ7xFAetn0YwH
X-Gm-Gg: AR+sD11jcXY4d5MCj1RKT6I5eBOQvRcVdM5u/2uJdzzK0vQHHadY8s3A4UYwXouIuXr
	9Znp19ijQfaA6QXtoxJfS5iYA6xiwqBrCwcHwa2sKbabpWRew3B+ChGNN0HYGGTrRT8OIgvlwON
	foVHCVuvw8ja7LqYlOeXhbDgROFoWMNkpoOoSATmC+vMNTXOTEuz3NmS1nw+t3a3gHaridu+HB1
	aH4Cg8P7aNNceY81Y94+9XO8AUQgckNmWWOkna9SeNc4TqvXleUqkfSnXn2wduc2Avrn8ti5Arc
	Un1rYJeJ8p3thu3qjWZjzX9voTkcDUwxmougpjtWNJsQiP9uCTPEgrz4zvWDWQnDirdNYcPKXDM
	do/cYt+Hq
X-Received: by 2002:a05:622a:1315:b0:51c:b900:513f with SMTP id d75a77b69052e-52df5712136mr251454411cf.10.1787572519250;
        Mon, 24 Aug 2026 04:55:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1315:b0:51c:b900:513f with SMTP id d75a77b69052e-52df5712136mr251453371cf.10.1787572518645;
        Mon, 24 Aug 2026 04:55:18 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:17 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:53:58 +0300
Subject: [PATCH v3 11/47] clk: qcom: gcc-kaanapali: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-11-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=924;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qmIS9UURXAzWteJMKNBj/WlZerpxHsDLMz9STcV4Hxk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDg+e1zYCrE3D6iTGFCVQAxc/Xvvv9UEBM8x
 6pMROKt5+OJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww4AAKCRAbX0TJAJUV
 VhGaD/wMqCtS2SkiPCz4O0+a/al68sdr2fEHnlgsmOtxo95cy0mLDrIv0BEDyMWP5MWCwWwBAjh
 RBQ5kCgwUEmww1VcTfDaZlrfforUbYrvie3Necjvx5kaWJlzcBfuu4FOc8ojbHuuH8mjvvDcotK
 stMmRadGgqVMIAf3BKG6HYEPyOJps7EojWnUIAhAxzNZB57icWkGE7PqN4lFzEtysTgZpk5nqXm
 7PMNOhZGeQ+UWnZT54mIv8YASFRhDBppL9w5LzGT9L0Yl1exUrdFvOi3gEUrFfYAtmX7O/kFklK
 zCt5hpEVHF18F+rWEGB9DC6yRlJ64+i326fvtlmK8m+37kVTaHJQUh/HrJF9C5Gwee0RuPRZoYo
 icug4kzzqci2KoVSLrKmKK3wV3NTaL35whlXSVi+/W5waRuxe5wXyMx5p29EXHG0q3vYr0JxMLD
 LA/sRnTbQvIcjXnCFEGFRwY54l8A0ZqYNAS9QUPyYk21I/nBRPtdLmgpE/abDwB8mpTd3C/k8Ns
 diNkaHykK+/U8L/0JcOEbZu+mFbLvMHgwu8OBrqCGchF4i1l4cayAymnKNyfSrczXKWStKpUh/F
 lD33vzwUZaoRpWbMSEPItMlxvLnGd3hkDEHBhvLRVE4qm+fZs57vwcMU7cY5rW2pCDQRjcSIJfX
 vyholzGq4rFCVBw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX7exT7MDF4Zxi
 ehz2ow1qfPesihyrN6sKGo7PPWxqgh24Gn6kOlR+fK2GW46o9/EC40GrjXgF8L+xJ2mxX9b+Saj
 zBAOyjO5GM427VPi9dTUQQ1OZUGnZ0I=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c3127 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gcpHbPksm3HONcV3VD8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: UZnxnY7mPndXz5_wlSBSNTs2XcJD_RqA
X-Proofpoint-GUID: UZnxnY7mPndXz5_wlSBSNTs2XcJD_RqA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXxlypNKubIrVX
 vGrCtUF9ZJ1/SELycm0q8XESGRLWAvVuA4o/YQFeY8WuTF/V0bnvW4k7WdXYWB//MYo5Cq2U6e0
 5b9/HI68cR9jJf8EF+BGW2TBEneKd5gaTGNODHWUy6mhJn4D39cO+X0qDAlbVWc+9UAxY3VUKQp
 ZNWqNPYhcpO9HTioFB3/sRNQNtIM4c/WKFBgjTYzshmAqoKIAUMUYZxX9+i0GCRlCCJFW+jDCcH
 7CaLfW1RNMeRWlPgzNp/hIGYWB0a8H/fqNlDVdyEIUIwb1aOvCPt//hpX8Ti+ljqE8LLmQWGBmQ
 IQSTpAVuqaYJH1zBq09SuPI4z6XmvmFa6V3CfZNNqxJWpeVxKiBVKk69sQKtyfBWU4s8XbKrqfH
 +wiKmCnr9QsQSjfYzausfPhwv4FacKNMCrh80SWGclloVpD3bViCwLq4ex36jLeodbalvQi96nx
 NbuV+cxOqO2PoazFc+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index 5bcbcd178657..c40d2da1086a 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3502,6 +3502,7 @@ static const struct qcom_cc_desc gcc_kaanapali_desc = {
 	.num_resets = ARRAY_SIZE(gcc_kaanapali_resets),
 	.gdscs = gcc_kaanapali_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_kaanapali_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_kaanapali_driver_data,
 };
 

-- 
2.54.0


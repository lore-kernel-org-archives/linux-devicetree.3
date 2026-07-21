Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26CC383994
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609488; cv=none; b=L9KRtI83lEbND7iK4Xc126z+esZcKSoZPk7QUy8ksNwuhkqUNPU32THRLCEj2I4KZvUAgxzs5aY37dWyJyqmQnYSudB3HaY01NNGUH/RZhCqNJV+jy/nJVEDjqg1tY029rQnuJQJm5MoFjLAuNdq/rrv2/erl5PkJ9lhAmbR2bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609488; c=relaxed/simple;
	bh=pONsM4EuQsGA9NQOzxr4UZvpHxsXc7px5zY/ELNEGAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCQN6oryBeYzADYs+VvbyX1Auf+99RWNBBjZQCzs7dd8xc2+wA06PznLsdHwz2Qad4gespQf1AbVCY6OGlG2c8jDo72Ztu1C/7By1t59oMHdmTznb1/Zg64I3B4FHuhyvcySFq1IfW4qH6+pHSI+rYZmKFspOPVOFr1W9MkwnvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hs/OIS0k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VnqZIaig; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hs/OIS0k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VnqZIaig"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCSeA933226
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5GVF+uRSRQ94wVrav2MQRIQW1QzzZcdjUP2/gECutMo=; b=Hs/OIS0kEtp11n1g
	s1uuSwYHKhceP67EQ+FyaXa5ixEw8bMFytBTMO1ZG0dyJGaGBVWCFnng+JbMCP75
	HnjkCjzqtTRpC8bpbry25G8UChhNmcbXzI4Vt4I12DWkoIJwjUB7vFOGUdMBUETC
	fIfmECM45AZzoZJVbzIbeD2Nr4C/VoEZxtxJPxOKYSgbFcow5g3D9FGsIkXZsPSq
	BVOWcFXUHj6sNUcRby+gy+MDRrZbWSKzTzZa6Bl6LPzvHhm66fhKMP5fTazc6Ex/
	7VDcZeB/mmWOPvlVab4shy5qvgUEba94sutC85VwsPFes5YFNTeaY8NoaRcegV+M
	OuSeHg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5tahj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:51:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c856470fe9fso6261234a12.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 21:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784609485; x=1785214285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5GVF+uRSRQ94wVrav2MQRIQW1QzzZcdjUP2/gECutMo=;
        b=VnqZIaigTIm0x7E4192J2aRjxCkJZIMewy6WfSqX0kkwgZ5JPl3FPksngpfLwV5idG
         kqjvO7Qy/NX2RpsmnbX2Mp9qG96fyx5VNFD+vVHGV9lIII2F1fXKplzvrBecwZtnZIoM
         CV93FopvaHl1yNceu1uXndcYcPPuufpWqDvp/i/8XJ4ziMsuwIo8h/fqxvvc1BBOxddS
         dGEmkmnkk9S9SEIzKE3mW0ye/MF7e2pdp4Lf9MDBExoHhiW4CRRXBlxvVpHj7rLTS/EO
         s2fftdjN46JMALZbPIhmFxglG8n1AK+AGM+2pIIeucYETbsD4OqE8eQDGYSVCJtq1uEC
         RwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609485; x=1785214285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5GVF+uRSRQ94wVrav2MQRIQW1QzzZcdjUP2/gECutMo=;
        b=PiLY14I5s0Gv8SMFgVpTThLef0Xkqc9gVCFk8txQzo8MLKu88TESqfUtyUDryjEgdZ
         g8+ktPH6rUHRQWKYPSvVeK6ZXY6y88CXVPsbdWEIdE1aBU3hsuIyM64Lmq8hKYiFCRHw
         fM3dpf4G4pfbzZg+jeS8zGby3wGPKojrjQCCEoCeTO5iUZnXhMBBeW1VGqLnFUoq0tZv
         QkoHm0ZchXQXJx4s2ha23iUI11pFTAfTQs1gfKdwQTuxvqBFJqlHMwX1En6gVyflb/u7
         LJcbDghvE/rD6UPgYNoaRysJyknexbz4XVuTqGxMU6xV9RdQcasdK5uQc8P71gj/dGwC
         pV0g==
X-Forwarded-Encrypted: i=1; AHgh+RrlFEoOZ1ll+pYMuNQDjirNcLUSkV/dbvAXHolzYrDshhtSpS8OgOxHgu684/ncHz/3mPZwgfsDJg0y@vger.kernel.org
X-Gm-Message-State: AOJu0YyOF3U9AP5O0qd3tJn/2srOIjfmf3d0lR87qUfGPqxdMTpQRcsB
	WNZfuPACzAXhEtvAfJnSDVLifkBHvBsfU2ZSDiWdwGuxAEHUkFFasgPbOhPhSi41vXFUBxoKsmr
	12Q2nubSjmJOsUyhXiquk22/g+3j5pN7LOomxQrX8iROMQakvoZQUpraGGBhpcu45
X-Gm-Gg: AfdE7clb81/5CsnkUwcDEpiM83eKEVfqP6GeEaU01HNhxTrq+LjsqHEG4TOlCnSHDrJ
	UdSW26qBzu2isOkm/SSpVC3QUnWsxZ4TS6P6jIifzA4kysOsIyBqKi+ZOkdKksayUJEwqLd/D2p
	WLurWDXYU9np5Rg2iSMpeH7LzzbdCRM660ntXyGjqkU0cMXnFcZa+CMda2yx+kXjrnVtQd4CMMB
	D4EeUxsQUAH+pwCiHRa2PIGqh1KFhaF4dMppyG9NbZ7klzH7gLmr5LXBW1fLI8xl5OBlFGCdAKY
	7+mXRxq1bdajv9n0XX4oa0CXV4qgc5STSZvRyFu0U3p2z7YSyvV/MlFs1emduJKvCTLxFmek0Fk
	u2HaYE4kwFDevZ30zSDm1J8wMbTcGSEKkKbKmlAvzBWtBpVcA0Oe+Zbg=
X-Received: by 2002:a05:6a21:3981:b0:3c0:adec:b3bd with SMTP id adf61e73a8af0-3c3ad9646afmr19057428637.49.1784609485276;
        Mon, 20 Jul 2026 21:51:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:3981:b0:3c0:adec:b3bd with SMTP id adf61e73a8af0-3c3ad9646afmr19057408637.49.1784609484821;
        Mon, 20 Jul 2026 21:51:24 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2ddfb35sm37963183c88.14.2026.07.20.21.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:51:23 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:50:36 -0700
Subject: [PATCH v15 3/8] media: qcom: camss: Add Kaanapali compatible camss
 driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-kaanapali-camss-v15-3-c0b1c1167c5d@oss.qualcomm.com>
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
In-Reply-To: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 1Jxwtl-VR1F1-YieitldBNpJAE1g4KVJ
X-Proofpoint-ORIG-GUID: 1Jxwtl-VR1F1-YieitldBNpJAE1g4KVJ
X-Authority-Analysis: v=2.4 cv=e+U2j6p/ c=1 sm=1 tr=0 ts=6a5efacd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfX8zZ8crT69JLY
 8xlRBcs103b7E+uEY+6Wf3mKrDYKi67LUcFWqpd5Tow+IoiERmruOj116p7ODiybQXmcIsyy8jj
 Gemafxk1ycYZS5rV2EJCWmn6Ra4X4mo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfX7JVkALVN6ahf
 8Hb2knRPCWSwdnOhUW0Zraxy8+QTM1q2xSJmLD2mXlRVzMrsy12WldgXHxECwGhFrUhwOMTWnD8
 C4UXLTl3I3rrr0+dihcUsZwonWZSZscHnudvU5JIquun3s1ylQ8bz95Oop8FBCJF3BI6fguZf5d
 yzvx3AhvDWvu28M71uKu8DK43uXG8raJSBR+j7WHXfZZl2MoOoKpleMIAcP10bUUG3RY8eQfWk2
 fC51n0OtDJswPVZ7uBIDHiB3nyU1YTdTTbksuWn8o5pGcOGnxHOf6vyrgGRoRGwdb1zDOMRZD6u
 ffpuyuPnjtpuJEm7MofPOZMZlzPLkANYm8HJac4RXTVwaTrNALxYX3nIkVJcxo6BS5hXTblfZzu
 zrCJfP+V1O71uSJhWIwQ7YTiPMNw/zy5gIfjADEqwV+NeBg6+rL/0mDm+v1SYjvNJufHI/hSzF1
 W7sbDcSw2oUjE3gaIzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210046

Add support for Kaanapali in the camss driver. Add high level resource
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
index f360b2c99bf8..d41ac42919f2 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -35,6 +35,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
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
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -5532,6 +5546,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.legacy_phy = true,
@@ -5781,6 +5802,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 698694d3064e..cea213dc36eb 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1


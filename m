Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433783;
	b=mWo1tJH9Yhixh781oWH4qM2yspgh2oVD3qxXkFLLdv/s8KX56pkXwBlLhriqrXwmeaZ5
	 sO76HVtsLcTytxYW9J7hUZ0fdMWUWgTjXome3cu/i9wse+IYc7Tg6NI2FaA3zo371ykkw
	 MFXhu41ZxE3pQcQpjtCR7sPzd/jVtUJOL8ER5/tRsdSq/gd2aTyyHAFZAevnXY8hCS7S3
	 0aKL811+NbtQH24PpTzsc+KHAMDXMhJmaLexXYufLesBiS95QzNiJBISM7uEKJ0n97lmM
	 rfvWJw/ZoHat/vE2TdVJzlS2Kq8Nj6rf4WfL6zgz0bbtid2ZkNQFZqgqUWfu8Y5vA0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433783;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EI6JPc1s776YRH357m4QWY+JQIdojiD1eTN8udqAuv8=;
	b=fbC4fR/X5xJQj5mfWbgVmVwMU17M8ipL8HpgBCVuT/px97MDFEpD4AJLYtwKdaxMbOZ6
	 0ctof99I+uNsi5nuidkfrUMJlXbR1cLTTt7UBGNvr7WPlqtFg5uwhIqEQKWpcExr1ZYEc
	 DUUM6nUdXjWQRECDYIXwIpAoS+AIDNbo4oWPtoVYALIL/ljVzQiIYqZxqnT+MZF/jkGcl
	 aIjhFlJrz9mrP/IRvRVTIcpj1R5sqH4ouKWe6b5EoIja6/Yo2JUiyG5UiAnGcUsv68V/S
	 vPBbN5dGt4LNhgYMjeu5HtfX3L4iSeswoo7uM0JwCxe+gswytjhXuTePGhq6U6xU8CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZRjPo3kN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aEkxKbe8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9AF606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF9AF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZRjPo3kN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aEkxKbe8
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9IbNm3491003
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EI6JPc1s776YRH357m4QWY+JQIdojiD1eTN8udqAuv8=; b=ZRjPo3kNYEsuyS99
	wYBVguEEJFDJOZCZIdztuRb63EC+zsrBpgdQ6Yp9m2KNSeZyTes2lrsrXNnSC1f+
	8CYcAKqz74yCePbt7aYg4je8g/tEOC4wjTQDDEoVq6C+J8VXqmQy/PUBFU0M3SMS
	IcYimcSYIsaz/BPsjpukTew4rNyc/wB0wA+gkJQ6iLekMgfN2VMdnYwHpqMkCPTx
	VJJCSbMolssOGFHnBYwKOSS3zV2amVv1atNxLi+/eMGItp7OlflS1EvT2Z4B4VsW
	8Eu9iw8mnGuLcxVYtqtV88zSCLlQZ/2bTGZMAAexmXN793fkF6FOa/4giykc8cl1
	nDF/qA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evshcw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:36:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b18165dc53so3681680a91.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 03:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795433781; x=1796038581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EI6JPc1s776YRH357m4QWY+JQIdojiD1eTN8udqAuv8=;
        b=aEkxKbe8etWKgwAda2WqcQobVca95bqd2gP00J9ZGY3t+ALx5dPR6ER786decry8s1
         uAtcFnWmwnrj0P1pHQfu/t6Su71yUb+maVmq8Mh5HcQnrJEnUFOWypGT/RDhN/8AC/Yc
         FZoxXlyU8fSWtEGYHGRcfQP+YFjq6uyDWg4rDUQAM2mN+4utU7JAvhDBmH74CZ3XZtFr
         wDASTpwiuxkIxKEx2Id5HmilinKsOwRulv4oWxwfGX7RdmuOXaIWT0j8kSyq8aoK81hH
         fcftmYQ7wLJZOOApTYfWnzgmItrQzYEdW+nhnP3RzDfpMRo49SxZOSxAuNi8uj8qG6js
         UK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433781; x=1796038581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EI6JPc1s776YRH357m4QWY+JQIdojiD1eTN8udqAuv8=;
        b=ci/EzJ+nNDK3e4s5J3yxXJ1Fc0bQiTiFTOspTdhG9wAV2fKUlYIb1Cx+qNBV929XlU
         4NObowlwhE9LHjDW5tpw76VQpEfRc2Gndxpe57Ow6azmREDR/Gj1/ZpI4zlwkpXexqDl
         FhAP/DqgDiKGe5efmJgYwC2IGApTH81yl+MUKDEtBILHAlT54vLN7ZZ6pZg/R8CQMFc+
         r1Z82Yl7khxgI56Hh1QsQEX1xwPfVjWOYNzRMPfcTxFaeAwmVnKAH/GL5eYoXLGu9xtL
         2OXZg1Op8tPcoWFFPSbemt+UJ1dgR8m10Yu4MDdHTftXXltgz5fem1vm9+DgKeyEe5M3
         tlbg==
X-Forwarded-Encrypted: i=1; AL+hErGWG0FpBZkBGf6t9mZZtaoUee6PHTnfZcFcGO7xVG0lgIOIo6QCcydMuRxmBwGm7p7LZ4gvAYzIzRs5@vger.kernel.org
X-Gm-Message-State: APuU4Z+LHlsAqOR5ehNvwSbqRUegfxQsHMKiaPeABA33nm8Vr+VdPIdF
	JMUZQ+/hot4YiFixZGDIqTQD8pW5BnFhxHPYMfReiQ25HPmMxIsGs1NdElX8y31EKdkHwCxlmlI
	/r8ruC6rgfBGfNxRr+EeOZ/8V+hKGb8wZ9r6vBphw9B5fUeJWMUjQsd13FetWdExo
X-Gm-Gg: AZFdTZcxg61W3YDoMRZkJOouQywdxUeBajKdvWnfjXicRFiOyee12cH1VM1V7nseYGM
	d2djHdiFt77WWgnDmjw4r6+FnV4pbEZ7F4pfqjw68EhUR6UQI9zTSzehQvZkWwbh2j4pANt2imt
	LWrtxp0TPmbAD9st2zaOxfq6dn+6a2oEQqRfHAZDxy7P1h5TdXc+L0YVD4VkSE263b0uCdzgqwW
	yFaflzF2R16XlY1/XQTyGGokmyU9E92Kr1qtSTjZ35rTsbaL8z7aH8O0y9ydI1o2KgdFVbc1ldS
	sbkiD+nmfmz5FxX72KZl0JHNsURBcHo7PKFmPc0hBbvsGPlTAHsYuzcuyA9hC2bKyBUX1FPjsLa
	F6Cri/yy+5ZR9Pc3fid2aG5q0rE78LiieLHAz5/1zOIuVRpPyb/AV+k0jMKH5gST74/cCXACVVT
	HAXXoz
X-Received: by 2002:a17:90b:3ecd:b0:3a4:adea:50ad with SMTP id 98e67ed59e1d1-3b41c9e46c6mr10373954a91.27.1795433780532;
        Mon, 23 Nov 2026 03:36:20 -0800 (PST)
X-Received: by 2002:a17:90b:3ecd:b0:3a4:adea:50ad with SMTP id 98e67ed59e1d1-3b41c9e46c6mr10373925a91.27.1795433780099;
        Mon, 23 Nov 2026 03:36:20 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8e93asm17489024a91.11.2026.11.23.03.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:36:19 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:06:00 +0530
Subject: [PATCH v4 2/2] media: qcom: camss: Add Glymur-specific resources
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-glymur_camss-v4-2-d7db74f59e22@oss.qualcomm.com>
References: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com>
In-Reply-To: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795433764; l=3050;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=nyXhP3Ab+JK7/tMc0Dc6RlQW/cBCn+toktGdYLYMpEU=;
 b=+BIYIoCCyGBcMVks1nrKVa1cSnkcz/01IshxM4a8xghh6UQzv8JTPdUVrEr3cPI07EmhfawBk
 LOuj2Armqr5AjyqWN8XhK2gIC/45oDiR6YCmKxxhZcouTwBPksy8d/8
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b042535 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=eFSy-WoeKmqNeFKM-ZoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: OyI3-vdQvHCHLiSEafRx1uwc8ymoV6EB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NiBTYWx0ZWRfX1zQNYlGHT08f
 V14n65/qGSYTguI7aEtPxcdNAdk7gHZM1iygeV55bujph5Qvzs/NO8frSfuL5dT7OHTeQ1hbxxA
 lU/3TJ9RPE4rBF/D562er6kDZZ+eC3OBUJwuKdc/EJDXTj3JbGNW7Qh1Y9jzkFZIORja1GdMh34
 O1SBXoqrCRtLNqvbxd29Y+mJ46Ou47Paq5GbBiYIdleFRYS4C0ASkQc34wADOQh0AlZ7K10SW4a
 bpBuR4QH8Ggx1jB8r06pGqnLv2UoOdrCrwomyG21G7rKWkM5RXSTF/P2SSxGewwo8PvbfKzAkeb
 T6vYcUhxTFb180nFAR2y9qXver77yeb7k5tOrsOa8eSotMvwPXezje16+ea3RfwBXnaFdEsgyGg
 T+Or7PguBg7ROY9adtP/fOoRo2GCjUVo4F8hFublWoH2oz+gXVAWdvjkDXIemuKs+znaMrJ7FaK
 mEcVYbx7UDnZLAGwpMg==
X-Proofpoint-GUID: OyI3-vdQvHCHLiSEafRx1uwc8ymoV6EB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NiBTYWx0ZWRfX8QElsQlBYZcX
 cfNN9dv4tPYzSo1pGkMa150z+1YHCV3JXC6/mH5DG882kHhIAkQ1iHQpZQxv3ZuvJs6IMUrrBf5
 fkuCzZ3a3GMoMmtfg4If03C9aHMBZZM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230046

Glymur has three CSIPHY instances while X1E80100 has four. Reusing the
X1E80100 CSIPHY resources also exposes CSIPHY2, which is not present on
Glymur.

Add Glymur-specific CSIPHY resources for the three available PHYs while
continuing to reuse the common X1E80100 CAMSS resources.

Fixes: 09d6c30d3fae ("media: qcom: camss: Add Glymur compatible")
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 42 ++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index f8e5cf9f3ff09e96d3b48cd5628489715385cc5c..f3cab9ecef04273e09b81ee0cd4e31ca45d1c915 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4103,6 +4103,30 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_glymur[] = {
+	/* CSIPHY0 */
+	{
+		.csiphy = {
+			.id = 0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY1 */
+	{
+		.csiphy = {
+			.id = 1,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.csiphy = {
+			.id = 4,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
@@ -5572,6 +5596,22 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources glymur_resources = {
+	.version = CAMSS_X1E80100,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_glymur,
+	.tpg_res = tpg_res_x1e80100,
+	.csid_res = csid_res_x1e80100,
+	.vfe_res = vfe_res_x1e80100,
+	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
+	.icc_res = icc_res_x1e80100,
+	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_glymur),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
+	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
+	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5806,6 +5846,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,glymur-camss", .data = &glymur_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
@@ -5824,7 +5865,6 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
-	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
 

-- 
2.34.1


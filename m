Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF45D3822A1
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168609; cv=none; b=ersZqWfY0lirj/Yr/ebeeBKsSuwCjRBdTY6K/4WGqJxMlcDg2b54XrLl6WSQEdjfnukkL1c+jPCjdOFV0n0MH6AbJdZaaF1jKClNFZ8Wn1c+9ruhHmLlb7J9lfdJwxZGO6ldHhGPrrknFd6tbKdn7rUnyREsbx+GDmJ8ljHnA38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168609; c=relaxed/simple;
	bh=sXe88ukQSNsLZHvzyXQa5xxcPKvZD1x3wSbHfVavSEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=obq9kBu41HfeblWWByHIazaZOIXE5K3QoF3/ZOba73vXus6vJReb2n5VOcurm3ZhpP328i83V99NIedro2y101gijpl1R/aZDjqFks6Viac4UpTmsWeNWQTlvnxZ6FiF7xqzNhDRCUWY5jX5DOlYfNRdBCYioVhufD6hNZ1VZvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+ZJsfPE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8MAxrQk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+ZJsfPE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8MAxrQk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GY1M3812619
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ou64yNSBPM2pfV/tB9X33X+l86QX/kXFd8dLTHz7OTw=; b=P+ZJsfPEddYxB5VE
	odBoFZ3Vrui5W2fBtB2JfVNanPmARXn0z65PTRH5bb3PPk8h5wfP7/FK8sy35bRc
	cq5Fhvvbul0hsmNGTdkbyLP7krpGcnnBeqLwfa7ZXkLXZivrLfVcZBUcqBGh6bdt
	PyDBJk8FCSklJYAgnKwOR7ybky0HXdBrWSSsTjJY2gEzbtTtlwdysq/OpI7ZyaJJ
	3a1jDlXpcDWQDMAwot09Ct1hVHghT/RnBEvUwapfacQ0OoMufIJWVyHCGlAB1oHc
	YdIi4loJa3kEZZeFQ2NZedobptbbmI2sN6mk2yxPkM/YuDtv0ObAqFloLi5bJVRf
	uDdIAw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe71jpha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:03:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a2f19558so4446514a12.2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 02:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781168607; x=1781773407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ou64yNSBPM2pfV/tB9X33X+l86QX/kXFd8dLTHz7OTw=;
        b=J8MAxrQkfLSgJkGosICjZd/+rsLdNx769EXZZVHM3H1HthgmFN7LW/ZxpeNWU0QcGD
         /A+blAcSNw3tE7PRvkRmswJqI1ITp4+4HoE3TxJlEE2AjR3yVFVmgLaik/Oenj6/gtdS
         20rlR+Ni/p1GvnQUZhOaeYmvAC1o/FxrKGvfFMA5TOX3RvKu2UsR067AbTtXCIq7fNx2
         WgFmHnOkwnpaEBr/YrW7xHG9miCL/DgAMJdCA4l2p+TlPSNBjjYiXHEuo2bQzqj96T1x
         alPixuaIXY78cLrmDgtzspygNiMLiPC8vAl7PLFCEQF/AfICJmlQT4xmwyyaf/Ujy6wA
         /PQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168607; x=1781773407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ou64yNSBPM2pfV/tB9X33X+l86QX/kXFd8dLTHz7OTw=;
        b=Ci+aBLWFXyUvoQswqMc16CEWpvyesXvhHq0v6S1+tXgI+EGkvvHrTHgU8iNUwmk/1Z
         cp76+/ohdGDWic0fVUMq0sDCTL/tpjZQY8E1FLo2Av3uCWZ9ATGt5LGfpPEbZHFgyHMf
         by5z7tBzwrP194/hcbENoJiNGGGT/qw5/XTkaSPt1gy0b3D3KhSoInwaF6QRb/QuJLjE
         imWZ9wTZKccUCJHGp5dt7h/YqBlIhpLskOtVuOSvKaJvitejvcpw9znflNBba6N7SLgo
         2XcMVNc84+ZwMWViegmHmcrKuNXO73cP2agHqQjVGnBAQ9fTLy+BJYdNH8fJxDvBN9dW
         wwvw==
X-Forwarded-Encrypted: i=1; AFNElJ8AgWnDDNVMSzr2RoJtTBAUmH2UybGjeVUo9/5oMbWhEYjKkQwf+uh74sL9e2Y5WsQMpRCdstWoSJ1v@vger.kernel.org
X-Gm-Message-State: AOJu0YzaZh7ARb/n2N+UZFOAvsuHj+2iyPuRbj2E7dd8ML0aXlkYFJ4b
	nD/3WOxeLM/wyHezhWHJK8DhKE0nJcm/WU0zucNKSBZ7Wajzo5owbqytMfXglRx94JeuxWNVu7U
	WXFTuNXSfPjBczvPNT8GB4ZaADT2UJYekVqp7g0mMGzix/x8ASy2Q/mLKZ0nTG0SAiJYyPzwa
X-Gm-Gg: Acq92OF4JcaWCqXp6FHThEQMn2Tjif3QYv5vv8NDH4sQALoTKZMryguCsECWeVAxwm4
	wspEyvemgftiFsxyCtiSyALnqrVbjnS5BFiD7sna5lKgt8fugDvzWrnhtMyNcoRq3xPyQTMAtTw
	4Yvbax7vPiX94JApdFNpnSjX3AZ67anP3DYh5eXSShbIEmzwQQC3gWtuTT7hnz+IjZkjM62BMZ1
	1tJvfTPWqScNsRHw6JNFBk81/bOdPGBQL1eiib813MZ7tKXPf4T69MXo/gr9zdfio4Ta46GAGSn
	xI8T7INKhMix9xDYptoNw2HaJPY0HgrJRnwUf3gvRzsZA4TjjCqYrUgV11YCv25UMCIdT5KC+ut
	tmyDv0B3N8KZNjaXbEE4ewuvlmYjKIa0uVkg0PDWehLj4cL+3LC4jTvuCt2jcobW8r6ywVTn0y4
	pRYCO1hmOOqGhQ5eBgsB9ZRSY3YmMZmoBBY9CQ6nq5CuRAHvMKJRrZ/swInLqc+Q/BVz0=
X-Received: by 2002:a17:903:2acc:b0:2c1:4310:d80 with SMTP id d9443c01a7336-2c2f0731e2bmr25403515ad.8.1781168606693;
        Thu, 11 Jun 2026 02:03:26 -0700 (PDT)
X-Received: by 2002:a17:903:2acc:b0:2c1:4310:d80 with SMTP id d9443c01a7336-2c2f0731e2bmr25403035ad.8.1781168606280;
        Thu, 11 Jun 2026 02:03:26 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edbb49bsm140980535ad.38.2026.06.11.02.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:03:25 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:33:16 +0530
Subject: [PATCH v2 1/3] regulator: qcom-refgen: correct the regulator type
 to CURRENT
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-ipq9650_refgen-v2-1-d96a91d5b99e@oss.qualcomm.com>
References: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
In-Reply-To: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: UghtRhm8VBlCN7HsesbBkq0kW7btfHDg
X-Proofpoint-GUID: UghtRhm8VBlCN7HsesbBkq0kW7btfHDg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfXzb6JeKxbotEI
 nAJj6CjtzCBuEaIJVgpaERiizZuCspuqNPmbsXdoEnJ/TOgks6pMPDEdc6T6e3VRrIl1VuN1gln
 xgh1zREx/XenOK8lS762TzpO2937yW4YflBMPLUcWvEkjgohO2xCgUAOIoewwV7HPem1aFsewpO
 TpF9ySuD8jFgUD0MTHoBcOYx2SNqAdE6gKXkVbJCu0gSP+7GWaCML3t37SHT9+G9mZDzqTW/41g
 oaugxMdACDKrBOhS3rMcoqQYHFRvgmmXHvfEWb5dNdUeCTfMkm6GzIPRJjHkxu0IWevJJB8b5CS
 bJhEZXgkxzm/fe/xfnV9CFGm3dWMY6VvZmFhqXuIIC0Tf8ebvJFieaJr4dk77XE7UVpMjM7pBEE
 LeSIQl0QoOHCucAYSkm/c/JUNtx9n+T7A4//uiaMbqsRbsSUs5D1L/2m63ext6XgN2XAx/XKKy4
 Vzx/d46LZSe7MMUAyqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4OSBTYWx0ZWRfX1dKlGyLJIxf4
 Z7aH4V060ZQHVpBVWIUDHorsHebZq2uF81Fm/oV8Y3j278zkzGKIFTq4uX2WDDmyYRmjVBUlMx8
 pIn4gAerX6JmUoVuc6uL5kwRe5XzWZg=
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a2a79df cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VkQhxhI6jZxeKeB4iE0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110089

As per the REFGEN IP team, this block supplies the reference current to
the PHYs in the SoC. So, correct the regulator type to REGULATOR_CURRENT
to match with the HW behavior.

Fixes: 7cbfbe237960 ("regulator: Introduce Qualcomm REFGEN regulator driver")
Cc: stable@vger.kernel.org
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/regulator/qcom-refgen-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
index 299ac3c8c3bc..6a3795469927 100644
--- a/drivers/regulator/qcom-refgen-regulator.c
+++ b/drivers/regulator/qcom-refgen-regulator.c
@@ -66,7 +66,7 @@ static const struct regulator_desc sdm845_refgen_desc = {
 	.enable_time = 5,
 	.name = "refgen",
 	.owner = THIS_MODULE,
-	.type = REGULATOR_VOLTAGE,
+	.type = REGULATOR_CURRENT,
 	.ops = &(const struct regulator_ops) {
 		.enable		= qcom_sdm845_refgen_enable,
 		.disable	= qcom_sdm845_refgen_disable,
@@ -82,7 +82,7 @@ static const struct regulator_desc sm8250_refgen_desc = {
 	.enable_time = 5,
 	.name = "refgen",
 	.owner = THIS_MODULE,
-	.type = REGULATOR_VOLTAGE,
+	.type = REGULATOR_CURRENT,
 	.ops = &(const struct regulator_ops) {
 		.enable		= regulator_enable_regmap,
 		.disable	= regulator_disable_regmap,

-- 
2.34.1


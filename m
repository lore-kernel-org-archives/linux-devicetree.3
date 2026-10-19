Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A5A4FDA53
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417289; cv=none; b=S3PNPlb60AVoaJBG9tnhZ7xN36FwoFxMYYFi81SeR7U87WWrLxmsLI1fWCksoKjT8X5WGQZ1wUk6hoeIf//l2KGTonSs581Ofqv0o/kCZ1gFcI4pH62EUnRfR7WDjuKUz3le5ac5EjIVAViHgJv54tVhSlQxnQ7ZP83IaWG0XKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417289; c=relaxed/simple;
	bh=GYsMi9M/l+N8xb7NgynOwqNgJk993TWhQAbRX7Zk1tM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PHVLVsDOKrnuAj7U5hOyV+ovl6a+ffjRXs6KsGqaH5BGYEPKJ+Zvd1h5i9WycDAIgYXWUApyYlyMyASE5nA/AfrOC1Bw12XCI6RelzOk+bZ+7leQ2416ByV0xVHOoEIpbt4L+pDY8zBExCPx8kvT9ByWhmNl/gmebd75jzP7/84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Re/Qwmzq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RFt9OgBc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Re/Qwmzq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RFt9OgBc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Ox5c2752524
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yg2/j0qKSkzQHI952DL/AFIpyvPVAy4JcFswiVyi5qU=; b=Re/QwmzqZbU+knSF
	va0qJoLF3ubXpkG/bjs1PiiZPX5vv8o7gESDTPsNI3YSBTS1oGtxz0LiYdNcl4t0
	QjRUyMehgE4NzWg9WhPb/NNgnM1gmSA66502K5IRNRjgMIX2o6406j3LqWzLluYn
	z9ClbBWPpsHkEbYZApBrqJljAU8kICTdwnEV709Pfny40PgAtPQqsCqWfCaHqPY2
	T1fV+4rC5HPGiJ0e/o6eqJIhdK62pmAibmcvMO4GqGHubS1cweOui12g2sq0x0yn
	JCEQn+XWjQ0vXNQGRltsriQKR7amUcq5LH8dzCADKonZkS2kjBnySqLoTqG4zwRP
	5VI4hw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48han6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 13:41:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1e62510cso517330685a.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 06:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417285; x=1793022085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yg2/j0qKSkzQHI952DL/AFIpyvPVAy4JcFswiVyi5qU=;
        b=RFt9OgBcldteF3NMFNxOq5RQ85LIEijb815N9NE8mXyqPgHL0uCSNJ64A/CEaogp0/
         zAkIY7tK2D/J7EHD4UUn9lz28M8ORbDQ8GM1ttPVspAgtLyDU3zwOpbeJTMDKB47CA7I
         zn1E2dGCtaybJYbgQzL8F1PXMymySAmZB57jFgctyDHTA423S1HLbuxkssSK16NOWcp2
         webndLNV8R5BsNAuSHGcvtHO10H6j1pzWwuclJEQwkjHkdxPnLVHt4WBXvbONiY0+VGi
         5PNAQ3iQYRk77zZJYCbz5tVidRuQTdp1ke9B6oMCaJASGgFJYSnv7mT4UvwZWooFb/dG
         heQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417285; x=1793022085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yg2/j0qKSkzQHI952DL/AFIpyvPVAy4JcFswiVyi5qU=;
        b=FFS1j39MQDk+mR1Tc7ptcdxE48Tig1vqwmnyF3UYNINdgFzQctVqFJuIDdpQAQfJXc
         AfApb8K6Fc6P8OFz3LEshXz4Cs4X3FKkDJkWE6AOxRdmoomIPSHDpaBR/5Qx2Z153fvE
         n5fQiw7CWX18BNOlu3w/a+nNc7Qe/+HOwUQxyNNFgO0tAlw/37IGsHNEYhq5SfPie8YB
         UL/6ODHL+f0+OmY8Iq7xspH/3oRqdzjJmYc+3Y2grSrDgatXvN9Afz6A0lpzfFin9lZT
         J2plR1nW5OEc4i8tAqUzoi695MO3Ox8KmK209HQgwMa85qKo38nwKTBg5+Sk8x32uzma
         OE0A==
X-Forwarded-Encrypted: i=1; AKwUvBzxaOVn7ByfuVmU0GJGhrIMPCuZg7grtxTGhXcGFw5OR+OuDSS3/QZRsF00OD2hggVVzJ0/rAR8f0YY@vger.kernel.org
X-Gm-Message-State: AFq9FYKUDB9M1jFXwBpoawd58R/ouztLP/MVPEtydzQ5+0Sj8DstM0BB
	BxZRgKoiKpNA3NIjQFCgzffydwFPNcIvW70RR0AfqI9aJd+KTDmKywsQirEmq2IWKX9Uc+plm2R
	D5JC1gRfuOpOQKhp24GQl+aQ60cDfAv7NA7yTWVC3Y6rwPp/5K2qkZ7TgPbFwYVW+
X-Gm-Gg: AYBFou10P+rlkg9TtP+cx/2DDVE5QQcgF76bd0i8QsOOQ/FwistccRGCgor7Lu7dV++
	+ANeWXe3ZNm2TWTnsL5HlgTV4AYJkmAh8cjwbUiVuWdkfZJhy+RuR89+EeVQCq+1ltwCPV5/hkP
	QDQcqFt/vdjaeMCSuuKfddtEf0SYDCtrypxo5WVADboAi6twzHgVfLm3rIXitq0nkql4jKcBrtS
	5ShLKCw5KTsr/oFSHfjqJuhuwSyw4HwT5Zq6Oq8ngbU6FI0DnD3q05oDtOGStNSt4/XEYQU4Do5
	99MG7mF7Ly2jEC5+Q+x1Wm1Vrtp/Azv+8h4z0riQ7l/9mkJhJNlyVPi6qojM5foR0Fq0n8elvW1
	M0FpUlC5L/CAM/E/nGtqcRGyKB64dN8X0uN9wS7WNUHYBty7i6Cg+c6zZtDH0qQ5jFNLfg5Xghu
	+dtmvqTYClUz7/
X-Received: by 2002:a05:620a:44c9:b0:93f:3f86:c4e9 with SMTP id af79cd13be357-93f3f86c50cmr420028585a.79.1792417285110;
        Mon, 19 Oct 2026 06:41:25 -0700 (PDT)
X-Received: by 2002:a05:620a:44c9:b0:93f:3f86:c4e9 with SMTP id af79cd13be357-93f3f86c50cmr420016885a.79.1792417284056;
        Mon, 19 Oct 2026 06:41:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab473d06easm4409851fa.31.2026.10.19.06.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:41:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:41:06 +0300
Subject: [PATCH 07/10] clk: qcom: cbf-msm8996: program the MSM8996 Pro
 post-divider
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-fix-clocks-v1-7-370949e4d8a0@oss.qualcomm.com>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1835;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GYsMi9M/l+N8xb7NgynOwqNgJk993TWhQAbRX7Zk1tM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1h3y3mN/jE4s1DnxolwyZziJ6Kb6CFIyY9UUf
 uKGerctnc2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYd8gAKCRCLPIo+Aiko
 1XpvB/9fBNcN1I0LMvka9RWijRG8JfsFN+DHIx4dAfmHBiSbqJ0dZmYy4Jh86umygFtq0DfBDj2
 t3VZGXkD9p92/125j+tbp8h4s0V0nZArgQtvaSDDmB5A1/cGruzXdQQiWgCZc9IzGbsPDihVvF+
 fFKUIxGuph+tTf728wYjnG+tDHmroKALP50t9xA4c7tLBlDGxWrzGWiZwg7EP0/fqUXcEoRVfmx
 AjX3hk7cQu4Atj9P2fHcU0QBmab0lbLBCAxXNyynVy9ThTnFKnTHVpjPXZo6stxLdCVngDXClo3
 //XKnhmPQ//+KfcvBDfDemq6bTomaRYZ3n/PAjBsWOmAl/1n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX9QHWMtlq1Wif
 IJtbAayhQ85btG50v6FS1+xCi0JdjMbISl2yLZccskzQuFfFXtO+2HKct3JKTMEQCd03gqWfqfY
 O/nV7RdddR6Ky/TWJHNa3LVcD309p+SbSwrO7btZ8CCVP91QE1RbqUglGaxRKJP4bkAAJnbJka8
 uuqv5AZEVHYK2S11Vivz64eytA4l1ecD1wMlLaI0dGYAr+PHjtHGOW/CmFnEec7yi0shgrDy/5j
 +8CN1AohrQJGEncl+WGR8W7SHkjh4SYefSSMaYoOj+wteHRtwyxQlWIleUmL87p8kbo5rABM+jx
 GAwKQjaieJ2br+rmNhzix4K4YVgD8TnDhLwu7On49txDE4KJbc+OYv/3f8gTa9L8vgi87QjM7Id
 RiwCvk79/QhPHDji3Nxd4Cv8lTs35V+cc6cmICMOxgMFwSBRf1laanL/UGNPgc877dzrwXhmtJY
 fHPEUlfLPoDhA9b017Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX3I9LpZxV2zgW
 5+gC59qCjxpUfh7xwMpA0voVycdMK1JOzepiEvklkf5+pvqytFKzhFBluRzPHj0uleVhbKcLabX
 3rFLLIkTvOPa2h3gvrSHajUNnNgit5I=
X-Proofpoint-ORIG-GUID: 4IKLJt6Y9-7s52Hk4lDAd_AmF44ptFmi
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad61e05 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=FLPO46FfgU645ZJayLIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 4IKLJt6Y9-7s52Hk4lDAd_AmF44ptFmi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190054

On MSM8996 Pro the CBF runs at twice the requested rate below 600 MHz,
at the voltage of the requested rate, and the SoC hangs once the fabric
is allowed to scale down. The Pro post-divider of 4 is only set in the
PLL configuration after clk_alpha_pll_configure() has already
programmed the hardware, so the PLL keeps dividing by 2 while the clock
tree divides its rate by 4.

Set up the Pro post-divider before the PLL is configured.

Fixes: bc48641a68dc ("clk: qcom: cbf-msm8996: Add support for MSM8996 Pro")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-cbf-8996.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
index 0b40ed601f9a..1bedd14aa3b0 100644
--- a/drivers/clk/qcom/clk-cbf-8996.c
+++ b/drivers/clk/qcom/clk-cbf-8996.c
@@ -287,6 +287,11 @@ static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
 			   CBF_MUX_AUTO_CLK_SEL_ALWAYS_ON_MASK,
 			   CBF_MUX_AUTO_CLK_SEL_ALWAYS_ON_GPLL0_SEL);
 
+	if (of_device_is_compatible(dev->of_node, "qcom,msm8996pro-cbf")) {
+		cbfpll_config.post_div_val = 0x3 << 8;
+		cbf_pll_postdiv.div = 4;
+	}
+
 	clk_alpha_pll_configure(&cbf_pll, regmap, &cbfpll_config);
 
 	/* Wait for PLL(s) to lock */
@@ -303,11 +308,6 @@ static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
 	/* Switch CBF to use the primary PLL */
 	regmap_update_bits(regmap, CBF_MUX_OFFSET, CBF_MUX_PARENT_MASK, 0x1);
 
-	if (of_device_is_compatible(dev->of_node, "qcom,msm8996pro-cbf")) {
-		cbfpll_config.post_div_val = 0x3 << 8;
-		cbf_pll_postdiv.div = 4;
-	}
-
 	for (i = 0; i < ARRAY_SIZE(cbf_msm8996_hw_clks); i++) {
 		ret = devm_clk_hw_register(dev, cbf_msm8996_hw_clks[i]);
 		if (ret)

-- 
2.47.3


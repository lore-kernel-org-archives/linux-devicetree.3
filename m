Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69593AFCF2
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781773642; cv=none; b=r4+cLOQrRS0zdQ1gIHcwWT8fK1JwJBMoQoYfMCrJgRE5ydDe1cGMwVdHWShx3rTamKZfUjxGCwMET3l7jHK9RqSTSP2yi2D+1p+xFiHBzXLHmsrLOdD9tHQI9V/VAttmT4QP07u7gDmpXaVNEv4hOckW/P8nFLDrrQDpwWEVrHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781773642; c=relaxed/simple;
	bh=+TieoSW0TmXJj9IhSw1FzzGMD4+YbgkEWimJ3NK1Jc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FsXoxhkIrE23/qItjOaoL/93Yh1Graz10HeCYilQNrKzBjM+Dx67dj+HmspG12XkWgUKvWjYSCrXgSHD1PVEEI8HyGUfg5su41pXRBHVt0du/azODPCWy98ETAVaKHxX/nXCVLIUnxFPJAYKsIMSpFSLIEpkHnKppv8Y6nywbqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Og7fUaN9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eDC8m88u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Og7fUaN9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eDC8m88u"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8G1JT1157417
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	me/ZeZGBFrRxMjpUXscm+km+tQIrTlS4RdikSDJkC3s=; b=Og7fUaN9QfFLOryp
	MQaH47TqY2dvKQjEmN7ZR7oxYbc7eJoV70OFmevJYSiwqZqXIC9Y4hNQ+8NmKYil
	qUJFyaL2XdeL92/oI2f1kSoiIkoljBqNH87l89ddP8//J/K6pVfmlZEAKfL+2zGj
	wNb8Zz3mKFx0/f+RFtn5/AY7XN7ZY6f8mRcHGTk2JjeD2iT4jsct2TuB1o+qj8W1
	bQsV2UEiVyjBhYq93vbwihapa8+mFBjhLYRAIpKzuJYmOY0zaH2Ggd7rTQI5/F6w
	iQlEQA7wAiF3fJDKnO7UMiTATVOH4oksyk/5TPUcYzh/csyNcOmd3lXM3V2k1MJ8
	z3QBdA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev19a2ny1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:07:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d99181eaaso853408a91.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 02:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781773636; x=1782378436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=me/ZeZGBFrRxMjpUXscm+km+tQIrTlS4RdikSDJkC3s=;
        b=eDC8m88u+0GFivRyO7zsDp7HXesjkPLuhdlO6XNEIuJVd30DDj9LkWMuJ0Oop3gKFe
         Us0SGlIuJMbcuzZVt+nSfAqzR0KAYDUla3jgk85WrVdO5zZHcZmMwQz4G/nTXzkeXeaC
         jHeQWmd+ohtF8D0wkr01NShB1ZIkdRh8bkGi+5cSfddNzMN6uMN8yQqooEri8Su+J9Gi
         GKMT7PNDQFNquLHZ8UTvJWcxTBmJWcsWLRiqHjXoxtfzHSTKsa0fpRC6AICO+GazsQW3
         UyaQeONwFQWOmyaMrZJPyb4RgCr6o9wl3cttdxlZWATUYP0quGLel8+Df7PAU4+WC6Mr
         H/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781773636; x=1782378436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=me/ZeZGBFrRxMjpUXscm+km+tQIrTlS4RdikSDJkC3s=;
        b=PpSyRdMOdC5ZdIf4DLHVq1qXL9rYmEmeU0dn2HrbkIcIVKxsTNPt35oTt/87Q8zGiR
         l8hNtssOno1lCAVzSgaFVqht87gL8o6b8LFbXWown2XPrlrcNfXUtXOuOlMKmNjr0+87
         5hATYhO0+zL0CVPeceFlJ3O9dFVfIoEqj6X7cVPbw7vqHRCo9MiQNiMt08LUT2zu2lJm
         VSlxFfgwCF1lqnbDaw48qEJzgRmVsEWgXIKEsK2gKx4vTxhv2IdJI9UwHC5Mywfasilg
         gUbUfY419fDYBJwGqNJ6N+M1syMZmhNbBBCJ5uY3BGYsthanIUCm0gC/gPKtEsczun8R
         OXRQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Q2Hw1FeJMPfYcjdJAIFQtcthi50KanUN0caiawDmap/NFAScdWB68RgPiy5KZeiHwFFLPH5BIE9AG@vger.kernel.org
X-Gm-Message-State: AOJu0YxVi//iikB8ObKRNKt1MOU60PN5gk/rYO/u3GYQISZ71kmVrnB+
	UF3rcEYzHt/vAfALVz4zitehMLiV+ptrGjehD4TiQhFlBVNBNBHAHUJat5l1/tjt2bz3S6JUc8L
	SS4DQxlUEdu14r8IRxK5omB8RQ4LO0TUn5S67AEzRMTkwT70FWKwgqIUBbC4iDm4N
X-Gm-Gg: AfdE7ckvIGRyb+yUd/MSHfBfclpcYMJrf3h0IoJjjUUZuxjjJVqUUCD4ik0apyXvIhV
	bo0nO20VJ67jPcjJsLFG8Xrf8OOQzKyJBjahXglpnD/+khOqy5pxsKFmBf1zoKa5+9o+NBSw1HL
	0qtyqMKmRf/7Ujk6pwBhTdMrv9Qgwou75bzlnbRNGb6rOgh57l76ddIs/AmSUYOF7a4MAnG29M4
	oZCv1FFHF/guwHgxTD442d5x1oib+jV7fKF2v3EG+jog2WrLaweEpw998Rj4YtxvKsxKVG+Xqxk
	7BIlA7OUfrpFoG7xFQyeutYJ107+krNwn7E+qi0YBWUXy376Fk0SCiTLFcojfGcL6MafPpF5qOD
	Of0lXVnWtX5MCSbOPtHKLB/sM8gSTI+dXaVXtCfjXETEU
X-Received: by 2002:a17:90b:394e:b0:37c:ad9b:680b with SMTP id 98e67ed59e1d1-37ce459e168mr2757701a91.20.1781773635599;
        Thu, 18 Jun 2026 02:07:15 -0700 (PDT)
X-Received: by 2002:a17:90b:394e:b0:37c:ad9b:680b with SMTP id 98e67ed59e1d1-37ce459e168mr2757655a91.20.1781773635039;
        Thu, 18 Jun 2026 02:07:15 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac794sm192112835ad.46.2026.06.18.02.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 02:07:14 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 14:36:42 +0530
Subject: [PATCH v4 4/4] spi: qcom-geni: Enable SPI on SA8255p Qualcomm
 platforms
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-enable-spi-on-sa8255p-v4-4-f5b5067e7e1e@oss.qualcomm.com>
References: <20260618-enable-spi-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com>
In-Reply-To: <20260618-enable-spi-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781773609; l=4812;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=+TieoSW0TmXJj9IhSw1FzzGMD4+YbgkEWimJ3NK1Jc0=;
 b=nG4G7e3ICdOdmKE5Wjh8NgCoMuR57zxjGN07GNne5Qzbm+45NWikiB5HAqxwzXhOWSvOl2HAO
 n9O/LZxxrNpClK2uHTpcVWc1f6T/1AAO2uAe57CfNW5YOkUVEEj0VsG
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=YbmNIQRf c=1 sm=1 tr=0 ts=6a33b544 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=L4oeRUVQnX-q_C5JrjwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4MyBTYWx0ZWRfX5i6H3iCh/deg
 2rP+0WIjfL8vcdrYiUf3QDkS3/YeSe9mnWYWnb8qV/3qSFRdecSNnWIUEKz1Ij8l6nIsnEQRKzy
 CX/lM2wTUT3hdSo8rhwnlJMYn8nnWXs=
X-Proofpoint-GUID: uf9z7y2iVW3uyDT1pKfdkdSPIRexBnFB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4MyBTYWx0ZWRfX2BWZtxNR8W6p
 fWxKm0uR0TVWf42JMl5v/uSSh6iySxgZ2l3q62iMLKa5scIRe36ZTbeB6h+4rkxF65OpX4U3u1f
 TWkNhtYrrc0kKjJJ7Cti8sBb+OYtADPtX7hsPIg05KA9fLoXyx8NPJWPNr5awhIkztkbgcmY1Pl
 m3yZELxPgXOo7SL0q49/3mvD8iUdXFJFY+vRqF+KrMPbV/NaWcmvQprMqEH6TmROnBf/vrxEGZl
 rklftNO0wPOC7eaIAlstKlxOWCGViBFkecPNZDjx428fZBx5Dth7ny+tdsFYgl9HN9oWJDjRRnD
 xQmrkE1rC/AYGxxVBFf1nso8T/iDIOhBzSBDIg4ZB8ZHKZjKLp97hzwyiLg4LxG34jVcpZ5Fgi0
 6GMIohB+cNUfVZjs7ZXHqRDqbBFFILK4hOuThEwb0BRaXFDpot2UUg4JucFt5gpp1TEsjBdlM9K
 xk4X/rDqC1wsmWU43vw==
X-Proofpoint-ORIG-GUID: uf9z7y2iVW3uyDT1pKfdkdSPIRexBnFB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180083

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power states(on/off).

The SCMI performance protocol manages SPI frequency, with each
frequency rate represented by a performance level. The driver uses
geni_se_set_perf_opp() API to request the desired frequency rate.

As part of geni_se_set_perf_opp(), the OPP for the requested frequency
is obtained using dev_pm_opp_find_freq_floor() and the performance
level is set using dev_pm_opp_set_opp().

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v3->v4
- Added return check for dev_data.
---
 drivers/spi/spi-geni-qcom.c | 49 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 025165c4b952..88ac0833351c 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -78,6 +78,13 @@
 #define GSI_CPHA		BIT(4)
 #define GSI_CPOL		BIT(5)
 
+struct geni_spi_desc {
+	int (*resources_init)(struct geni_se *se);
+	int (*set_rate)(struct geni_se *se, unsigned long clk_freq);
+	int (*power_on)(struct geni_se *se);
+	int (*power_off)(struct geni_se *se);
+};
+
 struct spi_geni_master {
 	struct geni_se se;
 	struct device *dev;
@@ -105,6 +112,7 @@ struct spi_geni_master {
 	struct dma_chan *tx;
 	struct dma_chan *rx;
 	int cur_xfer_mode;
+	const struct geni_spi_desc *dev_data;
 };
 
 static void spi_slv_setup(struct spi_geni_master *mas)
@@ -305,11 +313,12 @@ static void spi_setup_word_len(struct spi_geni_master *mas, u16 mode,
 	writel(word_len, se->base + SE_SPI_WORD_LEN);
 }
 
-static int geni_spi_set_clock_and_bw(struct spi_geni_master *mas,
-					unsigned long clk_hz)
+static int geni_spi_set_clock_and_bw(struct geni_se *se,
+				     unsigned long clk_hz)
 {
+	struct spi_controller *spi = dev_get_drvdata(se->dev);
+	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 	u32 clk_sel, m_clk_cfg, idx, div;
-	struct geni_se *se = &mas->se;
 	int ret;
 
 	if (clk_hz == mas->cur_speed_hz)
@@ -825,7 +834,7 @@ static int setup_se_xfer(struct spi_transfer *xfer,
 	}
 
 	/* Speed and bits per word can be overridden per transfer */
-	ret = geni_spi_set_clock_and_bw(mas, xfer->speed_hz);
+	ret = mas->dev_data->set_rate(&mas->se, xfer->speed_hz);
 	if (ret)
 		return ret;
 
@@ -1075,7 +1084,11 @@ static int spi_geni_probe(struct platform_device *pdev)
 	mas->se.wrapper = dev_get_drvdata(dev->parent);
 	mas->se.base = base;
 
-	ret = geni_se_resources_init(&mas->se);
+	mas->dev_data = device_get_match_data(&pdev->dev);
+	if (!mas->dev_data)
+		return -EINVAL;
+
+	ret = mas->dev_data->resources_init(&mas->se);
 	if (ret)
 		return ret;
 
@@ -1131,7 +1144,8 @@ static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
 	struct spi_controller *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 
-	return geni_se_resources_deactivate(&mas->se);
+	return mas->dev_data->power_off ?
+	       mas->dev_data->power_off(&mas->se) : 0;
 }
 
 static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
@@ -1140,9 +1154,11 @@ static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 	int ret;
 
-	ret = geni_se_resources_activate(&mas->se);
-	if (ret)
-		return ret;
+	if (mas->dev_data->power_on) {
+		ret = mas->dev_data->power_on(&mas->se);
+		if (ret)
+			return ret;
+	}
 
 	if (mas->se.has_opp)
 		return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);
@@ -1188,8 +1204,21 @@ static const struct dev_pm_ops spi_geni_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(spi_geni_suspend, spi_geni_resume)
 };
 
+static const struct geni_spi_desc geni_spi = {
+	.resources_init = geni_se_resources_init,
+	.set_rate = geni_spi_set_clock_and_bw,
+	.power_on = geni_se_resources_activate,
+	.power_off = geni_se_resources_deactivate,
+};
+
+static const struct geni_spi_desc sa8255p_geni_spi = {
+	.resources_init = geni_se_domain_attach,
+	.set_rate = geni_se_set_perf_opp,
+};
+
 static const struct of_device_id spi_geni_dt_match[] = {
-	{ .compatible = "qcom,geni-spi" },
+	{ .compatible = "qcom,geni-spi", .data = &geni_spi },
+	{ .compatible = "qcom,sa8255p-geni-spi", .data = &sa8255p_geni_spi },
 	{}
 };
 MODULE_DEVICE_TABLE(of, spi_geni_dt_match);

-- 
2.34.1


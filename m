Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D7144C66A
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121741; cv=none; b=J+CkkEk37bD+zQwHTp20Bg++r4dFHN046GM36BcXcdCwIugkVbsMBpatFvtknwNFlWoUReJndmVFb3/cn01S80G8o3rxmkF/NGt3o0+HJzYCDBeGT31l4xluR4K7+wRneuvrgej0rFaBj+ns8QJpUSGkHXaepwWJPrIlwaxiqpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121741; c=relaxed/simple;
	bh=qs6ppqp0UOUiNfmIFg/KcxO7swqckHjrNOVvOglkL5w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BRd+h6im2/MCtruH9DcL5L2bgpKUoHGDOAJ8jot8MjdgsPBmC2UNmVfrazAcE6xdObndtP8Dr4ih5QvbyByDbfBxLA6wxrYX7dq5w1jXyb73ezO41W8UwfAWa7kA+ib/gr+hc6HSWRLnyP3Ryl8fi6iPCXiZ8nqHPvJJ1A9PzHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bLFRTs1z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iHONRA0P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bLFRTs1z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iHONRA0P"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcf5C3479130
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=42z1nSf/EWm
	6LuhbTC0i8/U8edmuxc2/Z3d6SzAsweA=; b=bLFRTs1zQH9xjqgSGE03JBCRFNH
	pw4jEVYdz7yeLbmp5LuuSX5u42fusQ153cuAV1DkIcGNRbizRlmuRXSoQIeS19vl
	DqLL/C0k2jx37gfWirJEr0HtarSqqc8s4YkCTlfy+A1rPgQFYZgC3S7HCLb/yamq
	jikR1DVaF64iO7/KmUUFPTDk7Lsn0CUMi4gvUTYwWkHpT7Htk5xlpOzsMnksmO73
	V6uMyYmzhb7DAr2uyJ/Ej/f3/5SfkYIOJRxAs9j9/Cr1OK3xCo2V/vDiUeq3gQOM
	qhAq9wJTcUbpjqDwiaZJbgKhxf1ZeBvZ0WGMRjD/krNzPnbXddsWxsKCAyQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9g3sv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 13:22:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c21c01cf3so41311771cf.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784121738; x=1784726538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42z1nSf/EWm6LuhbTC0i8/U8edmuxc2/Z3d6SzAsweA=;
        b=iHONRA0PUmrnLLNHhiZ5kp4Lm/b2+ZVO8CVVH5C32nVZUljUOTJm04uv4nPkDVZvTM
         gJ3s3XAgECZPKxEV/J6DjoY6+Q61kdWwln2MQ9zcrIylpw/bnvv20Z+0YWn6myw1IEcd
         lk/7JREyWyszSNOSvO2Fkb7npcqJ9LBKai2/PNFOjLUYpDmBbskOVXqSzxMg553XqUy/
         g5tcJiMA3ozSCF3NqEZiwXbUSEfv6gDVmQf4n8/GbFLEY3OhQOBzNE+Z8wy8KxisEay1
         HE5Q9fs+F+ZnfBeaWkRxi9pSol2CcYGeyxjonS9uYDT2eVTnglXUvq48NZPtTc+ZZvu6
         mpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121738; x=1784726538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=42z1nSf/EWm6LuhbTC0i8/U8edmuxc2/Z3d6SzAsweA=;
        b=j5Ao7LlaD8+NYw5fZcKH8oCKAO7oFGlaqyEJ1TKrD4LoAl0vGUcBJVRMMPcRAV8aYl
         mZY/wGZ0E/k5Ns1HkHtosl6jXSspf42ic2+kplBKTVOy8GQo7v3ixyNsU1w8a2u511nz
         oxJ0GtIdUC9gFJu14W9JEDVnWkyFcO0Qpoxs75zDjAega2jkgXe9Up0sPKXEo+EwMtDS
         YQ90xOyNqnQGhSHSxKOnZs+3CrO8WpJJG5y7cNpq7C/B76L04CHukv56F3m2q4Zl4S0H
         HAK5GNctmBZHs14xZapAD5ac5LorIMTCfksPXiYuVtrZYMSNATNRPECqwQU4WDUZZRCf
         Cajg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7tm4n78+Y2jAbEb1xe4xhGGBvvCrPaeO4lgkUAwso4lWBQTRDY+jEkGnfgAYVZ5vJXyirV1Ff2+To@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5wRoqtnVyjR1csLnDi40kuPJp1djW3P8fHLC3put7B9tvKGk/
	Yx3lkOMoNbD9SYaJWX5dA3rLX0aJ+Xa0+Kn6yAlF0FGa7ebKQHwoFc0de0s+cCUnF2lBeGMr//G
	kT8xT/qOAUXIXocg0RXtde4MXMxeNrnxZ/2N0euaoPMJaAjowTlsZQwm3mKkGvTpP
X-Gm-Gg: AfdE7cmd+hJ/+6LUWWcp0WbPS3wDgrWEkRgmoYgY7y7RsXHRW3dUSdpJ5gZhS2xUgVR
	vYlDjMqPXKK0YmKYfuxMy5rzsCK1D60rZjjfxGm8kZFeZMV9qTnFxQCjgMOfYxAcQivrtV5KUUp
	GVAJaVHTpeKRuIH3yHY7I8AjImQRBHGMm7KjzhpaKj/UxW/lO4i3kFB0tf3MyHuM4gWrZl7k2d1
	hChXfZKXEv3K+mtkZ/ljfjpPwhgzIaZnFQCv4WrAoBwQNUYE6ox5raeV6ckcep9ihKrR9NZHIzL
	PfBkj0Em55eqcZjtvOSwTcDT1SiTbyJS0GjPxadHDikfViGopLVO7VWgL0z6C92uabzizM9rDZY
	C4O9JbsRKQZOBQ8NqhsQz8F/GWN4OaTi2wwWZp0rB
X-Received: by 2002:ac8:5f4d:0:b0:51a:8c97:fb94 with SMTP id d75a77b69052e-51cbf2ee7a4mr187163751cf.61.1784121738165;
        Wed, 15 Jul 2026 06:22:18 -0700 (PDT)
X-Received: by 2002:ac8:5f4d:0:b0:51a:8c97:fb94 with SMTP id d75a77b69052e-51cbf2ee7a4mr187163051cf.61.1784121737458;
        Wed, 15 Jul 2026 06:22:17 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd56c4cd1sm192874866d6.16.2026.07.15.06.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:22:16 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 2/2] pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM
Date: Wed, 15 Jul 2026 18:51:50 +0530
Message-Id: <20260715132150.1322663-3-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715132150.1322663-1-ravi.hothi@oss.qualcomm.com>
References: <20260715132150.1322663-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX5+SWc+/jbz0k
 VnalsYWraOv15281e2viEWWnLSwYv4MqvjyLOi8EQ7Xoj2iyqnUN9B0z6mC05GZ5DFnLkdVXFlD
 53dp8qFOnnuALVupyYaUgpPUkraNAWo=
X-Proofpoint-ORIG-GUID: enNxF640lG755xpK-d9Fj7k8OjGCu1Hj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfXwCC2cAa1ZLic
 DhGvPBCidFi4tXy5joo+RpPx9GQAI/08QfoSZqU5JPoyOiMFH5bQuj0MhQNBiLbPPkKlR7UuWwC
 2lQbkx4W0ZXkvjD4teec7k5291zIBrfisAbknGtNHulSyfKquDrXtLsZm6u6jGpwCdvgNxrZYmu
 g11P+sq4tLmL/niO9T8q+0eHNoZGXw/JveT5/I6soc4A4FsNCcAo4ZkBVvo0q70XFS4DbuxWXZK
 Cu/J/3xQXkYmlL/BZqgvSUZacjKE+JL/Ld6e2a6IAD1tfb5lqAan21yGZgv2noyqO9EgAyrTE0c
 NZaYrQ4+S1jNo4bPy7aQyzHcVxisSc0h8ibE7/T7KubpH6r85yIVXRQ07vmS6PSEt56jFb5Ej/7
 CSCbDJYoKNX0yhN1ixe5b+dzkSpwC/3IEe302hguX+tDufwgAzOe8X+940S3l5OfFY8cxh/c2yn
 00Jy31N9W6u2IUC7Ytw==
X-Proofpoint-GUID: enNxF640lG755xpK-d9Fj7k8OjGCu1Hj
X-Authority-Analysis: v=2.4 cv=VoATxe2n c=1 sm=1 tr=0 ts=6a57898a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=a4EVYJI0Z6-OStE7xvQA:9 a=O8hF6Hzn-FEA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150132

Eliza SoC has the same LPASS LPI pin mux functions as Milos but the
slew rate control is in the same GPIO config register rather than a
separate register. Add a new variant data struct with updated slew
offsets and LPI_FLAG_SLEW_RATE_SAME_REG flag, reusing the existing
pin descriptors and function table from Milos.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
index 72b8ffd97860..cb4934cd6f75 100644
--- a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
@@ -148,6 +148,33 @@ static const struct lpi_pingroup milos_groups[] = {
 	LPI_PINGROUP(22, LPI_NO_SLEW, i2s3_data, dmic4_data, ext_mclk1_e, _),
 };
 
+static const struct lpi_pingroup eliza_groups[] = {
+	LPI_PINGROUP(0, 11, swr_tx_clk, i2s0_clk, _, _),
+	LPI_PINGROUP(1, 11, swr_tx_data, i2s0_ws, _, _),
+	LPI_PINGROUP(2, 11, swr_tx_data, i2s0_data, _, _),
+	LPI_PINGROUP(3, 11, swr_rx_clk, i2s0_data, _, _),
+	LPI_PINGROUP(4, 11, swr_rx_data, i2s0_data, _, _),
+	LPI_PINGROUP(5, 11, swr_rx_data, ext_mclk1_c, i2s0_data, _),
+	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _, _),
+	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
+	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
+	LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, ext_mclk1_b, _),
+	LPI_PINGROUP(10, 11, wsa_swr_clk, i2s2_clk, _, _),
+	LPI_PINGROUP(11, 11, wsa_swr_data, i2s2_ws, _, _),
+	LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s2_data, _, _),
+	LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s2_data, ext_mclk1_a, _),
+	LPI_PINGROUP(14, 11, swr_tx_data, ext_mclk1_d, _, _),
+	/* gpio15 - gpio18 do not really exist */
+	LPI_PINGROUP(15, 11, _, _, _, _),
+	LPI_PINGROUP(16, 11, _, _, _, _),
+	LPI_PINGROUP(17, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(18, LPI_NO_SLEW, _, _, _, _),
+	LPI_PINGROUP(19, LPI_NO_SLEW, i2s3_clk, slimbus_clk, qca_swr_clk, _),
+	LPI_PINGROUP(20, LPI_NO_SLEW, i2s3_ws, slimbus_data, qca_swr_data, _),
+	LPI_PINGROUP(21, LPI_NO_SLEW, i2s3_data, dmic4_clk, _, _),
+	LPI_PINGROUP(22, LPI_NO_SLEW, i2s3_data, dmic4_data, ext_mclk1_e, _),
+};
+
 static const struct lpi_function milos_functions[] = {
 	LPI_FUNCTION(gpio),
 	LPI_FUNCTION(dmic1_clk),
@@ -196,8 +223,21 @@ static const struct lpi_pinctrl_variant_data milos_lpi_data = {
 	.nfunctions = ARRAY_SIZE(milos_functions),
 };
 
+static const struct lpi_pinctrl_variant_data eliza_lpi_data = {
+	.pins = milos_lpi_pins,
+	.npins = ARRAY_SIZE(milos_lpi_pins),
+	.groups = eliza_groups,
+	.ngroups = ARRAY_SIZE(eliza_groups),
+	.functions = milos_functions,
+	.nfunctions = ARRAY_SIZE(milos_functions),
+	.flags = LPI_FLAG_SLEW_RATE_SAME_REG,
+};
+
 static const struct of_device_id lpi_pinctrl_of_match[] = {
 	{
+		.compatible = "qcom,eliza-lpass-lpi-pinctrl",
+		.data = &eliza_lpi_data,
+	}, {
 		.compatible = "qcom,milos-lpass-lpi-pinctrl",
 		.data = &milos_lpi_data,
 	},
-- 
2.34.1

